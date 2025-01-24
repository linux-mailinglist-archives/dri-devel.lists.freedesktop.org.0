Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65674A1BA72
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 17:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB13A10E9EE;
	Fri, 24 Jan 2025 16:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H3I7/p6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECF410E9D8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 16:32:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DB945C60C0;
 Fri, 24 Jan 2025 16:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEBBC4CED2;
 Fri, 24 Jan 2025 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737736332;
 bh=buj9ZenxsIQ69t/K1EE7HtMo+2bG/oWLj5fvcapjxUA=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=H3I7/p6qOiDIGiOoQBAUG1hcJ+tysCWHdaFE1PaW4uhteDjw3pR+npaF06v/zkBW0
 MbvWEMBlbFZTbRdpQOSZ68zcmPDZrOiZ9D7DatPBA7aTco5xScRGmKpAsIm6Eo5fdW
 GpjiAmKQyF+VYkNffdKZzHpx24g4AW9KqM++lgiw363/TI+q3ftRqDzId4liHJLawe
 rANWO2Bs/y4K8MRmrCdmYTG11Hr08TVlZ6+7BRBcDxwtI4KHFazipsaMAhAk4FNAZh
 8rCH0ZYiySGZMj8kltBgr6JzKJc5dxzmUi5mCX2w5sd1uJxWVGjvc8cNNU39uUUqD/
 93AnUorFuJvJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jan 2025 18:32:07 +0200
Message-Id: <D7AG4810MH9U.3SA2YT8ZPY6QF@kernel.org>
Cc: <linuxtv-ci@linuxtv.org>, <dave.pigott@collabora.com>,
 <mripard@kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <gustavo.padovan@collabora.com>, <pawiecz@collabora.com>,
 <spbnick@gmail.com>, <tales.aparecida@gmail.com>,
 <workflows@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <kunit-dev@googlegroups.com>, <nfraprado@collabora.com>,
 <davidgow@google.com>, <cocci@inria.fr>, <Julia.Lawall@inria.fr>,
 <laura.nao@collabora.com>, <kernel@collabora.com>,
 <torvalds@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
 <daniels@collabora.com>, <helen.koike@collabora.com>,
 <shreeya.patel@collabora.com>, <denys.f@collabora.com>,
 <nicolas.dufresne@collabora.com>, <louis.chauvet@bootlin.com>,
 <hamohammed.sa@gmail.com>, <melissa.srw@gmail.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <Tim.Bird@sony.com>,
 <laurent.pinchart@ideasonboard.com>, <broonie@kernel.org>,
 <leobras.c@gmail.com>, <groeck@google.com>, <rdunlap@infradead.org>,
 <geert@linux-m68k.org>, <michel.daenzer@mailbox.org>, <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>, "Vignesh Raman"
 <vignesh.raman@collabora.com>, <kernelci@lists.linux.dev>
X-Mailer: aerc 0.18.2
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
 <a77f2eea-1793-4e83-92b0-92b5bbd23a5e@redhat.com>
In-Reply-To: <a77f2eea-1793-4e83-92b0-92b5bbd23a5e@redhat.com>
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

On Fri Jan 24, 2025 at 2:58 PM EET, Nikolai Kondrashov wrote:
> Hi Jarkko,
>
> On 1/23/25 11:30 PM, Jarkko Sakkinen wrote:
> > On Thu Jan 23, 2025 at 3:53 PM EET, Vignesh Raman wrote:
> >> We are working towards creating a generic, upstream GitLab-CI pipeline
> >> (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipe=
line
> >> is designed with a distributed infrastructure model, making it possibl=
e
> >> to run on any gitLab instance. We plan to leverage KernelCI [2] as the
> >> backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
> >> integration.
> >=20
> > Why can't you keep the next version of your great pipeline outside the
> > kernel tree?
> >=20
> > If there is a legit motivation for doing that, why it needs to be bound
> > to Gitlab? Why can't you make script callable from any CI?
>
> Greetings from the (today's) sunny Espoo!
>
> Of course we could keep it outside the kernel tree. However, the point of=
 this
> contribution is to provide kernel maintainers and developers with an easy=
 way
> to setup their CI pipeline on a GitLab instance (the main one, FreeDeskto=
p
> one, or any other). Basically this is like a template or a library, if yo=
u
> wish, which helps you do that. Approved by Linus too.

With all due respect, "approved by Linus" is not an argument :-) I get
that Linus can make the "ultimate decision" but in argumentation I'm not
a strong believer of authority based decision making process. Not
downplaying this more than that I knowingly ignore this comment.

> Why GitLab? Because it's one of the best, if not *the* best CI system the=
se
> days, with lots of flexibility, and it's Open-Source too (well, at least
> open-core, which is still very capable). And also because a number of
> maintainers and companies are already using it.

There's also Github Runners and Woodpecker CI used by Codeberg. To add,
some companies and other organizations prefer Jenkins. This one fit for
all strategy is somewhat short-sighted.

Also running Gitlab tasks locally is possible but is heavy-lifting.

Can we then agree that any CI changes can be sent untested to LKML if
a patch set needs to reflect on those? It's not reasonable to except
local runs Gitlab from individuals for patch sets. It makes our lives
more difficult, not easier.

All maintainers I know test their patches for the most part with
BuildRoot, distro VM's and stuff like that. Not claiming that they
don't exist, but never heard of kernel maintainer who uses Gitlab
as their main kernel testing tool.

> Sure, a script could be contributed too, but the value of this contributi=
on is
> a ready-made integration. And we want to make it easily discoverable, and
> easily contributed to.

This is definitely NOT "lots of flexibility".

Are you dead seriously claiming that DevOps engineers could not handle
well defined CI scripts and bind to whatever CI makes sense to them?
o_O

>
> BTW, here's the talk we gave at last year's LPC regarding current use of
> GitLab in the kernel and surrounding community:
>
> https://lpc.events/event/18/contributions/1728/

This patch set should make the case, not an old presentation.

> Nick

BR, Jarkko
