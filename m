Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BAB12FF8
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 16:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55910E16E;
	Sun, 27 Jul 2025 14:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKkb728r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8CF10E044;
 Sun, 27 Jul 2025 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753627624; x=1785163624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=blw6wCP1F88MtWY354VmYW5ZQjeJztFJ+Evw+T0iPxs=;
 b=HKkb728r3YMDTk3v56VG1FPnPXBK0B1UTGj1qyPGVCPGAxs5vFR5OagH
 mW/7L4X5op1LqMvms87Qsz3+p/J5NeVQ3diojcG9JXmHkjhE8pZuPywfP
 Joox1zsvV6nC8m28dAoqCpwebktAp6U9X9ye8YJToQaN8tYYh9VU/hp5h
 E38Az7J9lDJjtp8jtkfYMHwyWQEAJe+ehiBI1EW3Qf3JB19M8AK2J+Azk
 SRhXtmAk8DgS58G8MIiqLuYOiYR9kt32TEb3AiOdPryGFwDoS2eTSZYvn
 iksAXAztZXP/oItJsIz/k/xdrO9n3Y/h8abNite12cZAY33XXe48elRwQ g==;
X-CSE-ConnectionGUID: +QMevSj2ScSzpTrvgCU3VA==
X-CSE-MsgGUID: Grx88g/UQimdwaT+trt52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55589379"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55589379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 07:47:03 -0700
X-CSE-ConnectionGUID: 8nR5ytOlSfymuvTdUc7Ccw==
X-CSE-MsgGUID: ybU09YWUSzGLTN4PuX8j7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162523223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 07:47:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 07:47:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 07:47:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 07:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeCX2cWB1Eg7pU+7f7BawHfSlvUXMMkFJAri802SkdyEh+W+8oxcBy0FLrBqJiyS/R0B5AwuPYjW6PLEESxO4/PFHFaiztSHucFRM61ytnEZKtQYLaMtfEG9Z/N46FKPdX36n/CxQ1FeAT8X1vXmFfslO8puimA1lQZYh5ZOO3vJBIZYxdI3YO9yKiLUY+9M0UDvugTSPCGK8b1xibIVoidYHyME8vAO2/DXyHcTloXGEbiopkvCTiisq7w9Wda1LCLudtyQnU9yYJ3MrT1yKRHwnzfaeEnDLOy6xTSCvsUDH2GRihDKWU+MYpg64nme7+pikcuY9Xa0Dy9E5hAaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blw6wCP1F88MtWY354VmYW5ZQjeJztFJ+Evw+T0iPxs=;
 b=QEocclVxptdLL2/Q+cWWLwOyEiaxX5B7WAgfJjPJsPO8QAx2B2aKHaC0krCiGp5rDJOwdW4dmNOk+zT2i3KMePjVKX/B6SRfeDb3EaedLYCYUyr7lL88HaXElAXUXoMt7GbJySs2IoWVf5nTY2XP1W7pnK2ixwn+LsTcjQA2XZPEBX+A8s9LJCsL8Qtn3jCZZgZLxcRB37WycCxjLG83vzrt65dfSxlGhN3Z+lxsRcu7D1XlPdZ1tqEpYaPj9mJCoguM809cQr+Ulza4xDt3e86iis7WmZm69jLRmnd4JuQywt4uO+5m7QGvxz4wszHFuPbzs92/21L/vS9nLujRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Sun, 27 Jul
 2025 14:46:59 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8964.025; Sun, 27 Jul 2025
 14:46:59 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCH 2/9] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH 2/9] mei: late_bind: add late binding component driver
Thread-Index: AQHb8ayIhXESPJtrZE+rqVMT5r8sErQ0q8kAgAAAt5CAAASogIAAGAqQgAAUBYCAET3YQA==
Date: Sun, 27 Jul 2025 14:46:58 +0000
Message-ID: <CY5PR11MB6366AF03A73910CED71C7E37ED5BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
 <20250710150831.3018674-13-rodrigo.vivi@intel.com>
 <2025071611-decode-hastiness-df63@gregkh>
 <CY5PR11MB63666310C54B48FB3624D9E0ED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025071603-guide-definite-70e3@gregkh>
 <CY5PR11MB636646E936C800D689BFBEEBED56A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025071619-sterile-skiing-e64b@gregkh>
