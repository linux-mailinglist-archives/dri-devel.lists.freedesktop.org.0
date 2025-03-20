Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F19A6A482
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B94910E5E7;
	Thu, 20 Mar 2025 11:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aibBaItI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4E510E5E3;
 Thu, 20 Mar 2025 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742469042; x=1774005042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PMC3cb65PZY1zqKMUSX6Vo+OoWOPI+6VYGRdcem/nWY=;
 b=aibBaItI+Hwne4VNgh+AGSDY88bOxPCbxJHHZrbeNiK8qF93/tmb9yAA
 Wd2bLnvcSTdq9SWgn/FuaprEZ8KByc3LHO9ADUle/T2OlBWHtcuAj9PJM
 jaZfMCrF7jAajRNHEqnB4u1Ri4a/9wSMBbg50LWuPZyJohJRAT7Tldf2T
 AzB5gZheN1PKEXtJEGJ5R1GF0YdtI/8supuVImiXqO7EFkzWoyUAYsbA7
 TJ/LdSv/NHlF/FVNYOuJdgQjjcir+lJwwCF0rw8rLJNbxPduwaj0ct9oP
 5aIT1g9ECj/wLEBtejLAStWzjwPFj4rb+Byw+nq+5g49KikZNfLcTvLj/ A==;
X-CSE-ConnectionGUID: WWAiF3NhQhCZJAeENdMPPA==
X-CSE-MsgGUID: XQYS8kxtQx+rVntKJFJMdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47573402"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="47573402"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:10:41 -0700
X-CSE-ConnectionGUID: ldis87nrROmS5BN3tncMuQ==
X-CSE-MsgGUID: kawBaNZ1RwOUW/4jtumzYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="124003654"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:10:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 04:10:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 04:10:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 04:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSFzbMq9MhepbooQ9ZhWJdi9fLBtyNFrl9/bDhNUktetoIaJy6/deaaMttS72+juMx8pXMA2tfTRNQLtusOU7qukPFtjurRhxnYYe/fIUQKerjScrgR30bSWXVZtKgwzN2qSbGo8bSn5i0pnEeJLe59r0V/Zwt9jiegZhx5oXREjZgWFqmndGuVZL2gQkF78BsVEcGB5h1rHQ4G8S7pD9yYk6PLc/CFZpJOG5CTgNehRIyfjoXZV6l/Ynhrjy7D/AdZIHMG2SLre5xfeU6d909GMrZWWxbL5o1661o3Te2v+AnnNBM2NpmcMiM8YvGl2yaQtPX+3+a2dZzxu0Fo/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QYYi3unbwGCGFBCBZxeTyRJU6W7G0PfBVOw0RNUKjo=;
 b=lXzG2RBcvrmB/++ghDKiHXC/MtGf4D3r4lv6oucBFQwAT9i2evgKd7rvn3j93GliHwtsfyzpkbbMKt1wbkR6m68Yd1kZFV2bE9zt0rN9TeiOV9CsKKYqUbflx4Wa0GAPSNMvlqbLKiwiegwxgnd4cRBtkwDv8fVsGlv6m74Ir9xJer41vsgz50lPKi5q8sngDPoerwvEjHBPZxUKEpuqKZvyCoDU7XmJojO38MP2ctrUS58LPGaoMXPxaOqZFOsFdq0EcTjHu7owCzSRlOqj52VYjm+bKGLGUOGEPKRXdsdMiZxExsXQjWWXEc7UtPIprLIo4CTqe+MltehSiZEBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:09:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 11:09:57 +0000
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
Subject: [PATCH v6 5/6] PCI: Allow drivers to control VF BAR size
Date: Thu, 20 Mar 2025 12:08:53 +0100
Message-ID: <20250320110854.3866284-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320110854.3866284-1-michal.winiarski@intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0136.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::34) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 0442f441-0f0d-4032-b53b-08dd679fbfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym5mMmpQWlo0RDZpMzhjQ0t5bWFwMlZFanI4TFlDQ1ZaVFIrQ0pzd2Zzdnkx?=
 =?utf-8?B?VGZJR2ZRcVNrazdFRkFhYlBBZTh3UzdOLzRwZDY4Nks4aDdWdXNVZ1lCWTl5?=
 =?utf-8?B?cFRHeHArMXAzcjlZKzRvQjVLczZUSFNKYzYraktFM21vZ2FPWUNSR3ZCTlNB?=
 =?utf-8?B?dWNoR2tVWmVsWVJlZEJHa3dFVGdKU0o3QnRpcEVuSUJYc1VHY0RoRVd5M3Fp?=
 =?utf-8?B?Wm4xUzQxWHVKRys2YjBTQ21ORCt3cUxrVU9xM0RZWWhIT2R2TjBWNHRTWVVv?=
 =?utf-8?B?V1lZRzU2RFA4TkR0WUovWVhEcU1SWUxKaTZxc21KVjB2REMzdE92bkVPVXJz?=
 =?utf-8?B?UGRLbnJYUzlIaVBIR0kyTGVYTGR6NklnTk9ZRzRpaVRsL2p5NUtCalN0MkNq?=
 =?utf-8?B?blRFNHdDbjcrYll0OXh2bkpDbVlKRW92RVJYU200NDNnOEh5MjJrbnJTQzRS?=
 =?utf-8?B?by9iQ0pNSVVPWmpISWo4WXZuQUtqV2dkRVgxenEzQ2I5TVhUWWd1MGxVY1dJ?=
 =?utf-8?B?ci9TRUwzcEI0Yng3OVdhNjAxdFdTWGRIOHAvbG5OWFByNkdFZTNkMkZXUFNz?=
 =?utf-8?B?N05BU2o2SEZrOGZmZWZiYkZmMURocEN6OFJyK0RVUUsrZEZmbkFVc0orQ2Fr?=
 =?utf-8?B?bFE5dGxxOHgvU0c3bFpIQXptSUIxRjJxQkVQQzB4MjBkZ1NFMGdzbUF2U1Y4?=
 =?utf-8?B?QXEzL0FURGxmSVJSa2ZGYnp5ODhzVVVNcmpjbHFQNlNxVytGK25sQWpKM0c4?=
 =?utf-8?B?MXBJT0szRVdFc2NMV1ZhY3Nna1h6VGtxN05FNGlLWDZXWjdTZENxWEVXcmN3?=
 =?utf-8?B?cHh5aU9YL3doN1FsaUF6M1BuR2FrQUdOV2xtbURYMFh1WGRWaHBHeHVoYlc2?=
 =?utf-8?B?TVMxMFBVdXJubnVIQUpvR1RkMnR5NWRPMGFhRG05Uk1ITnQvQ0x1elJ6Y0U4?=
 =?utf-8?B?ekhaUVAyVHVhVlVndnJta1JwQkc0U3UwaHY0QitXbzZhVkhLZFFGQTNubXZy?=
 =?utf-8?B?aC9EZlA2NEg0R0VGNnVZRkMvTG1BeGZvK0RVcHpQTzRLMVJrdng3b2xDYWVt?=
 =?utf-8?B?TTVzN1ZTdUEraVlhNSsxd3pwZ0lXZHJvMWNjb2U2Q0wyVjFXcUpjZTZ2RWRL?=
 =?utf-8?B?MklGQzhLT0dBYWtPbTFIRkxsY0FGRGZ0a0lsTXZGRUJ4ZE5wUnpQdHEvZVp3?=
 =?utf-8?B?UE5UTTJ1WjI5ZS9hYXhRRGRtbC8waC9Fd0JycHo3TWl2WFNEakhvYldmTTAv?=
 =?utf-8?B?cWhOMko3YUJlVlQxL1Jhd2c2S1hpVGtRVjI4RWVTQTY1cFcrQkQ3bW9LVXV5?=
 =?utf-8?B?dUNkL2NEY043RFkxWTJoZ2xjTzI2aTdaZWxSRmlIU0NOUEJhZG9UOG5wd1BK?=
 =?utf-8?B?ZHBMMy82OHBMenB6SjZ5d0dNeTBiaTRnOUpXZWRTT1hxWmJRd05sV2JpdHY0?=
 =?utf-8?B?TWgvb0EvWEFBaWQwOFVvbFZoQUhrUXVwTmtHS3NYWk0wbG0weEVSdVRYb3hZ?=
 =?utf-8?B?emNONDhiSmo4UVZ2UUcwQ3ZJejdDMnNBNG1yZGloR3RjSVZuQUR5NFFkQW92?=
 =?utf-8?B?dHBwWkRBYzVZc04zRkU0V2pUZlFWQ3RTS29vM04vTFZMWFVlSW1pTXlQRHla?=
 =?utf-8?B?NkpkNHdaRzdSRHJGQ0hLazdLZ0hQRDNOczdXUFk4b1N2eU1kQ2VyVUVaemNQ?=
 =?utf-8?B?QXpJZzJiREgwMW9Sa0JteHc5WW4vN00zMmE3OFJLUy9xWG1YTjFLSVg5aDFY?=
 =?utf-8?B?cHozNTl1bXkxWTV6KzVyQW9vOURCRFlFYVpIVUhMZnNxczF0aTlwajhLWEU1?=
 =?utf-8?B?Zi9GVlhEWXMxRnRSUlJkQ1hRV0NURzZLTVBGUVRkUU5hY0pKSFVWcWJiZ3Uw?=
 =?utf-8?Q?g48LigRz1ZWZ8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3RCbVFzNVhjam9ndGI3dXpJYXdubGJiZGcvbVE1WGxwOTAyK3F2ZTZyK1kv?=
 =?utf-8?B?TGhBRld6U0szck5ISHp1R2doaVFJSUVtOS9JdWUwaWdGeHdKT3UzQWhSeXF0?=
 =?utf-8?B?Q0ZVU252VGlaT1R2N2d1a0U1S0JSdHpML1BwS2d3WkM3b2xoVVZ0cWJuQ0FW?=
 =?utf-8?B?SkNIcUNDV1ZaTklXcWtOdW53SGszR2drZUg5OWhYUllJSU16STBNYmNVYXF2?=
 =?utf-8?B?YThEYVk3ZG9vNVVna2x6cUlQczdsL1ZlclYxNHdwZjFWNGtIeW9hMjZBcnha?=
 =?utf-8?B?VFlIZHg0WWp1aWNGZ0Q2UWRIb1Z2TzFxL0RxYjkxTmF0NklMVVNjZ2ZNYWdW?=
 =?utf-8?B?dzZ1eml5aHRIRXJFcVprbzE1djl5T0UxQmpPK1plRmtib2xwZHB3NTdCUTF0?=
 =?utf-8?B?cmVzM0YwK2JpbHFNdWcxbWtyRW9kaVVWS2NKajl0eUlxMzN1VkFqdG5TMkVh?=
 =?utf-8?B?Y3N5OHJtMGdYajcxckdkbzIrSEc2VnpCL2NSc3V3NHJwSnQ2MFo3WUxJNnFx?=
 =?utf-8?B?NnY2TllaMFhZNklMbVVDMHIrYTZJMVZZNVhveSs5VllGd2NEOFVWbmNZdG1D?=
 =?utf-8?B?YVhEbVNHVzBqT05pZDBTRkhPdnpyREZST0VXSkpXemJYajhCYlBxZGRUS3Bn?=
 =?utf-8?B?bDdNNityY29HT0RFRWRpRm1iMm1tVko4STByU0ZnbUxwVzFmM0NCM1RmUUV4?=
 =?utf-8?B?UVZFTVhLdzNYU1dIOFZialN0aHhpMzZrMW1zdUtzOFNBajIxNmNWL0dLbmtJ?=
 =?utf-8?B?MUllZHRoWDhnV3I2MTM4ajhVcDZJQnhSUHZXb25hbGlWY3dqaXpXb3IzQkda?=
 =?utf-8?B?UWVSSFFlMzFjSDc1aGpNM0QrZmxyVXZZUzJVL3hIYWN4T2t2S1VyM3Zhb2xk?=
 =?utf-8?B?N09qNXlYZ2hWWmR4UGhLL0IwbWxESVVONDM3RStBY1JPVENDcmNOQisySk9F?=
 =?utf-8?B?V1ZpMzF0YUViVTA1clAzL1lWQmRSWngxUE52TFd2SzVtOTB5Y09UZlM5di90?=
 =?utf-8?B?eVZyYmpyb01pSDNlekExQjJMTDhmSmFhTHJTa2N5TjM3Q2dUNithaTBtSFR4?=
 =?utf-8?B?eGIxUFJ6NFJLcnEzWDlsZ2pKNGZMRGJjNkdobTEvbFROekpWYWdFME1ZZHRl?=
 =?utf-8?B?Ung3SmlnL25QcC9OMVZnSkJyNWxpTExtWFBIRjZLMzNsM3BxU1N1OUF1ODVt?=
 =?utf-8?B?VEpSQi9ZblZ5ZzJaMXAvRmI5bXQ5MkhPSGNhZmFSUGtHeU1mNzV3cHhhUU5R?=
 =?utf-8?B?amxuZW10UktnMUdkbUtPLzFsb3hKQ2lyRmdWMkowMk4rZkxqVnlyaGR2eTgy?=
 =?utf-8?B?UlpCS3ZLbk1nOTVWTlpMLyszMlJyaTBjWVlHU21hKy9lN0Qrb0xqSDAxT1I4?=
 =?utf-8?B?Ly94L2dMYy9aaTJCeThkQy9ETjZQT2o4TzNiWFVwOFRXLzhkNnplYTZtSUVu?=
 =?utf-8?B?bmlzRy9MV1BVb05BcndZekN2M3dPWk85VnhKMCt2TjdKRFJBdmZKekpoQXJD?=
 =?utf-8?B?WTdkUmMxVnlMQXJDUDF1Mi94UlUrOFJidDVkcE5BbmtRUnE2RzN4SEJXcjZ4?=
 =?utf-8?B?THRKTUo2RkZrcHY2aFVQQ1RHM28vdnhYR255S204cFJzbGxnRGZ4bUZHTFRW?=
 =?utf-8?B?cFBCbnAwNDNTakJJK1BLbUl1S1pMNWRNYUQ4UnhjZVQ4NjRSZzF4L2dZcG1w?=
 =?utf-8?B?eC9Yb0lYQkYvWHhCMitDRHZiOTJ6VDAybEFvT1RTODE5MXB2am9YNmdhUzZo?=
 =?utf-8?B?VzJHOGhHN3pqRTNuTjJGTFVhNFBsK2ZRMUJ1eUExaStiNVJzTzQ4NytrM2Nl?=
 =?utf-8?B?Njl5dnlPVXdyUWRPeHhZVnEwa20raU50eVpsd1V5NHdtbi9aZVRWZysrcDBn?=
 =?utf-8?B?bFk4eVBzRDBTYU1jQ1RmVDVmczdnUEljdEhiNjNCQjdFKzRMWFN1eGhKS2JS?=
 =?utf-8?B?RWVwd3JRRDM3TTdqckhVQmZNdER2aTBLTURHTHNnOHljeVNxdG5wSmtLNGxX?=
 =?utf-8?B?V0pkNVQrRFkzbklEcXZtN1RQTVQ0N2xPUk5nV3VBVFNQdmlsdXBLTDVxUWkw?=
 =?utf-8?B?TEsxUFkzejAzMFhiR3p0dDhwcTBobWtaZGs1cXZZdXBhWDdzSUcxL0sxNUd2?=
 =?utf-8?B?YlFqWUp6b2J2clEya3YyWDViZkxEOGtLc0h0c3dyeExRYlExbkhTYWpFRllE?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0442f441-0f0d-4032-b53b-08dd679fbfb4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:09:57.1564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brNGFrEAAg8N4Oi7BF7hSYzwsI/uIL0ze2K0bh/G10tBV+82YMxdepfWF0VUbEVEKVHmInt49SCbTza4bI2V9WFBz6pMhm0A9e+Ff5tjFSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

