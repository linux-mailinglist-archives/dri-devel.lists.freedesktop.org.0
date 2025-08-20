Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E33B2E74A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAA510E7E7;
	Wed, 20 Aug 2025 21:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Knre1lmf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCB110E290;
 Wed, 20 Aug 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755724554; x=1787260554;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7qzMGymJ+t3YLNDv5avf0/6POIacfWHUPKlSQ830KcY=;
 b=Knre1lmf+78XQ+x7XLEGVjHaXaw1ineDX4EOcbElG2X1GVhswlUOHQbL
 36rp0Nb2MgMI4AdkH4Ggj/WtaPvgdssHp6OoFlqJ4Yjq5VLGA9wNwyh0M
 bSdtwlkyFCFBfSQkqFhZjIUGYq7uHBrUWdjoRvkm4zVg5VCMN8KIO46F+
 w915bGFjM6/jHsMr38eqQ9Stw2F4brCk/3M+hxinhyeuBYohBwxAFZG9X
 8xy7HeKsvGdxNOEhIEIyLtlNfpKNsWDSK6ITanBO6OumcFwF+au4L1atr
 2132DXWNUHPNGlASInoNspetrrv43ijUwJ1XxZcTwylM5rh3rSaebhfZu g==;
X-CSE-ConnectionGUID: NyWgmWK4TxqZWyIp5EkECA==
X-CSE-MsgGUID: y7EtKx9GQ3meF4/TbirRGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="83425140"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="83425140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 14:15:53 -0700
X-CSE-ConnectionGUID: Yxh1yYv4Qr6FJji6vZaLgg==
X-CSE-MsgGUID: CHHrwFfgRT2VOYGrz9rdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167845922"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 14:15:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 14:15:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 14:15:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.80)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 14:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slpsuWKmfGxjbRYlwZkae+PD7IaxMf36gkXxDZBX7q6YoFscmywNPjHyxM67KaaGmwhgerQwiHlxVAiXbeUbN+OgsnNydGfeLoIBq+lywzGxTESZhrUWCtZ51EbJWDyL3H+6h/zwqAma8lgYj7iq6jTKOir5SOH+07MNWxG8AlqA40wEHzu2xaixud1vEPQWeMfXMlUdg37UbohRemOyAgsA/ty8ycXeLvCfvV7xXuviu9/PxmRJ8W+GcJOeKv0qLy1Da6Jyj0LspIoDkzbWyp8ULm3UYNQGykUbkYhNS/zwKVtD81TIXfaYh5NK6HMVn2MxcnL3pQA/1hoI2GD5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNJ8y+hN95gtCivx+251N9jeG/HpjKFQv8YUwlLam/4=;
 b=IWZ+gx0nYWdm6ZUdjkcPidhcDMh+lwl5LsZVTCk3GVHPpw3pqoEjcXMJ7u+iB5thUpJrngcgggLbw+x70vooHamSRv8U1PfbJC7hkVSiLgvdVYV1qbzjemfS1uotz+AiRY2ku2o7e2fipJFa3HcPpzjupZAeuGJFLbzSTlWF41G12WzX/c5GkszNTriHcXvqfbGnGB+G0DSpls7pRPDjukMxiSrYMTyFmaskhinxqkwNcF3XBjaIkuLIccicnzvytPD9+Ev1l9xVzN2e8rDc4pO8Yh3siBKXp8Sc+edHJqWa/ke69g+Gx2Jvle5ecvE184XNYea3NOi9KKL8ym8izQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 21:15:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.024; Wed, 20 Aug 2025
 21:15:50 +0000
Date: Wed, 20 Aug 2025 16:15:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Carlos Llamas <cmllamas@google.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Atwood <matthew.s.atwood@intel.com>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>, "open list:INTEL
 DRM XE DRIVER (Lunar Lake and newer)" <intel-xe@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: replace basename() with portable strrchr()
