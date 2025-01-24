Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DFA1B7DD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 15:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5723010E0F4;
	Fri, 24 Jan 2025 14:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BAL1UqWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A764C10E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737728799;
 bh=Fn7sVn0NbYZhm7JxknrOZwVFg9G9cMFFUTYJo64GgPo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=BAL1UqWppcSgPAdfimcgwSZtp5TQAmeChpEwqE7virszEImjVf3+eaAJHb82q4aZu
 xPnOgU/Kc2jz/4PAHJk1xW00xAHe6N03twa6YyvqYa4ssu2h0c37PzgmrIPLQ6n4hG
 AGSLRa8uBFWxMJ4D5SK8CdMz9K2fv6P1mvYUn0pfh8w0OJ1lgJq7RmVDqB9b0ZUVWG
 SI2yQGg529UMho2hsuhi0bTYUOp6UE7Bkkn/QpIV82QtpFdO5sJiteVAwgQedKR05s
 EbGGNnbOh/ttIf20CXV4BVoWHooMZw9NAsEGYzt1tOPz3BuETjqI4cFM3jTIYoqltG
 wXfVJT9gi+khQ==
Received: from nicolas-tpx395.localdomain (unknown
 [IPv6:2606:6d00:11:e976::7a9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: nicolas)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A97DB17E0E57;
 Fri, 24 Jan 2025 15:26:34 +0100 (CET)
Message-ID: <b3af62d3565d2d60218520d2ebace6f1a0368c17.camel@collabora.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, Jarkko Sakkinen	
 <jarkko@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Leonardo =?ISO-8859-1?Q?Br=E1s?=	 <leobras.c@gmail.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev, 
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com, 
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, 	nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, 	Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, 	torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com, 
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, 	louis.chauvet@bootlin.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, 	simona@ffwll.ch, airlied@gmail.com,
 Tim.Bird@sony.com, broonie@kernel.org, 	groeck@google.com,
 rdunlap@infradead.org, geert@linux-m68k.org, 	michel.daenzer@mailbox.org,
 sakari.ailus@iki.fi
Date: Fri, 24 Jan 2025 09:26:33 -0500
In-Reply-To: <298675d0-ba19-4c87-b00d-57a5e31b05b6@redhat.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
 <298675d0-ba19-4c87-b00d-57a5e31b05b6@redhat.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Le vendredi 24 janvier 2025 à 15:00 +0200, Nikolai Kondrashov a écrit :
> On 1/24/25 2:16 PM, Jarkko Sakkinen wrote:
> > On Fri Jan 24, 2025 at 10:12 AM EET, Laurent Pinchart wrote:
> > > Gitlab as an open-source software project (the community edition) is one
> > > thing, but can we please avoid advertising specific proprietary services
> > > in the kernel documentation ?
> > 
> > I don't think we should have any of this in the mainline kernel.
> > 
> > One angle is that "no regressions rule" applies also to the shenanigans.
> > 
> > Do we really spend energy on this proprietary crap to the eternity?
> 
> This is not getting included into the kernel itself, the contributed code is,
> of course, open-source. And yes it would execute just fine on the fully
> open-source community-edition GitLab. I don't think "no regressions rule"
> should apply here. This is for developers only, and is a template for making
> your own pipeline mostly, with pieces which can be reused.

Perhpas worth clarifying that Media and DRM subsystem have opted for the
Freedesktop instance. This instance is running the Open Source version of
Gitlab, with hundreds of CI runners contributed and shared among many projects
(which includes Mesa, GStreamer, Wayland, Pipewire, libcamera, just to name
few).

Nicolas
