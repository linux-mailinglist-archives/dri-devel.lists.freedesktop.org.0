Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C24A478BD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D03010EA71;
	Thu, 27 Feb 2025 09:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fd1JQUoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725B310E93B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 15:30:32 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2fa5af6d743so10742981a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740583832; x=1741188632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZ/QbTWZNshBxb5hC06ZzjWtL5HiviO0RmZtIpOJ43M=;
 b=Fd1JQUoJP5b4dp3+GUKyZ9W6D0DxB6a0GTkQOZMkOeO2W6hK8rkMOlZPPZsgSxcLmO
 w35+eiW2/bhUHU1PVre4mUqUf0FZ2dLik2QYim4LMUALOBHtwsv2rqZmUqWYXwQgAWRC
 b6xHS6Im88qXqzTuNF/UBO3M7spA08N3LNmTeJnjpXe9nnxUjWy0bXNbuuApwH56uSwU
 6t3hOGMBtaEiqXWkjm1LZhTtV/0WBgYcSAs4fkTbfhoHY9t0yvPUIZVTVJdMoOD6NSOl
 ra2EAeESQw161cnpNXauD2md5RwFGbva34IM87HqacxSPSBOSlukZFm7AQu9wRMQKcvD
 ocXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740583832; x=1741188632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZ/QbTWZNshBxb5hC06ZzjWtL5HiviO0RmZtIpOJ43M=;
 b=i6nZZDMRZlvmD5vuONgQmesTmx6EA92VugpdCe6ewdm+ueM0N4UExGvXDU95BkPndP
 /LIbl6CS7eDwZ6RyKCCAIkWFFhL19kqG6mtr3maPFNYBnZb5jA5ZWbMLg0AostI4/8kS
 0u0reSX7R1Yf65Ube0oGTPvbb4hI2Ix1Hlv3gXKF5agMz0oPD5bahnpJwvBDx22cTiD8
 r2M/ReiS11wv0i0KvwQynuOQKHfpIVX5nckB5wYzhQvhJmhNpKrVitRgyQaJ6jPtjnRj
 3XvPljd+02yzUy0GvN3by+OYqjYVCIv8qGrszTD+o5fTvjZ2Ji62rr7YFvgLyYMktRR1
 Ezow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIv/1NpTgSYp3oU6Vzm+50KNWq82F+tv7wFVuN863x6i5GQkN6EWtdzd89fd6RM/kc+KCVXMIkj/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMSgEEXyAhXaMLvxtLHssQULjiGx+gLc979HRMtf6MBjAxzlxb
 nf9APu79HrWGCT9miJNUiUYTBSOM62gf22kOba3ywzwDLT7UGs0Cv9AwYWt+D1bfL+2ImvW5H1N
 tEemjIPur5n9p9LheNPxTW0pECpM=
X-Gm-Gg: ASbGnctQ0ieLjSE4Mf5p3xAMIF8cPBKl9Y4zMKz0WpAZOhMoZwa73KUbRKLU3sLEb+Z
 PA+F1naC6CfX890CA4SZ6JhdWqzzgwwjYYlHorRcSFCYurp/IHaT+QapiHyLf2P9AFj88MDEAGz
 3/TMcF
X-Google-Smtp-Source: AGHT+IFo6DOoGnTsS38LlUXMIhC0H9EtIGCJVFbM5Bu56nEtT839xcPAHtRDebmakeB9TC+KDHHS0qohqRpYH+q6d2s=
X-Received: by 2002:a17:90a:c2c7:b0:2ee:e113:815d with SMTP id
 98e67ed59e1d1-2fe68ada148mr12284035a91.8.1740583831681; Wed, 26 Feb 2025
 07:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
 <20250226-initial_display-v2-4-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-4-23fafa130817@gocontroll.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 26 Feb 2025 17:32:08 +0200
X-Gm-Features: AWEUYZnVDiZ00SedBZ6EyKd9EOM22xcDBV6m1uAzMRnVUY2vdD1K52vvrRAuSvo
Message-ID: <CAEnQRZDXxuviih+o-iFOtiS6j8=JqnhUOHaZf3RhGL++fg=moA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] arm64: dts: imx8mp: Add pinctrl config
 definitions
To: maudspierings@gocontroll.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 27 Feb 2025 09:10:01 +0000
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

On Wed, Feb 26, 2025 at 4:23=E2=80=AFPM Maud Spierings via B4 Relay
<devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> This patch has already been sent in a different group of patches: [1]
> It was requested there to submit it along with a user, this series also
> includes some users for it.
>
> [1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1=
d2@gocontroll.com/
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/=
boot/dts/freescale/imx8mp-pinfunc.h
> index 0fef066471ba607be02d0ab15da5a048a8a213a7..0927ed11ec687d5b273c4a4a6=
455e8d81468f676 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -6,6 +6,33 @@
>  #ifndef __DTS_IMX8MP_PINFUNC_H
>  #define __DTS_IMX8MP_PINFUNC_H
>
> +//Drive Strength

Please use C-style comments /* .. */
