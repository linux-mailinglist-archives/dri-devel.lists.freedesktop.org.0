Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DBBC3642F
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F0310E7A1;
	Wed,  5 Nov 2025 15:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9qeoA39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F155D10E79E;
 Wed,  5 Nov 2025 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355602; x=1793891602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/mXCbEh6UpUx7tHBr07zcLQjr/wJJKTU0ceSNYBoTFU=;
 b=J9qeoA39sKMs9CLedCeZDvl3E5z0bmP42A4VWStdJ37cOq8i7+wo2kV1
 ElDpzroyoHlhQxorcQPkKRN2R7tZqqCn832CphpDpaQjaarnz/j7Eojlk
 D46kQecRrCN4juKMYuIMX6DVDCvsVyZM5h+GG1rxHi1hmPuYhfwiik3Pi
 QAAV8uLRM/5C6VpVXmC6+Iuospql2bwRS+xXfIQU2egHDt7cpDIq0cO2v
 hzKgNSphMsMZWZcZ7lXR8BSwd1H2X9glZFItck9TP0FbR4s4JXG31/Bhl
 hYhzUyvnjXU1g1tkv+7GeYuR1nWIJo/EyOkP5b0cgkSIF8Tlr8Viunyiu A==;
X-CSE-ConnectionGUID: 5WgURa5nRli+YShdIOQz1g==
X-CSE-MsgGUID: ymLSZ2yFRr+jA1WklMtzIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82101219"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="82101219"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:22 -0800
X-CSE-ConnectionGUID: hGOpo+0gQBqnfgZ4+2W7eg==
X-CSE-MsgGUID: 989OO8UST9OG8WBUiR7Biw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="224725971"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:13:20 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVCQ0k2hdl/rNXW7p7mh1rHGsTK4NOVqXr/rRSAJV9yZ112vl4dNuu385ZzHICLTeSdCEGxatsTtmGPQWP7zJN9Q0sQrl3bDfVmBE/dV9YIuHW3Q3NjTd2oZVuax0TPLDJl6teLsELZfQWU3R2ht9uHcaDKRQVH1z243oxcjhMzV3kLoUxbcQD6TPJlBUYagbjX9dD8kmkrAZ+iXHyydKEjt+rEYaNVLn2bF02cBWTh3+HqDwHuhGMRsQquLzWC+EA7VTy/r0Jdv8XGppoAN1TfcWPva3LTzW7b2ZnVzHHQjhXUiCB3QFkpjLd58vmRDJw8B8RZJmHmUazSQETkk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyyS6DTwAPUefEMv/zKDuoCVfAgpNdKeUEejZz3YuGc=;
 b=d6rrpUC6TdZa3ec3FGpjXYuu/EasCREAzY36UWO/jPqkR44YNXyNM7pYNaxWTxPYvrDcTZEF4sYTuRdWETx0yFhOvBOfJ/TgHxCkZHZsARCDwzthNFVTHAPdiXPAhiA05KQ1VU+YbMbaBA3TYOSwuJb+rcGbIBR3gS//KGpRFuZcPlcECJhWelfvQH1zRD9YF4wtUXzf9hZqGsTHwmE12/wIZ5awEt6zP8Xu1i2XHQTHRvTTTenPyqD8ko3GlQPmRXBCaGVhKZnyVJI1vQAGZt2o0AkAzMzwj02emTOvGx9PIN6TpqAj6D+VSBsHKUqTp8CXAC7DAhqfvsi/0ZUlsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:13:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:13:14 +0000
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
Subject: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver variant
 for Intel graphics
