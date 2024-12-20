Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB289F9531
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 16:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBAC10E396;
	Fri, 20 Dec 2024 15:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lRzoITSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C069510E396
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 15:17:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5401c52000dso2157324e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734707845; x=1735312645;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHXfKEaz+loEFXgHqD//2NOq5logn3BNe7QpGkPjQvE=;
 b=lRzoITSEX4r1w1XSjprejOMKz8ofu0mlxqlx1Pl0YZwop+Cf6lCk9xVKzXIZN2kjug
 /6bmVVndy32bHumgqJJILcjaau0dmyxWVNEkPAfuvJeS8knYOExZZ3vufA9pcLSse3LN
 kVqGAqfNRLZv4RfaVRLifimjAS7r3k9lPtEdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734707845; x=1735312645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHXfKEaz+loEFXgHqD//2NOq5logn3BNe7QpGkPjQvE=;
 b=jimRmgB/vJxQ8+PkSe/P1TaBz2Wg6NgApTRWT2GquntdbfWAY9lEIA+KNP/FMup1p4
 9IqdIY5gsTftS+qqxacQPVcfOSUbi/cV84fsd30AQNYDo2DZpkklmKy6pwJTgmTbKlyd
 QcZQVSDOgTX6cnf3vKTqXkZkR5ShG1LJsz3DOql4/8/pk7ZaTURwJZXnfmTQH26jrhVt
 kgpkQ53PqgjqnG7HcPapZLemC6n0xfH+TSn1EnUZXl9VIe3XnTMiCC55BWUh5mLCmBKi
 rjIz2Bk4g37jYyG0rF/79QAWJ7ACWI8GOTLLoWab8PZqR4mZ5dN1ZBTda99Kw7U+fsNI
 h+Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNEpdiUxcVk6z2UKqrE3evbcq9oQ0fBX3oKYlk37qzJFVQ4lCv0j936/kqEKv8QTqGCOLqOpTukcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy4RSaikmWCyCmX0DOjyMQ0aanwjuds5mWUF61rJ2r+vs52OAl
 83Qnh1LFqT6l+z5Yg7aCHB2wXO3svcb9+YdFkHFSqhhAKZydh+POHbQJJSaiO216YXFc3el39D9
 TH08g
X-Gm-Gg: ASbGncsU33aPmf1/AW87UA5ZAQgFvKxmEqA4O3jN+9Wd2bYDn0t5d/SjiosUl7xcTCx
 RzzLRp1+5n1K5rBjZTmzpJmF1lN1NEtJOZrJV3fBKywXZZy13jNWbhGWINecJNkWWxzkjDjixyM
 eukU2nLADRVEKYS08y+q7BGyk8ST6EvsV/Mt3ckmEJMWNINsRqm6fvc9Wr6MMsIvZ22rB0LX0d7
 11oTrERRfxuOONysHOYE/ACPHHHGjwTbhMNIHggiNse6OpDD/8ct46wmrEDYgspfUb8M8166M4N
 hBvtwllxK+5AmG3oXi/u
X-Google-Smtp-Source: AGHT+IHWcGQPyYoDZMhWtQ2YsAM4+25I5KemoynlnHQLrcVITYTL1fHXPOgqRfnPsV1zL9OGlgJoyQ==
X-Received: by 2002:a05:6512:ba8:b0:542:28dd:6b7a with SMTP id
 2adb3069b0e04-5422952e7fdmr798073e87.13.1734707845024; 
 Fri, 20 Dec 2024 07:17:25 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cb8asm5669891fa.18.2024.12.20.07.17.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 07:17:24 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so2140487e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:17:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVX/67eDh8CyIMKOFWG9P+7+Smv7Y7k0k6S7N2OP1t7zbEoCXdd/IdVPh64hwfTjVupSOkTyEiOeyI=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3f26:b0:540:3594:aa39 with SMTP id
 2adb3069b0e04-542295228a6mr1091094e87.5.1734707843017; Fri, 20 Dec 2024
 07:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20241220122058.132843-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20241220122058.132843-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Dec 2024 07:17:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VYgzP=wG2Q6ydrs1RtC4WjB6krfh4SC2inQNpLDCy-xw@mail.gmail.com>
X-Gm-Features: AbW1kvZbe1ByB4woRZJ94o-i3QT4phjTOFK5pvlkSSR9RKwUbA2dMVVVtqfWT2o
Message-ID: <CAD=FV=VYgzP=wG2Q6ydrs1RtC4WjB6krfh4SC2inQNpLDCy-xw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add support for 2 panels
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
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

On Fri, Dec 20, 2024 at 4:21=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the following 2 panels:
> 1. B140UAN04.4
> 2. CXOT T9

Can you please include the panel names in the subject line instead of
just "add 2 panels"? Otherwise all the changes to this file look like
the same subject. AKA, like:

drm/panel-edp: Add B140UAN04.4 and CXOT T9


> The raw edid for B140UAN04.4 panel is:
>
> 00 ff ff ff ff ff ff 00 06 af b3 a7 00 00 00 00
> 0c 22 01 04 a5 1e 13 78 03 cb 55 91 57 5a 91 29
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 f4 3c 80 b8 70 b0 24 40 10 10
> 3e 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 55 41 4e 30 34 2e 34 20 0a 01 46
>
> 70 20 79 02 00 22 00 14 87 61 02 85 7f 07 b7 00
> 0f 80 0f 00 af 04 23 00 02 00 0d 00 25 01 09 87
> 61 02 87 61 02 28 3c 80 81 00 15 74 1a 00 00 03
> 01 28 3c 00 00 53 50 53 50 3c 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0b 90
>
> The raw edid for CXOT T9 panel is:
>
> 00 ff ff ff ff ff ff 00 0e 77 48 14 00 00 00 00
> 34 20 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
> 36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28 3c 4b
> 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 45 30 30 37 51 53 33 2d 37 0a 20 00 df

Thanks for including the EDIDs!


> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index f8511fe5fb0d..f41a9077c633 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1865,6 +1865,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116X=
AT04.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120X=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
TN07.7"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140U=
AN04.4"),

This is not sorted properly. 0xa7b3 does not come later than 0xf390.


> @@ -1954,6 +1955,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "M=
NB601LS1-1"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "CXOT =
T9"),

From the EDID, I notice that this reports as `MNE007QS3-7`, not `T9`.
I also wonder if CXOT is a misspelling of `CSOT` which appears to be
the manufacturer specified by "CSW"
(https://uefi.org/PNP_ID_List?pnp_search=3Dcsw). If so, I don't think
you need it.


Normally for simple things I'll just fix them up and apply, but I
don't know enough about the "CXOT T9" string to fix it myself so
you'll need to send a V2. Note that I will be away from my email for
the next 2 weeks so I probably won't get to apply it until sometime in
January unless you send a V2 in the next few hours...

-Doug
