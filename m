Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE2AF100C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D916D10E6A1;
	Wed,  2 Jul 2025 09:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtuE5QkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27EC10E683;
 Wed,  2 Jul 2025 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751448972; x=1782984972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sYQeSSgiLHQ/D9rZ6dcjDNM+KnCNhd0/k+YYEiQIryk=;
 b=DtuE5QkX8mrufGGJliordeIoXJBt+xKTPsGLfoUvouXl+KrcbhNpLNW5
 V96J0p2yOMujb+cuWn1EfFYZZ2609FSZx4GFVA0vvpoTIg/k64UX1NcOH
 inU2OQLwmlJMFMLUYtqatj7iSnr8VAjSYyszayeQj/oZADXphAtMa7Ch8
 k9Uf9NzI3TY15Ro0f/0Mbwy07+UDTNBk6PS7bBxATk8xrZsi86hjHp/XC
 v6ijJRtdwnhq6x31OFCOqWbDrafQZmO80R9NnlPbWMac6kQFpt4vK1Ywq
 BdktI+/F3AZTTKEfbnhFJ7dNA1BIVWQS7iWx+iPWpwptxSt3H5cT3Z6aA w==;
X-CSE-ConnectionGUID: lQrBH4GnTxanX1a5kuRpkg==
X-CSE-MsgGUID: JR4TTbzNRSGphD3zMTLjOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53852642"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53852642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:12 -0700
X-CSE-ConnectionGUID: QIEXtv30SbSDnP/q7JprXQ==
X-CSE-MsgGUID: KyDCThFtQwiUSXiYeB058g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158404610"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 02:36:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.77) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLZ7bHGw/vHZk9gq1GfmuVhhqHrtRgJFVy9nUcg3efkeWpD72LtBsGo21cUNjWqzmDWGKBZO5wLxY3t7foPe9RDPNaGZpCFmOTLOWNHFSOGRtN2ri/BjmiqEk8ogjyJwKYylK1hxVGOCEaZWwkfbEIqy4OJKBAa1UxTGsg74www6/OjKTsE1O7skrAciND5Os0Igll9YRrOGFuRSe9CaplxGy93BocMyNkYjWMKbRb0tPbUsyT0JoOXXn96cJbvR1sWx1yXs6BciO8QCGfZsNWUI83YMklczQG/LxWMBmGQT1i0ll9tknBsvJXBZuy96oJbhmuBZ9+J/9P1C+6pkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYhxt+mCuedTAnam/EB+/iG5SqJBk5LA9q/BrvVALXA=;
 b=q/jAUpnR85ryRVJZQPaYAnKntgjUt+PJYCAiStDNmfHnPWx3Ur/ckqvdensdwI13NfXL1aWcGYlq898RSUoVQRLmbHeQlO77SAYWwssC4fuRjQa/QRZbgBAEAnxBUc8w33nuc0MvPJo1V41QWEIfchRKJypM55mlC5jttkbS+ZZ5JiOgl/XrX7nAOJSXb2Nm+tstoAzrlzpZNhvH3uGdiVfrJoSnGUdr8bXxGHD1PfnYnVu9KvSF3liBw/8fOkkAi9bJLDwtNn7ArclU1Ha4ZyhFa/5VYEK0HMc7XR6q/Q/yF01m5XSSVK5QFX5nzszL0MpmMKLbaFkiG1CBaogE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 09:35:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 09:35:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v10 2/5] PCI: Add a helper to convert between VF BAR number
 and IOV resource
