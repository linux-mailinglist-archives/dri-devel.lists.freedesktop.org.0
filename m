Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E01405AA2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCC16E8B5;
	Thu,  9 Sep 2021 16:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F9F6E8AF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631204290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFYwJKNou+RmjsI/G6x/CnVjB7CdXNyU2huXcy7mF1g=;
 b=hZWmemXUxqpD3fCEXgUIvXoyYCsbwJjm9aXcoXqVwsbZlXW/SwHxDoNKf4TRb20zfCwHW5
 1uPp1cKSffjckZpS/DgDNctBvwiRm/MRiGJ6N9I3Gb10SnGmtRui/VsNa8+dGYHHvy+xcw
 oosbhfs6+NdWrsZlN/PUtZOeJHWq5bA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-SqkP-e61NCGdHOTEl761Sw-1; Thu, 09 Sep 2021 12:18:07 -0400
X-MC-Unique: SqkP-e61NCGdHOTEl761Sw-1
Received: by mail-qv1-f71.google.com with SMTP id
 r18-20020a056214069200b0037a291a6081so7627329qvz.18
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 09:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DFYwJKNou+RmjsI/G6x/CnVjB7CdXNyU2huXcy7mF1g=;
 b=HdeOsAyljdEOG4mxfQsbfaz9LnEu2OGRur0HHjsfjYLeqgdqrp2XtYfKfaX01bf8rg
 HBzDGFSgnO6sFIzmeLwO5IIkhpUchxdtdZ0CVMOUdGi1tcmDiUCLwiinKCNQ3K/Ly3Wn
 YV3bIxh0+WlTKfwK3Q7qNQQvdtxgh0TlUfBrnmrXhHrlMlLcg8TDp1tyrkDgWH81z+yV
 LGZkZFOyplQPhEVccKl2P+02n4i6exXnajZKieDX+amYJ7u/BsoabVHqYDM8z4fFzr3V
 I0z4fuOiigWhY2KEfyicZ404uMOh4P6VraOX+2Arc1SyjZp0vLIwRtW5djuO5m8VNCyR
 QNIg==
X-Gm-Message-State: AOAM533h8rBvu350810yS8fqQ1FI+3nQdG0el7k90/f3ir5owPcCG3PJ
 D/+Mq65fRm5PPEdz9yN6g6kK6cIWhsbd1QneSFUTQCIHvj6dUYe3h/ZAoRPcc2pOWflxpFfnsB6
 LQdEQlVXj0cOMftCUI6op5rO0tI6c
X-Received: by 2002:a05:620a:24c1:: with SMTP id
 m1mr3611769qkn.309.1631204286579; 
 Thu, 09 Sep 2021 09:18:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwazGn7UBmgC1TBQ165kEqC4DoOcnYeiKcKpObQmVijagBpm/wDcSQc/gk5CEYx6NniMCZykQ==
X-Received: by 2002:a05:620a:24c1:: with SMTP id
 m1mr3611752qkn.309.1631204286413; 
 Thu, 09 Sep 2021 09:18:06 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id o23sm1619422qkk.40.2021.09.09.09.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 09:18:06 -0700 (PDT)
Message-ID: <282213f032b3dfe10cf7c461083c26b474f09f0f.camel@redhat.com>
Subject: Re: [PATCH v3 02/13] drm/dp: use more of the extended receiver cap
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com, 
 manasi.d.navare@intel.com
Date: Thu, 09 Sep 2021 12:18:05 -0400
In-Reply-To: <649051cb896821147feee91aab1f2abc523c1353.1631191763.git.jani.nikula@intel.com>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <649051cb896821147feee91aab1f2abc523c1353.1631191763.git.jani.nikula@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I thought I remembered an issue with this but looked up the previous emails,
and it looks like that this change actually should be safe!

Signed-off-by: Lyude Paul <lyude@redhat.com>

On Thu, 2021-09-09 at 15:51 +0300, Jani Nikula wrote:
> Extend the use of extended receiver cap at 0x2200 to cover
> MAIN_LINK_CHANNEL_CODING_CAP in 0x2206, in case an implementation hides
> the DP 2.0 128b/132b channel encoding cap.
> 
> v2: Extend to DP_RECEIVER_CAP_SIZE (Ville)
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c
> b/drivers/gpu/drm/drm_dp_helper.c
> index 9b2a2961fca8..2e74b02ed96b 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -608,7 +608,7 @@ static u8 drm_dp_downstream_port_count(const u8
> dpcd[DP_RECEIVER_CAP_SIZE])
>  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>                                           u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> -       u8 dpcd_ext[6];
> +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
>         int ret;
>  
>         /*

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

