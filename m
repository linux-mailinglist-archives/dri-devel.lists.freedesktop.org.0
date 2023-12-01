Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2759D800E6E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 16:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9510E0B0;
	Fri,  1 Dec 2023 15:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D0F10E0B0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 15:19:41 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a195a1474easo191189766b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 07:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701443979; x=1702048779;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGODWC2uJcvDQZ7EY2xJVvkyTzj74X5vd6Vn8ASvgDA=;
 b=CNVActxoB7gs/3zNeZiYT/zyp8Z5oTJA64jOjZOxWHkfxz+kPalt4rQPL1m9f5Yz6Z
 g36lYdEv9bUFShv8v3F5+17nCcnoZNbxrIqZZeIuFcEcOoCzN1ecXmIDDzoI2CXmhepU
 RvKLX5XwGqDkm/5tWR+T+twxMTbWIr5cRGxtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701443979; x=1702048779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGODWC2uJcvDQZ7EY2xJVvkyTzj74X5vd6Vn8ASvgDA=;
 b=iCHbQbzRU+OyNX1l95YUYF42sAzfohn6YP0zKleDPS/6KtsjyBHYr0JD5BgLlGWXJe
 hOYDyYCcr6Cb5mSE+Ohw+/K5vncC35VmDpVYTrjffBqCjRVaPpvvVRwbO92vW4TsMm06
 /vDaIxyC5xC/tnF3QWyi1EgjRPQ/Jj29c5JoyavgMqJH5Y/9wp0QKETzN/owNZMIA1c5
 2cy5+7Rt72Ioh1GmNAsjwGWVFJDseM/q9EfPrmxBGARs1In9Rpdi7f4BOUb5zxgQ7821
 tSW79eO1Jl0lZMp1+gStG7RLqfguHbcUxrnQCc93Xom2BN1qLxZnxrXc0vNO765iHy/m
 zzzA==
X-Gm-Message-State: AOJu0YwPvaNNldvkjfuM8xnuRpl57ilEOQ+DMqNrs8ItEvYPnPdL1SVE
 3lFEawvt7jFx4ohfYJrtuEN1T5BMDwz8kaC5kYqARg==
X-Google-Smtp-Source: AGHT+IEEFU9VOzKg8cu+KpXLJ9B7mD/+HfP82WATTjK+jQpfJUdMAK29JXziCzsVwxOkf3MZ1APvXw==
X-Received: by 2002:a17:906:3550:b0:9ff:6257:1b4c with SMTP id
 s16-20020a170906355000b009ff62571b4cmr1936917eja.37.1701443979575; 
 Fri, 01 Dec 2023 07:19:39 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 u8-20020a170906c40800b00a0029289961sm2004950ejz.190.2023.12.01.07.19.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 07:19:39 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40b422a274dso75815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 07:19:39 -0800 (PST)
X-Received: by 2002:a05:600c:3ca3:b0:40b:5972:f56b with SMTP id
 bg35-20020a05600c3ca300b0040b5972f56bmr137725wmb.3.1701443978762; Fri, 01 Dec
 2023 07:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20231201-x1e80100-drm-panel-edp-v1-1-ef9def711d8a@linaro.org>
In-Reply-To: <20231201-x1e80100-drm-panel-edp-v1-1-ef9def711d8a@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 07:19:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XLbuOwtYiP7w+dqRK3p0QM3maumQ2TOL7+N1SXqi9f0A@mail.gmail.com>
Message-ID: <CAD=FV=XLbuOwtYiP7w+dqRK3p0QM3maumQ2TOL7+N1SXqi9f0A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add SDC ATNA45AF01
To: Abel Vesa <abel.vesa@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Dec 1, 2023 at 5:13=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wro=
te:
>
> Add support for the SDC ATNA45AF01 panel.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 825fa2a0d8a5..467a42eddbe9 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1988,6 +1988,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ=
116M1JW10"),
>
>         EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081=
116HHD028001-51D"),
> +       EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA=
45AF01"),

'SDC' should sort above 'STA' (and 'SHP'). Each of the manufacturers
have their own "block". Since this is the first 'SDC' it should get
its own block (with a blank line before and after) between 'KDB' and
'SHP'.

-Doug