Date: Wed, 2 Jul 2025 11:35:19 +0200
Message-ID: <20250702093522.518099-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702093522.518099-1-michal.winiarski@intel.com>
References: <20250702093522.518099-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: 847f8d62-7e2b-4e53-9344-08ddb94bd4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ri8yMWQrOTltWEJyb0pjUklGcGo0MWFwR3BrcGQ2Z2ZDWDExREQ5SlczT2Rk?=
 =?utf-8?B?QUp6R1VTMXJ2YlM5a2QrZlpJSm9iMmI0dDFYOWhlL0FqNFJEWWk0RFFVeWF1?=
 =?utf-8?B?NWRNNzR6YUs0QUZUN2diVE56bHFmamFqZzFXR3gwT0UzY0tOOWp6NkZGSFpG?=
 =?utf-8?B?WkN1dk4zRDhxVzBCcHozNXJnL0lpdmRFNGE0d3NRaFpEMFJLaFpaQStKNUZI?=
 =?utf-8?B?Vm1pTkswQkZucXF0NWhKN01QUDQwWEQxUGovcTdHSnF3MTdxSVliMGt1MThP?=
 =?utf-8?B?Wm1qZ2xaY1JOakVHSGFMMU5ISzFrRFJRdVR5WVJ6SkUxcGRyWG5qYWUrQ0Jy?=
 =?utf-8?B?Sk5kTk80VEJDRkJJdENrWlV6bDZWVzl3WHVXQ0QvYkNLd1czZGt4L3JURmQy?=
 =?utf-8?B?K2UwQ0ZwYzlYR0FJTXpsNGdxQzZ4ajFhNGJNZUp3aElFQVBSdk5zdzhtMjdG?=
 =?utf-8?B?S2dNOVFpOVEyMTQ0MDlGSnBGSFZJajJYbUNqQlFyOFNiNHh6Z3R1UzluRDZZ?=
 =?utf-8?B?QytZZDR6U2JEWFBDbFZiUWdtaUpJYittbFVvQ1lMd2pRNHJSaHJjNjZoeG1o?=
 =?utf-8?B?OW4wZ2VoTkdROHpmbTN6UnBTMHlIMHRoMGFrZW9oQVVTNWs5U051OGdFZXFQ?=
 =?utf-8?B?ajc5ci8zdnRtczh5RjkrOHZJNEFaeElhYU83Sm9OK0tHdzZHOWh0TDE3UjN1?=
 =?utf-8?B?TklVeUl1eGttUWRIdS92U3J5MmhheVpxTlJjd1FnTlJzR2d5aENmRFJ0VDI2?=
 =?utf-8?B?dGwrdXJXTGpkNXF2RWoxaDdyYUpMeTVvR2NzUi9NblkrNXpuUktncUJ3ZnBV?=
 =?utf-8?B?ZkRHQitrS3prckY5OTNxMXBBbFhqVHJKRTFaQTNwVVpiVmFDbmYyQnpqTzVV?=
 =?utf-8?B?V3FMaXVhcDdaOUtXQ29uNHJYWngzOElncGdiZWJWalZOUTB0Q2Zma0FqTGQx?=
 =?utf-8?B?eVh4d0xnMW5pS2MyT3dTdjAwdnZXeGdkNGZQOXdzUTY4LzlsQlBTOEtPWDZI?=
 =?utf-8?B?d1dlWVc3UFA5YnltdEtTaWhNUE5rR0g4MlIwOEFsS2tEemU2U1ZWMXljRjds?=
 =?utf-8?B?eE9Sa0U3dW1ReExBeEczQWh5MmE2OTQ3VUNBbHhqb3l5S2ZBd1B4YkVvUXFQ?=
 =?utf-8?B?dUxjSUFnWmNpcWxHaGVQMzRKUjNaYzduVzVBamhKSklBbHorMGpwdXpoTGVt?=
 =?utf-8?B?czhFQVlVQW13NnlzMCtKN1BiUldyeHp3dHJyUGdjWTZOL00xY1pwaWJGUlhC?=
 =?utf-8?B?NjcwZE1pZ2VNNkRSL0I5RHNnbXQyYkNKMHNqcFMzeVdReWpxYUVzZldOVzNt?=
 =?utf-8?B?WVpqY2ludUJZOVRNSmlVYWVvQ3QwQ2JSNjZpZmFZNEF2Skw1NmJzd3BKRFVn?=
 =?utf-8?B?VTYzZm5nR2VKVG1DR2puMlNjRW9UaXdMd1BXSzNtMC93ZTFUeHVYdE9GNkNv?=
 =?utf-8?B?RmNxNUZFZmI2aUFjV0VFaUlORnJHZlBKVXdqcm92WnJ2NHFyWVBwaitHYWNq?=
 =?utf-8?B?SmlVbk1lbGhoTkhtUUNHNUJQVjFHOEZyTStKSWtPVm5pZ2Rwd0dpWkdYRkND?=
 =?utf-8?B?V0JKZTRKcG5EY2syUEhnOWhXbGgvY3Q5NVp6ZG9ZeWYzUFM4SERjQWJVQS8v?=
 =?utf-8?B?VTNCNCthVW1rWlpERVp3Z1FNaGJWTWpRb2lhSy94SVE4Ny8wd0Y0RHkyOWtp?=
 =?utf-8?B?VEJ3c2J3YzZKUTZiMmx4cEkwcGlSckNHRU9OT2tsTktmamZwaElvSjlrMkNF?=
 =?utf-8?B?K1VKT2d2Z3JUWUVrVG1UNHBFK1h5Ykx2L1lXRnhBSWpZeDZSRURKbDN3R1g5?=
 =?utf-8?B?dFBKODJ0NEdrU2pFOVNkNkxRRS9tSzQrWlhNVFhrNURNcTljTm8ydEd1clVy?=
 =?utf-8?B?bFJPcFZIWlJyd3R4K010TmRTcTRvRFRzR09uNms3MnhSZnl2bHRGUzZWcTYv?=
 =?utf-8?Q?sPbkEf2KBG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXFEWjJYeHU2Z2JpRmdYNHZCV1B1cGxYcU5vWkVyY3NLQUtubzg5UmNBbDdi?=
 =?utf-8?B?ZC9XSTl5ZEFPSTV2UGw3N2lCTXgvWGxTU3E0UlpHS1JMNXZzTCs2NkIyZ3Q5?=
 =?utf-8?B?cnF6dkNUVGh6ekxzK0hLY0lPY1JMUmVzdE9rS1JBMloxSTRHZ1ByWEtaRVVM?=
 =?utf-8?B?OTVUL2JTSHNmS2N0bDFQZGh4SVZlbloydUZxdU5GbzR5YzJYdUh6Ukovc2M4?=
 =?utf-8?B?MTF1QW9pNCszbHRnRXJXNXovSDBXOVBHNEc0cFV0SWhvOFV6dSsrTmc3d0FK?=
 =?utf-8?B?R1pVN0tHOFpEUkhmMUQ5a0VtSnBDMUtNN2tpRmtsckdyOVJjd3FkVXdRVksz?=
 =?utf-8?B?Sy91bHlKR21iNVpJNjIvVE9nczdBVWNpT2lmY2NQcVRMN0ZXZVZQNDFJQmcw?=
 =?utf-8?B?L2JiOUhyQmt2UFhJMmluU2hzeHdmc05OSlluSDR4RnRxUjNRTzBDN1I5ZFZh?=
 =?utf-8?B?ZFNOZzF1dDBrcTFqcW5YdjlFZ0ZVYzIwTHdsQVBGM2hPMGgxYVhXWnc0MXhV?=
 =?utf-8?B?NXVWNWViTnp5WEJuOGVDcS9EYllQREpmYUhNRHZlaDlOOExZV0pwdXcxeDVr?=
 =?utf-8?B?bUV1cXVVVXo4NDFseTNseW5penJKODNRVVNBK2luNnF3YzZGUlRHaWloZk5N?=
 =?utf-8?B?TVc4Y2sxcU5USWxSRnYvOUlYbHlrUHpYQUR5QXBsRDA1cVBzWEh2R0pLaDBt?=
 =?utf-8?B?S1RITVJBVWlickRDQ3BpVDh3Nm9oR1lxWG5lQmVUL2d0b0JmUzRxbGd2VDUr?=
 =?utf-8?B?T00vNkFJTTJTTSt4TzNIeWFWdUdjSjYxeFRPWGV0Vmd3SGVPZUFzcWRtQlph?=
 =?utf-8?B?YS9LcHpqUGhqQlNkZExVRStZWkFUajFaRFFjWnh6cmJtZUNYTGE0UUxMK1gx?=
 =?utf-8?B?eXhMdnMxQ3h6YlBsM2VrWEN4am1NdnZGZjZ6Z3VXS3BoaUU5NmthUXJWQjdP?=
 =?utf-8?B?aFZSVno5K1VoTTlGVC90a3ptdy9IOGo5MHQ1MjE4bUltY0RPUDlvTnk2aFVH?=
 =?utf-8?B?MXplVVVYbmlkMkdlN0NXVWlDVWhsaGFBVWFvMUZTM05UcHBqbEdTMmhtVG1n?=
 =?utf-8?B?c2pycytpZmpxNktiV3l3aGwva0ZzbENMRHRGeGR1ZENyUXliYUdHYjllZyt1?=
 =?utf-8?B?WVZjcVJDVG5WQ2RHSVRRYkhaNzc0M3M3eXhBcnVhYjZDeDNOb3VhdURoQTlq?=
 =?utf-8?B?UlpGMU9GZFNsbVZvbWZNYTh3d2NqVE9KVjVkV1I5ZWs1VFJqdTRSL2M2enlG?=
 =?utf-8?B?eC80YURNaDNCT3BNaGVVZU9XVHhiTDdVVFBocGZEaFBSRG5nTHVxanQ0cWs4?=
 =?utf-8?B?K1YyUDRWU3grcVhsVGtmYzhwYXBTOWt4YS9HNi91SmkxUHB3dEtHbkVTazAx?=
 =?utf-8?B?Q25pa1dwMGt6NVA3ckNQbXBYYkMvVDlWb0NZUjRFQkY4eG9ud2k4bDdpVXVY?=
 =?utf-8?B?ZVBvNEl6RlJWaTBiVlFudzdoNmN4VlBQRmdMSmVuSlFNajl5OUx3Q1NhSlk3?=
 =?utf-8?B?VjU3WGVLcW1VaVluc1gyalZZNTU4T2FMZWo3N1daaTViREhPbWxJN0dTTjk5?=
 =?utf-8?B?ZFFOdzI1czluT01zcHhCdFB5dFhIRGpQZTZLa2w3anI3Q3FiSWF0c1VFdWV6?=
 =?utf-8?B?MnFBTWp6MGNQSjYxa2ZlaE4zT2tZY1dDUFVIdm5oWGcyRTYyVGVyN0RFcHVj?=
 =?utf-8?B?TGhkc1UvUXE3elhsMTkyYk9iN1FUV1ZNNWZ2QmE5blFpM0ZMYUhNZmpxY3RU?=
 =?utf-8?B?ajlaaU9hZmpOenVLV0w5N3ExWnAwSDVMeE4velQvMTRqVDMzZXNCbUsrekNI?=
 =?utf-8?B?RHVpWEgvUW9lV25Va3k1WkJldXJUbWY5VXF3dFdzQWxpa1pLNk5lYU5DM2xB?=
 =?utf-8?B?N2s4bjJnVXZBV25Cb3hZY0NRY3BLREZNOHBRVVd6UGoyaXVSQ1R2NlJMa1N2?=
 =?utf-8?B?L1FpQmRuMmNxSHEwM1JsTjRCT0t2aUlpbm1Bd0h4UktkenlNRk9vWUtubTZa?=
 =?utf-8?B?V1hudCtkNFBsOFoxS3hKa0JoMlRpMlB5bjRGeUtpV1ZkQlM4a2g4VVRad2FC?=
 =?utf-8?B?aGdYTSsvVlBNMFpzcUtBeWMxMUptVXdUMWhMSDE0M0pjN2EzRGhtdTZtVU1F?=
 =?utf-8?B?YU5xR2JXKy8xT0pvY3lxVSt4L2NCdzhMMW4yOXJYRUtCR011MWJZYktGNGpv?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 847f8d62-7e2b-4e53-9344-08ddb94bd4b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:35:49.9994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIeEXsJ2AOUot/FEO1no2YFuI6Cd5FP24fGxMvErCj9R3dnMquIfJwB6PsZxpdH183f1oPgqmW7GW5hC+njWrC+yLZk/n9kMVsTDRqSiNFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
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

