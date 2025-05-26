Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFBAC44E5
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AA110E3FB;
	Mon, 26 May 2025 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNjSA3th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB12F10E3C4;
 Mon, 26 May 2025 21:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748295883; x=1779831883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VogZEUq42S9C+3/YVNPRA8GO5eJbkhlSV4uZLLv63L8=;
 b=bNjSA3thiqb9EYBnqjX7DhdmHra29j13Frm3N4CKYmFlHnSU0+kxzhCP
 3gCinGLW1381zpwUsoHIpQcanzZKo7aeRk4dy5aFo12ZTbA+3t3o/Suus
 CyNkcDz6a4oXWJx22da1xOeuoKCBPmxzpHJJTjRTolsNu+v6iJiW1gK7P
 tp7UrkNCJnlJRB/JqngNsHLFBNfutP5jCCOaJ1iZlLL/bw/7DI6QB8XLc
 Ipi8ZU69ldK6enH1CXy5ZbLlm24R9ihnr7Ni+uzcTPMyzyqEb7rMfW8Md
 D/YTPug2wJod43n/IdEvftBmB6Ni54qelOw8ceQdfktwkqKCeN0OE9R/E Q==;
X-CSE-ConnectionGUID: xzv/Ug6DTfKCpbmJvazuFg==
X-CSE-MsgGUID: cRcXOnYAQBivxftRNRlg4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60928256"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="60928256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:42 -0700
X-CSE-ConnectionGUID: TR8YjOP1QAm4D/r9QyswAw==
X-CSE-MsgGUID: vTE5nBnsSO++j+xSIKyWiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="147766330"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 14:44:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 14:44:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 14:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKm6ZixpxXoduT7xpG0kKbGKqKFdgNfwuDJtzcf9JsUenc4+LDoTKPSY4K+SbzMEWxSmicu8G/af/1hppBg5zNqnU+dUoBzBlPNAbfXDD8IO5aeBVwxEdGpIfoS0Yzb6DC/K6OexeOd1v0mbigVqsxIyoK9lhs9EqRcwAoQOeZtxIkm/o3JsyrHbb03+on5ptZ9NjYvqfMvhwHLmAqUfyZacVSfYMLYeRA+6AZny8okCZA9/v/KIJhTYo+yTyC1OyGr4tY52PlsqZQ9B1LWQDvWFTlUvpJycS7GKaA3rRVcHePbekSUCPc5Dl/YwZBBzIUWesZmCq/Tt0k9tdfIDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqsBjtS4t9id2YfqkP2y/tiTpdE3CRBklGDZkqpw9tE=;
 b=rw7jZPNq3uvA8dl2KM+l9FL8BSjPtvvaMhJioK9A/2J4s2cI/imKG++EZNUYA0YVcZABw7ck9twyMo/7X4Ysk6yjkvz6d3pvkc4h+SKmej64DR+rIDKhksqun4gTsH6BYLRCGtIbJg7jdlJU6wsM2JgET6Vwf5fwwBRdLRjTHoFyvwBR5+A9x/DoRDmf4whvHOBt8vaTbKqCWoHFsjntPUUYn9EFnCDrm+6VDASNHLrsRIgLx38PvdWcML07CEmt5Qrr32xjbx1f6kjd9DBC88p007xHA1Gv3s6bqJCzeylhqekIT2kYxpoc/awdpA/QnFr8g5xFAoqN0zJxCby1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Mon, 26 May 2025 21:44:21 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:44:21 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v8 3/6] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Date: Mon, 26 May 2025 23:42:54 +0200
