Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13D87518E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AE910EC80;
	Thu,  7 Mar 2024 14:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UsEgFns/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311D510EC80
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 14:11:44 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-29a61872f4eso548652a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 06:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709820703; x=1710425503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfwer8XXczzwIW44mKPVsSf57S+ewbqnXIkK5KC8Spc=;
 b=UsEgFns/ZiEvKFFZS0Km9tEymZCPuY7qMDG6tDchia7MosKI2F3aoQePq9Y8oo8XbO
 esD1t8we7rcRHAGTpo0JJIWrhgmb/f/ZZAe7pRZ8D7Jps/7QT/pp94EDZj0nrFkr/5Av
 ODbVPw0idTTTZgUR3Jxh+hi4Hl5t6pev2S370y2RsIbTnsDP/eSisybWSoMsd7jOXzf6
 redxEvkDKDCMmuoUHEyvIdJjUiRyimqPbuKdhSyRUnbwj0+G5WT9SMbGuxshhCs5kpkL
 UpOuPC5wKi7l2Z1JH4wvSO9BKSBaxiQLfIpaBBP0c1ZKZ/uAbQJ2GGUM1OvBh+u3r8D3
 NmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709820703; x=1710425503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfwer8XXczzwIW44mKPVsSf57S+ewbqnXIkK5KC8Spc=;
 b=lcIMGwVNppUU775qTPvw7gEAn+sKoXmxx4P2UJgnavtcHDcM09vnxbZu6Aeud4uplA
 JTyPDr2HyGfynpH41FxXpgQPd89z7408ZqMvjyRr8Tq+2bfgVhxjnEyKnkz0rY53HMoS
 /gMkaJNBf61UJX6kCtTmmJb2llvyvvuiwx6DyLt3T/W15Jv7sbtOMTMd4ZICt4m8Nup0
 YpiPC6tTJ/FIA4rU6bDyH/P56B4IpVGH6jEHLcMuQafzM2Vgz51W+d3PR2ZhFBkx1Zip
 RxZ48EDB6v3l3vznMaVNXvpZKVvB3BO6BPtsvnqxoJxCyBLGVlbk2twxiVUoSe+aFBuc
 ODHA==
X-Gm-Message-State: AOJu0YzoiLKbd6TaFzp5yVUGceP7R1V9nQ7qLnyTiV50fo4VMvDucHyF
 WadFPSxbx4lmrUWinXe0h7UHjjbos67OvCdHiLqDRtKy4SdQhr6+Uf+py6Ryhfp4buLhFQ+yUDN
 W6ULKUs/oISowfhAe6pGLprWLLMtVahvtOYs=
X-Google-Smtp-Source: AGHT+IELOAw76zrd2EKPhQWJD44/OyTabAu/xyaX1leOvbMFK+PySmZNQkiJ28Dm/4qWJV3R2luyZUxa3K4jXysNSOY=
X-Received: by 2002:a17:90b:1256:b0:29b:5c2:76ac with SMTP id
 gx22-20020a17090b125600b0029b05c276acmr16829531pjb.5.1709820703262; Thu, 07
 Mar 2024 06:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-2-aford173@gmail.com>
 <63199ea3af86986545fcec4e81fa3a38f18a160f.camel@imgtec.com>
In-Reply-To: <63199ea3af86986545fcec4e81fa3a38f18a160f.camel@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 7 Mar 2024 08:11:31 -0600
Message-ID: <CAHCN7xK18gA-im4C16Ax-xevCOOqy1C8mXsUCEXNHnEPxxsuOA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: gpu: powervr-rogue: Add PowerVR support
 for some Renesas GPUs
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 Matt Coster <Matt.Coster@imgtec.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "geert+renesas@glider.be" <geert+renesas@glider.be>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "aford@beaconembedded.com" <aford@beaconembedded.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "mripard@kernel.org" <mripard@kernel.org>
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

On Thu, Mar 7, 2024 at 6:41=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.com>=
 wrote:
>
> Hi Adam,
>
> On Mon, 2024-02-26 at 21:45 -0600, Adam Ford wrote:
> > Update the binding to add support for various Renesas SoC's with PowerV=
R
> > Rogue GX6250 and GX6650 GPUs.  These devices only need one clock, so up=
date
> > the table to indicate such like what was done for the ti,am62-gpu.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 256e252f8087..7c75104df09f 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -14,6 +14,11 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - renesas,r8a774a1-gpu
> > +          - renesas,r8a774e1-gpu
> > +          - renesas,r8a77951-gpu
> > +          - renesas,r8a77960-gpu
> > +          - renesas,r8a77961-gpu
> >            - ti,am62-gpu
> >        - const: img,img-axe # IMG AXE GPU model/revision is fully disco=
verable
>
> A new set of items should be added for 'img,powervr-series6xt' and the Re=
nesas
> models along the lines of [1].

Should I rebase my binding off the one below, so it applies to your
branch or should I attempt to base it off the mainline?
>
> Thanks
> Frank
>
> [1]
> https://gitlab.freedesktop.org/imagination/linux/-/blob/powervr-next/Docu=
mentation/devicetree/bindings/gpu/img,powervr.yaml?ref_type=3Dheads#L16-19
>
> >
> > @@ -51,7 +56,13 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: ti,am62-gpu
> > +            enum:
> > +              - ti,am62-gpu
> > +              - renesas,r8a774a1-gpu
> > +              - renesas,r8a774e1-gpu
> > +              - renesas,r8a77951-gpu
> > +              - renesas,r8a77960-gpu
> > +              - renesas,r8a77961-gpu
> >      then:
> >        properties:
> >          clocks:
