Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80729868EC1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC79510E52C;
	Tue, 27 Feb 2024 11:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TQjuoT57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FB510E52C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:26:42 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7c48ef54d9bso87200339f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709033201; x=1709638001;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FmS1fmjtFOepekF9OghDxYFpAXEvAMzTVh2ZnQm3g+0=;
 b=TQjuoT579tUK8N+P/6YaiE3nVJ5vt0h3tqnbXg0gnxiKBTSUMgJkTCw1PM+1bjzdHX
 xH2AbHJcP6IDTAZoPZuekeuaao5+CKTYe/PblNFeiO15CSfig3Hac2aBNcGPgrSGspm0
 Y6NICT3Ec3URhQN/IVzfXuIpdjWaX/21nSpF8qTCvl1iqDU7hQJgBxpUN+2tQ2USccAK
 IfBFACjs9YgsiwbKKKh64H7EaYSy8Rgtd6xkfjtoiqQnivs9vzDaW0q9EZDBBy0k+gRT
 oehD/ZYRTRYXgtpFY2hBOjBL1K1LVa9z7hIaIL1xA8aCrYLj+9hDCfjjYS7GnXftqdqC
 zBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709033201; x=1709638001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FmS1fmjtFOepekF9OghDxYFpAXEvAMzTVh2ZnQm3g+0=;
 b=XQAuOhPyDU7lcUmYGAKMeH2ErPhTqr0cTLiDorRdcZcrJNOTYX6YYTR5043M3ZtMWU
 ph/xgFH9Rsu9r4sLQwDzkczp1ClXIjkRXEvkgXKY+sg5A4gkuY44vF6BZGbFhhRnKe/Z
 u2rXjMIIbzCoeK084FdxHoIzCdzowL+CRB36+XGx+GTUEPfuFlyEmTHW17UrpXVphv9K
 SxYq3Xw/2Wr8Orif/Sa661Pw6YS49jn0PtYMY6JliI2LnGTxVrIzJxxfj7erfoFC6MI+
 xg8olExmqAuptM3pd/gP66k8kQ13glHUVrR3cmSO0ImqHmyaujyIecx8WuRoJLJGJgS7
 wcqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzwCMAkO8/DzjIVaMH9NtDvDGDvfS+W6rRfS6CfTTYmCEXuIqGZJC5AZX0KEBnn7dZAbEzwRVO6DcSav1aRfwErGBjMqdEw9FwfnM2v018
X-Gm-Message-State: AOJu0Yw6GJSkX+QCpqp6jyCb67tDm9sw57JpNVh8DamMMXZqmu05T7hk
 pgQlz8FzU49kuwT6So9WNZ38Cjx39ll00/Nmels5QMLHoWnhSdO308e54vH6HJvCA1VjYeZ9ZFR
 qX2WSdz8uLiUZuRtWcrPBoOD0UjnMFPNAG+F+
X-Google-Smtp-Source: AGHT+IE2fW6rEQg7HcmlpVe7tfHw8EZXpdlB0fKwjX3otFyjepZ7vQ2TUz43JF/WSjntx66KZF//1lllOC+iM+l+o0c=
X-Received: by 2002:a05:6602:f10:b0:7c7:b5a6:42f4 with SMTP id
 hl16-20020a0566020f1000b007c7b5a642f4mr8390166iob.3.1709033201056; Tue, 27
 Feb 2024 03:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-10-panikiel@google.com>
 <310cefcb-a4d5-4f4f-a482-ba2ff08a57f6@linaro.org>
 <CAM5zL5rQsYuo3+rW9+YPmvUg9PtNiR0Dy59e8Kf787ranfLh3Q@mail.gmail.com>
 <e2ae7bfc-fb51-4a60-bb52-c6ccca7a4189@linaro.org>
 <CAM5zL5pz0K5ro4-UjiYojM4h9Lqo_af5ZmH1FoZ_ajde_3+Dcg@mail.gmail.com>
 <e210b318-dcd7-4c0e-b08e-e1c4da1a8cd9@linaro.org>
In-Reply-To: <e210b318-dcd7-4c0e-b08e-e1c4da1a8cd9@linaro.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Tue, 27 Feb 2024 12:26:30 +0100
Message-ID: <CAM5zL5rDKMbgN7P=KF2ZayN5ipUB7AYpVccZdLunSUNTR4_f1A@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] ARM: dts: chameleonv3: Add video device nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
 ribalda@chromium.org
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

On Mon, Feb 26, 2024 at 6:30=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/02/2024 13:27, Pawe=C5=82 Anikiel wrote:
> > On Mon, Feb 26, 2024 at 1:07=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 26/02/2024 12:09, Pawe=C5=82 Anikiel wrote:
> >>> On Mon, Feb 26, 2024 at 10:15=E2=80=AFAM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> >>>>> Add device nodes for the video system present on the Chameleon v3.
> >>>>> It consists of six framebuffers and two Intel Displayport receivers=
.
> >>>>>
> >>>>> Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> >>>>> ---
> >>>>
> >>>> ...
> >>>>
> >>>>> +             dprx_sst: dp-receiver@c0064000 {
> >>>>> +                     compatible =3D "intel,dprx-20.0.1";
> >>>>> +                     reg =3D <0xc0064000 0x800>;
> >>>>> +                     interrupt-parent =3D <&dprx_sst_irq>;
> >>>>> +                     interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
> >>>>> +                     intel,max-link-rate =3D <0x1e>;
> >>>>
> >>>> Rate is not in hex! Rate is in Hz, at least usually...
> >>>>
> >>>> Fix your bindings...
> >>>
> >>> This is the DisplayPort link rate, for which the allowed values are
> >>> 8.1 Gbps, 5.4 Gbps, 2.7 Gbps, or 1.62 Gbps. The standard way to encod=
e
> >>> them (used in the DisplayPort DPCD registers and this device's
> >>
> >> Then it is in bps or some other units:
> >>
> >> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas=
/property-units.yaml
> >>
> >>> configuration) is by multiples of 0.27Gbps. This value (AFAIK) is
> >>> usually represented in hex, so 8.1Gbps would be 0x1e.
> >>
> >> No, the value is represented in logical units. Frequency in Hz. Rate i=
n
> >> bps/kbps/etc. Voltage in volts.
> >
> > Okay, thanks for the info. So if I understand correctly, the max link
> > rate should be represented in bps in the devicetree, and then be
>
> or kbps

The one that's already present in dtschema is kBps (kilobytes per
second) which isn't right for this case IMO.

>
> > converted to the per 0.27Gbps value by the driver?
>
> If driver needs some register-based value, then yes.
>
> >
> > One problem is that the values here are too large to be represented in
> > bps (since the datatype is uint32). Can the property be in Mbps
> > instead?
>
> Can be. You can submit a patch to dtschema (patch to DT spec list or
> github pull request) adding '-mbps' as well.

I sent a PR with both kbps and mbps.
