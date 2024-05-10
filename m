Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106308C248C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E6910E353;
	Fri, 10 May 2024 12:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mLf7Fpp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03310E2A5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:07:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59b81d087aso485584466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715342870; x=1715947670;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dXNTsezNdWYZnRG6QT+6065F4f+qKGd7L1PVmOIUWNk=;
 b=mLf7Fpp90w1dF2OstivUfPJb4Gmt3AxFb5zlS236XePISGShdP8v5kjtZ1qQhgsIJ9
 dvqilJ+NWiY3BXSu5jnSIoR8JbhGTUb0V1c8XGaPRwokD8fbrpTi3p1PgOFKvo1swO/d
 iSoNp2iNII7XUJQ5Y0uOQ2n+LDtT6IKCaMKA64B7o0z9V4nOfP2huqOlnQo/gmmtUikc
 ZnCOujnnS54LzNYDkZW6bpxMwJJ73DOkWVB2bs3ulEdpkuYQQGOdHxHYICVaQfxDqmdB
 F9WfPRuz+0Wj4qAub2Y4W9jQk0i1bT4Y6Q4jKYBOgpTG0H18Ts5cOsIQI0nymZOrB4S+
 g3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715342870; x=1715947670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXNTsezNdWYZnRG6QT+6065F4f+qKGd7L1PVmOIUWNk=;
 b=JGOA+GWKn1uYeKv/LrxlO+2UCX2Iiy1YIFqi/yClswQQzhdC7y5vSU+5lbDK9c6Vtj
 BR1lXXZeN3iJzFPpqdBIGjiK9ldF1orjSROg8v5EWuGEz9A8pUhM2+RkKqWtsFGDEhOS
 o2XVLRzETFf610aY9bNslWOkwupXBKmI7+U9rGdRZOVJCg7WXi9A4ePE65ZVbvhlSQqN
 tJn9UqnpZomvRIbe8SFNbil+iTFjg48mZAkzgPk6FVVz1JBaXOzsVKFQezB4mdMzZApN
 emia9kxN1FsvwhmfTwi6NZ5WwuDMTlRL8EQT8BSbdcLoI9ic4XzU+SZgkHfOd2ZDl6oF
 uf3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwdm/QqKiH3q5lfSLQ62vNv97Bc87Zr2XuonEDCvStlzILLML6HjRj3i9yIqRp8HJlWwyi3eLKwullpnngSLbRmS2K/tbyUrim896IdcLS
X-Gm-Message-State: AOJu0Yy5zcBWVIaDOfNZMr/38GaqNZkZFH7Vd6K3pFO/sp7BkP/QSoE6
 hiZOjReLukAYvhFdrZFG5gXb2bahNqhX/OHgCkrg14veplYRnTMunug5nGBhIO1qG56kPGfFCa3
 aCmpW1byw0Y9UoQLPyZLPdAwlCuSqecKc55zxfg==
X-Google-Smtp-Source: AGHT+IEkHxt5s7tS/c4364g3R4A35U02lj+aw795XFRizFnPsmEQIe0dq0uquDwKAXYE18v7icvEqSCP0RKxgMk+VtM=
X-Received: by 2002:a50:9e61:0:b0:56e:23e3:bdc2 with SMTP id
 4fb4d7f45d1cf-5734d5cf9b4mr2375799a12.13.1715342870410; Fri, 10 May 2024
 05:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240509064336.9803-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAD=FV=Ugm+-ziY+8f93KOChvmkbf_MdxEOoyJP5WJq70m-aOGQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Ugm+-ziY+8f93KOChvmkbf_MdxEOoyJP5WJq70m-aOGQ@mail.gmail.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Fri, 10 May 2024 20:07:39 +0800
Message-ID: <CA+6=WdT=eoh+qc=O+YzxmugotZvkfcdXxiK4S9Mg++6EtR8vkg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] HID: i2c-hid: elan: Add ili2900 timing
To: Doug Anderson <dianders@google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

hi Doug

Sorry, This patch was accidentally sent when sending other patches.
Please ignore this patch.

>  Also: other than the main power supply, there is no difference between

> this and the ili2901. If you actually do have a main power supply,
> then you probably don't need a new table. You probably don't even need
> your own compatible string and in the device tree you could just
> specify:

> compatible =3D "ilitek,ili2900, "ilitek,ili2901";

> ...which says "I actually have an ILI 2900, but if you don't have any
> special driver for the ILI 2900 it's likely that the driver for the
> ILI 2901 will work because the hardware is almost the same."

In addition, in the previous patch, we have made modifications based
on your suggestions. "ilitek ili2900" and "ilitek ili2901" use the
same driver. Upstream may not be needed in the future. Thank you for
your previous suggestions.
[1] https://lore.kernel.org/r/CAD=3DFV=3DX5tk0tCcDa+vLnu0aoas1TDWuqvkMzM-27=
8dOCX8K1gw@mail.gmail.com


On Thu, May 9, 2024 at 10:35=E2=80=AFPM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Wed, May 8, 2024 at 11:43=E2=80=AFPM Zhaoxiong Lv
> <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> >
> > From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> >
> > ILI2900 requires reset to pull down time greater than 10ms,
> > so the configuration post_power_delay_ms is 10, and the chipset
> > initial time is required to be greater than 100ms,
> > so the post_gpio_reset_on_delay_ms is set to 100.
> >
> > Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> > ---
> >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> You silently ignored pretty much all of the feedback from the previous
> version [1], so I'm not planning to review this version.
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DX5tk0tCcDa+vLnu0aoas1TDWuqvkMzM-=
278dOCX8K1gw@mail.gmail.com
