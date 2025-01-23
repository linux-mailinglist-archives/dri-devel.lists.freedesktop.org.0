Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A811A1ABEC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 22:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8297A10E8A5;
	Thu, 23 Jan 2025 21:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ljobwWhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CADD10E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 21:32:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E32085C5AC1;
 Thu, 23 Jan 2025 21:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1843DC4CED3;
 Thu, 23 Jan 2025 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737667921;
 bh=U43wl3m4iytgZwURelg9Dd1JSuKG4wO5ZGgaRjHkiYQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=ljobwWhpPOWbHMWZfcZGBrqTEQWNSW4x8kKE8N10uOnz4Gmjy73R1KA/7PujDQrdG
 nXfeKQ567VxWcLpobGbsYEY18BsNmEXo/G92okOwf8b+2HTay9aEuwVYZf0HxLZ12S
 nst6+kC4CMjlsr+yndd9VMTIoofg7PQFUrS3nObaXgk3iZ6KBLCYZskndw5Vci2+HG
 hfLSlR+3n8KScil9bF4K4fsXKHcy5KlX6OSypjgAEw3xxOA0IkRcbzesvn76J5PV4u
 nfOFVoa2FcZoV/IBMsO6BAx80S8QMQmcpIDTHlWiqPw4xCNdLm02Se+Kh8AmBPzAQr
 LYH2BzJvyZenw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 23:31:56 +0200
Message-Id: <D79RV8GG76R9.1WM0XRR47WA0W@kernel.org>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Vignesh Raman"
 <vignesh.raman@collabora.com>, <kernelci@lists.linux.dev>
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
X-Mailer: aerc 0.18.2
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
In-Reply-To: <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
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

On Thu Jan 23, 2025 at 11:30 PM EET, Jarkko Sakkinen wrote:
> On Thu Jan 23, 2025 at 3:53 PM EET, Vignesh Raman wrote:
> > We are working towards creating a generic, upstream GitLab-CI pipeline
> > (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipel=
ine
> > is designed with a distributed infrastructure model, making it possible
> > to run on any gitLab instance. We plan to leverage KernelCI [2] as the
> > backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
> > integration.
>
> Why can't you keep the next version of your great pipeline outside the
> kernel tree?
>
> If there is a legit motivation for doing that, why it needs to be bound
> to Gitlab? Why can't you make script callable from any CI?

To add, most of the distributions have their CI pipelines but they don't
proactively push them over here.

BR, Jarkko
