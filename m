Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98331C363CC
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F4910E783;
	Wed,  5 Nov 2025 15:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5xvFxD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8531310E783;
 Wed,  5 Nov 2025 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355472; x=1793891472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rMy5E5r+Nd+iuypfK54DFoohWplb6zFMBaXKjFRBhpo=;
 b=R5xvFxD3cBqBWgsV0x7C2YxSBoupL5GMyct9I0uLu9cT/sGzu9jcW4Ep
 5HuxH9lnWOIrsS7LUm36e1wBf0rPgHCNka39Iy0SAKfRBlvI56VA7UCUN
 jTlYggm6EF5XQXAbHcMDKsmQNNk1EaxZwnLl8F/ZYswpYKh0Zk0HGzFlU
 eyeVofrooBfqdVqEsNxSMpcuJQrih/ngA8JH/T6zlQ47QyF/1MX9dud3L
 KJWftVAYfG8bSppM6hahgVqDPdPrWiWtkc7fve1gxuZgWBsdt0sj4zgDl
 xGWbUA+Hj2byJUTYdOH+n3uSSK/7Cn3hdIlQih9bADa27HkWJVxAaQAMt g==;
X-CSE-ConnectionGUID: Nu4r0NHGSxGvrO9zMxADKQ==
X-CSE-MsgGUID: 6GMxguAxT7m0tkYrYTwcWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68331146"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="68331146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:12 -0800
X-CSE-ConnectionGUID: 5vT7RyVRS7+wzJ+Wp5Mv9w==
X-CSE-MsgGUID: oD4jg558SV+3tZhhxcdAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="210957089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:11 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdiRgEMrjV1tN0oIECeN7NDQMKoaZqHKAAtoHiylbXcLJIQvQuv6fMBltNWE3QuRqCsVzqvlUizLUnKXQRplVBfkMDX02DZt/MILjF0HB9Xkhe1P4fQKvAV8apy1L7H7rEtTJzZGkfakXbLIEef4xwIBwFCRcHXgVLHx/Lk/nRQiudASUxZiYjbBuc53m1gfeUT5Li+qvSdB2ZKXEUWVZT2aToxLxGvAsvTyVhm3b2C1A5kCA5AGZvapuyT5pOlW4kasGEkz/wN4FyBiMFC3ClGYtryVW+fsw/Lp99Nu05rvHnFOh4GtRJri2JpnfhnFQJPEv4rMqwoTRFvt7ruZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQPlXmOo7juDdbaHD33ZgJjE8vTKzt4lmYGOUl7WHcQ=;
 b=Br1687dklb5zg6xSKs4NAvI+mjYizhzdqK0DhB8tCtBDV21hISCUNOnCrEqyLPhk4alTxgXUzlav7rrY+tG727pmQSM2firxky+IbvpypFoV9UDkXFA61TZTYErwNw/5XHt1F60MlZF1X4uDrB2fGKu0zI1njz6xccs8+FqEldTHemVKlgwmEXttBzXk18Hee8lKoYtISuzNcohkfxcqAPf6EoByDUuvldVNKdiipO1+fDfvlXpgjssEHwsxIBsFicZiaVpVTAhB1fDIfEHyvTNjDnb8wFATmCAuvG3vVAegv01m2Dzar5m93zG8x5c+lypLZQ7ARYpDolQzxhZUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:09 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 05/28] drm/xe/pf: Add data structures and handlers for
 migration rings
Date: Wed, 5 Nov 2025 16:10:03 +0100
Message-ID: <20251105151027.540712-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: d04aca56-0299-485b-6627-08de1c7d8c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFlNYTJkMFVMMW9aWlVLeThITFBZa3dBY2lKN1dtclpUZ01YQjZEc2dvZ1JI?=
 =?utf-8?B?dmxPZzhLM1RkV0lqZ0UwYUJGUjJBT2xiazhyUVhTd0djaTEwNmRJcDMxdmI0?=
 =?utf-8?B?Vk00VkorWTJrMzZscytqbjBPOUEwTXNkZ2xFOUxvakNaMkJNSzMzVS80bU80?=
 =?utf-8?B?UmpXVkE2bldrS2JpY21idHRZZDZMa2srOE9zMUJFSndwRjFZSENWV0xRd2V0?=
 =?utf-8?B?bWNqenRVVlZxYmhvT0hwQ0R6dG1kTVFsb0Y2a002S1diWVFpZW1KMGtrdXNN?=
 =?utf-8?B?NVBzQ0JKMjVId3VGZUlZb1dXS3JxdWFLcUc0WGNaZlBKVkxOREFjTlY5K2Q0?=
 =?utf-8?B?dlhBZlB1MWlRc2Y5K0w0UUhzMU1mNkxGS01NdjBvb2FPRWhvdG1YdWl6ZkhI?=
 =?utf-8?B?a05tdlUxZVlCd3VQQys5MEt6d1JiWFh0UXY2QjlhSzBwc3NmS21lTW1wNWZQ?=
 =?utf-8?B?Qk9HZGI0RnYyL0FuN2dtRlMvRVdSL0VJS1ZDelJaY2NNM25RUDU5TlE1clMz?=
 =?utf-8?B?UlBFeFY0L1hQSURCNjUrVERmaWRwcWZYWG51MmtTRWg0K1pEb05LWFJmSkpD?=
 =?utf-8?B?TEFXd0pLVHM5QU9QVFBzV1lCZXpxOC8ydTdLVHdoalZUSHZUY3hVU0x2MEdh?=
 =?utf-8?B?M25sQWpjS21kaXB4dGV3cU5RTmpjaS81RXhhRUhTbEVqTnVTUEpEVWhoRWtj?=
 =?utf-8?B?WkdoV1VCU2xhTUpsS2JsRXgzeWwrWFAxcUV5bEYzSXg1Z2xLNGNTSmVXY0g2?=
 =?utf-8?B?eXJzM09lK2ZlQ3ZMaGxYcnZTd2ZrZXdsN1h3Z0NCTGRPK0FVNjEzQm9XODhX?=
 =?utf-8?B?dHhPNWhvZWpTTmZyZWNabmcwNDdqcHZweStpaSs3Ujc2Z1d4QW1vNC9ZazI5?=
 =?utf-8?B?ZXJiRWtTOTNEZm5yYU5ZSVNsYTZ1dmMzZ09RczdKaU9WYmJ1TFVHbUFnSGcw?=
 =?utf-8?B?cksvdG9iSzNJUk1HT2lTMzBKejFYRUU4TGxpN0tXcjNFbUdkb2dlbHRrR0Fr?=
 =?utf-8?B?RVVReGd6QURUcXM0WHprVDFHWFBwVTBvbnVkdUhHMkdMdGhXVlJZdVFxZGkz?=
 =?utf-8?B?MTRxbWdYQ1BTQjFHdFdERmJEblgyYm9ySzllQmRIM0k1RVlmdEc4RXd4RDRu?=
 =?utf-8?B?VzhvS0RIa0JMcUQzYmNnUmY4M0xKZ25laGx6T3R3eXMwemUxeVI4ZWNOazhM?=
 =?utf-8?B?OGh1OTdhYVdYN1lZVklHb3p1STZpSHF3eHZOT0thMFJjSWNIbTFuVjRhQlAr?=
 =?utf-8?B?RU4rcUVRT2N6MElEaS91U0d5U05IcGNqY2pBVTc1bFluYVlBMGlFZU1GWFNo?=
 =?utf-8?B?a3EyRDF5MFppc09tVzI5ZkJkTkFoZjY0VmpHUzY0S2dGQnE3bnJEaHpsbWhm?=
 =?utf-8?B?Kzl4aTdRRmlzemdIb04wbTB3RURjSWdNbHZMVjYzSW1UM2VFU0RZL05IYVRw?=
 =?utf-8?B?UVRUN1l4YlhWRGd0Z0RQKzZRL1B0TzBIK293L2dkMEx2SW9YemlOOEVhMDhX?=
 =?utf-8?B?M2JCVUI2aXozNGdqakdTZmdlUFNmTjRCbWpyUFZuTHhMQktCRWx5WGFmSWRW?=
 =?utf-8?B?b3VuK1dBSm90c0JtRXJkUkY1N0NkUEpsY05DSjdYTVVybkRkTE5jdlN6V1dU?=
 =?utf-8?B?YUR2bGhrVU5ibXFodEFwS2VQOXZUMWpzQUVnQkpzcVp6UGVreGtUbFNwZThD?=
 =?utf-8?B?UTE5UmI5K2NiTElDZGhnNWFHdFVRZUNTL0JvYmloamwvbTJyR2FTSFRqR3Ar?=
 =?utf-8?B?RktqY1VVUCs3SlIwVUM1TWJDbzQ4V3EwY1dFMVp1VlhNV3hpaGtXcmYxOGZD?=
 =?utf-8?B?RVFsYVI5WElsRHhmQ1BKUkNFVnNIcUFwY01NZVZDYW1SUVFsZkZGeEFpOUF4?=
 =?utf-8?B?QzRxbjhxMjVCUHRJZW1CZWc2TFdKYTh5aXdDWk5RdnVBcEJDdll6U3JSNXJQ?=
 =?utf-8?B?V1ZKU1ZmRXJJTCtuWlp4OTBHTVRWVkxMUFptNW04VGdXYlVjQ2Zmb1BSbjFQ?=
 =?utf-8?Q?enIcU8vHMJq+wr7sH7OHf8GbpgntZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDlHQ0sxMkpYVFEzOEFEMjJ2TWlybzE5cW91SXJIc0NYQlpKS2JIZWw3U0Vi?=
 =?utf-8?B?enFFd1ExTTMwU21oZklIbHBUQWVOTmtYZ2ttZktqUElaVG1oZHZHbHlvUHFz?=
 =?utf-8?B?d0NGbURHeXRDT1BCVTVteHpFRDU4T29IOG43S1dPWTZRZXdxSGd1RkcxbXVF?=
 =?utf-8?B?WW1HcDl5OUZDSFcySExza21qc0xNOTRsVVRkbTIzWlA2cFI4ZXBBSzlXT004?=
 =?utf-8?B?VytuQ1g2Q0UwWHZ6SWxDNzhvSTAxZlh3MDBJYnhjY0R2Tm5KN2FjK3FsRFZz?=
 =?utf-8?B?SUkrVFFDUUpWV1RnejEvQ2xVRDFmRmNScjYxdGlMTkg5MHd5WWp0UmhPT1Nw?=
 =?utf-8?B?M0JGSEM1NlNFUHNwSGQ5UVpFZy96bTJCVjQwYmlKRWlBL05vRm0wWjFTRGxo?=
 =?utf-8?B?Wm9YblVPYmN4L2NKNzdIL3EzMVd2Y2RLdk5CMFNCcXc3WGUvRFNJTzNpY0JP?=
 =?utf-8?B?ZGxhanU0dlJhaERqcyt0dXhlSk1BS0RnbTlsSjdEYzJLaWhTekpwS0F0NzN1?=
 =?utf-8?B?MDdnQzN5ME0xTTJKQTVZVlk3RFluL3IyMU03alpPekgvdUNzQjZYWjlDOUJD?=
 =?utf-8?B?R2wvc0dTYjNPWjc0TEU4QUF2eDBFUXoyRStLenRmU3Vka2lXYVlzbHVEMW0v?=
 =?utf-8?B?czEzaXJ3YU9LVElpbkJ1dTVwaWU4MWFVNGpIVlBlRUpiUFVLcXFDRm0zaysv?=
 =?utf-8?B?N0ltaFZXTUVvZ09YVVpyOWx6WHNYWEE0aytiUFJWY3FEcUVRc3B0dmx2dzZn?=
 =?utf-8?B?Zm45T1dkNGxJUlNyUXVvYktPSG1LODZFdzQveHM3S0hyUXNiVmVaZnlUTnN1?=
 =?utf-8?B?MnRnYnhMc3hCWUxIdHFMczYwTjNxK0hEWEs4eDE3RHFmc3JjcksrM2R1MWRj?=
 =?utf-8?B?NldrSk9EcHUxOFJIVU1ZM3NGd0dGUTl5ZVE5a0FXdEplUU55eG9vNlBsM2ly?=
 =?utf-8?B?eUdUNWFZTUNadGxQL0hZMW5yem9LY09OMEMyVTJIcmRFalZUd004dE9rQnl5?=
 =?utf-8?B?SVB5TW5PTmpuUitodStWbmMvdDdIQThmbHNrTGhGU2xNcXMxTTNyOU5qU1Jr?=
 =?utf-8?B?MDNhakN5SHFldFQ5dE9IRXdHbk5QcURSM1l3c2dXSURQM04yQ1EwWDc0RTVZ?=
 =?utf-8?B?a1BTbVd2UTMxakJYNFRQWmlFWEs0cU1EQWpTRHBRQVJiTzlDbGZDdkowaFFk?=
 =?utf-8?B?YWl0aXdTVFNkOVIzVC9rcmRUWng5cmhkdUo4UmtPYmhOa3NUTGxZQUNFM0JU?=
 =?utf-8?B?S0FGcnBQc2R4QkRyUGM2OUhsUVl6UjgzU2NtT3FTbG5GOVdjdkFnek1EU1BF?=
 =?utf-8?B?USsySWZ6UUI1M1FVNlRwSFVvaCthRkkvME5UbkNKVjV0cDVtLzhsUWtrYUJy?=
 =?utf-8?B?UVVZK1RnM3AxaHJSVjBDcHpsVEtjUUtlRmhmSFBYMGtaWGtoNWpjbWJWbDJi?=
 =?utf-8?B?QmErNXNRaFBocFBNTEFHVGlOakZRSE1PaTUyamw2THR6RGV4b0xEeTFwZlhN?=
 =?utf-8?B?T2xiQ3ovSjcxNWw5aFZyVGd6L3RaQmY5K00wVVpQUDQ3SDRtWEJKT1E1K2FL?=
 =?utf-8?B?Y01mcTZvVFlUQTM2SEJBSk5nRnJJQ3A2bHcvQVpvUUJzOThRemdYNFpFY01N?=
 =?utf-8?B?b2tuK1N2TENMVWlPaGVOQ3pMb1drclZSaVF6RFpvUGtUellISEc4RTZoOFhr?=
 =?utf-8?B?UnBmbWFwaCtZdHhuM3JTNVVsMjlWYVA4Y0pqMmZQKy9YRmxycm1hMTY0VE1y?=
 =?utf-8?B?UGhqMzBEV1VMRlVLR2RjSS9HR3hiSk44eW9xclo4SHB5TkN4NUFSU0ZQbGlQ?=
 =?utf-8?B?dlA3eGo1OHBwdlVseEtrREZYODAwRTFhRGszVEJrZUg3V3NNTkUvVWF6Q1RC?=
 =?utf-8?B?WUg3UjhhemNKMHdJdlEwTUZ6VS85d3k1NXlWZmNHNVFONG54b0Mwb2ExOXls?=
 =?utf-8?B?Tms5ajhlbnh2NjVaamVtVTNOemVtd0pXL2xIaVVqQjFhKy9NZ3BNYUFXOHU4?=
 =?utf-8?B?K2tydk5FdVA0eS9OY2Flc1hvbTJVRXI2VXlTb1NiT2xyTlJ3V25qbVVkOU9m?=
 =?utf-8?B?b09SaFNoV0F3Umh3UkJRVFErYzVHV0VUc1ZsRzRURnRoN1hMaUdpbzRoSzhS?=
 =?utf-8?B?UGl3NUJHMTRoa1Mzam42a3d6U3hZc3U5anVRckY3OVpDTjF5UGZDV01GRVky?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d04aca56-0299-485b-6627-08de1c7d8c3f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:09.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG8WhmXD8MBPk2FfqdHYuR8Av5+ECa5QrR1wm7nIxEPPVfHIOEzxUj/Y7XoV6pZquFRcmMXcPu7FjUY+9LHxtv8QAonngLdYjRYVD5R6MfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

