Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263228D44F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 21:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BC06E92C;
	Tue, 13 Oct 2020 19:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A80F6E92C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602616822;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+T19di/I9uzvQiC5jnq09YBsE6/ITwy4uMdjnqLO7DE=;
 b=DhWwYGh9Y880PqQnYfmzaDS/5x6FSmBLRnaYR8rKuYqfHDskJ8CQHhbMSUZYsZBQ2Wvmvu
 iQiE6a6hcP83QRF4O3lK7OWcYQeAiXHOEOe0m7DSqyixGAqq8NgGNAJ0TNFg/BlklIV3z+
 71E2+R3Xa/kSesd5N0/xTm4Suu992Uw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-VlE3HJTMM0aWU9HkX8zJDA-1; Tue, 13 Oct 2020 15:20:20 -0400
X-MC-Unique: VlE3HJTMM0aWU9HkX8zJDA-1
Received: by mail-il1-f200.google.com with SMTP id d16so625691ila.23
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 12:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=+T19di/I9uzvQiC5jnq09YBsE6/ITwy4uMdjnqLO7DE=;
 b=L24/LJb8ogQLHXwX5eWL7YBwiu6rsFwmDHp2IIXGrLH5tpRuBvz3RBpdP49xBKqw4Q
 VZI4m6G6FHq1IWMdP1Uc4ZrgzloiX+Ws9FRsVjeTgqYZl3iNtMxSfuk465EzyACr+uyS
 TSHfZlxUnWbzkoofS/b85VFvQbeu1l2YnfhYKRLPqdKVyCknu3rHM+yPf5pcFOeYB5S4
 CQK1RAHl51jVFoXJpRPib4h52HUgnVQY734Jta/xWZHOK+Gn7WX9H+D10UJA52Pp19np
 BS1bFMSMHR5h/6lPvx+gM1JGx5LfZ28nrAR3fSQaIyCztvu0nfvmEIKwRbWNs1R4M/EG
 MaQQ==
X-Gm-Message-State: AOAM531N/LxDdAJ322XOF/sTa4EIlYEjHoAAPskOWOG5S6XHxrhRVXEk
 JGDOgkdibxC5etGD9Rbpw/4nfMSc+8C+Pbvi2eCqn1hAMUftsnXXhMxoLT1QeXLHglWY/K8UQdD
 NH8QO84rk8Hf2S3kxie7zYIwzfFJS
X-Received: by 2002:a02:7b1d:: with SMTP id q29mr326884jac.118.1602616820088; 
 Tue, 13 Oct 2020 12:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDqsRr5yoTlmjvRFYbjz/wMBkjy0QB3gawvWZcFb092FZr6amsv0o0aDw/QxH8erz1TOqYWA==
X-Received: by 2002:a02:7b1d:: with SMTP id q29mr326875jac.118.1602616819867; 
 Tue, 13 Oct 2020 12:20:19 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p65sm764536ill.23.2020.10.13.12.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 12:20:19 -0700 (PDT)
Message-ID: <7ac5989093cc0dfed7429dc99a0983d8a3a25068.camel@redhat.com>
Subject: Re: [PATCH v2 11/24] drm/dp: fix kernel-doc warnings at
 drm_dp_helper.c
From: Lyude Paul <lyude@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Date: Tue, 13 Oct 2020 15:20:17 -0400
In-Reply-To: <c7b13b7f9dae481fe552e3b8382841469bb993f0.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <c7b13b7f9dae481fe552e3b8382841469bb993f0.1602590106.git.mchehab+huawei@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2020-10-13 at 14:14 +0200, Mauro Carvalho Chehab wrote:
> As warned by kernel-doc:
> 
> 	./drivers/gpu/drm/drm_dp_helper.c:385: warning: Function parameter or
> member 'type' not described in 'drm_dp_downstream_is_type'
> 	./drivers/gpu/drm/drm_dp_helper.c:886: warning: Function parameter or
> member 'dev' not described in 'drm_dp_downstream_mode'
> 
> Some function parameters weren't documented.
> 
> Fixes: 38784f6f8805 ("drm/dp: Add helpers to identify downstream facing port
> types")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index b1c71af88579..deeed73f4ed6 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -374,6 +374,10 @@ static bool is_edid_digital_input_dp(const struct edid
> *edid)
>   * drm_dp_downstream_is_type() - is the downstream facing port of certain
> type?
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
> + * @type: port type to be checked. Can be:
> + * 	  %DP_DS_PORT_TYPE_DP, %DP_DS_PORT_TYPE_VGA, %DP_DS_PORT_TYPE_DVI,
> + * 	  %DP_DS_PORT_TYPE_HDMI, %DP_DS_PORT_TYPE_NON_EDID,
> + *	  %DP_DS_PORT_TYPE_DP_DUALMODE or %DP_DS_PORT_TYPE_WIRELESS.
>   *
>   * Caveat: Only works with DPCD 1.1+ port caps.
>   *
> @@ -870,6 +874,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
>  
>  /**
>   * drm_dp_downstream_mode() - return a mode for downstream facing port
> + * @dev: DRM device
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
>   *
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
