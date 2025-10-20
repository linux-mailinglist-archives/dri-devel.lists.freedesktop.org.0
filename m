Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1052BF1EBE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8422C10E465;
	Mon, 20 Oct 2025 14:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrijIZPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3F610E463;
 Mon, 20 Oct 2025 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760971863; x=1792507863;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oVkUMbRQ6nsxJt/U2anw6Z6sflwz/yLq3m1r5FLrmxs=;
 b=GrijIZPub23Vvc0XpYuYqHVquZ50lzj26hG6BJnz6l9uXF4cd8FTzbS5
 PwAoLZBpkWWkNZysd1uD+S26olcZqqKK57d2OoPg4CZL0Op8uEO1WpvWr
 6amw83kISUwWfGTHNbZDwmQmMP8O3dt0XoIpg4Va0B22HhO4RF3LK2hOS
 pLw4crBq1eCW/W3bOsnZJ3uTTe3HYV0LBa4WZuiHI512bBYRlCV/uOSM2
 UrzDGJV7N1zMXXgi1pJbw5xh8pNUt2dLlXeh4g8w/Rv1FfWbAOaARtDMa
 v/WHsS/8VWanMAeX40Lcnzkef7cQBK3OsoJHcaPPL8REM/w21xZvr3DNj g==;
X-CSE-ConnectionGUID: rvbto8YhSMyGDRPyQE90iQ==
X-CSE-MsgGUID: D9K/HfwoQlKR3mRITrz1vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66950564"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="66950564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:51:03 -0700
X-CSE-ConnectionGUID: 5pTa6TawShyM7t3/0bKnXg==
X-CSE-MsgGUID: pqJFowbXQ96zU46sU97OZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183755833"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:51:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:51:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 07:51:02 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLvLeuuUx4nH/fG/0c1OUaC7LiQCyjWGQOhU3i5O84rGeIEWXWSvgyRw4XvwtkHJfNCWcPMV3qsykX+nAvS4KOqnZkEAL/vDBTFN6ZLYIq0hoqfVtDrsiMoBckGYp9YSyzVycIgY9/YskB4Vh+uag9D2yS1erMIc/B0nJ/dnJ5YW4RmsbgH3T7OvEBr0TpAmeOoSmDq+dxcV5EelcDhBw6wjQS5F5sqEQ2WXZko8lz2wwb4NApSr5nxcd008xBGaWryb9QVAiod1O3tnfwUpzTGXYHChKhvrRAp1CrFq++gCaBeLp7q6VXYbcCSgGgetDeoe9FIdAG6cT17eP5Nb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+5XuNqvMOmq0XbytcYyAMWvgfrHEI8nHScrkB9pdjE=;
 b=ht6LKRGMtE0BpCX1uj3EXyyp8qvuXL2/qSZcxn6ktZmJYVjIJ1gQwAX+/5ccCMbbtQ6+wPkpsHxK8q35q56vNj5f3gvOsYZBBO9DFjM9uin8n0SvE2U/Mw4pu1Om1pWnGAPl+wiyRNPjPjIdP3Z3fXsBt2sYoYCuO7tS/ynU2p4ipwkbh1YBk9az5rbCcjzVLikhjeCBYi9uebdPQyD3uQzZjWBglsqt5yHijcwNvCeQTLUUIg2iDziNBJkEMic1B2uqpmo6FhNi9Cp4EWnPo54pbKXPE3MJT466Q4SCrVpplku6ZhHfcJULKQ5EuUU0F6dNp63R+1+OlN8M47KlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Mon, 20 Oct 2025 14:51:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 14:51:00 +0000
