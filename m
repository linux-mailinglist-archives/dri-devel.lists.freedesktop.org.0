Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A32A78C99
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D510E748;
	Wed,  2 Apr 2025 10:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBk2zBRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2359F10E747;
 Wed,  2 Apr 2025 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743590715; x=1775126715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=76r8cAOsoR3AI7ktiPMzt2YT8euqfgX6AsaCNTg3iSI=;
 b=bBk2zBRXqdAzWbf69Bh10Egewh8DgT1nWFP1UpbX4SwcaqrHheyXxbGQ
 Ke8Fpd7/Fx+MnfxfYlAADP6Pi9zzdV+N8An7E9R4KiR/A9O8V4zHmTLs+
 Pd9GcHnLtqOp3h9NsMeVRa5I11ArGCf3PYiIR5yauf+JXDJzKhA0yEl4o
 M8QmZp/TM3r8OtvpsgUmn11CTNd7ZZB9LUD2rNeR/XE/t6X+eRqQ7BUYH
 VUzOs0sxqcSruLYrD5ce2tKwq/D04dnH/SuAC4umoIZhCE+BMxbhbV4Yp
 zMdOdDSkTuRwRzRe/Lh2M3BIGiL11AWIVqGz/LZ9/SWZjiWxA1QrjKtYI A==;
X-CSE-ConnectionGUID: GPKnTzuURTayeENK1iyuFA==
X-CSE-MsgGUID: SKUu/mGJR5aL3mX/SwWjqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44095339"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="44095339"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:45:14 -0700
X-CSE-ConnectionGUID: uUU12KukRwSuvbH0jhPwpw==
X-CSE-MsgGUID: S322LuH6To6phEhHD671dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="126640673"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:45:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 03:45:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 03:45:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxtHPnxy9iLd8+9OkzXilnJhH23Tt0UXdkqi3LZthvMUVfwGWbRytcv1fyoziGPmqNtMIc85fitoi+PdZP7A7fCIqmf3iuBSR8r5oI6jvQ0RisUwoE19qzicIXQLBNUo0tGKoj9nNRXBVoRZtGmMLnj/HDY6MsMesgNa1e9YRgATBCgxGB66/39oe2f4BCn0p33HjmZZ3htQKuaoA0GpvOe6IFTVpiw+EseLNoNVz8tFsJS007ztnAhdQ2hhTmqruqHBdP1Jegtdd8HLa7iNnSZUxo5COi0MgnPxI9nG08CM/oKuPA21cjftb5PtjJJAGh1LUrP7oNRrEz+MQkCvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHWlQR1IBN7+1RjymV5Z47R/DA5AWEFPmme4qlkhZqQ=;
 b=JLGVKvjl466k9yuYF3iZLfPX8vS8ucUttRQUab0sEmQ1iLIrcMy6TKUvg7DQr7KzwUw/nNFQiImH+6fI3q6NAP0l7PU+IXRWVeJR4ntL+MGNmMdfYJPlrbglvflVmQGmKt6qjgwFVC+9rOPmue7s3rbMkP10rQaAnLIlR9Axgt2OoO9AtS4889DpNjeOX6acPwpGAUL6324PMFlTLBv0Z7fE9HQNhmF/1oHj6BTXYTn1uSUVYOo1Jt3F6C/HUmhotGzm/qu0iMvRJI8PJTGQKG79pOD9GbUdY2H7agU1sgNdeXsTEPyriTUf77SIT4hhhMlazVha4kTmGrdgw7Is4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 2 Apr 2025 10:45:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:45:02 +0000
Date: Wed, 2 Apr 2025 12:44:59 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 6/6] drm/xe/pf: Set VF LMEM BAR size
Message-ID: <gi24rnidkfgmcgszvi53kpmq4wxd36xhs5hd3hqaa4ihzeageg@bqlqtt4knjod>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-7-michal.winiarski@intel.com>
 <bdfe5413-547a-67b0-b822-9852d3f94cc5@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdfe5413-547a-67b0-b822-9852d3f94cc5@linux.intel.com>