Migration data is queued in a per-GT ptr_ring to decouple the worker
responsible for handling the data transfer from the .read() and .write()
syscalls.
Add the data structures and handlers that will be used in future
commits.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 310 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 199 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 143 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  47 +++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   2 +
 11 files changed, 741 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index a571e1c02a3b4..db57f9d9b491f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -19,6 +19,7 @@
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_tile.h"
 
@@ -185,9 +186,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_PROCESS_DATA);
+	CASE2STR(SAVE_WAIT_DATA);
+	CASE2STR(SAVE_DATA_DONE);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
 	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_PROCESS_DATA);
+	CASE2STR(RESTORE_WAIT_DATA);
+	CASE2STR(RESTORE_DATA_DONE);
 	CASE2STR(RESTORE_FAILED);
 	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
@@ -804,9 +811,51 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+/**
+ * DOC: The VF SAVE state machine
+ *
+ * SAVE extends the PAUSED state.
+ *
+ * The VF SAVE state machine looks like::
+ *
+ *  ....PAUSED....................................................
+ *  :                                                            :
+ *  :     (O)<---------o                                         :
+ *  :      |            \                                        :
+ *  :    save          (SAVED)    (SAVE_FAILED)                  :
+ *  :      |               ^           ^                         :
+ *  :      |               |           |                         :
+ *  :  ....V...............o...........o......SAVE_WIP.........  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |             empty         |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |           DATA_DONE       |                      :  :
+ *  :  :   |               ^           |                      :  :
+ *  :  :   |               |        error                     :  :
+ *  :  :   |            no_data       /                       :  :
+ *  :  :   |              /          /                        :  :
+ *  :  :   |             /          /                         :  :
+ *  :  :   |            /          /                          :  :
+ *  :  :   o---------->PROCESS_DATA<----consume               :  :
+ *  :  :                \                      \              :  :
+ *  :  :                 \                      \             :  :
+ *  :  :                  \                      \            :  :
+ *  :  :                   ring_full----->WAIT_DATA           :  :
+ *  :  :                                                      :  :
+ *  :  :......................................................:  :
+ *  :............................................................:
+ *
+ * For the full state machine view, see `The VF state machine`_.
+ */
+
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
-	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+	}
 }
 
 static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
@@ -821,20 +870,58 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_wip(gt, vfid);
 }
 
+static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
+
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
+{
+	return 0;
+}
+
 static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+	int ret;
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
 		return false;
 
-	pf_enter_vf_saved(gt, vfid);
+	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+		return true;
+	}
+
+	ret = pf_handle_vf_save_data(gt, vfid);
+	if (ret == -EAGAIN)
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+	else if (ret)
+		pf_enter_vf_save_failed(gt, vfid);
+	else
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
 
 	return true;
 }
 
+static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
+		return;
+
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+	pf_queue_vf(gt, vfid);
+}
+
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
 		pf_enter_vf_wip(gt, vfid);
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -842,6 +929,53 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 	return false;
 }
 
+/**
+ * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: true if all migration data was produced, false otherwise.
+ */
+bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+}
+
+/**
+ * xe_gt_sriov_pf_control_check_save_failed() - Check if save processing has failed.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: true if save processing failed, false otherwise.
+ */
+bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+}
+
+/**
+ * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
+		return -EIO;
+
+	pf_exit_vf_save_wait_data(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
  * @gt: the &xe_gt
@@ -887,19 +1021,63 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
  */
 int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
-		pf_enter_vf_mismatch(gt, vfid);
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
+		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
 		return -EIO;
 	}
 
 	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+	pf_enter_vf_saved(gt, vfid);
 
 	return 0;
 }
 
