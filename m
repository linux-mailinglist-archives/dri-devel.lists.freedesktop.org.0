Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D55A1CFD9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 05:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB0810E222;
	Mon, 27 Jan 2025 04:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwR+3zC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCEA10E1F8;
 Mon, 27 Jan 2025 04:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737950556; x=1769486556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bvP51burNHHZ0MtCdbH9xWiNWC71C8Ll0rATCD6cNRU=;
 b=jwR+3zC/oqoOYqdp8WuwF5AQ9tc093Bro9dzpgYFvcimMgH9vJrDCm/v
 mwxzx8GGy/VCx+SvlqiSaC18tsEVFx9edbgr7q4XIVe/Iz6FZ11gsbJYc
 mxZNYiTu/klIHvjOu3bq6X1kl5bsPSBfChrBIsIsdNcv3GEEH4HB6kjmo
 Po7c1tYnme1kSp7Rovq/wYdt38UzuBgBmPqQaJHip9KXGzaQScyZNXBd7
 5FBaI8h0h1FjkxcE3OXBRY75/hNuPAb4UgC9jcmR08Rlszl2n8fwIpLYD
 Zt99VL17KPpa0hKc4cPNnvZqpq+BB2+uTDq8ddlL1o5A2ve5oiX6xBPDR A==;
X-CSE-ConnectionGUID: LLDYUNrcSQuVqiHxxgS7pA==
X-CSE-MsgGUID: n8Uw1feRSVmJtNMPPG+fiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38286174"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="38286174"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:02:35 -0800
X-CSE-ConnectionGUID: av7M4aB7RO+PqiHhuMxg5Q==
X-CSE-MsgGUID: slfuncfgR5iieM4nmR698g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113459680"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2025 20:02:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 20:02:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 20:02:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 20:02:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9OFKWBqEnUznhJC6qehGNQyYR/jPuHB1LqHHHYpIEnOWLeUOFvnqG/5zlfAF1THKzp9gjlCFOEuyCHLI2OHU6ehSV3cuwLwywhQhRndtBbIsFK+N+Vhq7FX5F0P2FrruAH0ML009A8Fw+60yhRXBXZGmjgz1AxGmhMQbEDiQJNqplyni7RQuILvHzgdqJ13E5arSsncikvtnVVgzqD9rmrQ2rXDPM5jsDqoH32CrVE4fZMQC4j6phfbuTQMoZqFfTQ6n4po5sQ7RttHE13lpFjDSa6y7HdhharEnDjzuKFm8fFa5fKc1g7llrLKNvJOVjziVb/TlFzPU43QZw7WSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvP51burNHHZ0MtCdbH9xWiNWC71C8Ll0rATCD6cNRU=;
 b=fz+YZigr/8Yzm8f9j36lu9didSjWzEJi/+vB17Qu5X+CFc+0HHqt3tgWCw/+biw0wcAEdKMrgFhGuWcmLizaOJYvbCZoL9HqkY5b1EvF+jiUGjjglHwJySy0ur5ZcZ6UTlGXVZtmo0l4HOauTUF9Zx/q7X5O9dKYkG+0KfYg4GAW/8iOaR6teND4KtOQLutrmWwwZPtPQV4TTusCJqTb1ZUFs4cg2Kx2Ih/lXYm7XkuO4GLbS2g+XzBw4B0t4mAsWF1AzxZ/rJRNuR0GKSsXnBy46fAvw6eJSwpqD9H1Uict3yYybw11qWEezesgux8Eq+EHyHsAAezHcJ8shwtVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 04:02:31 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 04:02:31 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: Brian Geffon <bgeffon@google.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Wilson, Chris P" <chris.p.wilson@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Tomasz Figa <tfiga@google.com>
Subject: RE: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
Thread-Topic: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
Thread-Index: AQHbaC7neG8peSCTkESx6yyEUtSfT7MjtxRwgAJfXICAA/ljMA==
Date: Mon, 27 Jan 2025 04:02:31 +0000
Message-ID: <PH7PR11MB82524838FC5914937C5EA1FD89EC2@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20250116155340.533180-1-bgeffon@google.com>
 <PH7PR11MB8252B7BF1D1B6ADE94839F8F89E02@PH7PR11MB8252.namprd11.prod.outlook.com>
 <CADyq12xLorH1kzH6ezp2Z_SYv-AVbrp+h98FeYP+hbt2R1_1Nw@mail.gmail.com>
