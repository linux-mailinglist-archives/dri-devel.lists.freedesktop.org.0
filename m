Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE8A0A781
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 09:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25A410E2FD;
	Sun, 12 Jan 2025 08:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYVbK6rS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEF310E2F4;
 Sun, 12 Jan 2025 08:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736668869; x=1768204869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sdiRkwdiTZjVYWXJtHuA7swAGk94WmmgOAbImXw19ag=;
 b=YYVbK6rS+ngbEUgyv93WtePY/FJxi0sy0tDJESGDGmr13ByKGvygUKMq
 mTyOUdlvtEkx7c26kblbSZ/FYRJI+4Mykv4w9X81g9KaTsLa2PX1yK5NR
 bmeyL/gg1HlNuDfBtn9FWN/XSTfQnMsIV/JNRDP64HEbuJ7z+2/mSmB0W
 wkOF2w/pT01/y1Z5LZqLg+r9Dq3Tc5sYyKIQZ3tU6h8631/bDvoxQUjsD
 t5qoVoOvXNgBZK8+Vn908g96TW1jLV4XKfbfZxmuTEfqh5sOi5H+rMAGA
 Gp8/qLTDFjaca99bg+I0ybajpCxhxfASTyBqF1T+ThMD2N1QXll7X3xhZ g==;
X-CSE-ConnectionGUID: lw4qzlfmTZqRd/nkvmgy0A==
X-CSE-MsgGUID: Gca2V2MqT0aEB4YfXRZ2Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36814790"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="36814790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 00:01:09 -0800
X-CSE-ConnectionGUID: 64P/Z6DaQ4u7TD1OoLo+dg==
X-CSE-MsgGUID: /b4H25HzQQeB/yNgPA8bug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; d="scan'208";a="104701132"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2025 00:01:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 00:01:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 00:01:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 00:01:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBLROV45wA+sEiyhG+3Ad8P3fuQvnAYh8ful7yHM/S6B5J0SfvGmJQL2Ot9j+KjvXuD2EzBowsCb/9pmk2ppRItyN+3jR6yl6igc/YotUTzmQesrna21eMmAJbye9NEkvrIa2KC0LipF76/txn3eZjb/F6O5nQXJdMHv6s4FDIvhnd4tULIQwASDmD1s5EEX5UB0UUKaMwSVgWJoex/VepNd65Sdh0mOIvtOf6HA33VfMboirJHt03zHYtlp2z5JI0Dz/THRRKWsHQPyzQheQ0m4o3GyytTYOhpEcIGhO97tovYjnHEd7Mn4jyzGtp4JB/9bL8uZS3wGf+xrZ9g6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdiRkwdiTZjVYWXJtHuA7swAGk94WmmgOAbImXw19ag=;
 b=JM2+V3K///Qyiam2X2KsrG9V617QAqceP/NkCE6Hkn+l/iHIVHN41BejREDWS1oolZle/6gE/93wKngkDer5bW6K51/6nbh+/GOgJLlAQueUQfJoOckGWqyKe/ZhtnYDgk2RLkpCfM0yAVx4Ln9gtT9OiqsVc0piWKfPepYNeHW9R//6sFD0RR/DrFFUgFUMw4B/MONFy5HiCvdQ7tbLiuJb2YDtmRCxsvByHS/p7NEgtRYSQLzhDepP1/5t9AT3TrFhfcaMhka/vC9W2eRUU4csn+qlfRJiXSyYIGOppPgau9WKLfIvMe9/r6bnNpIE80YjRNwpS+PkaZxtFLS/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sun, 12 Jan
 2025 08:01:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 08:01:06 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v3 3/5] drm/plane: Function to check async supported
 modifier/format
Thread-Topic: [PATCH v3 3/5] drm/plane: Function to check async supported
 modifier/format
