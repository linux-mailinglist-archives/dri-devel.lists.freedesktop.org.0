Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58B85BD44
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 14:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289BD10E3ED;
	Tue, 20 Feb 2024 13:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lRhPtfZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A67D10E3F1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 13:35:48 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60866ce76dfso5078597b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 05:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708436147; x=1709040947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80bDR9xsJVYz/T1iI+xnPV8UhHBUEFxKf9UJFof0JFA=;
 b=lRhPtfZ3CEwlE4watSHiZ4Yn8hZCTWQEnq4ZH4CpdvIDGq6QPiNquCr5ZAGWmKBdAD
 mYFFKrVxYwPn1WOvHUQCNDqFGiSfh21yh5ARcvnz1WmAw0OzHtfpjzAoKKj2uvNc9AUl
 /YNLY1rZqCrBEABTF/l5ZmqJdHWf1cc01qfmEmdOLs6EP7Y79thD7Nn6DZErNe8w+Mnz
 17dlEpIWkmv22nt1PUlyu1WZjgmEY/BdvhW1Nk87341BO9Kg6b7ne8vIa0D6ryPLCxC6
 OhazQTvfULPtSiEZXeqVMIHIvodjWx2QJo2deSki2a7dg160nn4rwIVjoBnijGkqC450
 2BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708436147; x=1709040947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80bDR9xsJVYz/T1iI+xnPV8UhHBUEFxKf9UJFof0JFA=;
 b=ivDMLfv3uy2Zw+jjQdFJUD1XFiAR0Yy3dvlIXnSTVBgA3UxfgH3mwhXfU33Oyu2B1j
 euipuugpoDHLHHpMGsvKNFeyMIiJHiajjeHZObfgXZjk2lROWIT6EnAnTQvzekNhX/HH
 Egwpvw/H2mx77KojAHYANzJ67yKbWE0mZE2QFq5WXDtskW3rcjd3xXK/abXpObJXcqH6
 h/EQCP2CeLLH/4/4//HE2wsy4SZ9CW8gV9VMbvSI/njvSzv0H3adu3IJpPEinI9Z/AIr
 G9qataHdAkKpVbLik7+KPgq7/nL0i3Lh2lvCf3Fcxh7RZEvbspJg6N7IcrxAauuzV+n2
 CrQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9+9/BVOsAkvdiC3Y0q53KP+GXK0YzlNygFaSuibVpKijUxBYI+yg81/xMMHPs6+T/9YuAGDuIMHEHMmguMsbRgMdUXCjfTEnVq0z4sVFk
X-Gm-Message-State: AOJu0Yw9sJWFfkdWRIz8Mm1z1/yDoERET4OmX/ono71QsPl6p4EH6y67
 nYfF0EfS1B31xkbotnQmhnOl8JiMdk2RRS1J37pDJMH5dHvTwuKW/La21Q5fV0mdb3QaMGja0VR
 T5C+oo53nwuPxpPVaEWzORmmz/s68iCFBxa1gVw==
X-Google-Smtp-Source: AGHT+IFblLCJUAfvYsxAzrxnfj6+lmkywotENdKnj1jtMtxOZ6aZ30kx1UQMoBV7aylB0LH/E8+wrC1HtazKHPBbsVw=
X-Received: by 2002:a81:7994:0:b0:607:7e73:fce1 with SMTP id
 u142-20020a817994000000b006077e73fce1mr16601552ywc.26.1708436146800; Tue, 20
 Feb 2024 05:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-2-johan+linaro@kernel.org>
 <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de>
 <ZdRTx2lmHBVlcLub@hovoldconsulting.com>
 <1afc87c-2c1f-df10-a0c8-2a267d44122@inria.fr>
 <CAA8EJppH9ey97yKFUccNLHhMKs3eUS55+rY0tXm_a6KGp9jtug@mail.gmail.com>
 <4938592e-3f7c-c1ae-dce3-fd1ca363296@inria.fr>
In-Reply-To: <4938592e-3f7c-c1ae-dce3-fd1ca363296@inria.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 15:35:35 +0200
Message-ID: <CAA8EJpq88ZKLFBuAvDuDSMD_DkPpMmBDZG_kQyUrSs-Noqm2SQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Johan Hovold <johan@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
 Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@gmail.com>
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

On Tue, 20 Feb 2024 at 14:56, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 20 Feb 2024, Dmitry Baryshkov wrote:
>
> > On Tue, 20 Feb 2024 at 13:52, Julia Lawall <julia.lawall@inria.fr> wrot=
e:
> > >
> > >
> > >
> > > On Tue, 20 Feb 2024, Johan Hovold wrote:
> > >
> > > > On Mon, Feb 19, 2024 at 06:48:30PM +0100, Markus Elfring wrote:
> > > > > > The two device node references taken during allocation need to =
be
> > > > > > dropped when the auxiliary device is freed.
> > > > > =E2=80=A6
> > > > > > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > > > > =E2=80=A6
> > > > > > @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(str=
uct device *parent,
> > > > > >
> > > > > >   ret =3D auxiliary_device_init(adev);
> > > > > >   if (ret) {
> > > > > > +         of_node_put(adev->dev.platform_data);
> > > > > > +         of_node_put(adev->dev.of_node);
> > > > > >           ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> > > > > >           kfree(adev);
> > > > > >           return ERR_PTR(ret);
> > > > >
> > > > > The last two statements are also used in a previous if branch.
> > > > > https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/gpu/drm/=
bridge/aux-hpd-bridge.c#L63
> > > > >
> > > > > How do you think about to avoid such a bit of duplicate source co=
de
> > > > > by adding a label here?
> > > >
> > > > No, the current code is fine and what you are suggesting is in any =
case
> > > > unrelated to this fix.
> > > >
> > > > If this function ever grows a third error path like that, I too wou=
ld
> > > > consider it however.
> > >
> > > I guess these of_node_puts can all go away shortly with cleanup anywa=
y?
> >
> > I'm not sure about it. Those are long-living variables, so they are
> > not a subject of cleanup.h, are they?
>
> OK, I didn't look at this code in detail, but cleanup would just call
> of_node_put, not actually free the data.

Yes. The nodes should be put either in case of the failure or (if
everything goes fine) at the device unregistration.

--=20
With best wishes
Dmitry
