Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E467560FB92
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EE010E670;
	Thu, 27 Oct 2022 15:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67BD10E670
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666883590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URJsCzEovWl5V/7xzDhhXDlO8EKnrY5wR0uGAAS72X8=;
 b=W5PaJdp5KwfwZcipl2G6UrIskY4aT38XiAj0AjUzs2I66tc+tI7S6Cd9oyyTPiHY4xemMS
 fg7CvDtl1q83d6bIjyG1QdwMJt0iJDvIhi6rDpV/M8U3M//eFIvrqNdVXtGtcpG6Upmk5j
 WX81wwp1S9vfEL5eqp+RnMGJjMTLomk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-TUWUuqpZPySwT3txr_q9Ew-1; Thu, 27 Oct 2022 11:13:08 -0400
X-MC-Unique: TUWUuqpZPySwT3txr_q9Ew-1
Received: by mail-wr1-f69.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so493831wrg.16
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=URJsCzEovWl5V/7xzDhhXDlO8EKnrY5wR0uGAAS72X8=;
 b=QMukP/zk1N9yBISdPsuOi4D0jcToOmv59JAqtjuPMUVbIlsoPEuQkPKP0gyPKeAx4e
 449OHfpICjNAIgM43DZaZaas6DCpn6eU2hKamvn91m8yj6ef1NSvYR9ynrHTVHK3SzqZ
 p7+L2bk4cqS7ijcetkjVznvQLz9ya+auWjU8NVYrl/Oqd91yv4YTIa+uDDht5ZA3FBk4
 C7e5HC6B6t6rPhTBc12cB/mTiSnKd21zHs3+IQ/CrR6+OkQ94q8askKe90OeyzsQypby
 7o/eSsaleCYDIcPvL8aKF9OTIJWgvufUVbhb5eKKIh1e58qNqtldaOBeAvkrtOxl9nKo
 OBbA==
X-Gm-Message-State: ACrzQf3nEqIoGlknPAR6UOkWccN27jRmLheBaFYUN10/weICnYxb9/3m
 X/ls0rqPuWit6dzfd7qj6kWep8hQJqGTQuymWMUFP52r2BxmX61AbHqOZnmfZY0sC/4nC4q6mhv
 rbgM8R5BIReTHoivBlsRjUZEIzutA
X-Received: by 2002:adf:fac5:0:b0:235:af88:d8db with SMTP id
 a5-20020adffac5000000b00235af88d8dbmr26278624wrs.700.1666883586606; 
 Thu, 27 Oct 2022 08:13:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Y2PSZ9Y95Q+71HYzJp1Wu+nwYx+HTe2YFRKV9/zHdALdGUYqNocQx8QH3MkabMHy3vkAlTw==
X-Received: by 2002:adf:fac5:0:b0:235:af88:d8db with SMTP id
 a5-20020adffac5000000b00235af88d8dbmr26278605wrs.700.1666883586343; 
 Thu, 27 Oct 2022 08:13:06 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p38-20020a05600c1da600b003b497138093sm1986681wms.47.2022.10.27.08.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 08:13:05 -0700 (PDT)
Message-ID: <bf04d1da-f9cb-9aa8-4c99-cef00177a41a@redhat.com>
Date: Thu, 27 Oct 2022 17:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Take our lock to reset the link
To: maxime@cerno.tech, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221024093634.118190-1-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024093634.118190-1-maxime@cerno.tech>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

On 10/24/22 11:36, maxime@cerno.tech wrote:
> We access some fields protected by our internal mutex in
> vc4_hdmi_reset_link() (saved_adjusted_mode, output_bpc, output_format)
> and are calling functions that need to have that lock taken
> (vc4_hdmi_supports_scrambling()).
> 
> However, the current code doesn't lock that mutex. Let's make sure it
> does.
> 
> Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Just a trivial nit below:

>  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 596e311d6e58..9e549fa07467 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -349,27 +349,40 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
>  	if (!crtc_state->active)
>  		return 0;
>  
> -	if (!vc4_hdmi_supports_scrambling(encoder))
> +	mutex_lock(&vc4_hdmi->mutex);
> +
> +	if (!vc4_hdmi_supports_scrambling(encoder)) {
> +		mutex_unlock(&vc4_hdmi->mutex);
>  		return 0;
> +	}
>  
>  	scrambling_needed = vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
>  							   vc4_hdmi->output_bpc,
>  							   vc4_hdmi->output_format);
> -	if (!scrambling_needed)
> +	if (!scrambling_needed) {
> +		mutex_unlock(&vc4_hdmi->mutex);
>  		return 0;
> +	}
>  
>  	if (conn_state->commit &&
> -	    !try_wait_for_completion(&conn_state->commit->hw_done))
> +	    !try_wait_for_completion(&conn_state->commit->hw_done)) {
> +		mutex_unlock(&vc4_hdmi->mutex);
>  		return 0;
> +	}

I think the convention is to have a ret_unlock label followed by the
mutex_unlock() and ret 0, to avoid duplicating this. You could have
that label after the return reset_pipe(crtc, ctx).

But it's OK if you prefer to land this version too.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

