Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF2C2246C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B8C10EA7F;
	Thu, 30 Oct 2025 20:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M37ilk35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3B10EA7A;
 Thu, 30 Oct 2025 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856437; x=1793392437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=K7dhjNqU2BOXzjzkVLoRNV9sMq120SLvIsqKwcEftqU=;
 b=M37ilk35eXKI/moQFjmmYOctVi6E0SaWPgxwlJSWFN7XWrjC0mVO/51q
 aF8cn8yXpJd7XmJbfJwOCD//hdLuEXuj/2XTzmjO7eLsFcU5R6GOcHqZy
 cX20qcXOjfGaqCFCLIXSR9Z1LelQsLXzoE2RWojBItIqZ0yKgllZxonap
 K0UIir9jRRnrVTJfF4haS9gN/Y2HoDE+TKOJ5Z8MvmXJca1jYEcgUiPgF
 X188GpiLStUIRm0LKm4Fu5onjItO23AStfIVUxHXYdHiQBID04On6TU6y
 wxusE0kF4Umijq+sBkldcSH10cZSMQ7/QeR6Zw33vNPW05c01SPYr8fXE w==;
X-CSE-ConnectionGUID: DZsj0c4BRfGkhWWWr9kOpA==
X-CSE-MsgGUID: HaAna5MYTJGL1OCP1Y6VFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67664353"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67664353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:57 -0700
X-CSE-ConnectionGUID: RXtAbyiGR0Ws2sPBLJLP5A==
X-CSE-MsgGUID: +8glR+aVS5Sp6W2qDg1vPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262763"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:56 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G79iCn0CFAiYAi2UbLdoPVWjsr4fGoPt6cJgU13v3enlFqw5XP7GyTiUj4VmjQSQE1GVsO3rwUB1tuWv/UgUt964MJN9wsi9bikT3k1xNl/fszcIuFbiTup+Rft0JSuoGadNIIcZLAdneZRm3FIEnZ3G5eUydvBtLfjS/uF9QiGa9KA9jPgDqh0ykRJtUpTApMDiR2BHh1fDUbDRlRsmx7gz+pMr/338ZhMhiF7jthSWX0DLoNz2VndvKzwvOGztIsHOXCXzjVP6BuLy4kJZYbY9u3561Q+JQkGqwFMeFHLB6TBUgq+lrunEXEHCyw4YYIvqWexPiPpxDd7bv8gYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWmBSdx4Jvkw/hzHCdqwoK+ptd69KTMyRkjZCXAOFjo=;
 b=jIKYbPz/T9g/b1W+O+sQVpbw2AnzSwygZAjwHHotc00wYyvT2Un+Hc9G28tTPbeYwUJRkwcY8RasQfqgGxnbkeZmVzmfc6x1OiLjmuqWIY613Z+mMktGGsT+APMJPMBUxElzecX+RnrrAngQjKnWw6HzHnBJoig9sfeYhA/Kf1zhJdmahmE6z/A443TzE/RJiv9iuENefDkMWdBEEVGkcbCzujIE5fPkE438av7kyQIgmMkel+vawriK2USwvXxm2NFVYeUPeZK9WcI8IVMmlRE5KLuenWehRC5t2Z6K7c5ZoKani9bfOAsrXOjd0nptSxfG+ol/ZL2D03F3k4ekgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:54 +0000
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
Subject: [PATCH v3 24/28] drm/xe/pf: Enable SR-IOV VF migration
Date: Thu, 30 Oct 2025 21:31:31 +0100
Message-ID: <20251030203135.337696-25-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0220.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::41) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0e5f89-ee0b-4389-b4e1-08de17f3a4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG54ZitCTFRJaGhLRFZ4aWpqODlGRGNBcU1HcHlUNVIrbnM1NzVoclVGY0Nj?=
 =?utf-8?B?RmE4N1BHbitjR3lFL3FOLy81SjBNRUJmUHhuM1BPVnIyMlJpV3pqakhFaG1r?=
 =?utf-8?B?dDFJeWpibzNYdVprUXd3VzRzMzk4STYyY040RktyeGRBcHI1Wi9FbXFiNWFk?=
 =?utf-8?B?Q2UrTzRjUG5KY3d1UWNDWWdhYkVYQ2s5K21LVU5nN1d3aFVaK1k0MFFYaTRG?=
 =?utf-8?B?eUJmUktaS3FibUpLaWNQcXJBNFNKazNRZDVSOTR0c3JIVTJGSFllNWJZU202?=
 =?utf-8?B?clJ0NmJidUFCa2gxdjlRd1ByWTgzWmFCR0lSQjljK2ZJamYwV1hDT3JPMGVl?=
 =?utf-8?B?M1R6NVhvbXNFVmtzM2xCS2s0YWF1eTk2eG1kbjhZSDdsNWRsWDYwUzNhYWY0?=
 =?utf-8?B?ZWZOb000RG50YW5pMS8vd3BQWUszbmp6MXBKZXVnZlAvR1NZdmR1NmY0MWlH?=
 =?utf-8?B?eW1CSFhpelVNVTNpQUl5YXhxTnl6clp1Q1I1ZkpJVFhsUVNja1MvT0dZZWFP?=
 =?utf-8?B?cVJBWkV4VHBYK3ZCcjF1REFuZ3Nja0hSWmhzM1lNSGd3SldzZW9PUGh5Zjdl?=
 =?utf-8?B?WFRJb29JYUcwRVhQbjJTeWw5S2dsRWZFQVFVTFdUTHdSMGJxdldhMjlHdkg5?=
 =?utf-8?B?bWFPYk1PeVQ0VUxjUmhBeklBLzh2N29hUXgxUHNFajF1ZlFKNnB0b1ZpZWFZ?=
 =?utf-8?B?U0dYcE9oWTJjbDBkajQ4V2VxSy9uNHJHUUN4UWIzWi80d1h6VituVmJrMkln?=
 =?utf-8?B?eTlJVzQ2b0dQK2c0WmVKNlR0SFQyWXBKMUxhRGkvbCsxK0svV2MxWUk3UERq?=
 =?utf-8?B?VlUzd1VhMUhWSHM4MlRudTFxYkZRMnY2cGEvRjFpY2U3eHJPRzlRUWRSOXNo?=
 =?utf-8?B?ZW5RMXNsSlNRVTRLOFdVU1JDb3NWQTZtMEJLdnBnKys1OU9EZy90NUI1T2s0?=
 =?utf-8?B?YXZ0NzhjYmJBbnJ2OUhMeS9HbTIvNmMxQklSNVFoVktRdjRNUEJISithaWIy?=
 =?utf-8?B?K1ZmUEIvcWNJekx0a0lXYjZ5VjNtSC9ORXhMWkpZQzVUZVhKTU40L1dRZjNK?=
 =?utf-8?B?enlrczlaTFg0NEpOcVpMZ1ZiU1ZBN2lBTTZ0RFBSc2tUN0RDNVhTeXZPellI?=
 =?utf-8?B?Vk0yODdvNjBzYU5hWUNsR2JYVWtmU2FCMEtwaFZ1eUxLaS9OQ3RjcWgwZFJZ?=
 =?utf-8?B?cUoyU2pNSzJtMzc4TEFRWkR1M0xXaEZLN29ra3p4amMxYlBJbmZuZFp6Z0tq?=
 =?utf-8?B?MlkyL3ZrYVRaNmt4dTJOd1FMZDdaKzJHcnYzMElpQW9mQWJsU2pBbDlyRGpz?=
 =?utf-8?B?WXFUOEVpbG9jaUt3cXJGYzhsUlY0YzlWendPSnMvNnhmMkdvdDFzTUtINmFI?=
 =?utf-8?B?V3cwMVZLWEtKZUhEK3ZlNFZzNnNHRlZrYnVlRVZFVDRVOGtFL0crWG5zbHp4?=
 =?utf-8?B?ZUlXbjhsZ0FJbTYwUDcxSDJIQkFrS0gxRkRac1JHSkxXQzU3MTdWZ2hRb2Jy?=
 =?utf-8?B?eGlMWUNqcDFqblFsQlVpU0MrZzMzeGxxT0tUR1dtVjMzN042ckRkb0NlQ29T?=
 =?utf-8?B?ZlEwUXozSnZxK09EdmlNYzlBSVQ0dVVsV0p3TllMSzNaOUJtMkRDaytsQ09S?=
 =?utf-8?B?OUlrUk4xUlc0ejN1S2hrKy9TNzJXbUh5bkVwb2U5ZnpNZzhkc280THNGOHdJ?=
 =?utf-8?B?K0R3QTdRTXdYMEw1NERPeVovMmJLUHY3MUl0a0tvK1pLcGNnNSsyTjVyakkx?=
 =?utf-8?B?Yk5abU9LM3BiTnhaMU5idkl5Mys3MkE2NExIb2ZnSFVrV1ZqbnhoME9DYmlj?=
 =?utf-8?B?anBPRVlRRlpCb2FhOFRwbjhZcGFNNUJpK2RMU1B1L2MrM0U4aE9HTzZvMENM?=
 =?utf-8?B?ZnJURERTN3F0UWxhd0pOSnFZUmFvQ1pLallmMDJZNjd1b0Z4b2lNZCtPaUxp?=
 =?utf-8?B?S0JDb1RjWFZWZnRwVE5udzNZOFpXS2N2K0xmRkp1NEZldjhlMnBpOHJDMEhV?=
 =?utf-8?Q?qYcQBDkrd1QBaoJgCJFN/9L0y7W6k0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmVHQWd1ZHVLQXAzN1N2OVRSM3pBMzB1OGRTSGdwZFdOL1BzQ3hSaFZ4TkpS?=
 =?utf-8?B?blNCTGttaWZEQTljUzIyUzJmRGJoNU0ySEJwbDdoL04vZVFid3h1bmw2eEw3?=
 =?utf-8?B?VDV3QlF2NUE4dGpTc0lIYXRYWTArVlpGekFqUnpqa1VrcHoyQlhlM0RJS2Vo?=
 =?utf-8?B?MFcwRjB6ck5HVnlyTkphVDB2d3pYWDRvQmYwbGdMOFNkOC9LQTcwOFQrMXVt?=
 =?utf-8?B?cjJGTHYwZDZSaG1xcG5yTmZJMkdjRXd6dXlXVzRWb3JoOU16aEU5YnFJenlF?=
 =?utf-8?B?amVySDB5emEvbGIyeFVWUGlzN1pCMU44NCtydzJlb2dWK0ZLVC9JaG1iUDd1?=
 =?utf-8?B?VTVvdTNDZ21iSk5ybTV3MDJIdTV3V0JVUlVwbU51blNqSmtxV2o3RmFPandB?=
 =?utf-8?B?VngzL1N0QmRvU0tNbnlGQ1pyNVN3bEYzQmpwYjNtck1zbG9PNVJvbC9PTVd6?=
 =?utf-8?B?ZWdmOEEzcUZwaTFCY3ludEpzelJWRVQxbTc0OFJUYWxoOTRKM3dQNjIxTENG?=
 =?utf-8?B?L3hiL1IyOEcvWmQxbndyVHZOMUthVjYxK1VybUFPdEExM3ROTmlPemtRZEFX?=
 =?utf-8?B?TTJIVktTT2ZWdzhiZWZGQ3c0anZLMkhSeFRQYzNwbGd0V3VnV0dwbXk4OEZQ?=
 =?utf-8?B?Tng4UkRsTVdwWXB2ZURwbWJ5SXByQkFndGNnRVNRWXdGc0ZEYnQ5aWFEaW5s?=
 =?utf-8?B?YlhrV3BEQTVSSW1tcEdqUGYyY1hJK1ZWNmNNaXhvQ0FESU05Ykx3cjVnRytS?=
 =?utf-8?B?ZmZhNUowZkQ5N0lqUmZWSURlc1c4UWlUS1RETEViQmljZlJzTkYzZHBhd3Zy?=
 =?utf-8?B?QTdVOGxVdDBvMi9jQUxvTmxsZ2lIOHpZUTk5dXhRYlJYUDFvQ0orNEMydS9x?=
 =?utf-8?B?UDd1YVVQa3g0aDNzdzZ5QmQxenAwNjRFeHpUa29lV0MyZVBLcXpxK1kydmRq?=
 =?utf-8?B?N09ja2VQdXY3T0YvbUNzK2grbUZLUS8rZTQ4QTdoSU53TWhiSzRIbVp3YnNm?=
 =?utf-8?B?K3BZVDI1dE1tYjRXZkswUGp4dG5YN2p0ZDgwaGk2UUFxZUtXb2MxWFROZDFR?=
 =?utf-8?B?aXhtSnpxRDdFSkkycGNTYUFZUGwrNEJJQW9VUlJXMi9pSXdSSFdra0ZEVUMx?=
 =?utf-8?B?WFdRNFV1OHVLa2QyLy9zZnFLUnhkUlhodW1FTWpML2Z4VFI1UWR2Z3dNZk9R?=
 =?utf-8?B?aWJMeXJLSVo5Q0UvcDRsaUdpcnl4NXgvODFaWGlBUWF5RTNQSXdBMDBrSnZ1?=
 =?utf-8?B?Rm9BSTNDanpQTXZZNTdaQU8wUVJPSjB4VjBJQlErLzdUYW1OMHlRWGVKUllU?=
 =?utf-8?B?YjBYOVlGOGZtc1BIdVVlSjhuaDhZV3VyZXlZVSs3ZmlsbDcxRHVrT3RUbkFE?=
 =?utf-8?B?UFdWdjVZaXZad2dxR1RTWlBjdGlJaExXM1ZPWXdMK2xublVlODRMK1NLemFx?=
 =?utf-8?B?anV3QkxsNnZDajRwaEF4QVdZTTFjU050dCswcitNTEF2b1hVSS9uSXAyVGtk?=
 =?utf-8?B?RGxONlRSZ3lCaUJWa2J2NytPd0JzUWJSeWwzR0NvWks1L1dpYlB2L1RLTjdO?=
 =?utf-8?B?dzZBMkhmZjZoMThZdWRHYWQ5NnJ5VHQzZTNJMHNCVDVKZEVoRUhucXcyRmVP?=
 =?utf-8?B?ZENpUmJJNWtUR3A5WmRHQk04T0lVbXJXU3lFZDA4Umlvamg2SGpWTVNyVUNL?=
 =?utf-8?B?eHdXZzJnMDJlYXBaZU5rd0R4Q1VJZlIva1ErOEIzejZ3UjUvZzlvVTA2Tm1F?=
 =?utf-8?B?WVBVcW5VY2FiWmpSRHlDNzMvTmRVcWs0QlA3aXJDcjlVQVF5R20zdnFnU2Y1?=
 =?utf-8?B?akUwYVhPdmFKbGptZnF6LzdZVmVzdFk0Q1VLRVhLWXA3eFJzUGszY2gyMVdq?=
 =?utf-8?B?WkJXWjIxSWdVTStCczViTGxnVVl0Q3MxVnRDcWFEU0NEN0FINXdlMUg0Rk9F?=
 =?utf-8?B?S21xV2x4cFNiL3dHa0hEd0MzdlBLbGUxRlk1TTkrWWQxa1RiMWtieEVFZTlD?=
 =?utf-8?B?TTYvMVpIR3B3c0N0U0pxeW5KZHFiR1YvcDQ1ZXBhQW5jMEl5ZmdIcEVyMlhz?=
 =?utf-8?B?VFh2YzVCQjh0NzNMNFA1MW1rL2JVVWNrL0lHQk5KaWgweU1LZi83Qmxqcnd4?=
 =?utf-8?B?RDdmVU1OZDNLRDNweStYY3BYRUZBTDZVTUdNaTlCR01FWXY0WHJGWGNXSmxF?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0e5f89-ee0b-4389-b4e1-08de17f3a4bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:54.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlGFg8C+xSlx2O0/oat7dDwQWOgawuoEol4muoxJWuk0UooXr1w5cP9uqfrb8Hq/AU1npHOJjYIomocRbB2TAqgUAZBAQ2i0EUI8xS2XxiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

All of the necessary building blocks are now in place to support SR-IOV
VF migration.
Enable the feature without the need to pass feature enabling debug flags
for those platforms and rely on .has_memirq presence instead (like with
VF resource fixup).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 6992c227e5a44..c4e9b0ff5b3ae 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -50,8 +50,10 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
 
 static bool pf_check_migration_support(struct xe_device *xe)
 {
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+	if (xe_device_has_memirq(xe))
+		return true;
+
+	return false;
 }
 
 static void pf_migration_cleanup(void *arg)
-- 
2.50.1