Date: Wed, 5 Nov 2025 16:10:26 +0100
Message-ID: <20251105151027.540712-29-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f807ce-2444-45c7-3c1c-08de1c7dd756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjluVG8wRnBWdVRaSkxxQkx1eUZkK0R2eHljM0JQM1VxUXV6alFvdTZGU2NH?=
 =?utf-8?B?aUQwUHJZb1RqLzZpS3N4RTJPRlNBU2hvWllvTWt1L2VaVVRyeDJDL05uSmxw?=
 =?utf-8?B?d0tSaDVKSElWSkVJT0poVWhiemZibEgzcExRNjFWOHo4djhQNVpzbzk3blk2?=
 =?utf-8?B?eks5MFkxcFZicmtRdGpsR1hWYnNRdDdlUmRzYnhmczFVSUlGdjYyVk92bkxN?=
 =?utf-8?B?L01XZU4zS2Y2aWNVUUVwdW44QmhKdVRjTUVWWEY4RTJXVlJ2d3RXaW9vZVJs?=
 =?utf-8?B?eXNBTkl3MzVhMkpHYTVEMVlUQkhMN1ZBRmNTMUJpSnNJL3BlSi82SzNPQlJQ?=
 =?utf-8?B?NEFWMWRlMi94U2FlTGFicUNZNGQzUGFCL2YzSXJLK2xDTnJuV0pHTDFOdjRH?=
 =?utf-8?B?LzlMTTdVT0JVMkx1NmNvRXk4b0NDSVZvUm9rRWM4MzB4aGhCY2JqSWc4RmEr?=
 =?utf-8?B?MDFCREVhQkZYN0tyZXNLQkxYbnErZmdaWlF5RFVWZCtFZCtkQjl0ZGVWdjB6?=
 =?utf-8?B?ZnFNZnI5OW14NCttUTEzQWlKK01HQ01ZZDNaUFJNa0g5N1YzK0lkQm0wMXh4?=
 =?utf-8?B?N3JMUkFaeTJTQ3N6TDgxcTZpS1phY2RUMkxITWZiUXpmNFVDTTZZQXBYc29L?=
 =?utf-8?B?eGNwNmp5K0UyME9NbjRBdzVLWHVqQnlLOGVXVGdDUy9Id1FzYmRQaUZQMitY?=
 =?utf-8?B?SXlmUFBmRE1yaHQzNHgwUXdCKzc4K2NtVDlnQlJsc3ZYbUo3Q2tGWjV0YlZQ?=
 =?utf-8?B?MU1HV0xXQzNTNGhJUWVmSnBMUmErZUNYUUVGYkZDcjdGOTJzRGJWbjBvckln?=
 =?utf-8?B?WUlMSkdhK3c3NXVNOEJFMUx6Q29FV0lwaWx1cFl5TnBqSjRZWG1nSjJKakJm?=
 =?utf-8?B?KzUzSDJxaHUvdHR2YjdzOUphSWxoYjZFT0t0eENmcGFIVTVZVWdIWWsvL2w4?=
 =?utf-8?B?eS9oOGlld0Q3YzVaVFRydGdvLzlUajArRUFYcmJLNFpTT2tyS2tvQ3c0dGdH?=
 =?utf-8?B?V2tCSW5zTHNzZWsyVnc5eElubVp6WWd3Qk1qYmxwMUVzdFo5THJBdnZJOXZV?=
 =?utf-8?B?c2NWTndSZTRiWElmZm5heHpRWGZFdFVIeFhkdXpyVnJ3Ly9hNGg0NkJrUXFH?=
 =?utf-8?B?bDgvemZ5KzRjUlR6VzlGdjhpdHZaTUpiZVloUEZPVFBMeWkvMkVnUXdEL1NX?=
 =?utf-8?B?TFFuVFhXQXpJN3RESGovdG5MNHRCT2gzMTZyOWpyYWVDdkhwM2ZscW1Hb0xN?=
 =?utf-8?B?SHpFdE9EM0FzdVNIT0ZFbWtWcVA0czZVcThnVDdKTVByYVl0aGF4U1ZBSVFt?=
 =?utf-8?B?aStpeEwzSWdsUGxxdWRMY3hwQWVtMnVTMEx3NFBNRmNrbmVuT3NtSlczV2lB?=
 =?utf-8?B?Z3A5dVNPcTRlb1Q2T2RnVWFaVjRuYW01QkwzWk16emw4MVkvK1FBR0dleWZr?=
 =?utf-8?B?dGpGWVZkbTQ4UDFhV1FEZ0pxOXM3amdHYWhrVTJSTGJhNWdSOW9DMisyUlpp?=
 =?utf-8?B?ZmlDTGJ4eUpDYldLYkhNT0Z3MUJhQ3o4UnR5Qm0vTEF3UmhDK29kTDhKSXlI?=
 =?utf-8?B?VzFhdFlhZGFHd3dySXZKTEVMeUNidmgzTjlMcHJvTGwwUVN0UURGcnlNU0xV?=
 =?utf-8?B?NXU2UWdjVS9OV1A4MUdwY2ZBc2NyV0w5Yy9yenYwWEtia3hxNCtTRXY5RFZV?=
 =?utf-8?B?VjFUbHBDbGVQY3JFMzV2d3MxMCtxb1BpbVdjV1c4UVZPYXFVOVI3ZnJJa1Vo?=
 =?utf-8?B?YnlYSGp5SGZnT1lkNENzeWl0Ly9Pcmh3Wm9KaUR4ZzVlLzlKOVl4RHNQQkRI?=
 =?utf-8?B?NEs4ZGVBc0Q0QjhTeUJxK0s0MHRwSEtkUENzQ3JNL1EzSU9MZUtBK3NaSFR4?=
 =?utf-8?B?Ti9NRkMvcnVRSXB4ZFhuK0pNT2t2ZnBSQ2ZOMDNCZ2FpUW9jL3lWYVNFeXRx?=
 =?utf-8?B?OWxkbmJSTEpxa2hZZGw5Ym83OGNGWmRVMGgrZW1xV3BTdkJTdVhHM0xhY29M?=
 =?utf-8?Q?4C776/MsmzXm9ZNlpZIVYev2KrWFN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0EwaWhXMTZlRnpPanY2bDYyVW5NaTdiUzlXZGJIeW10cUhPT1RyL05SVklV?=
 =?utf-8?B?WUtiVTZiOWJ2dEVKNUltNktyRzR4Y2lubXpNdUdya0ZVQmtrd3NOTkd3d0cr?=
 =?utf-8?B?M3ZUbXlSRWxnbEUwOXZLNS83aFAyZmVUYmNoRy8zRnAveTYwMm5VVjcwNVlW?=
 =?utf-8?B?Wk1kVC95anNuQ3RFdWpSNWVWdkhDc1ZVZkM3Yml6ZW1JK1VRdDZJV2wzTHRV?=
 =?utf-8?B?c0dpU2NKaE52QlRUU3V5WmVSRHhNeHBBZHI0dG5vTElQN3JGYXZOMlR4K09k?=
 =?utf-8?B?a29yY0NyTHdKd2xNY2tRK2pIUzhUZUFJMjB5d01HUG5ZMjFsWE1ERTY4SExj?=
 =?utf-8?B?cVBlRmc2MHJhVE8wRElJZmY3NFkzN2RzZEJWTEdBZzBUVDZmZTBUQ0F1bVd3?=
 =?utf-8?B?U0VHaGlkd21KTjd5MDJxdzVvTDhUMmNXdUhrajh0cUpHYXJDSWc4d3hETFJB?=
 =?utf-8?B?U3o5Smd3YnBpQU1TZVk2WDNwTFNOQ1Ixbmd5dEF4TGYycDQxUlFGWkxIVmh1?=
 =?utf-8?B?OHhnZ3FVOVRDL0ljaWdlTTBkRHIxMkJZMXNCUk85LytCVUdCNGk3dlVxQ1kx?=
 =?utf-8?B?WEVXY0owakxSSlhyZXh6Q0ZMa3picWl0dTJIMUo2blNMWjVSaTZzRWFIMmpL?=
 =?utf-8?B?WXVhSmh2SlUwd2RoSkwwTDlVTGNCbkhuNjc5YUU0UWJVVXlUMlFvQWZDejNy?=
 =?utf-8?B?Z2xsS1NiendKb3BHNkVGRVVBeEwrUkpxUGE4WW5IZkJKWnMwOG92RytvMEF3?=
 =?utf-8?B?M2lrbzMwTVRETG9xUWNrT0d5N2tsSStTeEF0cWVZbUxyYytNamZMREhjTEdC?=
 =?utf-8?B?bjhRUytWaVhhS2FmNE9IL3NEWUtiNkdrRkJKOHhDR08rUnh1QmZTNWRuc0pE?=
 =?utf-8?B?OXhkejIwSFU1dDZQaHBIcDNKcFVCTnQ5bW8xNFJZaHdQeEpzMlJhSjdpUEY4?=
 =?utf-8?B?dnhhOFdxT0NrSnNyWW1JV0lTcUFLZ0lhbUFJeTBzaEdYWXVyNnQ1Zks5L005?=
 =?utf-8?B?VGJic3VVSDBFeVNHM1Q1NXJuOGMydThYVGZUeXkvcmJONUgvbGNmTXFDZFFy?=
 =?utf-8?B?dWU3d3Q4K3hCQVRXWGhUc1Rxc2FOaU1BTi9PQjI2SzlkS3c3YWpDM1k2K2J4?=
 =?utf-8?B?UitTSE00NzMybFhYNitFU2xFSWZzMTdiS0U4NzRkcmF5QjlTclVFY3MwcXR6?=
 =?utf-8?B?d0ZBaG4vb3FibjRpN3ZkeC9OdXdseUlFRTA2cTBBbWJvNGhmZFdHYlZ1MU5w?=
 =?utf-8?B?VXNNNSs1SDN5bmJ5N2hQcmNhd0VUOGsvNzZqSU9uR2hBQlpjREYwKzNnVm1I?=
 =?utf-8?B?WTJxbmVEekJhSUtIYnI4em9QVVFHdVlBcE1jZXY3ZjUrTlM2RVBET0Zsc1N2?=
 =?utf-8?B?KzgrRGdISjBoMTVRUTB1ZFRGbVh5UHJxajJDMWJPNXh1NE8yL2RMQUZzV2Nl?=
 =?utf-8?B?MDAvM0ZMai9haUltY1lqUGtxeUpiMTlxanBYVDZqWHd2UXZjcCt1RjNBQ0N5?=
 =?utf-8?B?WnJVdFBscXJwajF4RUJCS01JdVVFSXFKbmFsbTRnSXE1N0V6Y1kwL2d1RGZu?=
 =?utf-8?B?UUVoWHRwcTRiRCtYQm1RVU9qLzllM3QrSHViT21NblZMWFc0ZEc0ZndHSE10?=
 =?utf-8?B?T0VHSHk4MFUzbjJBZWt3MW9TOW9HTzkzajJUZytSTnE0NkFEOWViSUhGdFcw?=
 =?utf-8?B?RXZUdnlOL0w5ODRudDZ6VXFyb3hRNnhMQXh1V3NycmhYdmVydTByeGF3WGh6?=
 =?utf-8?B?RjVZNVJ1K2MxN1YwalhHVS9wMGljbGVUTjVqWlJVRlhuVlZ2U1h1Z0dGai95?=
 =?utf-8?B?Q0U5S0VvVDRsZHlnY3RmeEkvTjlweUlrYitvcTIwK21FVkFYd1p0bnI5enNy?=
 =?utf-8?B?QlltaW0wWEp5RnVCQVNqUU5TUm1EQlpxWCtWemNYdHNWSHpCYnlRZUtMcXI0?=
 =?utf-8?B?clo2a3RLbUplNS9FY2hGSktGRlBTQkZtOE94TktIZ3NBM0NISFRUaHJ0OEdZ?=
 =?utf-8?B?c2Z1MnFvRzIyYVZ2WHhvWHlVUXpQZkd5d1BCeGRsRnFkV2F2ZVR3TVZrMkN0?=
 =?utf-8?B?RFllM28wSVFVMklZdkJFZVhoa0NXQmE1ekMxYUhuc1VNS0xLdE56M3NGRU1a?=
 =?utf-8?B?T21lc2ZOUnYva2drVkdYeVo2WlA2azdmei9yUUd6Rk1SWWF4THpjbERubzJk?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f807ce-2444-45c7-3c1c-08de1c7dd756
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:13:14.4955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KVN4wXTlXNcqUO9x03BrXF9u+MNhq2QubP/9dqJvmIopxbJDLJW2+c5MNxJTa2RrrhQls4436xjZO7Ki56YSkqaQSGyF4xHGHQpsGKsSQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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

