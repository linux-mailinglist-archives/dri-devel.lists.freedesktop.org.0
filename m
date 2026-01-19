Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0783DD3AD16
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6542410E4B0;
	Mon, 19 Jan 2026 14:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EpPnoXM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDDC10E4B2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 14:53:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE0414441D;
 Mon, 19 Jan 2026 14:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACB8C19423;
 Mon, 19 Jan 2026 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768834420;
 bh=PjW88bpBQA6g4rD0v8HvGLkfvikwUAEsezrluo8/1tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EpPnoXM3+E5/2yAFQ1+wKxsaHOEk3rliv+M8eFOs+f0/tH8aY9xX3k1VnGdVlIf0j
 wSgVOg8aZ1s2wTLd1GqOu0q/CaDbTdGQDpQ5VBu7gotmbp1GrbBQJeJfgxYInaTuMy
 8JzxAUQR+FBi5XC0ycUR/+zQU1vHBRBOPPvMoL1nGFtDbxCk9/5VOdkPS2e6RcxDaf
 J+NPEBROOK/li50HJfyOJ8aIzrJNhD6m9eM2jadK8wStMm/TgfqziLbqS4rkQYLUxm
 /MgY+1fdI+bK6YWAbdwOFYUoKrZe/ebFTogV8C+ibx5/4z6RMwhazE+aoG/CoDYy/e
 tAYRp7TIqixVw==
Date: Mon, 19 Jan 2026 14:53:33 +0000
From: Daniel Thompson <danielt@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/7] backlight: qcom-wled: Change PM8950 WLED
 configurations
Message-ID: <aW5FbaVkDHkApE3S@aspen.lan>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-4-e6c93de84079@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116-pmi8950-wled-v3-4-e6c93de84079@mainlining.org>
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

On Fri, Jan 16, 2026 at 08:07:36AM +0100, Barnabás Czémán wrote:
> PMI8950 WLED needs same configurations as PMI8994 WLED.
>
> Fixes: 10258bf4534b ("backlight: qcom-wled: Add PMI8950 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 5decbd39b789..8054e4787725 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1455,7 +1455,8 @@ static int wled_configure(struct wled *wled)
>  		break;
>
>  	case 4:
> -		if (of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
> +		if (of_device_is_compatible(dev->of_node, "qcom,pmi8950-wled") ||
> +		    of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
>  			u32_opts = pmi8994_wled_opts;

I still really dislike naming the structures after a single instance of
the PMIC when, at inception, that name is known to be wrong. However
if the Qualcomm devs are happy with it then I guess I can live with it.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Thanks

Daniel.
