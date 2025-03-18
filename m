Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CBDA66C05
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 08:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C31C10E1D2;
	Tue, 18 Mar 2025 07:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Irl8CURo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED08B10E0F7;
 Tue, 18 Mar 2025 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742283582; x=1773819582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+REvOsp4u62og+hAya49DmVWsCevtBSRSxAqqUo23aI=;
 b=Irl8CURo9XEjw1iMzTnMaW1/BSjCd8JisOjho6Rx4rc99tWEBo0UV2dT
 U+NhE5Cx+CL2RS0ezxCoLsAS2+4u7/iVQSgbFMTyoA7c4s0kRIvY2+B0f
 gqDK6VCYQzLSJxkMZcXbb/B/bcor2gjsaTk5DP7v/WfnXMno6GUYnWsL3
 9ecriFxyadpf7QTGWQil63M8FjMad/Ejuw5WIWO2pWzTQpg8uUQSo5Vzv
 642WuxgM70k3iC2a+7gE7JFScsay3GRM55bd8BnTFQzctkbiLPOP6mvAe
 kf3ObCrU+FmC3YFzuf8OQRFhLzKOon0WsmTyDFCL8FRGK5iHF5cEn8BDi A==;
X-CSE-ConnectionGUID: 9f27MKEZRGKUkjj+efMNTw==
X-CSE-MsgGUID: rRZbNOo1QBeEizxma3laQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60800395"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="60800395"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 00:39:28 -0700
X-CSE-ConnectionGUID: 9T1uDVXYTRKBUuE9mrOgHw==
X-CSE-MsgGUID: Ax7j1mVCQ7ikpyqQ7HEzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="126836065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2025 00:39:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 00:39:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 00:39:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 00:39:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CviyGNaqDkMMCW/y5h/s+RJqJX8lp3UImrIjpqR3n8GCz1j6f7l/7reomxLnIMWXHAZw92sO94SjQEprWsvVmR/DlayBJDpqEv0nNdsqrN30tpV3co6UyLunY5pCojmo30d3R1fyR5OaYOBLGtk9/xQ1eSafj/K7JKjx0qrLdBK717GY0znAhAcuJKw4YUO1H2yIAck1kb50lM2x9zatiPQXCufbk+6Vd8oFqvoXoBGY6OQVug5FvJtZrWO323UoxvTlnjw95zCnkbphxIo/iuxVJTQQ5GYEbskO75cR4nnVTfs7t1rkUSY/eMKa6qiGh0Fm2RCknlgkBqa9YRbuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+REvOsp4u62og+hAya49DmVWsCevtBSRSxAqqUo23aI=;
 b=JFMpsgpAHml8ZPaYFpLWxpZwMf/Ga8GPJjHz+K7+9Yy++GbYnstGOPJNXbLHct8JluXMydeF/j8ZckRHQeSV0vHayg9arp7qOMM4kzihdXn5LteHx1wQQovTtX0GRW++Oa7Li1ViQ9zdm15N1qSVrbDtuodUfA8F6qYhT1Vp1kYZ1F0eHruN1jBmYPkCewaU2kuFGPgsKGv8xGyk45dWwf7VBI8IJ6vIb43lIsHKJbPVP7kvHGCRyUcf7vKR7tfkpQPmJzby1cwQTPpJKlyB6sbE/iQCmkmYc2Xh7wdBDdiblZYZIxJ0P6g9DqmDFp/9k6YibFJVLDYXjv5EnFFLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 07:39:18 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 07:39:17 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH v8 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v8 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbk1InigGG32d2fEiVHECZiJlWb7N3RhmAgAFEfkA=
Date: Tue, 18 Mar 2025 07:39:17 +0000
Message-ID: <IA0PR11MB73071AB13EFB8D67C94FD2A4BADE2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250312-asyn-v8-0-0c4cbe5a066d@intel.com>
 <20250312-asyn-v8-1-0c4cbe5a066d@intel.com>
 <SJ1PR11MB61290E6675948DAD0634166FB9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61290E6675948DAD0634166FB9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MN0PR11MB6135:EE_