In addition to generic VFIO PCI functionality, the driver implements
VFIO migration uAPI, allowing userspace to enable migration for Intel
Graphics SR-IOV Virtual Functions.
The driver binds to VF device, and uses API exposed by Xe driver bound
to PF device to control VF device state and transfer the migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/vfio/pci/Kconfig     |   2 +
 drivers/vfio/pci/Makefile    |   2 +
 drivers/vfio/pci/xe/Kconfig  |  12 +
 drivers/vfio/pci/xe/Makefile |   3 +
 drivers/vfio/pci/xe/main.c   | 556 +++++++++++++++++++++++++++++++++++
 6 files changed, 582 insertions(+)
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e941f983e27e..5558707d47d4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27008,6 +27008,13 @@ L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/vfio/pci/virtio
 
+VFIO XE PCI DRIVER
+M:	Michał Winiarski <michal.winiarski@intel.com>
+L:	kvm@vger.kernel.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/vfio/pci/xe
+
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..c100f0ab87f2d 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
 
 source "drivers/vfio/pci/qat/Kconfig"
 
+source "drivers/vfio/pci/xe/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f5d46aa9347b9 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
 obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
+
+obj-$(CONFIG_XE_VFIO_PCI) += xe/
diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
new file mode 100644
index 0000000000000..787be88268685
--- /dev/null
+++ b/drivers/vfio/pci/xe/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config XE_VFIO_PCI
+	tristate "VFIO support for Intel Graphics"
+	depends on DRM_XE
+	select VFIO_PCI_CORE
+	help
+	  This option enables vendor-specific VFIO driver for Intel Graphics.
+	  In addition to generic VFIO PCI functionality, it implements VFIO
+	  migration uAPI allowing userspace to enable migration for
+	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
new file mode 100644
index 0000000000000..13aa0fd192cd4
--- /dev/null
+++ b/drivers/vfio/pci/xe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
+xe-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
new file mode 100644
index 0000000000000..1caa64163be9f
--- /dev/null
+++ b/drivers/vfio/pci/xe/main.c
@@ -0,0 +1,556 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vfio.h>
+#include <linux/vfio_pci_core.h>
+
+#include <drm/intel/xe_sriov_vfio.h>
+#include <drm/intel/pciids.h>
+
+struct xe_vfio_pci_migration_file {
+	struct file *filp;
+	/* serializes accesses to migration data */
+	struct mutex lock;
+	struct xe_vfio_pci_core_device *xe_vdev;
+};
+
+struct xe_vfio_pci_core_device {
+	struct vfio_pci_core_device core_device;
+	struct xe_device *xe;
+	/* VF number used by PF, Xe HW/FW components use vfid indexing starting from 1 */
+	unsigned int vfid;
+	u8 migrate_cap:1;
+	u8 deferred_reset:1;
+	/* protects migration state */
+	struct mutex state_mutex;
+	enum vfio_device_mig_state mig_state;
+	/* protects the reset_done flow */
+	spinlock_t reset_lock;
+	struct xe_vfio_pci_migration_file *migf;
+};
+
+#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
+
+static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = migf->xe_vdev;
+
+	mutex_lock(&migf->lock);
+	xe_vdev->migf = NULL;
+	mutex_unlock(&migf->lock);
+}
+
+static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (xe_vdev->migf)
+		xe_vfio_pci_disable_file(xe_vdev->migf);
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+}
+
+static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	mutex_lock(&xe_vdev->state_mutex);
+}
+
+/*
+ * This function is called in all state_mutex unlock cases to
+ * handle a 'deferred_reset' if exists.
+ */
+static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+again:
+	spin_lock(&xe_vdev->reset_lock);
+	if (xe_vdev->deferred_reset) {
+		xe_vdev->deferred_reset = false;
+		spin_unlock(&xe_vdev->reset_lock);
+		xe_vfio_pci_reset(xe_vdev);
+		goto again;
+	}
+	mutex_unlock(&xe_vdev->state_mutex);
+	spin_unlock(&xe_vdev->reset_lock);
+}
+
+static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!xe_vdev->vfid)
+		return;
+
+	/*
+	 * VF FLR requires additional processing done by PF driver.
+	 * The processing is done after FLR is already finished from PCIe
+	 * perspective.
+	 * In order to avoid a scenario where VF is used while PF processing
+	 * is still in progress, additional synchronization point is needed.
+	 */
+	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
+
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	/*
+	 * As the higher VFIO layers are holding locks across reset and using
+	 * those same locks with the mm_lock we need to prevent ABBA deadlock
+	 * with the state_mutex and mm_lock.
+	 * In case the state_mutex was taken already we defer the cleanup work
+	 * to the unlock flow of the other running context.
+	 */
+	spin_lock(&xe_vdev->reset_lock);
+	xe_vdev->deferred_reset = true;
+	if (!mutex_trylock(&xe_vdev->state_mutex)) {
+		spin_unlock(&xe_vdev->reset_lock);
+		return;
+	}
+	spin_unlock(&xe_vdev->reset_lock);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	xe_vfio_pci_reset(xe_vdev);
+}
+
+static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_done = xe_vfio_pci_reset_done,
+	.error_detected = vfio_pci_core_aer_err_detected,
+};
+
+static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	vfio_pci_core_finish_enable(vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+
+	xe_vfio_pci_disable_file(migf);
+	mutex_destroy(&migf->lock);
+	kfree(migf);
+
+	return 0;
+}
+
+static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_read(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_save_fops = {
+	.owner = THIS_MODULE,
+	.read = xe_vfio_pci_save_read,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
+					size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_write(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = xe_vfio_pci_resume_write,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static const char *vfio_dev_state_str(u32 state)
+{
+	switch (state) {
+	case VFIO_DEVICE_STATE_RUNNING: return "running";
+	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
+	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
+	case VFIO_DEVICE_STATE_STOP: return "stop";
+	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
+	case VFIO_DEVICE_STATE_ERROR: return "error";
+	default: return "";
+	}
+}
+
+enum xe_vfio_pci_file_type {
+	XE_VFIO_FILE_SAVE = 0,
+	XE_VFIO_FILE_RESUME,
+};
+
+static struct xe_vfio_pci_migration_file *
+xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
+		       enum xe_vfio_pci_file_type type)
+{
+	struct xe_vfio_pci_migration_file *migf;
+	const struct file_operations *fops;
+	int flags;
+
+	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
+	if (!migf)
+		return ERR_PTR(-ENOMEM);
+
+	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
+	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
+	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
+	if (IS_ERR(migf->filp)) {
+		kfree(migf);
+		return ERR_CAST(migf->filp);
+	}
+
+	mutex_init(&migf->lock);
+	migf->xe_vdev = xe_vdev;
+	xe_vdev->migf = migf;
+
+	stream_open(migf->filp->f_inode, migf->filp);
+
+	return migf;
+}
+
+static struct file *
+xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
+{
+	u32 cur = xe_vdev->mig_state;
+	int ret;
+
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
+
+	/*
+	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
+	 * have the capability to selectively block outgoing p2p DMA transfers.
+	 * While the device is allowing BAR accesses when the VF is stopped, it
+	 * is not processing any new workload requests, effectively stopping
+	 * any outgoing DMA transfers (not just p2p).
+	 * Any VRAM / MMIO accesses occurring during "RUNNING_P2P" are kept and
+	 * will be migrated to target VF during stop-copy.
+	 */
+	if (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P) {
+		ret = xe_sriov_vfio_suspend_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
+		return NULL;
+
+	if (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING) {
+		ret = xe_sriov_vfio_resume_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf) {
+			fput(xe_vdev->migf->filp);
+			xe_vfio_pci_disable_file(xe_vdev->migf);
+		}
+
+		ret = xe_sriov_vfio_stop_copy_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_resume_data_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf) {
+			fput(xe_vdev->migf->filp);
+			xe_vfio_pci_disable_file(xe_vdev->migf);
+		}
+
+		ret = xe_sriov_vfio_resume_data_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	WARN(true, "Unknown state transition %d->%d", cur, new);
+	return ERR_PTR(-EINVAL);
+
+err:
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"Failed to transition state: %s->%s err=%d\n",
+		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
+	return ERR_PTR(ret);
+}
+
+static struct file *
+xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
+			     enum vfio_device_mig_state new_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	enum vfio_device_mig_state next_state;
+	struct file *f = NULL;
+	int ret;
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	while (new_state != xe_vdev->mig_state) {
+		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
+					      new_state, &next_state);
+		if (ret) {
+			xe_sriov_vfio_error(xe_vdev->xe, xe_vdev->vfid);
+			f = ERR_PTR(ret);
+			break;
+		}
+		f = xe_vfio_set_state(xe_vdev, next_state);
+		if (IS_ERR(f))
+			break;
+
+		xe_vdev->mig_state = next_state;
+
+		/* Multiple state transitions with non-NULL file in the middle */
+		if (f && new_state != xe_vdev->mig_state) {
+			fput(f);
+			f = ERR_PTR(-EINVAL);
+			break;
+		}
+	}
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return f;
+}
+
+static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
+					enum vfio_device_mig_state *curr_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*curr_state = xe_vdev->mig_state;
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
+				     unsigned long *stop_copy_length)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->xe, xe_vdev->vfid);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
+	.migration_set_state = xe_vfio_pci_set_device_state,
+	.migration_get_state = xe_vfio_pci_get_device_state,
+	.migration_get_data_size = xe_vfio_pci_get_data_size,
+};
+
+static void xe_vfio_pci_migration_init(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	struct vfio_device *core_vdev = &xe_vdev->core_device.vdev;
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+	struct xe_device *xe = xe_sriov_vfio_get_pf(pdev);
+	int ret;
+
+	if (!xe)
+		return;
+	if (!xe_sriov_vfio_migration_supported(xe))
+		return;
+
+	ret = pci_iov_vf_id(pdev);
+	if (ret < 0)
+		return;
+
+	mutex_init(&xe_vdev->state_mutex);
+	spin_lock_init(&xe_vdev->reset_lock);
+
+	/* Xe HW/FW components use vfid indexing starting from 1 */
+	xe_vdev->vfid = ret + 1;
+	xe_vdev->xe = xe;
+	xe_vdev->migrate_cap = true;
+
+	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
+	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
+}
+
+static void xe_vfio_pci_migration_fini(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	mutex_destroy(&xe_vdev->state_mutex);
+}
+
+static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_init(xe_vdev);
+
+	return vfio_pci_core_init_dev(core_vdev);
+}
+
+static void xe_vfio_pci_release_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_fini(xe_vdev);
+}
+
+static const struct vfio_device_ops xe_vfio_pci_ops = {
+	.name = "xe-vfio-pci",
+	.init = xe_vfio_pci_init_dev,
+	.release = xe_vfio_pci_release_dev,
+	.open_device = xe_vfio_pci_open_device,
+	.close_device = vfio_pci_core_close_device,
+	.ioctl = vfio_pci_core_ioctl,
+	.device_feature = vfio_pci_core_ioctl_feature,
+	.read = vfio_pci_core_read,
+	.write = vfio_pci_core_write,
+	.mmap = vfio_pci_core_mmap,
+	.request = vfio_pci_core_request,
+	.match = vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
+};
+
+static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct xe_vfio_pci_core_device *xe_vdev;
+	int ret;
+
+	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
+				    &xe_vfio_pci_ops);
+	if (IS_ERR(xe_vdev))
+		return PTR_ERR(xe_vdev);
+
+	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
+
+	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
+	if (ret) {
+		vfio_put_device(&xe_vdev->core_device.vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void xe_vfio_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+
+	vfio_pci_core_unregister_device(&xe_vdev->core_device);
+	vfio_put_device(&xe_vdev->core_device.vdev);
+}
+
+#define INTEL_PCI_VFIO_DEVICE(_id) { \
+	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
+}
+
+static const struct pci_device_id xe_vfio_pci_table[] = {
+	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
+	{}
+};
+MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
+
+static struct pci_driver xe_vfio_pci_driver = {
+	.name = "xe-vfio-pci",
+	.id_table = xe_vfio_pci_table,
+	.probe = xe_vfio_pci_probe,
+	.remove = xe_vfio_pci_remove,
+	.err_handler = &xe_vfio_pci_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(xe_vfio_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michał Winiarski <michal.winiarski@intel.com>");
+MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
-- 
2.51.2