Date: Mon, 20 Oct 2025 16:50:56 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 04/26] drm/xe/pf: Extract migration mutex out of its struct
Message-ID: <lyv2y2mvfrhqtpzmgfiwsh2dde7wc7ts6lkibjqhoryt3gjxk6@fmh4dys7vbgl>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-5-michal.winiarski@intel.com>
 <aOv8soJ5lN+uLhOA@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOv8soJ5lN+uLhOA@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BE1P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8fe382-60bf-4e8a-55d0-08de0fe81556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkVtSndMdTRLcWcxOXNBUVFpMGpkKzZGb2hFQ2VqRCtaNWpDanBsdTNROC93?=
 =?utf-8?B?b3lFVzB6cEhtL1lOd0t4Mzd4ZGVaSElqZXoyTXlRc25ITmJiUEdVYy8wVnZO?=
 =?utf-8?B?TWxZMmE2Zno0VXlzVmxGWG1PSWIwVytmbDl5Vzc3ejlQQWhYZjNkKzF1ditL?=
 =?utf-8?B?eFc5dmhLNUJQN2wreEFHQUY4dXliVC9RcFJadll5NitvVHZGVXNzem9NeFZQ?=
 =?utf-8?B?cjdjVTRveXdjV0lOeG1Ka0k5ZDJSWGdSNDdDUW5PaEZPeTU0MjBJVnoyMmVY?=
 =?utf-8?B?dG41aHVBUHJCZUdNWUlUOXZITEVLV1dJSFR1czZHcVZyazZsVG05RUluWDNa?=
 =?utf-8?B?dnJlQTUvWWxCelRPRWtKbjJueWExUGhmYmdDZUtrMVlIU0RGNGwxTFlxK09n?=
 =?utf-8?B?UzB4b1FTWVVTSGlGZXYzbzhrMEJEN0xkK2pYcXVVb1JxVWFhbWVSZXh2Y1BM?=
 =?utf-8?B?cVJJQXo5NWdjalBwRkRZUHI4Q0pwUXhwUG1wb1pFVytIYWpNc2FNd3dQR0pV?=
 =?utf-8?B?V1ljWGJ1cndpMUhOSXZ1Z1gwOEZzSm56NUdQa2JWYWU1SUhOYlAzaDljdER5?=
 =?utf-8?B?NTc0VzFLWGFudWU4WXJmVTRrenNiNDZjN004WGpCSzlpM3NTOFVkTmd2dkMy?=
 =?utf-8?B?Y09hZFkrWENQcVZ0QVhIbXdzNzRnTytzMHdEdC9BN2I3aGxzUWpWb2JuZHgz?=
 =?utf-8?B?YnI0cytFZ2VBNTZ4MGFtSnNoSjlNWVg1aVNhMTV3Nzc5am1oR3pEUnFNbUZC?=
 =?utf-8?B?MWlmdlVOcmFJZm53YWdtcEE1Z0tuNklqQzdvU2RTWUFxNmZhT1NSQWsxbUxm?=
 =?utf-8?B?bi9wL3pzanhndURMcFdYNm5XeEhjd1ZUcnljeGhYa0thSDc2cjVwSTZGT2dq?=
 =?utf-8?B?Y2xRS0EzQXlFWll4bnorVzNDakdIR01yZktOTWJZc1ZoN3ArMHhHN2k0SXdr?=
 =?utf-8?B?WmkxRExLeGwvMU91NFZGd0F2cmsvUzdMSzI1dnhVcUNVOWR5S2paSFNsYkRL?=
 =?utf-8?B?cjl6SWhzMi9sSEhkb2cvTGpteTM5SVhMZmg0aHIreE5lblgxWkdUdTdhaFNU?=
 =?utf-8?B?MDlaZGNPT2NCZ3k4UHdldUxYRC82T3hmUTlyTlEvY2NrYUpGOTlYUFkzYkMx?=
 =?utf-8?B?UGlZY1pCc2JOTDhpQStBMnB5b3gwbVlaN2hiYmFPZ0xVRDl4MUdmYVpFb3dr?=
 =?utf-8?B?NWVaaVI1RWNjNWtyUzFsbFIwSW5HS29QR3JQSXVSdVJudDY1WTZXV3pyTzdY?=
 =?utf-8?B?OUZyMUFPbm5BdEprQW52K28xdFRzdDhGRG9WVlBQanN2djFQYi8rWVNKUUtU?=
 =?utf-8?B?bnc0ZTIzaStmRmxZRDhLdkErNVFQNExaWjVWYXlDcnRZWHNtVHJsK0tMbHZj?=
 =?utf-8?B?KzB1OE05eWtFOTUzbkxTWHdudG5wUC9MSUFpYzF6Qk8zZ0lZYlpKekdRZUNM?=
 =?utf-8?B?Y2dBNVRkaXpZR1V1TVFwdlVsL1JNeGtETW1iWTUybW9IT2k2VUVjTVlkeUlw?=
 =?utf-8?B?WlJZNW1qWmUzUTFyU0VqUjBFVHF3aGM5dU1IUGlWSWZjOU5OdjlMeStyMTBN?=
 =?utf-8?B?ajhhS1lTMWpBOTRhR2VBL2djRFpwTE5FQlk1TkZDeDljbDBQZ1R1aTFhNURO?=
 =?utf-8?B?UjRKSWRyMG02MjFUTmJHMFJuUmZWbWovMDh2Q1BDV2k5ekZaa3NIM29hTDgv?=
 =?utf-8?B?Wi9qYVRBT0ZBVGQ2ZklBRWt2SmpnV29WZEZqSGQ0WU9PWlpBZTJlMVBXcXJO?=
 =?utf-8?B?M3U5bU5VM0xXbktuUDIxRXlNelF4Vk9VV2xTeDVYMmJrSmNlcWE4VDdaMWpY?=
 =?utf-8?B?QXVZOWIyMkVRWTdmdnBQQm9xM2l0UVAwS1FDS1FkNEpjMjB5bGJmYUhVTEpP?=
 =?utf-8?B?Nm9FMjNCemNNeHQwSVNucjFUdkM0bFNnWnFDeG13T1JGR2QyY09rbEFwZll5?=
 =?utf-8?Q?jPRRzgjgumZ/AzhQYC9oivLZqXvCGtxq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFYbStvMVFFYTAweVF0aExodEd6NXlMTWsvQU5tdjRNZkN4QW9yUk9kM0dC?=
 =?utf-8?B?NW9JdGdIZDBoL04rb21ST3FPV29qRUpKTXZmamoxd1dmQzB4MThoTUVIVlJY?=
 =?utf-8?B?MTBPZTlTbDZETG9UeDQwU2RQQ1MyNVFFRTFhRG1vTGVHUXpicFdhb0E2cnpS?=
 =?utf-8?B?ZTBDYmZhKzlKb2F0YktJUnNFTUNtYWFRSGplbk14R1ozM1BUaThhQ2RLVHJV?=
 =?utf-8?B?bUVOL1RrK0FSaGZ3aUhmWmRja3ZJNXZHeGZqYmIrUFJCOUNTQnlRN3ZZQktk?=
 =?utf-8?B?WlNhZmNFQXlrZE11dm5VTW5rKzVvS1RHS3Q2bXpjcFBKSlpuMDNzR2VYU2g1?=
 =?utf-8?B?Snk4WUJKazUwaGxJbFdWVGM3UUg1WlVBelVuWnhTTWlFcE8xaElqNFZCV25u?=
 =?utf-8?B?aXltNzFiczh0UXZ0WFYrdGNvSnAxQ0MxakdUM05mc3ZZRWU1NGhpSDBxVmNx?=
 =?utf-8?B?S1l1aTIrZXZLZjRDdjhmaUhQZUV6N0xXSCtQeDVhenF0dkE3aWhSSXJ3K0or?=
 =?utf-8?B?UlcvSDNvbUZiQ0h3VkFkVjBtVk1UZHdIMW4xb0JGa2Z2a21KM01YTHFCNnA5?=
 =?utf-8?B?QUdXNS90K0FBMHRWRFlpRkFRS0J5WW05V1JLKzRmUHp1alBsQnRKU3FYNlpR?=
 =?utf-8?B?MDNtYXhPSmMrMEVNZldGeGgwQ3lXb1pBRForODFEOFlXYk1hNXZjcjkyaUUv?=
 =?utf-8?B?ODBKMzNITXJjWVJvQ0hURTdXQ1NINHI4NStDR0FURjNwcGdwdjdYUlpYTW1G?=
 =?utf-8?B?cFRGdFR3MVlsUFlndVhRU3NOOUNIbFhiOGZMTGpScHFrSWNiaExaYTIzRVNC?=
 =?utf-8?B?c1NablRzM3BCVnVpZ2tvMU1YY29MMEUzWjQ3T2QzU0xlSHo5bXp1aXM2dlBF?=
 =?utf-8?B?b3hvcDJwelRXekxlbE1EczFTdXZhU01rVVZ4OTYyODN3MmNTTjRZV1hGSDVU?=
 =?utf-8?B?eVNtMzNZQTN5cG8zOUF2bkN3bUNKN3lLc09Mb1drZzlRbzh6SkNmT0hRWE90?=
 =?utf-8?B?NzFpSUs2KzZoaTZLT1ZHY1ZNRUZ5ckNucDN2YXA0L1M3ZEZTTmVSaUI5Mi94?=
 =?utf-8?B?UGIyL29RbnhaTkV4emJRdUk0MzVrYkp3S21tVERJbFdyYmlOaDBJajlveG9S?=
 =?utf-8?B?OGRBZmRoeTBjaG1vUFBLQ2FtckpMTWsxU09aak12bDlnOFZYZ3pQZ2Z0N2R0?=
 =?utf-8?B?TEtEcG9EMkg2OFptWmlPZHJDN1B1TWxHaWI5SzBGVEdUOFFGOWY0cXJnZlhV?=
 =?utf-8?B?SC9jeWczZ1dKRVBRWjFsai92Zk9saDlUVmhlVG5FeWc2YlNjc09UeC81U0Na?=
 =?utf-8?B?LzN1cHo5TTFvRjVPMXJzY0hmaFNnZlB4RW9IT1dTYi9xbzdpOUtJM3dwaDV5?=
 =?utf-8?B?c3RsVktSczhiMmpBb05ZTGM1bG5PS3hlSVRZMjV2YnZ2N1dvYkhQRG85WEwx?=
 =?utf-8?B?M1VyQWoxbkIxU2JWdDN6K3JxeUdjSXRhL1VrVm1hUCtWR1ZhY1pLUkdGWHFa?=
 =?utf-8?B?dzE5dnh0Um1CWVJpekExby9KL0lsM0M2VzZSV1BrdWd2TkxLeWFkWmZ0U0dx?=
 =?utf-8?B?T0dTeENaNWtGRUg1VGM0YkFrekNXSGhLLzA1SWxxa0swQU9NZE00VnZVNE5M?=
 =?utf-8?B?QWc5MGtTSk5GWm1NbExtYXZwcVJ3d2UxS216V2kxbHlIa2dGRU43STBoQWhE?=
 =?utf-8?B?VXl6SGc2aVpsOVJWUldXMWxpb1hkY2tpTzBUYVNjMHU0SzdlUDFPWWpMY3lV?=
 =?utf-8?B?cE1wNGpSdURoMnEycWxRUHB4WExXNGx0MDArVEJqVjFIb3BwNXVxNmtYSkxY?=
 =?utf-8?B?MjdOK2pGM1lOYVhhOERCNW1hVEtNUzVKTXJYeFNPUW9vellFd2RFUGJKSWhz?=
 =?utf-8?B?cERVMHlmdE83bnFKOFFDbTlqbmFsR1R5TG55WlBsaDFOVHZHNTMvNldWOWJx?=
 =?utf-8?B?YUlBdkRJajE3UWJjVWEySURuZHpvVE9DNTJqNlhuRU5SM1gzU2x1amhmaHJS?=
 =?utf-8?B?SnM3WnkzLzh1L3BTdU5rQVJqSWlQcDB0WFRHdTNMbW90aXhJbU1TMTdZay82?=
 =?utf-8?B?RStYTDc4VzEvL0hvdTJEMWhSSk8yWS85aTBQTTZiZTdtdVJGUlZwcVBIenRt?=
 =?utf-8?B?bG1uZko3a2FGcDBBSmRkYlVFU3kwK1FZNHFSZmF1VEh6bWx5T04xaTFyWVQ1?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8fe382-60bf-4e8a-55d0-08de0fe81556
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:51:00.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn4cPtC6TI3ve1evTT1L4dtw9c7KBAFrL48QFhA2OrhE9ROsiNidXXjUodHtdQzJMGzpItU5+sgEe5KmtQjFZ+5SFyb3VSXJ+s8RcEZMNr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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

