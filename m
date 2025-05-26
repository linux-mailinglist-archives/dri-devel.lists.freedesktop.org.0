Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E90AC44EA
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953E310E407;
	Mon, 26 May 2025 21:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtICASM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1796910E407;
 Mon, 26 May 2025 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748295887; x=1779831887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=K2Wtyyl8UwL9HB3x/VMpaA0zbmJuNVgYX/MM5cgJg0E=;
 b=gtICASM7N0GM1jBf/0/8w9JJQ9rzzGPR4QDqm0FnU+fw78G2aqqVSiHM
 sGi1u6OUt1qPLMoIB+OrQidfpF2kyWR63+4RS/in7ulr/y80S4Pm8w1De
 pFxWnDlmBbkYAQjKV4lSAU2CqZIvAH3xbo1OTaiTrrQSNurqdhCal54Aj
 xOrVCJmrezm4hlt9Kwuvm/vJek+AKibfkdPWhiqvtRkXIW3BPoZ+OrdBO
 gAIQGX8YRfqoWnhwXYfXMpogr/kjvrskvx35rRwQtDT1lzj7KGIao+UzD
 Gi5rNledkDqBcUampMmT8i9s4UaPbETBlclYBuVerrQeM3Swy6VeTv04a Q==;
X-CSE-ConnectionGUID: 0KJV/OZcQN+4LWLvmmTw+Q==
X-CSE-MsgGUID: ZuhmObnKQYiiuxJH220fsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60903565"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="60903565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:46 -0700
X-CSE-ConnectionGUID: CcGt/fJMSViMhTecUgri6w==
X-CSE-MsgGUID: rSst1a6WTyiYYl/WUpUB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="143113952"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 14:44:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 14:44:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 14:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMM6ChV0FEjU+RCbK+DrWdAU7lVacOriio4F2usHfZh2q16dAPMajMupXTlXEdKhPbvTxqM6cOuXiOC67ZkDXcX8G/YkLCkVB03MLpl8S1yrHeMhqGtKiWafEFfX3Zi3f0obRvpyOd9DSw3yBDN0OD7f6AxML8BqczMFf2R10hyTwoPp7cLZmVPTGfTBAgzmnI/tqWBN2DSpZ74O51x/eHOdPuwE5gE1SKo8Bk/n5dh0irWFNWcgGCVBNoSvHY6mrMQSacypLi9SKz7O1JWQSPYPop/4eq5R1qbPA7EwOB4bh0xpbA50wfIpKWF7xOyQG+g2hRYo6qDvlg98iRj/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFUkGNjwF1QhSVXkXDuzTljB1Sp/de4DQZXE0QHn/GM=;
 b=eopGk+FFhraxS8V1X4RGQaLAP5PkD1bNY31Vn+DG49MTpsiX4rXfJnNvTt5rL2fYwQm//NEwK5y1Xy+X15NWRBU1aRzYUetf/p/l9Ohw/EhChP9g+c/mAbHs7hR2PeqMMdJZkzIIiiJIDc+T5F5Kapkmd5RvT32OWd82sULI2DhfIKlsOR2gF1Xd4qJjnGEbpPPcekQkRvs+RNV7BPSTVwTGph8kjJ+2Bj5GWOMFdFJJAvVfZzYtbDB1vgJt705xLS2o/508W3SFXHVpS2QGLnqMqBbytXq7r7TNukb+ZSiRDqbj/6Fj4OoI5dGMxyNGYR+g0yHJ1xY8IAoUlxGJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Mon, 26 May 2025 21:44:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:44:14 +0000
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
Subject: [PATCH v8 1/6] PCI/IOV: Restore VF resizable BAR state after reset
Date: Mon, 26 May 2025 23:42:52 +0200
Message-ID: <20250526214257.3481760-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526214257.3481760-1-michal.winiarski@intel.com>
References: <20250526214257.3481760-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 33b5a180-60d7-41b3-bbe4-08dd9c9e752c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3NRd2VPVXhCUGV2U3daSU9IaHFLV2dSL3k2SXRmS1hEK2VUTG02T0UxUVBo?=
 =?utf-8?B?M2U5S1VSRXpGNWZNNDBsYk02MVZJbGE1TzUxWTNKUzkyMi8rTm00bi9OVUJB?=
 =?utf-8?B?eWZwYXdlRjVaKytPeUxFU3VTeEJLaU9mOWhZTE1uWFZQUlNqbkRleGQ2b3J0?=
 =?utf-8?B?YXB4UTRwNHZIdUdhRFNiakdMWG5DWjVIN0FISGI4azV1KytnRDlJZjhQSUJV?=
 =?utf-8?B?MmVaRnRudlkvMVY4VlNsSFlTeVI3M05pMGtEUTE0ZGtZMjhOSFdna2dlNDE0?=
 =?utf-8?B?aTBGL1RrMDY5V0V6TzRoTTZUNVRqUEswZGdtdWFOUTVFNWNxdVF4cEJ2SEpx?=
 =?utf-8?B?VTBpVFc5N1BDRnB2L2JjVzU0M0NuQ0Nhek11RGN2RTBZSURZSzliOStjd3Vq?=
 =?utf-8?B?YVo0WStpUFVLNXFWNUgvbUtPMllCWC9NSEpUY0hmdGdxbjFRSk9nMDF0eVl6?=
 =?utf-8?B?TGc3RzQ0Y0Judjd3WCt0dkQ5ZzNUaVZaSjJ5OHM5VzlrVXVaZFdjWVBhTU9M?=
 =?utf-8?B?UE9USVcvQ2YzQWh4cW5RdXF3ZWdyaURSQXdyeWtQRXI1d3RTbzZEeC9Rd2Vk?=
 =?utf-8?B?YUhEOXk5YzBFeThnakZYNzVoWGRpK0JlTUM0V013bU5UdERYNVBjNkR6WjBh?=
 =?utf-8?B?enBNd0NnRTNvNW5pTXdYanlCUXRmVUF5eUthU1ZaQStkVEwyQTRGd0pySjdz?=
 =?utf-8?B?Z3hKUlZHaHJqbHdrd0Y1VjNwbm9zZndCeHRpR20xQVEzY0xtSmlmcXRveGRy?=
 =?utf-8?B?UnZJM3JsSk9ERDNFVnM1U3hOMWxNQzhGMWkvQVVOQWdOWlZCblA2bmRrMG9J?=
 =?utf-8?B?WjNRY2k2YkI4bzVBdTN0UjFEc0NYUjVsbG81dU9DbzFtOUZpRmY0QWl0ZWhV?=
 =?utf-8?B?U01wTWhUUURKd1VsbmlQZHJZeXZJUUg0SExJMWprZzdEdk9SSkdURk1pYmc0?=
 =?utf-8?B?MDE1MlovR09Ga1BxWVRWRGJKcjNNT0pXSUxLWTlWQlZDMFpPK1U2bmlqVXp1?=
 =?utf-8?B?c2xpRmMrMEdIQm5hbDZvUWlDZUZDa0dZai9VVGZUSEs3cFM2TTlBRUZGNlVv?=
 =?utf-8?B?SWh0OUtNb3JJUzc3dURKaXFDYzI4Z0d6SjV0WFBiTWxZcWVycUhxMGFLWVdu?=
 =?utf-8?B?ejUyR0IrYjlKdDlrVDJvMFd2TGRuNndleDI4YjgzK054eGxPNWhESzlibWhY?=
 =?utf-8?B?aWMycmtlSGlla0UvRlM1aFFOYTR0TVpDMXFUZlNrSUJyNWhuRHVBVE5wTDRl?=
 =?utf-8?B?OGIvSEJKMkI2WUk5ekg1aFVGamFWeVZXbXZoY1NCTEZIaktiWjJEazg4ZU5i?=
 =?utf-8?B?K1ZYWmwra1U3UFJXY1V4MC9PekVyWTk0ZEtPaEppWEgwNTBLbWVlRlMxbEx6?=
 =?utf-8?B?SmE2YktsZlRTTitlQjJrSmRQK2hLUWl1NVBxT3g4aTNzaVZPSjhxQ1Z2ZWJ3?=
 =?utf-8?B?Z2lkSnVMMlM1K1RUQzA5M3FiUGlvY2lHQ2ZrK1BUM1pUSCtlUi9ROFVFQmtq?=
 =?utf-8?B?RmJ1eFVMcWpxUXZpL1F3cUJoQWgwWUVReW9RaUJXZlFYeEFMR0lkTGZ0cHp4?=
 =?utf-8?B?SDRyK1BNMVNxb2V6RTNyazQvNVhUQlQ1QWM0ZlNiaml6VHY5Sk9Ba2xab0U4?=
 =?utf-8?B?Sm5aM3ExZzFLSnVOelQ0OGREMWNQakJtS2U1WVozOStQdGhiaFFqbUtFS0lG?=
 =?utf-8?B?QlpXZHFQOENVK0c0LzMyanZSVnFoVXU3enJlM2JXbWpsRjVVU3Flc0Z5MUUy?=
 =?utf-8?B?RG9MekhDUUxWOHVacGFITnRvQXA0NENVWUZMUW4rQlcwYm9UQTdTR2RUMWl0?=
 =?utf-8?B?N1Z1clJCaTBWdDFKcEp6elVnaXgyTlF1V1B5b0ZQdmVsU3A2OUczT3pybmYz?=
 =?utf-8?B?Z0szaXpRRityajhucmlSbDlYQ1FoU0NHbGtVVkNUK3BRS3k5VDZZUG5xSUlm?=
 =?utf-8?Q?UB/1CszHwPw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzBUMkhrdyswUFhqLzUybG9Yd1pZNUwvT3hMZkFOQ29zQnFtWVMydXNyZ3Jw?=
 =?utf-8?B?UHBoVTJIWk5FdkdIbG5DWndianYrVFBvR1pLYm1ybjZERlAzUXBlWjFGdWhZ?=
 =?utf-8?B?cWR1dUhtU256WllObDZDUlQ2WWs2WG5mUFZyTVJXYXZlVVRwVDNOOC9CcXR0?=
 =?utf-8?B?OW9mY1ZDeVlFbFZyU21KKzNkRHNCMTVVMk9SWEdXQjlsUDk2QXI4d21ySGpI?=
 =?utf-8?B?MVZKS1lCalZXM1NuRHVBTUh0dEY2bDF5WU80U252MUlBOUdJR0ZWNnVVcnFZ?=
 =?utf-8?B?K2liZkpIcm00N3pWVDZrbEN6U2M0ZzdPTnlvZHhuTGl0b3hvbVI3Q0xsUmZU?=
 =?utf-8?B?WEtwaFg3TzEyZThnL1FzVkludjliY2ZBL0h2SzVpRXFhTiszVWNORGVGNWpu?=
 =?utf-8?B?ZzZ1eVZFSFlmYjNFdXJvNEZCckN2ZWZQVU5VOWZRcnZIckwvNkU3cCtjVUpS?=
 =?utf-8?B?bFJmOVdPMmRWTURuN2l1M0xJb3hPUmRnM2habThTNDZiYmxxOHZVTzJ1aHVU?=
 =?utf-8?B?WUFuS0dVUTEzdEw0ekRadWxFejY0TzlqUWJNUENXNFBsVnpUQXJZN3ZYaG9a?=
 =?utf-8?B?bGNoWVQweUhSaThqZ0R5NzR3bVZ0blJtTGs3NlZYZEk4clQycHcvdzZEa0Z2?=
 =?utf-8?B?eE1kMlF1VnBUZnFLTGdyZnFWbk9vdFhUd3hjL3NLZ08rN3h4TUNZS2xYdlRY?=
 =?utf-8?B?ZjZzTjVrdDhIeXNpQ3NzVTBGanlhbWJmY3gxNWtNRTUwb1lqVGtFbHVxQmhn?=
 =?utf-8?B?Q0twbXNMeExMY1JUTkxKYkppWGR5S2NKdkgvL25UOTBDUlcvWjEraW5aZWZo?=
 =?utf-8?B?b2RUbnhmeWNXWitrSjViK1NlZ2pFL3k3bE0yeGU5ZDdzbngxM0hOWHNVRUk2?=
 =?utf-8?B?eXJtc1QxYkNyT3g5MzZuOXFBSW9qeEZLT09FV2ZaQkxLWFVuWW1teXdmRlFk?=
 =?utf-8?B?NFJ5R25QUnkzbGdEaDBHeCtUbjl5VWFTR2tjSDRjR3NWTjNQSnZlZW8vQmpY?=
 =?utf-8?B?U1R1dkVPWmE3WkxOeUk1UFFCdWlIWnR6a0dKdHhPWi9tamNhVjBZOVJNbk9x?=
 =?utf-8?B?bnlhMks2M01vZE9BL29UREh5d3JRYnI1QXFWVjdrWnRoUVJXZTVlcXFRTjlz?=
 =?utf-8?B?Znl0eUw3YUNFUGYyK1QwME1zbjhBc3VZdE9hSHd2NjUxSVNxZUVJTTdiZzg2?=
 =?utf-8?B?aWpiUTM1dXFTVFFhdWgwdkxndFNZNUs1VXk1UUZkR0NUaHUxdG9SZnVuUG8w?=
 =?utf-8?B?VEh5UkowTDFFR3FPR1R4RkNNcTI3SWZHVVUxdmJyOG05dnlUMDF3Wmw0YW5G?=
 =?utf-8?B?TktHYWlST09RNlMxaFZjendZMUg4Qk5yclJQTlEzTzVNQy8wMEFacnNVcHJj?=
 =?utf-8?B?cEVtWWN3K2JKVlhIKzNTQ2VvYThLUS83ZTNVbzNtdjM5aTFjNmo0N1hhdEY3?=
 =?utf-8?B?WXVYaVlKOEVlWWhCazFnVFpTa1M5MG10cUwxdmJVQzdUY3lwYzFVTkVmWnRm?=
 =?utf-8?B?RzYxdi95bThvVlNXeThpWGN5YjF3UHRrQXpOMWUvV1pFWlpFcGw4YWNNV29P?=
 =?utf-8?B?T3FrbEpabkZjVXRUdlFtRFNkeUtkanI0aHlZZVRuZW9RNGZXbE9kb0xUN3Mr?=
 =?utf-8?B?ZVloSGVwREdtU0c5VFhkQ0NrTWs1NldnRStjczZUQ09CQmFWdU4wNnRBc2k0?=
 =?utf-8?B?QzA2bEVkQVI0WUUvNklENnZpWjBQT2dCM1JFem9JZE95d1Z5WWhhRm8rREQ1?=
 =?utf-8?B?aXRhZzVIczl2WVA0UDZRNWM4K3BtTi9odjluUTNpQmkyN3BPQlZYNjltVWUr?=
 =?utf-8?B?U3E5cXd4c1BwbEF3Q256OER3Q0dUa1dQUFNNVEVaRU96Y0wzSWJHUEEvYS9B?=
 =?utf-8?B?cGdWRDQwam92WlVNL3F2WXlySHVMZU03UG4zWURiVVREZXJWVTY0QmZSU3BH?=
 =?utf-8?B?ZmhoK05MM0xJS21GV2RWcnVUdzVXdVNrNklZcUk5UHRDb2gxUHJwN0lPMmVF?=
 =?utf-8?B?UEN2UzlQWDV4YUtJUUthbGZWdndDNmVHSTVRYVNGT2dXREg4TFordVNqY1NY?=
 =?utf-8?B?QzE2R0l3MXl3dUVXbFJBSmRXZGZjUW5UeEdRV3BlYXZwUExNSy9wMzhLb3Nx?=
 =?utf-8?B?azNNTWZTNGJjZzE2dEE3ZXdTOC95bmFoZjNlMXc1cnZyc2M5NXhkTmFCOW1Q?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b5a180-60d7-41b3-bbe4-08dd9c9e752c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:44:14.2310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aROzdwGnQG5EuvA/27UTWErOF0w8/tg1bKzlY1uL84YifH9X5IwZMMz4x645iiZUpBSOoqMxlI7N2qIX9y6jKHieJ9txYy5d6RrqK38uHmk=
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

Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
the system firmware or the PCI subsystem itself.

