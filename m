Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94942AE4879
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF9F10E1F3;
	Mon, 23 Jun 2025 15:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGEyfwsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D4E10E04C;
 Mon, 23 Jun 2025 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750692431; x=1782228431;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c8NETLScnXddfZ+6iVCX29uG3C4Twudz4/IpkTamafw=;
 b=IGEyfwsRZ2UWNV9pSriUylHZpQgBtiXDyQ5oGJDibaICSyjeLzTIQVI7
 1evwhaHl11DL1L5XY1D7MgZazUre4HNpcLGO0ip5Exiu8KU73kTq6U0Em
 m8xsiNGOwWcVmeqte2LJbSE0PoXVsl0k6W/vTXgUZWFlJqoLng+awQWND
 54yFBFjSaovSU+n2eAoSGgxr1gYX9JCfo+9SgfyZ913qk17M35yJrlvvY
 7kD/0al+W2Yq3uayss02DOr6NSxmh75eSacmifgjwde//A2f0Qag7XOEE
 wozd/R4z+LwTy14t8aq7j3Fu19RZyzfbrNOZ+IDPi1htgkAlLihi0FujX w==;
X-CSE-ConnectionGUID: t+pyrDVgQR2WsrquF5Vseg==
X-CSE-MsgGUID: IVOnRRLYRcaJkz1BGLIiPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52874511"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52874511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:27:10 -0700
X-CSE-ConnectionGUID: J0G7wbOeQcadOjO91q/g5w==
X-CSE-MsgGUID: ad3nPGO4S5aNit0OVsAthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151934041"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 08:27:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:27:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 08:27:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 08:27:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibB4q8DR7tZsxMgokWW1yNympPCPYWCM1gLUIJJ54yH8PSk6/JVbU7SYipPBKOyUtqNN+xb2IuJugQk1WtetxHqYuKZiB+/U94v61Gs2Vl2umyPFk58G5SSbonZ/YxkUBuS3ylRECH+k6jV1y/i25qk6Ex3lh3eLV2UGMsGaIQed1zeKkUAUhITae0hUg14pkU4WtStv4t3nMa+6702lf8P91rWFSMElEsjcPc23H6r1ri3UaxP842W7dhStYoeHoRkdMkJ7VpxzATN7K7m5eaGDGar1oKMAIjUcDytZtaH1ivlSpapiL/0INU3Zl8sM/109vtw05mHRq2kQG/5ccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzKQJyg/vCYmCYfGNrWGER1NMBoRnyaa//kfVyMOfD0=;
 b=WPugbb332B5dMLIdaigt/gy2g2REgQ8ywlg7vcPBoOWka57Um8AUPLofKMbmNaxnCS59NbwmmgI0SDAi1ffm2U6XNkWLz1uFkrLjGjQ5O8nmGHgD+a9Yl0goocEVNYotUHXJ5NAeGWTi/HVMzOaY6LcJYZ/yr+YenLiUNC9Yhsks0x/1IzyTsoTiwzDFlUWDeRgSj2YuBSj+txf4OhknZb/j3/VEJQn52lKTgUFwSas0cKLF1y24lJeyfDTFavQYsMc8zFJqayNA30wHTEWy0UANsCqXyYsWRFgoPiYFRmMU3Vwy/SCNFA75fcQRbtvoKNJT8jAuOjtjpnWzmdBexQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 15:26:49 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 15:26:49 +0000
Message-ID: <6733693f-64b2-47fa-97ba-4ebba3edef35@intel.com>
Date: Mon, 23 Jun 2025 08:26:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in rpm resume
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-7-badal.nilawar@intel.com>
 <2c4f410a-3abd-4abc-84c8-13e7e3b40a73@intel.com>
 <a8d2605c-930b-4eeb-8e4a-1aa9bbfbb960@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <a8d2605c-930b-4eeb-8e4a-1aa9bbfbb960@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 442ca23c-5322-4062-0bc6-08ddb26a5f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGJaTHcrYjBMckkrTFJoMDlZZ1BXWWc1ZTV4NWR3Wk9JQmZEVC9rc1VSYWx5?=
 =?utf-8?B?bFdwU3o5Rm51dEtvdnVGclNWMGZPY2hWMzBCUERKQ1JtMG92ZE1TZUZZODho?=
 =?utf-8?B?TlVqUTVFT3hobHBHSmVVaDU4Q1NHMHVhWXdodXFNdFVRUS9CMkRNcDZ3ODN6?=
 =?utf-8?B?aTFpT0cwbnc3dE41UVZSTmhjSTFtN3lDUXVBVzRvMGtTK1ZZQ1pjM2VESVlX?=
 =?utf-8?B?ZVBleDgvSDc4bjF1TEJzSFJpQWxJLzFGa2RHR1RLVzRISmFnUDV3UFZ3L1Rr?=
 =?utf-8?B?TUF4SHp3eXpXTUdpTVpBS3pnSkx0QVpROGRyajM1SjFDdmVDdnhRRWxWTDlT?=
 =?utf-8?B?ZUpXMkwvbUtIaU9KTVVKWURYNU9SYVpxenJTd01mTjFnUW9YU0JNQUx3aEMv?=
 =?utf-8?B?SHY1Z2Ztdzd4WU8xM1pUSDNZSXIyQnZyKzdsY2FEQWo5KytVOEhCbCt0Zk9O?=
 =?utf-8?B?Q25ENTlhR0xTbU1ibXhFNmQxMGRPdlNNcWM3c0wxV1Vzdklta1BsUDBxNU0x?=
 =?utf-8?B?alBVWXkrd2hCejlGZkFlaDJhbFJvMmJ5dkMza1lKVnEvQ3JTSUt1V0o3bU80?=
 =?utf-8?B?MG9KWDNFTi9tRWh0K3BTMU81dlV3YitDR2dGeWI2Zmx6YTJMUlI1OVdMQ2Zl?=
 =?utf-8?B?MzJSUUxkZmxJRlpFd2JwQ3VZc05kamN3UkcxTjkyc1lLandqRUtOd0E1MWtD?=
 =?utf-8?B?cEV0S0xKTWdWQ0VMeGhUazdDYWhhWlVYcjIvdGNrZ1FoZ2l6K2VUbFE2b0Y3?=
 =?utf-8?B?V3ZVR2NJNXdIQWZmOWxvOWdXdUVMbUtGaVpzYlFVbGJuc2hML0MweEFSYkJK?=
 =?utf-8?B?QW5qTzFFbHhBQkszb2V6NTZTbFcrQlNNbnNJNEc0ZXhwZVIzV2t0T0VXUWNE?=
 =?utf-8?B?RFc4Qmlrd1pQbFdOaEJ3ZFE3a0pROXk0TnhCUCtJQ2tvbEJBbWJJaE9YRVFK?=
 =?utf-8?B?d3lWdEpreFBVR1N4VWVDTzJBay9DeE03K3oyR1FUb1U3SHYwVzhTKzNXb1g0?=
 =?utf-8?B?d1pocStDK0o0b3ExY0lkblVCL3ZVUkc4Y20rOFB6UUg5d1Y5V3hjUWI1Yysv?=
 =?utf-8?B?Uk45WWxlVzQzb1V3Zk5WM1NOQXdNM1NqNDBKMXRUb0VsNWJmbkhmRytjZDZQ?=
 =?utf-8?B?blJueUdBVTJUQURSamFzTExacDFVOUE5aUsxMUM0QUU3MEZuZ1RsM0ZGWm5K?=
 =?utf-8?B?RkM3MWNJdWExemtydFZnRWZrditJSnhVUlo4WnhHZ1g4Vm0rZXpNcGJnYzRQ?=
 =?utf-8?B?RGREdDJENEozL3h6aEEvS241RTRqendrcndHdEdWK21vV3B6cWVINTF3dkls?=
 =?utf-8?B?Yk9pOUlJQ3dzTnQyNExiY0dJSnJ3d1ZWTFFqL3QvNlh3RXNuTmdrRm1uOVdr?=
 =?utf-8?B?Y1RSajA1WVZqSWlZZzdRUDd5WENNK0Y3UmlaemFCTVVSTDJEd285WDZmTmpq?=
 =?utf-8?B?WUp5NlBqQzIwSnRMaGRWTE5nV0JRa085aWxZb2VCV3F3UnFTdDZHSll5S2pW?=
 =?utf-8?B?WVZiSjR3b1V3dVJhbDFDOXZxVGlMdnZvWUFTbjRQOTJRZXErUWlwalk0WnFw?=
 =?utf-8?B?UXR5MEIweTBRMXgrMEdZaVhlLzc4TWJLZE9aaFJoV3RzOU5UZGZZU3FCZnA0?=
 =?utf-8?B?M3Q0MWE2akdpR2pnTVhjN0dqTHM2dUtubzJMbDFnR3ZxQkdsT0ZEU29qSlFC?=
 =?utf-8?B?SXdYOGY4cGk2QXZxRjRzdU5rZnVJSWhheTNBYUVVV3dqYmdkdmdzcGdlVEhq?=
 =?utf-8?B?VWtFemNnWG1oTlpyKzR6dDhvN0VOZGhoc0I3Nm9rNTJmQ1VyVXR0ditYWStS?=
 =?utf-8?B?c3BZN2VuYjFZRGtYQXVsVDRvOVFZV0hqZGIydS9KRDdkUVIzaU5kQW5ua1g4?=
 =?utf-8?B?Z2FCZEIvSDFKYUdKM1gwWldPMFJ5VW9RcnE3Z0phSEpnNHFOakRqejVjRUZB?=
 =?utf-8?Q?WPlqwjeyIUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnRnWk1XWGJCT2E5UStvcWpabys0UUZsbTd2T3RveDd0alhUQitxbkdnMHpM?=
 =?utf-8?B?eitmUkpYc0E5eG9zZitjb0M2dndKRGZjSXZta25UQncrSG4rbXh3bmQxcDZp?=
 =?utf-8?B?dzZBR25DY21wSmNpOWtvUEpmQzMrNU1BSXpYTENXdW5BVDVrZWxPTTZMdGt2?=
 =?utf-8?B?NW10TEJQS2RSNEU4WDZUUVFxZlo3NkR4ckpaVjhzUmJoQmdKYXVJaEJacmNm?=
 =?utf-8?B?WThjT0EwUnBFSC9XWUYyMklHcGNwNVF4ak1HSUxlRjVML2IrdkdRaVNsbktO?=
 =?utf-8?B?S09oeG04VFFKYmVMbm92eEttZ3FpT2hTVlQwdFVtQjVMNDhSbC93ZmlMNjRl?=
 =?utf-8?B?RXovRXJHOEdtWEY0NzVEOFd5UDl4ejY3bTl0RGZOR2xjbXRjVHJadFVYMjRl?=
 =?utf-8?B?eDJPaGN0a21uNEtBcVJKa0FpSU55N3VENG95OFUvdnB2czEzVytLRWZOeXRE?=
 =?utf-8?B?OWcwRHk1Qmgra3l2anRieTNIRXNZYU56Y1MzSlBXb1kvUkEyRGtlYWV5SDVW?=
 =?utf-8?B?bTY0eW90OVh0MmpoRjFCa2R2d0FoQWpWNnhHNXBpWXE0dCsrbHp2Y1dGQmJm?=
 =?utf-8?B?cW0yOFpMZUhXeHBhTWxVRUU2bzRBdUNBRmxqZ2Q1M25MSlgwS25XSHRvRnov?=
 =?utf-8?B?WFNyVkJWU0RwdU54SGdKaU83RldpZDVibUg5WEo4Y2poaDkvekxuYS9YK29w?=
 =?utf-8?B?UjgxYitEZ016NkYvM0ZmT1ZnMTNOZFk3SEdsbnkwekQrWEVGWHdxY1hVQ3Jk?=
 =?utf-8?B?ZjRDVHA5c2k0c0FpTDZQMlhNWXAyb2NVSHJtdEtpampFTi9DSlBlYi8xcXAr?=
 =?utf-8?B?OFhWeEI1RW9VT2N4ck5WL0IvUmhlTjV2aWhkazdxbnlXdjdYOWtlVEYwQkpK?=
 =?utf-8?B?b2VUN1RIeVVDRXFQSkZ0RzNwWGEyc1dwL3ppbnJlWTBWTHlXU2lZaXREdFZT?=
 =?utf-8?B?U1Y2USt1NGNzNVdzdzlKZXA5eW8xSkZqLzY0bHh0T0loR0V2UGxYM3g3QTll?=
 =?utf-8?B?UGVLYzdtbjdEWGFVbUhidlNpRXo3SldJNVZJRnB5RUptdHZZVmI5UjY4RVhE?=
 =?utf-8?B?YUErbHVHYUVuWkRCTW1rQnVuVHNQSDJCQlYzQnZGUHBHSzZYdGx3WmczdjBD?=
 =?utf-8?B?Z28ybzNRZ29lcDFJeVBRcCtyaGdxVFp1OGZRbU5jSUpDOTNBbnJmZ2xJWWpK?=
 =?utf-8?B?WVNMTGRKYktmNEVzTmRxWTRueDRlUktwczF4cjVTdXFMUURLbCs5dENGT3ha?=
 =?utf-8?B?dVhFS05lUXBpUkloRGlmZXVQeXlacDV4L3dTTzMwMDNWSGNHb2ZpbU5BRWs3?=
 =?utf-8?B?anFaa0gwelFuYjBxbFg4bkliTEFRUFlJT1JDMkpUM0tLanRoK0QxbmpPLzF4?=
 =?utf-8?B?QWVDQkpGYnFRYnBoMHkrSmNsUGlPOWxCcFZEcWNQamdueUI4cVZsb2pKeDAy?=
 =?utf-8?B?a2VDZjlzVENrOERqUXBqNmNNSVVkbWRFclhQWXd1bFZKc0RickJSaWpvZjlQ?=
 =?utf-8?B?ODFDYTlQd1Z2OUYxbWs3dlFFeDZEQktSZk85NlpQWnVlQ1g2TzdHUHFPVkU3?=
 =?utf-8?B?QkFFaFQzU0xMSkJFNlQzd2JVTklEQ0Q2OVhPNlZ2VE5UV1BXUGJaN2hjN0RI?=
 =?utf-8?B?bnhZdHRTUW5uY0xFOXE3VzlSU0FjV0RONWR2aG1pUDBCQnk4K1hWZXpBaXBk?=
 =?utf-8?B?R3ZWTzYvZnpPNUpvZFQrTDgwMHd5bGQ3MFJsMHJLWHQxYzJZVmJyOUNOUkgw?=
 =?utf-8?B?VkdIbWdrUzF5RzEvZno4TVVJN3YyVzk2a3NqL2NsSTNLejJVVG91dklDaHlF?=
 =?utf-8?B?WGFxcVhSbEJtQm5oQ2p3dytweGVnN2Y0YlprSnNOaEZVdDdjTXc5bXpWSnE0?=
 =?utf-8?B?bThrRngwdTJDV0RLWUZnSTJiaWVEZEJBV1d0UXo3QXdCTHNUbTJrVmM0UmtV?=
 =?utf-8?B?TzdJMHhYVWZ2QnJYZTN0WGJXSWFYakxDS2g1b3Z2cXlIU2ZCOXhUeGszWjlW?=
 =?utf-8?B?NDdsTC9lTm9zY3kvWGFNeVFkSHpkNExLZzZMRS9NdjZjZWEyU3p1UlE0N1JV?=
 =?utf-8?B?TmIzaGFXR0I0OHNLVHJ4ZEh2REVSQ2NJNEoyUHMxS0NIS0dUUW4yVzh5MXBS?=
 =?utf-8?B?UmM5blhSc2ErSHFOdjIrWXNJeWZ1MG5USDYrcVE0S0tnb3dHUnRTaG9melY1?=
 =?utf-8?Q?Gdpw35IGspmR8bUeRAYXEiQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 442ca23c-5322-4062-0bc6-08ddb26a5f59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:26:49.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /q8ySKoOHJhr79+9LDuLv7jox6bAo59yKXe6E8MQjURlEgh8/dtGpbwPMUY9JAEt2HPQl+xySqfz9VpD3nXFrZoJ1d0BeFRB+b34jMJMgfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
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



On 6/18/2025 10:52 PM, Nilawar, Badal wrote:
>
> On 19-06-2025 02:35, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>>> Reload late binding fw during runtime resume.
>>>
>>> v2: Flush worker during runtime suspend
>>>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
>>>   drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
>>>   drivers/gpu/drm/xe/xe_pm.c           | 6 ++++++
>>>   3 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> index 54aa08c6bdfd..c0be9611c73b 100644
>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>> @@ -58,7 +58,7 @@ static int xe_late_bind_fw_num_fans(struct 
>>> xe_late_bind *late_bind)
>>>           return 0;
>>>   }
>>>   -static void xe_late_bind_wait_for_worker_completion(struct 
>>> xe_late_bind *late_bind)
>>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>>> *late_bind)
>>>   {
>>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>>>       struct xe_late_bind_fw *lbfw;
>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>> index 28d56ed2bfdc..07e437390539 100644
>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>> @@ -12,5 +12,6 @@ struct xe_late_bind;
>>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>>>   int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>>> *late_bind);
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index ff749edc005b..91923fd4af80 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -20,6 +20,7 @@
>>>   #include "xe_gt.h"
>>>   #include "xe_guc.h"
>>>   #include "xe_irq.h"
>>> +#include "xe_late_bind_fw.h"
>>>   #include "xe_pcode.h"
>>>   #include "xe_pxp.h"
>>>   #include "xe_trace.h"
>>> @@ -460,6 +461,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>       if (err)
>>>           goto out;
>>>   + xe_late_bind_wait_for_worker_completion(&xe->late_bind);
>>
>> I thing this can deadlock, because you do an rpm_put from within the 
>> worker and if that's the last put it'll end up here and wait for the 
>> worker to complete.
>> We could probably just skip this wait, because the worker can handle 
>> rpm itself. What we might want to be careful about is to nor re-queue 
>> it (from xe_late_bind_fw_load below) if it's currently being 
>> executed; we could also just let the fw be loaded twice if we hit 
>> that race condition, that shouldn't be an issue apart from doing 
>> something not needed.
>
> In xe_pm_runtime_get/_put, deadlocks are avoided by verifying the 
> condition (xe_pm_read_callback_task(xe) == current).

