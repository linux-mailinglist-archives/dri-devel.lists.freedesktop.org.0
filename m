Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06301A1BA91
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 17:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC1210E9F0;
	Fri, 24 Jan 2025 16:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gFwlYNS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A528310E9CD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 16:36:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3B3C8A41B1F;
 Fri, 24 Jan 2025 16:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCC5C4CED2;
 Fri, 24 Jan 2025 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737736565;
 bh=qw9sL4e2WHFO0R0bwxLwz5BJzMvwrz0O7pdsb4Warso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gFwlYNS7WTqSyyFtbpCZIYRS4wxfdkhkik45LEbaja2oWiiHOVSr3lLU5QUHdps/c
 YMxmJksb+X1EJNVHdXthjkzKisj8OYFz5p0Z+3ky2onBSyb1ZxUuzjvCcaGmKhrpzz
 5YGV+vbi3WNvxzAVeCOUqOOcV/pqw+alJ5YtglEKhI3YljsaolQcpHI2Km7o04lFYA
 6N/uwwJ+nlehU77Ug0DAfqGHUCwN0MDEfOpIGh5wHxFPbkN+SoAK3lP8aIpU0jaqNG
 7m3Sl0W69hRFPDyILQFu2mS63n/ZrKTyKx1dOnaWoqNKym1aOY2dBpxyPTwOunk1Os
 12nC4dVCjtpRQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jan 2025 18:36:00 +0200
Message-Id: <D7AG776AI2EQ.KLG13BCOXBJL@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, =?utf-8?q?Leonardo_Br=C3=A1s?=
 <leobras.c@gmail.com>
Cc: "Vignesh Raman" <vignesh.raman@collabora.com>,
 <kernelci@lists.linux.dev>, <linuxtv-ci@linuxtv.org>,
 <dave.pigott@collabora.com>, <mripard@kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>, <gustavo.padovan@collabora.com>,
 <pawiecz@collabora.com>, <spbnick@gmail.com>, <tales.aparecida@gmail.com>,
 <workflows@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <kunit-dev@googlegroups.com>, <nfraprado@collabora.com>,
 <davidgow@google.com>, <cocci@inria.fr>, <Julia.Lawall@inria.fr>,
 <laura.nao@collabora.com>, <kernel@collabora.com>,
 <torvalds@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
 <daniels@collabora.com>, <helen.koike@collabora.com>,
 <shreeya.patel@collabora.com>, <denys.f@collabora.com>,
 <nicolas.dufresne@collabora.com>, <louis.chauvet@bootlin.com>,
 <hamohammed.sa@gmail.com>, <melissa.srw@gmail.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <Tim.Bird@sony.com>, <broonie@kernel.org>,
 <groeck@google.com>, <rdunlap@infradead.org>, <geert@linux-m68k.org>,
 <michel.daenzer@mailbox.org>, <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
X-Mailer: aerc 0.18.2
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
 <298675d0-ba19-4c87-b00d-57a5e31b05b6@redhat.com>
In-Reply-To: <298675d0-ba19-4c87-b00d-57a5e31b05b6@redhat.com>
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

On Fri Jan 24, 2025 at 3:00 PM EET, Nikolai Kondrashov wrote:
> On 1/24/25 2:16 PM, Jarkko Sakkinen wrote:
> > On Fri Jan 24, 2025 at 10:12 AM EET, Laurent Pinchart wrote:
> >> Gitlab as an open-source software project (the community edition) is o=
ne
> >> thing, but can we please avoid advertising specific proprietary servic=
es
> >> in the kernel documentation ?
> >=20
> > I don't think we should have any of this in the mainline kernel.
> >=20
> > One angle is that "no regressions rule" applies also to the shenanigans=
.
> >=20
> > Do we really spend energy on this proprietary crap to the eternity?
>
> This is not getting included into the kernel itself, the contributed code=
 is,
> of course, open-source. And yes it would execute just fine on the fully
> open-source community-edition GitLab. I don't think "no regressions rule"
> should apply here. This is for developers only, and is a template for mak=
ing
> your own pipeline mostly, with pieces which can be reused.

Ah, OK then it is fine. It was a kernel list so I assumed it was for
kernel.=20

Then: I don't care about this ;-) I use a different testing tool
(BuildRoot) and a different CI (Woodpecker in my local server).

So go ahead and do what you like...

>
> Nick

BR, Jarkko