In-Reply-To: <2025071619-sterile-skiing-e64b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|BN9PR11MB5292:EE_
x-ms-office365-filtering-correlation-id: 43b3fca3-07b0-478d-8844-08ddcd1c70b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WFdJdkM5Q3JaVUpBRm5SY05IbGVaWFp0V2lPRjRXa2xUYldlZStLcE9DSCtK?=
 =?utf-8?B?YW1ZanE4NlpCdDhEZHNxREx1d2VMWUhteTc4WUdhZUZXdDIrQ0xRT1FkTS9Q?=
 =?utf-8?B?Mnh0aUM1eVE2YytzWWkzaXVsVWhCa1FHNjlmMlFzcDk1SGk2bXd5RTNaWXpy?=
 =?utf-8?B?dXhKQTY1NEs4cmY1eUJKb2tEM2IzTmxsUXhlS0R6M2ZsRFFFMkt6Rk9MeFo4?=
 =?utf-8?B?eW5DWUJOTzVkeWJNWDZDZmYzMlJKeWtqbSthelRsUGY1amtFam9QVEhZTlA0?=
 =?utf-8?B?ekVJQ1c4TUhjTUZiNWxHSEtwdDlneWlVUVlyYUNzOWhPY29nQUF6UzlmWDgz?=
 =?utf-8?B?Y3BBYUxvZ0ZBTSs0RFRuMWhVdEF4VTZseTJaTU9GUUJBRW83NkhWQ0JXb1hH?=
 =?utf-8?B?TC9rOC9mL0ZVYXFpbm5kRjdYcmpiSE5aWjNMaGY2SXBRWk80WCs5RjUwMGdY?=
 =?utf-8?B?eUR3WkUrR2VYYmtiRTh3TW5kbTBQZGhHU1RqNjVKRXdmQlJLZWw0VExsT1dX?=
 =?utf-8?B?MnNReXlLNDRCV0s3TnNWTVo3MHZGZUNhTWdkQ1ZxVG1YclluZUpVYVA2YkJB?=
 =?utf-8?B?c01TMU1XRWJuTmlyS2xlNStHNUhCTFVsNHBYYmdTalhjbEtiN0drN0ZEbGRW?=
 =?utf-8?B?RWJKdzJ4SDVKREVOdHNHSlhod2J5UU84R3FMbFVsNFdJa0xmT1BwbEwwakla?=
 =?utf-8?B?R0VpRndiR0NEL1Y4SU1TaXV6aDJsb0YwWmxFQTYzcDVTamg2UUpMOVNRbG55?=
 =?utf-8?B?ZWZNU1FMc3V2M2lkQUdmM3ZBcGlnQ2hTM3BFaUg1cVZXaXdCek1CS2d0YUFD?=
 =?utf-8?B?YjdHTkN5VEdza25tWUFLRDhmWUgyZEN5amMrWFQxeXNGVSsxL0FiRFNnK3VT?=
 =?utf-8?B?anVhVXkzZW5tOGdyb1BkMDU2cDNDM0V5U3ZrS29ITzVUMHROamwyUzRMMFFJ?=
 =?utf-8?B?TnplYnI3Y0J5TXozZG5SNm5uWXBNT1FKd2svT3Z1U2NySFpIMkRuN0NablFo?=
 =?utf-8?B?bTNMeElGUStkTEFNUHlDNysxRGN2NGpmK2k0NER1V1FmaGF6K0xLUnl3aDlp?=
 =?utf-8?B?RjFJbmY2N00zdUFKUVp1TkJGcGFWTk1VL0g1V0N6Q0lzaW9SVWg2NCtOUVdh?=
 =?utf-8?B?TkxWaWJKclhiRW5HUW4rOVBDT0dlTnZLTnBoVlZSamJjQlhBZzdHL09lWUZu?=
 =?utf-8?B?d1JHeHNwUVJiVWltT2lmR3FkdElCSExMRnIrMFluOXJKM2NkUjNWUXlqR29p?=
 =?utf-8?B?UFN0cGFKOU9nN2QxdXY4UU9pMlhaWjdyaE1zWFBwYnM4a08rbWJiRjJaS1g2?=
 =?utf-8?B?YkE4UzBNbldwaXMybkpVUEFJaGQyNkwzUFI2S0RoYXVzbTZjZ2p6RFZJYlNS?=
 =?utf-8?B?U3NEY3F4YWwwc1pRM2xmL2JHR3JyVllRYnJQZVRpQUpkT3k5VkY0RnB4Q3hO?=
 =?utf-8?B?dG5OdmpYNXRwL1hyM05TeVhMNzJHbTBlMWVDRUsrRElmQTNGbkR6aGdjN1BW?=
 =?utf-8?B?WUJWYU9ValAvblEvUndnSjBCMDlhZ3dEOWNaZVpnS290OENZaW5PWlZiaWlB?=
 =?utf-8?B?T3JiODArc0hxVzdpdXk0RjIveUgxaDlGWkZZM0FQcWc2VDROQ1MvWUhHdkJx?=
 =?utf-8?B?L05zUmpuTnhZUmQwdk96V2xwYTJNNFFPNERaeGIzWVJBSFFrUnpnbUVNWkQ5?=
 =?utf-8?B?OUNsODJsNFJqSjFzVzNCYkJwOGY5RnkyOXdPRGhoYzBVbGdoMjdWcC9NR3RY?=
 =?utf-8?B?TDRQb2NwL3Zod2FmVDZiMFF1WWpPTjBENjVhRHJXR21Wek1rMTVyVW1rSjJy?=
 =?utf-8?B?eHBmTlNWbmw2dmRQMzYvWUpYbGl6MzdGM0JFY3dJblB1eWZOSWw3dGRmR0sz?=
 =?utf-8?B?VmQ2ZnNvVzdFMS90OFpiUnJqQzcvMGtnRFV0SENFSXI1WGxYc2ovRElwOHBT?=
 =?utf-8?B?aHF3L3FCTFpmQWlhOGhkSmkrejArSnU4cVNZYzd5OXBZWVBMTmZGUUFGM01j?=
 =?utf-8?B?K01sZnF4T3JBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjR4SzY0ZGw4Skp3MkpqVVppMERmc1plK3R2Y1h1U1pRNjJWd2J3VTgxeEVV?=
 =?utf-8?B?SGlZSFF6U2hUV3ZkVHFhaXZrWGdJS2J5MXJaV0pOdFc2R1RmNnRsZ042NXJI?=
 =?utf-8?B?Wjl4cUtGT3RqVG8zVUp2NkFoNVBHc2dISUhBQThrRGVWdzBEQWFyY2ZoT080?=
 =?utf-8?B?dHJzbUtzai9sdytmY2N6WWRBY0hUYVFSa2pIcmVCMzdOeG5Jdy9zci9uZG9r?=
 =?utf-8?B?WlZvUE5wTk9LWml3L0hEY2hsWjFyZTcwMTdvaVIrTGl6Z3RQeThMbmVnQTZp?=
 =?utf-8?B?a0lNb3lDMENIYU9HMmJtbEM2VlFZcEpHSUQwNU92UFEvZXhnYi9BS09CWG5C?=
 =?utf-8?B?M1dWYVF5MW0xL2dMQ051akxHaEloMi9mQWxaNVRuZjEyZ0ZpZGJKYmtlVERB?=
 =?utf-8?B?TjQ1dTc0NmRzN0RkSVhHSS8rVXBvd0pXRzNoandaSk5mNlR4SkdFQk1WdWUv?=
 =?utf-8?B?Skc5SzY0RTBlaWQyOTBrZVZKSlhZd0lKS1RWckltU2p5VFB0d21xRDM4aVZN?=
 =?utf-8?B?NStxWUZ6dVlkRkFISnczdVdkOTBIa2JvdEJJcVJ6clY5M3dHbDVGMEQ2YmZx?=
 =?utf-8?B?enNja2pVY2s0bGhSanBCUnNyN0p4WHRLUjV3ODdpUTJaYVhySFJaWXJvazgx?=
 =?utf-8?B?WDQvcHV5VEwrV3Z0aGZoUXcwbnhJYXVzekJHcDNHTUJPWWRKSGhXaC9reUpw?=
 =?utf-8?B?eFRWYXpUNHd4TmJmekpSWlM3UHNPNThnYmVWUWtYSDZNTlMvZ2VleExtUzdU?=
 =?utf-8?B?OUsvM1BNVGJkREp3MC9JZWpLTVA1MkR5RmEyN2oyY0RSVmxVU1VoYzA4cmNH?=
 =?utf-8?B?REhsd2FJRkdEaTRiN1g5K0dZYkVBTncyRFNheXdWblNhZFYvL2oxU2tQemti?=
 =?utf-8?B?SmlFTUxPWWFPSnFVQWtCcGZsTnZnRWRDcUgyZDFBRXhRMkZ4WWU4N1B0eXVR?=
 =?utf-8?B?OGI0bWRrTW5UVDNFMC80QnlDUU9VRlpjaGZEYk5wckRmRFdmN05wbEdDQVRl?=
 =?utf-8?B?aXRLVmFWbndCMTB1d0twbzQvQUQ4RklWNXJJRUI5ZEVQY09NVGFIQzYwY1Vs?=
 =?utf-8?B?UE5rRzh5cDhPRWZJZjFNblhnVGdXdkowU21UODYzWFZFWDNRcFRHZXpabUU3?=
 =?utf-8?B?ZGlCVmE1bVFRaGNDOUtIT2owSmpZMTNVNjNsekxHZmVQVk1EUkp5ejJGTFNm?=
 =?utf-8?B?K2RPWjNITlpObjRhN3JDUFJQazJ3RXA1Zm9sS3ZWUm5GeVJpY2VGRXNqUVBZ?=
 =?utf-8?B?cWlZZHRGSzQ3d3NnS2ZkSFRFUUNxOTE1clJ2TmVCSk9ueVFwcTM0YjhWTlV5?=
 =?utf-8?B?SFZteTJSclJzd3BZM2dsQldXU0U4dVVZTml3MVhpeU52cDI1dllVRkVyaXFZ?=
 =?utf-8?B?dUpVNWdDblk0MjFkR2FvMEN2UnIvSTZKWDMwcnpTOTRDNHovWm9vTm9NMlVV?=
 =?utf-8?B?Ti8zS3docjZHZWFuWHJpbEdKMGxJczVDeGVPbVB6OFQxYWhFdUZHMXVEL2Fh?=
 =?utf-8?B?VTVqWmhwSnR2YStUZG9hcXpUalptZndCd2cwSUQrd0NOZGhOenEzQk5PNEph?=
 =?utf-8?B?LytvMGNkbVJsMTZoUnJKR1dkQkpvblFXeGxHREVQQnhBYndPdXU0REJhd2ti?=
 =?utf-8?B?WjJ0NllKOHI5OUZobmhkMmdVdmlQWjJ2czljSFhCYlZxdEhjdERoa280TGRG?=
 =?utf-8?B?QnFBbFl1b3h4Rmh4Z3JyVDYwdldlTGRlVkhIQm90cjhsTWorYXJvbXFFRHpX?=
 =?utf-8?B?TGoyWFFUeWRwYkJhWno3K0RSck1KTXZtZWx0UGtTdXQzZ0RnbU9iVGtmTXky?=
 =?utf-8?B?NFkrdFEzd0dtaE1uMzNGU2tSb29FKzRmeTVOTGpyT0lSbnpVU2V5OUtsOEN5?=
 =?utf-8?B?cmZYNG5NMS9XOVRIeFNFZDhEYkh5RmtDQnFyNEwzTmV2aFBhSFJlaWNHUXRu?=
 =?utf-8?B?UUM5dXZENmpPVVRPSGgzZkU5c0tpeTZaVHYzMG8xYUFlcnhEV09XOUhMOVNm?=
 =?utf-8?B?b1lWZzdJY25ESnhqWFJDSzAyaVRFalZPN0M3RnU5VDZHUkhsNVhqL2tvVmFn?=
 =?utf-8?B?VXI3RC9YdHZQeUtHcjA5bmw0VXZzVnBBdW9oUlRmNTZ3SU12TzRTa2cvTEV4?=
 =?utf-8?B?aGc0bWlSejJZUEFSQWtORGZzUk5uK0wydUM0RDVRdXB2ZFB6Y000cDVyUmgz?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b3fca3-07b0-478d-8844-08ddcd1c70b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2025 14:46:58.9799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tct96gzp6Q3JmE5tw27JT7ZPhyXlvOn83JZseok7ijTd251jWMqttjW6MwFMe677xAjWlyQ8zEYHHkPuGYqRVAyNQ3N7W0CI8dtX5VLhPvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
