Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A69D8B2D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 18:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8105110E6CE;
	Mon, 25 Nov 2024 17:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="T4FHk17t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5B10E6CE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 17:19:24 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53dd57589c8so3439073e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1732555160; x=1733159960;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMzxcC5wsaZiCOOJDSmAWDv3eoVe+TCnixOaVa1nGDY=;
 b=T4FHk17tp9Owq4zyH1NAT4tTuwwpxqi8h+cwShmCoZceHjd6H52CMJ4kpZxxCXHGf3
 eGOJXt6Io1ksz9Uk6HnHgREwdml1o4jd3MyJYMYjbn3eM13j9IS9ENufDEn44s4BExAr
 9rJ+ZuUvg0A4ecu7KFNH0mj5+4qjxKALmqztc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732555160; x=1733159960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMzxcC5wsaZiCOOJDSmAWDv3eoVe+TCnixOaVa1nGDY=;
 b=EwNCsJFwrs9H3dB3AxDmlkA24avB0Wyqy601jbLYGGcExCCf6ZacENfx/CLgEDWBmT
 VeWPRjtmDM9amNNrjHugrXoTgaAoFaxJPgz3w+OXO9ef9mRLXi+I9JhzrElyZSXNV3Uh
 RRtgiH+cR8JjU+nnPzIDvPsL6QDmYsH55I2phLJh1xA5OtPDeKxwv0kPvLTxQUzSdI29
 p/eANIlPQGge3x47pIDNmp52E6txSN0dLUN+/D8oaclj4/oUvA32zDYJIDAh51Jo1StN
 Cubngw2q6MF1H7piBxj4I8XhdXjbQq96uZKxXJHIqfZgsxQgneQGnQ1dr1artGYGwqlK
 r1qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR2lXBPFb5kVGGAJzJfAF58kHvUnSXtNgD56pTteTyAfMTPH82IX9DCtNWySLIkax9TjP+1p0hRfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIOMwhznETbtdtsycZBa+TR0SnE0Ovf9msSIrgeqTodHxtDDlV
 ynPVWI6JjscUAuzopoETA8pcDNJftvQJ6B4/x2e7x6zwdYAwsdIWuI/g30TdctS0jZcYC4RWs9A
 =
X-Gm-Gg: ASbGncvkmtxqktll6TFWXA0b5JQiLT3cyPEVCH3Ya3Ii6GDyj2UJ5yrKlAKkiDf0KRc
 btcPk2UUFv5013zub4MYMQ2CXidfdpqtZk7x5TpnPjAuTJEn0fNdkl/eY/6MgRZA81uKeRhLd3y
 3eYEeSIj3Om45rpGk6JZpiSu4MReJ1ugtnjVKkZOuW/htur5n/mqSNsW03qTxa78GWVTQgcFBYg
 qvV92iiVxPoaHzthtfsWQvMa1T+8Ch30jgaOQx9IvYCNPrheKiI2Lxh7U4ij4lDLbE1V4bP0Pa1
 IhDS7/Pu953i+Q==
X-Google-Smtp-Source: AGHT+IF/+Jj034JqErmIs5aVZom4+CHU0sP8c4pcnqNipXDtXTDTeD3q9SeKYQRQO50VzCZuUT3JAw==
X-Received: by 2002:a05:6512:10d6:b0:53d:dfbd:3e68 with SMTP id
 2adb3069b0e04-53de8818efemr64196e87.7.1732555160299; 
 Mon, 25 Nov 2024 09:19:20 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd249c8c5sm1726625e87.268.2024.11.25.09.19.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 09:19:18 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53dd57589c8so3438988e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:19:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVU9vtzDfRnPNCX7qgEuTdzIt4cl883q2EoVrtLRkGZCY9se6IV9nx5wYmzRllt8pJidRq1NjYqeHI=@lists.freedesktop.org
X-Received: by 2002:a05:6512:b8e:b0:53d:ced5:e9f3 with SMTP id
 2adb3069b0e04-53de884971dmr59574e87.25.1732555157694; Mon, 25 Nov 2024
 09:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
In-Reply-To: <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Nov 2024 09:19:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XjWT16wC_cpnC-Y5=eSvnj7rXY1z2ENyWZQYDawmjs8g@mail.gmail.com>
Message-ID: <CAD=FV=XjWT16wC_cpnC-Y5=eSvnj7rXY1z2ENyWZQYDawmjs8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
To: maud_spierings@hotmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Sun, Nov 24, 2024 at 2:01=E2=80=AFAM Maud Spierings via B4 Relay
<devnull+maud_spierings.hotmail.com@kernel.org> wrote:
>
> From: Maud Spierings <maud_spierings@hotmail.com>
>
> The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
> It is similar to the ATNA33xc20 except it is larger and has a different
> resolution.
>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml =
| 2 ++
>  1 file changed, 2 insertions(+)

Pushed just this patch to drm-misc-next:

[1/4] dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03
      commit: b1fe820d03e2e1b89315faf99f1065bdb4146a8f

-Doug
