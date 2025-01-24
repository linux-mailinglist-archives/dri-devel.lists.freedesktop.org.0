Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1232A1B580
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 13:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9E10E25E;
	Fri, 24 Jan 2025 12:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eWQQv3Ug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC9710E25E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:16:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05755A41670;
 Fri, 24 Jan 2025 12:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67084C4CED2;
 Fri, 24 Jan 2025 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737721017;
 bh=9/zDMqN6hhaBomecOPelO7rWtXLPgec1udymjzwGahE=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=eWQQv3Ugf4xoyIoBxAR8/sos283LO4tfdtueimw31HSVDOwgMGB2kNZZjf66Dh0hz
 a6I1ULEjZyhOvrOUc6AeIeqjkUJNyN1XggtE5/hweH1G/K00T8rfWPCVrcG7yaIRPA
 x6u3EX8rgtXrld9535e+lpZovv6mPWAHhz+p9KKX3xEGzGgW66k4DaL+AU/wyGeIBG
 d8ukAc8lExSOcWXjbHtFdQ1e7We3n4HIl24sN4qcJNDa+BdbKRAIKXlK31y52ODIq9
 IA5m48dT88TqN7E8sRAKrgIRUrPcpk7CXYyYrKvjz6WQYrhTeeORinbGugexmKmiGa
 d0joC22bDyNIw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jan 2025 14:16:52 +0200
Message-Id: <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
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
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 =?utf-8?q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
X-Mailer: aerc 0.18.2
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
In-Reply-To: <20250124081250.GA24731@pendragon.ideasonboard.com>
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

On Fri Jan 24, 2025 at 10:12 AM EET, Laurent Pinchart wrote:
> Gitlab as an open-source software project (the community edition) is one
> thing, but can we please avoid advertising specific proprietary services
> in the kernel documentation ?

I don't think we should have any of this in the mainline kernel.

One angle is that "no regressions rule" applies also to the shenanigans.

Do we really spend energy on this proprietary crap to the eternity?

BR, Jarkko