X-ClientProxiedBy: VI1PR07CA0135.eurprd07.prod.outlook.com
 (2603:10a6:802:16::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 355956af-ca68-4260-05c2-08dd71d36c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWhzN2p0clpUbEhTMmRtVy9PaW52Mm9oTDlLRVUyOU9nTWVHOEhQT2VsOEJL?=
 =?utf-8?B?OENIMGR0aVR5UFErM2xUdDNZeXZRV05HeU9EL0FCYTZHUFltVEpTQm1icnRm?=
 =?utf-8?B?TG5mV0dIaEFWc1hFU1FjakQyekZobndRZ1lBd0JmQUNQSDI3ZGdRZUlZc2tG?=
 =?utf-8?B?VG1DclVCbHZEMjV6emxPZ0lJbUxIQ1NCa1QyaklhWEkzNzVvUGZiNDg2YzJK?=
 =?utf-8?B?cVFWcmdTeStYdEVWdU9XQ2NVckx1NG02ZWp5VVB3T1djV24vYmRMeEJWWGc3?=
 =?utf-8?B?bG5mbDhVamdZNW9LSU5uWFZia3N5dFF2S2ZiWHpEMjgyRjRFVGpYTEJFenFD?=
 =?utf-8?B?RTcyWlh1M08vZEl5N2hKVWhEZHBWWVR6OWN3STZuQ3ZuRDEyM1NHQ29oWTdx?=
 =?utf-8?B?OVB2YUEwRjJSTFEyNmxGaEhqZDl3SUZpbTVqVEhrOXl1OGF0VmNyeG92d2Va?=
 =?utf-8?B?OUU2T2JDeDZDaWhQQng4a3A4RWtKckxYWGdCOTRZdDlHS2wybjZ6TFlqcGY2?=
 =?utf-8?B?ZzU2RU0veTZtVEdPSUU4TnM1bXVzdXM3M1JWZG9UdjU4cnduSU5VVnZ3cEdh?=
 =?utf-8?B?YUs1eDZLdzh0VFFQQ2hibTl1dEhKeGZyMnN1Zmt2TlJJbEI0UlNqSUgxRFBQ?=
 =?utf-8?B?UW05RVZHSFFCcm5haGNFbno5YUR0S1U0d0daQWtFYXQ5bU5DeFRPT3JoVHYz?=
 =?utf-8?B?R1VYWGcwTUFzVXk4cFFpaG5pWWtnbXdVVHpTV2FzNy9ScTFxSWczQ01ncFVq?=
 =?utf-8?B?U2NRMHBSZ1pYM0c3UDIzWjhRRkx2NDBvQWxkd0k2c3VXbmhGYnE2emJkdTQ0?=
 =?utf-8?B?VDhRY3RNSFQ4am1pRmNJNVNueE03Z2ZMM3RuMFRZaFRZTTRhek5iUzdNMDRx?=
 =?utf-8?B?V1NuRWhNOFlLZ2l3WS80SWE0dTFxRUhPVWh4OGs2TGgxOFZUM3RvQlNiZGhI?=
 =?utf-8?B?RWNZYXYvZzN2bnp1ZDcwRDVPTnBsMlJOY2lVL0E0Q29tUUd4MllWeC9KK1VY?=
 =?utf-8?B?RzZTSmxlMHhDMStNSys2WnpQQ2FvSnlsLzVqMFhGZ3dmaVU3V1I3N3o0Y1ZF?=
 =?utf-8?B?dGxJanFrWTJBWCtKOGY4bm9KcFlETE1QLzFQeGk1bW9ZV1VhVTRkSG05Uksr?=
 =?utf-8?B?akdYNUFNMTRnWnRZZTVrYitXcjdSSGpyZ3hQbHduQjBtbTk1MXZaUU8weHhZ?=
 =?utf-8?B?cmlJcGdUVUUxendSNFpWK2VmK0ZYTVlaTlNGeEpYTXVmd3YrQkNuTzNQK2w4?=
 =?utf-8?B?VFdSZnByYzVOT0pZZ1RwdStzcTdoOW5EaFpHSmExZElwTS9pU0VITS9FRDE3?=
 =?utf-8?B?RHNZdTVlNU8yekNQZVNqN1o0M2s3YXJQVWJQdmtpdkkyT2ltaFo4c2k1eWN5?=
 =?utf-8?B?MUd4S3JaNVdLQy96alI3MjJYd3EwTDlSUytiSmdrNWZFcHNwbDArd0p5WmlH?=
 =?utf-8?B?UDVsSUNnTFBEem9pVEl4a3I2eFg4ZWlnSS8xNnE4WEZvTS82QWhOcE9lSjd6?=
 =?utf-8?B?YnJKb25PWTl5S1RmTTZXRWZCS0FZUjBiR3JiQlZMaE5hYUZmS3FDMFJMK08v?=
 =?utf-8?B?TGlYVEdNM3N0VzA0ajM0SFozUWhSWWswcmJpMDZLZFd6QUhScWZoN1F1OHRK?=
 =?utf-8?B?NlZ1UlNNMGxXcmJ4QllVMElabkR2c2ZGY0FUdnRLRWx5ODBFSnNhOFprNEtv?=
 =?utf-8?B?UkQvT2tOU2pNd0lUY08rbFIyMG9JWk1IaklFZGtuaXVqb2xDSVg4RzJPV0p3?=
 =?utf-8?B?YzdrQTJYbkw3YmliUk1lY2NuQXBEcWpJQStBaTlRMmpPZVc0WmJ1STJCdm5v?=
 =?utf-8?B?N2JSTHJhbVJLWG9UR29ZQjFUZC9uelZncGFnb0xxSVZQQ0VpZUpNNU0yVXl6?=
 =?utf-8?Q?Oo8wj9VAPWh56?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHYwME5MTU5Manp6ekphU3gvQWhldGZ2WE9IYlRzdG9WTUgwV0tzMmlTMUQ3?=
 =?utf-8?B?bnRXQVZZWVljaEQ4MHlXOXBvOUNrZ3l5SkRVTk1Qd0JOMkFUMzdwUllEVTVF?=
 =?utf-8?B?MkdNbzcxZlAvejBjdWZXeWRUODBPeEZBZ3l6Wkt6aFpXRVdtODU2QytMTlpw?=
 =?utf-8?B?TnNENFR2ekpsVVIycnNvUTZjWmlyak5HNm90NkhEdG5HRkR0MXJGcFZxZW4y?=
 =?utf-8?B?QWdtUG1VTktUajF3alJTc25IM3JpZnIvQW5ETVZRb0ZJL0VFZjlMSk9sdzBM?=
 =?utf-8?B?QnBKTU5SZTc1Ky9SVzNiWFpuSklaQXdCckVMOUpUYUFtWThHQVFKY2lyS25P?=
 =?utf-8?B?MVU1bHlNdDlkZ1pFbVl6b1JnRlA5MnJnOGJPWW1YdVo4ajBYdzVnZERWclBS?=
 =?utf-8?B?M2YxQmxvbFFTMGxIUjRTV2JMN0M5bEwxZllON0JXdkxqL2FuS3lTMkdjVWt6?=
 =?utf-8?B?ZnB0RlAvSzNtOFF0L1FscVVxcHV0dVVvZ0psSHdJc29nUWZiWXpod2FyL3l5?=
 =?utf-8?B?V1Y5bW1qdzZIZytsYkxzeVlJNUg0NE1QSHVnUWdkc0dxWUdwSjdGcE9xT1Bm?=
 =?utf-8?B?bXJ0STRqeFRIdHdjcFB3R2JORHJxMXBzbWppTjlyL3RXMXUyV016czVHSnpu?=
 =?utf-8?B?VHNNVTFHa0NYdFB6SWRnMEtDYjZYdnIyUlQrRGNOVDJzTFc3Uis4aklyYXJx?=
 =?utf-8?B?VFArM2ZvUStWT1VnMFpEcmQybEVCNEZiN0xURjR4ZnRmcytGRHhCZkZXaVQ4?=
 =?utf-8?B?eUp4ckxnY1pNbVM5WUpxeGk0K2ZtQlE3U01HK2xNKzNYZWR1bUU5aHJIbDA3?=
 =?utf-8?B?NHk2UmRXZmUxOGFkaDZkRGhHam01R05walZmM3BMTHR1NXN3L2JINEpLc0pW?=
 =?utf-8?B?ZTFOM1hUaGthZGh1anNySE8xa1BJTGxtcWdaM3ZzWWx1S1pHRHpZRjNEVlVU?=
 =?utf-8?B?SFRRSnRaYWpIVEFtU2VKbi9GSm42L1hjUzZIc2lOVWgwamtVRGQwSXQ2cVFm?=
 =?utf-8?B?M1l3Z0FmeXpLZFVlVWtwZlJWSjZDRCtYdkZNOENhc1ZHc2FEaFI4OEduV3R1?=
 =?utf-8?B?ZThXMmt5TlVzaVd3TTU3WTVuZUdUTDNHYnovTE1ZTjBISmRHNWZlU1ZMQ2Fh?=
 =?utf-8?B?MjZIbnpqTlpHMmtRbEV6ajhpN0tyN2hZSnpPb0JMOCs4YytyY3lwVEkvaExP?=
 =?utf-8?B?cVUvSjh4enRPRzJDVzg2SzlIa0FEOURvM0NjaDRrYjZUZU5tR1cvOUhhMmpK?=
 =?utf-8?B?T3g1YUtIemM3ei85QnBBdGpsRnVRaXh3YnprUFNCTllzdy8wTk1LWGRMWVlI?=
 =?utf-8?B?Q2QySUlFdzRYZ3lWK0Vub3EvVXZ2V2dzOER0azdXWk81eng4MW5XbkJCeGZX?=
 =?utf-8?B?SEU0WHo0M2gvVG1Rc2ttRW5Nc2tYQjdLMHExU0pmMyt0NzcyWXFCUVpiNE1u?=
 =?utf-8?B?WHhSdlRLdkhqVGFPYUFyY1Z6WW1rbTBEdHZkbnYwc0VkUVUwUElUdUJkTkdP?=
 =?utf-8?B?ZDE3VUd5ZHFJY2VFTy9pNWZ1WVROcDV6QytGWm5ndW9JMWJCc090UU1hMGZj?=
 =?utf-8?B?MFF0Z1VXUE9yZWhXZzRyeUVHWUN1a3c4UTkxSk5yUkRSc0w4VE1xM1R6UUpK?=
 =?utf-8?B?QXo2K09yRnpReHNHaE5sazA3WVRoOFkrUlpMQi9JZlVXYUdKZFp4TFBRa2VU?=
 =?utf-8?B?cDNLZmZiZmRzdXp6RzVkYTV0Zzk4NXJGR1FvZVRFNWhjQ1RHRS9ZelhlZWtM?=
 =?utf-8?B?TGpEaVFFK3pVVlJnSDBzZVNUNEE1YXdPdXg4dXVRK1JoK1MvcVVnTDhWK0wv?=
 =?utf-8?B?V3pFV2F4aWRGZ0hRcU5rUFZGbFNNZU5JalpnYmZqa1dVOXJMQTBNbkZLTlg2?=
 =?utf-8?B?ei9QaFUrSzdmU0FsVFRyTDNjVlBPbC9URGEzZUlTRnU4SExvM0srd1pCR0hJ?=
 =?utf-8?B?ekVOSmxiRmxtUmdEc0ZBdnp4U2UzaUV1NXZVSnF5QlNWcWxrUGtIbVd0a2o5?=
 =?utf-8?B?dTVnMk1aVHR2Mkh6L2JzbStGVmsvUkMreHJxajZ6V0QxS1c2V29zczlCZXJV?=
 =?utf-8?B?Rmg3UzZ1VHhhcWVCUmxXajBkWjdpSEZUbmxnQllCVG8zdXlDQ3FpYzZuY2oy?=
 =?utf-8?B?VnNkRnpTSjR6cTVqSTFmL3FpaUQxNUNiMURNN0gxaEx6T2tjS1RURk9YNTdK?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 355956af-ca68-4260-05c2-08dd71d36c17
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:45:02.3383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZOP2k8bvvtaM0vtp3maIDIcTsvGPxU9VrwNuuP5qjIecFzXph+gPLyV0vnyjZcOHBE49UDpd2BCSIy7usU73bNGx6pKUnM05CPRIDL5Pns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
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

On Wed, Mar 26, 2025 at 05:29:31PM +0200, Ilpo Järvinen wrote:
> On Thu, 20 Mar 2025, Michał Winiarski wrote:
> 
> > LMEM is partitioned between multiple VFs and we expect that the more
> > VFs we have, the less LMEM is assigned to each VF.
> > This means that we can achieve full LMEM BAR access without the need to
> > attempt full VF LMEM BAR resize via pci_resize_resource().
> > 
> > Always set the largest possible BAR size that allows to fit the number
> > of enabled VFs.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_bars.h |  1 +
> >  drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
> > index ce05b6ae832f1..880140d6ccdca 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_bars.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_bars.h
> > @@ -7,5 +7,6 @@
> >  
> >  #define GTTMMADR_BAR			0 /* MMIO + GTT */
> >  #define LMEM_BAR			2 /* VRAM */
> > +#define VF_LMEM_BAR			9 /* VF VRAM */
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> > index aaceee748287e..57cdeb41ef1d9 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> > @@ -3,6 +3,10 @@
> >   * Copyright © 2023-2024 Intel Corporation
> >   */
> >  
> > +#include <linux/bitops.h>
> > +#include <linux/pci.h>
> > +
> > +#include "regs/xe_bars.h"
> >  #include "xe_assert.h"
> >  #include "xe_device.h"
> >  #include "xe_gt_sriov_pf_config.h"
> > @@ -62,6 +66,18 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
> >  			xe_gt_sriov_pf_control_trigger_flr(gt, n);
> >  }
> >  
> > +static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	u32 sizes;
> > +
> > +	sizes = pci_iov_vf_bar_get_sizes(pdev, VF_LMEM_BAR, num_vfs);
> > +	if (!sizes)
> > +		return 0;
> > +
> > +	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
> > +}
> > +
> >  static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> >  {
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > @@ -88,6 +104,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> >  	if (err < 0)
> >  		goto failed;
> >  
> > +	if (IS_DGFX(xe)) {
> > +		err = resize_vf_vram_bar(xe, num_vfs);
> > +		if (err)
> > +			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
> 
> If you intended this error to not result in failure, please mention it 
> in the changelog so that it's recorded somewhere for those who have to 
> look up things from the git history one day :-).

I'll rephrase the commit message into something like:

"Always try to set the largest possible BAR size that allows to fit the
number of enabled VFs and inform the user in case the resize attempt is
not succesfull."

> 
> > +	}
> > +
> >  	err = pci_enable_sriov(pdev, num_vfs);
> >  	if (err < 0)
> >  		goto failed;
> 
> Seems pretty straightforward after reading the support code on the PCI 
> core side,
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks,
-Michał

> 
> -- 
>  i.