X-OriginatorOrg: intel.com
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvOV0gbWVpOiBsYXRlX2JpbmQ6IGFkZCBsYXRlIGJpbmRp
bmcgY29tcG9uZW50IGRyaXZlcg0KPiANCj4gT24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgMDI6MjY6
MjZQTSArMDAwMCwgVXN5c2tpbiwgQWxleGFuZGVyIHdyb3RlOg0KPiA+ID4gPiA+ID4gKwlpZiAo
Ynl0ZXMgPCBzaXplb2YocnNwKSkgew0KPiA+ID4gPiA+ID4gKwkJZGV2X2VycihkZXYsICJiYWQg
cmVzcG9uc2UgZnJvbSB0aGUgZmlybXdhcmU6IHNpemUNCj4gJXpkIDwNCj4gPiA+ID4gPiAlenVc
biIsDQo+ID4gPiA+ID4gPiArCQkJYnl0ZXMsIHNpemVvZihyc3ApKTsNCj4gPiA+ID4gPiA+ICsJ
CXJldCA9IC1FUFJPVE87DQo+ID4gPiA+ID4gPiArCQlnb3RvIGVuZDsNCj4gPiA+ID4gPiA+ICsJ
fQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2h5IG5vdCBjaGVjayB0aGlzIGFib3ZlIHdoZW4geW91
IGNoZWNrIGFnYWluc3QgdGhlIHNpemUgb2YgdGhlDQo+IGhlYWRlcj8NCj4gPiA+ID4gPiBZb3Ug
b25seSBuZWVkIG9uZSBzaXplIGNoZWNrLCBub3QgMi4NCj4gPiA+ID4gRmlybXdhcmUgbWF5IHJl
dHVybiBvbmx5IGhlYWRlciB3aXRoIHJlc3VsdCBmaWVsZCBzZXQgd2l0aG91dCB0aGUgZGF0YS4N
Cj4gPiA+DQo+ID4gPiBUaGVuIHRoZSBmaXJtd2FyZSBpcyBicm9rZW4gOikNCj4gPiA+DQo+ID4g
PiA+IFdlIGFyZSBwYXJzaW5nIHRoZSBoZWFkZXIgZmlyc3QgYW5kIHRoZW4gc3RhcnRpbmcgdG8g
cGFyc2UgZGF0YS4NCj4gPiA+ID4gSWYgd2UgY2hlY2sgZm9yIHdob2xlIG1lc3NhZ2Ugc2l6ZSBh
dCB0aGUgYmVnaW5uaW5nIHdlJ2xsIG1pc3MgdGhlIHJlc3VsdA0KPiA+ID4gZGF0YS4NCj4gPiA+
DQo+ID4gPiBZb3UgbWVhbiB5b3Ugd2lsbCBtYWtlIGl0IGhhcmRlciB0byBkZWJ1ZyB0aGUgZmly
bXdhcmUsIGFzIHlvdSB3aWxsIG5vdA0KPiA+ID4gYmUgcHJpbnRpbmcgb3V0IHRoZSBoZWFkZXIg
aW5mb3JtYXRpb24/ICBPciBzb21ldGhpbmcgZWxzZT8gIFRoZQ0KPiA+ID4gYnl0ZXMgdmFyaWFi
bGUgSEFTIHRvIG1hdGNoIHRoZSBmdWxsIHN0cnVjdHVyZSBzaXplLCBub3QganVzdCB0aGUgaGVh
ZGVyDQo+ID4gPiBzaXplLCBhY2NvcmRpbmcgdG8gdGhpcyBjb2RlLiAgU28ganVzdCB0ZXN0IGZv
ciB0aGF0IGFuZCBiZSBkb25lIHdpdGgNCj4gPiA+IGl0IQ0KPiA+DQo+ID4gVGhlIENTTUUgZmly
bXdhcmUgcmV0dXJucyBvbmx5IGNvbW1hbmQgaGVhZGVyIGlmLCBsaWtlLCBjb21tYW5kIGlzIG5v
dA0KPiByZWNvZ25pc2VkLg0KPiA+IFRoaXMgbWF5IGhhcHBlbiBiZWNhdXNlIG9mIGZpcm13YXJl
IGJ1ZyBvciBmb3IgZmlybXdhcmUgaXMNCj4gY29uZmlndXJlZC9jb21waWxlZA0KPiA+IHRoYXQg
d2F5Lg0KPiA+IFRoaXMgc2VlbXMgcmVhc29uYWJsZSBmb3IgdGhlIGNvbXBsZXggcHJvdG9jb2xz
IHdoZXJlIGZpcm13YXJlIG1heSBub3QgYmUNCj4gPiBhd2FyZSBvZiB0aGlzIHBhcnRpY3VsYXIg
Y29tbWFuZCBhdCBhbGwgYW5kIGhhdmUgbm8gaWRlYSB3aGF0IHRoZSBkYXRhIHNpemUNCj4gaXQN
Cj4gPiBzaG91bGQgc2VuZCBpbiByZXBseS4NCj4gPiBQcmludGluZyByZXN1bHQgZnJvbSB0aGUg
aGVhZGVyIHdpbGwgYWxsb3cgdXMgdG8gdW5kZXJzdGFuZCBlaXRoZXIgdGhpcyBpcyB0aGUNCj4g
ZmlybXdhcmUNCj4gPiBwcm9ibGVtIG9yIGRyaXZlciBzZW50IHNvbWV0aGluZyB3cm9uZy4NCj4g
DQo+IFRoZW4gbWFrZSBpdCBvYnZpb3VzIGluIHlvdXIgY2hlY2tpbmcgYW5kIGluIHlvdXIgZXJy
b3IgbWVzc2FnZXMgYXMgdG8NCj4gd2hhdCB5b3UgYXJlIGRvaW5nIGhlcmUuICBDaGVja2luZyB0
aGUgc2l6ZSBvZiB0aGUgYnVmZmVyIGluIHR3bw0KPiBkaWZmZXJlbnQgcGxhY2VzLCB3aXRoIGRp
ZmZlcmVudCB2YWx1ZXMgaXMgdmVyeSBvZGQsIGFuZCBkZXNlcnZlcyBhIGxvdA0KPiBvZiBleHBs
YWluYXRpb24uDQo+IA0KDQpJcyB0aGlzIGFkZGl0aW9uDQogICAgICAgLyoNCiAgICAgICAgKiBS
ZWNlaXZlZCBtZXNzYWdlIHNpemUgbWF5IGJlIHNtYWxsZXIgdGhhbiB0aGUgZnVsbCBtZXNzYWdl
IHNpemUgd2hlbg0KICAgICAgICAqIHJlcGx5IGNvbnRhaW5zIG9ubHkgTUtISSBoZWFkZXIgd2l0
aCByZXN1bHQgZmllbGQgc2V0IHRvIHRoZSBlcnJvciBjb2RlLg0KICAgICAgICAqIENoZWNrIHRo
ZSBoZWFkZXIgc2l6ZSBhbmQgY29udGVudCBmaXJzdCB0byBvdXRwdXQgZXhhY3QgZXJyb3IsIGlm
IG5lZWRlZCwNCiAgICAgICAgKiBhbmQgdGhlbiBwcm9jZXNzIHRvIHRoZSB3aG9sZSBtZXNzYWdl
Lg0KICAgICAgICAqLw0KDQphbmQgcmVtb2RlbGxpbmcgZXJyb3IgbWVzc2FnZXMgbGlrZSAicmVj
ZWl2ZWQgbGVzcyB0aGVuIGhlYWRlciBzaXplIGZyb20gdGhlIGZpcm13YXJlIg0KbWFkZSBpdCBj
bGVhbiBmb3IgcGVvcGxlIG5vdCBpbnZvbHZlZCB3aXRoIG91ciBmaXJtd2FyZT8NCkknbSB0b28g
ZGVlcCBpbiB0aGlzIHRvIGp1ZGdlIHRoZSB3b3JkaW5nLg0KDQotIC0gDQpUaGFua3MsDQpTYXNo
YQ0KDQoNCg==
