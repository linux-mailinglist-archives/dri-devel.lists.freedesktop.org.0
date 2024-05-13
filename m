Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C2B8C4751
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797F010E508;
	Mon, 13 May 2024 19:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZFUZITJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81E110E167;
 Mon, 13 May 2024 18:59:59 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso2830192a12.3; 
 Mon, 13 May 2024 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715626799; x=1716231599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qeyh6jTBpW+bB/SoF1garPwJ3lruZJDei8hl9Vs8MJM=;
 b=aZFUZITJ1qioAsATsf9B4wWE3aPViJTngK/2Mg8rDjhWU7kCUv66IbGWrTvk+osrMV
 CDuOxfQlCVX5fEAeNgZNXdSwrOIBOQJvcHoXTWQ9MKfcBvm3dv4xCNLL3BUa4cnVrwLV
 QzlmSDr/WiPxKqkbI+1+ep6HtFQvDcEptigYj6Q1MlYm82XbzWMLi9u1amM+FrcumXcY
 uqGVBmKTLBTJWFHf0PRjLaITGkEF7Z60lCSKHYvFWTl53RfzgtGoexeHBU6/Xume3w74
 FKfyG5wN53cTuT4+DLLJHg+7fjIpPsIIg/BcW4dCBDzyAKQsIJ0DMaaNrkQtvpKWMpfm
 l/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715626799; x=1716231599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qeyh6jTBpW+bB/SoF1garPwJ3lruZJDei8hl9Vs8MJM=;
 b=RCito58MAoHJhh7Ev5noUZqlLrfXjJxkAuCqPr/gtWHL+3CtRkMMU9TdhXq0gVGICN
 34TJRROnNZ4WexE11IxyvlEaCxHj54NjLpnLw7GDQwILRrzL0UoF2ZIUN2r/W5RTV9fv
 QA7RtCTYEx2rh8pcM6bM1h9cjgs/D+ztPIZdLvvkia67TYF9jVrzBBui6DRwscqMMyTC
 qowctzhogS5Iz7QfPxEen+qkLIyRlEE0axYT9HSAl4oXeXu2PThNzpNPBxb/xIOxuo4O
 tj7lJ0MbPIpYlBdN456JdwjYP3O0vf3nE9CVAaO14d4hLxDXz3JK6J1nC0UnpP2YveAK
 ONYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoQqC+tUcKQCkFvyo/6Ix5y9ppk+f7ribmL4213DLAL3wyfO8wElRbdYCC8Gt/I3nUAIW12tVsMfQ51Cq87eyx1dJlxi53e0GZ71YKbglpon5g9A5LaHTIcfNA/RoquYxi3FdR8beVd661YuSfAA==
X-Gm-Message-State: AOJu0YwYjodqwJN3p9htZ3NKiRCJ6tGLe53h9xMBSIz6E4yGLd6uKggS
 JyuixcjGVdPmrsQ3tfNSprVcNSpXa+AtBRduuLlteBRB4TUC6r3abu287cpr4kvzptbmowx/FzD
 0LuPWHLSGUpLt2e1LmaOPf/JV0QQ=
X-Google-Smtp-Source: AGHT+IEMriwSIpproADvMZpL90cXPOhu/DOPpw7ADo4w+aadWfm5noHVyAYS5tBigfTfrWd8hGqfvUNTiOcHP3xTzaQ=
X-Received: by 2002:a17:90b:386:b0:2ae:c590:b06f with SMTP id
 98e67ed59e1d1-2b6cc758fc1mr8114996a91.18.1715626799007; Mon, 13 May 2024
 11:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240511000203.28505-1-marcelomspessoto@gmail.com>
 <20240511133717.23263f55@canb.auug.org.au>
 <20240511141615.6074b4e3@canb.auug.org.au>
In-Reply-To: <20240511141615.6074b4e3@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 May 2024 14:59:47 -0400
Message-ID: <CADnq5_M=eExVCby7v77fuRPD+3-fJTLLW4jK_vUSS23x_9+bOw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: fix documentation warnings for mpc.h
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, 
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Sat, May 11, 2024 at 12:22=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi Marcelo,
>
> On Sat, 11 May 2024 13:37:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Thanks for doing this.
> >
> > I haven't tested it, but just a couple of little things:
> >
> > On Fri, 10 May 2024 21:02:02 -0300 Marcelo Mendes Spessoto Junior <marc=
elomspessoto@gmail.com> wrote:
> > >
> > > Fix most of the display documentation compile warnings by
> > > documenting struct mpc_funcs functions in dc/inc/hw/mpc.h file.
> > >
> >       .
> >       .
> >       .
> > >
> > > Fixes:
> > > b8c1c3a82e75 ("Documentation/gpu: Add kernel doc entry for MPC")
> >
> > Please don't split the Fixes tag line and also don't add blank lines
> > between tags.
> >
> > I also appreciate being credited for reporting (unless you got a report
> > from somewhere else as well, then maybe credit both).
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Now tested.
>
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20240130134954.04fcf763@canb.a=
uug.org.au/

Applied and added/fixed up tags.

Thanks!

Alex

>
> --
> Cheers,
> Stephen Rothwell