+/**
+ * DOC: The VF RESTORE state machine
+ *
+ * RESTORE extends the PAUSED state.
+ *
+ * The VF RESTORE state machine looks like::
+ *
+ *  ....PAUSED....................................................
+ *  :                                                            :
+ *  :     (O)<---------o                                         :
+ *  :      |            \                                        :
+ *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
+ *  :      |               ^           ^                         :
+ *  :      |               |           |                         :
+ *  :  ....V...............o...........o......RESTORE_WIP......  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |             empty         |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |               |           |                      :  :
+ *  :  :   |           DATA_DONE       |                      :  :
+ *  :  :   |               ^           |                      :  :
+ *  :  :   |               |        error                     :  :
+ *  :  :   |           trailer        /                       :  :
+ *  :  :   |              /          /                        :  :
+ *  :  :   |             /          /                         :  :
+ *  :  :   |            /          /                          :  :
+ *  :  :   o---------->PROCESS_DATA<----produce               :  :
+ *  :  :                \                      \              :  :
+ *  :  :                 \                      \             :  :
+ *  :  :                  \                      \            :  :
+ *  :  :                   ring_empty---->WAIT_DATA           :  :
+ *  :  :                                                      :  :
+ *  :  :......................................................:  :
+ *  :............................................................:
+ *
+ * For the full state machine view, see `The VF state machine`_.
+ */
+
 static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