Isn't that for calls to rpm_get/put done from within the 
rpm_suspend/resume code? This is not the case here, we're not 
deadlocking on the rpm lock, we're deadlocking on the worker.

The error flow as I see it here would be as follow:

     rpm refcount is 1, owned by thread X
     worker starts
     worker takes rpm [rpm refcount now 2]
     thread X releases rpm [rpm refcount now 1]
     worker releases rpm [rpm refcount now 0]
         rpm_suspend is called from within the worker
             xe_pm_write_callback_task is called
             flush_work is called -> deadlock

I don't see how the callback_task() code can block the flush_work from 
deadlocking here.

Also, what happens if when the worker starts the rpm refcount is 0? 
Assuming the deadlock issue is not there.

     worker starts
     worker takes rpm [rpm refcount now 1]
         rpm_resume is called
             worker is re-queued
     worker releases rpm [rpm refcount now 0]
     worker exits
     worker re-starts -> go back to beginning

This second issue should be easily fixed by using pm_get_if_in_use from 
the worker, to not load the late_bind table if we're rpm_suspended since 
we'll do it when someone else resumes the device.

Daniele

>
> Badal
>
>>
>> Daniele
>>
>>> +
>>>       /*
>>>        * Applying lock for entire list op as xe_ttm_bo_destroy and 
>>> xe_bo_move_notify
>>>        * also checks and deletes bo entry from user fault list.
>>> @@ -550,6 +553,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>         xe_pxp_pm_resume(xe->pxp);
>>>   +    if (xe->d3cold.allowed)
>>> +        xe_late_bind_fw_load(&xe->late_bind);
>>> +
>>>   out:
>>>       xe_rpm_lockmap_release(xe);
>>>       xe_pm_write_callback_task(xe, NULL);
>>

