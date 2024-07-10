Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81E92D62D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 18:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5FB10E1B2;
	Wed, 10 Jul 2024 16:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jl0OEZe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601AE10E1B2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 16:22:26 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a77c1658c68so710093566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720628545; x=1721233345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=;
 b=jl0OEZe0tvUtxJFTJ1GZuVTkDawencZ8SdOTaIjkPh9xQJH78jprVliTE2kYjSye0N
 kiIlNCpZKjsRcmPlIb3CwkNrDVf9JEHidXDuxzQxta4f1TxiJIXiWVZ56k4QVPttUoQI
 P7A4RUU25T7VnX9zQbARSEgtDrIFLl4x27F17FQMoWq6jgKmirDAo1cDn3sXzuUrduPJ
 iiFUfeLHgkeP1jpHmfRWhRKLHpG7y8x9MnQ0WW73YKCNzJbHSyrfgCDY13OkvC4mpGh8
 EF9EZ+X1JCwjR3IY/Lae3tjKAHA55+OBeXGZbLS/yT3F9Vo0YWnyzpYRC+4p8aQo7lWe
 qJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720628545; x=1721233345;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s9iOTRxw5Qytoe+VupdvA/reAQiawx9dExWT989PAS0=;
 b=YUtFGKG/cqWQQAWoyFc87wNH/Ff7Lxht7Ce3H5Ec2nJj8X4mvt5eqSsYQDbyjGSP0r
 KEYTWcumZhGCXBcBBDK4WME990o3Pd8G4vxQ5uyRiNNqdoimsUT9l+AUrEp12TyyLP5u
 l+ydAGkOrquAzEpqk+s7rVIYd0SRLF1tUi8YA3GR0Ke6I2Ld3kGdCGOstkmM4RuB72nA
 pU9PvQJ54zoOrr2Re5EP9gvSyGptd9CeJXj5BvULhJ3UEithlZZxJtOKWnrRjNdHUj5R
 7pHiI8j+XKy4kVV7QuHGMOOO6csRZbXxsfbw1SLtLlV9IzY4KanIipc/7VoBxuGnq02c
 A2Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8+yNdfvNdFNRZ0e9fuOMWx9JWDpoOQR9zRNlZnFvnUGwPzlNyOJVNG3EgqGsizNzHertBI0AmoiXfZtseOAUCkzluJsYFzV2ew84lS0nb
X-Gm-Message-State: AOJu0Yz80JSqnx/dLryI0hyJjWb7MrSPTGp0Z+DJvXMML7xLeh+QQ92g
 0gC038xsXjCct6PONGrf7cQYEQfcR4dUCN0X8ze2xU942I2dFA84jv0mBQBK/wa1bmg+R+xPTa2
 PHpPcZNM0TabFF7o7/zW1idPl3TVB8Bjz
X-Google-Smtp-Source: AGHT+IFNvET9t815HfmplLSrRTvXphreJ0MNbUuIvztk3gg9+0wgDIzf2fKBnSwvpmHDF9a0kWQlSc1e+i3iMabrSK0=
X-Received: by 2002:a17:907:2d87:b0:a77:f5ca:f847 with SMTP id
 a640c23a62f3a-a780b68a20emr471719666b.3.1720628544538; Wed, 10 Jul 2024
 09:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
 <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
 <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
In-Reply-To: <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Jul 2024 11:22:13 -0500
Message-ID: <CABb+yY3ddp6Ex50yh3hZn2aQcEULvmFfd99xb7ZNVnTPn7=mUg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, 
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "fshao@chromium.org" <fshao@chromium.org>
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

On Wed, Jul 10, 2024 at 9:28=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Sun, May 26, 2024 at 10:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5)
> <Jason-JH.Lin@mediatek.com> wrote:
> >
> > Hi Angelo, Jassi,
> >
> > Could you help me apply this series?
> > Thanks!
> >
> Please get it reviewed by DT maintainers .... Rob or Krzysztof.
>
I see Conor Dooley listed as another maintainer, so I am picking it up.
BTW, I was not CC'ed on the original patch.

-Jassi
