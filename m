Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF16547D9B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 04:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0D510E0E5;
	Mon, 13 Jun 2022 02:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE49810E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 02:26:28 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 129so4374671pgc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 19:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mG3FMQMhEgGtwuCF752yIY6rjP37EMug4420nWGqk5M=;
 b=L91cB+LhIveLvM5QtRU43yYFS75yXthLZA5yo3LtT0Y6U6CgcfYeLTcVaiPkQZrA9o
 tEGkNHqAOFrZjuz8bGPoBrng6mch9Wa8egEwyj/eeUTVQtR3rAU54b7T+QYJkCyDf9EY
 aUP5dTKmx37x8gFjrW0bsgKNKeQFlRfRcf1tA0mo0AM8HuvpSp+rtVdC+Famv3ffuUGv
 cncqZaLMIoAObuRI5UVZFbpcKWyrm3N6+9CTiO+lyWksmGCNlzb6lfQP29Y/qbm1HmAI
 WY4qnp0fldubUbQpBQ38mDyS5fN63UodrmyUzZfAMtRRXZSlQ0O1l0jvFy6C/tK0Sjc/
 9w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mG3FMQMhEgGtwuCF752yIY6rjP37EMug4420nWGqk5M=;
 b=YQuq+AbI4NJuaOtG2QEXTmsDl9ht2+q9jBoN9TrAUwR2xY2Jsv0+7orC+j1a5YanyA
 HtT1bHnnQGTPFnOICP0dHIlsodrEeo1c4xbpyNBRtlJK8HH7XzBSLQXJvdxC5Uwgvm7A
 Wziym9KSbrDwi9TnuAvtJPDDbzM/AIaYsmjkHXWrOFf6aiIFvjCYzeocxHPQ7Vwu29kE
 qr0FPK6WfrnK31PSYzNOpnzk7EJflA7E8jUZGJgFizFSdTRnWUqKh8sT3hQRgqbU7VR3
 wKTDBv9R2xvyvRM/UlQU6q511E5kJa6avAfb1agpIRDpZ2hgafTt7ixMj5eyqYRE/dII
 ugLg==
X-Gm-Message-State: AOAM530niX+YfTk5h2O3HhuX+8CvfZHFjPBISiMtARXRCZ0fnOLbPHVZ
 Y5D+9Id/huNj+z296P4F2FMJMQ==
X-Google-Smtp-Source: ABdhPJwAwpZ90n8Bz+gXAsE62G+h2GY77K5IMoZH8I+CA35xy1Qoe35wL0UZyZiRMutccB7a1yRxlA==
X-Received: by 2002:a63:6aca:0:b0:408:8af6:a885 with SMTP id
 f193-20020a636aca000000b004088af6a885mr646836pgc.477.1655087188171; 
 Sun, 12 Jun 2022 19:26:28 -0700 (PDT)
Received: from [10.16.129.248] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902680a00b001635c9e7f77sm3724220plk.57.2022.06.12.19.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jun 2022 19:26:27 -0700 (PDT)
Message-ID: <d1530ba8-c45b-8cac-86f3-76fa5375e4b7@igel.co.jp>
Date: Mon, 13 Jun 2022 11:26:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm: rcar-du: Lift z-pos restriction on primary plane for
 Gen3
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220609235529.22254-1-laurent.pinchart+renesas@ideasonboard.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <20220609235529.22254-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-renesas-soc@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Laurent-san

I tested this patch by kms-tests scripts and modetest on R-Car Gen3.

On 2022/06/10 8:55, Laurent Pinchart wrote:
> There's no reason to require the primary plane to always be at the
> bottom of the stack, as the VSP supports arbitrary ordering of planes,
> and the KMS API doesn't have such a requirement either. Lift the
> restriction.
> 
> As the primary plane can now be positioned arbitrarily, enable control
> of its alpha channel as well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Tested-by: Tomohito Esaki <etom@igel.co.jp>

> ---
>   drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 6b535abd799a..356861de17b0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -431,14 +431,9 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>   		drm_plane_helper_add(&plane->plane,
>   				     &rcar_du_vsp_plane_helper_funcs);
>   
> -		if (type == DRM_PLANE_TYPE_PRIMARY) {
> -			drm_plane_create_zpos_immutable_property(&plane->plane,
> -								 0);
> -		} else {
> -			drm_plane_create_alpha_property(&plane->plane);
> -			drm_plane_create_zpos_property(&plane->plane, 1, 1,
> -						       num_planes - 1);
> -		}
> +		drm_plane_create_alpha_property(&plane->plane);
> +		drm_plane_create_zpos_property(&plane->plane, i, 0,
> +					       num_planes - 1);
>   
>   		vsp->num_planes++;
>   	}
> 
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56

--
Best regards,
Tomohito Esaki
