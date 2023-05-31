Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C3717B81
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218A310E496;
	Wed, 31 May 2023 09:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA8C10E496
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:14:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30b023b0068so586544f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685524453; x=1688116453;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NLJSQ1/RFfk2nA5Qp2YpG566YurcnN/3c3qP6vvBRbo=;
 b=nbs+05d1hVTI8lHzc2RwAM60JSwphW6BEfKO6cbVbKjbsZ/mdzHnIaI7FcUChNWiB9
 VttTUJ83EnFkQ15yA9tLp2Db7br4vR+wDCY/nxVzVuILJgNfiA1KVS6ndNzPWrxU13Mi
 09Nja0bA/XgC55g8QjkbeWkHOIzeqMLT/kREO0D8Kt60IjMaxDvwyqb9PW/TXpPkzH5b
 FeKZDbGfQ3UhzR1Kt74mKaxrsCRYzEjZkQzZWaRaYEKk8Vqx7HPrWUnvz13J06wFKNqB
 BXREDV1N0ZZoH7VBSg3upVNGr67j2ICp73lZHoN4SlKVpycOjo5nSKpuYEuR1XctFZfh
 mzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524453; x=1688116453;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NLJSQ1/RFfk2nA5Qp2YpG566YurcnN/3c3qP6vvBRbo=;
 b=Mog9GhYpd/iJcBmiAGSDtaEMf0DqkmoJ+rjgF3EtiE5IYNIo4O4E3oB7BZLlwHqvTa
 gBMVNyKSdht1CRpc7n9JbwCJm6ijmiFh2FBo6lGWqbn5Farp+kAOTZe1YuGEHO6vm7RQ
 HQYZtRrarOqqBsFrvK6kGYLJS5R1fq9OTb9R2Zfvv7q1m5EutLm39ykxmToWtAEQOiOd
 A1xyzQ01smGD5CiutOXTZQRH6sShkcEWU3ckR6IidOO8F9cFHya+bGYQWUVFgLWhADXx
 8hNkUOebMT9p9wQ0/m5U1moN7mfffEklthEdCdjhgtpi+WfmPylefOaKdO5u+j4c1+4p
 jFvg==
X-Gm-Message-State: AC+VfDzPfHxxsfSBaLB3PTjqytSTTLJCC/yF0sk6HhZX9hxIAGYsAkr0
 Z5uQWIDN8W+uZbFP/SedUhSQWRLaltKhRlKY/A+A5A==
X-Google-Smtp-Source: ACHHUZ6zPhMWYhZW9vMNwJvq0a0md/sHRA9vm6/KYNrhMbzq5CaMWtG3r3unaEyxdUxxhRQzC4wybg==
X-Received: by 2002:a05:6000:901:b0:306:2713:f7f with SMTP id
 cw1-20020a056000090100b0030627130f7fmr11884797wrb.11.1685524453269; 
 Wed, 31 May 2023 02:14:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779?
 ([2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a056000019100b00306415ac69asm5971008wrx.15.2023.05.31.02.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 02:14:12 -0700 (PDT)
Message-ID: <81d448cf-c896-61d6-f984-e6347bbc3d9f@linaro.org>
Date: Wed, 31 May 2023 11:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Fix Powertip PH800480T013 bpc specifier
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20230530193329.653526-1-marex@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <20230530193329.653526-1-marex@denx.de>
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
Reply-To: neil.armstrong@linaro.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 21:33, Marek Vasut wrote:
> This panel is 8 bits per channel DPI panel, add the missing .bpc
> specifier otherwise the kernel is complaining about it as follows:
> "
> panel-simple panel: Expected bpc in {6,8} but got: 0
> "
> 
> Fixes: d69de69f2be1 ("drm/panel: simple: Add Powertip PH800480T013 panel")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 108ebe95590bc..02e3ddf58af07 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3327,6 +3327,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
>   static const struct panel_desc powertip_ph800480t013_idf02  = {
>   	.modes = &powertip_ph800480t013_idf02_mode,
>   	.num_modes = 1,
> +	.bpc = 8,
>   	.size = {
>   		.width = 152,
>   		.height = 91,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