In-Reply-To: <CADyq12xLorH1kzH6ezp2Z_SYv-AVbrp+h98FeYP+hbt2R1_1Nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|PH0PR11MB7586:EE_
x-ms-office365-filtering-correlation-id: afcfba2c-1ca8-433b-f8af-08dd3e876c74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Tk9uam04M3d0NUJPN3NCc2FmbW5Rd2t1czV1VFczQW1VZDRRQVhQbHRXV3Ju?=
 =?utf-8?B?am4rbWF1Y1Y5TXNMV2Q1SHhpSmFwSlJWUDlWb1BSWVN2YlpBSkh3TytzNERP?=
 =?utf-8?B?aitLS1IxS1lqTjRIQ215VWdJYmlkdUc5SG94dzExbGJMMFhpc2RSL1ltempL?=
 =?utf-8?B?QjZCNFFxTFFaemZMZStUL2FWMGtESjZWTkhhVDU2VDBVNXh0bmJlSlphdm9s?=
 =?utf-8?B?bE9qVkZIOVUxeG5nWVF5MmpFYWdEaWlDT29INmF2ZWNJSVRuVVdoTE5aKzly?=
 =?utf-8?B?SkdwVmRFV3JucndGNjQvUjMxNXhmSU1ua2JqUTF0VDUzVC9CNVhCdjkycUJJ?=
 =?utf-8?B?QkFDeVRKUVBnMitwblI0VThZamlqNmoyZzRjZXFuK0NUOWpVK1ZobER0dVlF?=
 =?utf-8?B?Z0I1bm5QT3pXcE16SVRZQVBTQkp4VldKY21heXFWaEJPQmNKbGhaeUV0UVNz?=
 =?utf-8?B?ajlVeFdubENTb1phK2NPc1ZCelFHOU9DbG5iTUM1M1VqZmtDMHN1a2ZuS2N4?=
 =?utf-8?B?ekwvS2JTVmR5a3B6aXZHU2ZVVHkrdnNtSWRFbDJycGtnc21sV1Zvbkc1NGxP?=
 =?utf-8?B?QXVSNkFiV1QwVkt5cFBZL094d1dzWTBmYS9ZMUhodGQxYTdLRDJ2d1ljVFBu?=
 =?utf-8?B?ZTNldTJDRUM2UXJYNVlkRUh0T0pQY002TFMwcHNsUGIwUHlPUmdIc0xRNVJa?=
 =?utf-8?B?eXZvQ3daRW1FcmpBRldPeXQ0QzFFcC9FUWRZWStjTXBBYWk0MjZabmUvcFdp?=
 =?utf-8?B?SEtBRkFJdEdBMTFucWQ0Zk5ObjBMODQvQUVzdUtaVmdnRFp2WnF2K3FhRCs5?=
 =?utf-8?B?bVR5bEExc1VueXdFQVY4V1ZFNzE0b1dGakZvMk9BdVh2ZlFHZXk4Nm9tRXhj?=
 =?utf-8?B?bVYrYUdtOGRXWXlGeUVXQ25zUlZPTHFJSnlDSi9HQ1lBWFc1bytnUzExb0dw?=
 =?utf-8?B?VjJDaUkvSVJGNDZXNFdBZUpTWHA2NTBzWk5lS1BZb2wydm5zTzViRy9QYW14?=
 =?utf-8?B?RGJSTFFrUjZYQloycmRuU0E0TU9TUWVNczdLZE5yWHVmNFN0VlpWbWxsRDUz?=
 =?utf-8?B?U1h4V0txbjYwV2Mva1EvTy84b1RlbFR2OWxKN1gzMjlyRy9iczdTbzVhaWVY?=
 =?utf-8?B?ZkxqN2lGMHo1V0JrMVBlVXlJNzhYUEFsN0lYaUMwVjUvRUcxVEZJN3VoMThD?=
 =?utf-8?B?SUZWMlBOSmhoQVNOenFvRGE2eXpUK1RWRnJrc1pqSFZYc2dpaWxUSVZ4UTgx?=
 =?utf-8?B?VEswQWFBT1FYaHFQOFgvZG1jcnBGU3VlZVcvOVRuWjg0WWdRQWhlRldRNGZv?=
 =?utf-8?B?d3hoR1FNTDVkMXlUbWJxMm8zQ0xNNUJHWTdlQzducHlGa25CQnZ6ZVBQemto?=
 =?utf-8?B?enJNSHp3YS9BRzBpR2c3SEw1MDRNTDBpUHZEV1dGUEp4U0N4RjRreHR5dXlW?=
 =?utf-8?B?QTN3TisrVytFR0lmUHpXRkk3bkhNRElxSDhzbG94MnM3akNEOVp4S0s0N1hO?=
 =?utf-8?B?VjJlbUxnSE9KRlpMODdZSzkrd1pyb3l4eU82NS8rbjlPb3h1TEF5dkZHbmhL?=
 =?utf-8?B?bWlLWlJzNFdGWXJNUFpuRUxKS2ZGT1F2Z085RzhKUzl6eTRUUGJsVnMvUUxw?=
 =?utf-8?B?TU5GTk1rU3VTVlNJenVKMUhVd1NVOWVFWktkQ3I0VHNLN1d3T2VYd1R2S3NZ?=
 =?utf-8?B?dXovV0hxRlpESTVCRXhkRytGbUtYcDJDem5KTEp3cFRtTkJLdndPSVl1Si9o?=
 =?utf-8?B?US9aOTNSemdzdlRKeVZWWVAra2Rzd3RGQXRGMlkyOUpMWWh0WW1qSjFPOWtu?=
 =?utf-8?B?U0hFMEExRXMvd3poL1JMRHhCT2lncDBpNnZVRkwrS0FwRk1zSkdtd2xScndq?=
 =?utf-8?Q?48+bYpo5yE8Tt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1cwbVhJNDFzVTNhUWg1Y29zcmdFSHArZ2s0MG15WkYrTUZMTkxleCsrcmVn?=
 =?utf-8?B?UVdpQ1ZpSTFFZjY2ZU9Eei85SnN2Q2dlUDdlT1JUaFBiUk1zL3FmbUpjWDFS?=
 =?utf-8?B?TS9nTy9GOXVUeUhXY0RlOGo3K005YitRbVNsNmU5WldNSkFCVXhSVDNoVk9P?=
 =?utf-8?B?TEgxZ2E4cHJhbEI1eDZTSitaUzZBUHBjbFA0R1pSN0d3Y1FyMGdYOHdpaGxF?=
 =?utf-8?B?YWV0Uk1ucDFKamVZdlRpdFhkMHlaUDF2VlcrTXlGVHB2NWEvSFhnai9lcWtN?=
 =?utf-8?B?SlFFZTZSeWdqU2lzdk9YRC8xZVJ5TENNU09RU21RSjR3OWpQTEIyQko0aVRF?=
 =?utf-8?B?NUFHWnZKellwQkZjNnRsN3g2QlFjYkNPZnd6M0QvY3p6NU9yR3hPcW44SFV2?=
 =?utf-8?B?WXc4MVJRVlhLdzVuSTJHZU1FdnA4aUZYcCtlQlFPUU83MTZJekhwOGdSWXp2?=
 =?utf-8?B?ZXhCdHhRT2JzTkYzZmRRc250OWVHQnFHemtrdU1HT0FTMnFYSkdRMlR3VjRn?=
 =?utf-8?B?ODJLYnJSazYrdy92V3NVbUhEd0dCWDNMamxnbHY2ZTJkK3VnRCtuNE1RS0hG?=
 =?utf-8?B?UDFDaDA4Q3l3YzVlbmNMait4VVF0a00za09FSHprejJKV0VxVjg1Rmczb0Uv?=
 =?utf-8?B?QlhvZjNQcnM4MVRobThQOXdkMDRNZkxObE05TC9yQmFmcDFpQlpuLzRUUDM1?=
 =?utf-8?B?Wng1YW9xd1U3TE5CMUwzTDV5VHFNd1orL2wyY2IweXZhK3BITzdOQ3h5Ujh4?=
 =?utf-8?B?Z0J1eWZYb3NsMEVxT2xXOXVkckdvcVlLTVhWZnArRnRXRGNkOC9zTFlpS2Ey?=
 =?utf-8?B?ZVBDZWZldDNCOE9kUi82ZWtsaGdCWkJjMTJYbERnZEc2T0VnVlNDdk9qTWN6?=
 =?utf-8?B?UUU1UThvYUdpU1hnOTVPYS8xTkp5TzloejNPck9mUG1YRjV4NW4rK0d0WkNV?=
 =?utf-8?B?WTB1M2t4blliS1B4N2FYS1BmOU1pS2xRVjdueTNMWlUxT0hCU05Sc29mdVBs?=
 =?utf-8?B?dVY0STBlWEVmQnRIdE50MXh0NEJ5bWVzeTFidjNpdUJqVTNIYk9FU20wT09T?=
 =?utf-8?B?c1pMSHZsKzRSdXFZZ0tzR1M5QitNUy9TYTZVTitJVU1lUURDYlF1V3hEaGZ4?=
 =?utf-8?B?NUpjdUdVL2xMbDVoMDhaVERQN1lTQkt3OXptcERiOUx5UzZLWUhCVXNTcUUw?=
 =?utf-8?B?QWFxKzQ1ZkVyUE0zQ1l0U0hOTVF3aWN5UXJEV0pnT2Z3ck4rS3MrTDV6SThz?=
 =?utf-8?B?THppbGp6M08vZlVSRnZFM09yZG5IRXNtVDVLak1yK2U0VENXZzZsRExjTnd0?=
 =?utf-8?B?c1MyU0U4QTg3QnpHN2MzWGo2T242M1hua1prUitPRWhlRGxub2ZSWXVyNThN?=
 =?utf-8?B?NzFHVHVGMWcwMnlqa0VYWm5ReUVsbzEwM1VkdnFDVGlEc0pzYTBSbm92NGFs?=
 =?utf-8?B?TUFpU0RWbEhvT0VnU3pWU3RkbW9ScTN3ZHBYU0h0UDlUeDhRdUQ4N2RWc3FJ?=
 =?utf-8?B?d1AwUVNhbnhHVjhYR2VTZ1NHN2RyYVVkSXNrcEE5SzFlK1o0c3NoL1VMbmty?=
 =?utf-8?B?WWNIRmxWZXpFM3Q0NEZXd3BKTjU3MlFVNE92Qmh1dXBhSms1b2FxS1FtcFlF?=
 =?utf-8?B?L1NnVG5oUmo1TEgxWTZ0RElxbDJNdFVDbHhHbkhyVll2MlAvdkQ5T2hacTQ2?=
 =?utf-8?B?Z1VRaElvYWtSUFRDd3IxRVdoYStDNFFkVWk0blJyeGRpS3FETlM0UHlKOW1u?=
 =?utf-8?B?dEhaa2hvM2NVM1lmdi9iNnM3c1h3ellZbWJ5VUk1QTZZWUZDK1NmWW1sem9E?=
 =?utf-8?B?Q2NhN0UxNTZSclpOelRaWGpxU216NFZxcjVOMjhoMmtZK1VVUk04QkZRMC8r?=
 =?utf-8?B?OGhkcXZacHFSYkMrQWpDV2Rha1VqMWYwbE1lM0hhUEY4THlrVm9iU0xQVkxn?=
 =?utf-8?B?clo0WVlnVFZEYWRhN1I1VnNMVWFYZkpLWkhpMkdIL0VmV2hOMWtOdmt1V1Bw?=
 =?utf-8?B?TFo3VTlWOThncWFwek5WSUVsN1BGUDBoak01V3F0R25EMWtIVVRQbFlWYUVr?=
 =?utf-8?B?WEltUkNFSkI2NnFHMUZyaGtnaUZwZ0RqNTdpY3UrTGlzeFJ3aW1oS2VUSXpk?=
 =?utf-8?Q?gmWFXhs0NZINRR3FkceKLboTZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afcfba2c-1ca8-433b-f8af-08dd3e876c74
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 04:02:31.7199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/TLM5P2jiW34Zo54WLz7QqapkAgOfU7RP4X5AreZVpJjmCD1BBWRq22qMq1R5XsS9pmJSfHyadsor0yU5QoWPhfrKf1si9lS9KjVs8B/CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJpYW4gR2VmZm9uIDxi
Z2VmZm9uQGdvb2dsZS5jb20+DQo+IFNlbnQ6IDI0IEphbnVhcnkgMjAyNSAyMDo1MA0KPiBUbzog
U3Jpbml2YXMsIFZpZHlhIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+DQo+IENjOiBpbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBXaWxzb24sIENocmlzIFANCj4gPGNocmlzLnAud2ls
c29uQGludGVsLmNvbT47IFNhYXJpbmVuLCBKYW5pIDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT47
DQo+IE1pc3RhdCwgVG9tYXN6IDx0b21hc3oubWlzdGF0QGludGVsLmNvbT47IHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tOw0KPiBqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb207IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBKb29uYXMgTGFodGluZW4NCj4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+
OyBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBUb21hc3ogRmlnYQ0KPiA8dGZpZ2FAZ29vZ2xlLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtL2k5MTU6IEZpeCBwYWdlIGNsZWFudXAg
b24gRE1BIHJlbWFwIGZhaWx1cmUNCj4gDQo+IE9uIFdlZCwgSmFuIDIyLCAyMDI1IGF0IDEwOjA3
4oCvUE0gU3Jpbml2YXMsIFZpZHlhIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+DQo+IHdyb3Rl
Og0KPiA+DQo+ID4gSGVsbG8gQnJpYW4sIE1hbnkgdGhhbmtzIGZvciB0aGUgZml4LiBJIGFtIGFk
ZGluZyBteSB0ZXN0ZWQtYnkuDQo+ID4gVGVzdGVkLWJ5OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEu
c3Jpbml2YXNAaW50ZWwuY29tPg0KPiANCj4gVGhhbmtzIGZvciB0ZXN0aW5nIFZpZHlhLg0KPiAN
Cj4gQ2FuIHdlIGdldCBhIG1haW50YWluZXIgdG8gdGFrZSBhIGxvb2s/DQoNCkhlbGxvIEJyaWFu
LCBUaGFuayB5b3Ugc28gbXVjaC4NClRvbWFzeiBoYXMgbGVmdCBhIGNvbW1lbnQgb24gZ2l0bGFi
LCBJIHRoaW5rIGhlIHdpbGwgaGVscCBvbiByZXZpZXcuDQoNClJlZ2FyZHMNClZpZHlhDQoNCj4g
DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206
IEJyaWFuIEdlZmZvbiA8YmdlZmZvbkBnb29nbGUuY29tPg0KPiA+ID4gU2VudDogMTYgSmFudWFy
eSAyMDI1IDIxOjI0DQo+ID4gPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+ID4gQ2M6IFdpbHNvbiwgQ2hyaXMgUCA8Y2hyaXMucC53aWxzb25AaW50ZWwuY29tPjsgU2Fh
cmluZW4sIEphbmkNCj4gPiA+IDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT47IE1pc3RhdCwgVG9t
YXN6IDx0b21hc3oubWlzdGF0QGludGVsLmNvbT47DQo+ID4gPiBTcmluaXZhcywgVmlkeWEgPHZp
ZHlhLnNyaW5pdmFzQGludGVsLmNvbT47DQo+ID4gPiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbTsgamFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tOw0KPiA+ID4gbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgZHJpLSBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gPiBK
b29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+OyBCcmlhbiBH
ZWZmb24NCj4gPiA+IDxiZ2VmZm9uQGdvb2dsZS5jb20+OyBzdGFibGVAdmdlci5rZXJuZWwub3Jn
OyBUb21hc3ogRmlnYQ0KPiA+ID4gPHRmaWdhQGdvb2dsZS5jb20+DQo+ID4gPiBTdWJqZWN0OiBb
UEFUQ0ggdjJdIGRybS9pOTE1OiBGaXggcGFnZSBjbGVhbnVwIG9uIERNQSByZW1hcCBmYWlsdXJl
DQo+ID4gPg0KPiA+ID4gV2hlbiBjb252ZXJ0aW5nIHRvIGZvbGlvcyB0aGUgY2xlYW51cCBwYXRo
IG9mIHNobWVtX2dldF9wYWdlcygpIHdhcw0KPiA+ID4gbWlzc2VkLiBXaGVuIGEgRE1BIHJlbWFw
IGZhaWxzIGFuZCB0aGUgbWF4IHNlZ21lbnQgc2l6ZSBpcyBncmVhdGVyDQo+ID4gPiB0aGFuIFBB
R0VfU0laRSBpdCB3aWxsIGF0dGVtcHQgdG8gcmV0cnkgdGhlIHJlbWFwIHdpdGggYSBQQUdFX1NJ
WkVkDQo+IHNlZ21lbnQgc2l6ZS4NCj4gPiA+IFRoZSBjbGVhbnVwIGNvZGUgaXNuJ3QgcHJvcGVy
bHkgdXNpbmcgdGhlIGZvbGlvIGFwaXMgYW5kIGFzIGEgcmVzdWx0DQo+ID4gPiBpc24ndCBoYW5k
bGluZyBjb21wb3VuZCBwYWdlcyBjb3JyZWN0bHkuDQo+ID4gPg0KPiA+ID4gdjEgLT4gdjI6DQo+
ID4gPiAgIChWaWxsZSkgRml4ZWQgbG9jYXRpb25zIHdoZXJlIHdlIHdlcmUgbm90IGNsZWFyaW5n
IG1hcHBpbmcgdW5ldmljdGFibGUuDQo+ID4gPg0KPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcNCj4gPiA+IENjOiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4NCj4gPiA+IENjOiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29t
Pg0KPiA+ID4gTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tl
cm5lbC8tL2lzc3Vlcy8xMzQ4Nw0KPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDI1MDExNjEzNTYzNi40MTAxNjQtMS0NCj4gPiA+IGJnZWZmb25AZ29vZ2xlLmNvbS8N
Cj4gPiA+IEZpeGVzOiAwYjYyYWYyOGYyNDkgKCJpOTE1OiBjb252ZXJ0IHNobWVtX3NnX2ZyZWVf
dGFibGUoKSB0byB1c2UgYQ0KPiA+ID4gZm9saW9fYmF0Y2giKQ0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQnJpYW4gR2VmZm9uIDxiZ2VmZm9uQGdvb2dsZS5jb20+DQo+ID4gPiBTdWdnZXN0ZWQtYnk6
IFRvbWFzeiBGaWdhIDx0ZmlnYUBnb29nbGUuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5oIHwgIDMgKy0tDQo+ID4gPiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYyAgfCAyMyArKysrKysrKystLS0t
LS0tLS0tLS0NCj4gLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90
dG0uYyAgICB8ICA3ICsrKystLS0NCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmgNCj4gPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5oDQo+ID4gPiBpbmRleCAzZGM2MWNiZDJlMTEu
LjBmMTIyYTEyZDRhNSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9vYmplY3QuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX29iamVjdC5oDQo+ID4gPiBAQCAtODQzLDggKzg0Myw3IEBAIGludCBzaG1lbV9z
Z19hbGxvY190YWJsZShzdHJ1Y3QNCj4gZHJtX2k5MTVfcHJpdmF0ZQ0KPiA+ID4gKmk5MTUsIHN0
cnVjdCBzZ190YWJsZSAqc3QsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBz
aXplLCBzdHJ1Y3QgaW50ZWxfbWVtb3J5X3JlZ2lvbiAqbXIsDQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLA0KPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWF4X3NlZ21lbnQpOyAtdm9pZA0KPiA+ID4gc2ht
ZW1fc2dfZnJlZV90YWJsZShzdHJ1Y3Qgc2dfdGFibGUgKnN0LCBzdHJ1Y3QgYWRkcmVzc19zcGFj
ZQ0KPiA+ID4gKm1hcHBpbmcsDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZGly
dHksIGJvb2wgYmFja3VwKTsNCj4gPiA+ICt2b2lkIHNobWVtX3NnX2ZyZWVfdGFibGUoc3RydWN0
IHNnX3RhYmxlICpzdCwgYm9vbCBkaXJ0eSwgYm9vbA0KPiA+ID4gK2JhY2t1cCk7DQo+ID4gPiAg
dm9pZCBfX3NobWVtX3dyaXRlYmFjayhzaXplX3Qgc2l6ZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2Ug
Km1hcHBpbmcpOw0KPiA+ID4NCj4gPiA+ICAjaWZkZWYgQ09ORklHX01NVV9OT1RJRklFUg0KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5j
DQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jDQo+ID4g
PiBpbmRleCBmZTY5ZjJjODUyN2QuLmIzMjBkOWRmZDZkMyAxMDA2NDQNCj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYw0KPiA+ID4gQEAgLTI5LDE2ICsy
OSwxMyBAQCBzdGF0aWMgdm9pZCBjaGVja19yZWxlYXNlX2ZvbGlvX2JhdGNoKHN0cnVjdA0KPiA+
ID4gZm9saW9fYmF0Y2ggKmZiYXRjaCkNCj4gPiA+ICAgICAgIGNvbmRfcmVzY2hlZCgpOw0KPiA+
ID4gIH0NCj4gPiA+DQo+ID4gPiAtdm9pZCBzaG1lbV9zZ19mcmVlX3RhYmxlKHN0cnVjdCBzZ190
YWJsZSAqc3QsIHN0cnVjdCBhZGRyZXNzX3NwYWNlDQo+ID4gPiAqbWFwcGluZywNCj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBkaXJ0eSwgYm9vbCBiYWNrdXApDQo+ID4gPiArdm9p
ZCBzaG1lbV9zZ19mcmVlX3RhYmxlKHN0cnVjdCBzZ190YWJsZSAqc3QsIGJvb2wgZGlydHksIGJv
b2wNCj4gPiA+ICtiYWNrdXApDQo+ID4gPiAgew0KPiA+ID4gICAgICAgc3RydWN0IHNndF9pdGVy
IHNndF9pdGVyOw0KPiA+ID4gICAgICAgc3RydWN0IGZvbGlvX2JhdGNoIGZiYXRjaDsNCj4gPiA+
ICAgICAgIHN0cnVjdCBmb2xpbyAqbGFzdCA9IE5VTEw7DQo+ID4gPiAgICAgICBzdHJ1Y3QgcGFn
ZSAqcGFnZTsNCj4gPiA+DQo+ID4gPiAtICAgICBtYXBwaW5nX2NsZWFyX3VuZXZpY3RhYmxlKG1h
cHBpbmcpOw0KPiA+ID4gLQ0KPiA+ID4gICAgICAgZm9saW9fYmF0Y2hfaW5pdCgmZmJhdGNoKTsN
Cj4gPiA+ICAgICAgIGZvcl9lYWNoX3NndF9wYWdlKHBhZ2UsIHNndF9pdGVyLCBzdCkgew0KPiA+
ID4gICAgICAgICAgICAgICBzdHJ1Y3QgZm9saW8gKmZvbGlvID0gcGFnZV9mb2xpbyhwYWdlKTsg
QEAgLTE4MCwxMA0KPiA+ID4gKzE3NywxMCBAQCBpbnQgc2htZW1fc2dfYWxsb2NfdGFibGUoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsDQo+ID4gPiBzdHJ1Y3Qgc2dfdGFibGUgKnN0LA0K
PiA+ID4gICAgICAgcmV0dXJuIDA7DQo+ID4gPiAgZXJyX3NnOg0KPiA+ID4gICAgICAgc2dfbWFy
a19lbmQoc2cpOw0KPiA+ID4gKyAgICAgbWFwcGluZ19jbGVhcl91bmV2aWN0YWJsZShtYXBwaW5n
KTsNCj4gPiA+ICAgICAgIGlmIChzZyAhPSBzdC0+c2dsKSB7DQo+ID4gPiAtICAgICAgICAgICAg
IHNobWVtX3NnX2ZyZWVfdGFibGUoc3QsIG1hcHBpbmcsIGZhbHNlLCBmYWxzZSk7DQo+ID4gPiAr
ICAgICAgICAgICAgIHNobWVtX3NnX2ZyZWVfdGFibGUoc3QsIGZhbHNlLCBmYWxzZSk7DQo+ID4g
PiAgICAgICB9IGVsc2Ugew0KPiA+ID4gLSAgICAgICAgICAgICBtYXBwaW5nX2NsZWFyX3VuZXZp
Y3RhYmxlKG1hcHBpbmcpOw0KPiA+ID4gICAgICAgICAgICAgICBzZ19mcmVlX3RhYmxlKHN0KTsN
Cj4gPiA+ICAgICAgIH0NCj4gPiA+DQo+ID4gPiBAQCAtMjA5LDggKzIwNiw2IEBAIHN0YXRpYyBp
bnQgc2htZW1fZ2V0X3BhZ2VzKHN0cnVjdA0KPiA+ID4gZHJtX2k5MTVfZ2VtX29iamVjdCAqb2Jq
KQ0KPiA+ID4gICAgICAgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcgPSBvYmotPmJhc2Uu
ZmlscC0+Zl9tYXBwaW5nOw0KPiA+ID4gICAgICAgdW5zaWduZWQgaW50IG1heF9zZWdtZW50ID0g
aTkxNV9zZ19zZWdtZW50X3NpemUoaTkxNS0+ZHJtLmRldik7DQo+ID4gPiAgICAgICBzdHJ1Y3Qg
c2dfdGFibGUgKnN0Ow0KPiA+ID4gLSAgICAgc3RydWN0IHNndF9pdGVyIHNndF9pdGVyOw0KPiA+
ID4gLSAgICAgc3RydWN0IHBhZ2UgKnBhZ2U7DQo+ID4gPiAgICAgICBpbnQgcmV0Ow0KPiA+ID4N
Cj4gPiA+ICAgICAgIC8qDQo+ID4gPiBAQCAtMjM5LDkgKzIzNCw4IEBAIHN0YXRpYyBpbnQgc2ht
ZW1fZ2V0X3BhZ2VzKHN0cnVjdA0KPiA+ID4gZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQ0KPiA+
ID4gICAgICAgICAgICAgICAgKiBmb3IgUEFHRV9TSVpFIGNodW5rcyBpbnN0ZWFkIG1heSBiZSBo
ZWxwZnVsLg0KPiA+ID4gICAgICAgICAgICAgICAgKi8NCj4gPiA+ICAgICAgICAgICAgICAgaWYg
KG1heF9zZWdtZW50ID4gUEFHRV9TSVpFKSB7DQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
Zm9yX2VhY2hfc2d0X3BhZ2UocGFnZSwgc2d0X2l0ZXIsIHN0KQ0KPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7DQo+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgc2dfZnJlZV90YWJsZShzdCk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgLyog
TGVhdmUgdGhlIG1hcHBpbmcgdW5ldmljdGFibGUgd2hpbGUgd2UgcmV0cnkgKi8NCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBzaG1lbV9zZ19mcmVlX3RhYmxlKHN0LCBmYWxzZSwgZmFsc2Up
Ow0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKHN0KTsNCj4gPiA+DQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgbWF4X3NlZ21lbnQgPSBQQUdFX1NJWkU7IEBAIC0yNjUsNyAr
MjU5LDggQEANCj4gPiA+IHN0YXRpYyBpbnQgc2htZW1fZ2V0X3BhZ2VzKHN0cnVjdCBkcm1faTkx
NV9nZW1fb2JqZWN0ICpvYmopDQo+ID4gPiAgICAgICByZXR1cm4gMDsNCj4gPiA+DQo+ID4gPiAg
ZXJyX3BhZ2VzOg0KPiA+ID4gLSAgICAgc2htZW1fc2dfZnJlZV90YWJsZShzdCwgbWFwcGluZywg
ZmFsc2UsIGZhbHNlKTsNCj4gPiA+ICsgICAgIG1hcHBpbmdfY2xlYXJfdW5ldmljdGFibGUobWFw
cGluZyk7DQo+ID4gPiArICAgICBzaG1lbV9zZ19mcmVlX3RhYmxlKHN0LCBmYWxzZSwgZmFsc2Up
Ow0KPiA+ID4gICAgICAgLyoNCj4gPiA+ICAgICAgICAqIHNobWVtZnMgZmlyc3QgY2hlY2tzIGlm
IHRoZXJlIGlzIGVub3VnaCBtZW1vcnkgdG8gYWxsb2NhdGUNCj4gPiA+IHRoZSBwYWdlDQo+ID4g
PiAgICAgICAgKiBhbmQgcmVwb3J0cyBFTk9TUEMgc2hvdWxkIHRoZXJlIGJlIGluc3VmZmljaWVu
dCwgYWxvbmcgd2l0aA0KPiA+ID4gdGhlIHVzdWFsIEBAIC00MDIsOCArMzk3LDggQEAgdm9pZA0K
PiA+ID4gaTkxNV9nZW1fb2JqZWN0X3B1dF9wYWdlc19zaG1lbShzdHJ1Y3QgZHJtX2k5MTVfZ2Vt
X29iamVjdCAqb2JqLA0KPiA+ID4gc3RydWN0IHNnXw0KPiA+ID4gICAgICAgaWYgKGk5MTVfZ2Vt
X29iamVjdF9uZWVkc19iaXQxN19zd2l6emxlKG9iaikpDQo+ID4gPiAgICAgICAgICAgICAgIGk5
MTVfZ2VtX29iamVjdF9zYXZlX2JpdF8xN19zd2l6emxlKG9iaiwgcGFnZXMpOw0KPiA+ID4NCj4g
PiA+IC0gICAgIHNobWVtX3NnX2ZyZWVfdGFibGUocGFnZXMsIGZpbGVfaW5vZGUob2JqLT5iYXNl
LmZpbHApLT5pX21hcHBpbmcsDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgIG9iai0+
bW0uZGlydHksIG9iai0+bW0ubWFkdiA9PQ0KPiA+ID4gSTkxNV9NQURWX1dJTExORUVEKTsNCj4g
PiA+ICsgICAgIG1hcHBpbmdfY2xlYXJfdW5ldmljdGFibGUoZmlsZV9pbm9kZShvYmotPmJhc2Uu
ZmlscCktPmlfbWFwcGluZyk7DQo+ID4gPiArICAgICBzaG1lbV9zZ19mcmVlX3RhYmxlKHBhZ2Vz
LCBvYmotPm1tLmRpcnR5LCBvYmotPm1tLm1hZHYgPT0NCj4gPiA+ICtJOTE1X01BRFZfV0lMTE5F
RUQpOw0KPiA+ID4gICAgICAga2ZyZWUocGFnZXMpOw0KPiA+ID4gICAgICAgb2JqLT5tbS5kaXJ0
eSA9IGZhbHNlOw0KPiA+ID4gIH0NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fdHRtLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3R0bS5jDQo+ID4gPiBpbmRleCAxMGQ4NjczNjQxZjcuLjM3ZjUxYTA0YjgzOCAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0u
Yw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bS5jDQo+
ID4gPiBAQCAtMjMyLDcgKzIzMiw4IEBAIHN0YXRpYyBpbnQgaTkxNV90dG1fdHRfc2htZW1fcG9w
dWxhdGUoc3RydWN0DQo+ID4gPiB0dG1fZGV2aWNlICpiZGV2LA0KPiA+ID4gICAgICAgcmV0dXJu
IDA7DQo+ID4gPg0KPiA+ID4gIGVycl9mcmVlX3N0Og0KPiA+ID4gLSAgICAgc2htZW1fc2dfZnJl
ZV90YWJsZShzdCwgZmlscC0+Zl9tYXBwaW5nLCBmYWxzZSwgZmFsc2UpOw0KPiA+ID4gKyAgICAg
bWFwcGluZ19jbGVhcl91bmV2aWN0YWJsZShmaWxwLT5mX21hcHBpbmcpOw0KPiA+ID4gKyAgICAg
c2htZW1fc2dfZnJlZV90YWJsZShzdCwgZmFsc2UsIGZhbHNlKTsNCj4gPiA+DQo+ID4gPiAgICAg
ICByZXR1cm4gZXJyOw0KPiA+ID4gIH0NCj4gPiA+IEBAIC0yNDMsOCArMjQ0LDggQEAgc3RhdGlj
IHZvaWQgaTkxNV90dG1fdHRfc2htZW1fdW5wb3B1bGF0ZShzdHJ1Y3QNCj4gPiA+IHR0bV90dCAq
dHRtKQ0KPiA+ID4gICAgICAgYm9vbCBiYWNrdXAgPSB0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fVFRf
RkxBR19TV0FQUEVEOw0KPiA+ID4gICAgICAgc3RydWN0IHNnX3RhYmxlICpzdCA9ICZpOTE1X3R0
LT5jYWNoZWRfcnNndC50YWJsZTsNCj4gPiA+DQo+ID4gPiAtICAgICBzaG1lbV9zZ19mcmVlX3Rh
YmxlKHN0LCBmaWxlX2lub2RlKGk5MTVfdHQtPmZpbHApLT5pX21hcHBpbmcsDQo+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgIGJhY2t1cCwgYmFja3VwKTsNCj4gPiA+ICsgICAgIG1hcHBp
bmdfY2xlYXJfdW5ldmljdGFibGUoZmlsZV9pbm9kZShpOTE1X3R0LT5maWxwKS0+aV9tYXBwaW5n
KTsNCj4gPiA+ICsgICAgIHNobWVtX3NnX2ZyZWVfdGFibGUoc3QsIGJhY2t1cCwgYmFja3VwKTsN
Cj4gPiA+ICB9DQo+ID4gPg0KPiA+ID4gIHN0YXRpYyB2b2lkIGk5MTVfdHRtX3R0X3JlbGVhc2Uo
c3RydWN0IGtyZWYgKnJlZikNCj4gPiA+IC0tDQo+ID4gPiAyLjQ4LjAucmMyLjI3OS5nMWRlNDBl
ZGFkZS1nb29nDQo+ID4NCj4gDQo+IFRoYW5rcw0KPiBCcmlhbg0K
