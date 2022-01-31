Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9974A52D0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4988110E42D;
	Mon, 31 Jan 2022 23:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D4D10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 23:02:00 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 p4-20020a4a8e84000000b002e598a51d60so3627791ook.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=07IOc+4sCg1ox/edloQ1DbuVRJUKfQj2aCnLFjL6iTQ=;
 b=Bn4rW4n25XPNIJwkb8Lp3Y4CT3gpNhv1eeQJ4rYPyhwpCfkWPCbBXgTMVdpQQACd9t
 UtCxurE7RDaXdvezgp5HMXscwwHkIzqm8twxCDC7mzydP3LHwH/zqasn8tjOz4zGFSXD
 j9wJDatUBoCjkoIDxDMo3THoCecavFdfsnukm0buW9Mv3U0+PlqlqX2n3uem93mU/eLg
 hxoohDXZ6P2Sv/pWagelPRuq2bGIGGzzhkLZtgcdlB4ydM3Z8eKGnPY5R9B7ZdXJz9SB
 gh46OmYNt+YVZURMlSndeCdHc9qiGqKWgvNBQtrhkURfzwdoSfQhpHQrzfbG5qyIyj/l
 fNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=07IOc+4sCg1ox/edloQ1DbuVRJUKfQj2aCnLFjL6iTQ=;
 b=PGLqp7xcfFatI1UEbEz3h3s7If8xaiF0OFjTXxeka+CrkCXuWvEQek4XkqADeRdMaK
 OMDI3uuliHalq4NOdAgnjUfBNnl6R9spPb6eCy0U/AIhC7lHLYDMG/7JIakwZ/HaizyU
 bzGLd1nrIy++wK0es13aiUc/ItMk53LsSK6dwmLVbgNU77m6fujBNj500SMseLpbuCv4
 HHK0nTwMTJWvdVcz9UxYaG2f7O4RnsH8bMXJspf5hPGDlQG3nL2Hs3GHfubu6q9/4492
 4TSyL9FnAmDsiB1P3Xd01MZGZQWD7BE3dzVVl1Mg8lwK2XoIQ1zuI/Lo7XO+BjE34H0P
 013A==
X-Gm-Message-State: AOAM531RzDetTeRfYxSPryRX+LAc1sTVKArh3r0qujE4v94jn1o4N1sW
 UvgziFdzOhEbNC7Tw+fE4OxKBg==
X-Google-Smtp-Source: ABdhPJx/GYKJ4sp8QsQTJCGodwe9naihFp+6pOwgegfbICsiojZpoJdJyBjOVoo3GHiFJgM+vQVu9w==
X-Received: by 2002:a05:6830:19ed:: with SMTP id
 t13mr12872041ott.83.1643670119656; 
 Mon, 31 Jan 2022 15:01:59 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id n9sm5546723otf.9.2022.01.31.15.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 15:01:59 -0800 (PST)
Date: Mon, 31 Jan 2022 17:01:57 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v2 4/4] drm/msm/adreno: Update the name of 7c3 gpu
Message-ID: <YfhqZZ4QLuCffQPC@builder.lan>
References: <20220119205012.v2.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220119205012.v2.4.Idbc978090270c7b838387acc74d8a06a186a3cf4@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119205012.v2.4.Idbc978090270c7b838387acc74d8a06a186a3cf4@changeid>
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 19 Jan 09:21 CST 2022, Akhil P Oommen wrote:

> Update the name in the gpulist for 7c3 gpu as per the latest
> recommendation.
> 

I was skeptical when this was introduced and you proved my point. Give
it a name based on the Adreno revision or possibly the part number and
leave it at that.

Regards,
Bjorn

> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 946f505..bd4d6a1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -330,7 +330,7 @@ static const struct adreno_info gpulist[] = {
>  		.hwcg = a660_hwcg,
>  	}, {
>  		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
> -		.name = "Adreno 7c Gen 3",
> +		.name = "Adreno 7c+ Gen 3",
>  		.fw = {
>  			[ADRENO_FW_SQE] = "a660_sqe.fw",
>  			[ADRENO_FW_GMU] = "a660_gmu.bin",
> -- 
> 2.7.4
> 
