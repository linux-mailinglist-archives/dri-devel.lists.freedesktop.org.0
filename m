Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEF5696F71
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0586510E9A7;
	Tue, 14 Feb 2023 21:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA510E9A7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 21:26:37 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u21so19388191edv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBwPN5w46KPtYzNBB1PUOcI+pxWeogqZV27TrNkwSng=;
 b=e6L9U1/sP8yKtDbZJ2G5JLuglrqL1t+mtS4EgAFm5APvzqAaG3bci9IVie8AD5G97m
 ozsYpcoJoD7o+jwnvGtiDiL2FUCbovV+6FI4fCnb5IDTcU1/aL4NXTsrE1Xxh2UcLYLe
 JKUW6th3x0j1zxmSyUlkpqVOQW8hOkSvBDRnmSZLS6d1AC8Rgo0b0FQUixO77nRXfXHp
 xOb7QUZ2f13OZmVZ4siw84XSU/Ufo5DX9O6pROIoyo7mGlF5uu/cGn2aulgZw5PYpe1F
 Vfh6olDVo8P0qZFxOL+MMktSNQ17nwOf7/UvHlyCMP763gNOM13n2bAGZ03OvFE/yx2b
 eYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBwPN5w46KPtYzNBB1PUOcI+pxWeogqZV27TrNkwSng=;
 b=AXTTgRW9xAgscYO/XtF0t4go1lMi3KDeeb+hM1uq/a6YfvADMJVo9iHkJeAZYIsp4R
 cRpqMKTnnNIOqmfESwyDEuh3joOWNKgpTlRGvCBp8Tq/rKcJe01MjLJWXBuwKPE2e72N
 rc+gLJwsnifkNLz2d9fytRXcovaKFdLbAm8hgDTZ7DaxruxZ89ElcTuEIQWlcAT7AA58
 Q26K1GHgPIyMuInyIhCBPp0vdPT7KSED2Kcm6clJ6Ae8teFfV/6HTdO4okk5SsWG8dnM
 exKICQ1VxnUNTN8CZ1q1vS9l6K0MeW5qBUf3zjagTk0Yvx9ItVSl6PYfAvub1uiGT84O
 Pehg==
X-Gm-Message-State: AO0yUKUabyr212jC73gfUy5G7ZbduzChQMJAOKpMrbfotCmiys+DZBwD
 4ziQfs6hhKo1rmZtgq0KNP4IlSSllZDVN44KXkA=
X-Google-Smtp-Source: AK7set/vnb1CkEj0ea06+CeQQeObauM91aLnWsPix4DfC/uLhJV482BdKGeQN7nHcfRTn+5QH44loUb0Fn0o9nOPHUU=
X-Received: by 2002:a50:c04a:0:b0:4ab:4b85:a6a8 with SMTP id
 u10-20020a50c04a000000b004ab4b85a6a8mr1965287edd.4.1676409996412; Tue, 14 Feb
 2023 13:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
 <Y+DPQjukgC0BELkN@intel.com>
 <CAFBinCBpbRu9xfCEfZJfT7t3doV=+CX03+h7W+HsoW5T4X0W0w@mail.gmail.com>
 <Y+oa6O6+s5UXvOP6@intel.com>
In-Reply-To: <Y+oa6O6+s5UXvOP6@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Feb 2023 22:26:24 +0100
Message-ID: <CAFBinCC6RRiN0=XYNw464omzjHrRcNZn39i3_Ztfq6M2xMpgRw@mail.gmail.com>
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 12:11 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
[...]
> > One could use HDMI_VENDOR_INFOFRAME_SIZE with this as well:
> >   u8 buffer[HDMI_INFOFRAME_SIZE(VENDOR)];
> > But it would only result in an 8 byte wide buffer.
> > Nobody uses it like this yet.
>
> Not sure that would make any sense since a vendor
> specific infoframe has no defined size until you
> figure out which vendor defined it (via the OUI).
My understanding is that all of the existing HDMI vendor infoframe
code is built for HDMI_IEEE_OUI.

> I suppose the current value of 4 is also a bit nonsense
> as well then, becasue that is a legal value for the
> HDMI 1.4 vendor specific infoframe, but might not be
> valid for any other infoframe.
>
> We should perhaps just get rid of HDMI_VENDOR_INFOFRAME_SIZE
> entirely.
My thought was to make it the correct size for
drm_hdmi_vendor_infoframe_from_display_mode(). Then developers using
this "common" vendor infoframe don't have to worry much.
If there's another vendor infoframe implementation (which I'm not
aware of, but it may exist - since as you point out: it's vendor
specific) then the driver code shouldn't use
drm_hdmi_vendor_infoframe_from_display_mode() but rather implement
something custom. At that point the person implementing that will also
need to know their specific infoframe maximum size.


Best regards,
Martin
