Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF497CF43
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 00:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DE310E77C;
	Thu, 19 Sep 2024 22:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TS/bhKeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350CD10E77C;
 Thu, 19 Sep 2024 22:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726785515; x=1758321515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eS0E31whnXBKSFMFJ0GVHUtUktaU8XpFULlAzs0+1qs=;
 b=TS/bhKeoeUVNxukKbIk5xM0qEOrUS7qgOruiovNQXKo37zdRzypdNt1f
 3KmwVvZmTW3mhTiSY56rjVsyD74yAJRcSPQfFHixhPxQblpmBvlkg+mwH
 9tJQf3FI4kU8cVhtkOvTbYiHFb82PGyFPjOwuHWZGJCQkEAYG9RfqXnbU
 4Tui6h3oCnz0FofTk9xuE0T9680crVy58BpG6mIe4B6wxMNucu/DiHWDf
 FF8J1avV//kQ6BStPpyHmGClKHUQxid3h0OYxK63GsBu/0qAkpBxDu82X
 WY2Akef6hHers+iNovgchEURVtYabqcydyE/5xbajARysZmAivd5guz2u w==;
X-CSE-ConnectionGUID: getiAQ2kR6Sgce1xUAIcLQ==
X-CSE-MsgGUID: hylMvGaQRl+PubsR0TmroA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="48309534"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="48309534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:38:34 -0700
X-CSE-ConnectionGUID: qcem5oLwTEmbzkSEh7/y0Q==
X-CSE-MsgGUID: stq0zOzkRlmHJO3pxXanxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70334048"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 15:38:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 15:38:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJ5Olot3dg8zmkzdnhJkMwWCwnqGvnmPKgbc8uy12jnqtarRUQVyMDawVxLo3D9zMiV5SWeZI9w+xoubLCKCcPVjZVEZTpyJwhW2ALDM0bhH8m5QVoBKo+4RAJaI5wqWuToWq4CH1OibwiMBuyEM2qKWgPpId5na3wmF+zeuasN8nqPG+sGmYg/uqf/XlddsdrgaarL+cRs+BqU0pm4ITa0yc9si2Nw2ohh4iAb+a2H53TxM0tImaDdkbydGjOYvjc47ykf2gxtqJyJDO43oAQ2u2/eSeVN57V5P8eMuIeuNy3rNqWNGFLv1vv8Ww7SkNH0K/qGzFGVuojy1sNNp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJfy8lBMZwBLNA92nEEFy/avPdhG6w929Ib94qVf9QE=;
 b=I546VOKCIAyv50qQv6i4zik8cJqz70wxaAFA2iHa6U2W9UUCKMTPvL6sSDXHz+uLyMBjVgQNe+EVrHMhg4ru1YcwP7Bcqxm0frNQ5wNLWvzGy6kabAvIjFNrd1wT+TCF+XuJkaK2vdSsSDdzqFA/OGxV9/A/JpNUnDZEE1UVyQGMH4u9kDBZIlAdC0p0eWlcN6KDC0NYrcwVxc3tyQp2iuDHUGVTcuOHEOgvlpECyWDY3ymG3ziYBROouuDU76lmIaNI/pmpYTiEXQzaciuFJngOdNlmLQorRqfVKh8Pi8SuB4gfuB70j5jnOuappp+E2DFHRceVAr7/AUp+EX9S5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26; Thu, 19 Sep
 2024 22:38:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 22:38:31 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 2/3] PCI: Allow extending VF BAR within original resource
 boundary