-	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
+	}
 }
 
 static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
@@ -914,20 +1092,64 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_wip(gt, vfid);
 }
 
+static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
+
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+
+	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+
+	return 0;
+}
+
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+	int ret;
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
 		return false;
 
-	pf_enter_vf_restored(gt, vfid);
+	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
+		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE))
+			pf_enter_vf_restored(gt, vfid);
+		else
+			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
+
+		return true;
+	}
+
+	ret = pf_handle_vf_restore_data(gt, vfid);
+	if (ret)
+		pf_enter_vf_restore_failed(gt, vfid);
+	else
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 
 	return true;
 }
 
+static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
+		return;
+
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
+	pf_queue_vf(gt, vfid);
+}
+
 static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
 		pf_enter_vf_wip(gt, vfid);
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -935,6 +1157,58 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 	return false;
 }
 
+/**
+ * xe_gt_sriov_pf_control_check_restore_failed() - Check if restore processing has failed.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: true if restore processing failed, false otherwise.
+ */
+bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
+}
+
+/**
+ * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
+		pf_enter_vf_state_machine_bug(gt, vfid);
+		return -EIO;
+	}
+
+	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	pf_exit_vf_restore_wait_data(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
  * @gt: the &xe_gt
@@ -1000,11 +1274,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
 {
 	int ret;
 
-	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
-		ret = pf_wait_vf_restore_done(gt, vfid);
-		if (ret)
-			return ret;
-	}
+	ret = pf_wait_vf_restore_done(gt, vfid);
+	if (ret)
+		return ret;
 
 	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
 		pf_enter_vf_mismatch(gt, vfid);
@@ -1705,9 +1977,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
+		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
+					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
+		return false;
+	}
+
 	if (pf_handle_vf_save(gt, vfid))
 		return true;
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
+		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
+					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
+		return false;
+	}
+
 	if (pf_handle_vf_restore(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 0286536375d17..c36c8767f3adc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -16,8 +16,14 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c0ce05818e24f..0bee910bdf07e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -32,9 +32,15 @@
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
+ * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
+ * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
  * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
  * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
  * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
+ * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
+ * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
  * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
  * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
@@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSED,
 
 	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
+	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
+	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
 
 	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
+	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
+	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
 	XE_GT_SRIOV_STATE_RESTORE_FAILED,
 	XE_GT_SRIOV_STATE_RESTORED,
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index ca28f45aaf481..d9ca9ea737dcc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,7 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
@@ -15,6 +16,17 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf_migration.h"
 
+#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
+
+static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return &gt->sriov.pf.vfs[vfid].migration;
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -382,6 +394,178 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Return: true if the ring is empty, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
+{
+	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Return: true if the ring is full, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
+{
+	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @data: the &xe_sriov_packet
+ *
+ * Called by the save migration data producer (PF SR-IOV Control worker) when
+ * processing migration data.
+ * Wakes up the save migration data consumer (userspace), that is potentially
+ * waiting for data when the ring was empty.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	int ret;
+
+	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
+	if (ret)
+		return ret;
+
+	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Called by the restore migration data consumer (PF SR-IOV Control worker) when
+ * processing migration data.
+ * Wakes up the restore migration data producer (userspace), that is
+ * potentially waiting to add more data when the ring is full.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *	   NULL if ring is empty.
+ */
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
+	struct xe_sriov_packet *data;
+
+	data = ptr_ring_consume(&migration->ring);
+	if (data)
+		wake_up_all(wq);
+
+	return data;
+}
+
+static bool pf_restore_data_ready(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid) ||
+	    !ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring))
+		return true;
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @data: the &xe_sriov_packet
+ *
+ * Called by the restore migration data producer (userspace) when processing
+ * migration data.
+ * If the ring is full, waits until there is space.
+ * Queues the restore migration data consumer (PF SR-IOV Control worker), that
+ * is potentially waiting for data when the ring was empty.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
+					     struct xe_sriov_packet *data)
+{
+	int ret;
+
+	xe_gt_assert(gt, data->tile == gt->tile->id);
+	xe_gt_assert(gt, data->gt == gt->info.id);
+
+	for (;;) {
+		if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid))
+			return -EIO;
+
+		ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
+		if (!ret)
+			break;
+
+		ret = wait_event_interruptible(*xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid),
+					       pf_restore_data_ready(gt, vfid));
+		if (ret)
+			return ret;
+	}
+
+	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * Called by the save migration data consumer (userspace) when
+ * processing migration data.
+ * Queues the save migration data producer (PF SR-IOV Control worker), that is
+ * potentially waiting to add more data when the ring is full.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *	   NULL if ring is empty and there's no more data available,
+ *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
+ */
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = ptr_ring_consume(&migration->ring);
+	if (data) {
+		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
+		if (ret)
+			return ERR_PTR(ret);
+
+		return data;
+	}
+
+	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
+		return NULL;
+
+	if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid))
+		return ERR_PTR(-EIO);
+
+	return ERR_PTR(-EAGAIN);
+}
+
+static void action_ring_cleanup(void *arg)
+{
+	struct ptr_ring *r = arg;
+
+	ptr_ring_cleanup(r, NULL);
+}
+
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -393,6 +577,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int n, totalvfs;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
@@ -404,5 +589,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 1; n <= totalvfs; n++) {
+		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
+
+		err = ptr_ring_init(&migration->ring,
+				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
+		if (err)
+			return err;
+
+		err = devm_add_action_or_reset(xe->drm.dev, action_ring_cleanup, &migration->ring);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 09faeae00ddbb..b29d34a835b71 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -9,11 +9,25 @@
 #include <linux/types.h>
 
 struct xe_gt;
+struct xe_sriov_packet;
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
+
+int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
+
+int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
+					     struct xe_sriov_packet *data);
+struct xe_sriov_packet *
+xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
+
 #ifdef CONFIG_DEBUG_FS
 ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
 						char __user *buf, size_t count, loff_t *pos);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9d672feac5f04..84be6fac16c8b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/mutex.h>
