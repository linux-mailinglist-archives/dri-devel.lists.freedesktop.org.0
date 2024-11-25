Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCC9D8E7D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 23:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E0710E057;
	Mon, 25 Nov 2024 22:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u8iwIY3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2712810E057
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 22:29:26 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ffa12ad18cso56606801fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732573764; x=1733178564; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k7Mjha7mt7/m4DZzh3o0nA7+a6qpYNJG+dFaWFBEpuk=;
 b=u8iwIY3ytMTPvL5eP9PGnAZaOLc6FAVaHQMLlyBFBU4JgEEXFIALsa5uOL+fcegsNe
 d4EugG6WjzvBQZBlBoNxx5KcmV76BAxDL1IzYzI6RklyraIYjV2crqlqjrW8BUNhm9+c
 1zXcGSIJpf5g60HjtOeJTPrVw2QPMyB+ROUWmLD004cmo12k6/xlOIZFIe/Gge/fLz0g
 UbLej96WkcN0hdFE3walpZ9dL08v42JbkoDa4dHrDZT7aVAP3S8oJQ48xdplHrFAKzV4
 m3etQjlpwQ27XkM400Xlrjihp8FL+lWFG3cBZ3HQ3nZ0vv6YEFmtKekmApr9ZNgOUUfM
 hGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732573764; x=1733178564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7Mjha7mt7/m4DZzh3o0nA7+a6qpYNJG+dFaWFBEpuk=;
 b=sZ1WZTjVhOptBFqZcXUMw7ZceQlXj4GLNhGTMYH9v9P2ArkxIpKy7jknUzbegdbWsv
 mGA2ZeP8cMecx+/jLubDErQmWBV7u22gJkwbYhVRT2R6J61mvhm7X9M1MAdN5OTSSTSE
 RD393CVfCxC+cTEaCaEzRNNY8ihIL1D44WbuBj43e94zdW4Z9d0HyL3AeTr6XXFL6h8p
 FfIPQnTX7A08wtHH3nRM5Hmy+73ZeyyVcwalTKR7tJrWwnps7FBZHTY06RzIfqSf1mYg
 p7EHtVBbAHLruSS3pnNRi5HbjoJSBt2UN2y6pEH46ujFLD+Sb383Vd5olGiazqY05+0D
 nX4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzIHx9xgP6Az/9CNljY2VnrmU5goeYr2XE+7JXpkq352l+vQfM7ukPfpn5/g3tjJbJwRoYuCPez/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7K6Kd4m336JpvrSk0sFj+6CGJBR0NegovV0F0yva/XTJ7ffYp
 wdLKyoGfyWzshnNZ0fnNPB6GN+wM1BwpjvKLzJfj3Td0La67C7JiclhMrn0dNJI=
X-Gm-Gg: ASbGnctNAjLZIeUS15NBKX0UTEz0PsYw9JrslNHRFI7OhH3BWBdJEYtHK1TDX/4ARv4
 OwbBpZFdhrVoTgVCqNyeLbqvdfbrayHeQLgpJAUHGO8DdskfKcbn/lXP8JtxU8+hMZaMerayeB9
 LqGpaEbJuL5EVem2mvf9jI6z9boYULEMX9kzGlMghcgr32mnkI3WJZy2QKZE5Q+mYWliL0i4Po2
 UZLk26eVk6NAly5NQGth3jTsRiMjgdAHxZQYcjF0ebh4Aa4R61HWMiZiLG9BBMwvRZ7uoHTXThl
 Bw1jfPT0YVCy6uZyQsZpj+EM8DlGbQ==
X-Google-Smtp-Source: AGHT+IH1IKpz08cjmxxXUbJM5uXr9tgTCebrKIjGwrE87znYHiTuxb+ZVdM3K1db1okc65pMOPjqoQ==
X-Received: by 2002:a05:6512:3a8e:b0:53d:a58c:c5a4 with SMTP id
 2adb3069b0e04-53dd39b0e4cmr6366883e87.40.1732573763643; 
 Mon, 25 Nov 2024 14:29:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2496ae0sm1820105e87.239.2024.11.25.14.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 14:29:22 -0800 (PST)
Date: Tue, 26 Nov 2024 00:29:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: maud_spierings@hotmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
Message-ID: <7mmnvrgzmqujse4bz2eosdnqmogyvfdi3ei5ez3es562qncks3@yqre7fakszbb>
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
 <20241125-asus_qcom_display-v4-3-61a4da162406@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125-asus_qcom_display-v4-3-61a4da162406@hotmail.com>
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

On Mon, Nov 25, 2024 at 08:11:19PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add bluetooth for the asus vivobook s15
> Describe wlan configuration
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 164 +++++++++++++++++++++
>  1 file changed, 164 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