Drivers could leverage the fact that the VF BAR MMIO reservation is
created for total number of VFs supported by the device by resizing the
BAR to larger size when smaller number of VFs is enabled.

Add a pci_iov_vf_bar_set_size() function to control the size and a
pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
allow up to num_vfs to be successfully enabled with the current
underlying reservation size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 78 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  6 ++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 861273ad9a580..751eef232685c 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1291,3 +1291,81 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
 	return nr_virtfn;
 }
 EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
+
+/**
+ * pci_iov_vf_bar_set_size - set a new size for a VF BAR
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @size: new size as defined in the spec (0=1MB, 31=128TB)
+ *
+ * Set the new size of a VF BAR that supports VF resizable BAR capability.
+ * Unlike pci_resize_resource(), this does not cause the resource that
+ * reserves the MMIO space (originally up to total_VFs) to be resized, which
+ * means that following calls to pci_enable_sriov() can fail if the resources
+ * no longer fit.
+ *
+ * Returns 0 on success, or negative on failure.
+ */
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{
+	int ret;
+	u32 sizes;
+
+	if (!pci_resource_is_iov(resno))
+		return -EINVAL;
+
+	if (pci_iov_is_memory_decoding_enabled(dev))
+		return -EBUSY;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return -ENOTSUPP;
+
+	if (!(sizes & BIT(size)))
+		return -EINVAL;
+
+	ret = pci_rebar_set_size(dev, resno, size);
+	if (ret)
+		return ret;
+
+	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
+
+/**
+ * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to num_vfs
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @num_vfs: number of VFs
+ *
+ * Get the sizes of a VF resizable BAR that can be accommodated within the
+ * resource that reserves the MMIO space if num_vfs are enabled.
+ *
+ * Returns 0 if BAR isn't resizable, otherwise returns a bitmask in format
+ * defined in the spec (bit 0=1MB, bit 31=128TB).
+ */
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{
+	resource_size_t size;
+	u32 sizes;
+	int i;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return 0;
+
+	while (sizes > 0) {
+		i = __fls(sizes);
+		size = pci_rebar_size_to_bytes(i);
+
+		if (size * num_vfs <= pci_resource_len(dev, resno))
+			break;
+
+		sizes &= ~BIT(i);
+	}
+
+	return sizes;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e967..c8708f3749757 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2389,6 +2389,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2441,6 +2443,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{ return -ENODEV; }
+static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{ return 0; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.49.0