x-ms-office365-filtering-correlation-id: e618a3d5-b801-44d9-d627-08dd65effd54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dlJBT2N1dDlVbC93c0xpQTh5WDVOc3A5UnJLM2U4K1M0cDB0V1JtZ3B3cE0y?=
 =?utf-8?B?SDhOdE5aQ3A4SXZzLzhYSVlVU2RSOXY4ekxGZEZYbkw4eHV4bEw0WVRYN1lC?=
 =?utf-8?B?a21iM1BTV2VuSStYNUdic0d2UVBmV01zYm1CU3NOMjNXeVUwZWZaMFE0VThX?=
 =?utf-8?B?L3dvTXY4RGFhVS9VWXhNaFY5czJ6M0tUZDBldVVRZW5jb3NKUExRS01uTWw4?=
 =?utf-8?B?d1dzeTFzajdLaWhuWDUxSUJwVzVLRnhBaTNuRmZGQ1pwRWtwREVML09aM3Ry?=
 =?utf-8?B?MXZWTHdvMTdFK201S212aTFZUUY1UjdSYUw5RGpRNml1dTdsVVk0ajh6RHBE?=
 =?utf-8?B?WWlVbUd4bjVIQXlZeDN5YXgzYk9heTNvY25EU0tkZzNLMkdaa0hZWUNTdHRB?=
 =?utf-8?B?M2Y2MllOaXVVajRRT1UvaGJGbEZ4OXltdXdWSkd5TjRBajNMY3NTOVZPU3dO?=
 =?utf-8?B?Zmh6UEhOQWFlcjgrYWVGOHZtQ3FtUGV3b2xFYzVQTG5ZY2ZxVkVyd2o2YXhX?=
 =?utf-8?B?ZXhLQi9KM2Z4K0xZc1lJaVl4bEFLRmhuYUtPTUQrRG5CLzdMVG9tSmhNcHJp?=
 =?utf-8?B?U1VvKzRLNkF3Z2VJUCtOTkhVYXNoUjJQSFRrRW04dmtqM0V1V1B4TnVoNXNP?=
 =?utf-8?B?V2UyOFZzV3BwSHg4bzBIallIeWdMSzhHWGE1dEVWSHl2ems3a1V3RUQvRGlW?=
 =?utf-8?B?cTVTdFVEd3NvZXNUa1ZCVE9xczRXTm9aaDZEUmRKQ0Y4ZXI4QlRWbXUxTjZU?=
 =?utf-8?B?ZHV6bzlZM1VBYTIrSGtQeE43S3A5ZHlYbmFYNVNyWVpKY2RhTzBoankxN2tn?=
 =?utf-8?B?OGsrV25XbDMxSnJreURiN2tORGNNSjZuMmNVNjFmbExhNWRLMWlGSXYrK3J4?=
 =?utf-8?B?MEw4Ynl5Vm5IY3ozR29CUjFWN0dlT3FtYytXYUlnSVZJYWROMVMwbHFjMXA2?=
 =?utf-8?B?SHduMHNoL2s0a2xIdDFEazJQcFU5ZTY3RDg2ZXgyMjh5ZGRoVXNxMzFOQUlC?=
 =?utf-8?B?QWp0Q3FIeFlhSnpQdXgrWDZ3MUVrNGhUS1BJc3R0RDd5R3FSM3ZHVmJLaDJr?=
 =?utf-8?B?WkcwOHpnWWxZaGZCNWJCUW44b2k4b0NkVXU5cVA1RW9aWVJDYlRrQ3g0MzBI?=
 =?utf-8?B?NUhLOEJCUGJDMzFZaGUvOGtZVjdrUVJ3aC95c0NXd2JETlMwV2FySU5JZUtR?=
 =?utf-8?B?YjlFbWJmNnZ6RWRHVWMrdVpQMGdOYkg3L2ZCNzVpT1ZxSU5VZHA2SmRvSWJh?=
 =?utf-8?B?TFNsRkhQVDhyZ0FjaUt0R1ZDQlJXM2hnaFpJbTRqVUtyQlpwZXF6SndBa2d4?=
 =?utf-8?B?T05rYW5QL1Q3Y01iN3VMUnhrQjFaUUJ4M0loR0ZVM1JIVGJHbE5nTFZVbC9s?=
 =?utf-8?B?V3N2RGpBVUFBczFhcjBZNU9PYWozSEhXRzQ1TjhnejhTdmw5bEM1OG03R1ds?=
 =?utf-8?B?UDV3WENrdzdMU0g1VFNLbWJPUXFHak1xMXczN2NxdlNxdVNXMDkwbTRZcGI4?=
 =?utf-8?B?eTZqMng3bmZWTndPWXFobmdrVEwrcnlONnZ0cHo1emlTemlTMlVSbmV3bU5P?=
 =?utf-8?B?WmxTa1FFVkltZUVDU2dlRkdma0pMeElnOEwweFJrRFBqNlVNc21IY0tIL0pn?=
 =?utf-8?B?YzJTYi9TeU4zVVJRWm50YkU3RDdRL1BLeVNDT3RKaGg3QzRPSjVZNmQ0a2Jo?=
 =?utf-8?B?cU5VWVROaDJ2RUIwQkdUZVh5OFhlVHpQdEtSRXBvR09LQ1R0aDBMak51VnJu?=
 =?utf-8?B?b29VWUd1bWZaUGRVK2tjQWc2ZnFENFZ1VzY5RjhQd2Y5Z01pRzJvanM4WExl?=
 =?utf-8?B?bmNYVTBzVTJVL0srRzZza3FCb0pRRG9uSk5ReG14U01jRWVGcXV3TDcvSkQx?=
 =?utf-8?Q?LDOx+kRXu9HKZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG1JcnA4bWNVWjJlQ0MzTmdkRjRNSDF5K3VWQitHbld2aXFlR20xZnR6SzJQ?=
 =?utf-8?B?eklrU1FRWmNsckdsK3RQbDVYc2NlT0o5OE01T3RleXVDL2lBdzZCU0Nab2kz?=
 =?utf-8?B?OFkxYVhBVTN4WFluWC9yQWwxQVY5R040azRvTnhOVHRFcThraWFGcVlWcFds?=
 =?utf-8?B?KzlaOFVyaklNZ2ZVd0FQa243M0Y1eHMwMkNBSnRXRTMxazlXU042NmZoNXVX?=
 =?utf-8?B?K0REdUJYVGxRaVJJQ1ZNR0w4RVVXb3M2Y1BTNkcvaEkxbzlUZjRoTHJzVmsz?=
 =?utf-8?B?RFhMbTVxeVJkQjRzWVJCeEZsSnlkUzRSa1l1Z1JFRXh3UHBodFQzcS9kVkxB?=
 =?utf-8?B?U1VaNDU4UitXZ00rcnQ4YjBHeE1RL29kdmNNV2xjbGs2ZlVUSEttWVpjZ2RH?=
 =?utf-8?B?d0s2YUtpVGczcklTaXRjZ2JWY3RvbTdhaGtYemtNZ0lTVFhOU3VQbkw4RVRZ?=
 =?utf-8?B?ZW45VFlFNFQwWDlTeXdPTXhLOERDeGFYZkR1aTZSa1R3RlJ1SE9KK2tqUk1I?=
 =?utf-8?B?RFNaV2lvMmM2Zlo0bUhvV011RmozdU12YzJMeCsrTXQxcmNSaXB5U2dkRFB2?=
 =?utf-8?B?T21ES2MwMTlPM2VYRXZBem9IVXhaZTNyQklNMURKbzhkZklYQm1JY2ZSUk05?=
 =?utf-8?B?TnpORVMybWxQK0ZEMCtVU0JiZFV2MFhYWUVzM3JTdEpYQ0dYQ2VvdTRFQjV0?=
 =?utf-8?B?N2RYZzJ1enlTS2tVcWRTWVlhYVRYeXFSdzFPRlJtVTdXMmFVdFZyRm1wYUdi?=
 =?utf-8?B?aVNrVXJSUnc4RCtsNG83aTFEMzVtRm1mSDBPZUxhOUkwdC9HbmpodXNNTHRE?=
 =?utf-8?B?blZrZmxuT3JWZUx3dkdNM2dqdjhtclhJVkVFTHZNNFFicXFKVC95YnkyQ1dy?=
 =?utf-8?B?WUI0WVNiUmtmeWwxS3pvM3ZONmJuS2lFdWpnQkV3ZVh5WllBd0F2MDhCQkNV?=
 =?utf-8?B?UElVZ3RPZGN6aGJ2dTg2am5FdHlGbEhtd1pSVDJqY3VsU2dnNUZqTzFiczB3?=
 =?utf-8?B?ZWQ4M3hiaDlKa1VRMk9XQnRxUEhiR0dJb2xCVmdVc2EyQ1dDbnZlbkJnRnpC?=
 =?utf-8?B?Qm9QUmJEMkFvSnM2T3pPamNqcHpoQVdKdHhvcHJGWFR1NUVSS2FhNUJzemVn?=
 =?utf-8?B?TFd1RjVGVFowaWgrbUVKeHROVE5qOStuWElJK0hJK2tEZmh4YTFNTENTMS85?=
 =?utf-8?B?clpuWjRWejJkTEtWV01hRFdQbVMrYWRwdmVIZklnTzJ5TnJrK2phd3k2bm1S?=
 =?utf-8?B?ZUZBZFNRQ2kxWnQ0aXRROHgvKyt3RzN0MWZ1cUFtNFJLWDk0Y2t6V2p4bVJ6?=
 =?utf-8?B?WTY2bEhFSmdMRzJoaG95dzFER3hkZThnNEZEMzVjN1BWc0NwUlBhSFRaMG5i?=
 =?utf-8?B?RkhpUHNHRnZONmY1SDJJdzRGMENXTDVOZFQwUzVsaHBDUnNKQ3FCNmd0WXZO?=
 =?utf-8?B?SzNwdFRNUTlHSHNQR1pPYVBJbngyUlZTNS9UKzhCekl1amlrM2tJcURraFRW?=
 =?utf-8?B?ejRjNlRIU05uWEJuN1pJK0x0bUxRWm9ka250MG1aNTVHNFE4Wm1zZ25INUQ0?=
 =?utf-8?B?Vk1TUWFaeUtXQXRsUzBORDRPcjVNWTRUVWd3ZTZJcHVJVjZneWR4RW1lalJS?=
 =?utf-8?B?Um8xZTdWaHV0aUJKc0FjeWNCbEFYeTlDcTJZcUhyS3Rsazh5ZlJ5dTJXZDFx?=
 =?utf-8?B?d29SOERTck9Bamlqblo0OFRqa0VrOUNHRG14Q1dkb0R3cDBpbFF4RFM2QlBx?=
 =?utf-8?B?TnhyOXUzNjJENEpVR3lWQkFVL2NvYnBSajV4ZGExOFRMb2RDYmxlQnlPRjQz?=
 =?utf-8?B?dHc1Zk9KbDhlbTFxZVEwSjdCdmcvUytTUHN3STMwaG5SbHlvSjBJRHcxZ3B3?=
 =?utf-8?B?cUg2eUd1WUFSMXhiVzA4VGJTUHZjUm41UFZpSlg2eEZSc3ZKalNMUWVibGZI?=
 =?utf-8?B?K2xCTnZuNnRGTXRwK0JXZDd4Ykp5U1RLS2dweHpGQVNaL2srenpPbWJvNmtW?=
 =?utf-8?B?S3F5enR4eUxjanByR21kOStVZFBnTWJGOXZteGRqOENON0loV1FVN2VudjNW?=
 =?utf-8?B?RTNvTDZSS3J0NDIydXArcW5oejQyT24zZ1gwdXk5WC9iK3VsQzBmd0l2emVk?=
 =?utf-8?Q?Z9jkjh/E88mXXSDrb5+A09q+p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e618a3d5-b801-44d9-d627-08dd65effd54
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 07:39:17.7640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5g60dmFH8Ew38rqqZ0KqJVCJ+fRdpAgR7ss/qvCNGc4RFdNOkt3Y5jirElOqC12Upe+ZZEoX7qnHr8d/n5LaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
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

