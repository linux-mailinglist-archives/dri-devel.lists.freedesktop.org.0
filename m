Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA68FBBFA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 20:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAE010E5C0;
	Tue,  4 Jun 2024 18:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXPK90Ii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC77A10E5B6;
 Tue,  4 Jun 2024 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717525554; x=1749061554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4ChRhiRj7RjIhJztJTVxnRCFyBKStQKVF+FdK5o0YeE=;
 b=nXPK90Iifw71tBG0Orpq9ZmbyDLXhg9cWsuu4xG707c5veDttmIts76n
 Heq/xqVP/I+BdjKzkN6t92L/+YGw5k4TNvsm2V8bzEYMquMQn7y6ZpeMt
 PJwnT+Ufurwh4VyGVhtJmn2OBLb7omP0uKYhiOV9Q/M12TbrvpX/3Qqlo
 FVdZcA2PsBqYAHuipW70Zh2sofdZhszytthzh7LWwP4rhIQ1woHwBo083
 oGH3aSrZrqOQCYcAkQ639ZA3K2rm68vZGY3u+Hmq5Ip20gfgP74c7Ix8m
 hUufyv55PRSLftadkLzPyzfGglNo5Re9wf2pUOcf6bNS5ljeNV/0oRZbM w==;
X-CSE-ConnectionGUID: ayseWJmVQDaYNOVzOfsWYw==
X-CSE-MsgGUID: KyfknxdpQyier9vmnsWjvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13902594"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="13902594"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 11:25:49 -0700
X-CSE-ConnectionGUID: xaieUJ/hTqSJUmCcslR5Cw==
X-CSE-MsgGUID: 9sPmAyWZTwe/w4yXYNG5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="37903847"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 11:25:46 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 11:25:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 11:25:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 11:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTWZVpYOflkfSRGYKMilL41THvr/TltersV5e+tkOc+2eMrJrWOn6DgFpFmqDAEHNYfGP2TA1MgnHiDaI1wx/w4IIGkJx/pSMwUDbZcrAmixqr0bJ4VqrbBDOducLymupESWAlvTcLm/UDpVzvdhnP4SnGgb0zmVdmRILJmdcwE1gc502TXL1nr6eoAFrNUZ3DSrwil3P2TfMvUpOSsJ6b3fCB6w7N+BKd/dVW1qUVem8/VaLIUz1JkjcaAXTvfFIxhJjB1uE2Lg5Bh6Rvra9zXY/VWpkxTGjaHSoXW8AsXVJ4TBoF4p1g+ey+RSYAfh9e3M6+oZgRHGgCxParnbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkLNMXP7xXaxY1I8EVwJSsV759zK03+t/dZG7koDxTc=;
 b=asuPtQBbBWMLoLcYja2jIg7Fy8Mc40QCOhYb+J85jm84Z50kOHk1ZA0IykDGSss1HqBpfrh8I5UZgSR//wzidxH7nJdNdlN9mOjS3+pGEyQdXVt94mDUhHmBLYdl8oNeNOg4yzrGCoPmBCgRdBCbhBfyL/ZsW6gMLNr3zkWAmIlsR6AQuMzIHC0+ToBcIV17OSWRU+gJ3sW0iabFdbFL1AGnORdh1o64sj9DKF3j5/AtK0ABKFnFTRRP271Pt9T9d3GOqjYPwCZVYkalAmx1enM3a8TjazI7s9/4OTrN/qtp1vTBWOYJx6CjSn+nACnOuxeN/GdNktdoGx7cViSG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 18:25:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 18:25:40 +0000