Message-ID: <20250526214257.3481760-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526214257.3481760-1-michal.winiarski@intel.com>
References: <20250526214257.3481760-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 29069204-34ea-47de-da79-08dd9c9e7944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3FLWGZaTlNlK0h5bG40Z3pPYUNibndQYlRtN3dJdzN4V2doZU5rRVN4Z1hV?=
 =?utf-8?B?WTZhTWhYcW1tU1gzbXlUMlFLOWNJZmdvTmRac2pycG9CZENOeTJCUHRwU3Y3?=
 =?utf-8?B?WGcrQ0ZqZEZRb01KeVlNR0xIWnNFaFN0VjVneDNKSy9kOU02WXo3b0d0dVhX?=
 =?utf-8?B?cEdhaWFLbEFsZE1hTUt6MkxqZlRKNnZaVmptTmJPY2lRdEFBWXYzdmYxYzdt?=
 =?utf-8?B?V3pBWFE4Ykx5QTBmb3lYQ2JQTGVJZHlvNkZ6SE9SN0ZHZldobTdNclVCWWRn?=
 =?utf-8?B?Z1Y5QjdKL012NjgrMVptUFN5cVBuSjRCTzA5b2l2bVFtQTJ5d1REZ1RXRllx?=
 =?utf-8?B?YXRaTjl3NzUzczViQmxhKzQ0N0lVVk5MWHFDbk5ZNklFOTNZWlFYcmdsN3VM?=
 =?utf-8?B?NUtkYzBhVWJQL2lvc1hlVXVXYTloWmRVd1E1ZFQ0VVZPYmVUdTc1a3FkSjkx?=
 =?utf-8?B?UXpiVTQ3VktKNEpLN3JJSEdJYktWKzZuWk1XK0dxMDNSUmNEY3JnZG1UN0Nt?=
 =?utf-8?B?Q2o3KzFoUHBWM2ZVWjkzMWl6MnZ3d21sMVNiZGc0ZHhhVkRXUjhtQzluVHc2?=
 =?utf-8?B?ZmpPY0t1a1R0em82cVBFQ3N0Rkw1OWUwcEJjVFdYRUNTZWRjMXNpRGVmYmpy?=
 =?utf-8?B?TStyM3VYUUM1Vi9CMVY3c3hnM01Xc0Y5M09QOW9Tcm1Qak9ldlZOR3BzdGQ3?=
 =?utf-8?B?Q2dvV2hiY2FUQit0VGFuenljcEh2aTJxcE1kQktnOUx0dU5RTm9IdTZ5TnNE?=
 =?utf-8?B?WXZnWEhuaFp6NXVMS2ZXQWVrc3E3ZHluQnNzRHRabWlvdDAvM1NWeTZpTTJQ?=
 =?utf-8?B?eHJMbGpnb21BSDJPak01ZEhOMmxPRDdwU0p2QndGNm0xZWdML3lrUVVMU3Rh?=
 =?utf-8?B?NkN1NzA4bGFhS0lIUTlJdEVCV25CSlJiczVwOVRGM3NyM2JabnBkeHU4dnRx?=
 =?utf-8?B?cUNnemRnVTQ0dGF4OU5WeDhvRDM5QzRJcFJ6S1hXY25MakU0YUJtQS8yNWxD?=
 =?utf-8?B?SzBnYmkzRTBCU1g4K2NGVXBLUm9OalY0L0J3a1FXWTBCenNCODJXM3ZLc0NQ?=
 =?utf-8?B?b0F3aEtJeTJSNzl6aUNGdHZIWHVuMXRjU0Rya1lVcC9Ed0YyUUJ6OUxtcEpa?=
 =?utf-8?B?eU5UVkdiNGlTbktza21QMkJQZVI0K2VkS2U2R1NLc3pSbmFqdmtWQVNrNGxi?=
 =?utf-8?B?Q0RDN1U0UnBCYW5oL0N6cEU0VE1MZ3Q3QlpMRUMrN3daZHU1Y3NXR3dLL1RR?=
 =?utf-8?B?OXpjL0pIZFp5bFpOVWZoWm5SODZieHlJRTcwM1ZwcUYvVGdqVTZwYUY0T1N4?=
 =?utf-8?B?V0xhWFNLb2lZMGxRVkNyOEJzNUh4dDNBSm9LQVlKa2hvT3RiZktRM0JGMUMr?=
 =?utf-8?B?bGY1NllzMDdRUVFGNy9yZy81VDJoZ1JXcTA0UW1pYzl4ZzQ1SkE5M3JhSmhU?=
 =?utf-8?B?cWpUdkpUUkxtakpWTEF5cTlwSTY2SlJjb3g1SGU1VkFqckhzNENxMnhHWi9Z?=
 =?utf-8?B?Rk91NHhZaDFlMkFKYVZKS2MrQUlDTWNiOFVvcEtmYTNXenNSeXJoV1JudHNF?=
 =?utf-8?B?Z0dpcDZlTjhYYXcxd0syQU5BcjdnMnAwREZaSGNtVVhtcWFxRXErZEVOdXpt?=
 =?utf-8?B?K01WSzZDa0hBQVBYU2xFUUM5ZHc2M09jbE5aSE1hb2tYOW1UaVBsVko5eEZB?=
 =?utf-8?B?R1c0RDNEZkd3ekF5R3M5aTd2R3BnVHVEUm5pQS80UlJaQlVqdjRaMk5STUMy?=
 =?utf-8?B?ZTYxdGxpT2UwU2ZwTzRuR3hoWHd3SWNTV0NCMnIwZVlzSEZXTmNKNWVEb0k0?=
 =?utf-8?B?aXllZGdoenFwTE4xUVRJSWkvcVZjZlhicnNMREh2a0JEL0FGTm1RenZodSt0?=
 =?utf-8?B?M2hSbkJHNHk1dWlKYlJjVVkvQjAzazdKV2lhQUxQL0ovN2RTbzlkOENRRWN6?=
 =?utf-8?Q?PMHq1oKo+x8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9HdHhUTVU0VVhHR3pLT1pYVExteHB2cmJMbkxlY1RLbnUrbDMzZ0dvSEdO?=
 =?utf-8?B?a0xwUFVoaXhPSkU2Mk1meTV4ejl1NUVGY0QyYnU4bW5PanJZUHFTL3FhSDdD?=
 =?utf-8?B?MkIycUxhRUVQL3BlODlwTnErbVRHd1Zpb0Voc0gvQU1TMXdPSHg0WUhzU0ZW?=
 =?utf-8?B?b1g4c0h2RW9KQzZuM3dqcHRKZlJ1YkFPaUFqUVcvYzY2bmtVa2xxRGppdG50?=
 =?utf-8?B?cE5xczg0OWtnaTdEaXRHRDB6WXhPQWN1RTdwQlpCNUQ5VlE4SkEwNno3L1Fn?=
 =?utf-8?B?c1M1ZGF4cG5XbWRxbnhnWlpzTkFnMnFnNDQxOU8yWUc4WjdxQ0wrZzhDejFF?=
 =?utf-8?B?TDFsQWJjQUZKa2RtbXE2Q3lyMDhCZWVUeHIxWGwzTUs3VGxjT0RVckVaektB?=
 =?utf-8?B?VGhpS281YWRZaDdoNkl1eHhmcEhHZXEybmdnbHRGVVc5MUUySkNYUzY4K3hB?=
 =?utf-8?B?Ry9nMnpjYzlQNXhVZFdMcWNZZ0VmdEUwUTJBa2RPL2Z2dU9zNkQvdDFUTWI0?=
 =?utf-8?B?UE1qUVkwM0hCZTZPdHprV1JDcVhLRWFrRUR2RmJzdERFTWs3U1Mwc0ZFVWlm?=
 =?utf-8?B?OVYrbWZkVTczNW9hOWxDbkI1K3orb3RibEZHN1ljbFplMGhJUmtXV05nVVRn?=
 =?utf-8?B?VVBndGZIdm5IYW1uaG03ZlJQWFhmQmtNVHordEhQckFsTGdCN3NzSVM1a0lU?=
 =?utf-8?B?WUhQVWxzVkNVRnNhTnZ4ZHVmcDRxZ0cwSGpyK0hWWVdPVWdXTjdjUmNCajBM?=
 =?utf-8?B?OFB5TGVZMmFBN1M4QUVrMWpOd1MvWEtZbldXb1ZGa0Myak5SMjhzK1cyRU9l?=
 =?utf-8?B?OGRTdFhwZ3BGcFY3Q2pVc0Ntb205YkpEejZnejdCRkdYR05oLzY2citYNURF?=
 =?utf-8?B?YXg0cGpBY25uUWdxUGEzT293d2ZpeEhoY1gxMTJ1Ump6aVJkY3lJbHJ0WTdx?=
 =?utf-8?B?QWtGZHNTMTBnM2dEa1V3YnBSRit6T1owL0NPeSttZGRJSDd6eGxMVWFmK1dC?=
 =?utf-8?B?aUNxT3JUQm1VdFZMUnBJR3dTTllNRDlwVWxkVkJMWm9OaUcwMGlPZjZqeFFU?=
 =?utf-8?B?aWxLL29JRkpGWm8yTGhNREZaOE15ZVNuREJxempudGk3OFlWQWY3cXFBdVkw?=
 =?utf-8?B?QlBSTWkyUE9HWHNaOWxSTFdSLzQ5Q2JGWEtoVkQ4QVdvblJvVnhRcVlsNjJx?=
 =?utf-8?B?U3Q5c1owTFp1Z2JLNlBUT2dybTNTQlVTb2Yzd2VoQ204SUw5YlBTYytsSnFh?=
 =?utf-8?B?NjM1dkFxcGpvWDlQdFVtdzBQaVd2WSs1azVKcjZ4bHN3cjh1aVFabTk5RnlT?=
 =?utf-8?B?NEdoZkR5Q2RndzJSV0JPdGM1NU5sY2kzbFlaOHFBSHNwdDRhTVJvVkpUQXk3?=
 =?utf-8?B?TnY2dEwwOFJ2WkplMW5oVmtOL2kxSnZudXhwNmQweW9DT25Fc1lWaVdyMkNz?=
 =?utf-8?B?SFZDQjVzZ0RqemlYTkRyaTgrUE1MekhGQm05aHNvV0hQaDhNbXU0akJ6cTFl?=
 =?utf-8?B?cTBabDhRdm00SGF0T29MWWpET3UyRlNNT3IzTTRqVFYrZGZZMFJkbDViTTdY?=
 =?utf-8?B?bklyTmlUN0M4cUU4Rmo5bHZBRXpHbWhUa0o1OXF4azRNY2xnWG1kU0pLTEN3?=
 =?utf-8?B?ckh3dVMreEVrL1pCMGFRRTNJNTluTFNzNytlNXdqdWNvdDhDalMwS1czWVB0?=
 =?utf-8?B?UWxZZDZlMTBUZ2xoRzRHb0hxTGNlbVFnQVU5QVRMV3dvdDIwdGhJcVBWRktm?=
 =?utf-8?B?cjYvTElsbm5JTkJEN2lNS2lJQ1U2OHVaNUJTNU13SENvTGd3d0szOUhDbldN?=
 =?utf-8?B?dTdXenBmM0tvdm45SU85SW9kQ0VzZ2FWZ3FmTk5qcmZUZFpHdnR4YTFiK2lW?=
 =?utf-8?B?OG94SThyYkNGRWtIeW9XY2ZheEhyWnFibEZWZzlaU1RXcW4vWTM2YzE0akVs?=
 =?utf-8?B?SGlndmhIclFlNFhLWnBMM0d5cThGaDIvRjFNVDhYUlpEcXpPd1kvK21tOUZP?=
 =?utf-8?B?WGM2Ri9KczA0bmNmSXZNcmVWQkM3U0pDYmwwZjFzUGdRWlZwS1k4VmJZdktP?=
 =?utf-8?B?MTFJYzRvdTZQL2pXRTN3WkM1MjRZbFhEQkN3V1ZqZjhqUThHSCtKN0IybW5C?=
 =?utf-8?B?L0R3Nks1ZDZ3UDdWL2RvS2JtbThCdmVyTFlqdHdBQ01QT2RIYWhHenYwbFJq?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29069204-34ea-47de-da79-08dd9c9e7944
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:44:21.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKpQDDgzqC9/f7u6y6qmBjvuOZ69YLGGLyCGSTg7efoHn3qfdWP5+kcc0xGMCDwySEVRYFg/kIeZ1BHa/e9g+F3Hws0khjEh7Vk+78yWJxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

