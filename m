Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7194A3D2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 11:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E524710E485;
	Wed,  7 Aug 2024 09:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1kH+v3HY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8DD10E485
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 09:12:55 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f136e23229so16385781fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723021973; x=1723626773;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AXJcefWBGwCjqo+n8nUM/WZjz4KUu6Dr7gpS34TWtOM=;
 b=1kH+v3HYBo3YY+WAMFZfNQPrBFJ98UBgi12MAe07UNCOD5wdP93Zx6vYWSSgdocyj0
 vzIVYJGd1IL3DYN8wsq8EiQAQ8MPCh4pSUIxjhtAskcGIqToP981OZw7737J+rBGG+NI
 97ICRZipTvX48WVTISBkbNQs1JBdv+7O1LphtS3x4Igp6aEfPGvNgH0O7q93WB2T4bGv
 rwUERnpnmDQZcMJoInVP50XZuRASGpBBRYVQKZJXdVEnYRn7e+ZYXKpH8sT2kZaeRQ0q
 vtD33sSjIvGYru56sODMLjwnA7vHQJP7jp0WVs+r9dGMRLJvi+lJWKgt6KMvX+xQnssv
 HfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723021973; x=1723626773;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXJcefWBGwCjqo+n8nUM/WZjz4KUu6Dr7gpS34TWtOM=;
 b=jtyq49Ib9uqhj9OaSNUKYzL/bZyrWjO4ivfqPj/vVCVeCW8hEBYbBJMHlm1kJpaqUi
 ufyHDQxgPhbtSlFRDNHR0Aw0lfUVr9vCy4tT7E3HrhuQjJlXslYk0Dn7+TAeu/Nt4w25
 tq/kqiMhP5BZqIvpFAh5R7hZ/KLTi3O+kHeyCnYWoBp7oElstlD2HqF5TLZ42gHl4r3M
 x42nM9lInEg2yl1XtXDt6wxmucnLqNg1MnoJkHXvBlPnddsZfy8t56NcdwDcYegqV5gj
 j734qJk6Tz5hT6sJisZTMRRmx5XDdB/SkMJ5QT0BGunraxTADBlR2PBQC447V3wnszfn
 7+Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUduq0QarHlMhLOFE2v89wLTMJYcwiAXg4+S5YA1iUp6ERhIcCV92mz/AmnnIg1fw/2b+R00hD3mE+ngi37udk+SxwqWCh1qFQTX0e73Bt4
X-Gm-Message-State: AOJu0YxxEvjsLPxa8sizjtM81Nn2vvaogJ6n93XZQHVGolwysPg6p27A
 GzT78t6nB4vRwextmyzyPt5GO5QgbPZYTP9C/X78rmtqEeJIZD8i+uYEni7QMy0=
X-Google-Smtp-Source: AGHT+IFQOHCltwKQCBXQPLStP2Dg6b510B5NipglQzmC2gXIAhpoliwnnvlnRgikWAIyVrNs5a43UQ==
X-Received: by 2002:a2e:91d0:0:b0:2ef:1c0f:d490 with SMTP id
 38308e7fff4ca-2f15ab0c2a1mr126633751fa.39.1723021973213; 
 Wed, 07 Aug 2024 02:12:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059cbfaesm17923005e9.42.2024.08.07.02.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 02:12:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Kevin Hilman
 <khilman@baylibre.com>,  dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] drm/meson: dw-hdmi: use matched data
In-Reply-To: <CAFBinCAaZumGU6dOq0RrHRTQV=MejTJ=RW0P_6tQFOG9vybY6g@mail.gmail.com>
 (Martin Blumenstingl's message of "Tue, 6 Aug 2024 23:03:25 +0200")
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-8-jbrunet@baylibre.com>
 <CAFBinCAaZumGU6dOq0RrHRTQV=MejTJ=RW0P_6tQFOG9vybY6g@mail.gmail.com>
Date: Wed, 07 Aug 2024 11:12:52 +0200
Message-ID: <1j5xsczoff.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue 06 Aug 2024 at 23:03, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hi Jerome,
>
> On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
> [...]
>> +       }, {
>> +               .limit =3D 297000,
>> +               .regs =3D gxbb_3g_regs,
>> +               .reg_num =3D ARRAY_SIZE(gxbb_3g_regs)
> Just as a side-note: this looked odd when reading for the first time
> as I thought that it's a typo (and it should be gxbb_2g97_regs - but
> that name is not used).

I know it looks odd but there is a (perhaps silly) reason for it.

The names are derived from PHY modes used in the Amlogic vendor tree.
Those are magic pokes and we don't really know anything about it. The
vendor tree often update and mainline does not always follow. I know
that we are not 100% aligned right now. No one knows what branch is the
reference to follow anyway.

Using the same names is way to leave breadcrumbs that may help people
linking this to vendor code later on (if necessary)

I think the modes are named after the (rounded) bandwidth they provide,
not necessarily the limit we are using to pick it ... except for def,
which might just mean 'default' I guess.

https://github.com/khadas/linux/blob/khadas-vims-5.4.y/drivers/amlogic/medi=
a/vout/hdmitx/hdmi_tx_20/hw/hw_g12a.c#L589

I focused on keeping mainline as it was for the value poked, retaining
as much information as possible to find our way back.

Your proposed naming convention is fine by me as well.

>
> [...]
>> +static const struct meson_dw_hdmi_speed gxl_speeds[] =3D {
>> +       {
>> +               .limit =3D 371250,
>> +               .regs =3D gxl_3g7_regs,
>> +               .reg_num =3D ARRAY_SIZE(gxl_3g7_regs)
>> +       }, {
>> +               .limit =3D 297000,
>> +               .regs =3D gxl_3g_regs,
>> +               .reg_num =3D ARRAY_SIZE(gxl_3g_regs)
>> +       }, {
>> +               .limit =3D 148500,
>> +               .regs =3D gxl_def_regs,
>> +               .reg_num =3D ARRAY_SIZE(gxl_def_regs)
> this is not consistent with what we have above or below so it either
> needs to be updated or a comment.
> I think this should be called gxl_1g48_regs
>
>> +       }, {
>> +               .regs =3D gxl_270m_regs,
>> +               .reg_num =3D ARRAY_SIZE(gxl_270m_regs)
> and this should be called gxl_def_regs

def in not the last one, it is another name used by AML

It so happens that on mainline with we have only put the SD/270M for
gxl. In the AML tree, it does exist for G12 too. Maybe it will be needed so=
meday.

>
>
>
> Best regards,
> Martin

--=20
Jerome
