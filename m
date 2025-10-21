Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F5ABF9166
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B25710E659;
	Tue, 21 Oct 2025 22:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ie+o680b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C17310E65B;
 Tue, 21 Oct 2025 22:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086595; x=1792622595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2wt9CX3R6z/ATg5cjFng0eCZWP0pM52Eeruk7dNw9II=;
 b=ie+o680bQ5cmjbnZHmZ6vXebr54c9ZzVMAjFfke51DsDgQZqvdY0ShOg
 bV1bm06IJD/0rOPKdjRpeLQomdO4ZZvuyRHL/XjSvLCkEUNzyIXkUla/H
 FwYSQMdU6MEujJyvpYP3SRxVHBdK77aVq0J521sKaAc17QplrNi2esxRQ
 xl6Cs80jX6i2Ojn94QJZhdmfMG+0fOz7SAwXu901g9SgSHnfgglji7gN4
 PivgLXVAqFx4EFRmw2iMipciRelAv/mCw6fmzeDvfBpNoYR4qqDpeGaUy
 BWwlh/CHXvVBClQw9p6f5ngqXOPRSnIZgbH/9yFruywiCF3Jpd7yMdhHJ A==;
X-CSE-ConnectionGUID: SMAs154NT7WM/cLQr+dzAw==
X-CSE-MsgGUID: JLDzGM74Tj+2PsKZLbMfkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74663011"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="74663011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:15 -0700
X-CSE-ConnectionGUID: QtbGdUq4RqOGwVUuCvKyAg==
X-CSE-MsgGUID: 8ilQVeaTQaOs5OKRvH296g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188988634"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:43:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGQr3DgaX6miTDrQyLNY2yPxDdGeFzFVEmW0dUkqXMLAiG94vxkefbqEXjJXQRjrWSwRN7/qX9c+8Y3V+WkRR6slOl5x2vLm7MvzFKw8kDlIUWhKaYypuZ94jqZ1FLu4Obl4jrO+brl7eJTjrBU3LWB7hB1mf4LHkq9SZn8vnoXraDjX+DlDeuae/Tznk4fHEsDN1ZfpF4DfVHHbWGML0vRv1LA8yTNvCQ8aOj2QUeytF2AQSQ1NPWV3t0IN3J63aj01i25a8ZJWUzFdNNtv1Vb2yHYW5zttbiuwySwvoKmeWrCV4q9fZcmyE61wZlIFDBosuvsZLzUWgrghLbV5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkAU6c4Gz+NnBk8Sool5TZa0ZRdaZzJTynRvgNy4qu4=;
 b=D1e3nr8YrUN8FXCvbESApMSkyPwBbFRJxgbn6VzxNmO0cUIPkd7fyaH7rTzMy0AvpKgoCRH4GLtW4FAK6pW/Qzj+/mv8l56gvJfiPA1G4KaEgfgMttW3xsrtuDHVd7iQkypCn3/12DOG+iFQ8rpBO06Nffz/LcbwnoeAN7h966pRUYbmFaz9XpBTPq+RKL+yBDVcVba4x6LOUXScCBcPkA0/5hDqCbTinPPaAbPzUT9xaQdFDtv35DJFFAqRvIK5fWSlCwzpuGzGcf0lo1S9KLl7i2d79h2teVGfs3SR1e6kU6PDC0YUEAjsJmsAPvHFSPhZdVBZnixa/g9ECoqbdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:43:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:43:11 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 13/26] drm/xe/pf: Don't save GuC VF migration data on pause
