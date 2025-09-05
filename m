Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DEB45E6B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 18:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D96110E09D;
	Fri,  5 Sep 2025 16:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HhnTdVQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CA810E09D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 16:41:45 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7742adc1f25so152617b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757090502; x=1757695302;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7we2w26uCtv2wyLrEnRWoDa7Ong3sxHBpOuF+Z3zJ8A=;
 b=HhnTdVQAOSLPI8dTkhuKEnsGqEMdChUKjNS2upsL8ZoeQebQEi9Rxq+0ix04IZ5OTX
 I8O+Yx/cMcQ47vx8DREfYGwVAMm8SpfOyHgVIbzdkWWhwfTzzy8VvA+vV3fVoPuR3tJf
 urFm3aYVBGxLsZkU2B8HXlup55WEXPsp9HlmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757090502; x=1757695302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7we2w26uCtv2wyLrEnRWoDa7Ong3sxHBpOuF+Z3zJ8A=;
 b=rZJoFmjf9xqEMsuDRUb6SlSDGoK4Dr4KGDNBA9saxgYcR5+XJ2Gb3+PlDpjLUTj/YS
 yXZEKHkgRW4W06iWAtY7rp62kyH49bs/70jK6zhueCxajB4jeDlcdoi6wZ6mt5LsWwAI
 PufBFoUQFeMiTtwPdpe7UhqHL/lY9Wzdw942MhndqGFD1Ka650GCdDxrIt8uXwBZ53aS
 U8y7gl65oodRIZujy4LxIxU20p3gqrF5YnXTXPjr8V+ySqzuU4h3iTOJ/hHACFcwVR/R
 Fxbaj6+2ZVbfC+y3Xf27cyYAn2nNFo5YRa6EN4dWLljk+G4esBQLtmMGDEuFYQmWYcSU
 B0nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGlXMHQ56OBUoInA5EBCunYF7nZHVBts1y7pN1L5iz/2LGxpsZI57R566aJ8DmPF4NaZr74gGTtko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrlvbu6vcMVMQyFBCdrFA9eWnCF6lx9odL6EJleelwKMdU90ka
 h9ApZek3Q8LgrMPuonvscJSEcQIK0mummVmeC6KY6KxBaIXnR6u50ANBFoyIsKEjmDT4ZPW85vh
 6dcI=
X-Gm-Gg: ASbGncv0RlBVVkHJSWHaIYXG/eshMDyU6kGRTNUo1YskwrKym+vcoYzob5e3EMBOqGF
 BgTCbi/dUcfzYhg6dAmnBJsLUHTQKVQKv9qzecgzszkNhLWXOX8Hh/fr2/FRmHGqu3l6TY9YURl
 MVAEIoQhyHzHz34XhpXgXFCGXXr5a0tVwESrxdlFwDgAtA5Ld0PsekE18AN3d7Bvdcu/4DdNvDE
 faHfqm6X1UK86kbM9gQMrRa9dkEVefohWuGmWJS1fdAPJYM+E3I+NDwFs8DzCYgtxrIGamVGEAL
 CwxhN00znz7e2ZfG//mI9BowVKRWaUm2ilu8/SxxUsCRu1G3jfh04rmIiXVrL+3ThxeOBM3p5ma
 hupdRY7CRRbkyvX4fgbkosUg1kdNHNVW4ZrM8n64hTi0eo3p0NocTe70o1JWmN39q8ghZF4p0WG
 5C
X-Google-Smtp-Source: AGHT+IG1miXigGBx1gADSmcJ9f3D96hwBlmKGIPLS9+M0sGMNr4NL9Lyy9bBbsB7LcNfbZG9DhXnKw==
X-Received: by 2002:a05:6a00:ae01:b0:772:4725:2509 with SMTP id
 d2e1a72fcca58-7724725283dmr21899172b3a.23.1757090502102; 
 Fri, 05 Sep 2025 09:41:42 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com.
 [209.85.210.169]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7723534c0a8sm20681899b3a.79.2025.09.05.09.41.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 09:41:41 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-77250e45d36so2023253b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 09:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmw8S0cF4JEh+mCEpQq2xqpEOeIMrXhWsSFnFazmD+RkTkH6C0kVQnP1i4szqbJ3Znb2RNsZNvlRg=@lists.freedesktop.org
X-Received: by 2002:a17:903:1b06:b0:234:9656:7db9 with SMTP id
 d9443c01a7336-24944aa33a5mr259852875ad.32.1757090497817; Fri, 05 Sep 2025
 09:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250905075114.1351267-1-wuzhongtian@huaqin.corp-partner.google.com>
In-Reply-To: <20250905075114.1351267-1-wuzhongtian@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Sep 2025 09:41:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WZAXnTGHhrMHTu3p0GL2ky2W1Xqmw2x2cL6FvvdYgG1g@mail.gmail.com>
X-Gm-Features: Ac12FXw2uXvSstxlAtnEXB_V9QzuCq1FCyLEPvienl_1abNVtyIr3AkvXSP36pY
Message-ID: <CAD=FV=WZAXnTGHhrMHTu3p0GL2ky2W1Xqmw2x2cL6FvvdYgG1g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add edp panels used by mt8189
 chromebooks
To: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Sep 5, 2025 at 12:51=E2=80=AFAM Zhongtian Wu
<wuzhongtian@huaqin.corp-partner.google.com> wrote:
>
> Add a few generic edp panels used by mt8189 chromebooks. For
> BOE-NV140WUM-N44 V8.2 , the enable timing required 80ms. For
> CSW-MNE007QB3-1, the hpd_absent timing rquired 80ms, the enable timing
> required 50ms, the disable timing required 50ms. For CSW-MNE007QS3-6,
> the enable timing required 50ms. For CMN-N140JCA-ELK, the enable timing
> required 80ms and disable timing required 50ms.

What makes this patch v2? I don't remember seeing a v1.

Also: this has the _exact_ same subject as a patch that already
landed. Please try to make patch subjects at least somewhat unique,
even if it's "drm/panel-edp: Add 4 more panels needed by mt8189
Chromebooks"


> @@ -1949,6 +1956,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT11=
6WHM-N44"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116=
WHM-A4D"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140=
WUM-N6S"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a6a, &delay_200_500_e80, "NV140=
WUM-N44 V8.2"),

Please sort properly. 0x0a6a definitely doesn't come after 0x0d73.

Also, from the EDID I see:

ASCII string: NV140WUM-N44

...it's better to use this exact string and get rid of the "V 8.2" at the e=
nd.


> @@ -1978,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N=
140BGA-EA4"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N=
140HGA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N=
160JCE-ELL"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1441, &delay_200_500_e80_d50, "N=
140JCA-ELK"),

Please sort properly.


> @@ -1987,6 +1996,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE00=
7QS3-7"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, =
"MNE007QS3-8"),
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MN=
E007QB3-1"),
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x143f, &delay_200_500_e50, "MNE00=
7QS3-6"),

Please sort properly.

-Doug