Thread-Index: AQHbYZG7mbEhEq8/40+DDdlE6O14+LMSu0Aw
Date: Sun, 12 Jan 2025 08:01:06 +0000
Message-ID: <SJ1PR11MB61296942F28B6B57121107FAB91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-3-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-3-f4399635eec9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7521:EE_
x-ms-office365-filtering-correlation-id: 3a1a2eb7-e977-4ede-2dab-08dd32df4472
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N2pmMGRJcWVFUFlBUFNWa2FpZEM4dkUxelgvSVBlR3QxYWgwR2dXTnFvVFFC?=
 =?utf-8?B?SnhGN3lDSHE1OTlNRWVYWThVZHkyNlV3RUZZN29IUlpndkNBRzVHcElINlNi?=
 =?utf-8?B?QTN3dUxCNVBTdk94WDVOYndySUFXcUQ1WEFrc0RUZkVWc2VnejdLTlF6L1M1?=
 =?utf-8?B?TngxR3V3bWNxcUduMklBeE55cEwxMzVGbTE1TGZCd2JRZ25nSnBkOGhEdUpi?=
 =?utf-8?B?dDVYVWV0ZTZOUU1DSFkyV1R2S2t1QUNtOE5GK3V6OEZQL2hLakFNalgzM2Fl?=
 =?utf-8?B?WWJLVTlRYWs0U0w1REQyWkJVNmEvNTdzN0d2TFowY0VSMVFPcmVqODlITmJu?=
 =?utf-8?B?dU80dUZsY3JYRjlQNE9uOXlzTE5wL2ZRSGpuNVhVRFgvL3NmTFBiZzcvb1hF?=
 =?utf-8?B?Mk05VG5VeWQ1NFZRT0hFUS9JeFdiU2crQmdxVjF3UzB1MEMzakVxUVA3TWln?=
 =?utf-8?B?WGxjZnlJTEV5N0UvM2VnZnRLQ21Hc3hjekltdlk0aUl6a2oxS2M0a09iVnRE?=
 =?utf-8?B?VnB4dm13ZlArTFJwdGtTVytxcjZoc0lIdjZITklYdmNjYzlrYzk1OWFEUnU3?=
 =?utf-8?B?SG45RFc0bGs4a3V0MzBNb05PcWF5QU9uSEN4bmt3WXh5c0EzZ3VQT1JOQ0xa?=
 =?utf-8?B?V2xsd0xJUTZLRWNidFdqUXluVmtCTktKZkc0dUtqZUNkL0xnTVNmTkU1dExq?=
 =?utf-8?B?b2dLSkd0ZDF0eFVDRlQ1TEt3Z0NEWTR3MmZhQzBqc2dZdW1Zb1VxREI3Qjc3?=
 =?utf-8?B?c0o5VHBhT3AvOS9IM0xrbVdpZUlseml5djVHaVR2V2szRjRiS0J5ZStNcUN1?=
 =?utf-8?B?Z3MvT0U2bCs0WjhGS2lXYi83cVRNN0VHWEpxTUhjRFU0UktZOUc5Tk0vZi80?=
 =?utf-8?B?WTVGaCt1SFltNnk2WllLdmFOWmdOMkpDdElleXRtMm9MeFFMWFNVNjVqKzhS?=
 =?utf-8?B?cGVrOGdUL3F4dWIvUmZjVWlPUXhiQmJCN3hzRS9mRkhybDZWU3p0MUxGNUkw?=
 =?utf-8?B?N1JmaEsxSEQxQWhoenorNk93cjR2NDVtUUhHeUNDRWdmZ0RUK080eW1RUTBV?=
 =?utf-8?B?b1d6b3VORmlkR3RzaVgwcnc4MVpMUFRJa0RWVW5saXQrNkRnMm9BMjRFTTgy?=
 =?utf-8?B?WmkyUmtPS2VVblBXRzRmWHV5TVNnc1l2dEh0YnI3enk1cHhyNXZ2TGZ6dzFp?=
 =?utf-8?B?aWsyekttSytrM24yT3d3VDRYb0ZkRzNtL1RRQ2lqOFlXcElXZWRKYktwOTNP?=
 =?utf-8?B?d1lhZkJoVmVkWDQ5ekxwV2RLVWwxTmkzRFNZWjdaS2p3cFQ3R1JDWmJYNEZ3?=
 =?utf-8?B?OXRRKzkzZHEwK0RmeXUrZ1Qzb09FVjBaaXp6MmhxdzYvMXVDelkzYStpb1B1?=
 =?utf-8?B?cW5EbWxNT1NjbHNHeHliRUpvdjVKT2xFM1Yxa0dXaERFU0wyUHZ2WWVVa05l?=
 =?utf-8?B?REVSa1JIT21sZzZlaGFsM3RDdTgwNFFzNi9qYU9IcUZCUzFsVm9LaUl6RkUr?=
 =?utf-8?B?bDZobEExcmNiRzQ5K0VzNVB1TlhLTy93SHVYK2hTYmRvelcwTlBwcklURE1j?=
 =?utf-8?B?enhnMjl1R0k1VnZxZUN2Y1RBay95UWFwZnRsM2dvSUJaZHVheUs4RGlpSEZZ?=
 =?utf-8?B?L2xxOXk3OWlhdHdlRVNySFBIMFVYR01aOVJsV3o1UWxKaEl3MStZQzZlQXY2?=
 =?utf-8?B?YW5wVjViMVNJL3o1WDBwbUxDTVlGTWJsRFFNUzAyeElmdHgxT0pPamJFMEFj?=
 =?utf-8?B?MzVxUHFSMGxPTTlta2k1V3d5dUtvM3JnYXY2WHpoeldsS1pZWXFWakVXbHJr?=
 =?utf-8?B?b2c2YUNSNDZqN05oazR0ZFd2djBYL1pucldCV0ZPOTFXZ3dkdTJrbk9pZFJ0?=
 =?utf-8?B?WWtyTE1LYURjMEI1MjFkQ2JCSHJsbnE2cjRsTGQ0bFRyUU56WDhEaDZvbkhj?=
 =?utf-8?Q?VADqkeHMrLBVZx+BY+NpsgJjc+dfxwM8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVpCbG1jWG0vS2hWQ1daZU1XaXdLYlBqYWJQRmUyZ2k1aUNzTHd3eis0bGp0?=
 =?utf-8?B?K3VNTzJKODJVcm5NOUlTOWFNbXI4YUJyTjQ2L1RtM0x0WldoMEd5Z3ZDaktj?=
 =?utf-8?B?dDR6bFNMVnF0d3lVSTlFTzRKQitONjFYWnpsNE1USjM3dGpkT3F4RWJ1djhl?=
 =?utf-8?B?MzdGTVlLMVh2VmVnc0FhZlZkOWJIRlUzdmZiTHBadC9JQTcrU243dFpxY2xQ?=
 =?utf-8?B?NEFQVW9SQm82SzBhY2FhWGVqSTEwbGhaa0dZSzZGQzM5MHhGNkFaYUFYUGUy?=
 =?utf-8?B?YzNsSkM5M0RpOUhWa2p5R0JHWFIrcTgxT2dpWGxVMDZ1ZjFJRDV5U01YK0pF?=
 =?utf-8?B?VEF0cW5MWll0c0xCR1BndGc2VW96UmdFOFJ2bEdLUFpqU25jWjRadkhIUXpG?=
 =?utf-8?B?dm9oNDUxUW1qTVgrRXRMcGViNkY4MHFtaWMvUmVHWC9uZW4xNHR5YUJYM0dm?=
 =?utf-8?B?aitmN2xlZDMwL1V6RmlVN0hEdFNMZG9LVVhOM2E4SDZOcTJBZ3R2OGxjbiti?=
 =?utf-8?B?NHJ4SG9DVVVxZDYwd3RpMERjVDUwc1B1NWRUQnl3Tk16MFRJN05UMloyWm5Z?=
 =?utf-8?B?VkNYamFKYTIrRjFCQVNNdkFaVHRZNm9tM3I2WkVzWSs4czlsTURxUjRtQ3ZC?=
 =?utf-8?B?THUzKzkrMGs2UmwrSjlRbTluVmpCTlI2N2s2cHpsNjYzTzZyeWRFSFNYL3Bl?=
 =?utf-8?B?TnBQY0JraGdta2IycFZHODdlSDdtNHZlbnZmbTJ0MWZQSXRSREJia2dMeWZC?=
 =?utf-8?B?b3lTLzYrVTdIQnNxZE15YjFHdXhJSnJFdjNmMHZZWXllUk1FZXlPVmkwS3Vh?=
 =?utf-8?B?cjduemhUSmtNeExoVmoyQjVXQW53Qms1MHNudWs2bEhHeE9WQU05Vys3VU9M?=
 =?utf-8?B?QXEvdDRoQ1BJN2NlZjBBTzAzVjJucWZxQk5vWEpGWENBRENiMC9WMDdBeWpq?=
 =?utf-8?B?LzdySk03d2xzcFBVNkF0dnZNa1JzTHFabXFSZGorWEROaUM3OGorakI0L2xS?=
 =?utf-8?B?NWZEVy8zVFBiK3JMOWZDYytzWmp1azJzcjc1YWpGL3F6WlNTY2Z2T1p6Uytw?=
 =?utf-8?B?OC9vOFdTY0JpMjZ6WWlXRGxmbjJ1dGk2VGsyRDFZZzhvM2tjdGF2UkpVT1hS?=
 =?utf-8?B?bjRqTTZlbnF3ekI5MFhDdWt0YUpYSm1qVVc1YXdsYXIvTnBVY012UjNCZktS?=
 =?utf-8?B?WHRYRkZtV3AvWFM4YWRPaGU5R25LQ0VZRlNXQnB4Nytzb1NCaFV6eS84ZGVm?=
 =?utf-8?B?aGRvcWllLzBYU0hGdUtFTlhQdUlFVHhKaWFpeVIxb0w3TmQ5MGVmYkIwOUwv?=
 =?utf-8?B?RkFpcXE3bWtNcTRxWG9ZZVJUSVVhd1k3OUVGY3BXcmxDTkd5clE1ZkdrWFVG?=
 =?utf-8?B?QUpGNHNpS2RVUldsdjhpRmNPY2E3dCt6eUVCRXRNaFV4R00wOWZZS0xxQzQ2?=
 =?utf-8?B?U1NJYTRhaHQwNEZUVVN4Y3ZuVVM2SFlJZWVOSmNTcnN3dm1rcmtaeGh6T2k0?=
 =?utf-8?B?em8zQTJPaWFYNTIrdFdLNDFaTVdwVkpiRnRKMlBpU1k1SjNxbnk5Y3pBWUNu?=
 =?utf-8?B?dGwrN0kwWjhUZ1JuN3QvV3hTU3dvRkN0akFzdjU4S21qdmpvU3VwNjVEbWFI?=
 =?utf-8?B?a1plT1YvdzAyTGZBbWJoUnlROTBtR3Z4TFM3R3NIdnEwUGVwMUEzVjdGYlJ3?=
 =?utf-8?B?Yk1CUTNkMmN5aHVtYVZDZGZMRXd5QUU2K3JVMllaKzVUbmNnWGgydEhTNWhr?=
 =?utf-8?B?OEZ2ZUJRNVdCR3RIWUFpZytNWVpQRmhUb3BEcWpscm1mcWNQNGNxdTZ0ZHNt?=
 =?utf-8?B?d2U4NmxoN2haVFlvaXJ1bDNpMG1hOVAyZFhoTGlZSndDdFJFTlowclZpQUJr?=
 =?utf-8?B?WHh5V2ZydkVVNm5QblBXbWhJSHpNREJWWHlJQWpPWUtyeUM5TEpVeVNOWERD?=
 =?utf-8?B?NTFtbGtBT1J0Y3A0SVdUQzJGQUxFdUpHNElTRE9yVDFnUDdRZXFwb0Z4VDRx?=
 =?utf-8?B?UFVmbHVMV3VoaytTMzRhMjJHbzNXZ2F2Wk0weVRuNlZvdXpoUVdOOGRTR0NN?=
 =?utf-8?B?dXlPdjlhcTNsMEtRams2S1lsZDlaek5aNEV5c3M0TnZuREVseUE4U3gzdFdw?=
 =?utf-8?B?aEFlZGFuZVhJMkNzei9xKzd0UVRFRkFtUFdqZU1GTUtmWlZPRFpzNHQvc3pn?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1a2eb7-e977-4ede-2dab-08dd32df4472
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 08:01:06.3821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQBtwGFnmJ7etcHIYh00ZW2sVL/TsoB/Wl5BMYXvnuNEcdSNJwgIYcO/uFRUNWN/7riHjzkOS1uXkS7+WtEMxU2EPlnZOVF/KMQIrlmkPTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBcnVuDQo+
IFIgTXVydGh5DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA4LCAyMDI1IDExOjA5IEFNDQo+
IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBN
dXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2MyAzLzVdIGRybS9wbGFuZTogRnVuY3Rpb24gdG8gY2hlY2sgYXN5bmMgc3VwcG9ydGVkDQo+
IG1vZGlmaWVyL2Zvcm1hdA0KPiANCj4gU2VwZXJhdGUgZnVuY3Rpb24gZm9yIGFzeW5jIGZsaXBz
IGlzIHRvIGJlIGNhbGxlZCBpbiBvcmRlciB0byBjaGVjayB0aGUgcHJvdmlkZWQNCj4gZm9ybWF0
L21vZGlmaWVyIHN1cHBvcnQuDQo+IEF0IHByZXNlbnQgdGhlIGZsYWcgZm9yIGFzeW5jIGZsaXAg
aXMgc3RvcmVkIGluIGNydGNfc3RhdGUgYXMgYXN5bmMgZmxpcCBpcw0KPiBzdXBwb3J0ZWQgb24g
b25seSBvbmUgcGxhbmUgZm9yIGEgZ2l2ZW4gY3J0Yy4gVGhlIHNhbWUgaXMgYmVpbmcgdXNlZCBv
dmVyDQo+IGhlcmUgdG8gZGVjaWRlIHRoZSBhc3luYyBmdW5jdGlvbiBwb2ludGVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgMzAgKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gaW5kZXgNCj4gNGYzNWVlYzJiNzc3
MGZjYzkwYzNlMDdhOTA2OGIzMWMwNTYzYTRjMC4uOWUwOGJhNDMxOGNmMGMwN2ZhMDcwMTAyMw0K
PiA2NTk5ODY4NTVlMGU5OGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxh
bmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gQEAgLTIzOCwxMiAr
MjM4LDIxIEBAIGludCBkcm1fcGxhbmVfY3JlYXRlX2Zvcm1hdF9ibG9iKHN0cnVjdA0KPiBkcm1f
ZGV2aWNlICpkZXYsDQo+ICAJbW9kID0gbW9kaWZpZXJzX3B0cihibG9iX2RhdGEpOw0KPiAgCWZv
ciAoaSA9IDA7IGkgPCBtb2RpZmllcl9jb3VudDsgaSsrKSB7DQo+ICAJCWZvciAoaiA9IDA7IGog
PCBmb3JtYXRfY291bnQ7IGorKykgew0KPiAtCQkJaWYgKGlzX2FzeW5jIHx8DQo+IC0JCQkgICAg
IXBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQgfHwNCj4gLQkJCSAgICBwbGFuZS0+
ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKHBsYW5lLA0KPiAtCQkJCQkJCSAgICAgICBmb3Jt
YXRzW2pdLA0KPiAtCQkJCQkJCSAgICAgICBtb2RpZmllcnNbaV0pKSB7DQo+IC0JCQkJbW9kLT5m
b3JtYXRzIHw9IDFVTEwgPDwgajsNCj4gKwkJCWlmIChpc19hc3luYykgew0KPiArCQkJCWlmICgh
cGxhbmUtPmZ1bmNzLQ0KPiA+Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMgfHwNCj4gKwkJCQkg
ICAgcGxhbmUtPmZ1bmNzLQ0KPiA+Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMocGxhbmUsDQo+
ICsNCj4gZm9ybWF0c1tqXSwNCj4gKw0KPiBtb2RpZmllcnNbaV0pKSB7DQo+ICsJCQkJCW1vZC0+
Zm9ybWF0cyB8PSAxVUxMIDw8IGo7DQo+ICsJCQkJfQ0KPiArDQo+ICsJCQl9IGVsc2Ugew0KPiAr
CQkJCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZCB8fA0KPiArCQkJCSAg
ICBwbGFuZS0+ZnVuY3MtDQo+ID5mb3JtYXRfbW9kX3N1cHBvcnRlZChwbGFuZSwNCj4gKwkJCQkJ
CQkJICAgICAgIGZvcm1hdHNbal0sDQo+ICsNCj4gbW9kaWZpZXJzW2ldKSkgew0KPiArCQkJCQlt
b2QtPmZvcm1hdHMgfD0gMVVMTCA8PCBqOw0KPiArCQkJCX0NCj4gIAkJCX0NCj4gIAkJfQ0KPiAN
Cj4gQEAgLTkxMCw2ICs5MTksNyBAQCBib29sIGRybV9wbGFuZV9oYXNfZm9ybWF0KHN0cnVjdCBk
cm1fcGxhbmUNCj4gKnBsYW5lLA0KPiAgCQkJICB1MzIgZm9ybWF0LCB1NjQgbW9kaWZpZXIpDQo+
ICB7DQo+ICAJdW5zaWduZWQgaW50IGk7DQo+ICsJYm9vbCBpc19hc3luYyA9IHBsYW5lLT5jcnRj
LT5zdGF0ZS0+YXN5bmNfZmxpcDsNCj4gDQo+ICAJZm9yIChpID0gMDsgaSA8IHBsYW5lLT5mb3Jt
YXRfY291bnQ7IGkrKykgew0KPiAgCQlpZiAoZm9ybWF0ID09IHBsYW5lLT5mb3JtYXRfdHlwZXNb
aV0pIEBAIC05MTgsOCArOTI4LDEyIEBADQo+IGJvb2wgZHJtX3BsYW5lX2hhc19mb3JtYXQoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ICAJaWYgKGkgPT0gcGxhbmUtPmZvcm1hdF9jb3VudCkN
Cj4gIAkJcmV0dXJuIGZhbHNlOw0KPiANCj4gLQlpZiAocGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9k
X3N1cHBvcnRlZCkgew0KPiAtCQlpZiAoIXBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0
ZWQocGxhbmUsIGZvcm1hdCwNCj4gbW9kaWZpZXIpKQ0KPiArCWlmIChpc19hc3luYyA/IHBsYW5l
LT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMgOg0KPiArCQkJcGxhbmUtPmZ1bmNz
LT5mb3JtYXRfbW9kX3N1cHBvcnRlZCkgew0KPiArCQlpZiAoIShpc19hc3luYyA/IHBsYW5lLT5m
dW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMoDQo+ICsJCQkJCQlwbGFuZSwgZm9ybWF0
LCBtb2RpZmllcikgOg0KPiArCQkJCQlwbGFuZS0+ZnVuY3MtDQo+ID5mb3JtYXRfbW9kX3N1cHBv
cnRlZCgNCj4gKwkJCQkJCXBsYW5lLCBmb3JtYXQsIG1vZGlmaWVyKSkpDQoNClNpbmNlIHdlIGFy
ZSBicmluZ2luZyB0aGlzIGNoZWNrIGhlcmUuIFNob3VsZCB0aGUgY2hlY2sgYmUgcmVtb3ZlZCBm
cm9tIHRoZSBpOTE1IGNvZGU/DQpXZSBhbHNvIG5lZWQgdG8gYWNjb3VudCBmb3IgdGhlIGZhY3Qg
dGhhdCBzb21lIGRyaXZlcnMgd2lsbCBub3QgaGF2ZSB0aGUgZm9ybWF0X21vZF9zdXBwb3J0ZWRf
YXN5bmMoKSBpbXBsZW1lbnRlZC4NCg0KUmVnYXJkcw0KDQpDaGFpdGFueWENCg0KPiAgCQkJcmV0
dXJuIGZhbHNlOw0KPiAgCX0gZWxzZSB7DQo+ICAJCWlmICghcGxhbmUtPm1vZGlmaWVyX2NvdW50
KQ0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
