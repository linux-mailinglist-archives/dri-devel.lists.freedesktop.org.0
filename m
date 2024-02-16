Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAAA857E6E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850210EBEB;
	Fri, 16 Feb 2024 14:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="SoxoAcwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8005710EBDB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 14:02:23 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-785d48dc0a3so145497385a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 06:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1708092142; x=1708696942;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFBgUAAUEN/cLgDxtF+HzukYwlFpuLG9I2LKGjp3pXQ=;
 b=SoxoAcwS763aGO58R3Kf6R4F7FwR4At6hf/ulqYItUqB3uviBur5kCbcdGsFO5bEmO
 UNQG6kBKUCYWRfUx4LuFR6x670xoULp8NRNo/Beui1FQ0L1bQbeW+8+6ACw1uWklqIzL
 PA4f7YEFU3UdeEIiQllCnMYtxp+4wUGsQbU9kiHlSVnh4KQW2wTlRdtpF3pxK7EdQz/V
 Js2dT6eudaMEU2PZ6A6o1UfC6yX4WAWZcSAMP3YUgQI8YxXD/FRCNPb3++4mX6QXPBiR
 4SZ0lTGB5BHq1CBHK4wSXkzn/Da6PbRy7zvqXNkqMjWMwiU6W1oSeFNNNS/lblfCmFYW
 +cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708092142; x=1708696942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFBgUAAUEN/cLgDxtF+HzukYwlFpuLG9I2LKGjp3pXQ=;
 b=qovPHwcn+uE8gI0/FPPY0RGHGB1aRtzppmUV7Yurq47TgPhepvvWdYMLjv8kKzeAGL
 glaHTi0ngONMWF6x9QqxpHQVSV494jhQPx2R7IsoFBEVIn42YdFObyOyKzqWvIAbvlxN
 ZUZI+G39auvixTvju2JJfh+cth22oz37Xha42b7l16faLxVGAYPIdOmsrBZVnUlY1uz3
 2McUfc6ZjmynwlRkfZXQZxbyqrzFLZq5I0Kl2pFa1k0NIlZrGQ+lStbvapQtw1YGDSYg
 MLbxJl6izyDrdm6ozoOUfIhW6mOEji5Cg2d/s/gaVqV/47oxZnxXA0JspK2YDYIUSRQh
 U3ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaN6pSs76vnxablUdQof1wLuiwD0iAql1pYdvHci6NeIAkzgMUOHqvQAw3K3dwIUwn3OePgYNAsUR9tkLBS44pZ3YzxhhxWhr8ie1E+Qwo
X-Gm-Message-State: AOJu0YwHohQ9gdK8tL4YrIj0dWKVwLy5FTwVR3OrrM1iErzV8i7Sv6of
 wncd0Zh40I+DqI15jeC3yMaRaTAdEVgBu7+9IZJR6IrX63cinECFNBnPOBHarWBi3j/lNH4+mOa
 bIgjprNFv3J1Amak2YlW4QxzzzoMv26pk8iT7AQ==
X-Google-Smtp-Source: AGHT+IGcSoJ+2K5yvULHav0aWsEOCSmQfdoZoFCExKbeUxGKS13t32Iabr1wSDMwUBxYJT8cbluJgDZnNDxdPV1vq/U=
X-Received: by 2002:a05:622a:38d:b0:42d:de82:1438 with SMTP id
 j13-20020a05622a038d00b0042dde821438mr1801013qtx.0.1708092142014; Fri, 16 Feb
 2024 06:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20240213-tidss-fixes-v1-0-d709e8dfa505@ideasonboard.com>
 <20240213-tidss-fixes-v1-1-d709e8dfa505@ideasonboard.com>
 <20240213110440.13af335a@eldfell>
 <bb8089cd-2a57-4ed0-a8bd-2140a89b0887@ideasonboard.com>
 <ZctCCCJORdDEaDl1@xpredator>
 <CAPj87rPpdOQLLu5oGVfqDUh0_j9NXqc3XgZe5=tcOzUfVoeeqg@mail.gmail.com>
 <263c5e9b-d6fb-41a8-9d8a-84ea49eef51c@ideasonboard.com>
In-Reply-To: <263c5e9b-d6fb-41a8-9d8a-84ea49eef51c@ideasonboard.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 16 Feb 2024 14:02:10 +0000
Message-ID: <CAPj87rNi4=0Os3dNANmWbHm=sCeyogYDG0ZJUED2PGn0U-7tEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/tidss: Fix initial plane zpos values
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Devarsh Thakkar <devarsht@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Randolph Sapp <rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

On Fri, 16 Feb 2024 at 09:00, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 13/02/2024 13:39, Daniel Stone wrote:
> > Specifically, you probably want commits 4cde507be6a1 and 58dde0e0c000.
> > I think the window of breakage was small enough that - assuming either
> > those commits or an upgrade to Weston 12/13 fixes it - we can just ask
> > people to upgrade to a fixed Weston.
> >
> >>> Presuming this is not related to any TI specific code, I guess it's a
> >>> regression in the sense that at some point Weston added the support to use
> >>> planes for composition, so previously with only a single plane per display
> >>> there was no issue.
> >
> > That point was 12 years ago, so not that novel. ;)
>
> Hmm, so do I understand it right, the plane code from 12 years back
> supposedly works ok, but somewhere around Weston 10 something broke, but
> was fixed with the commits you mention above?

We always had plane support but pre-zpos; we added support for zpos a
couple/few releases ago, but then massively refactored it ... so it
could've always been broken, or could've been broken for as long as we
have zpos, or it could've just been a small window in between the
refactor.