PiA+ICAJYmxvYiA9IGRybV9wcm9wZXJ0eV9jcmVhdGVfYmxvYihkZXYsIGJsb2Jfc2l6ZSwgTlVM
TCk7DQo+ID4gIAlpZiAoSVNfRVJSKGJsb2IpKQ0KPiA+IC0JCXJldHVybiAtMTsNCj4gPiArCQly
ZXR1cm4gRVJSX1BUUigtMSk7DQo+IA0KPiBXZXJlIHdlIHNlZWluZyBhbnkgd2FybmluZ3MgYmVj
YXVzZSBvZiB0aGlzPw0KPiBJZiBhdCBhbGwgbmVlZGVkLCBpdCBzaG91bGQgYmUgcGFydCBvZiB0
aGUgc2Vjb25kIHBhdGNoIFsxXQ0KPiANCj4gUmVnYXJkcw0KPiANCj4gQ2hhaXRhbnlhDQo+IA0K
PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzY0MjcxMy8/c2Vy
aWVzPTE0MDkzNSZyZXY9OA0KPiANCk5vIHdhcm5pbmcgYXMgc3VjaCwgYXMgcGFydCBvZiByZXZp
ZXcgZm91bmQgdGhpcy4NClN1cmUgd2lsbCBtb3ZlIGl0IHRvIHNlY29uZCBwYXRjaC4NCg0KVGhh
bmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