Date: Wed, 22 Oct 2025 00:41:20 +0200
Message-ID: <20251021224133.577765-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f604dcd-3291-445a-382c-08de10f33691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTZTT2FxSkJhbUZxYjBNbURpYzVSckU5bVVnandycS9yTG9OWEYwL05nYmRG?=
 =?utf-8?B?TVVmTmJGWjFBVkZHYlA0WWx2MUVXdWQ5WHU2aDM3NHRvRzhNU0ZPclBKSzBP?=
 =?utf-8?B?K3ZLZzZJZkQ1anUzbHZTZ2pIcnF2L25ieS9GWUVTdDMxU3dNMDM3Z2NWek53?=
 =?utf-8?B?ZWgxdklsQTJmNnNBY0V5WnFiT25EWnZWeEtuZkVmMzI4R3VndDlxa3pOQ3Ry?=
 =?utf-8?B?SWJYMnZoeHd6SUJLdUdTUG9nMWc2THpPZlR6Z3dQbVBtQUh2Y1R1SGFTZlFO?=
 =?utf-8?B?Rml6N01CS1MyYUh6Y1pvTmVOVjBURkNlMGl3NkNIdkRrQXZDT29qdXJVTDc0?=
 =?utf-8?B?c3Y1ejgyT1V6OHdMRmljdVdDSkpONC9aTlN3cXR5YzFLK3ozQUF3aFdIclZv?=
 =?utf-8?B?YURBSkFDanZIcFFLV3ZZK1NxZ0JuT0JTVkJzRS9LU3FPKzVVTi91dUptMUo3?=
 =?utf-8?B?SVpxUnhxVEhDUnh2TWlBdmduemkzTmdVemVNNTFiQWN1dlVyR3dnVnNsNFo1?=
 =?utf-8?B?MFdKT3BKem03WDQ2Zy9jdmpMYUZLL3ZCUjdsOHNoangxN1J3R1Z3K2xob1RI?=
 =?utf-8?B?cnB1dzU1Qm1vT3NnTnVoWkNRbTB3S3JnbVdmRmNtNTVLRzErbTdwYW1CWlR4?=
 =?utf-8?B?Q3VkVFM3RWZhL3NYY2NTbnVyU0RsSnVKK0NPN3NGMnl1enN6V0twaTM1SXk5?=
 =?utf-8?B?VzlpQUp3ZjlzUmJ2UGVsYW9VT2pJdEVuZHNCNEdSV1FyRW9wN0J1bXhnd1BO?=
 =?utf-8?B?REtNVDBqb3RGbzMralk3aGZsR21pb1dJMThQMFVWR082NGQ3VUxtY1YxZFp3?=
 =?utf-8?B?enJHbXRoaVBYUTN5SUtnWk9BZ3FrdFF1K0Jac2E4Y3MyN3NxMEh1ZjczZjlK?=
 =?utf-8?B?VEJHL2tYdGlWMUN5MFp5QXBOOGs2RmFxb2EvYThIVGJPZVZsa1BkdlFHS1Ey?=
 =?utf-8?B?RHhQb2NCSTZlWW1hRktQemdkYmVRZjRhYkpjWlVCR3R0YzduNlhSLzFZM0Zl?=
 =?utf-8?B?QzIrVi9KTGdyTXZaUDFVVWU4T0crRDlqYUJlSnEzWmFBK2c0NnJjSXFjZ3hM?=
 =?utf-8?B?TTdXYW5Cb1NaVDJCMzE1b3ljWUFzUDN0WXUxSFBBNTdnRFlzQi9wcGVFL3dW?=
 =?utf-8?B?WmdUQlhSQU9ucUxodCtLQWpZU1pVdk9MeWdja2hDQWgyMXB1YVlNZVlnMEtE?=
 =?utf-8?B?NVYyTGVCRkFNd05MSjM2VWNMUFpra2tSQWx1TnNZaFBQMXB6bVAxNEZMZ2d6?=
 =?utf-8?B?bGlBR3FkWHc1eWs2MWdXcmkvNHJaeXh0eGRteUZKSThieTZWanZDTG9TVUFv?=
 =?utf-8?B?QWhDVTh0bGJkM1IwWVJ3VVpaNFF5Sy93ai9KM1M1amQ0aDFjSDV1NzhkZlMv?=
 =?utf-8?B?SWRYYldMMElwMitJN2NWd1hjK2ZVZW5JdE9BSWVJWFlNTm1vWkRIRGNOT1Ns?=
 =?utf-8?B?djdiNlAxWDl0RVQxY0hOTFVDREYyOTVwK2c5Y2tCWVF5VVVOVWNBYzlaTTcx?=
 =?utf-8?B?WVlqeitaL0ZueFR2TTJ6WXc2UURzak9FQjhOcll6ZWtNdTY1bElrWXNnTXNj?=
 =?utf-8?B?UXdNd3EvRmVhdWJiRVBlY1V4SFIvVTJ6YW1haEgwTFp2T0F3NFNtYVVVS291?=
 =?utf-8?B?bEwrUk9MdHlWaHpwSDR6cldVNSs3cllsQXhQK2Z0TkdHc2tlM1JtNWxheGhL?=
 =?utf-8?B?ZWNGSFB0STAxd2owQnBCbFE4djFIYzE0TWMyRGdmanhIOEgzQVFFVmZYbHRl?=
 =?utf-8?B?aG1TaEdKOGFvZ1ZuYVFlWlRRelY2Y3o1UnVjOXVjQ3VvWWEvQ1BXbGFnWVNO?=
 =?utf-8?B?bGcyQ2gxVW1pbXdHRVRVaXdkL1l4OTl2REszSWt0eGVCamRienpMQ0VwTmEw?=
 =?utf-8?B?cFBCUlRlQWpkejF6c1NuVkY3NS9DWGs4QzhjK1IyZE94QWZudFFNaXJMbVJJ?=
 =?utf-8?B?a2tQbEpiclRWZXFXS0lvK0FzVXRHV2dydC9JRnZmbmFIWGsvLzZIZEN4VDNj?=
 =?utf-8?Q?/LlCHUKkcenqy4M683p1dLlFI6gPK4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0RWa0x1cklwajBnamhZTk9ITW1VWXVQcWYyU1k2STBxQnJWdlJBZ3p5TEZk?=
 =?utf-8?B?b0JaYWM4U3N5M08xaVdTTXBUZGFVMVVPdGxBL0R2U3c0TWk3eUxJWGNKQ2w1?=
 =?utf-8?B?MWtpbnpmdmRicU1oNGpZSG83bk1BZ3VEU2NhRHN2OWJ5OGNtWGZ6czlNVG1Z?=
 =?utf-8?B?cEY3SktBV1dVODQ1TnFjMWl2RlN4WC9OU2NZdEZWZGdoT0tNNnN5bFZPZUhD?=
 =?utf-8?B?ZjJFOTNQeXNSQ1hHUzRaR0dKQU96NzF5WnlqdlZRZ3ZVTUJXcFNqb3ZUeWlo?=
 =?utf-8?B?d0ZBaVNycWlLOGRSRmxZY3cxTXUxcVZrRHZhbnhwd2w5NkNZQ1NMd1htdlVl?=
 =?utf-8?B?VkZnTm53elE0TUJ2K1Bva0d2Z01WTm9GMVVrS3YvS0pyU3dIM3dEVTl6bWZE?=
 =?utf-8?B?dFJFOGZoQ0Z1czdPWUUwekJpN2FQTU5LOEtLZC93VkhTYUZPOGVtblpaTjQ4?=
 =?utf-8?B?Sm8xa2NicEpBNmZwOFIydXUvSkpDTWYyTkxXZ1lYZGNuVVBnRUIvNlQzRyt3?=
 =?utf-8?B?UktDQ1lmZnVpL3IvaHloSnY3QjR1QTBEUEJpbDd5TzVVNEJSWm5LbGp0bTh4?=
 =?utf-8?B?ekkvYStHRjVMV2pvRkZrTTd2Q21aOU5YNm5kdUFDblE4V2kzVFA1enpCc2tH?=
 =?utf-8?B?YTZhL3BIcUxSbStZN09IR2ZVK2NZQW80NlViell2Z1FHUnk4ZThPM21IMERm?=
 =?utf-8?B?QzBHaEl6SjloV1lJYVRpdGRyMHhxbWl5NEtuWngrMVhpLzAzTFBBUXBqS2Jw?=
 =?utf-8?B?S1lmdm0zOTJjTXRIOFRqWG1oVDFUT0UvYTNLWkxLcExYNVhRR2djeFJQdjVI?=
 =?utf-8?B?YjhTM0JGU0J5ZFlwMnlDOXNVdStHc0tweDNjeWpBUWlxUXkvTGRnZ1Zqc2JJ?=
 =?utf-8?B?MDRRV0N2OGRlVzNnZm9odUZVKzYyQTJHcEI5MWF6bXd3UWhRYmxsellqd3Rx?=
 =?utf-8?B?aThHblF6dkdGVVdZQ2pwS0pPSW1PS21FUkJucjdZY2k0eWVkbk5wTXUrQUVZ?=
 =?utf-8?B?ZVg5V2tuN3RuemlVcUpOUDAycTZiVXJHY0YzNmtnNGF4bnQxRmtjQWJESXNH?=
 =?utf-8?B?Z21YQUhCUHRTb1pwV3E0Yzh1SUVjODM5eWNDeVVrWmRjbm9vRmpPMUZDbmdR?=
 =?utf-8?B?aDRKSXg2elZRbThveFpQUitCM0IwYVVpWUkvdHl5ZDRoMCtuYktlWVV6UnMx?=
 =?utf-8?B?TmZwVXRGRUZmZ2l2VGJHb0hlelMwSFR6M0lHcFVwRUJ6Qy9mQnQrN0c3dG85?=
 =?utf-8?B?amhQQWQ1TmprNFRzRjRURGo3Si9vS1BRMW4rdDgyUWEwWkVsQk5EZkd3NldV?=
 =?utf-8?B?VGRMdVo5VnFMRFdEckhoak1rYy91MGk0UWs5ZzZHUndNRUdtV2NqTm5ZSC9Q?=
 =?utf-8?B?YzVObnV1US84QitKSnBpdEltcUw2Vmk2dURkRzJxa1U5dERDWGl2WGVwRGtv?=
 =?utf-8?B?cFNnY1hDaXh3S0ZlWSt0OUd2NVgwbk1haEhpaXJETW9tcnk3dmZZWkxMbUtC?=
 =?utf-8?B?M2dNSnlxb3ZUMXltUkRYck1GdVc5RUtMa3NOVG00QVd4SmZiUlY2em5hYXlQ?=
 =?utf-8?B?THJqSW1TV0tzb09wMnhxQWtWZ0FPTU82U2I1UHZjQ0ZWZXQ0Sm9MaWwrcHh2?=
 =?utf-8?B?cTEvSHVVUE1MTmR0aHpnT3N1UDdacjlXYU9CVUFNWTJPV1ZOMEx1MjFFK0Ra?=
 =?utf-8?B?eEdCWUF6V3F5eTZvNTFjZnhhNkNhVUp6Y3c4WDRiSkZJZlB0alpJbWt1STlx?=
 =?utf-8?B?MXZNVGpMQjI5Y0JvVW5YUG1MWG1MNk5sK0VSMXZxaTVYR3RvaStlZ0xOUXZK?=
 =?utf-8?B?V2hyUjU1MGZSMXdnclhOTzJFUW9SWmhYd0hBU3picmxSSU16VWR4ek9YRS80?=
 =?utf-8?B?Sy9meXVqT2t3NVlnN2JpVkxBM0hWcUVKcmZWWHZwNzdnWjI5V2dCdFpjZmhv?=
 =?utf-8?B?Y3NsWWxKWkNjL2ZzKzVxUjdiT2hCUUFFUk1hZm9heTFrY3ppSXpoOEJDRy9h?=
 =?utf-8?B?eWJJSURwSjVDTHBjZlZqM3F6TG90RnVaeGQ5dkJUNU0ybmFBZGNHYjBCTS9Q?=
 =?utf-8?B?ZWpJZmdRYjhOVG5IbitZUllFcXlmbVNaNGhnZW9aRExRcXQvWGQ3cXBsQnRW?=
 =?utf-8?B?NjdPNzRhdlNZcUZ1UFdWdEhMdUF4ay94bitMajBoQTR0Smg1UUg4cUlPbi9N?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f604dcd-3291-445a-382c-08de10f33691
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:43:11.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdw2Rx97TDNL1Rgs0KWCm3J5p91x/2RbCmcrzGUBQTNKCJrM1ARibNE8rf9h6VLXJBB8ADG/2bNp3hQZuzN1RsR935QacXQVPL5xaCq1Z4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Remove it from PAUSE state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 39 +------------------
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 -
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index dd9bc9c99f78c..c159f35adcbe7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -183,7 +183,6 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SEND_PAUSE);
 	CASE2STR(PAUSE_WAIT_GUC);
 	CASE2STR(PAUSE_GUC_DONE);
