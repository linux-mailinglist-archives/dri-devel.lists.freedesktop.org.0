Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88832ADA8D8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F9410E2BF;
	Mon, 16 Jun 2025 07:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KcilyJ9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C7D10E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 07:04:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2513808f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750057494; x=1750662294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1oEG3ysHjpdeGsIwj4yEvz5h+q+F2S7yXPMXla1Oxuw=;
 b=KcilyJ9kYJ7tINDmnDXSmJ0gMC7IZZIBfl+6fGXNi+BE6i5xA2//gGH9hIPSxPUEgI
 WTBGDkdvyDXXDpkIPiUPVyH8UjCOtOsFDtLFkihDjeH8876XrVjd3eg12VOIfRQ9FIee
 +2jnniCGnb4LOcaRL57I7ZM4a2CZ1oRgglqv+LKlyXllfpIM9Zn4YG4sIh7ODqQuN2iq
 ThdHC5kFX06d6U4rObJi7vehv5k0OxsqN4o8pMCvxEanDUfFp9NYB+opx3TrSvJlDGba
 OO/kiLf1tduX8xJKEetCBsCzLjQwx+Izb62MQxnh6FznBHPlZyKibepPoGQkvWlatHm8
 wyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750057494; x=1750662294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1oEG3ysHjpdeGsIwj4yEvz5h+q+F2S7yXPMXla1Oxuw=;
 b=uWYmkBDjN5YSApNOKBOaMr7nYVQcssqU0OECq8IUJWuNPC6/1RJQs1jLr+IaKYg/ym
 VW99iX1/+X4HEUfM2sEYF5FpWtdoT3kEL/Wo80ZfAYzJTE1lBgC34dDLEJy2puUNLeAY
 /cbx4WosArUK9WtPvYyzKlycxnYQuqspUFt4skqyjY8FlsTx5pDJ75UHw+oPYsssJYGi
 N7Kf/SCoiOsm75hzBXTymbnqzzQSWOjdfrfkSJCAnDx4OktHuDORoCSiHWPIg1xBREE4
 v5psQ6QeM8JWO3UEh+yyzXPclgbe5dQq8oAJDnUU3UlN/SY9lAv98lBEGWaIZ8ll1MFm
 Vdhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw7T2Bq+YOoIBq7T+EhNPJRQe0TvmGtW/OzSFAuuqR7VifROp32wrsCaiEH/HSZaH9vPlzrlT2TBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhsoO1sqjeaBEfeuGTmeSydiH1X1OXDLGkh9sPSO8kS0zBedC9
 1XqsCc5JSvYOs2p++DUJ+ZgUeGU5qOTJ7iiawvvzUmv4uFJCwVsLTktTLA278WNkQcZmHP97opY
 Fk74JagLMJlWmq711IPyV0oFX1QMbgR0=
X-Gm-Gg: ASbGncvCfL/wR0fO2FS42BGkDyt7dqWyK+qs6ETl+5WBCotDILdW0pfgmCeNAXlimQY
 UkihYn5hOWu2Ut8AKINMtnjhgBC+5s3nUAaz5o5JOnFG5qXEIY8f7eLUquI63BmHV+lxdiDDrL6
 mPuinZhwU0OzmnYmS4Z1sQDXFXpW2FB9VnJehmoEON7n3s5mSYyIsXFRc=
X-Google-Smtp-Source: AGHT+IH+83iGOUs6KGgkeXxI/hwC4jIryRkMXCNB4fAggGMDyUiBwodLdgfD+uL39t6KuVYf6bfWBRlf2qKO4sXhC4A=
X-Received: by 2002:a05:6000:711:b0:3a5:27ba:47a8 with SMTP id
 ffacd0b85a97d-3a572e99895mr6366894f8f.52.1750057494053; Mon, 16 Jun 2025
 00:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250303120455.90156-1-clamor95@gmail.com>
 <CAPVz0n0XSzxzkPocRVx6QF7xwmA4otSeSEiRZgJQ3oStyUBrLA@mail.gmail.com>
 <CAPVz0n2MLmHfVNb25=o1_woE7v16hoamwFbbT3ecE+BP1Bn9aw@mail.gmail.com>
 <6df6ecc4-088a-4b27-bebf-abc4560b00ae@kernel.org>
 <CAPVz0n1S2rWW_08FoL+jsVJEOkQ0JJZBu+bB2U5K=fF-g87Y0A@mail.gmail.com>
 <c2bd6a03-6f65-41ff-ad26-71287068f2f9@kernel.org>
In-Reply-To: <c2bd6a03-6f65-41ff-ad26-71287068f2f9@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Jun 2025 10:04:42 +0300
X-Gm-Features: AX0GCFupqmFcmgFpPCRebWxKUhnQj80OD2Gl-qOuC42ZRRk2nSdbfDWbKgqNKoU
Message-ID: <CAPVz0n1udjVZY3400hYMY07DjNKfOt4bwpW6He6A4qo_3pXtqQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm: bridge: add support for Triple 10-BIT
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

=D0=BF=D0=BD, 16 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 10:0=
2 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 16/06/2025 08:54, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 16 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE =
09:50 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 16/06/2025 08:42, Svyatoslav Ryhel wrote:
> >>>>>
> >>>>>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
> >>>>>  .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
> >>>>>  drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +=
++++
> >>>>>  3 files changed, 7 insertions(+)
> >>>>>
> >>>>> --
> >>>>> 2.43.0
> >>>>>
> >>>>
> >>>> These patches had no activity/feedback from maintainers for a while,
> >>>> so, in case they got lost in the depths of email box, this is a
> >>>> friendly reminder that they are still relevant and I would like them
> >>>> to move on.
> >>>>
> >>>> Best regards,
> >>>> Svyatoslav R.
> >>>
> >>> These patches had no activity/feedback from maintainers for a while,
> >>
> >> Really? No activity/feedback?
> >>
> >> What is this then:
> >>
> >> https://lore.kernel.org/all/567addb4-169b-4fd0-aabb-78ceded22702@kerne=
l.org/#t
> >>
> >> https://lore.kernel.org/all/ptyvn34i377pdu7mqital6v2bqe36oy3yprxb5c3hz=
tni7h52j@6eo64gzxvgg3/
> >>
> >> You already were sending such pings claiming there is no activity whil=
e
> >> we provide you the reviews.
> >>
> >>
> >
> > Then why these patches were not picked for more then 2 month if
> > everyone acked and reviewed them? I am pinging every month to remind
> > that they are still relevant and were not picked!
> So acking and reviewing is an activity or not? Because if it is not an
> activity, there is no point for me to keep doing it.
>
> It's not a question to me why DRM maintainers do not pick up such
> patches, but your message did not question that.
>

I will ensure that you will not get such pings in future.

> Best regards,
> Krzysztof
