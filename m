Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA538259D94
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 19:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF316E406;
	Tue,  1 Sep 2020 17:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544DB6E406
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 17:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598982492;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGNRpPWqH+97UPJQstv4XnEsZCSb/7CGwSY8dC7Jq+o=;
 b=G8EAwK/awZNU8BXCiBvphHvO0L0n+1hNmRsIRbajQ6JlzIiVJFd9mfCRz4RJF8DGkHnfaP
 hEo7Yn2vAa1r25/s5MEQfqmqv5/jqnAuJ7ceFXVFbzkdCvfHxMO9eTB3KIFZY7eLnVypHO
 c2petA6C1BpAEpZFHm49oa7hl3rvJMg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-MPtqfA0XOou2U4CieZUknQ-1; Tue, 01 Sep 2020 13:48:11 -0400
X-MC-Unique: MPtqfA0XOou2U4CieZUknQ-1
Received: by mail-qv1-f69.google.com with SMTP id k17so1546533qvj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 10:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=vGNRpPWqH+97UPJQstv4XnEsZCSb/7CGwSY8dC7Jq+o=;
 b=njzoPicgJVojWRUg0BChYGnbjMJadmWdIcF/xxbHfDZ4+DYWAUAGHN8dB2O5IHBfxc
 eI+jye+eRCV9g5Kxt9DXHRsdyIi1faj0y+6q902eoaIXc11weX6vet1wcO06XfHUNqWj
 GAq+vmBvAUshUkpP2QcS7ip6NObJXUQvV5qppLmSaYbgF3tWyDZ8MGTWNkQzYDRM1l4I
 PmJ1d+vWk4p1d5mKNGk63Be6d/NQjFELhnVEjusz8KN2t3gyFQv52TRasFhLCNsC0ZXm
 PhfIP5/lnFOwuayQFigtyCMA7dvxkf4uePWHvk4tyM1rjMYZhF+Zn3DoSOrDNa4RzYMd
 hWEw==
X-Gm-Message-State: AOAM530qJk9rqI3mZN1xijNyHba6q7dBjGRP7nOy1NQflu9OcXte7lfe
 TApn9T5Vg4pev8IINeUOzPrhFswknMxbjKpHLuAWct/MR/2gyscnePWgF4BEDZvd8JXaQF4JqOX
 Le4rUwVRe7Plyb2eu0hYhZ+6+4J7B
X-Received: by 2002:a37:9402:: with SMTP id w2mr3171653qkd.329.1598982490656; 
 Tue, 01 Sep 2020 10:48:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV/D4/yGDUFR3FQPsu5d08hUanmHWuDmqWQ2Dgw6q6gG09h+MCOK79eURTqNNfYHItmCfD3w==
X-Received: by 2002:a37:9402:: with SMTP id w2mr3171564qkd.329.1598982489462; 
 Tue, 01 Sep 2020 10:48:09 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id i2sm2440792qkd.111.2020.09.01.10.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 10:48:08 -0700 (PDT)
Message-ID: <c4b9aa428ccfa90cb29845f622eba8923eeb2e38.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: start using more of the extended receiver caps
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 01 Sep 2020 13:48:08 -0400
In-Reply-To: <20200901123226.4177-1-jani.nikula@intel.com>
References: <20200901123226.4177-1-jani.nikula@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-09-01 at 15:32 +0300, Jani Nikula wrote:
> In the future, we'll be needing more of the extended receiver capability
> field starting at DPCD address 0x2200. (Specifically, we'll need main
> link channel coding cap for DP 2.0.) Start using it now to not miss out
> later on.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> I guess this can be merged after the topic branch to drm-misc-next or
> so, but I'd prefer to have this fairly early on to catch any potential
> issues.
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 1e7c638873c8..3a3c238452df 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -436,7 +436,7 @@ static u8 drm_dp_downstream_port_count(const u8
> dpcd[DP_RECEIVER_CAP_SIZE])
>  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>  					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> -	u8 dpcd_ext[6];
> +	u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];

Not 100% sure this is right? It's not clear at first glance of the 2.0 spec, but
my assumption would be that on < DP2.0 devices that everything but those first 6
bytes are zeroed out in the extended DPRX field. Since we memcpy() dpcd_ext
using sizeof(dpcd_ext), we'd potentially end up zeroing out all of the DPCD caps
that comes after those 6 bytes.

>  	int ret;
>  
>  	/*
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
