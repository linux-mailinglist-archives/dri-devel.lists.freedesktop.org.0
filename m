Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F26A1B67D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 14:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC14510E971;
	Fri, 24 Jan 2025 13:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U4qb+ksv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DA010E971
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:00:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3285514;
 Fri, 24 Jan 2025 13:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737723567;
 bh=xNXL25JANeVMtEb0+OfqIO3h2IoWDgiFX+8jcNI02p0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4qb+ksvrFNjt1lUlMKYpvv6Llm2SfKel8ltpSoSKQB/zL+rhRnXN9nqD7v7PAZOT
 0zQHazpPs0rYNHY58A5Q+uNQOh3k/vIWQckRdLAc34lAkpLOC2/lpa2DpLb/D1w8zX
 yAx03s18qJJI2X4j5+o14/20nCIGnJQvwM78BlBY=
Date: Fri, 24 Jan 2025 15:00:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org,
 daniels@collabora.com, helen.koike@collabora.com,
 shreeya.patel@collabora.com, denys.f@collabora.com,
 nicolas.dufresne@collabora.com, louis.chauvet@bootlin.com,
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, simona@ffwll.ch,
 airlied@gmail.com, Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, jarkko@kernel.org
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20250124130021.GA6853@pendragon.ideasonboard.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <20250124135203.040d0852@foz.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124135203.040d0852@foz.lan>
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

On Fri, Jan 24, 2025 at 01:52:03PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 24 Jan 2025 10:12:50 +0200 Laurent Pinchart escreveu:
> 
> > > It's been a few years since I first thought on finding a good way of helping
> > > kernel developers testing their patches, while making use of the free runner
> > > minutes Gitlab offers. It can greatly simplify the testing for people who are
> > > new to kernel development, or students trying to understand it better.
> > > 
> > > And this patchset allows that to happen :)
> > > 
> > > Actually, I spoke to Helen last year, and to enable it to run on the free
> > > Gitlab-CI runners, there is a small extra patch which is needed:
> > > 
> > > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.com/  
> 
> Sounds interesting!
> 
> > Gitlab as an open-source software project (the community edition) is one
> > thing, but can we please avoid advertising specific proprietary services
> > in the kernel documentation ?
> 
> Every time Gitlab is mentioned, the brand of the company that
> developed it and has been providing proprietary services is also
> advertised. If you're not happy with that, you should move to use
> a git forge developed by some open source community.

I'm fine mentioning the gitlab community edition, I'm not fine
advertising gitlab.com SaaS in the kernel source tree.

> The way I see, the best would be if the CI integration could work
> with more than one type of forge and being able to use any
> free Git??b-CI runners that would be available for developers to
> use, as this would allow testing more subsystems with CI, thus
> increasing code quality.

-- 
Regards,

Laurent Pinchart
