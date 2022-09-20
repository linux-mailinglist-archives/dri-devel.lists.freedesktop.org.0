Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0075BDC64
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 07:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F31F10E292;
	Tue, 20 Sep 2022 05:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1410E286;
 Tue, 20 Sep 2022 05:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663651502; x=1695187502;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xuDq04V3ERIqON4UuLH1RmjGkFR75KWm8lnYzEvFeDI=;
 b=gFxlXcUYcKDofGNPNpnxdsDtMBDUlFoNGplVYs7wgtR5K9H0ar2hlEei
 Kov8uG1WtnOiR/+sZ8GmJFyWRsqkHYf5LaWtexvxE+vcTsykTRwObutCK
 OlFwLv36bxED2Mlcos78BGeDT8G74OR/53P8P8uRVSeR4N/DAOMb4poIM
 x5Oje3lKocGTwmZRUIrLL/6YLutwhCTC1eF0HRebc8+ysdluR/DB2QqB8
 xxXd77CNgw1OCrRs1GD/h0mKkEF5WQHKKHgHHA/FQw8UKMf83qnr9gguf
 a8jpyb7EdXVjc/u90OYaUSK0NsC9C/RimFOf3RtVS+H4xDkgQ48F4h9nX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279327675"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="279327675"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 22:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="794124954"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 19 Sep 2022 22:25:01 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C58B4580713;
 Mon, 19 Sep 2022 22:24:56 -0700 (PDT)
Date: Tue, 20 Sep 2022 07:24:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Message-ID: <20220920072454.4cf91f24@maurocar-mobl2>
In-Reply-To: <Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
References: <cover.1652113087.git.mchehab@kernel.org>
 <Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
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
Cc: alsa-devel@alsa-project.org, Richard Weinberger <richard@nod.at>,
 Kai Vehmanen <kai.vehmanen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-modules@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luis,

On Mon, 9 May 2022 13:38:28 -0700
Luis Chamberlain <mcgrof@kernel.org> wrote:

> On Mon, May 09, 2022 at 06:23:35PM +0200, Mauro Carvalho Chehab wrote:
> > Currently, kernel/module annotates module dependencies when
> > request_symbol is used, but it doesn't cover more complex inter-driver
> > dependencies that are subsystem and/or driver-specific.
> >   
> 
> At this pount v5.18-rc7 is out and so it is too late to soak this
> in for the proper level of testing I'd like to see for modules-next.
> So I can review this after the next merge window. I'd want to beat
> the hell out of this and if possible I'd like to see if we can have
> some test coverage for the intended goal and how to break it.

Any news with regards to this patch series?

Regards,
Mauro