The capability layout is the same as PCI_EXT_CAP_ID_REBAR.

Add the capability ID and restore it as a part of IOV state.

See PCIe r6.2, sec 7.8.7.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c             | 30 +++++++++++++++++++++++++++++-
 drivers/pci/pci.h             |  1 +
 include/uapi/linux/pci_regs.h |  9 +++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 10693b5d7eb66..8bdc0829f847b 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -850,6 +851,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	pci_read_config_byte(dev, pos + PCI_SRIOV_FUNC_LINK, &iov->link);
 	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_END)
 		iov->link = PCI_DEVFN(PCI_SLOT(dev->devfn), iov->link);
+	iov->vf_rebar_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
 
 	if (pdev)
 		iov->dev = pci_dev_get(pdev);
@@ -888,6 +890,30 @@ static void sriov_release(struct pci_dev *dev)
 	dev->sriov = NULL;
 }
 
+static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	pos = dev->sriov->vf_rebar_cap;
+	if (!pos)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_VF_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		int bar_idx, size;
+
+		pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+		bar_idx = FIELD_GET(PCI_VF_REBAR_CTRL_BAR_IDX, ctrl);
+		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_VF_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_VF_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(dev, pos + PCI_VF_REBAR_CTRL, ctrl);
+	}
+}
+
 static void sriov_restore_state(struct pci_dev *dev)
 {
 	int i;
@@ -1047,8 +1073,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (dev->is_physfn) {
+		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
+	}
 }
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e39a2a5df587f..6e667623af32e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -486,6 +486,7 @@ struct pci_sriov {
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
 	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	u16		vf_rebar_cap;	/* VF Resizable BAR capability offset */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index a3a3e942dedff..f5b17745de607 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -745,6 +745,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
@@ -1141,6 +1142,14 @@
 #define PCI_DVSEC_HEADER2		0x8 /* Designated Vendor-Specific Header2 */
 #define  PCI_DVSEC_HEADER2_ID(x)		((x) & 0xffff)
 
+/* VF Resizable BARs, same layout as PCI_REBAR */
+#define PCI_VF_REBAR_CAP	PCI_REBAR_CAP
+#define  PCI_VF_REBAR_CAP_SIZES		PCI_REBAR_CAP_SIZES
+#define PCI_VF_REBAR_CTRL	PCI_REBAR_CTRL
+#define  PCI_VF_REBAR_CTRL_BAR_IDX	PCI_REBAR_CTRL_BAR_IDX
+#define  PCI_VF_REBAR_CTRL_NBAR_MASK	PCI_REBAR_CTRL_NBAR_MASK
+#define  PCI_VF_REBAR_CTRL_BAR_SIZE	PCI_REBAR_CTRL_BAR_SIZE
+
 /* Data Link Feature */
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
-- 
2.49.0