There are multiple places where conversions between IOV resources and
corresponding VF BAR numbers are done.

Extract the logic to pci_resource_num_from_vf_bar() and
pci_resource_num_to_vf_bar() helpers.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c       | 26 ++++++++++++++++----------
 drivers/pci/pci.h       | 18 ++++++++++++++++++
 drivers/pci/setup-bus.c |  3 ++-
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 10ccef8afe145..bdac078045525 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	if (!dev->is_physfn)
 		return 0;
 
-	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
+	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
@@ -342,12 +342,14 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	virtfn->multifunction = 0;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
 		if (!res->parent)
 			continue;
 		virtfn->resource[i].name = pci_name(virtfn);
 		virtfn->resource[i].flags = res->flags;
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		size = pci_iov_resource_size(dev, idx);
 		resource_set_range(&virtfn->resource[i],
 				   res->start + size * id, size);
 		rc = request_resource(res, &virtfn->resource[i]);
@@ -644,8 +646,10 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		bars |= (1 << (i + PCI_IOV_RESOURCES));
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		bars |= (1 << idx);
+		res = &dev->resource[idx];
 		if (res->parent)
 			nres++;
 	}
@@ -811,8 +815,10 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
+		res_name = pci_resource_name(dev, idx);
 
 		/*
 		 * If it is already FIXED, don't change it, something
@@ -871,7 +877,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	dev->is_physfn = 0;
 failed:
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
 		res->flags = 0;
 	}
 
@@ -933,7 +939,7 @@ static void sriov_restore_state(struct pci_dev *dev)
 	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
+		pci_update_resource(dev, pci_resource_num_from_vf_bar(i));
 
 	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
 	pci_iov_set_numvfs(dev, iov->num_VFs);
@@ -999,7 +1005,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
 {
 	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
 	struct resource *res = pci_resource_n(dev, resno);
-	int vf_bar = resno - PCI_IOV_RESOURCES;
+	int vf_bar = pci_resource_num_to_vf_bar(resno);
 	struct pci_bus_region region;
 	u16 cmd;
 	u32 new;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3bd507583c3fa..6f6db4afcc200 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -730,6 +730,14 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	return resno + PCI_IOV_RESOURCES;
+}
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	return resno - PCI_IOV_RESOURCES;
+}
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -758,6 +766,16 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_TPH
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 07c3d021a47ec..7853ac6999e2c 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1888,7 +1888,8 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
 	bool *unassigned = data;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+		struct resource *r = &dev->resource[idx];
 		struct pci_bus_region region;
 
 		/* Not assigned or rejected by kernel? */
-- 
2.49.0

