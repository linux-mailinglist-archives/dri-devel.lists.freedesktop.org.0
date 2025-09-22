Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D645B931EF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8134F10E4F6;
	Mon, 22 Sep 2025 19:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="IMvdEOaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [3.65.3.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B57510E415;
 Mon, 22 Sep 2025 10:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758537940; x=1790073940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jHPTQZFCaC0QVf/rAslU2rF+GKEtXGi5htBMXx8M8BI=;
 b=IMvdEOaMe0FP+IRiNewRyRaabx48iIkR6MASuvWpSUyJRCz4No1zsMj3
 JJkx18PvOX4VxXtT7+b/z+LHjF4zoySj64sfRjKGuYAYCqZG5hejOE9YA
 qQQlCJiQNG/xRUtkvVoeVq8NS7PNXApOfYn82/PzS4izkM+75VP4Om2LH
 qMW0Ohj/UlUx5cqki//gorCp/4bnAhxNPQnnc/PkoX3Ann3pMdXYB6N4i
 CQ8JRm8d78O41hqV4swQq0KdQj4zidPRvKsqbCobiE9s6b4Zoz1mUNqaO
 EGo/8/s2hD32Nbtg5CNo7SsAufXeENVgMkX/8b9vziSIfI+feCNVcgScO Q==;
X-CSE-ConnectionGUID: 6hOHCxAKSfC6e+p5CvVdZw==
X-CSE-MsgGUID: YBSxBrJDRxalvxjSB5/Ebw==
X-IronPort-AV: E=Sophos;i="6.18,285,1751241600"; 
   d="scan'208";a="2482713"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:45:38 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.232:29409]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.10.226:2525]
 with esmtp (Farcaster)
 id f47c06f5-2d15-4c95-af11-de6ff2958513; Mon, 22 Sep 2025 10:45:38 +0000 (UTC)
X-Farcaster-Flow-ID: f47c06f5-2d15-4c95-af11-de6ff2958513
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 22 Sep 2025 10:45:38 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 22 Sep 2025 10:45:37 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.2562.020; Mon, 22 Sep 2025 10:45:37 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "jdike@addtoit.com"
 <jdike@addtoit.com>, "richard@nod.at" <richard@nod.at>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org"
 <peterz@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "tony.luck@intel.com" <tony.luck@intel.com>, "qiuxu.zhuo@intel.com"
 <qiuxu.zhuo@intel.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>, "rric@kernel.org"
 <rric@kernel.org>, "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "evan.quan@amd.com" <evan.quan@amd.com>, 
 "james.qian.wang@arm.com" <james.qian.wang@arm.com>, "liviu.dudau@arm.com"
 <liviu.dudau@arm.com>, "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>, 
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "jdelvare@suse.com" <jdelvare@suse.com>, 
 "linux@roeck-us.net" <linux@roeck-us.net>, "fery@cypress.com"
 <fery@cypress.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "agk@redhat.com" <agk@redhat.com>, "snitzer@redhat.com" <snitzer@redhat.com>, 
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "rajur@chelsio.com"
 <rajur@chelsio.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "peppe.cavallaro@st.com"
 <peppe.cavallaro@st.com>, "alexandre.torgue@st.com"
 <alexandre.torgue@st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "malattia@linux.it"
 <malattia@linux.it>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "intel-linux-scu@intel.com" <intel-linux-scu@intel.com>,
 "artur.paszkiewicz@intel.com" <artur.paszkiewicz@intel.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "clm@fb.com" <clm@fb.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>, "dsterba@suse.com"
 <dsterba@suse.com>, "jack@suse.com" <jack@suse.com>, "tytso@mit.edu"
 <tytso@mit.edu>, "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "dushistov@mail.ru" <dushistov@mail.ru>, "luc.vanoostenryck@gmail.com"
 <luc.vanoostenryck@gmail.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "pmladek@suse.com" <pmladek@suse.com>, "sergey.senozhatsky@gmail.com"
 <sergey.senozhatsky@gmail.com>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "minchan@kernel.org" <minchan@kernel.org>,
 "ngupta@vflare.org" <ngupta@vflare.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>, "pablo@netfilter.org"
 <pablo@netfilter.org>, "kadlec@netfilter.org" <kadlec@netfilter.org>,
 "fw@strlen.de" <fw@strlen.de>, "jmaloy@redhat.com" <jmaloy@redhat.com>,
 "ying.xue@windriver.com" <ying.xue@windriver.com>, "willy@infradead.org"
 <willy@infradead.org>, "sashal@kernel.org" <sashal@kernel.org>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>, "David.Laight@aculab.com"
 <David.Laight@aculab.com>, "herve.codina@bootlin.com"
 <herve.codina@bootlin.com>, "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>, "keescook@chromium.org"
 <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-um@lists.infradead.org"
 <linux-um@lists.infradead.org>, "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "netfilter-devel@vger.kernel.org"
 <netfilter-devel@vger.kernel.org>, "coreteam@netfilter.org"
 <coreteam@netfilter.org>, "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH 00/27 5.10.y] Backport minmax.h updates from v6.17-rc6
Thread-Topic: [PATCH 00/27 5.10.y] Backport minmax.h updates from v6.17-rc6
Thread-Index: AQHcK64HHJftfGNvN0Cy23wGYTG5SQ==
Date: Mon, 22 Sep 2025 10:45:37 +0000
Message-ID: <df8d65b372864d149035eb1f016f08ae@amazon.com>
References: <20250919101727.16152-1-farbere@amazon.com>
 <2025092136-unelected-skirt-d91d@gregkh>
 <4f497306c58240a88c0bb001786c3ad2@amazon.com>
 <2025092203-untreated-sloppily-23b5@gregkh>
In-Reply-To: <2025092203-untreated-sloppily-23b5@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.143.178]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:47:43 +0000
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

> On Sun, Sep 21, 2025 at 09:37:02PM +0000, Farber, Eliav wrote:
> > > On Fri, Sep 19, 2025 at 10:17:00AM +0000, Eliav Farber wrote:
> > > > This series includes a total of 27 patches, to align minmax.h of=20
> > > > v5.15.y with v6.17-rc6.
> > > >
> > > > The set consists of 24 commits that directly update minmax.h:
> > > > 1) 92d23c6e9415 ("overflow, tracing: Define the is_signed_type() ma=
cro
> > > >    once")
> > >
> > > But this isn't in 5.15.y, so how is this syncing things up?
> > >
> > > I'm all for this, but I got confused here, at the first commit :)
> >
> > It's a typo.
> > It should be 5.10.y and not 5.15.y.
> >
> > > Some of these are also only in newer kernels, which, as you know, is=
=20
> > > generally a bad thing (i.e. I can't take patches only for older
> > > kernels.)
> > >
> > > I want these changes, as they are great, but can you perhaps provide=
=20
> > > patch series for newer kernels first so that I can then take these?
> >
> > So you'd first like first to align 6.16 with 6.17, then 6.15 with=20
> > 6.16, then 6.12 with 6.15, then 6.6 with 6.12, and so on until we=20
> > eventually align 5.10 and even 5.4?
>
> Yes please!

Stable 6.16.8 didn't require any changs.

I pulled the changes for 6.12.48:
https://lore.kernel.org/stable/20250922103123.14538-1-farbere@amazon.com/T/=
#t
and 6.6.107:
https://lore.kernel.org/stable/20250922103241.16213-1-farbere@amazon.com/T/=
#t

Once approved, I'll continue with other longterm branches.

---
Regards, Eliav