+#include <linux/ptr_ring.h>
 #include <linux/types.h>
 
 /**
@@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
 	} guc;
 };
 
+/**
+ * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
+ *
+ * Used by the PF driver to maintain per-VF migration data.
+ */
+struct xe_gt_sriov_migration_data {
+	/** @ring: queue containing VF save / restore migration data */
+	struct ptr_ring ring;
+};
+
 /**
  * struct xe_gt_sriov_pf_migration - GT-level data.
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index a64a6835ad656..812e74d3f8f80 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
 
 	/** @snapshot: snapshot of the VF state data */
 	struct xe_gt_sriov_state_snapshot snapshot;
+
+	/** @migration: per-VF migration data. */
+	struct xe_gt_sriov_migration_data migration;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 8c523c392f98b..ed44eda9418cc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -3,8 +3,36 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct xe_sriov_migration_state *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration;
+}
+
+/**
+ * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: pointer to the migration waitqueue.
+ */
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
+{
+	return &pf_pick_migration(xe, vfid)->wq;
+}
 
 /**
  * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
@@ -33,9 +61,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
  */
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
+	unsigned int n, totalvfs;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+	if (!xe_sriov_pf_migration_supported(xe))
+		return 0;
+
+	totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	for (n = 1; n <= totalvfs; n++) {
+		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
+
+		init_waitqueue_head(&migration->wq);
+	}
 
 	return 0;
 }