On Sun, Oct 12, 2025 at 12:08:34PM -0700, Matthew Brost wrote:
> On Sat, Oct 11, 2025 at 09:38:25PM +0200, Michał Winiarski wrote:
> > As part of upcoming changes, the struct xe_gt_sriov_pf_migration will be
> > used as a per-VF data structure.
> > The mutex (which is currently the only member of this structure) will
> > have slightly different semantics.
> > Extract the mutex to free up the struct name and simplify the future
> > changes.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c       | 4 ++--
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h | 2 --
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h           | 2 +-
> >  3 files changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index ca28f45aaf481..f8604b172963e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -122,7 +122,7 @@ static bool pf_migration_supported(struct xe_gt *gt)
> >  static struct mutex *pf_migration_mutex(struct xe_gt *gt)
> >  {
> >  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > -	return &gt->sriov.pf.migration.snapshot_lock;
> > +	return &gt->sriov.pf.snapshot_lock;
> 
> By the end of series this function looks like:
> 
>  14 static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
>  15 {
>  16         xe_assert(xe, IS_SRIOV_PF(xe));
>  17         xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
>  18         return &xe->sriov.pf.vfs[vfid].migration.lock;
>  19 }
> 
> And...
> 
> grep snapshot_lock *.c *.h
> xe_gt_sriov_pf_migration.c:     err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.snapshot_lock);
> xe_gt_sriov_pf_types.h: struct mutex snapshot_lock;
> 
> So 'snapshot_lock' isn't used at the end of the series. Maybe drop this
> patch, delete the snapshot_lock in the patch which restructures the
> above code / remove the snapshot_lock usage.
> 
> Matt 

