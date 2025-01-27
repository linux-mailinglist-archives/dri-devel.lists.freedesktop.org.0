Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6FAA1D89B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A7610E557;
	Mon, 27 Jan 2025 14:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pGD/enfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D0910E560
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737989009;
 bh=t8H13PU+dE/XDOeVe03jIrdQNLu7F3mQVdhS5tLlG6Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pGD/enfL8kpK87zQuoRfa+HLMtoYy4vYF3/PJkP6xitwVDD5pFD7XQGG/orOFK4UA
 AvM2kx0BgCQrlrkZ5bGHksoau6SrO9w8Wus+63FSvMulP9kOUs9Vj76uGBfmSdSHy0
 EKAO+ozERr2vk+UvVMEDq3eae9g1suBwc4ERF2Ko5u5O3fo88tFmLWckr6J96RFDhL
 bwo0yrAQK4z1pUPiZuH5+ykUzqUaRUBAZ4bkxqPFzlRog0PTveq+9nNBVLMqXQlYiw
 FZyyUslpppKaMu6f7fB/p8oQ4k669fS1XbeVTKO1ZYnVf1imNzEND5aq7/bWjRJ9jX
 csRNkYEwFbJDA==
Received: from nicolas-tpx395.localdomain (unknown
 [IPv6:2606:6d00:11:e976::7a9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nicolas)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3517517E083A;
 Mon, 27 Jan 2025 15:43:25 +0100 (CET)
Message-ID: <c08e5bd0e55b7d9f87ba007455e92da553284dfb.camel@collabora.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leonardo
 =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Vignesh Raman	
 <vignesh.raman@collabora.com>, kernelci@lists.linux.dev,
 linuxtv-ci@linuxtv.org, 	dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, 	pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, kernel@collabora.com, 
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org,
 daniels@collabora.com, 	shreeya.patel@collabora.com, denys.f@collabora.com,
 louis.chauvet@bootlin.com, 	hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, 	Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, 	geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, 	jarkko@kernel.org
Date: Mon, 27 Jan 2025 09:43:23 -0500
In-Reply-To: <20250127060738.GA16795@pendragon.ideasonboard.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <20250124135203.040d0852@foz.lan>
 <20250124130021.GA6853@pendragon.ideasonboard.com>
 <f1c73327073c98ade56dfeabf629e2f9cd7d1663.camel@collabora.com>
 <bd37528d1c704951cb86a751a5c81e4c76962f51.camel@gmail.com>
 <20250127060738.GA16795@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Le lundi 27 janvier 2025 à 08:07 +0200, Laurent Pinchart a écrit :
> On Fri, Jan 24, 2025 at 06:12:24PM -0300, Leonardo Brás wrote:
> > On Fri, 2025-01-24 at 10:45 -0500, Nicolas Dufresne wrote:
> > > Le vendredi 24 janvier 2025 à 15:00 +0200, Laurent Pinchart a écrit :
> > > > On Fri, Jan 24, 2025 at 01:52:03PM +0100, Mauro Carvalho Chehab wrote:
> > > > > Em Fri, 24 Jan 2025 10:12:50 +0200 Laurent Pinchart escreveu:
> > > > > 
> > > > > > > It's been a few years since I first thought on finding a good way of helping
> > > > > > > kernel developers testing their patches, while making use of the free runner
> > > > > > > minutes Gitlab offers. It can greatly simplify the testing for people who are
> > > > > > > new to kernel development, or students trying to understand it better.
> > > > > > > 
> > > > > > > And this patchset allows that to happen :)
> > > > > > > 
> > > > > > > Actually, I spoke to Helen last year, and to enable it to run on the free
> > > > > > > Gitlab-CI runners, there is a small extra patch which is needed:
> > > > > > > 
> > > > > > > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.com/  
> > > > > 
> > > > > Sounds interesting!
> > > > > 
> > > > > > Gitlab as an open-source software project (the community edition) is one
> > > > > > thing, but can we please avoid advertising specific proprietary services
> > > > > > in the kernel documentation ?
> > > > > 
> > > > > Every time Gitlab is mentioned, the brand of the company that
> > > > > developed it and has been providing proprietary services is also
> > > > > advertised. If you're not happy with that, you should move to use
> > > > > a git forge developed by some open source community.
> > > > 
> > > > I'm fine mentioning the gitlab community edition, I'm not fine
> > > > advertising gitlab.com SaaS in the kernel source tree.
> > 
> > Hello Laurent,
> > 
> > I see your point, and I see no issue on removing the two last lines of CI_TAGS
> > documentation.
> > 
> > I just added this information on documentation because the default runner used
> > for the Free Tier of Gitlab does not work for this CI, as it needs more
> > resources to run. This information can be added on some other place, but at the
> > time I thought it would be ok to let it be there. 
> > This other runner I mentioned in the patch is also available on the Free Tier
> > (free as in beer).
> > 
> > I would like to make it clear that I have no connection/affiliation to Gitlab,
> > other than a free account in their system, which I use for some CI. I have no
> > interest on advertising anything from them.
> > 
> > My only objective is to make it easier to hobbyists/beginners to use those
> > available free minutes to test some change before sending the patch, if they
> > think that's valuable.
> 
> Given the 400 free computes minute per month, and the fact that the
> saas-linux-medium-amd64 runner consumers two minutes per minute, how
> many of the proposed CI runs would be available per month ?
> 
> CI pipeline runs always compile the kernel from scratch as far as  can
> see. This may not be an issue for final testing before submission of a
> patch series, but it just won't work for incremental testing of changes.
> Think of how inefficient it would be to run a full pipeline just to get
> the checkpatch.pl output for instance. This is why I believe tests
> should focus first and foremost on ease of use in developers' local
> environments. A standardized, from-scratch, comprehensive test run as a
> gate keeper for integration has value as well, but that won't help
> beginners much.

Perhaps we can provide pointers how to run a private gitlab runner on your local
computer. My experience is that this take few minutes, unlike figuring all the
foreign bash scripts dependency, and debugging issues related to some tools not
having the right version, which inevitably lead to folks criticizing distro
choices and other counter productive discussions. Of course, it can only work if
that process is used and tested.

> 
> > > I've just looked attentively, the intention is just to explain you may need to
> > > set gitlab variable in your project fork in order to select correctly sized
> > > sized runners in your own instance.
> > 
> > That's correct
> > 
> > >  Its is not strictly about commercial gitlab.com instance. 
> > 
> > Exactly, the change is about being able to choose the runner you want.
> > 
> > > The default only works with the original project used
> > > instance (which is not gitlab.com as far as I know), but the comment refer to
> > > companies that will choose gitlab.com internally to reduce their IT cost.
> > 
> > Correct.
> > Companies can benefit on that, but my focus was on hobbyist (or begginers) who
> > may want to test their patches on free CI before sending them to the ML.
> > 
> > > Its quite a stretch to call this "advertisement", that makes it looks very
> > > dramatic. I personally believe its quite ahead of most other gitlab CI to take
> > > into consideration running these pipelines on foreign (to the project)
> > > instances.
> > > 
> > > > > The way I see, the best would be if the CI integration could work
> > > > > with more than one type of forge and being able to use any
> > > > > free Git??b-CI runners that would be available for developers to
> > > > > use, as this would allow testing more subsystems with CI, thus
> > > > > increasing code quality.
> 