+
+static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid) ||
+		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid) ||
+		    !xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
+			return true;
+	}
+
+	return false;
+}
+
+static struct xe_sriov_packet *
+pf_migration_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	bool more_data = false;
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
+		if (data && PTR_ERR(data) != EAGAIN)
+			return data;
+		if (PTR_ERR(data) == -EAGAIN)
+			more_data = true;
+	}
+
+	if (!more_data)
+		return NULL;
+
+	return ERR_PTR(-EAGAIN);
+}
+
+/**
+ * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Called by the save migration data consumer (userspace) when
+ * processing migration data.
+ * If there is no migration data to process, wait until more data is available.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *	   NULL if ring is empty and no more migration data is expected,
+ *	   ERR_PTR value in case of error.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+struct xe_sriov_packet *
+xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	for (;;) {
+		data = pf_migration_consume(xe, vfid);
+		if (PTR_ERR(data) != -EAGAIN)
+			break;
+
+		ret = wait_event_interruptible(migration->wq,
+					       pf_migration_data_ready(xe, vfid));
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	return data;
+}
+
+/**
+ * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @data: Pointer to &xe_sriov_packet
+ *
+ * Called by the restore migration data producer (userspace) when processing
+ * migration data.
+ * If the underlying data structure is full, wait until there is space.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	struct xe_gt *gt;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	gt = xe_device_get_gt(xe, data->gt);
+	if (!gt || data->tile != gt->tile->id) {
+		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
+					 vfid, data->tile, data->gt);
+		return -EINVAL;
+	}
+
+	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index d2b4a24165438..d48ff2ecc2308 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -7,10 +7,17 @@
 #define _XE_SRIOV_PF_MIGRATION_H_
 
 #include <linux/types.h>
+#include <linux/wait.h>
 
 struct xe_device;
+struct xe_sriov_packet;
 
 int xe_sriov_pf_migration_init(struct xe_device *xe);
 bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
+					  struct xe_sriov_packet *data);
+struct xe_sriov_packet *
+xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 43ca60b8982c7..3177ca24215cb 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/wait.h>
 
 /**
  * struct xe_sriov_pf_migration - Xe device level VF migration data
@@ -16,4 +17,50 @@ struct xe_sriov_pf_migration {
 	bool supported;
 };
 
+/**
+ * struct xe_sriov_migration_state - Per VF device-level migration related data
+ */
+struct xe_sriov_migration_state {
+	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
+	wait_queue_head_t wq;
+};
+
+/**
+ * struct xe_sriov_packet - Xe SR-IOV VF migration data packet
+ */
+struct xe_sriov_packet {
+	/** @xe: Xe device */
+	struct xe_device *xe;
+	/** @vaddr: CPU pointer to payload data */
+	void *vaddr;
+	/** @remaining: payload data remaining */
+	size_t remaining;
+	/** @hdr_remaining: header data remaining */
+	size_t hdr_remaining;
+	union {
+		/** @bo: Buffer object with migration data */
+		struct xe_bo *bo;
+		/** @buff: Buffer with migration data */
+		void *buff;
+	};
+	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
+		/** @hdr.version: migration data protocol version */
+		u8 version;
+		/** @hdr.type: migration data type */
+		u8 type;
+		/** @hdr.tile: migration data tile id */
+		u8 tile;
+		/** @hdr.gt: migration data gt id */
+		u8 gt;
+		/** @hdr.flags: migration data flags */
+		u32 flags;
+		/** @hdr.offset: offset into the resource;
+		 * used when multiple packets of given type are used for migration
+		 */
+		u64 offset;
+		/** @hdr.size: migration data size  */
+		u64 size;
+	);
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index b15d8ca2894c2..d1af2c0aef866 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -24,6 +24,8 @@ struct xe_sriov_metadata {
 
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_sriov_pf_service_version version;
+	/** @migration: migration state */
+	struct xe_sriov_migration_state migration;
 };
 
 /**
-- 
2.51.2