-	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
@@ -453,8 +452,7 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
  *	:       PAUSE_GUC_DONE                          o-----restart
  *	:        |                                      :
  *	:        |   o---<--busy                        :
- *	:        v  /         /                         :
- *	:       PAUSE_SAVE_GUC                          :
+ *	:       /                                       :
  *	:      /                                        :
  *	:     /                                         :
  *	:....o..............o...............o...........:
@@ -474,7 +472,6 @@ static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
-		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC);
 	}
 }
 
@@ -505,41 +502,12 @@ static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
 	pf_enter_vf_pause_failed(gt, vfid);
 }
 
-static void pf_enter_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		pf_enter_vf_state_machine_bug(gt, vfid);
-}
-
-static bool pf_exit_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	int err;
-
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		return false;
-
-	err = xe_gt_sriov_pf_migration_save_guc_state(gt, vfid);
-	if (err) {
-		/* retry if busy */
-		if (err == -EBUSY) {
-			pf_enter_vf_pause_save_guc(gt, vfid);
-			return true;
-		}
-		/* give up on error */
-		if (err == -EIO)
-			pf_enter_vf_mismatch(gt, vfid);
-	}
-
-	pf_enter_vf_pause_completed(gt, vfid);
-	return true;
-}
-
 static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
 		return false;
 
-	pf_enter_vf_pause_save_guc(gt, vfid);
+	pf_enter_vf_pause_completed(gt, vfid);
 	return true;
 }
 
@@ -1928,9 +1896,6 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_guc_done(gt, vfid))
 		return true;
 
-	if (pf_exit_vf_pause_save_guc(gt, vfid))
-		return true;
-
 	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
 		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
 					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 6e19a8ea88f0b..35ceb2ff62110 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -28,7 +28,6 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
  * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
- * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
@@ -71,7 +70,6 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
 	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
-	XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
-- 
2.50.1