Date: Fri, 20 Sep 2024 00:35:56 +0200
Message-ID: <20240919223557.1897608-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919223557.1897608-1-michal.winiarski@intel.com>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 86993122-d4e1-46ea-e425-08dcd8fbc9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTFMT3l0TEUwQ2lYY3VScytMZHBZMjRZL3N4Zk12MTkvcjVYWU5ibHBVZ2JV?=
 =?utf-8?B?cTVLT0ZqSzc5TngxejlheUdnaWlRTDJsZnJ5Ym1IQVJPTHpIZEI1VDZKbmIw?=
 =?utf-8?B?NjdlbXhKanBtSjRNRlZhdlo2Ry8rRXVYaUJCbzNva0hkY2JGdnFiTFQza3hn?=
 =?utf-8?B?dVFYZTdYMWZJNzExL3dFWlZxTEIrUW5qN3RpcFNMTHEzTWp6NzJxb1hhQXBi?=
 =?utf-8?B?b3dtcngvL2Y3a293eW94RWV4SW5vODNsb1VtNG9XbUFBVGhpM2JqbmpXMVYr?=
 =?utf-8?B?OHBaSlRKWWpvSjBJRFpZMmZZMTRyK0Fyd0VoVURicEs1K2ZlN293ZEhqVFlC?=
 =?utf-8?B?S3dCam9BdXlMUTNzV0UzRDhjbzRjY01rOHVBUXhRd29JNmZVVXh6eXpXZUdO?=
 =?utf-8?B?dG9Ca1RrZDI5V3ZLdmIyMzhaMERFOWJrVTV4aFR6Wlg1ckt1NGFuUk45VndE?=
 =?utf-8?B?WkdGUHpqOUJDOWh2VHFtZmpDL2owdEUrTHdZeFk3ZkFZVTEzWHNRM1RWL0pa?=
 =?utf-8?B?WUdoMkJlWHJyYlZPWkVvNWhiV1V5VmRxRDB6NUdya0NWU2VnZ0xSeHVZb0Jj?=
 =?utf-8?B?aEJKTWNBekFCcFZ3K3p2d2kyRjlEdlVva3JmTnBYdTN2TjFjd3lwNUdIQnpD?=
 =?utf-8?B?VHVGRnkrNFZ0Y0U3cjliRVJrSzRhK1dsRFpielpiejdSdjlFMCtKdE9PeGxp?=
 =?utf-8?B?QjdFUC9OVW1zaWpCOE41aEl5eC9TTFlmNEFiVldwVWhZSC96M0V2dmE3NG9W?=
 =?utf-8?B?YzVJU3luMXQvWGYxWnVqSE56SWw5YUk0YnNJcmJKWndHN2dSeGVyT2tDb0Uv?=
 =?utf-8?B?Y1Btc0FiU2dTK0lGWDdCeTVuSFdNZ3prb0dSSUlVRTVRdGh6VWg0RXdhQ3hh?=
 =?utf-8?B?UzVONE9tbDZRUGFWSklpNWFTR3YzTFBydDl6cGh2YWE1c0xpNzZKck82RUVp?=
 =?utf-8?B?dEI3ZlF0UHAyTEFJYm90SnM5czJhaURtaHZyZ1hVNDBDMzUxTDU4MnZYYldT?=
 =?utf-8?B?dXdZaUpvOXI4K3BTZDd2azQ2bDVWRm9yYzJCVVJJOHdsYmIrcjFIWkxVWmJ6?=
 =?utf-8?B?bVhwYmlmdVFyb0xaTmlrSkZmT3l5bmpJbDFpeDBwNWtYZXlRU1pRUWppc2l2?=
 =?utf-8?B?QmEzMWI1SjA2K2E5K1pZSXhPS0tza2FNU0I1d29rQkhicDZieElPWlBqNnp0?=
 =?utf-8?B?ekQxeWUyQ3pSUnp3T3gwb3R3SGtmSTM2Y3d3RFR1bVF4aWdqb3NZRTU0R1lS?=
 =?utf-8?B?SlZCWnJ0bWczNThtVFphUlBuNlE1WmpJWE1MNFlUc3EvdEVEYy94N3VsQ2JX?=
 =?utf-8?B?TE9RWVJmZFdlOHZJT2RPakhBVFVNeUZ6OWg1Si9aSDNSVWJPQy95WWpPVjY3?=
 =?utf-8?B?MXhYc0l4dVE1SkczZkcxOVVxUUFteVJmclNqL1BjMnNNWWREdzRDOHA4Nk9N?=
 =?utf-8?B?Q2Y2MUhLclB1clIwZU9pV3FMaGNNelI5UTQveGpqcDBPUElwS3QyZlFTWHR5?=
 =?utf-8?B?N29BYVRqbG5FMWJ6WmN0OTRFS2NsNnVPck96aTFuRlNaU2VzN0p4cUR0V0k4?=
 =?utf-8?B?SzI0OXVUR1RMaWhrZkZaNVdpMnFybGdpSVdiMThtWEROSlRGREV4RG9sU2Nt?=
 =?utf-8?B?Tm5rRmhBNFRkNjE4K0RscUtmZ21nZEZpM2ZPQTVtRDBCWlIzRW5YeEhOdGdE?=
 =?utf-8?B?bnNGRXVxMFZFUUs2dUQ4VkoyQ0Vrc3VCRndrWVVPb0FWRm54Wmx6aEJqNFpx?=
 =?utf-8?B?Ui8vTURTeHRxTVp3eEliNm1JQXR5WXZOb3hQWkgwRGlqZHMrSDRhdm5Obi9H?=
 =?utf-8?B?alZkc2RCWlVNZ3IzRnZYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHAwL05lWEVsNHBSQWdaaitJd2F4RDg1ZnBzbk1kMVZCTFFyczdYZmMyd1hp?=
 =?utf-8?B?L2pNNFZKMW1lNXU5eUdQakcyeGY2VFF6a2lZckg0dVFXT2NlNjhDeVdodFVD?=
 =?utf-8?B?TXVUakNEOVVwVmdRUDRzaFNDbk1YK1dTbFk1SzNqaXlGME5abDVYa3BjbVBX?=
 =?utf-8?B?dFk0aUtmMS9PbHg1ekN2T0RrSkVpQjhFTFFHZytZVDFYbXQ5dk9oSWlieWx5?=
 =?utf-8?B?WUhQeUk5ZzM2STA2MmpTbUlydVNBVnpaTnl3M2c0cVlxWXFYSUlvdklqN3ZC?=
 =?utf-8?B?QXdEQUlpRHd1SytQM2o5VWJ1c0h2aEFmVDgzOExYaS9UM1k5MUpDcVVIQ1lh?=
 =?utf-8?B?bTJZOEIxNGduUUVRMlI1MTFIMnY2YlMyS3JDRnpqS2lIQzlGQWJOaHpXWnRO?=
 =?utf-8?B?STdsRFYxbFhGb3h3c1MwRU9rdGdpaVJmNWNLMjl4OW1CSzNzRXNhTXYzZUhH?=
 =?utf-8?B?VTdRbTU4aENadEF6WGRCRzJBVTRkSVFuUVdoQ214OGhrS2g5NTBmOGVRZWt6?=
 =?utf-8?B?OC94VjBuVGtReFdJN2hGZ2dMSkRIRWpKaVdjM2RBRFZ2QnplMDBVUkVMNVlK?=
 =?utf-8?B?aWVWUmp3dlMwSkk0VVIzZWxzM2ZHQ0t4d0RwQVdzbUp6Z2NscXZaOEs5MUI3?=
 =?utf-8?B?MzhGLzJZVEF6ajlMZTY1V1llR1BnT0M1Q05VN0pxdVV5QnhmY2lWUHg2SWlO?=
 =?utf-8?B?NC9Ua3FZN0wzNmN1R3AxRkkvZ2tVQWdXM015VnVkN05Jei9pcFRWN0UycFRF?=
 =?utf-8?B?RWdWMm5xS1J6Z1RidlZOMmpuMGhWcVc2ckg0Qkp4bDZReFhNb01hSHl0NGh4?=
 =?utf-8?B?RHRVSU13U1cxQjMxd1pZNEZaYVJ5Q2ZodlpyNHV2U0VMMWdYOWg1OEdvUThJ?=
 =?utf-8?B?OFloc2diZlN5a1JJVmVGR2wvWnhVOXFGZzBtUjV4dE45TE4zamkzMmNyYnRp?=
 =?utf-8?B?TDBoZ0ZPL3NyQnVRWUcwc0JvWXdyZjBTbmJUbjJRUit2QUhhZzdaTTdlTFI2?=
 =?utf-8?B?RmxjWEk2VksvdG1RdjVVdDZNMWR6WlYvalRVeEcwK1VkVmoxSTQwWGU1dkph?=
 =?utf-8?B?MkJ2enNjWVlSby9Xekw0STVNdVlaRmprWWFxS2w0cWFlOEJaKzl4djBNSHV5?=
 =?utf-8?B?cjZxNFFraDBXQVBhWVcvdTIwMnZ2aEVLUFY5a1RDNUhxeDZwZnNPWm9IalE3?=
 =?utf-8?B?OFFhNWR4Q2sxWU1aOW4vUERVSGpDWHUyVkt3S1JVSmlqV1lUSmpCTVUrUFZW?=
 =?utf-8?B?eDRYYkptMzhUeGVLNytsQTRHQ1RVekNROEE0RUdRaTZ3TVRjRndCL0ZFMm44?=
 =?utf-8?B?L3F5c0xpNXdqcFpJeWY2VzU2UTg0RjNLUWV0RHVuMkpIRVFiSS9uVTkvWmJD?=
 =?utf-8?B?Rm9MMy8xL2NSWkVPRVBOSEdYb0NLVEprMzRXZkluaWZ2M1cwRTg0UjFQdzZK?=
 =?utf-8?B?NTA1RXBXbjIzTmd0L3dZQ2UvYmg1VzAyN0NVdjc2ZzlodzM5RXhmWUNzcDFv?=
 =?utf-8?B?ODhIY0xPRjhwanZEQnpMYWJYcWlNS1FUYWNsRjZKL2tJTk1laTlRbng5S0Nl?=
 =?utf-8?B?NFFzNWJRUkJuVlhqSGFOa3VxTlZ3MFV6NXllV1RIUG02RHErY20vU0lwVExO?=
 =?utf-8?B?RXN3WHFmZzJPVldKelVqeE4rUE92SWlqOWVCanpNQ0I4dFFJUERPQVhnblJP?=
 =?utf-8?B?Y2x0TWt1em5peTZtUDB1a1dQazd3WWNTbnNCa3dGcy9JYmsyRTZvVWVIMmlD?=
 =?utf-8?B?aXFwQUlBczVVMlBjaE5QUmFCSmVFaklQRjVvRnVUbVBDVk80M3lSRStYQ2NF?=
 =?utf-8?B?OUMrVVkvNHFEZ29KU3MvQlJ5czArVmdMRGlzU002QnhjS0h4SUdSbHRsUHBo?=
 =?utf-8?B?eHpadW1DTVNEc2RqdXhqRGVLUFhYbSt3M1lHOTJ5azFMZlV3MVd0Umw4SFBu?=
 =?utf-8?B?ZVM4UmpGM2FMWFlDYW1aNzVRcXJBekRJeUtpV3luQnBTMVJ5MHZuQVBMVWdn?=
 =?utf-8?B?b05NOXpyWkgyanFQSmNWTkVuRUw2emhlMzBwY0xlWjNXZm5mTDJIUW96bmZK?=
 =?utf-8?B?bHdEWk9BcE02YnoreDNJcDR4TmJhSGt5OWhNeFFvV1dqLytEQWtZQlhOSjJu?=
 =?utf-8?B?b1ZmdmE3RXJTY0lXdHhEUmZwaFV4OUFyQ2Zsak5ZQ0Z0eGIxT0w5WGJzU1lY?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86993122-d4e1-46ea-e425-08dcd8fbc9dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 22:38:31.5983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3Wp5liD2i8R32ApDb99e3sRLSB6qxSrZc2OQYwamFNNwsiY93RONpHg7OGp5MB62Pye+Q52bB+LngG8FNAa8xIVi8cNLcSledAn0lQi1RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
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