Similar to regular resizable BAR, VF BAR can also be resized.

The capability layout is the same as PCI_EXT_CAP_ID_REBAR, which means
we can reuse most of the implementation, the only difference being
resource size calculation (which is multiplied by total VFs) and memory
decoding (which is controlled by a separate VF MSE field in SR-IOV cap).

Extend the pci_resize_resource() function to accept IOV resources.

See PCIe r6.2, sec 7.8.7.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c       | 21 +++++++++++++++++++++
 drivers/pci/pci.c       | 10 +++++++++-
 drivers/pci/pci.h       |  9 +++++++++
 drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
 4 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 3d5da055c3dc1..fee99e15a943f 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size)
+{
+	if (!pci_resource_is_iov(resno)) {
+		pci_warn(dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+		return;
+	}
+
+	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
+}
+
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
+
+	return cmd & PCI_SRIOV_CTRL_MSE;
+}
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 9cb1de7658b55..4dab617ac2186 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3752,7 +3752,15 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 	unsigned int pos, nbars, i;
 	u32 ctrl;
 
-	pos = pdev->rebar_cap;
+	if (pci_resource_is_iov(bar)) {
+		if (!pdev->physfn)
+			return -ENOTSUPP;
+		pos = pdev->sriov->vf_rebar_cap;
+		bar = pci_resource_num_to_vf_bar(bar);
+	} else {
+		pos = pdev->rebar_cap;
+	}
+
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 14514f4a20ada..80ef95da273a7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -711,6 +711,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size);
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
@@ -744,6 +747,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
+static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6657cdd06f67..d2b3ed51e8804 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -423,13 +423,39 @@ void pci_release_resource(struct pci_dev *dev, int resno)
 }
 EXPORT_SYMBOL(pci_release_resource);
 
+static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
+						  int resno)
+{
+	u16 cmd;
+
+	if (pci_resource_is_iov(resno))
+		return pci_iov_is_memory_decoding_enabled(dev);
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+
+	return cmd & PCI_COMMAND_MEMORY;
+}
+
+static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
+					 int size)
+{
+	resource_size_t res_size = pci_rebar_size_to_bytes(size);
+	struct resource *res = pci_resource_n(dev, resno);
+
+	if (!pci_resource_is_iov(resno)) {
+		resource_set_size(res, res_size);
+	} else {
+		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
+		pci_iov_resource_set_size(dev, resno, res_size);
+	}
+}
+
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
 	struct resource *res = pci_resource_n(dev, resno);
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
-	u16 cmd;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -440,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (!(res->flags & IORESOURCE_UNSET))
 		return -EBUSY;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	if (cmd & PCI_COMMAND_MEMORY)
+	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
 	sizes = pci_rebar_get_possible_sizes(dev, resno);
@@ -459,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	resource_set_size(res, pci_rebar_size_to_bytes(size));
+	pci_resize_resource_set_size(dev, resno, size);
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -471,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	resource_set_size(res, pci_rebar_size_to_bytes(old));
+	pci_resize_resource_set_size(dev, resno, old);
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.49.0