Date: Tue, 4 Jun 2024 14:25:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais
 <apais@linux.microsoft.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>, "Giovanni
 Cabiddu" <giovanni.cabiddu@intel.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck
 <linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti
 <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones
 <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman
 <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, "Johannes
 Berg" <johannes.berg@intel.com>, Gregory Greenman
 <gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>, Vinod Koul
 <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Nikita Kravets
 <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Stanley Chang
 <stanley_chang@realtek.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers
 <ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar
 <mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, "Daniel
 Bristot de Oliveira" <bristot@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu
 <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>,
 "Mimi Zohar" <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 "Roberto Sassu" <roberto.sassu@huawei.com>, Eric Snowberg
 <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mark Brown <broonie@kernel.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <openipmi-developer@lists.sourceforge.net>,
 <linux-clk@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, 
 <linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <qat-linux@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <linux-omap@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <linux-bcachefs@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <cgroups@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <apparmor@lists.ubuntu.com>,
 <linux-security-module@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, David Howells <dhowells@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
 <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Daniel Scally
 <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko
 Stuebner <heiko@sntech.de>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding
 <thierry.reding@gmail.com>, "Jonathan Hunter" <jonathanh@nvidia.com>, Huang
 Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, "Danilo Krummrich" <dakr@redhat.com>, Jean Delvare
 <jdelvare@suse.com>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Tony
 Lindgren" <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>, Hu
 Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, Potnuri Bharat Teja
 <bharat@chelsio.com>, "Eric Dumazet" <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Reichel
 <sre@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, "Helge Deller" <deller@gmx.de>, Brian Foster
 <bfoster@redhat.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo
 <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner
 <hannes@cmpxchg.org>, "Peter Zijlstra" <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, "Vincent Guittot" <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira
 <bristot@redhat.com>, "Valentin Schneider" <vschneid@redhat.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jason Baron <jbaron@akamai.com>, Jim Cromie
 <jim.cromie@gmail.com>, Paul Moore <paul@paul-moore.com>, James Morris
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>, "Clemens Ladisch" <clemens@ladisch.de>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <Zl9b_Wh_Lx7Aln1q@intel.com>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: c633785d-bbf5-43e7-4ee4-08dc84c3bc62
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yH6dJGtF8w7D28HnV+mlxKQLVn13IUUDoBT/pyhsV087Rm/LXeuTBjnfJOXN?=
 =?us-ascii?Q?3PmKoU5Sf06gIpUFSJq2nbMg0M6burF2ImqYVq7rh/TWohW7piDXu7moKcfP?=
 =?us-ascii?Q?ditly3QpT9TN64mKBmiFacVEx02j7pAKytuwgBPIujoGMFXniSdBA2S1RJED?=
 =?us-ascii?Q?qXQNU5roskDPwW/FzlgD6XMgqVoDXlQWcF1MRALcfdGDc6EagslhtukXd7it?=
 =?us-ascii?Q?efGjSnRV4kcYxWyJKNUfciRaXBGXg9kBJAg1fC8zTmjEpac/bcA3gt0UDVs+?=
 =?us-ascii?Q?KA6iyFWNGrgwRKcWSFaEmVZPggJyfCU3a1EulDdV/nX9xZk5nm6RZfDuHVuJ?=
 =?us-ascii?Q?/fS87Q8YDJPnPB4UuU3CNCUyjR0+mA8NchpHd7LWmBhCCZKldfOl/dNoaKsf?=
 =?us-ascii?Q?EzsiPu0s4vuHI0s7gNJ6Y7EWr8XmG7mpqUgcEEWRNV2Kbh+PkR7ffWPpnKz7?=
 =?us-ascii?Q?JfxGWuiM+pSkplv+LlPI+chssjz1S2JxIIsPyt0ukemfUhGnJZltaXgCRwZu?=
 =?us-ascii?Q?u+0ujfrZLR3dpVhb3BujT+AOuJSSXXwqclYDFY6y/13LnRvKTnGFReP/e9Zd?=
 =?us-ascii?Q?T5KdsD8fGMsC9q9oFGWkTOYtY7IMPSGo4OlcGXpo8geqppqXeFXWNnU8cobB?=
 =?us-ascii?Q?OH+bSkBibkRILh91+G4QpFKuRByWlMPEKIIiHCX5s4f1cCLbNdDCTDQknkz+?=
 =?us-ascii?Q?BUpHOX9yMxM5iXNrxiHXyCtcAazMfqZ8MC9k6xi9CmdVLfiRnQ9fWy56Y/OL?=
 =?us-ascii?Q?MxL6Ktx+FxbsYqn4bRl2vG6MNrV57F6LeL7+t69Ywpvmg7X0/ZjDvRU84iZQ?=
 =?us-ascii?Q?CpoYcimVE/vj9CnYW7Q06FkaTdZukc2CKHKGIvXNfGFDicXz3nRHegr+H0m0?=
 =?us-ascii?Q?pOsqTi9HlEgK35SeOyhlet7ShMwn/KH87tDiiTSZLXo3iK1h3cRv3hG79VLd?=
 =?us-ascii?Q?SqP4Qof1xWPRuQTqAi8p+x3OJkiwW5Is3lRxl7o89di4Wtyd/S0uaIhssa3/?=
 =?us-ascii?Q?Sa05lOriST/8sL5VUWOHCNN5hyuTkMuxwKHbRTCnZHpBo8Me25okAbEuUX6O?=
 =?us-ascii?Q?4X8MP1IX5u8WnA9Xuzym+bjpRZVNCFh0P+qK0ux0j2yW+o3Fbjsh/oJDpXWd?=
 =?us-ascii?Q?+KbtgdO8A5gRU6C8tuK6oVTjob2JKYnNdEPk5YhHny9a9eutJD/KyiZFZdOu?=
 =?us-ascii?Q?FNY1JkDjPJTW15oiaqNvZJ839GWmUFH9Dk8jSy2Zg053behymlyLLfh1J4cU?=
 =?us-ascii?Q?WBdsoo85/fR5hw8Y3dGBrA6Tn7aEL7oAyp6iBuENUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gh9ExhWf1AVMEeyPWL9s2qehO135/h6rxBXNKYVMAnSOqyLnZC4IkLfdfjKy?=
 =?us-ascii?Q?OIPo87A771hE9lyR+b34vg3xDieO8ktVhERCmXmJtI4FYJSEC9CIA6SAoE1G?=
 =?us-ascii?Q?c4G2DJRMsiku7y9Wi4J7k6L27XLJBkxUnZmUURvlJlDgNubC4ATQCdyuQ6TX?=
 =?us-ascii?Q?614OrMXeg8Nyq/1+6ZCVjEpJG+WNVZInrMcK98ux/Dp933DqiVZf1CBQI4vb?=
 =?us-ascii?Q?QNQA73pV6UfSXiKUVpBQCbm9RwSXxvq5+8A+M1Fzo5WirfKDJhCw6FxVWxl4?=
 =?us-ascii?Q?1wCVQTrRIpvGH2nZPIotCLEaJOOr01WudQ9pdT90uZjGXK6f39CVDxFhQao8?=
 =?us-ascii?Q?hxXfsvH+IKwuqP8XuVlCSiAhzncq3GMMU15EUCjfjY3GS1RM843aKZ/YdzFZ?=
 =?us-ascii?Q?7ADjQF4StHXAIHLGIEbwzAIQNM9+noivUc5kZ/B3GRUPsiRYwKqFHCcz9BBu?=
 =?us-ascii?Q?IqUVNQ4Asj15olNJvoMN0w9Gj5v157mO6o0TV8oQBmaXFr1DHbncsdon7n4T?=
 =?us-ascii?Q?U+yNvj6AivJTEQQqTtaE3FRobiyl6/a0wI3gRHfz6EMmaXBb426O4txgrcLm?=
 =?us-ascii?Q?HXzZ2GXXT8Jya0ZMlXCN/RxUArfa2mHA8+3qPxhxKdUl1HnUDdNndI6Wj2wt?=
 =?us-ascii?Q?NdAzqVy4d4z8G24++pu2fIUzbmnTcG+i4XBrpvm4OR1i7UghhJLplcUaC4Bo?=
 =?us-ascii?Q?MkEwW9MI1jFJnZYXK50KySU+BuldqRmtpg27pQLsqToD/acVA3tT6thobBVe?=
 =?us-ascii?Q?2XZK7ntIk+uudiCE5OjWOWuutij46mYmb97xZV0N1PSUb5h761GNyMIkvkgV?=
 =?us-ascii?Q?HwljRmfTWAHT5Lq5QFpgZN+vxemZScntZwOm5zqbCtpRm1DyZJQ7Tj4xmI18?=
 =?us-ascii?Q?zHBne6SCVACBwDoeW3XUU6qob2RZwYfkcP/ensOm7j6K6TsasAxJfsKit6U1?=
 =?us-ascii?Q?9PvZqhbH9WSns7QOyWJcFxFA0LyApbBtilC9YYJpylEtcgBFY8+gjfYcydRt?=
 =?us-ascii?Q?3/7JjjrrWHnpIigR+eQhNgiaxRZmcvzvWF7XodxW8koRagx8BvS3dsb9IBHU?=
 =?us-ascii?Q?SPpCsZKyHRm2KRC3ZcTXflJ2v7cb//elfSEdMzkHOMgtX1O538WGOG/fL1bM?=
 =?us-ascii?Q?xRbhnmgF7nsSX7ZvFAUx2vNYgw3JJjMJ+hm/O76UsJf5OlxIPDCHQIGSRJ3V?=
 =?us-ascii?Q?ZcdpAG1U6poZTr8JwGd2ZzHctD1SoenkwdwbO+Fsd4LsCAF4C7mkkX+GcvPH?=
 =?us-ascii?Q?ew5t3+4GE4nHJUb5UM0H+8ZtbPtFoOOmw/MQugYoTyy19PIrMS/aFjCQoW+J?=
 =?us-ascii?Q?w7jrsGqvCz46sIY0Ml7vI+RquGCdwMV6/347ieX1Mn+p4fGfQxTIoU+Gh8Qe?=
 =?us-ascii?Q?ymcP+9wAQF9FfI/VTgchKjAxDAo/a9AgI5nU+b82fPFEQYJ7drnU1XuTLRWf?=
 =?us-ascii?Q?+5bjfK3OWCMuL6gELErtH8i0XEK6szinP9WQMNuWLQ6SijOB1GWKikF3K54S?=
 =?us-ascii?Q?KDxoLe6pJg2oXPfOvDOPrbNm/aKBfHMfKtBwg/uJnhou2aZyyQ6Yd5XmOjaL?=
 =?us-ascii?Q?rQspvRKjMu1i1vg3LokhDk0Jy/zz23DKwvVRW7Jj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c633785d-bbf5-43e7-4ee4-08dc84c3bc62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:25:40.0172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxTZtJytl4zyFOPGwk3NGxw36CFPrJyhroH3q4MfMBqxDVsxvNuwwG5cS32uC6g0FL5/UvysTH7SmaDxLAGXyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 04 Jun 2024 18:59:17 +0000
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

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Compile tested with `make allyesconfig` and `make allmodconfig`
> on x86_64, arm, aarch64, powerpc64 (8 builds total).
> 
> I guess the best is to apply it to Linus' tree directly.
> And now it seems a good timing as there are no new users
> of this API either in v6.10-rcX, or in Linux Next.
> 
> But if you think differently, tell me.
> 
>  arch/powerpc/xmon/xmon.c                      |  5 ++--
>  arch/x86/kernel/cpu/mtrr/if.c                 |  4 +--
>  crypto/asymmetric_keys/pkcs7_verify.c         |  4 +--
>  drivers/acpi/scan.c                           |  4 +--
>  drivers/ata/pata_hpt366.c                     |  2 +-
>  drivers/ata/pata_hpt37x.c                     |  2 +-
>  drivers/base/property.c                       |  6 ++--
>  drivers/char/ipmi/ipmi_msghandler.c           |  2 +-
>  drivers/char/ipmi/ipmi_si_hardcode.c          |  2 +-
>  drivers/clk/bcm/clk-bcm2835.c                 |  4 +--
>  drivers/clk/rockchip/clk.c                    |  4 +--
>  drivers/clk/tegra/clk-tegra124-emc.c          |  7 ++---
>  drivers/cpufreq/amd-pstate.c                  |  4 +--
>  drivers/cpufreq/intel_pstate.c                |  2 +-
>  .../intel/qat/qat_common/adf_cfg_services.c   |  5 ++--
>  .../gpu/drm/drm_panel_orientation_quirks.c    |  2 +-
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  4 +--
>  drivers/gpu/drm/nouveau/dispnv50/crc.c        |  2 +-
>  drivers/hwmon/ltc4282.c                       | 14 ++++-----
>  drivers/hwmon/nct6775-platform.c              |  6 ++--
>  drivers/hwtracing/intel_th/msu.c              |  2 +-
>  drivers/i2c/busses/i2c-i801.c                 |  4 +--
>  drivers/leds/leds-sun50i-a100.c               |  2 +-
>  drivers/mfd/omap-usb-host.c                   |  2 +-
>  drivers/mmc/host/sdhci-xenon-phy.c            | 13 ++++-----
>  drivers/mtd/nand/raw/nand_macronix.c          | 10 ++-----
>  .../net/ethernet/chelsio/cxgb4/cudbg_lib.c    |  6 ++--
>  .../net/wireless/intel/iwlwifi/mvm/debugfs.c  |  2 +-
>  drivers/pci/pcie/aer.c                        |  2 +-
>  drivers/phy/mediatek/phy-mtk-tphy.c           |  8 ++---
>  drivers/phy/tegra/xusb.c                      |  4 +--
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c   |  6 ++--
>  drivers/pinctrl/pinmux.c                      |  6 ++--
>  drivers/platform/x86/hp/hp-wmi.c              | 29 +++++++------------
>  drivers/platform/x86/msi-ec.c                 |  4 +--
>  drivers/power/supply/ab8500_btemp.c           |  2 +-
>  drivers/power/supply/ab8500_chargalg.c        |  2 +-
>  drivers/power/supply/ab8500_charger.c         |  2 +-
>  drivers/power/supply/ab8500_fg.c              |  2 +-
>  drivers/staging/gdm724x/gdm_tty.c             |  5 ++--
>  .../int340x_thermal/processor_thermal_rfim.c  |  4 +--
>  .../processor_thermal_wt_req.c                |  2 +-
>  drivers/usb/common/common.c                   |  8 ++---
>  drivers/usb/dwc3/dwc3-rtk.c                   |  2 +-
>  drivers/usb/typec/class.c                     | 14 ++++-----
>  drivers/usb/typec/tipd/core.c                 |  3 +-
>  drivers/video/fbdev/pxafb.c                   |  4 +--
>  fs/bcachefs/compress.c                        |  2 +-
>  fs/bcachefs/opts.c                            |  4 +--
>  fs/bcachefs/util.c                            |  4 +--
>  fs/ubifs/auth.c                               |  8 ++---
>  include/linux/string.h                        | 12 +++++++-
>  kernel/cgroup/rdma.c                          |  2 +-
>  kernel/sched/debug.c                          |  2 +-
>  kernel/trace/trace.c                          |  4 +--
>  kernel/trace/trace_osnoise.c                  |  4 +--
>  lib/dynamic_debug.c                           |  5 ++--
>  lib/string_helpers.c                          |  6 ++--
>  mm/mempolicy.c                                |  4 +--
>  mm/vmpressure.c                               |  4 +--
>  security/apparmor/lsm.c                       |  9 +++---
>  security/integrity/ima/ima_main.c             |  2 +-
>  security/integrity/ima/ima_policy.c           |  2 +-
>  sound/firewire/oxfw/oxfw.c                    |  2 +-
>  sound/pci/oxygen/oxygen_mixer.c               |  2 +-
>  sound/soc/codecs/max98088.c                   |  2 +-
>  sound/soc/codecs/max98095.c                   |  2 +-
>  sound/soc/soc-dapm.c                          |  5 ++--
>  69 files changed, 150 insertions(+), 174 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index bd4813bad317..f479cc62674a 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -3478,8 +3478,7 @@ skipbl(void)
>  	return c;
>  }
>  
> -#define N_PTREGS	44
> -static const char *regnames[N_PTREGS] = {
> +static const char *regnames[] = {
>  	"r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
>  	"r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
>  	"r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> @@ -3514,7 +3513,7 @@ scanhex(unsigned long *vp)
>  			regname[i] = c;
>  		}
>  		regname[i] = 0;
> -		i = match_string(regnames, N_PTREGS, regname);
> +		i = match_string(regnames, regname);
>  		if (i < 0) {
>  			printf("invalid register name '%%%s'\n", regname);
>  			return 0;
> diff --git a/arch/x86/kernel/cpu/mtrr/if.c b/arch/x86/kernel/cpu/mtrr/if.c
> index a5c506f6da7f..9b749b848123 100644
> --- a/arch/x86/kernel/cpu/mtrr/if.c
> +++ b/arch/x86/kernel/cpu/mtrr/if.c
> @@ -4,8 +4,8 @@
>  #include <linux/uaccess.h>
>  #include <linux/proc_fs.h>
>  #include <linux/ctype.h>
> -#include <linux/string.h>
>  #include <linux/slab.h>
> +#include <linux/string_helpers.h>
>  #include <linux/init.h>
>  
>  #define LINE_SIZE 80
> @@ -139,7 +139,7 @@ mtrr_write(struct file *file, const char __user *buf, size_t len, loff_t * ppos)
>  		return -EINVAL;
>  	ptr = skip_spaces(ptr + 5);
>  
> -	i = match_string(mtrr_strings, MTRR_NUM_TYPES, ptr);
> +	i = match_string(mtrr_strings, ptr);
>  	if (i < 0)
>  		return i;
>  
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
> index f0d4ff3c20a8..1139d9d1c89a 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -141,8 +141,8 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
>  	*buf = sinfo->sig->digest;
>  	*len = sinfo->sig->digest_size;
>  
> -	i = match_string(hash_algo_name, HASH_ALGO__LAST,
> -			 sinfo->sig->hash_algo);
> +	i = __match_string(hash_algo_name, HASH_ALGO__LAST,
> +			   sinfo->sig->hash_algo);
>  	if (i >= 0)
>  		*hash_algo = i;
>  
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 503773707e01..9cb350de30f0 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -798,7 +798,7 @@ static bool acpi_info_matches_ids(struct acpi_device_info *info,
>  	if (!(info->valid & ACPI_VALID_HID))
>  		return false;
>  
> -	index = match_string(ids, -1, info->hardware_id.string);
> +	index = __match_string(ids, -1, info->hardware_id.string);
>  	if (index >= 0)
>  		return true;
>  
> @@ -809,7 +809,7 @@ static bool acpi_info_matches_ids(struct acpi_device_info *info,
>  		return false;
>  
>  	for (i = 0; i < cid_list->count; i++) {
> -		index = match_string(ids, -1, cid_list->ids[i].string);
> +		index = __match_string(ids, -1, cid_list->ids[i].string);
>  		if (index >= 0)
>  			return true;
>  	}
> diff --git a/drivers/ata/pata_hpt366.c b/drivers/ata/pata_hpt366.c
> index bdccd1ba1524..8134f9290791 100644
> --- a/drivers/ata/pata_hpt366.c
> +++ b/drivers/ata/pata_hpt366.c
> @@ -178,7 +178,7 @@ static int hpt_dma_blacklisted(const struct ata_device *dev, char *modestr,
>  
>  	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
>  
> -	i = match_string(list, -1, model_num);
> +	i = __match_string(list, -1, model_num);
>  	if (i >= 0) {
>  		ata_dev_warn(dev, "%s is not supported for %s\n", modestr, list[i]);
>  		return 1;
> diff --git a/drivers/ata/pata_hpt37x.c b/drivers/ata/pata_hpt37x.c
> index c0329cf01135..2d0b659bbd65 100644
> --- a/drivers/ata/pata_hpt37x.c
> +++ b/drivers/ata/pata_hpt37x.c
> @@ -226,7 +226,7 @@ static int hpt_dma_blacklisted(const struct ata_device *dev, char *modestr,
>  
>  	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
>  
> -	i = match_string(list, -1, model_num);
> +	i = __match_string(list, -1, model_num);
>  	if (i >= 0) {
>  		ata_dev_warn(dev, "%s is not supported for %s\n",
>  			     modestr, list[i]);
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 837d77e3af2b..075c9dbd7aa5 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -15,7 +15,7 @@
>  #include <linux/property.h>
>  #include <linux/phy.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  #include <linux/types.h>
>  
>  struct fwnode_handle *__dev_fwnode(struct device *dev)
> @@ -489,7 +489,7 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
>  	if (ret < 0)
>  		goto out_free;
>  
> -	ret = match_string(values, nval, string);
> +	ret = __match_string(values, nval, string);
>  	if (ret < 0)
>  		ret = -ENODATA;
>  
> @@ -526,7 +526,7 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
>  	if (ret)
>  		return ret;
>  
> -	ret = match_string(array, n, string);
> +	ret = __match_string(array, n, string);
>  	if (ret < 0)
>  		ret = -ENOENT;
>  
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index e12b531f5c2f..c7526eb1e963 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -78,7 +78,7 @@ static int panic_op_write_handler(const char *val,
>  	int e;
>  
>  	strscpy(valcp, val, sizeof(valcp));
> -	e = match_string(ipmi_panic_event_str, -1, strstrip(valcp));
> +	e = __match_string(ipmi_panic_event_str, -1, strstrip(valcp));
>  	if (e < 0)
>  		return e;
>  
> diff --git a/drivers/char/ipmi/ipmi_si_hardcode.c b/drivers/char/ipmi/ipmi_si_hardcode.c
> index 0c92fa3eee88..4d3275374a53 100644
> --- a/drivers/char/ipmi/ipmi_si_hardcode.c
> +++ b/drivers/char/ipmi/ipmi_si_hardcode.c
> @@ -70,7 +70,7 @@ static void __init ipmi_hardcode_init_one(const char *si_type_str,
>  	if (!si_type_str || !*si_type_str) {
>  		p.type = SI_KCS;
>  	} else {
> -		t = match_string(si_to_str, -1, si_type_str);
> +		t = __match_string(si_to_str, -1, si_type_str);
>  		if (t < 0) {
>  			pr_warn("Interface type specified for interface %d, was invalid: %s\n",
>  				i, si_type_str);
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index fb04734afc80..9446422d5fa8 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1447,9 +1447,7 @@ static struct clk_hw *bcm2835_register_clock(struct bcm2835_cprman *cprman,
>  	for (i = 0; i < clock_data->num_mux_parents; i++) {
>  		parents[i] = clock_data->parents[i];
>  
> -		ret = match_string(cprman_parent_names,
> -				   ARRAY_SIZE(cprman_parent_names),
> -				   parents[i]);
> +		ret = match_string(cprman_parent_names, parents[i]);
>  		if (ret >= 0)
>  			parents[i] = cprman->real_parent_names[ret];
>  	}
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index 73d2cbdc716b..30414d081f46 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -266,8 +266,8 @@ static struct clk *rockchip_clk_register_frac_branch(
>  		struct clk *mux_clk;
>  		int ret;
>  
> -		frac->mux_frac_idx = match_string(child->parent_names,
> -						  child->num_parents, name);
> +		frac->mux_frac_idx = __match_string(child->parent_names,
> +						    child->num_parents, name);
>  		frac->mux_ops = &clk_mux_ops;
>  		frac->clk_nb.notifier_call = rockchip_clk_frac_notifier_cb;
>  
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
> index 2a6db0434281..a2709ed60ee7 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -20,7 +20,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/sort.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  
>  #include <soc/tegra/fuse.h>
>  
> @@ -413,13 +413,12 @@ static int load_one_timing_from_dt(struct tegra_clk_emc *tegra,
>  	}
>  
>  	timing->parent_index = 0xff;
> -	i = match_string(emc_parent_clk_names, ARRAY_SIZE(emc_parent_clk_names),
> -			 __clk_get_name(timing->parent));
> +	i = match_string(emc_parent_clk_names, __clk_get_name(timing->parent));
>  	if (i < 0) {
>  		pr_err("timing %pOF: %s is not a valid parent\n",
>  		       node, __clk_get_name(timing->parent));
>  		clk_put(timing->parent);
> -		return -EINVAL;
> +		return i;
>  	}
>  
>  	timing->parent_index = i;
> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 1b7e82a0ad2e..b6f52f44625f 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -1117,9 +1117,9 @@ static ssize_t store_energy_performance_preference(
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	ret = match_string(energy_perf_strings, -1, str_preference);
> +	ret = __match_string(energy_perf_strings, -1, str_preference);
>  	if (ret < 0)
> -		return -EINVAL;
> +		return ret;
>  
>  	mutex_lock(&amd_pstate_limits_lock);
>  	ret = amd_pstate_set_energy_pref_index(cpudata, ret);
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index 4b986c044741..1c2ee10415a2 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -832,7 +832,7 @@ static ssize_t store_energy_performance_preference(
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	ret = match_string(energy_perf_strings, -1, str_preference);
> +	ret = __match_string(energy_perf_strings, -1, str_preference);
>  	if (ret < 0) {
>  		if (!boot_cpu_has(X86_FEATURE_HWP_EPP))
>  			return ret;
> diff --git a/drivers/crypto/intel/qat/qat_common/adf_cfg_services.c b/drivers/crypto/intel/qat/qat_common/adf_cfg_services.c
> index 268052294468..4b8c45e8b164 100644
> --- a/drivers/crypto/intel/qat/qat_common/adf_cfg_services.c
> +++ b/drivers/crypto/intel/qat/qat_common/adf_cfg_services.c
> @@ -3,7 +3,7 @@
>  
>  #include <linux/export.h>
>  #include <linux/pci.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  #include "adf_cfg.h"
>  #include "adf_cfg_services.h"
>  #include "adf_cfg_strings.h"
> @@ -35,8 +35,7 @@ int adf_get_service_enabled(struct adf_accel_dev *accel_dev)
>  		return ret;
>  	}
>  
> -	ret = match_string(adf_cfg_services, ARRAY_SIZE(adf_cfg_services),
> -			   services);
> +	ret = match_string(adf_cfg_services, services);
>  	if (ret < 0)
>  		dev_err(&GET_DEV(accel_dev),
>  			"Invalid value of " ADF_SERVICES_ENABLED " param: %s\n",
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index aa93129c3397..624743caac4c 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -481,7 +481,7 @@ int drm_get_panel_orientation_quirk(int width, int height)
>  		if (!bios_date)
>  			continue;
>  
> -		i = match_string(data->bios_dates, -1, bios_date);
> +		i = __match_string(data->bios_dates, -1, bios_date);
>  		if (i >= 0)
>  			return data->orientation;
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> index 5a468ed6e26c..f9e7c66fd538 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> @@ -426,7 +426,7 @@ display_crc_ctl_parse_source(const char *buf, enum intel_pipe_crc_source *s)
>  		return 0;
>  	}
>  
> -	i = match_string(pipe_crc_sources, ARRAY_SIZE(pipe_crc_sources), buf);
> +	i = match_string(pipe_crc_sources, buf);


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(I believe that the new _match_string(str1, size, str2) deserves a better name,
but since I'm bad with naming stuff, I don't have any good suggestion)

>  	if (i < 0)
>  		return i;
>  
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..7fb9f5345654 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -645,8 +645,8 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
>  	int i;
>  
>  	if (nouveau_tv_norm) {
> -		i = match_string(nv17_tv_norm_names, num_tv_norms,
> -				 nouveau_tv_norm);
> +		i = __match_string(nv17_tv_norm_names, num_tv_norms,
> +				   nouveau_tv_norm);
>  		if (i < 0)
>  			NV_WARN(drm, "Invalid TV norm setting \"%s\"\n",
>  				nouveau_tv_norm);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index 5936b6b3b15d..ea35d283b2d2 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -38,7 +38,7 @@ static int nv50_crc_parse_source(const char *buf, enum nv50_crc_source *s)
>  		return 0;
>  	}
>  
> -	i = match_string(nv50_crc_sources, ARRAY_SIZE(nv50_crc_sources), buf);
> +	i = match_string(nv50_crc_sources, buf);
>  	if (i < 0)
>  		return i;
>  
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index 4f608a3790fb..3546f5a7e7bd 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -21,7 +21,7 @@
>  #include <linux/mutex.h>
>  #include <linux/regmap.h>
>  #include <linux/property.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  #include <linux/units.h>
>  #include <linux/util_macros.h>
>  
> @@ -1282,8 +1282,7 @@ static int ltc4282_gpio_setup(struct ltc4282_state *st, struct device *dev)
>  
>  	ret = device_property_read_string(dev, "adi,gpio1-mode", &func);
>  	if (!ret) {
> -		ret = match_string(ltc4282_gpio1_modes,
> -				   ARRAY_SIZE(ltc4282_gpio1_modes), func);
> +		ret = match_string(ltc4282_gpio1_modes, func);
>  		if (ret < 0)
>  			return dev_err_probe(dev, ret,
>  					     "Invalid func(%s) for gpio1\n",
> @@ -1298,8 +1297,7 @@ static int ltc4282_gpio_setup(struct ltc4282_state *st, struct device *dev)
>  
>  	ret = device_property_read_string(dev, "adi,gpio2-mode", &func);
>  	if (!ret) {
> -		ret = match_string(ltc4282_gpio2_modes,
> -				   ARRAY_SIZE(ltc4282_gpio2_modes), func);
> +		ret = match_string(ltc4282_gpio2_modes, func);
>  		if (ret < 0)
>  			return dev_err_probe(dev, ret,
>  					     "Invalid func(%s) for gpio2\n",
> @@ -1463,8 +1461,7 @@ static int ltc4282_setup(struct ltc4282_state *st, struct device *dev)
>  	ret = device_property_read_string(dev, "adi,overvoltage-dividers",
>  					  &divider);
>  	if (!ret) {
> -		int div = match_string(ltc4282_dividers,
> -				       ARRAY_SIZE(ltc4282_dividers), divider);
> +		int div = match_string(ltc4282_dividers, divider);
>  		if (div < 0)
>  			return dev_err_probe(dev, -EINVAL,
>  					     "Invalid val(%s) for adi,overvoltage-divider\n",
> @@ -1478,8 +1475,7 @@ static int ltc4282_setup(struct ltc4282_state *st, struct device *dev)
>  	ret = device_property_read_string(dev, "adi,undervoltage-dividers",
>  					  &divider);
>  	if (!ret) {
> -		int div = match_string(ltc4282_dividers,
> -				       ARRAY_SIZE(ltc4282_dividers), divider);
> +		int div = match_string(ltc4282_dividers, divider);
>  		if (div < 0)
>  			return dev_err_probe(dev, -EINVAL,
>  					     "Invalid val(%s) for adi,undervoltage-divider\n",
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index 9aa4dcf4a6f3..eb7eef9d2a76 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -1514,13 +1514,11 @@ static int __init sensors_nct6775_platform_init(void)
>  
>  	if (board_name && board_vendor &&
>  	    !strcmp(board_vendor, "ASUSTeK COMPUTER INC.")) {
> -		err = match_string(asus_wmi_boards, ARRAY_SIZE(asus_wmi_boards),
> -				   board_name);
> +		err = match_string(asus_wmi_boards, board_name);
>  		if (err >= 0)
>  			access = nct6775_determine_access(ASUSWMI_DEVICE_UID);
>  
> -		err = match_string(asus_msi_boards, ARRAY_SIZE(asus_msi_boards),
> -				   board_name);
> +		err = match_string(asus_msi_boards, board_name);
>  		if (err >= 0)
>  			access = nct6775_determine_access(ASUSMSI_DEVICE_UID);
>  	}
> diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
> index be63d5b8f193..b083f1360111 100644
> --- a/drivers/hwtracing/intel_th/msu.c
> +++ b/drivers/hwtracing/intel_th/msu.c
> @@ -1901,7 +1901,7 @@ mode_store(struct device *dev, struct device_attribute *attr, const char *buf,
>  	if (!mode)
>  		return -ENOMEM;
>  
> -	i = match_string(msc_mode, ARRAY_SIZE(msc_mode), mode);
> +	i = match_string(msc_mode, mode);
>  	if (i >= 0) {
>  		kfree(mode);
>  		goto found;
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index d2d2a6dbe29f..0eccb636b2fe 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -111,7 +111,7 @@
>  #include <linux/io.h>
>  #include <linux/dmi.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  #include <linux/completion.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
> @@ -1186,7 +1186,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>  	if (!hid)
>  		goto smo88xx_not_found;
>  
> -	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
> +	i = match_string(acpi_smo8800_ids, hid);
>  	if (i < 0)
>  		goto smo88xx_not_found;
>  
> diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
> index 119eff9471f0..4220f1f8a503 100644
> --- a/drivers/leds/leds-sun50i-a100.c
> +++ b/drivers/leds/leds-sun50i-a100.c
> @@ -256,7 +256,7 @@ static int sun50i_a100_ledc_parse_format(struct device *dev,
>  
>  	device_property_read_string(dev, "allwinner,pixel-format", &format);
>  
> -	i = match_string(sun50i_a100_ledc_formats, ARRAY_SIZE(sun50i_a100_ledc_formats), format);
> +	i = match_string(sun50i_a100_ledc_formats, format);
>  	if (i < 0)
>  		return dev_err_probe(dev, i, "Bad pixel format '%s'\n", format);
>  
> diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
> index 949feb03d4f8..06c208d8a992 100644
> --- a/drivers/mfd/omap-usb-host.c
> +++ b/drivers/mfd/omap-usb-host.c
> @@ -498,7 +498,7 @@ static int usbhs_omap_get_dt_pdata(struct device *dev,
>  			continue;
>  
>  		/* get 'enum usbhs_omap_port_mode' from port mode string */
> -		ret = match_string(port_modes, ARRAY_SIZE(port_modes), mode);
> +		ret = match_string(port_modes, mode);
>  		if (ret < 0) {
>  			dev_warn(dev, "Invalid port%d-mode \"%s\" in device tree\n",
>  					i, mode);
> diff --git a/drivers/mmc/host/sdhci-xenon-phy.c b/drivers/mmc/host/sdhci-xenon-phy.c
> index cc9d28b75eb9..1865e26ae736 100644
> --- a/drivers/mmc/host/sdhci-xenon-phy.c
> +++ b/drivers/mmc/host/sdhci-xenon-phy.c
> @@ -135,15 +135,14 @@ struct xenon_emmc_phy_regs {
>  	u32 logic_timing_val;
>  };
>  
> -static const char * const phy_types[] = {
> -	"emmc 5.0 phy",
> -	"emmc 5.1 phy"
> -};
> -
>  enum xenon_phy_type_enum {
>  	EMMC_5_0_PHY,
>  	EMMC_5_1_PHY,
> -	NR_PHY_TYPES
> +};
> +
> +static const char * const phy_types[] = {
> +	[EMMC_5_0_PHY] = "emmc 5.0 phy",
> +	[EMMC_5_1_PHY] = "emmc 5.1 phy",
>  };
>  
>  enum soc_pad_ctrl_type {
> @@ -852,7 +851,7 @@ static int xenon_add_phy(struct device *dev, struct sdhci_host *host,
>  	struct xenon_priv *priv = sdhci_pltfm_priv(pltfm_host);
>  	int ret;
>  
> -	priv->phy_type = match_string(phy_types, NR_PHY_TYPES, phy_name);
> +	priv->phy_type = match_string(phy_types, phy_name);
>  	if (priv->phy_type < 0) {
>  		dev_err(mmc_dev(host->mmc),
>  			"Unable to determine PHY name %s. Use default eMMC 5.1 PHY\n",
> diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
> index e229de32ff50..8b3fb2c72bd6 100644
> --- a/drivers/mtd/nand/raw/nand_macronix.c
> +++ b/drivers/mtd/nand/raw/nand_macronix.c
> @@ -178,8 +178,7 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
>  	if (!chip->parameters.supports_set_get_features)
>  		return;
>  
> -	i = match_string(broken_get_timings, ARRAY_SIZE(broken_get_timings),
> -			 chip->parameters.model);
> +	i = match_string(broken_get_timings, chip->parameters.model);
>  	if (i < 0)
>  		return;
>  
> @@ -317,8 +316,7 @@ static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
>  		"MX30UF4G28AD",
>  	};
>  
> -	i = match_string(deep_power_down_dev, ARRAY_SIZE(deep_power_down_dev),
> -			 chip->parameters.model);
> +	i = match_string(deep_power_down_dev, chip->parameters.model);
>  	if (i < 0)
>  		return;
>  
> @@ -461,9 +459,7 @@ static void macronix_nand_setup_otp(struct nand_chip *chip)
>  	};
>  	struct mtd_info *mtd;
>  
> -	if (match_string(supported_otp_models,
> -			 ARRAY_SIZE(supported_otp_models),
> -			 chip->parameters.model) < 0)
> +	if (match_string(supported_otp_models, chip->parameters.model) < 0)
>  		return;
>  
>  	if (!chip->parameters.supports_set_get_features)
> diff --git a/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c b/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c
> index 557c591a6ce3..cff23dc56641 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c
> @@ -4,7 +4,7 @@
>   */
>  
>  #include <linux/sort.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  
>  #include "t4_regs.h"
>  #include "cxgb4.h"
> @@ -1191,9 +1191,9 @@ static int cudbg_get_mem_region(struct adapter *padap,
>  	if (rc)
>  		return rc;
>  
> -	i = match_string(cudbg_region, ARRAY_SIZE(cudbg_region), region_name);
> +	i = match_string(cudbg_region, region_name);
>  	if (i < 0)
> -		return -EINVAL;
> +		return i;
>  
>  	idx = i;
>  	for (i = 0; i < meminfo->mem_c; i++) {
> diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
> index 79f4ac8cbc72..58388ca9ecfa 100644
> --- a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
> +++ b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
> @@ -724,7 +724,7 @@ iwl_dbgfs_bt_force_ant_write(struct iwl_mvm *mvm, char *buf,
>  	};
>  	int ret, bt_force_ant_mode;
>  
> -	ret = match_string(modes_str, ARRAY_SIZE(modes_str), buf);
> +	ret = match_string(modes_str, buf);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index ac6293c24976..2d317c7e1cea 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -210,7 +210,7 @@ void pcie_ecrc_get_policy(char *str)
>  {
>  	int i;
>  
> -	i = match_string(ecrc_policy_str, ARRAY_SIZE(ecrc_policy_str), str);
> +	i = match_string(ecrc_policy_str, str);
>  	if (i < 0)
>  		return;
>  
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index 25b86bbb9cec..762674acb7fc 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -389,7 +389,7 @@ static int u2_phy_params_show(struct seq_file *sf, void *unused)
>  	u32 val = 0;
>  	int ret;
>  
> -	ret = match_string(u2_phy_files, ARRAY_SIZE(u2_phy_files), fname);
> +	ret = match_string(u2_phy_files, fname);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -464,7 +464,7 @@ static ssize_t u2_phy_params_write(struct file *file, const char __user *ubuf,
>  	if (rc)
>  		return rc;
>  
> -	ret = match_string(u2_phy_files, ARRAY_SIZE(u2_phy_files), fname);
> +	ret = match_string(u2_phy_files, fname);
>  	if (ret < 0)
>  		return (ssize_t)ret;
>  
> @@ -530,7 +530,7 @@ static int u3_phy_params_show(struct seq_file *sf, void *unused)
>  	u32 tmp;
>  	int ret;
>  
> -	ret = match_string(u3_phy_files, ARRAY_SIZE(u3_phy_files), fname);
> +	ret = match_string(u3_phy_files, fname);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -590,7 +590,7 @@ static ssize_t u3_phy_params_write(struct file *file, const char __user *ubuf,
>  	if (rc)
>  		return rc;
>  
> -	ret = match_string(u3_phy_files, ARRAY_SIZE(u3_phy_files), fname);
> +	ret = match_string(u3_phy_files, fname);
>  	if (ret < 0)
>  		return (ssize_t)ret;
>  
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index cfdb54b6070a..5fb8656aa31d 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -123,7 +123,7 @@ int tegra_xusb_lane_parse_dt(struct tegra_xusb_lane *lane,
>  	if (err < 0)
>  		return err;
>  
> -	err = match_string(lane->soc->funcs, lane->soc->num_funcs, function);
> +	err = __match_string(lane->soc->funcs, lane->soc->num_funcs, function);
>  	if (err < 0) {
>  		dev_err(dev, "invalid function \"%s\" for lane \"%pOFn\"\n",
>  			function, np);
> @@ -748,7 +748,7 @@ static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
>  	usb2->internal = of_property_read_bool(np, "nvidia,internal");
>  
>  	if (!of_property_read_string(np, "mode", &mode)) {
> -		int err = match_string(modes, ARRAY_SIZE(modes), mode);
> +		int err = match_string(modes, mode);
>  		if (err < 0) {
>  			dev_err(&port->dev, "invalid value %s for \"mode\"\n",
>  				mode);
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 4c4ada06423d..55b5464595b5 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -352,7 +352,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
>  
>  	dev_dbg(dev, "enable function %s group %s\n", name, grp->name);
>  
> -	func = match_string(grp->funcs, NB_FUNCS, name);
> +	func = match_string(grp->funcs, name);
>  	if (func < 0)
>  		return -ENOTSUPP;
>  
> @@ -885,7 +885,7 @@ static int armada_37xx_fill_group(struct armada_37xx_pinctrl *info)
>  		for (j = 0; j < grp->extra_npins; j++)
>  			grp->pins[i+j] = grp->extra_pin + j;
>  
> -		for (f = 0; (f < NB_FUNCS) && grp->funcs[f]; f++) {
> +		for (f = 0; (f < ARRAY_SIZE(grp->funcs)) && grp->funcs[f]; f++) {
>  			int ret;
>  			/* check for unique functions and count groups */
>  			ret = armada_37xx_add_function(info->funcs, &funcsize,
> @@ -937,7 +937,7 @@ static int armada_37xx_fill_func(struct armada_37xx_pinctrl *info)
>  			struct armada_37xx_pin_group *gp = &info->groups[g];
>  			int f;
>  
> -			f = match_string(gp->funcs, NB_FUNCS, name);
> +			f = match_string(gp->funcs, name);
>  			if (f < 0)
>  				continue;
>  
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index addba55334d9..af2334b16b94 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -23,7 +23,7 @@
>  #include <linux/radix-tree.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinctrl.h>
> @@ -376,7 +376,7 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
>  	}
>  	if (map->data.mux.group) {
>  		group = map->data.mux.group;
> -		ret = match_string(groups, num_groups, group);
> +		ret = __match_string(groups, num_groups, group);
>  		if (ret < 0) {
>  			dev_err(pctldev->dev,
>  				"invalid group \"%s\" for function \"%s\"\n",
> @@ -730,7 +730,7 @@ static ssize_t pinmux_select_write(struct file *file, const char __user *user_bu
>  		goto exit_free_buf;
>  	}
>  
> -	ret = match_string(groups, num_groups, gname);
> +	ret = __match_string(groups, num_groups, gname);
>  	if (ret < 0) {
>  		dev_err(pctldev->dev, "invalid group %s", gname);
>  		goto exit_free_buf;
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 5fa553023842..ad7a9063c5d2 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -25,7 +25,7 @@
>  #include <linux/hwmon.h>
>  #include <linux/acpi.h>
>  #include <linux/rfkill.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  #include <linux/dmi.h>
>  
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
> @@ -443,18 +443,15 @@ static int hp_wmi_get_tablet_mode(void)
>  {
>  	char system_device_mode[4] = { 0 };
>  	const char *chassis_type;
> -	bool tablet_found;
>  	int ret;
>  
>  	chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
>  	if (!chassis_type)
>  		return -ENODEV;
>  
> -	tablet_found = match_string(tablet_chassis_types,
> -				    ARRAY_SIZE(tablet_chassis_types),
> -				    chassis_type) >= 0;
> -	if (!tablet_found)
> -		return -ENODEV;
> +	ret = match_string(tablet_chassis_types, chassis_type);
> +	if (ret < 0)
> +		return ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
>  				   system_device_mode, zero_if_sup(system_device_mode),
> @@ -490,9 +487,7 @@ static bool is_omen_thermal_profile(void)
>  	if (!board_name)
>  		return false;
>  
> -	return match_string(omen_thermal_profile_boards,
> -			    ARRAY_SIZE(omen_thermal_profile_boards),
> -			    board_name) >= 0;
> +	return match_string(omen_thermal_profile_boards, board_name) >= 0;
>  }
>  
>  static int omen_get_thermal_policy_version(void)
> @@ -503,9 +498,9 @@ static int omen_get_thermal_policy_version(void)
>  	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
>  
>  	if (board_name) {
> -		int matches = match_string(omen_thermal_profile_force_v0_boards,
> -			ARRAY_SIZE(omen_thermal_profile_force_v0_boards),
> -			board_name);
> +		int matches;
> +
> +		matches = match_string(omen_thermal_profile_force_v0_boards, board_name);
>  		if (matches >= 0)
>  			return 0;
>  	}
> @@ -1230,9 +1225,7 @@ static bool has_omen_thermal_profile_ec_timer(void)
>  	if (!board_name)
>  		return false;
>  
> -	return match_string(omen_timed_thermal_profile_boards,
> -			    ARRAY_SIZE(omen_timed_thermal_profile_boards),
> -			    board_name) >= 0;
> +	return match_string(omen_timed_thermal_profile_boards, board_name) >= 0;
>  }
>  
>  inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
> @@ -1376,9 +1369,7 @@ static bool is_victus_thermal_profile(void)
>  	if (!board_name)
>  		return false;
>  
> -	return match_string(victus_thermal_profile_boards,
> -			    ARRAY_SIZE(victus_thermal_profile_boards),
> -			    board_name) >= 0;
> +	return match_string(victus_thermal_profile_boards, board_name) >= 0;
>  }
>  
>  static int platform_profile_victus_get(struct platform_profile_handler *pprof,
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index f19504dbf164..a1b2dbb1a10f 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -25,7 +25,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  
>  #define SM_ECO_NAME		"eco"
>  #define SM_COMFORT_NAME		"comfort"
> @@ -1316,7 +1316,7 @@ static int __init load_configuration(void)
>  
>  	/* load the suitable configuration, if exists */
>  	for (int i = 0; CONFIGS[i]; i++) {
> -		if (match_string(CONFIGS[i]->allowed_fw, -1, fw_version) != -EINVAL) {
> +		if (__match_string(CONFIGS[i]->allowed_fw, -1, fw_version) >= 0) {
>  			conf = *CONFIGS[i];
>  			conf.allowed_fw = NULL;
>  			return 0;
> diff --git a/drivers/power/supply/ab8500_btemp.c b/drivers/power/supply/ab8500_btemp.c
> index 56f136b2d071..824c71965150 100644
> --- a/drivers/power/supply/ab8500_btemp.c
> +++ b/drivers/power/supply/ab8500_btemp.c
> @@ -556,7 +556,7 @@ static int ab8500_btemp_get_ext_psy_data(struct device *dev, void *data)
>  	 * For all psy where the name of your driver
>  	 * appears in any supplied_to
>  	 */
> -	j = match_string(supplicants, ext->num_supplicants, psy->desc->name);
> +	j = __match_string(supplicants, ext->num_supplicants, psy->desc->name);
>  	if (j < 0)
>  		return 0;
>  
> diff --git a/drivers/power/supply/ab8500_chargalg.c b/drivers/power/supply/ab8500_chargalg.c
> index 55ab7a28056e..230a4efee210 100644
> --- a/drivers/power/supply/ab8500_chargalg.c
> +++ b/drivers/power/supply/ab8500_chargalg.c
> @@ -857,7 +857,7 @@ static int ab8500_chargalg_get_ext_psy_data(struct device *dev, void *data)
>  	psy = (struct power_supply *)data;
>  	di = power_supply_get_drvdata(psy);
>  	/* For all psy where the driver name appears in any supplied_to */
> -	j = match_string(supplicants, ext->num_supplicants, psy->desc->name);
> +	j = __match_string(supplicants, ext->num_supplicants, psy->desc->name);
>  	if (j < 0)
>  		return 0;
>  
> diff --git a/drivers/power/supply/ab8500_charger.c b/drivers/power/supply/ab8500_charger.c
> index 9b34d1a60f66..5eae14ca92fe 100644
> --- a/drivers/power/supply/ab8500_charger.c
> +++ b/drivers/power/supply/ab8500_charger.c
> @@ -1902,7 +1902,7 @@ static int ab8500_charger_get_ext_psy_data(struct device *dev, void *data)
>  	 * in practice what we will find will always be "ab8500_fg" as
>  	 * the fuel gauge is responsible of keeping track of VBAT.
>  	 */
> -	j = match_string(supplicants, ext->num_supplicants, psy->desc->name);
> +	j = __match_string(supplicants, ext->num_supplicants, psy->desc->name);
>  	if (j < 0)
>  		return 0;
>  
> diff --git a/drivers/power/supply/ab8500_fg.c b/drivers/power/supply/ab8500_fg.c
> index 2ccaf6116c09..c3bc2833fc7e 100644
> --- a/drivers/power/supply/ab8500_fg.c
> +++ b/drivers/power/supply/ab8500_fg.c
> @@ -2197,7 +2197,7 @@ static int ab8500_fg_get_ext_psy_data(struct device *dev, void *data)
>  	 * For all psy where the name of your driver
>  	 * appears in any supplied_to
>  	 */
> -	j = match_string(supplicants, ext->num_supplicants, psy->desc->name);
> +	j = __match_string(supplicants, ext->num_supplicants, psy->desc->name);
>  	if (j < 0)
>  		return 0;
>  
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 15c246d3b1a3..e87987a93860 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -53,10 +53,9 @@ static int gdm_tty_install(struct tty_driver *driver, struct tty_struct *tty)
>  	struct gdm *gdm = NULL;
>  	int ret;
>  
> -	ret = match_string(DRIVER_STRING, TTY_MAX_COUNT,
> -			   tty->driver->driver_name);
> +	ret = match_string(DRIVER_STRING, tty->driver->driver_name);
>  	if (ret < 0)
> -		return -ENODEV;
> +		return ret;
>  
>  	mutex_lock(&gdm_table_lock);
>  	gdm = gdm_table[ret][tty->index];
> diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
> index e56db75a94fb..dbd176b0fb1f 100644
> --- a/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
> +++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
> @@ -111,7 +111,7 @@ static ssize_t suffix##_show(struct device *dev,\
>  		match_strs = (const char **)fivr_strings;\
>  		mmio_regs = tgl_fivr_mmio_regs;\
>  	} \
> -	ret = match_string(match_strs, -1, attr->attr.name);\
> +	ret = __match_string(match_strs, -1, attr->attr.name);\
>  	if (ret < 0)\
>  		return ret;\
>  	reg_val = readl((void __iomem *) (proc_priv->mmio_base + mmio_regs[ret].offset));\
> @@ -145,7 +145,7 @@ static ssize_t suffix##_store(struct device *dev,\
>  		mmio_regs = tgl_fivr_mmio_regs;\
>  	} \
>  	\
> -	ret = match_string(match_strs, -1, attr->attr.name);\
> +	ret = __match_string(match_strs, -1, attr->attr.name);\
>  	if (ret < 0)\
>  		return ret;\
>  	if (mmio_regs[ret].read_only)\
> diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
> index f298e7442662..57f456befb34 100644
> --- a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
> +++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
> @@ -50,7 +50,7 @@ static ssize_t workload_type_store(struct device *dev,
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	ret = match_string(workload_types, -1, str_preference);
> +	ret = __match_string(workload_types, -1, str_preference);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> index b84efae26e15..657be0162dd9 100644
> --- a/drivers/usb/common/common.c
> +++ b/drivers/usb/common/common.c
> @@ -114,11 +114,11 @@ enum usb_device_speed usb_get_maximum_speed(struct device *dev)
>  	if (ret < 0)
>  		return USB_SPEED_UNKNOWN;
>  
> -	ret = match_string(ssp_rate, ARRAY_SIZE(ssp_rate), maximum_speed);
> +	ret = match_string(ssp_rate, maximum_speed);
>  	if (ret > 0)
>  		return USB_SPEED_SUPER_PLUS;
>  
> -	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
> +	ret = match_string(speed_names, maximum_speed);
>  	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
>  }
>  EXPORT_SYMBOL_GPL(usb_get_maximum_speed);
> @@ -141,7 +141,7 @@ enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev)
>  	if (ret < 0)
>  		return USB_SSP_GEN_UNKNOWN;
>  
> -	ret = match_string(ssp_rate, ARRAY_SIZE(ssp_rate), maximum_speed);
> +	ret = match_string(ssp_rate, maximum_speed);
>  	return (ret < 0) ? USB_SSP_GEN_UNKNOWN : ret;
>  }
>  EXPORT_SYMBOL_GPL(usb_get_maximum_ssp_rate);
> @@ -184,7 +184,7 @@ static enum usb_dr_mode usb_get_dr_mode_from_string(const char *str)
>  {
>  	int ret;
>  
> -	ret = match_string(usb_dr_modes, ARRAY_SIZE(usb_dr_modes), str);
> +	ret = match_string(usb_dr_modes, str);
>  	return (ret < 0) ? USB_DR_MODE_UNKNOWN : ret;
>  }
>  
> diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
> index 3cd6b184551c..90cee91f4ff9 100644
> --- a/drivers/usb/dwc3/dwc3-rtk.c
> +++ b/drivers/usb/dwc3/dwc3-rtk.c
> @@ -185,7 +185,7 @@ static enum usb_device_speed __get_dwc3_maximum_speed(struct device_node *np)
>  	if (ret < 0)
>  		goto out;
>  
> -	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
> +	ret = match_string(speed_names, maximum_speed);
>  
>  out:
>  	of_node_put(dwc3_np);
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9610e647a8d4..7bc4695f8d0b 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1986,8 +1986,7 @@ EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
>   */
>  int typec_find_pwr_opmode(const char *name)
>  {
> -	return match_string(typec_pwr_opmodes,
> -			    ARRAY_SIZE(typec_pwr_opmodes), name);
> +	return match_string(typec_pwr_opmodes, name);
>  }
>  EXPORT_SYMBOL_GPL(typec_find_pwr_opmode);
>  
> @@ -2001,8 +2000,7 @@ EXPORT_SYMBOL_GPL(typec_find_pwr_opmode);
>   */
>  int typec_find_orientation(const char *name)
>  {
> -	return match_string(typec_orientations, ARRAY_SIZE(typec_orientations),
> -			    name);
> +	return match_string(typec_orientations, name);
>  }
>  EXPORT_SYMBOL_GPL(typec_find_orientation);
>  
> @@ -2016,8 +2014,7 @@ EXPORT_SYMBOL_GPL(typec_find_orientation);
>   */
>  int typec_find_port_power_role(const char *name)
>  {
> -	return match_string(typec_port_power_roles,
> -			    ARRAY_SIZE(typec_port_power_roles), name);
> +	return match_string(typec_port_power_roles, name);
>  }
>  EXPORT_SYMBOL_GPL(typec_find_port_power_role);
>  
> @@ -2031,7 +2028,7 @@ EXPORT_SYMBOL_GPL(typec_find_port_power_role);
>   */
>  int typec_find_power_role(const char *name)
>  {
> -	return match_string(typec_roles, ARRAY_SIZE(typec_roles), name);
> +	return match_string(typec_roles, name);
>  }
>  EXPORT_SYMBOL_GPL(typec_find_power_role);
>  
> @@ -2045,8 +2042,7 @@ EXPORT_SYMBOL_GPL(typec_find_power_role);
>   */
>  int typec_find_port_data_role(const char *name)
>  {
> -	return match_string(typec_port_data_roles,
> -			    ARRAY_SIZE(typec_port_data_roles), name);
> +	return match_string(typec_port_data_roles, name);
>  }
>  EXPORT_SYMBOL_GPL(typec_find_port_data_role);
>  
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index ad76dbd20e65..2ce2d355a039 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -722,8 +722,7 @@ static int tps6598x_check_mode(struct tps6598x *tps)
>  	if (ret)
>  		return ret;
>  
> -	ret = match_string(modes, ARRAY_SIZE(modes), mode);
> -
> +	ret = match_string(modes, mode);
>  	switch (ret) {
>  	case TPS_MODE_APP:
>  	case TPS_MODE_PTCH:
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index 2ef56fa28aff..f1b562b94744 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -37,9 +37,9 @@
>  #include <linux/kernel.h>
>  #include <linux/sched.h>
>  #include <linux/errno.h>
> -#include <linux/string.h>
>  #include <linux/interrupt.h>
>  #include <linux/slab.h>
> +#include <linux/string_helpers.h>
>  #include <linux/mm.h>
>  #include <linux/fb.h>
>  #include <linux/delay.h>
> @@ -2107,7 +2107,7 @@ static int of_get_pxafb_display(struct device *dev, struct device_node *disp,
>  	if (ret)
>  		s = "color-tft";
>  
> -	i = match_string(lcd_types, -1, s);
> +	i = __match_string(lcd_types, -1, s);
>  	if (i < 0) {
>  		dev_err(dev, "lcd-type %s is unknown\n", s);
>  		return i;
> diff --git a/fs/bcachefs/compress.c b/fs/bcachefs/compress.c
> index 1410365a8891..a62c5dd5b470 100644
> --- a/fs/bcachefs/compress.c
> +++ b/fs/bcachefs/compress.c
> @@ -667,7 +667,7 @@ int bch2_opt_compression_parse(struct bch_fs *c, const char *_val, u64 *res,
>  	type_str = strsep(&p, ":");
>  	level_str = p;
>  
> -	ret = match_string(bch2_compression_opts, -1, type_str);
> +	ret = __match_string(bch2_compression_opts, -1, type_str);
>  	if (ret < 0 && err)
>  		prt_str(err, "invalid compression type");
>  	if (ret < 0)
> diff --git a/fs/bcachefs/opts.c b/fs/bcachefs/opts.c
> index bb068fd72465..cbe4e820419f 100644
> --- a/fs/bcachefs/opts.c
> +++ b/fs/bcachefs/opts.c
> @@ -122,7 +122,7 @@ static int bch2_opt_fix_errors_parse(struct bch_fs *c, const char *val, u64 *res
>  	if (!val) {
>  		*res = FSCK_FIX_yes;
>  	} else {
> -		int ret = match_string(bch2_fsck_fix_opts, -1, val);
> +		int ret = __match_string(bch2_fsck_fix_opts, -1, val);
>  
>  		if (ret < 0 && err)
>  			prt_str(err, "fix_errors: invalid selection");
> @@ -366,7 +366,7 @@ int bch2_opt_parse(struct bch_fs *c,
>  			return -EINVAL;
>  		}
>  
> -		ret = match_string(opt->choices, -1, val);
> +		ret = __match_string(opt->choices, -1, val);
>  		if (ret < 0) {
>  			if (err)
>  				prt_printf(err, "%s: invalid selection",
> diff --git a/fs/bcachefs/util.c b/fs/bcachefs/util.c
> index de331dec2a99..8cef641a38fb 100644
> --- a/fs/bcachefs/util.c
> +++ b/fs/bcachefs/util.c
> @@ -19,7 +19,7 @@
>  #include <linux/preempt.h>
>  #include <linux/random.h>
>  #include <linux/seq_file.h>
> -#include <linux/string.h>
> +#include <linux/string_helpers.h>
>  #include <linux/types.h>
>  #include <linux/sched/clock.h>
>  
> @@ -215,7 +215,7 @@ u64 bch2_read_flag_list(char *opt, const char * const list[])
>  	s = strim(d);
>  
>  	while ((p = strsep(&s, ","))) {
> -		int flag = match_string(list, -1, p);
> +		int flag = __match_string(list, -1, p);
>  
>  		if (flag < 0) {
>  			ret = -1;
> diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
> index a4a0158f712d..fc0da18bfa65 100644
> --- a/fs/ubifs/auth.c
> +++ b/fs/ubifs/auth.c
> @@ -264,13 +264,13 @@ int ubifs_init_authentication(struct ubifs_info *c)
>  		return -EINVAL;
>  	}
>  
> -	c->auth_hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST,
> -					 c->auth_hash_name);
> -	if ((int)c->auth_hash_algo < 0) {
> +	err = __match_string(hash_algo_name, HASH_ALGO__LAST, c->auth_hash_name);
> +	if (err < 0) {
>  		ubifs_err(c, "Unknown hash algo %s specified",
>  			  c->auth_hash_name);
> -		return -EINVAL;
> +		return err;
>  	}
> +	c->auth_hash_algo = err;
>  
>  	snprintf(hmac_name, CRYPTO_MAX_ALG_NAME, "hmac(%s)",
>  		 c->auth_hash_name);
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 60168aa2af07..92fc7631f6a4 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -303,8 +303,18 @@ extern unsigned long long memparse(const char *ptr, char **retptr);
>  extern bool parse_option_str(const char *str, const char *option);
>  extern char *next_arg(char *args, char **param, char **val);
>  
> +int __match_string(const char * const *array, size_t n, const char *string);
> +
> +/**
> + * match_string - matches given string in an array
> + * @_a: array of strings
> + * @_s: string to match with
> + *
> + * Helper for __match_string(). Calculates the size of @a automatically.
> + */
> +#define match_string(_a, _s) __match_string(_a, ARRAY_SIZE(_a), _s)
> +
>  extern bool sysfs_streq(const char *s1, const char *s2);
> -int match_string(const char * const *array, size_t n, const char *string);
>  int __sysfs_match_string(const char * const *array, size_t n, const char *s);
>  
>  /**
> diff --git a/kernel/cgroup/rdma.c b/kernel/cgroup/rdma.c
> index ef5878fb2005..10105cfc5981 100644
> --- a/kernel/cgroup/rdma.c
> +++ b/kernel/cgroup/rdma.c
> @@ -366,7 +366,7 @@ static int parse_resource(char *c, int *intval)
>  	if (!name || !value)
>  		return -EINVAL;
>  
> -	i = match_string(rdmacg_resource_names, RDMACG_RESOURCE_MAX, name);
> +	i = match_string(rdmacg_resource_names, name);
>  	if (i < 0)
>  		return i;
>  
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index c1eb9a1afd13..b6238341e3c0 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -105,7 +105,7 @@ static int sched_feat_set(char *cmp)
>  		cmp += 3;
>  	}
>  
> -	i = match_string(sched_feat_names, __SCHED_FEAT_NR, cmp);
> +	i = __match_string(sched_feat_names, __SCHED_FEAT_NR, cmp);
>  	if (i < 0)
>  		return i;
>  
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 578a49ff5c32..13c0a1fa30cd 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -32,7 +32,6 @@
>  #include <linux/percpu.h>
>  #include <linux/splice.h>
>  #include <linux/kdebug.h>
> -#include <linux/string.h>
>  #include <linux/mount.h>
>  #include <linux/rwsem.h>
>  #include <linux/slab.h>
> @@ -45,6 +44,7 @@
>  #include <linux/trace.h>
>  #include <linux/sched/clock.h>
>  #include <linux/sched/rt.h>
> +#include <linux/string_helpers.h>
>  #include <linux/fsnotify.h>
>  #include <linux/irq_work.h>
>  #include <linux/workqueue.h>
> @@ -5309,7 +5309,7 @@ int trace_set_options(struct trace_array *tr, char *option)
>  	mutex_lock(&event_mutex);
>  	mutex_lock(&trace_types_lock);
>  
> -	ret = match_string(trace_options, -1, cmp);
> +	ret = __match_string(trace_options, -1, cmp);
>  	/* If no option could be set, test the specific tracer options */
>  	if (ret < 0)
>  		ret = set_tracer_option(tr, cmp, neg);
> diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
> index a8e28f9b9271..7bed499effd3 100644
> --- a/kernel/trace/trace_osnoise.c
> +++ b/kernel/trace/trace_osnoise.c
> @@ -2230,9 +2230,9 @@ static ssize_t osnoise_options_write(struct file *filp, const char __user *ubuf,
>  		enable = false;
>  	}
>  
> -	option = match_string(osnoise_options_str, OSN_MAX, option_str);
> +	option = match_string(osnoise_options_str, option_str);
>  	if (option < 0)
> -		return -EINVAL;
> +		return option;
>  
>  	/*
>  	 * trace_types_lock is taken to avoid concurrency on start/stop.
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index f2c5e7910bb1..cd4fbcea38ba 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -24,7 +24,6 @@
>  #include <linux/list.h>
>  #include <linux/sysctl.h>
>  #include <linux/ctype.h>
> -#include <linux/string.h>
>  #include <linux/parser.h>
>  #include <linux/string_helpers.h>
>  #include <linux/uaccess.h>
> @@ -154,7 +153,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
>  	int idx;
>  
>  	list_for_each_entry(map, &dt->maps, link) {
> -		idx = match_string(map->class_names, map->length, class_string);
> +		idx = __match_string(map->class_names, map->length, class_string);
>  		if (idx >= 0) {
>  			*class_id = idx + map->base;
>  			return map;
> @@ -665,7 +664,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
>  			if (*cl_str == '+')
>  				cl_str++;
>  		}
> -		cls_id = match_string(map->class_names, map->length, cl_str);
> +		cls_id = __match_string(map->class_names, map->length, cl_str);
>  		if (cls_id < 0) {
>  			pr_err("%s unknown to %s\n", cl_str, KP_NAME(kp));
>  			continue;
> diff --git a/lib/string_helpers.c b/lib/string_helpers.c
> index 69ba49b853c7..d3d0d2154146 100644
> --- a/lib/string_helpers.c
> +++ b/lib/string_helpers.c
> @@ -898,7 +898,7 @@ bool sysfs_streq(const char *s1, const char *s2)
>  EXPORT_SYMBOL(sysfs_streq);
>  
>  /**
> - * match_string - matches given string in an array
> + * __match_string - matches given string in an array
>   * @array:	array of strings
>   * @n:		number of strings in the array or -1 for NULL terminated arrays
>   * @string:	string to match with
> @@ -914,7 +914,7 @@ EXPORT_SYMBOL(sysfs_streq);
>   * Return:
>   * index of a @string in the @array if matches, or %-EINVAL otherwise.
>   */
> -int match_string(const char * const *array, size_t n, const char *string)
> +int __match_string(const char * const *array, size_t n, const char *string)
>  {
>  	int index;
>  	const char *item;
> @@ -929,7 +929,7 @@ int match_string(const char * const *array, size_t n, const char *string)
>  
>  	return -EINVAL;
>  }
> -EXPORT_SYMBOL(match_string);
> +EXPORT_SYMBOL(__match_string);
>  
>  /**
>   * __sysfs_match_string - matches given string in an array
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index aec756ae5637..89c132170431 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -89,7 +89,6 @@
>  #include <linux/nodemask.h>
>  #include <linux/cpuset.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
>  #include <linux/export.h>
>  #include <linux/nsproxy.h>
>  #include <linux/interrupt.h>
> @@ -103,6 +102,7 @@
>  #include <linux/ksm.h>
>  #include <linux/rmap.h>
>  #include <linux/security.h>
> +#include <linux/string_helpers.h>
>  #include <linux/syscalls.h>
>  #include <linux/ctype.h>
>  #include <linux/mm_inline.h>
> @@ -3183,7 +3183,7 @@ int mpol_parse_str(char *str, struct mempolicy **mpol)
>  	} else
>  		nodes_clear(nodes);
>  
> -	mode = match_string(policy_modes, MPOL_MAX, str);
> +	mode = match_string(policy_modes, str);
>  	if (mode < 0)
>  		goto out;
>  
> diff --git a/mm/vmpressure.c b/mm/vmpressure.c
> index bd5183dfd879..eaaa133ce12b 100644
> --- a/mm/vmpressure.c
> +++ b/mm/vmpressure.c
> @@ -388,7 +388,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
>  
>  	/* Find required level */
>  	token = strsep(&spec, ",");
> -	ret = match_string(vmpressure_str_levels, VMPRESSURE_NUM_LEVELS, token);
> +	ret = match_string(vmpressure_str_levels, token);
>  	if (ret < 0)
>  		goto out;
>  	level = ret;
> @@ -396,7 +396,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
>  	/* Find optional mode */
>  	token = strsep(&spec, ",");
>  	if (token) {
> -		ret = match_string(vmpressure_str_modes, VMPRESSURE_NUM_MODES, token);
> +		ret = match_string(vmpressure_str_modes, token);
>  		if (ret < 0)
>  			goto out;
>  		mode = ret;
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 6239777090c4..e3fc94b4c7e5 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1820,9 +1820,9 @@ static int param_set_audit(const char *val, const struct kernel_param *kp)
>  	if (apparmor_initialized && !aa_current_policy_admin_capable(NULL))
>  		return -EPERM;
>  
> -	i = match_string(audit_mode_names, AUDIT_MAX_INDEX, val);
> +	i = __match_string(audit_mode_names, AUDIT_MAX_INDEX, val);
>  	if (i < 0)
> -		return -EINVAL;
> +		return i;
>  
>  	aa_g_audit = i;
>  	return 0;
> @@ -1849,10 +1849,9 @@ static int param_set_mode(const char *val, const struct kernel_param *kp)
>  	if (apparmor_initialized && !aa_current_policy_admin_capable(NULL))
>  		return -EPERM;
>  
> -	i = match_string(aa_profile_mode_names, APPARMOR_MODE_NAMES_MAX_INDEX,
> -			 val);
> +	i = __match_string(aa_profile_mode_names, APPARMOR_MODE_NAMES_MAX_INDEX, val);
>  	if (i < 0)
> -		return -EINVAL;
> +		return i;
>  
>  	aa_g_profile_mode = i;
>  	return 0;
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index f04f43af651c..49d6e9cc3387 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -64,7 +64,7 @@ static int __init hash_setup(char *str)
>  		goto out;
>  	}
>  
> -	i = match_string(hash_algo_name, HASH_ALGO__LAST, str);
> +	i = __match_string(hash_algo_name, HASH_ALGO__LAST, str);
>  	if (i < 0) {
>  		pr_err("invalid hash algorithm \"%s\"", str);
>  		return 1;
> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index c0556907c2e6..fa67c5794071 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -1380,7 +1380,7 @@ static unsigned int ima_parse_appraise_algos(char *arg)
>  	char *token;
>  
>  	while ((token = strsep(&arg, ",")) != NULL) {
> -		idx = match_string(hash_algo_name, HASH_ALGO__LAST, token);
> +		idx = __match_string(hash_algo_name, HASH_ALGO__LAST, token);
>  
>  		if (idx < 0) {
>  			pr_err("unknown hash algorithm \"%s\"",
> diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
> index 98ae0e8cba87..5b38069daa0a 100644
> --- a/sound/firewire/oxfw/oxfw.c
> +++ b/sound/firewire/oxfw/oxfw.c
> @@ -59,7 +59,7 @@ static bool detect_loud_models(struct fw_unit *unit)
>  	if (err < 0)
>  		return false;
>  
> -	return match_string(models, ARRAY_SIZE(models), model) >= 0;
> +	return match_string(models, model) >= 0;
>  }
>  
>  static int name_card(struct snd_oxfw *oxfw, const struct ieee1394_device_id *entry)
> diff --git a/sound/pci/oxygen/oxygen_mixer.c b/sound/pci/oxygen/oxygen_mixer.c
> index eb3aca16359c..73e15d5d6be9 100644
> --- a/sound/pci/oxygen/oxygen_mixer.c
> +++ b/sound/pci/oxygen/oxygen_mixer.c
> @@ -1074,7 +1074,7 @@ static int add_controls(struct oxygen *chip,
>  		err = snd_ctl_add(chip->card, ctl);
>  		if (err < 0)
>  			return err;
> -		j = match_string(known_ctl_names, CONTROL_COUNT, ctl->id.name);
> +		j = match_string(known_ctl_names, ctl->id.name);
>  		if (j >= 0) {
>  			chip->controls[j] = ctl;
>  			ctl->private_free = oxygen_any_ctl_free;
> diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
> index 8b56ee550c09..4736a4ba0e1f 100644
> --- a/sound/soc/codecs/max98088.c
> +++ b/sound/soc/codecs/max98088.c
> @@ -1414,7 +1414,7 @@ static int max98088_get_channel(struct snd_soc_component *component, const char
>  {
>  	int ret;
>  
> -	ret = match_string(eq_mode_name, ARRAY_SIZE(eq_mode_name), name);
> +	ret = match_string(eq_mode_name, name);
>  	if (ret < 0)
>  		dev_err(component->dev, "Bad EQ channel name '%s'\n", name);
>  	return ret;
> diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
> index 7e525d49328d..430bce3333a9 100644
> --- a/sound/soc/codecs/max98095.c
> +++ b/sound/soc/codecs/max98095.c
> @@ -1627,7 +1627,7 @@ static int max98095_get_bq_channel(struct snd_soc_component *component,
>  {
>  	int ret;
>  
> -	ret = match_string(bq_mode_name, ARRAY_SIZE(bq_mode_name), name);
> +	ret = match_string(bq_mode_name, name);
>  	if (ret < 0)
>  		dev_err(component->dev, "Bad biquad channel name '%s'\n", name);
>  	return ret;
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 16dad4a45443..7064f4cae549 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -769,14 +769,13 @@ static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
>  		item = 0;
>  	}
>  
> -	i = match_string(e->texts, e->items, control_name);
> +	i = __match_string(e->texts, e->items, control_name);
>  	if (i < 0)
> -		return -ENODEV;
> +		return i;
>  
>  	path->name = e->texts[i];
>  	path->connect = (i == item);
>  	return 0;
> -
>  }
>  
>  /* set up initial codec paths */
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 
