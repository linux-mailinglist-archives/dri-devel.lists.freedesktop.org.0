Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18818B0F29B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 14:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569C10E7BB;
	Wed, 23 Jul 2025 12:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="BeHwH6Lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F078110E7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:54:06 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo10309042a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1753275245; x=1753880045; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5lpP9/8KkNOqIjJehurSf+iqWvP7v1rvCy4fSy8ktk=;
 b=BeHwH6Lm3airzJy+ft0hr8krEH5UV3N4VAUFhFrY7cbC+aRcv9aE0Il3/b4cM3x4KQ
 IarWI4dzA9Bx48l3no3Z9/TWVxi0uhYt5CyMjssUdgqxCdHIBaduAStmJJkw0Q9gJCpW
 qaXW6/Ko1G2twe/p1qDfZ+7DuTwsvo+qOZd7IKkz3d124OjgiCkY7E/mQDVFR86QpXub
 0Ef7utVt39lm1if5CbyRYtqZ5loTAZqJ3m1ppnaG/HTL6wJ4ZWUaKXx5PwunTaa9kPDb
 P6eC+lh7IRgUWEvTboxca16MuZnkCFquQojH3bnunAIx/XaQibyQtnMTtlgvfGyVCnWk
 oO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753275245; x=1753880045;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=E5lpP9/8KkNOqIjJehurSf+iqWvP7v1rvCy4fSy8ktk=;
 b=TiKVpczfWGFYASaAipQFpqusrzAGHQU3O241K/JYJUEfo9Afpp7IKWmtObr+iWDdqR
 mIp3IIXwuJuj4sU0u/O3Uga6rX4jbVSQ+90MsMqyiTnJMOpS80LOIo44Ej3x57mFS7o3
 MYW5Kq0HITd+ZG0KLY+3z/aE+/HvJRJIc4Fy/XHaLCAYeqVyMaAYnGAbwyGjUV872JQf
 hxBUom7Iq2CF0Rd00Pt9Fz4y5ZcTGlafS3gXCF2xg6aE8o+L6vR01UmXEfGz9fkln87G
 6mRSGJ93+t4YSumCimruOmLto4AyRaNbRB/heNeVwYH3uxEOyOzxg4dXmoHFuZcfrOF7
 n48g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVdK6BznbKRUISrshYT+f20+g6Mg5w7kOnTYmd4a1Ul4cdof0lniZpcTAM+Mf5Fwgjqx/4LPx6CMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8TSMb29vwkiqFI+khNqdibsthXeST1m83LfoHvaNJAm8QZxH6
 4eR2arP9N0A/GaX3zm0y5Mmlome+K+XYb6yUzMFj5bDoaox4Fv+rhmWR43X/ZhhqgFw=
X-Gm-Gg: ASbGncvsjpswZQE1YS5/kUejRvEKq1VSpsuAYTDPM9p6LFxandD8nrrX575kr/8CjQm
 /Ix58FMEHDt5CsOVu0o9Yv6iBvhxMJXRLgV0YvxRBubcGDaApGaBHzxTKRFE0TOyyqv10NzS+6Y
 aO8VLTTO8akplL/Qm6bxR+ZlVbfrbd1aCbnCtStOS0vW8zJiwThwEFxSYOQfV7eEHs9j3lzTIOO
 8lP752IGWJaX/kI/R6yz6fRQigxhoO7LfLNDVb6Bi94V19nIES3nT4Rq375TxZ7VswdpmPKWGG7
 gBFV6URm5tS++ksUq3zDg7QeU00pfZoQ5ZYm0Q6KlAkM7AIgHturfdA+CEsIvWIql2fNE4UzT9G
 ekjlr5MjQFLmN9YhNU9FYOv0ya0LbKX7UrWzKkIkvebjZHEDudzkO3yZH17bBkpZ+f1Q=
X-Google-Smtp-Source: AGHT+IGI0FRIBcn7+ewvVoVXQiIxd4aqI3a5daINMP5NPbGCg/btrnW7FF6uC84mAKOivQzb6X0JuQ==
X-Received: by 2002:a17:907:2d0e:b0:af2:aa60:90c with SMTP id
 a640c23a62f3a-af2f917a878mr268806566b.53.1753275245117; 
 Wed, 23 Jul 2025 05:54:05 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl.
 [144.178.202.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6caf9ad7sm1043339866b.164.2025.07.23.05.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 05:54:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 14:54:04 +0200
Message-Id: <DBJG7C0L3EFP.BOWGHS7WB4RM@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Clark" <robin.clark@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
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

On Sun Jul 6, 2025 at 1:01 PM CEST, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
>
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: the driver is a part of drivers/soc, but as it got merged through
> drm/msm tree, this fix should also go through the drm/msm tree.
> ---
>  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca09=
4903bb1e7389066 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -12,6 +12,10 @@
> =20
>  #include <linux/soc/qcom/ubwc.h>
> =20
> +static const struct qcom_ubwc_cfg_data no_ubwc_data =3D {
> +	/* no UBWC, no HBB */
> +};
> +
>  static const struct qcom_ubwc_cfg_data msm8937_data =3D {
>  	.ubwc_enc_version =3D UBWC_1_0,
>  	.ubwc_dec_version =3D UBWC_1_0,
> @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_dat=
a =3D {
>  };
> =20
>  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +	{ .compatible =3D "qcom,apq8016", .data =3D &no_ubwc_data },

Isn't also qcom,apq8026 missing here? Not sure there's any more
missing...

Regards
Luca

> +	{ .compatible =3D "qcom,apq8074", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +	{ .compatible =3D "qcom,msm8226", .data =3D &no_ubwc_data },
> +	{ .compatible =3D "qcom,msm8916", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
>  	{ .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },
> +	{ .compatible =3D "qcom,msm8939", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,msm8953", .data =3D &msm8937_data },
>  	{ .compatible =3D "qcom,msm8956", .data =3D &msm8937_data },
> +	{ .compatible =3D "qcom,msm8974", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,msm8976", .data =3D &msm8937_data },
>  	{ .compatible =3D "qcom,msm8996", .data =3D &msm8998_data },
>  	{ .compatible =3D "qcom,msm8998", .data =3D &msm8998_data },
>
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250706-ubwc-no-ubwc-3c5919273e03
>
> Best regards,

