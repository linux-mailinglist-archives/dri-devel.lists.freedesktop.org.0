Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9EFA1B651
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 13:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C65C10E06C;
	Fri, 24 Jan 2025 12:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RryHRov2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27E310E06C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:52:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4AD66A4171F;
 Fri, 24 Jan 2025 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07688C4CED2;
 Fri, 24 Jan 2025 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737723135;
 bh=CpbOkdw5ufLxu3POL0cSP+QQdt85eklh2emIk4kJQdc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RryHRov2KoNJszYH1AdqbYFOqxFE00KYUb2qQdcn6XWytVkTx8AEyIRrA8EtuEe3m
 x8vOQs1rPLvRD/zh1iMl58Md6wWIDJbhUApNpjadFhn1BxXv0G7GIqvg+ecspRbQs2
 ZCpSlLnCbT5a575vFoYr3+QA00DD7DW4Ve3Zv5NQMMAaFsJKDK1xvx93vwx8Npif91
 jJy+xIR3jmm3NpoWLMGKBF9sYPpgYeGOrVEHs3J8bQujOR6Gzn8ONECASE2bgS9HOq
 hGV85cTPUIdxBpXvxG71Bum3JQdo6yF7NIxseaPBLQKBZg2MLk0avz41j2iPcqIMuq
 kLeBOgTG4fqvg==
Date: Fri, 24 Jan 2025 13:52:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leonardo =?UTF-8?B?QnLDoXM=?= <leobras.c@gmail.com>, Vignesh Raman
 <vignesh.raman@collabora.com>, kernelci@lists.linux.dev,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, jarkko@kernel.org
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20250124135203.040d0852@foz.lan>
In-Reply-To: <20250124081250.GA24731@pendragon.ideasonboard.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Em Fri, 24 Jan 2025 10:12:50 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > It's been a few years since I first thought on finding a good way of helping
> > kernel developers testing their patches, while making use of the free runner
> > minutes Gitlab offers. It can greatly simplify the testing for people who are
> > new to kernel development, or students trying to understand it better.
> > 
> > And this patchset allows that to happen :)
> > 
> > Actually, I spoke to Helen last year, and to enable it to run on the free
> > Gitlab-CI runners, there is a small extra patch which is needed:
> > 
> > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.com/  

Sounds interesting!

> Gitlab as an open-source software project (the community edition) is one
> thing, but can we please avoid advertising specific proprietary services
> in the kernel documentation ?

Every time Gitlab is mentioned, the brand of the company that
developed it and has been providing proprietary services is also
advertised. If you're not happy with that, you should move to use
a git forge developed by some open source community.

The way I see, the best would be if the CI integration could work
with more than one type of forge and being able to use any
free Git??b-CI runners that would be available for developers to
use, as this would allow testing more subsystems with CI, thus
increasing code quality.

Thanks,
Mauro
