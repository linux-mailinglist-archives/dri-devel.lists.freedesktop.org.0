Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D4A719B94
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 14:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D812810E54D;
	Thu,  1 Jun 2023 12:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9534010E54D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 12:11:15 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6af873d1d8bso620360a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685621474; x=1688213474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoT2foLXAVmUlox44AMnM3MUzIhqtjXlkD1FQwj687M=;
 b=afiUP8G9CFg8sailuMW4ZdfX+PIQ3PIEJy2TQwcYLLz454Q3ZA3a2lP7BbDLbsPOXT
 lXM0H3+fjZWiWyFUZuaH+yH045y3LeAeP+lQezotblde1V2+DzKYdGj5DP6STToR5u/z
 ML9RcN+lz2qEArFmP5MtK/z0MXoxi123jGjUDtZx8iqJP15LCmohQKzlnyLDAWVRIb1J
 X9iQdRijC5PhQVToBqOa+9jEGwaUMIeD716FxAbruQm3AvW0Qt4EaOI32L+rpVc2fhpG
 dUVlRTgQuAR0DUJvMOmB5v2GR+527QOVkbpGz+SKrkd+Y2F68fEV57O76Yr+hTkMNxO2
 1mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685621474; x=1688213474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoT2foLXAVmUlox44AMnM3MUzIhqtjXlkD1FQwj687M=;
 b=ELA8xg6ri8ta9Ddoi2u0614ETie0l44gXhyuN0FVfJA8g7jWoJe/igfsAl3MIyIRde
 b0zdZTKpMMdZSd/TWmy0WMP5a5zbZZ5hgjXtTpWi8SSPAGfuzPpLcN+rWucAVrM/2aQw
 ZWhxX5v3UXkInCV2nt2Za/hUPCYpQoeE/t7h0+zdW7mv3KLAlezLzPrEdvvMHW2hvas3
 HHEeJMY6S/IyQodqffkDKY4jbFhuww+bZ91Z6Ueb0g3Y31hmIHPFXIaQaWPdIcZPCgnC
 FQp1LcIo5JHZM3ytbRyoBYbP2Q70hZvnFOnVBUisAoz6v0LhBhpt5O6rL4+IsAIJr8pp
 IAGQ==
X-Gm-Message-State: AC+VfDxSuE3iIZjOoQjeefPZOik6VS8TpwTXHcB8F0GK62CFnBdF6W/F
 2hiGXJQMT2kSmFTQKU5J8XABRktd8zTYI5u6alk=
X-Google-Smtp-Source: ACHHUZ4jtevYqPBN3ne5HABV3cam2atU8/Z9Obbn+kJDK6nK8E1QLzW8q4CDS9N9udzy8YE48cuMaZrRfGdYvZLuf2A=
X-Received: by 2002:a05:6358:3a19:b0:127:c640:5c05 with SMTP id
 g25-20020a0563583a1900b00127c6405c05mr3726262rwe.13.1685621474367; Thu, 01
 Jun 2023 05:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230531184527.1220305-1-l.stach@pengutronix.de>
 <20230531184527.1220305-2-l.stach@pengutronix.de>
 <CAOcKUNX86mqvpsT5LgertJcqdXCftTBEPRnA6dCuBrOXyv+=hQ@mail.gmail.com>
 <62984473-389f-1078-c914-550b8a193e5b@denx.de>
In-Reply-To: <62984473-389f-1078-c914-550b8a193e5b@denx.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Thu, 1 Jun 2023 20:11:02 +0800
Message-ID: <CAOcKUNWbr=H2ybQhkU-vZvSwpZKLjcdeNPNL4P3ua+ZFsB4rSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: lcdif: force modeset when FB format changes
To: Marek Vasut <marex@denx.de>
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
Cc: NXP Linux Team <linux-imx@nxp.com>, patchwork-lst@pengutronix.de,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 1, 2023 at 6:33=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 6/1/23 08:24, Ying Liu wrote:
> > On Thu, Jun 1, 2023 at 2:45=E2=80=AFAM Lucas Stach <l.stach@pengutronix=
.de> wrote:
> >>
> >> Force a modeset if the new FB has a different format than the
> >> currently active one. While it might be possible to change between
> >> compatible formats without a full modeset as the format control is
> >> also supposed to be double buffered, the colorspace conversion is
> >> not, so when the CSC changes we need a modeset.
> >>
> >> For now just always force a modeset when the FB format changes to
> >> properly reconfigure all parts of the device for the new format.
> >>
> >> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> >> ---
> >>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
> >>   1 file changed, 20 insertions(+), 6 deletions(-)
> >
> > LGTM. If the patch shows up in dri-devel patchwork, I can get it, test
> > it and provide my R-b tag if appropriate.
>
> Aren't these two patches the ones you are looking for ?
>
> https://patchwork.freedesktop.org/patch/540443/
> https://patchwork.freedesktop.org/patch/540444/

Yes, they are. Thanks for the links.

>
> Maybe PW didn't sync when you checked, it takes a bit of time for
> patches to show up.

I used https://patchwork.kernel.org/project/dri-devel/list/.  It turns out
the two patches are not synced at there yet.
