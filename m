Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51559B143C
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 04:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F6110E230;
	Sat, 26 Oct 2024 02:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Llf37sAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B27C10E230
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 02:48:55 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e2e340218daso2865719276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729910934; x=1730515734; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rLVQ27VOCMknffxx25JGXMV6frMFgYla9aiZWwKdr8U=;
 b=Llf37sAcbM+1m9yFJABxBd05HVullRvlX7w4PPwH4KVJoIV9aXzY+o9KcZCPXOXRaR
 lnUVXaonTNx0riHrfJJwSSjNJzbSheJzRDV35pqT7mdZeMDIHrZr6lgcHX1OQByL+eif
 laAhg5CZ5mPQ3pkyRyTaMHkwmIa3MYgZxeUZ/ycrQJUlnzUY+mPdrUWaUJxP/oZsWUwu
 Oc+j3YN8gGJOOSC1BVjNyPadg2BGCvs+zQXtXmecP6h04ukV/2Sr5RLA2HW/sFXp8xak
 LGXRvwBuSHLuOe+mOa4X8gSt/KNhntZlHbsbf72UY/PogKkFUNa/kUf/K8yfUyTiackt
 iwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729910934; x=1730515734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rLVQ27VOCMknffxx25JGXMV6frMFgYla9aiZWwKdr8U=;
 b=j+tWQF10bBNPC2bp0Vz/g2rG/bI0h8mpHABWrrgpGsXXO4QRqFqpfggi0Wsr1D/X7Q
 r6N7gHn9a9XEVyywulu8dx8RPzwRs3na0Lw7XtKoSjOzD/1w93Q1Ss+8m/e6M8MRSep+
 +md6XVkKDIWD5ev1Dw3yyDtbN9lpkVwae1ZwTndd6aw+4bMRcXobTc7/zVD4w48Uwzcx
 tEtxV8Vl5ngjBuv1Kr4VXyDqWU4TGHo2m1g5I/pvgfpY7YtAZ10zx2+tmyLsPLNOB9Z4
 We0xkDjcO13fK5ztJSygRN7ZoEJJqLIEzwyrAD6yfyB7hqB2hR9bGVnkc140+0jk6RTg
 Q/BA==
X-Gm-Message-State: AOJu0YzZaPdYqWgP3+1epjbSRwVBFhc0DcbUJPtKVu+LoMNhWTBoEY0H
 GmT0HNFyQBpQ4Il0XS6Lj4zV8pk6Kl0PdEgIIPRI6d3ne1frWPKGelgRmhJ3XIZXK+DItHfrOJZ
 1cee/GhIz1WS+9yeaCkhK7IhjcAE=
X-Google-Smtp-Source: AGHT+IGNVU+iPCUi/JTPbfDvpTBCoDJRfzPrKIpOWnCAhSH+vWr1EWlM8WbfE/cmUxNAj99fF8PW5SYEvNWg5oPUCBs=
X-Received: by 2002:a05:690c:ecc:b0:6e2:c13e:20e8 with SMTP id
 00721157ae682-6e9d8aa778dmr16307017b3.30.1729910934466; Fri, 25 Oct 2024
 19:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241020083836.175733-1-ryan@testtoast.com>
 <172942408877.2805126.3289122620465684612.b4-ty@linaro.org>
In-Reply-To: <172942408877.2805126.3289122620465684612.b4-ty@linaro.org>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Sat, 26 Oct 2024 11:48:41 +0900
Message-ID: <CAG40kxHNTuMEDwRMSNtwaS1RSVrfFE+qyREC4S6MfDyp8iLuCg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm: panel: nv3052c: correct spi_device_id for
 RG35XX panel
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chris Morgan <macroalpha82@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000bdfa55062558461c"
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

--000000000000bdfa55062558461c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Unfortunately, I've found that the recent Anbernic RG35XX Plus uses a new
panel labeled `YLM-LBV0345001H-V2`, which is not compatible with the
`WL-355608-A8` in its initialization sequence.
Thus, the name `rg35xx-plus-panel` is no longer a unique identifier for the
panel.

I think it should be renamed to `anbernic,wl-355608-a8` to distinguish
them, and `anbernic,ylm-lbv0345001h-v2` should be added for the new panel.

Best regards,
kikuchan.

On Sun, Oct 20, 2024 at 8:34=E2=80=AFPM Dmitry Baryshkov <
dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, 20 Oct 2024 21:37:41 +1300, Ryan Walklin wrote:
> > The Anbernic RG35XX devices use an SPI LCD panel from an unknown OEM,
> > with an NV3052C driver chip.
> >
> > As discussed previously, the integrating vendor and device name are
> > preferred instead of the OEM serial. A previous patch corrected the
> > device tree binding and of_device_id in the NV3052C driver, however the
> > spi_device_id also needs correction.
> >
> > [...]
>
> Applied to drm-misc-next, thanks!
>
> [1/1] drm: panel: nv3052c: correct spi_device_id for RG35XX panel
>       commit: 45608a3eb4902f32010a8328c0a01ccda4b38c9b
>
> Best regards,
> --
> With best wishes
> Dmitry
>

--000000000000bdfa55062558461c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Unfortunately, I&#39;=
ve found that the recent Anbernic RG35XX Plus uses a new panel labeled `YLM=
-LBV0345001H-V2`, which is not compatible with the `WL-355608-A8` in its in=
itialization sequence.</div>Thus, the name `rg35xx-plus-panel` is no longer=
 a unique identifier for the panel.<br><br>I think it should be renamed to =
`anbernic,wl-355608-a8` to distinguish them, and `anbernic,ylm-lbv0345001h-=
v2` should be added for the new panel.<br><br>Best regards,<br>kikuchan.<br=
><br>On Sun, Oct 20, 2024 at 8:34=E2=80=AFPM Dmitry Baryshkov &lt;<a href=
=3D"mailto:dmitry.baryshkov@linaro.org">dmitry.baryshkov@linaro.org</a>&gt;=
 wrote:<br>&gt;<br>&gt; On Sun, 20 Oct 2024 21:37:41 +1300, Ryan Walklin wr=
ote:<br>&gt; &gt; The Anbernic RG35XX devices use an SPI LCD panel from an =
unknown OEM,<br>&gt; &gt; with an NV3052C driver chip.<br>&gt; &gt;<br>&gt;=
 &gt; As discussed previously, the integrating vendor and device name are<b=
r>&gt; &gt; preferred instead of the OEM serial. A previous patch corrected=
 the<br>&gt; &gt; device tree binding and of_device_id in the NV3052C drive=
r, however the<br>&gt; &gt; spi_device_id also needs correction.<br>&gt; &g=
t;<br>&gt; &gt; [...]<br>&gt;<br>&gt; Applied to drm-misc-next, thanks!<br>=
&gt;<br>&gt; [1/1] drm: panel: nv3052c: correct spi_device_id for RG35XX pa=
nel<br>&gt; =C2=A0 =C2=A0 =C2=A0 commit: 45608a3eb4902f32010a8328c0a01ccda4=
b38c9b<br>&gt;<br>&gt; Best regards,<br>&gt; --<br>&gt; With best wishes<br=
>&gt; Dmitry<br>&gt;<br></div>

--000000000000bdfa55062558461c--
