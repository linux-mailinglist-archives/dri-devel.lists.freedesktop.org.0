Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90BE8CB094
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115BF10EB9D;
	Tue, 21 May 2024 14:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="fxwL5mVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE3310EB9D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 14:41:18 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-620390308e5so36924207b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1716302478;
 x=1716907278; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SB1OqSLlnsVqan3jm+OCZqKbhfuxNUZmUtXn7elwayA=;
 b=fxwL5mVr66wFDJ3WejWktjLcj+G0f0I3/PJlyxuNYXVR8A6QLiJSUW04HWI9FQdr+r
 eJQw9/cxByKrEFRwdHlcurhOdOIrhaOWCUhKECJYsO/XU+qw+oY8StGK8NE7RvYvBG/h
 pEMEuvPgkuGmlt8/o7fBGbHkS6YD+5u/4t9kXag/7mwrvc7yGkldFVVzmHtOdGfP41W8
 YEmslf0ze2/S/h3RgGv351po43Qj3R8O1aJzfR5LoZH2knuiAx5+a3Gi7oxAsgcnGpPG
 3SHWVT7e09rDoRFkzpNCfoqzlGQdBmKFyED/e+up/sH5wiWm33uImTe3KP5nfAKk6hZ2
 p2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716302478; x=1716907278;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SB1OqSLlnsVqan3jm+OCZqKbhfuxNUZmUtXn7elwayA=;
 b=uxHmXnXbIVOeNOvAyJcNhjnMimVQ6VLIc99INnRa2X3SafXHq/hyMNKar6cYlA6ZDv
 HdLH4iVqzerYGU1Q7CgrwpJGzbe66purTLezhQqV+Z3b211YzpQbnOUHWe8Ahs0JAoTN
 0AP3D1RiMYSgnUixzld/NSnQ/D8IveqELF6G22rAg8JvAVHqrALl/rYlk1JGb/mSfnV6
 NHVN9nGaMeRfnR2kdGmAi/HISkB0JaT51YGZ1YHaoEaPeYTEQ9wrBR/Hzv6zGEC63fkx
 K0V5Gw0F8iiZKGq4aScNDJIITSn7OrUU/ZgnrCrbW6dNrvW/u/tWFXI+COw8ZlTMmbSk
 B09Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcYATKSKncngXcGbeFXpp4dJQzDE/tNfbRgskodXhqMnUZUBz1jHrTcD3AycQ9thW7UA8K9lhTjQAV5xgesY5PKfvp+kY8xrI3BXzO/Vna
X-Gm-Message-State: AOJu0Yyv+kfsHy8zZP04+AJtgaJalBISE2Q6Qsgq2+qjxEkD7FRt8WUh
 XAzWXGbRHFNydsEhtqa9KcEXljEfbkrngjzyqDtiT0PyMFTiMNesKME5+uTJ7LaLiDwDcOmsXZy
 +546z4A==
X-Google-Smtp-Source: AGHT+IHy0ut7MLahz5/Rd+plz7XbJfeYLhR00dUv/pSGrdbzBkPRd0aquxEil9RoaaDeuoYM9qE42g==
X-Received: by 2002:a05:690c:893:b0:61a:d21f:a131 with SMTP id
 00721157ae682-622b001fd87mr389808047b3.37.1716302477601; 
 Tue, 21 May 2024 07:41:17 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e25927dsm53588527b3.37.2024.05.21.07.41.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 07:41:17 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-de6074a464aso3590512276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ZKH1Z1sbQnq37EFA0eXL7oraVc01+vbxpehx2nuTsurjawJdY3QrmpUqmuFfIxmeOcgw7gNByoky12y2RTiBhj4PtFzssFVPilfO6MB7
X-Received: by 2002:a25:ae45:0:b0:de6:1057:c85f with SMTP id
 3f1490d57ef6-dee4f2cf86emr30830551276.22.1716302476510; Tue, 21 May 2024
 07:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
 <ZkyPoIXBeBUqFJ48@phenom.ffwll.local>
In-Reply-To: <ZkyPoIXBeBUqFJ48@phenom.ffwll.local>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 21 May 2024 16:41:05 +0200
X-Gmail-Original-Message-ID: <CAAObsKAJvgg54zBEP-e3PKPLVeX+akZFJudjutjzVVZOJa-41g@mail.gmail.com>
Message-ID: <CAAObsKAJvgg54zBEP-e3PKPLVeX+akZFJudjutjzVVZOJa-41g@mail.gmail.com>
Subject: Re: DRM Accel BoF at Linux Plumbers
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 open list <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>, 
 Lucas Stach <l.stach@pengutronix.de>, Jeffrey Hugo <quic_jhugo@quicinc.com>
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

On Tue, May 21, 2024 at 2:12=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Sat, May 18, 2024 at 10:46:01AM +0200, Tomeu Vizoso wrote:
> > Hi,
> >
> > I would like to use the chance at the next Plumbers to discuss the
> > present challenges related to ML accelerators in mainline.
> >
> > I'm myself more oriented towards edge-oriented deployments, and don't
> > know enough about how these accelerators are being used in the cloud
> > (and maybe desktop?) to tell if there is enough overlap to warrant a
> > common BoF.
> >
> > In any case, these are the topics I would like to discuss, some
> > probably more relevant to the edge than to the cloud or desktop:
> >
> > * What is stopping vendors from mainlining their drivers?
> >
> > * How could we make it easier for them?
> >
> > * Userspace API: how close are we from a common API that we can ask
> > userspace drivers to implement? What can be done to further this goal?
> >
> > * Automated testing: DRM CI can be used, but would be good to have a
> > common test suite to run there. This is probably dependent on a common
> > userspace API.
> >
> > * Other shared userspace infrastructure (compiler, execution,
> > synchronization, virtualization, ...)
> >
> > * Firmware-mediated IP: what should we do about it, if anything?
> >
> > * Any standing issues in DRM infra (GEM, gpu scheduler, DMABuf, etc)
> > that are hurting accel drivers?
> >
> > What do people think, should we have a drivers/accel-wide BoF at
> > Plumbers? If so, what other topics should we have in the agenda?
>
> Yeah sounds good, and I'll try to at least attend lpc this year since it'=
s
> rather close ... Might be good to explicitly ping teams of merged and
> in-flight drivers we have in accel already.

Sounds like a good idea to me. Will check if the people that sent the
previous aborted attempts are still interested in this.

Cheers,

Tomeu

> I think the topic list is at least a good starting point.
>
> Cheers, Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