Message-ID: <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
References: <20250820201612.2549797-1-cmllamas@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820201612.2549797-1-cmllamas@google.com>
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe859d1-ba51-43f3-00d0-08dde02ebd38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTI2WWM5SnJxNGtwMjQwalRZcy8yWkc4czl3SE9XbXdkRzB6WEFaWUgrZVl0?=
 =?utf-8?B?djltUnc2eHk1WlRyMzJHN1NOczUyV2pvVUxpaFVOK2JxTFhkZUJ6VWFtOXd0?=
 =?utf-8?B?cEYwRlgvUHhCWElYbm1ESjVURE9FNkY3dW1mWkx3Zm9EQUNzais5NG8rdkN4?=
 =?utf-8?B?SWpwQXJPNEpBbVZzbThlOHdJYVdNV2h6NTM1OG9sOTN1U3MxZnRGN3ZLalZL?=
 =?utf-8?B?MUVlR1lKaGN3YUxrL1JLM05TOUFBWk1JUnRBUFFHejB5S3dsdWx6VUhleURL?=
 =?utf-8?B?MWQ3UWdnMngrRGVNRlIrQ01zOUNSczgraVhwM2lsUEw2V25HNFl3OEpmdmY1?=
 =?utf-8?B?NkdtZXNLQUVZSmp4djdvb1ZGTUJadUFKK1p6aEFSaDdaT21Sd3BhQzdjVDUx?=
 =?utf-8?B?ZDJ1YkROTWtVUEFXaGR0OUZJdVg1bWJGSWJtRUM1MFcrNit5aE54N1FTZG8y?=
 =?utf-8?B?OHg5ZmZ2aG85SVZaMUl0bklUZ0orSEdzZ296VWQwa0xwU3ZOcEdWcFVPYWtk?=
 =?utf-8?B?Y1dMdGx6eWNnNEhVM21Hei9IWUh0SmZlV2Jsc2QwWVk2a21HR0d2azJZSDJL?=
 =?utf-8?B?NnFuanUwSFpOTUt5cXdwYkF3b1lpUVlVMkp4ZThQTm42VzhBV3R1M2Izd3dL?=
 =?utf-8?B?TXZtWWJ0Mll0WEgzcDZOaDhVbExmSDBDVEw4ekFHMUlUNGdJTlQwTUF5akR5?=
 =?utf-8?B?eWxjODVxMElrZ0FGSTJ1UytWeVNRSG1VenQ1UC9HRU9QZ0hxbDdaTDVkYWR6?=
 =?utf-8?B?TkVFN1RCcnlmV2ZpSmVMSXI5NGU3aWxaUG5oRjc5bFdDazlNa2dDVTcrRnk4?=
 =?utf-8?B?anYvallibDNGUVV3Mll1UmY3aDkrdW1PT0RBTjNiNXI2VHgwTkhEUXQwV3hG?=
 =?utf-8?B?MEowMHRXa0VaWjVHcE8vNElmazNuTlEwWTJneUJrOENDV0VCdGdwTE1teTdO?=
 =?utf-8?B?MkM1a1dvMWRiVTUwTWNFQmZ3N3BwMktCaGxQUkZUQ1JSaHdadi8yek5BbmMw?=
 =?utf-8?B?MGIzK1J1TndmUlJYY2tGVmk4UE52MDN5UEhobnpEWUptUVFHRnBYRE02Si93?=
 =?utf-8?B?Yi96S0o2Z0xBZlhmaklXcTlnRW9FWjZIZE1wTHJyL1E0aGZBbGNNQ2NEL0pN?=
 =?utf-8?B?VmUwMTBjTXNwRDRUQ0w2YzkrcitpbDRHQ0UyMHZtU0dyRCtQWXpHajhsQTB0?=
 =?utf-8?B?THdpdVVZWjBSTXF0ZytsR0UzQmI0S0x6T3ZBb1VUd2JsU3U1enJXNkJ3Mlox?=
 =?utf-8?B?TERPcjk5d1U3a2cwSEI4RzNRcHA1MnZKeHh4TGh2cW9Zc2tzSjh1UTRxandi?=
 =?utf-8?B?WURacEdnNEhyMFdQb2lKeU40Z080dy9FcmVBd0RUV3kvckJ4eFpNclJ4VHVq?=
 =?utf-8?B?T215aVlrMldtSUprcW9NVUorYTRlUTY5UzlsSXB0aDQraEtqYm5acmtyQmtV?=
 =?utf-8?B?NlAyUEpzU0VFbFNUSU51RTZPYkJNQmFsSVA4TG9zVFNEWVh3bjgvS3VXL3ZP?=
 =?utf-8?B?ZXY0VjNNbTBuSDBSZ3c1SEI3RHZSaE15OTZCdFhBMFZjN2E3ZDN2UDlzQnNT?=
 =?utf-8?B?UkVNL080UXVtOG5LZ0RMQU5GdTRTem1NMDNGZTAzeTNwNW90YS9xZWREK2Jx?=
 =?utf-8?B?Qi9BVVJvQmxhc3B2VFYzb2tiWmtaa0NjMm5RM0FXdUtrV2tQK3dSUTFtdEpI?=
 =?utf-8?B?WndqbHVhZVVpaEUySG0vNllSTGplVXBLTkFZd3NxVjVWRHFDa3JlYnZNUEY3?=
 =?utf-8?B?OHNpTDJiUlhpZXplV29qU2V0aUxLTXZpYkRKa1lwRjZMS3VBY0RzT1hWOG1o?=
 =?utf-8?B?MmVBMEpETzVkU0NCR3lrSGdkMjhtaFRsWDJmc29rZUpwODFzRzllOHJhRkc0?=
 =?utf-8?B?Rmx5UlhmMVZ2YU9jekpIY2wzMkdqSjBacm9qenZkeUJVOExBeHhTQ1YySEly?=
 =?utf-8?Q?zNs56wo2NsQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0pvSlhLK3FiVDEvNENabzNCd0lrM2hhVStCNUxQTGZUN0l2bnZUblB1eW1V?=
 =?utf-8?B?a1JPRnYvZ3J3eFE2VTNzS0Z2YnorZlpWdkNwKzhMdVAwd0hIMFJodEFwdTFy?=
 =?utf-8?B?ZVdqVWxMcW5OQVI2N0hvZ1ZXRDRwNzhUbTBOTWtONTd0MStsZlZ5RWhPSXlN?=
 =?utf-8?B?WnAxaXNMZS9rNHJrNXNoSC80YnBPZHdRWXNSSlVxUXQ5WGNVaXFaek5LZ1pu?=
 =?utf-8?B?aUZ2NW1zQlNxNjBTcjIzdGdoZnd3VXVvc1V0bGEyRzRad3BqUThhWEhLTDlD?=
 =?utf-8?B?T0NYbVVjWnkxMmVRYXFXK0Q2SEltMENrN0g5TmpmVFBUNmcrUjNKbXlNMkxT?=
 =?utf-8?B?ZUJZbFdFbmFjUlMyNWFxVkpPY1cvODFkWnFySnBiMExtb3BFeTJNbG12Tkdj?=
 =?utf-8?B?MVdIN2Y5V3cwZHZ4SEQwakFFNEYyZDVxRWNpdkhOVEtaY3BmL1RWVHlvbVlO?=
 =?utf-8?B?bHRpeXo5cWNFaHBxSVdxVlhQWUtvV3R5aGRqcHZFNzNSTlRXR09YSUgwZkVX?=
 =?utf-8?B?L1RiUjJia3h6VVZuMy9GaHU2emFHK1hNWUhJUHBCL2p2cHdtM2FTWVcwcHNI?=
 =?utf-8?B?Ums5RkNLenh6MlhVT1ppM2w2TTJSK3ZKTmFkcUh1UFhsNXFCVVdUR3FUMUhz?=
 =?utf-8?B?N2s4N3ZJOFp4UENvaTR2a3AydngwdDZyVEpJYWEvamQzN3o4Z0FWSVFNZ002?=
 =?utf-8?B?bDZSeE5rUFNSWXZnQWh2bUVYYllPLzU4bGhCMlprMDNheVBoWUZzNDhHU29E?=
 =?utf-8?B?K1RPeTdJenZubWVrWlN2N1JDQjZmbVVkRUozUU1vclBpMVIxdDZiUUdIVDZN?=
 =?utf-8?B?VkpmWCtGeEZ3VWpPT3YzcUowTG1WWTVoRUNuNklTN0R6N0VYSStWSnRERStF?=
 =?utf-8?B?dS9yNGFuekNJKytFYlJYS3VtcEhsaEtXTmhUdm5EREdRVUpVTVdmT0htZktQ?=
 =?utf-8?B?OXR4SFlPcDRTUVU0Y0orZTRMTTd2T3M3MEd0WUs1T21NMGpKUmIybXNtVzVJ?=
 =?utf-8?B?QnR0a2M4VGlseWYrZ1hkRFozSFZJZTdQdEpkZkNVYzdiVXNQOFl1OUk4SW1p?=
 =?utf-8?B?TEhrQzMzWlVHak8wNjR6ZnhNdVFRU2Z1RFFISGNpOWk3dmM4bnpDV2ZCSUFn?=
 =?utf-8?B?WU9mQ3VZbEZDdnFLMm1xY1BPcmRieUNBMnp0ekl2aEkwdlF3RHdGbXNOekZL?=
 =?utf-8?B?NmpZdWpTK3hJUEs0dEx6U2FFL3h6N2JLWHQ0V2trRGtYaW5DSXlHOGNRWmpX?=
 =?utf-8?B?UllSQ1pwejFGakJmMjhDbk5sUHJnNTVXM2UwTWZRUzJ3TEVmWks2OHRQM09F?=
 =?utf-8?B?aHZlUGlmV0NsYzNaU1NocnA4Sm4wL0pOYStPdXJOSFRhcnNWalhGODdsTnZa?=
 =?utf-8?B?UTVxcE5valA3dWtWZVlxQXdldVhGNUl1eXlMYlpmTFd4VDNGdkgrKzQyNGND?=
 =?utf-8?B?RUJpdkFGcDlUQkR0ZkVyODVjc3pPWTFuVUJ4bEduM1A4Y3FSWXAzYjByc1lM?=
 =?utf-8?B?azM1UWZXbXFvVmNxMEl0OVVYMlUrUTVmZGZjOUVUVWpHTytYeXJ3bmpoNEZh?=
 =?utf-8?B?bXhVZVNOaGNva0g2aGhwNVdraWtMb0JSOUNGdzVubk40dE1KUTdNa0pwU1NB?=
 =?utf-8?B?MGRqZmFOUmVmUmRWRHpsL2Z5QjlFYytqYWR6SEVrN2VuSGVNVnI4aHVXV2pz?=
 =?utf-8?B?OFlzenVwUFFPYlhWdWY3b3pTZnh0TW9pUzgrdyt4aWhFRFlwc1RORWdFQzU3?=
 =?utf-8?B?YjBQWmhOYjBzQ3l5N2JYRlg5c2FkVmdaNTFiZlBuQ0pkYVE1VHJrdTlueHo3?=
 =?utf-8?B?TzBpVjJZSkhuVFNyWERlbkRIVE0zd2xGVk1UZHgrTlFzaU1yY2VnTTRUakZq?=
 =?utf-8?B?VzBETVRZN292RGZ1QkVqNUI0cllDaWhIcWRtUjhDaEtsZU5ySzE1OXpHNDJs?=
 =?utf-8?B?aTVuWFl1ZnhzNjJNOGJLbDB3NWtSN1VseWxQZWdLTDlua2N1NW41Q0ozcHIr?=
 =?utf-8?B?Vm53WHk0UENmUGJZbkcvcGdmb0ZzNUVKa3FOTWdrNlZnMlpKNmtGM1ltTWZs?=
 =?utf-8?B?UDJNWjJiS1p3OEpLbWhFK2paOWU4MzI1QkNKVDVDZzVodmpLSmZ0ajZBcUVx?=
 =?utf-8?B?VnlTZVYxNUFva0pPTGZNUDFHNXVVUTNpWGl5UVdCNC8xa0pVL0tDci80eWR0?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe859d1-ba51-43f3-00d0-08dde02ebd38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 21:15:50.6093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYCTq7+dmNcLVGIpOusGCegK4X1SiEcN9ShrZ0SMyZQrU5NjryyPfODEylcAvC6DJK3OuB0BbDDV1raFgJpFtAzwKUre/Wy/jAaDjsiZ3QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
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

