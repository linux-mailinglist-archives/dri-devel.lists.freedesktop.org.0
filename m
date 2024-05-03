Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC38BA8C6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 10:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB0B10FA1A;
	Fri,  3 May 2024 08:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kU65fG7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC0710FA06;
 Fri,  3 May 2024 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714725010; x=1746261010;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jOSigenHfdXFlnLQgoH1/uNALL04XBrd59Qz3nMe74g=;
 b=kU65fG7DntXo/kzg9/IBZnMJN8RMIWOkZfP7MCCjM9VoCML1jC7rXcZk
 ehMSVLGoOawkQOuyAMkz0USnqd1CYl7zlKO8zXKYWag4OMmcykSrNuCfp
 Vd0RZeSJUZs4PM4pRyci1GzKoPnRdkcTmZzbEvhRZyFShraajjNIPLHdm
 CYB2qG+PEHtQKwgpSN4sFnqmYv1zco3TsVzh/tZslCqeoHjWhKYnb6Yab
 sgLIEt0yRDU74sFTLQAwLwtdwXTzGdKDZ6FO3FoS1qFNNGr7II4aEom1m
 lcELm+KmZiqkt5OzYPpmneWJwy+l7aclxXUrlqMXhcGBcuaqOFKSHVvXR w==;
X-CSE-ConnectionGUID: +c9htRiVT9KSDrd0L6ZGPA==
X-CSE-MsgGUID: yVF+eh+jSg2cgKj5UN/92Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21678110"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21678110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 01:30:10 -0700
X-CSE-ConnectionGUID: /ZU9eyclQsuL0WVR9c7U0A==
X-CSE-MsgGUID: RjjlJgE4TCmt1WMl1fIQPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31894784"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 01:30:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 01:30:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 01:30:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 01:30:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUvAiGvmtPmV58X0us2JdG82whU37TDyp/TYpivM4Q4s/MvtsqwWh3Xyxy3QD5sof8XTB9aBX0F9ddd6kk3qtE0j7syAg9/nEtF+JQMYEsXL4NgF9Q4LuphBN9lCOW1x3EAFhrJCT4P2gnTqPOI91PJ7t/E1RLhuO4ZUN0OspRKAphuycCk2ng46SVtL0ZDaxBY4w6jxExwL0Jv3BGA8b1Pb7n8G0o2SAqwiZpsExYDeluj1UQKY8/3/PxVYN0lKcxYPpQ3ztygAwqp/mPeGMzxfexrrJGcFNVakzJbPz1FWAg53TRIpNKQFGq/wXD+1lOFU3Usc6h8GlT8KivaOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOSigenHfdXFlnLQgoH1/uNALL04XBrd59Qz3nMe74g=;
 b=ev/+H4+qMKt73VugDkYtqCbKfk9wAqR/xG1vq9cUvukbxwrVbqvuJmw8t1b+QAGZfaCussx1D2sJC0kPrpD/nj0CLTvvSXwC355sMX0hrI6mvFOJpWPi13Irmoq6w6B4lx1y+LfdjNudmCuh1mWwJUdaufjSFezSqATbOMlxjkrw8+Y/yXCHmYWXMw+5hy5PfQ8Re5RPRyINyPtgg9ne3c0JjZyWWYU+PCBKhOtYkNfwLf3E5KgIZGnnrVPSxzctRFxtCAWZnKZO4aelgnwF1eKD7/ZZdi2upzyN/qXwtpbIBDwgjJQOwKTaX/wluZrwSbwXGYeuh9z0W6Tr99OJkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25; Fri, 3 May
 2024 08:30:06 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0%5]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 08:30:06 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v3 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Topic: [PATCH v3 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Index: AQHalnjX9QQ6cJjAREqmaLzJihfqerGFKuSAgAAN0GA=
Date: Fri, 3 May 2024 08:30:06 +0000
Message-ID: <PH7PR11MB59813E1EC23A0C1487B7C47CF91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-7-animesh.manna@intel.com>
 <b669fd758ce9087949d877505307dc0a8a0b8c9e.camel@intel.com>
In-Reply-To: <b669fd758ce9087949d877505307dc0a8a0b8c9e.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|PH0PR11MB7710:EE_
x-ms-office365-filtering-correlation-id: 772f34b6-155f-4c8c-23a4-08dc6b4b3c82
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?OHJ1QTk1cXhMZCsyc2ZBaHlPYkI3Sm80alpBNmN5N0grUjFsUVNGQzBldFZK?=
 =?utf-8?B?ditDbVQxQXZkRXFQQzBPOE9sUzVPdHhBV3RmTTF1ZjlDdElVYTNmYkQvVExG?=
 =?utf-8?B?a0VILzFDMWxqb0pQclUvTlQ4K09GazZjemJrUDhNYk10V0ZsWmxrSVFMTi9M?=
 =?utf-8?B?WHJMczVaakFrcHhsM2hDUWZlWEl1L1grVGVpeGtqMmxnVHhBMzVwZFM4N3Zl?=
 =?utf-8?B?ejZkS1IzSUx2dGg5VUM0S0hRZjdoWTNjOFdEV1lrZnJrYSs1RGZvWlJMTTB2?=
 =?utf-8?B?RUhJYko3ajJ0ZDRsL2pabWNKVmx4UkZHc2ZRUkZFN1BrMVRXd1p1RmQyL0VS?=
 =?utf-8?B?bmQxMEE3VHdJd0xZanZjc1QwT2xoelltQnZNYTlDVVlwK2ZHbkpFTVY1K3J4?=
 =?utf-8?B?WThWT1VaYTZWcjFPcVA5MVFPZ1g3QVJ1RUhGc2YrV29BdnV3bEpSNnljbGZE?=
 =?utf-8?B?T3k1NVlJQS9lSUZlcmxlWVVkSklqWU03VEJxMEdtdHQ3SzNoZlF0V3NFOEk1?=
 =?utf-8?B?V0ZXcUx6L09PYmNUbURBM0ZOdkhuQXJiVW9PalE2eURnQUQ4d25RZTg1emJP?=
 =?utf-8?B?QlJwUmFoMTFTVFNaOWxDZFlUcWdQWEdOemJyYStSNWx3bjVkeDVHaC80WUlN?=
 =?utf-8?B?VWRvTll5QlRxSzB2Q25oTE1KZTJxbVZuY21BN291OTZ3ZDBHZ0VDVWhPSTQ1?=
 =?utf-8?B?aGVJeHNsMjR2dVlnWVlKZk8yNFBROHB3dUkwT3NrQWdDUTFyRjdZRTlYYmhj?=
 =?utf-8?B?Tis3SkkzNmp0YXRtanZzYUlIU2N5UGphUnpWeDZYLzlDQ2x4NGxKbXoyekh3?=
 =?utf-8?B?SVdIS253SmVmenppWUMwRVN0cTJWWWJBdWpUU0xTdVhvWXB3NitGV2R4aE1x?=
 =?utf-8?B?bGVsWGZRMDhEaXAzSkV5YjB6NlIrTnpDOTlsTlhHNDJGRU54UmZpQzllSnJR?=
 =?utf-8?B?UXhnQWJzMmQ2b3JGN2lrdEZtdzIrRVVvNTJ6SjM3ZE9VOVFmam9tcUE0ZWd3?=
 =?utf-8?B?aDFBSXE3cHJOdXdsV1BxRGFKcnRwY1BWUGxVWFJYcVBjMHI4K0N6Rk1jVytB?=
 =?utf-8?B?ak1xakd1UWx6QXNDd0lSczRXemZYaHdDVE1FclV1bWtZYVROeHYvYTBMT0dZ?=
 =?utf-8?B?M1ZkdHBENlBEaElCSjFVZGxuTjJmUzZCTitsTGlZYVNlYXllNUNCVmpmeVJH?=
 =?utf-8?B?bkliTHhWV0NmUlEvcG5haGtRUi95VFhpajdZeVdld2p3SEkzNzFTUGNJMis4?=
 =?utf-8?B?WGVRcFFsMVRZb1c2RVRGc1QvbnBkdVhJbkV0YzJhTk03UkQ4c00wM01xZGFI?=
 =?utf-8?B?LzFPUmtOZjFPaHlvSEU0Z2JFL0ozNURDaTRBdlhxTlJTSXZRU29NOHRjWWc0?=
 =?utf-8?B?YlZRMDBWbFJPR0VCMm9pK0IzU0U2dXVpSXl6K1JkZ0VGQTlpU0tSWjJIcERY?=
 =?utf-8?B?NU1LaXFYK0pVYjAydlhnMy81RWNsUWRhSmh2UTJMWmlkMHVLSW5Qa3pXWE55?=
 =?utf-8?B?VW5vSHVCa2JiellIb0Y1L0MydmlrbVlWVUNTM1EyYnFJSTd2NW1rSWljaWND?=
 =?utf-8?B?VDd1MzNQeDl0WFI1a0VCNE0zbmIySHVlZlUycURxd0k0M3I0TFQwa3FqUlIy?=
 =?utf-8?B?ZzNMbC85dm4wMTJvMnU4aEVITGZoK1lieHBvcldnVGJaMmsyMVFNcVZSTWlT?=
 =?utf-8?B?ZjZPNjBmN2ZEQlJBNGFPVXNQZmY1WXg5VXNBdXMvaUZYdHJRZXBiSmU5K1Vl?=
 =?utf-8?B?c3RoMVplQ3lJUWdGR0k4b0tqZzVFTlVVVXhjU1hoNnNqMHFZMXVyQkZHTnU1?=
 =?utf-8?B?RzJpTWxyS005Ri82Uy9vQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1JZWjhQMCttWU1OTm1KcHVVUmk0UWIvZE9nVVlmeEZXTEJzR0RVc095ZGpC?=
 =?utf-8?B?YmxOUTJqS1BQcDdWOE1Bd0phM3BqeFlRbjdMV2xkZmFsTjVBa2U3d2U1dVlz?=
 =?utf-8?B?K1pxYkU5RnFFYXhtQVkweG9hNEpjMk1rcmpYNVlMVUJKTU5sYThBYW9oMzRh?=
 =?utf-8?B?Si9BZTdTYWdZVjE2ZXcyVmNIZ2NzN2lMTGlFTlkrcHcra3N5b3NNanF3bDk2?=
 =?utf-8?B?QkRqV0JMSUVkclV0TTVEOU41Rnk3V2JQbVhaaUtLRC9RVzYxbzczdTNsQkRi?=
 =?utf-8?B?VTAySURYdXJrUHBoUXExZmd3ZjJZNlU2akgzTGplT3I3dXMxSUlVcmtWdm80?=
 =?utf-8?B?NCt1UHlQUkJkbmhZbVBVMHBhQStaQ09KSU80bFVmTStBd05LYlpZdUpkZGNt?=
 =?utf-8?B?WVBNQlFMd25oelFLNFY5ZVZHaE9ieDJIUmxneWErZGRzTUlyaDQ4a3BoTWJz?=
 =?utf-8?B?M3IwNEV4TXlMRy9lTW14UHdsQ2dNMzhWeUxVdDF1ZUh6cjVrTzRRNU40bHFP?=
 =?utf-8?B?VGxCMDBkSEZoR2lXQnlINGFKNzZDU3BGWjE0VGVKZ1h3UXkxTFhiVUErbDNz?=
 =?utf-8?B?UUxQb2U1TXNGM0hGTncwM1krSGU4aTR5WW1YMWdGVHJoaXJtelJ5OVdBV2l5?=
 =?utf-8?B?ZlMxN253QytEWUtocGw1WWprN3lJYzNHS2MycTVVakttSXU5aHlybGkzUnFx?=
 =?utf-8?B?MzhYLzdXR1I5VjhrOE9wMXRtOXE2OWpHdlFkVExjM3M3SGdPelgwT2hWZ0VB?=
 =?utf-8?B?VjhBdGxXNDk2S3VCek40TDliaTRlY1FVNlpBeVI0U2R6VzlaRS9VeVhwRnk2?=
 =?utf-8?B?SGpWV0hwSTh0Qkx4dHFiaXoxeHJldmhacnNZMEZoa2g4RFpOVllUUytHa05a?=
 =?utf-8?B?Z0JIQ21qR3RHYXJHcUpwNjc3bW9qclgzWEJNQnErajRLN1Z2Y1Rqd0doalZs?=
 =?utf-8?B?RmZFdXZKZEYwb0QvSnFFMFc4ZDRmMHVBTk9CLzhSMGwxUXQ0WC9PVk9GZ1BE?=
 =?utf-8?B?VWlaTU5FYkZ0eGZ1Szlhd0xwMHlZRlJNbXdGTXZGZk5kWnhJZ0cwVGhxMGJh?=
 =?utf-8?B?YVZWVVV4aEkxZXNXRmJLZ3pzZXVpWUtoMkozUDBFcmorOW1XeG95Z0tncUhs?=
 =?utf-8?B?YlRiYXBoQldWZTlyaFpWdlpPMGcyRGxuNHEvUWhsNm04bXJ3NGZhOVlTcVM5?=
 =?utf-8?B?UUFibXo0UjJmaE1ZUUR0MEU4K2J2RmgwR3JuelRRZ0lJc05XVWZiamdlbGxr?=
 =?utf-8?B?OE1yTFVXYWl4ZGJYa3l1ekt3bktVYVdxeHJKYkpMQ2JHMVJaREVvRy84aFNs?=
 =?utf-8?B?NC95dlk0NC9nKy9PZzhUZFUyMFhMYzV2YXhLRjAzSWl5dG1GRkF3dEZJY0Yr?=
 =?utf-8?B?eXBKNkcyQ2htWFAzbVBSWjRhYXVHQXRSK2FlblplWGZSR0cvaWhiOU82emNs?=
 =?utf-8?B?UkdLUkU4VHQrbXZwTUM1WFRzU2ZOVTErRThKSjUwclY2VXBVMWRVME9lQ1Jj?=
 =?utf-8?B?TWNKTjdpcjVwWmdmbVJRRHU1Wit4Z1pDek9zaFF4YlY5SlpvWUpvR0RrVWU5?=
 =?utf-8?B?OEoyTVp4eFpIWWFUL1FMWjk3cWNqajh4TVJxWG5tNVNCR2wrRVdzVXgvSmJ4?=
 =?utf-8?B?YTlMRFE0cHFqdnY4SldNVmx2V2lpM2N6MFBmL0VFdEVOREdkdTA4bVQwMVhO?=
 =?utf-8?B?K0VnWFE2dllxeDdsYkxFdFJxYnJLT0xRc3ljSkpNWXJLVXhxYTBBREU5WjVN?=
 =?utf-8?B?Um5HdElPZzl1Vm5ibHdVL29pTkswQWJaN2ZvQ0lmQUZyMDRIQmprQi9PTHl3?=
 =?utf-8?B?N3p1RHlqRURDS1hPQmQ3dHNWbE9XWlhEMTVvKzllbVI4bE1DRFBpc1M1bXFr?=
 =?utf-8?B?TlVtSFZRN003T0hMNWhUaW9JenROWjExdWZuTU16eFVTRlRmNG1NRy9BZVhW?=
 =?utf-8?B?RkU0K0lFa2ZoSG5oNE5nMmkvd0gzWEhwZmliRHg1WTI1M2lkaFZ5SXdJWmR4?=
 =?utf-8?B?enNiUXdEMmtTNDE2ZVdmY2VycFlKQzhNRlpsU0F2VCtscmhSNjNFd3l3ZGgw?=
 =?utf-8?B?WDJLam11QTBQMHFvWjZzdmxGckU4YlEwaGNWWDZ2NEdoYnZudCttaXVVQldW?=
 =?utf-8?Q?J4MQpnuR/YhcnQlgG3hHmYdEx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772f34b6-155f-4c8c-23a4-08dc6b4b3c82
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 08:30:06.1296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +pRDLjAP300BvNZEMQYm1fQy7upCoQkn2cNDfWqMak44cEnxl2iYyy4uVslM2SGe7AxlID3Hpp3lL0PclcsDAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7710
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDMsIDIwMjQg
MTowMiBQTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPjsg
aW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IE11cnRoeSwgQXJ1biBSDQo+IDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzIDYvNl0gZHJtL2k5MTUvYWxwbTogQWRkIGRlYnVnZnMgZm9yIExPQkYNCj4g
DQo+IE9uIFRodSwgMjAyNC0wNC0yNSBhdCAwMDowOCArMDUzMCwgQW5pbWVzaCBNYW5uYSB3cm90
ZToNCj4gPiBGb3IgdmFsaWRhdGlvbiBwdXJwb3NlIGFkZCBkZWJ1Z2ZzIGZvciBMT0JGLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Fs
cG0uY8KgwqDCoMKgIHwgNDgNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaMKgwqDCoMKgIHzCoCAyICsNCj4gPiDC
oC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jwqAgfMKgIDIgKw0K
PiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gaW5kZXggYjA4Nzk5
NTg2YjU4Li4yZDMwMjdjMmZiMGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IEBAIC0zNDMsMyArMzQzLDUxIEBAIHZvaWQgaW50ZWxf
YWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwDQo+ID4gKmludGVsX2RwLA0KPiA+IMKgew0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBsbmxfYWxwbV9jb25maWd1cmUoaW50ZWxfZHAsIGNydGNfc3Rh
dGUpOw0KPiA+IMKgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBpOTE1X2VkcF9sb2JmX2luZm9f
c2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpDQo+ID4gK3sNCj4gPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IgPSBtLT5wcml2YXRlOw0K
PiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRv
X2k5MTUoY29ubmVjdG9yLQ0KPiA+ID5iYXNlLmRldik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGRybV9jcnRjICpjcnRjOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGVudW0gdHJhbnNjb2RlciBj
cHVfdHJhbnNjb2RlcjsNCj4gPiArwqDCoMKgwqDCoMKgwqBib29sIGxvYmZfZW5hYmxlZDsNCj4g
PiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqByZXQg
PSBkcm1fbW9kZXNldF9sb2NrX3NpbmdsZV9pbnRlcnJ1cHRpYmxlKCZkZXZfcHJpdi0NCj4gPiA+
ZHJtLm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlm
IChyZXQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+
ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGNydGMgPSBjb25uZWN0b3ItPmJhc2Uuc3RhdGUtPmNy
dGM7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGNvbm5lY3Rvci0+YmFzZS5zdGF0dXMgIT0gY29u
bmVjdG9yX3N0YXR1c19jb25uZWN0ZWQgfHwNCj4gPiAhY3J0Yykgew0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRU5PREVWOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBnb3RvIG91dDsNCj4gPiArwqDCoMKgwqDCoMKgwqB9DQo+ID4gKw0KPiA+
ICvCoMKgwqDCoMKgwqDCoGNydGNfc3RhdGUgPSB0b19pbnRlbF9jcnRjX3N0YXRlKGNydGMtPnN0
YXRlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRmKG0sICJMT0JGIENyaXRlcmlhIG1l
dDogJXNcbiIsDQo+ID4gc3RyX3llc19ubyhjcnRjX3N0YXRlLT5oYXNfbG9iZikpOw0KPiANCj4g
SSdtIHN0aWxsIG5vdCBjb252aW5jZWQgb24gdGhpcy4gaGFzX2xvYmYgfj0gQUxQTV9DVExfTE9C
Rl9FTkFCTEUgaW4NCj4gQUxQTV9DVEwuIFRvIG15IG9waW5pb24gaXQgaXMgZW5vdWdoIHRvIGR1
bXAgc2VxX3ByaW50ZihtLCAiTE9CRg0KPiBzdGF0dXM6ICVzXG4iLCBzdHJfZW5hYmxlZF9kaXNh
YmxlZChsb2JmX2VuYWJsZWQpKSBiZWxvdy4gTWF5YmUNCj4gQVVYX1dBS0UgYW5kIEFVWF9MRVNT
X1dBS0UgY291bGQgYmUgZHVtcGVkIGluc3RlYWQ/DQoNCkNhbiBhZGQgYXV4LXdha2Ugb3IgYXV4
LWxlc3MgaW5mbyBhcyB3ZWxsLg0KQnV0IGFzIExPQkYgZmVhdHVyZSBpcyBkZXBlbmRlbnQgb24g
YWRhcHRpdmUgc3luYyBmaXhlZCByZWZyZXNoIHJhdGUgbW9kZSAod2hpY2ggY2FuIGJlIGR5bmFt
aWMgYXMgcGVyIHVzZXIgaW5wdXQpIGFuZCBBTFBNLiBJIHdhbnQgdG8gZXhwb3NlIGJvdGggdGhl
IGNvbmRpdGlvbnMgYXJlIHNhdGlzZnlpbmcgb3Igbm90IGFsb25nIHdpdGggc3RhdHVzLg0KDQpS
ZWdhcmRzLA0KQW5pbWVzaA0KIA0KPiANCj4gQlIsDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXINCj4g
DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGNwdV90cmFuc2NvZGVyID0gY3J0Y19zdGF0ZS0+
Y3B1X3RyYW5zY29kZXI7DQo+ID4gK8KgwqDCoMKgwqDCoMKgbG9iZl9lbmFibGVkID0gaW50ZWxf
ZGVfcmVhZChkZXZfcHJpdiwNCj4gPiBBTFBNX0NUTChjcHVfdHJhbnNjb2RlcikpICYgQUxQTV9D
VExfTE9CRl9FTkFCTEU7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc2VxX3ByaW50ZihtLCAiTE9CRiBz
dGF0dXM6ICVzXG4iLA0KPiA+IHN0cl9lbmFibGVkX2Rpc2FibGVkKGxvYmZfZW5hYmxlZCkpOw0K
PiA+ICsNCj4gPiArb3V0Og0KPiA+ICvCoMKgwqDCoMKgwqDCoGRybV9tb2Rlc2V0X3VubG9jaygm
ZGV2X3ByaXYtDQo+ID4gPmRybS5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KTsNCj4gPiAr
DQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArREVG
SU5FX1NIT1dfQVRUUklCVVRFKGk5MTVfZWRwX2xvYmZfaW5mbyk7DQo+ID4gKw0KPiA+ICt2b2lk
IGludGVsX2FscG1fbG9iZl9kZWJ1Z2ZzX2FkZChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25u
ZWN0b3IpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqaTkxNSA9IHRvX2k5MTUoY29ubmVjdG9yLT5iYXNlLmRldik7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgc3RydWN0IGRlbnRyeSAqcm9vdCA9IGNvbm5lY3Rvci0+YmFzZS5kZWJ1Z2ZzX2VudHJ5Ow0K
PiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoRElTUExBWV9WRVIoaTkxNSkgPCAyMCB8fA0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25uZWN0b3ItPmJhc2UuY29ubmVjdG9yX3R5cGUg
IT0NCj4gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBkZWJ1Z2ZzX2NyZWF0
ZV9maWxlKCJpOTE1X2VkcF9sb2JmX2luZm8iLCAwNDQ0LCByb290LA0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5lY3RvciwgJmk5
MTVfZWRwX2xvYmZfaW5mb19mb3BzKTsNCj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gPiBpbmRleCBhOWNhMTkwZGEzZTQuLjAxZmQw
OGViOTZmNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2FscG0uaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YWxwbS5oDQo+ID4gQEAgLTExLDYgKzExLDcgQEANCj4gPiDCoHN0cnVjdCBpbnRlbF9kcDsNCj4g
PiDCoHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlOw0KPiA+IMKgc3RydWN0IGRybV9jb25uZWN0b3Jf
c3RhdGU7DQo+ID4gK3N0cnVjdCBpbnRlbF9jb25uZWN0b3I7DQo+ID4NCj4gPiDCoGJvb2wgaW50
ZWxfYWxwbV9nZXRfYXV4X2xlc3Nfc3RhdHVzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0K
PiA+IMKgYm9vbCBpbnRlbF9hbHBtX2NvbXB1dGVfcGFyYW1zKHN0cnVjdCBpbnRlbF9kcCAqaW50
ZWxfZHAsDQo+ID4gQEAgLTIwLDQgKzIxLDUgQEAgdm9pZCBpbnRlbF9hbHBtX2NvbXB1dGVfbG9i
Zl9jb25maWcoc3RydWN0IGludGVsX2RwDQo+ID4gKmludGVsX2RwLA0KPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUNCj4gPiAqY29ubl9zdGF0ZSk7DQo+ID4gwqB2
b2lkIGludGVsX2FscG1fY29uZmlndXJlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qg
c3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpOw0KPiA+ICt2b2lkIGludGVsX2Fs
cG1fbG9iZl9kZWJ1Z2ZzX2FkZChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpOw0K
PiA+IMKgI2VuZGlmDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gPiBpbmRleCAzNWY5Zjg2ZWY3MGYuLjg2
ZDk5MDBjNDBhZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KPiA+IEBAIC0xMyw2ICsxMyw3IEBADQo+
ID4gwqAjaW5jbHVkZSAiaTkxNV9kZWJ1Z2ZzLmgiDQo+ID4gwqAjaW5jbHVkZSAiaTkxNV9pcnEu
aCINCj4gPiDCoCNpbmNsdWRlICJpOTE1X3JlZy5oIg0KPiA+ICsjaW5jbHVkZSAiaW50ZWxfYWxw
bS5oIg0KPiA+IMKgI2luY2x1ZGUgImludGVsX2NydGMuaCINCj4gPiDCoCNpbmNsdWRlICJpbnRl
bF9kZS5oIg0KPiA+IMKgI2luY2x1ZGUgImludGVsX2NydGNfc3RhdGVfZHVtcC5oIg0KPiA+IEBA
IC0xNTE1LDYgKzE1MTYsNyBAQCB2b2lkIGludGVsX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChzdHJ1
Y3QNCj4gPiBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
aW50ZWxfZHJyc19jb25uZWN0b3JfZGVidWdmc19hZGQoY29ubmVjdG9yKTsNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgaW50ZWxfcHBzX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiA+
IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9wc3JfY29ubmVjdG9yX2RlYnVnZnNfYWRkKGNvbm5lY3Rv
cik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfYWxwbV9sb2JmX2RlYnVnZnNfYWRkKGNvbm5l
Y3Rvcik7DQo+ID4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGNvbm5lY3Rvcl90eXBlID09IERS
TV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCB8fA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlBIHx8DQoNCg==
