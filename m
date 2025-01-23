Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3DA1A953
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 19:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BBD10E29A;
	Thu, 23 Jan 2025 18:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dN6XkPpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E7810E29A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737655456;
 bh=eTuapbwK/KdvI8diNR5eurIEYnCZRL8MW3R/4gjq+6w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=dN6XkPpgjABscLcR3nYIXAz0bQMLNZxgbT67jyUfEivcJlWdPP2fqMzeJqdRFhXDA
 FXaNasNNERyvl9jd3XW1t8+71Fl8VY/aeR33vSFgsEwpu6mqU180G5g+5ZkKWTeCgk
 7Kq7Odd/pvaQzv52RtaphR1dxl6ib0q3x5fnXwG6xvOefakPg8ByZ7IUrAKDb0yPQd
 zvjwg5lBe78jQX2NVh+K60iQSBLPW/bFnkWSyyf7PCzz2tTyEhg43478l7lUUF18/7
 u9esbGiOIdgxqzhHPLljK3iNRG8S+j6P0H48nKAnX8efHquACXBRBMvVGCA1i32LvY
 m2pigY9OxoHMA==
Received: from nicolas-tpx395.localdomain (unknown
 [IPv6:2606:6d00:11:e976::7a9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nicolas)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5892917E0E48;
 Thu, 23 Jan 2025 19:04:12 +0100 (CET)
Message-ID: <ae9d345c71e99ac56b935a18f02c2c01fc87b9e0.camel@collabora.com>
Subject: Re: [PATCH v2 5/5] kci-gitlab: docs: Add images
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>, Vignesh Raman
 <vignesh.raman@collabora.com>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, 	mripard@kernel.org,
 linux-kernel@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, 	gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, 	tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 kernel@collabora.com, gregkh@linuxfoundation.org, daniels@collabora.com, 
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, 	louis.chauvet@bootlin.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, 	simona@ffwll.ch, airlied@gmail.com,
 Tim.Bird@sony.com, 	laurent.pinchart@ideasonboard.com, broonie@kernel.org,
 leobras.c@gmail.com, 	groeck@google.com, rdunlap@infradead.org,
 geert@linux-m68k.org, 	michel.daenzer@mailbox.org, sakari.ailus@iki.fi,
 jarkko@kernel.org
Date: Thu, 23 Jan 2025 13:04:11 -0500
In-Reply-To: <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <20250123135342.1468787-6-vignesh.raman@collabora.com>
 <CAHk-=wiWcw-aPcMvWYqJDqxopPYXnPnVgFYAUSkvkRPTjO83uQ@mail.gmail.com>
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

Le jeudi 23 janvier 2025 à 07:46 -0800, Linus Torvalds a écrit :
> On Thu, 23 Jan 2025 at 05:56, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> > 
> >  Documentation/ci/gitlab-ci/images/drm-vkms.png | Bin 0 -> 73810 bytes
> >  .../ci/gitlab-ci/images/job-matrix.png         | Bin 0 -> 20000 bytes
> >  .../ci/gitlab-ci/images/new-project-runner.png | Bin 0 -> 607737 bytes
> >  .../ci/gitlab-ci/images/pipelines-on-push.png  | Bin 0 -> 532143 bytes
> >  .../ci/gitlab-ci/images/the-pipeline.png       | Bin 0 -> 62464 bytes
> >  .../ci/gitlab-ci/images/variables.png          | Bin 0 -> 277518 bytes
> 
> 
> This seems excessive.
> 
> We have a few images in the tree, but they tend to be either the
> penguin logo or various source SVGs.
> 
> Not a set of random screenshots or whatever.

I can only agree.

Nicolas

> 
>          Linus