On Wed, Aug 20, 2025 at 08:16:11PM +0000, Carlos Llamas wrote:
>Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
>introduced a call to basename(). The GNU version of this function is not
>portable and fails to build with alternative libc implementations like
>musl or bionic. This causes the following build error:
>
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>    130 |         fn = basename(fn);
>        |            ^
>
>While a POSIX version of basename() could be used, it would require a
>separate header plus the behavior differs from GNU version in that it
>might modify its argument. Not great.
>
>Instead replace basename() with a strrchr() based implementation which
>provides the same functionality and avoid portability issues.
>
>Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
>Signed-off-by: Carlos Llamas <cmllamas@google.com>
>---
> drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>index 6581cb0f0e59..0a94a045bcea 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>@@ -125,9 +125,11 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
>
> static int fn_to_prefix(const char *fn, char *prefix, size_t size)
> {
>+	const char *base;
> 	size_t len;
>
>-	fn = basename(fn);
>+	base = strrchr(fn, '/');
>+	fn = base ? base + 1 : fn;

I think just a xbasename() helper like we've added in kmod would be
preferred:
https://github.com/kmod-project/kmod/commit/11eb9bc67c319900ab00523997323a97d2d08ad2

Alternativelly add it somewhere that can be shared across the userspace
tools in the kernel tree to fix the mess that we have here:

	git grep basename -- tools/**.c

Some dup the arg simply to be able to use the libgen.h version, some use
one or the other on purpose, etc etc.

Lucas De Marchi