It should actually be removed later in the series, but looks like it got
left over by mistake.

I'll squash it with:
drm/xe/pf: Switch VF migration GuC save/restore to struct migration data

Thanks,
-Michał

> 
> >  }
> >  
> >  static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
> > @@ -400,7 +400,7 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  	if (!pf_migration_supported(gt))
> >  		return 0;
> >  
> > -	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
> > +	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.snapshot_lock);
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 9d672feac5f04..fdc5a31dd8989 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -30,8 +30,6 @@ struct xe_gt_sriov_state_snapshot {
> >   * Used by the PF driver to maintain non-VF specific per-GT data.
> >   */
> >  struct xe_gt_sriov_pf_migration {
> > -	/** @snapshot_lock: protects all VFs snapshots */
> > -	struct mutex snapshot_lock;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > index a64a6835ad656..9a856da379d39 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > @@ -58,7 +58,7 @@ struct xe_gt_sriov_pf {
> >  	struct xe_gt_sriov_pf_service service;
> >  	struct xe_gt_sriov_pf_control control;
> >  	struct xe_gt_sriov_pf_policy policy;
> > -	struct xe_gt_sriov_pf_migration migration;
> > +	struct mutex snapshot_lock;
> >  	struct xe_gt_sriov_spare_config spare;
> >  	struct xe_gt_sriov_metadata *vfs;
> >  };
> > -- 
> > 2.50.1
> > 
