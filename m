Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8365520600
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 22:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F06B10E171;
	Mon,  9 May 2022 20:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0582E10E171;
 Mon,  9 May 2022 20:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sVDi3ZkthDWhU24EgtzN+wCLFG3z5NXVqbnb7DL7KRg=; b=MSu8yd2G1QdsEetiBeGz/X3MKM
 95MHBpcDUIVbe77heF3/WbEV+39tM/Gth0iTVQ2YXNQSdpZ+hLuwy5Yvfg7qNvoqE/FD0fnND5y1D
 Nd0OqoHaem/jn+UyniR/gmp+kRo7GS5JczmtEIpjDS6/1+W944dyqpLsL0ypUb1o7ACx8eItUzN7T
 nv6i0CJCp4GhlzodxwzbvAzpMNrIjGnUWW/ZesZkCeSyuC64rOwnmNFd+ct2DEfYGIZFuYk+NgrVq
 6++7eT9mQ3pukrjrCDRBhq/MXjqgdfKATRraJkN+m9zX4Eww8OKfegheqNNEkVj16ohJN9pddjl9w
 Cx/4S4MQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1noA9F-00GBdr-0y; Mon, 09 May 2022 20:38:29 +0000
Date: Mon, 9 May 2022 13:38:28 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Message-ID: <Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
References: <cover.1652113087.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1652113087.git.mchehab@kernel.org>
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
Cc: mauro.chehab@linux.intel.com, Richard Weinberger <richard@nod.at>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-modules@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 06:23:35PM +0200, Mauro Carvalho Chehab wrote:
> Currently, kernel/module annotates module dependencies when
> request_symbol is used, but it doesn't cover more complex inter-driver
> dependencies that are subsystem and/or driver-specific.
> 

At this pount v5.18-rc7 is out and so it is too late to soak this
in for the proper level of testing I'd like to see for modules-next.
So I can review this after the next merge window. I'd want to beat
the hell out of this and if possible I'd like to see if we can have
some test coverage for the intended goal and how to break it.

  Luis