VF MMIO resource reservation, either created by system firmware and
inherited by Linux PCI subsystem or created by the subsystem itself,
contains enough space to fit the BAR of all SR-IOV Virtual Functions
that can potentially be created (total VFs supported by the device).
This can be leveraged when the device is exposing lower than optimal BAR
size as a default, allowing access to the entire resource when lower
number of VFs are created.
It is achieved by dynamically resizing the BAR to largest possible value
that allows to fit all newly created VFs within the original resource
boundary.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 92 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci.h   |  1 +
 include/linux/pci.h |  3 ++
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index e8ccd2ae0f024..d88efbfa70e42 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -181,6 +181,86 @@ bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
 	return cmd & PCI_SRIOV_CTRL_MSE;
 }
 
+static void pci_iov_resource_do_extend(struct pci_dev *dev, int resno, u16 num_vfs)
+{
+	resource_size_t size;
+	int ret, old, i;
+	u32 sizes;
+
+	pci_config_pm_runtime_get(dev);
+
+	if (pci_iov_memory_decoding_enabled(dev)) {
+		ret = -EBUSY;
+		goto err;
+	}
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes) {
+		ret = -ENOTSUPP;
+		goto err;
+	}
+
+	old = pci_rebar_get_current_size(dev, resno);
+	if (old < 0) {
+		ret = old;
+		goto err;
+	}
+
+	while (sizes > 0) {
+		i = __fls(sizes);
+		size = pci_rebar_size_to_bytes(i);
+		if (size * num_vfs <= pci_resource_len(dev, resno)) {
+			if (i != old) {
+				ret = pci_rebar_set_size(dev, resno, size);
+				if (ret)
+					goto err;
+
+				pci_iov_resource_set_size(dev, resno, size);
+				pci_iov_update_resource(dev, resno);
+			}
+			break;
+		}
+		sizes &= ~BIT(i);
+	}
+
+	pci_config_pm_runtime_put(dev);
+
+	return;
+
+err:
+	dev_WARN(&dev->dev, "Failed to extend %s: %d\n",
+		 pci_resource_name(dev, resno), ret);
+
+	pci_config_pm_runtime_put(dev);
+}
+
+static void pci_iov_resource_do_restore(struct pci_dev *dev, int resno)
+{
+	if (dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES])
+		pci_iov_resource_do_extend(dev, resno, dev->sriov->total_VFs);
+}
+
+int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
+{
+	if (!pci_resource_is_iov(dev, resno)) {
+		dev_WARN(&dev->dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+
+		return -ENODEV;
+	}
+
+	if (!pci_rebar_get_possible_sizes(dev, resno))
+		return -ENOTSUPP;
+
+	if (!enable)
+		pci_iov_resource_do_restore(dev, resno);
+
+	dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES] = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_resource_extend);
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
@@ -445,7 +525,7 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 				  const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret = 0;
+	int i, ret = 0;
 	u16 num_vfs;
 
 	if (kstrtou16(buf, 0, &num_vfs) < 0)
@@ -487,6 +567,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
 		goto exit;
 	}
 
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		if (pdev->sriov->rebar_extend[i])
+			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);
+	}
+
 	ret = pdev->driver->sriov_configure(pdev, num_vfs);
 	if (ret < 0)
 		goto exit;
@@ -881,8 +966,13 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 static void sriov_release(struct pci_dev *dev)
 {
+	int i;
+
 	BUG_ON(dev->sriov->num_VFs);
 
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
+		pci_iov_resource_do_restore(dev, i + PCI_IOV_RESOURCES);
+
 	if (dev != dev->sriov->dev)
 		pci_dev_put(dev->sriov->dev);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e763b3fd4c7a2..47ed2633232aa 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -385,6 +385,7 @@ struct pci_sriov {
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
 	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	bool		rebar_extend[PCI_SRIOV_NUM_BARS];	/* Resize VF BAR */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4cf89a4b4cbcf..c007119da7b3d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2364,6 +2364,7 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2416,6 +2417,8 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline void pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
+{ return -ENODEV; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.46.0

