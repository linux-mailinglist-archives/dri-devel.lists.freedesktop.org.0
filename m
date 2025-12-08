Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB889CAE096
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 19:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465EA10E23A;
	Mon,  8 Dec 2025 18:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cmb+HGh0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311E510E054;
 Mon,  8 Dec 2025 18:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765220336; x=1796756336;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=deitWACqmvjDLJTDsvARRYpf4Y2pWtmFBtO9P1fLys0=;
 b=Cmb+HGh0sHj9LoPs6LC++6Cc9aH4WV988dRCZVscxR62n4BByJuLQoOM
 t1Ba3AWMR7jrvoYEXS8Y/o+Dq4AE0jL9Sg25/0CSf8Skpt9/0eqy2aPsh
 AtLuM0QcFjeh2GlTWJPkcx1DTsMC+cPyl8PQXaQd76Kb0nfbFf2CpriIO
 mK0PAM5sjQPk+lCjAhy25UxWg4c2lvVoquZOSPd918QA2zzso+C0J5H9w
 2w+e6lWp/254h/p5qnSSRipQGxKsxuxakqORFQI9NvtzHADhOknRgmxFh
 roKH07yOC5QRWiFLYUJaJDNHEYtPQNo8EL+tTWVf5feX0kLptvT2Wmwlo Q==;
X-CSE-ConnectionGUID: n1zElyVUTKiir+wCbKqFWw==
X-CSE-MsgGUID: 2WykragOTqGdY31rrNGouA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78286544"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="78286544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:58:50 -0800
X-CSE-ConnectionGUID: WmZaFF8/R4a2mZXkny1xVQ==
X-CSE-MsgGUID: gSBJnsl+Qcm51ZKG6HMUcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="227042019"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:58:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 10:58:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 10:58:48 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 10:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjcIpyQ6sTbV529wv3xz34zQEAB4gogrq88rStHgeQWrNX97GUC7wNBdDaTaJkqiqQhSmDs1YCeMULJR565fWRYtTpMKA9AIwMKJy3DrJ0c5JryjuN+diNY+YvUsY/9kFhrAoGL9ji/UDUw8Tn+SKmXAM8hyut+qrPmkX5VJO5QvpeVfKboGaJyyylbw7gUynx8/v/THZmXEzNCMAClTkh25eFwv9qlPtvQTyovGYWMtVfB/lC0J37XTAQExmApFgfW0jnEQotBrWCUXfyBHIxIT4J5CqfLqynpCftswZpJjqHytoWRvAPlrNfG5x8fHMiEx5lUB6UpNXmhRe2PYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD0v+mlunXw4am3m8vFhtcolOmejH//G+XjwEC0efw8=;
 b=Ex0bk95BQ/BvmOKGQ+xn+kC+nNRxUg6U8A/2LgzSolW4ryKRkQ4EBfx5ZKEUM3DzE5bdn+jgYQfqF01G9xUF0SBl26BYqKlzfFEP87YXznZ7IZslG89/dmjppZkFrYHcyGe0gH/OvHoytQRgZHwx8lGwkxPHpb5lI9Rv8oGoLc4TWOspnfiN5MrBH40WmuWAqkru6dJ9VI9HLu54FDI54Pz7PMSd/35Was3E3kbfGPzOFBwyZVTv0X8pEQFux1zJqRA5O4j1VcwVR1G6DkGlRWA5zz4w3Umy1Ug+CsOVsLE7SAJVykrQdf2R5A8jMEPocdF8Sbys1u35gXHiIm1eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 18:58:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 18:58:46 +0000
Date: Mon, 8 Dec 2025 10:58:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <vitaly.prosyak@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, "Lucas
 Stach" <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 683ba27e-1b9f-49c7-f55d-08de368bd0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjRnNFRHRm92U1Zka1plNkRhc2xDVzB6Y2tEdGJtN0UvdXJNVHE5MWM2bzBK?=
 =?utf-8?B?KzZycTJvcjFFMllGOHRJUWN2Z0doT21GenYxVjZGSFdldURmYnRYS29qREh1?=
 =?utf-8?B?VWVuWi9hU1lSWU90Ri8wYkR6cC9YNHFrU0NVVnhLNDh1Q215MEFubzlpNU12?=
 =?utf-8?B?eE1CSjlIYnk4K3czT0ZwZmdZZ1hmaEJ5V3djczBTR0x5RkVwL1dSdThEdEMy?=
 =?utf-8?B?NGZuei9FM1F2cFRTWnN3WU9rZDh5Vmd2L2JWZjVXRHRoeDM2aFVMUzhaMXNE?=
 =?utf-8?B?dHhCSlhuVm82QW9IRUp0NElzKzQ1dzd3M01wNGNqaVdXQWlHSXA0M1BYbTR3?=
 =?utf-8?B?bGp0NU95ZWVzV0VPanBaR3ZRbHNPTDdaY1J1SUE1TEwzQy93UDNlNkVxTFE3?=
 =?utf-8?B?M28vT3pqYng4NVZoTFo5ZjhYczRPdkFRVXFUK3NIN3V2aUpvZngwTWJpTmhj?=
 =?utf-8?B?WW9nVCtOVjEzS2VaQnRnUXlJZWRhdWRQV3VhU2tPQnR2Qkd0cEV3ckxUWnha?=
 =?utf-8?B?Nk4vaGZDTmlobGgyN2dsVS9sS05DREptWTJDYmF2Wmt1eHFCQ0lBTDJaUHkr?=
 =?utf-8?B?QzFnVnFadEFxUTllRnlNVDZSQll6Tk9FeVd6aUJaOTBDT2ViWXNKS1R3aWFl?=
 =?utf-8?B?ZVhiVGM3MnB5QVpNb1ptN2tOdWcvYUFrb2xkalRtVVUrRmhiOVZGQnhSQWNv?=
 =?utf-8?B?ekNmTjUyTGFyNDRzWGhrT1NEd2h4NVhXc01UTEN2cnJkTGdIaDVETjJxTnVo?=
 =?utf-8?B?enMveExRMzg3d1IrWUdLYXNKTUlpaHkxUjZLcUtDSytieXA0SktBSlNaWXlx?=
 =?utf-8?B?NEdXNFM2OFVrOFdKalJHOE5QOS9WYW9nZFpmRVo2K1hpd0xCZm1KUEtxSCsr?=
 =?utf-8?B?M2dLWUYvc0wwOVFLemNJRTVrVHVxSjBjYWRwckROT0hudGJBN1Z6M0U1ajB5?=
 =?utf-8?B?Qno5V2QxS3M2T1luM0JOK3dwcjVTbXFEMnNEcTNCcThKQ0xrZnpoZVVVU0cz?=
 =?utf-8?B?dUV6WnBCV3hFbnR5MHRDRzE3RFZnTGEyVkZoMndqWWEzb0p6eEptbys1TjJw?=
 =?utf-8?B?MHBmdWlHUWRobXZNanBibnJpK3JSQWh2TmhMY3RteXFnMWJIQ3hvR1g0Vk01?=
 =?utf-8?B?d2N1cnlUNXpiYVhxQ010ZGs3WmtDNUN1RWZQcnNYRmhIei9Uc3cyR2dtWkg4?=
 =?utf-8?B?ZkIvdklPRm1Demd3UXhLUG9jV2Q3a2U5amZpaDFDZE0vcmE0QzgxWkptK0wv?=
 =?utf-8?B?VXAvVVdUUDhOU1g1VDN2UW5iRlhZL0lCbmRaQ1ZNYlBPZUNVVXJqQ3pFTXVv?=
 =?utf-8?B?aGJQaXphZlZsVWhJVDk5ZHNVTlVsalN5Vk12NXFPUTZHTmlZRmhHdVVPTUFm?=
 =?utf-8?B?LzNFMmR6blVVNnRud0NlYXVOSTliNnpJZE02RXAwWlphbDBZazlIS1UzK0VL?=
 =?utf-8?B?N2FXclRxYXcrMjl5YnYweHhUZmpLVFRrMTM0QjF3dnlUd0w3WGFkdWQ5V25Y?=
 =?utf-8?B?QWNhQlVhZEVvb25CR3dva0xtYllQVVA3ek1HZUlnelJGazFDbmp5ZWlDL0c5?=
 =?utf-8?B?b0E0NUJrakFYcHFPOVh4Q2ZGUklzZVdPdkN3TTJHajd4M0RlMXZwQTZhWDhT?=
 =?utf-8?B?anBvS2NKT3FCbWQ4ZHlzUjlVUEpWUVZPRVZjN1FCVDNQNDZPZTREbFhrMDFZ?=
 =?utf-8?B?RThQVEl5eW1PQUdyQU1HRXJzcW9DVHBYUjRHOWVXcG9sMlpaWkVlb0FYcytu?=
 =?utf-8?B?OU9nWm54KzE5WHhsYXBXbzEvVksyUTV1cHU3V2N2bklYYkVIWG5OSGFsei84?=
 =?utf-8?B?RzkyVlFiNXlsaVFOR2daZmJOMTJGQS9pSWpmbVh5bGlKN2tXVXlPTTMxbWZt?=
 =?utf-8?B?ZTVKOFJ6UVZKTWc2eU5iQXNwNzlDK0hZMitSVlo5eTVMaWNKczl3Z3JjaDFi?=
 =?utf-8?Q?lEXfGubb8I0HOaSgGAq2yTIhKcozVTTa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3NIREdUaU91RDBXbEc5WWttanBrZlgwNDdWSzBacnNuQ3BJWVdXTmNsaDVL?=
 =?utf-8?B?R3pZNWJvNUpXcDA5UEs4dFpnMEJ1OXVnZENyenZVc3FOeHF2aURERStFSVlJ?=
 =?utf-8?B?RXRMcndOVkFBcVhmRHliWUo0ZXdYZmhjUXQ1b3hvelRITGVmU29IZVg0eVEy?=
 =?utf-8?B?NStIOFNQeWVubU5lWFJHbml3NnNkMThocERNTDZhYjBWbld5Y1NOMHV3YTFX?=
 =?utf-8?B?SkVHZzVHeGdzTkdRMjRQUjJENHBtT1BSOUVNSHNadEVPYjdPMFFlUGtPWEFF?=
 =?utf-8?B?c01Rd29oa3hGOTJURCtjMVBnWUNMaEgvbDZTKzZod2EzVW5XNDJISC9nRWdW?=
 =?utf-8?B?VzlYMlNiSjBLaUNHK21VMHo2V25UU29SalcyUlJQMHpzSE9TMGZTSmpqaThK?=
 =?utf-8?B?dHVXOWxZaGlTWFUyYS9HbExMY2hZQ0RpN3FxaEpUZTUvWHRoSnEzczZwdC9o?=
 =?utf-8?B?eGx6VDNIcktoeFMwQlZqZTFiYmtwdjhxNUZ5eWNoc3cyZ010MExrbDZ4djYv?=
 =?utf-8?B?UEVjUEluU3ZKZXNLK3lnODBOWnlkMWMzMTJuSXNGazNUQ1VYdWJXRk5pYkpr?=
 =?utf-8?B?ckFqYjdvbk5yT1BxcGp1YVM1M0ZTNWhPNlZEZW5maVJJS3hPRUJTN3BiSysz?=
 =?utf-8?B?c3BOR0NIUnd5NUhGY2hMYjdzMzZ0dnpEblhqR1NyeDdlL3Q0ckxvSll4ajEw?=
 =?utf-8?B?aGZOc3lUa1ZNa3JUbkFXQzBIMFVaWXhucmtKUWQwOUJ1M3FXM2RmdTI3TUtj?=
 =?utf-8?B?dnNyb3lFbEFSQm9CYW1xbG0rWDUrOUFMbXFRMjJaZ0RVNEdFNkNZSzF0STJo?=
 =?utf-8?B?UTBsdlFWczArS1dJZEVlNlF0NWN1VWRkVDlxMXdiM2ZCTytKRmVTTmtNaW5r?=
 =?utf-8?B?dkMzZnhJNk9tcDJJcjkvb3pRb1o2eE5uUmVENmJId3ZBdWFUWGlPVmpmV0dp?=
 =?utf-8?B?RVVjK05PZSs1NnJoUi94OEYxUzc0QjhZUURqSk8rZFRaZmZkWGU1TXB1U2d4?=
 =?utf-8?B?WmxZQStMYm1wN242V0dhRnVBNjh1d0F0cTAvWTY4elg1bkNyQnBIL0s1UHc5?=
 =?utf-8?B?ZndURzJobVBCaG5GdDl3YlZldmFhK2tDbnhMWTU0NGxqaGhtNXZHamptWDhP?=
 =?utf-8?B?OXVFMnhqOVBHSks3THNUck9kcjlrU2RxeHk2Um13WFFQUFVXeFhQU1crU2oy?=
 =?utf-8?B?eGd2Qmt1VnFVRkhyTCtQS2dXN1FQSnFwUnkrNXM0ciswUEdWQ2RvaW9OUXAv?=
 =?utf-8?B?NDRWZGlxMW5mQnhtSzlURDlmS0MzRVZwd2hxa2tUNzZPRXZ0dUlKS1ljdUxJ?=
 =?utf-8?B?VFBEdUZ0ZCtZWThJUit3MzFjVEx4ZHZnS25ySWdHOXBIMTA3YkExb3lCcmRj?=
 =?utf-8?B?by9LdGluTi81SFJvQXduSzJLTFdxVWJrNU9ibm9iOEg1YVFRKzBRZ2YyQlpW?=
 =?utf-8?B?YVQ4S1gvRUpKczBSa2dDa1ZwZGlmWGp3Vmg3L1NWT0hNb21GNWxFMDhEaGxq?=
 =?utf-8?B?R2dBVmZHTlh2NnphZnRJMFRmbTFoejRVeHNlVzRSUEw0VG96SWQ4WFhxQUhV?=
 =?utf-8?B?R3RBdzk4Zk00dFlRclJNb1Y2UGJ2b1Fzbmd4dWFEUGNORS9iZDNQZmRmOTJJ?=
 =?utf-8?B?VmpRejRFZzVqdFJRb2djY1l6S0syYXp1YWQ5VkIxVzI1UzlCc0RhT01QLzhS?=
 =?utf-8?B?Ryt3cVZwWTRtWFdwY1FSVlgxcjlBRGhQMGwyYTJTY0VOcW9HQTBhZkNwRzdW?=
 =?utf-8?B?ZnRYVDByVHJKZ0xGMngrKzFEZ05UN1puOVVqSjRYcGZIYUQyZGJMMENWTk5Z?=
 =?utf-8?B?TkkrWUxwdm13WEQ1OFJkTS9EZHpHMnhNbHl3TjVvZFNYNlR1T2Z5UmlTWUpz?=
 =?utf-8?B?SFY3SEJzUDlHTEJEeXBXS0RGOGVFd1lpSkNyYTE3anRJMThBczNIT1ZRWkxn?=
 =?utf-8?B?SHovWUM5TjVoQUt5ZTQ4akNWZlV6STE4bjQ2U1pPUThHU29nbXlUUmppbkVI?=
 =?utf-8?B?eUtSd0RIVE14Q3dDSlNYbnNVUUxyeGNkYXpWQUdxRGU3UmJWbkc0eTZGQno0?=
 =?utf-8?B?MVJtWFo1UVJkWGVWTkM1MHh2dE84M2ZuN0lwRW50RmVwY3c0REVwT1B6aTFm?=
 =?utf-8?B?WlFkRXlyR0VVWmFreGpjanZza1U2WGFvOHpSYmh5a1Y2YTRIdDllWnB2alVO?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 683ba27e-1b9f-49c7-f55d-08de368bd0a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 18:58:46.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpOi8+MsevPlj3VnWpaEm3zvay8fdaxydglhsADz2bKgia5GvahpQsmG+Ao6w243iG4wwy0uk8Vp1cgtYkW6Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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

On Mon, Dec 08, 2025 at 11:35:33AM +0100, Philipp Stanner wrote:
> On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
> > On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian König wrote:
> > > On 12/1/25 10:04, Philipp Stanner wrote:
> > > > 
> 
> […]
> 
> > > > It eliminates such a race *in amdgpu*. Other drivers might not have
> > > > that problem. I think Intel/Xe is refcounting jobs? Matthew?
> > > > 
> > 
> > We schedule device resets on the same work queue as the job timeout
> > queue, as well as operations like VF migrations, since conceptually they
> > are quite similar to device resets. In both cases, we have the
> > capability to stop all schedulers on the device and prevent any future
> > schedules from being created while these processes are ongoing.
> > 
> > Putting it all together: when either of these device-wide operations is
> > running, we know that no job timeouts will occur and no scheduler
> > operations (e.g., run_job, free_job, etc.) will race. I suggest that all
> > other drivers requiring device-wide operations follow this approach, as
> > it seems to work quite well. In other words, even if free_job is moved
> > to the timeout work queue, I’m fairly certain you would still schedule
> > device-wide operations on the timeout work queue and still stop all
> > schedulers before any device operation touches scheduler or queue state.
> 
> Thx for the explanation.
> 
> As far as I'm aware, everyone concerned already follows the (by now
> officially documented) approach of stopping drm_sched on reset.
> 
> We have never really documented very well when and why one should share
> the timeout_wq, though.
> 

I'm not sure if it's documented. When I started working on Xe, Boris had
recently added the timedout_wq, which, from my understanding, was
intended to schedule all reset-type events (I believe Sima suggested
this to me).

A lot of the things I did early in Xe weren’t the best from an upstream
community perspective. To be honest, I really didn’t know what I was
doing and typed a lot.

> Someone who thinks he understands that really well should document that
> in drm_sched_init_args.
> 

I can take a pass at this. Did you documentation ever land? Building
upon that would be good.

> > 
> > Therefore, I don’t believe Xe actually has a problem here.
> > 
> > > > > > - Matches the logical model: timeout selects guilty job and recovery,
> > > > > >   including freeing, is handled on one queue.
> > > > > > 
> > > > > > Cons / considerations:
> > > > > > - For users that don’t provide timeout_wq, free_job moves from the
> > > > > >   per-sched ordered queue to system_wq, which slightly changes
> > 
> > s/system_wq/system_percpu_wq
> > 
> > Ok, the system_percpu_wq doesn't actually for timeout_wq as that work
> > queue is reclaim unsafe. We probably should just remove that fallback in
> > the scheduler.
> 
> Which one, exactly?
> 

System work queues don’t work for either timedout_wq or submit_wq. In
both cases, we need the workqueue marked with WQ_RECLAIM and must ensure
that no GFP_KERNEL allocations are performed by any work item scheduled
on the workqueue, which is impossible to guarantee with any current
system workqueue.

> > 
> > > > > >   scheduling behaviour but keeps correctness.
> > > > > 
> > > > > We should probably avoid that and use a single ordered wq for submit, timeout, free when the driver doesn't provide one.
> > 
> > Ah, yes agree. I typed the same thing above before reading this.
> 
> Why do we even provide a submit_wq?
> 
> The timeout_wq I still understand somewhat, since it can help ordering
> racing timeouts. But submit?
> 

We could probably get rid of submit_wq, but I don’t see a significant
upside in doing so.

> 
> > 
> 
> […]
> 
> > > > 
> > > > I'm not convinced that this is the right path forward.
> > > > 
> > > > The fundamental issue here is the gross design problem within drm/sched
> > > > that drivers *create* jobs, but the scheduler *frees* them at an
> > > > unpredictable point in time.
> > > 
> > > Yeah, can't agree more!
> > > 
> > 
> > The scheduler doesn’t free jobs; it simply drops a reference count.
> 
> In our discussions, it is astonishing me at times with what naturalness
> you make that statement.
> 
> Who has ever defined, who has ever documented that this is how the
> scheduler is supposed to be used?
> 
> Let's look at the docu:
> 
>  /** * @free_job: Called once the job's finished fence has been signaled * and it's time to clean it up. */ void (*free_job)(struct drm_sched_job *sched_job);
> 
> "it's time to clean it up"
> 

Again, this is definitely not documented. I quickly found that if you
directly free jobs in free_job(), and the job pusher touches it after
the push, things can explode with the right race condition. Thus, I
reasoned that jobs need to be reference-counted. Pretty much every
driver actually does this, with AMD being a notable exception, perhaps a
few others.

> 
> > free_job should be renamed, in my opinion, to reflect this. Once that
> > misnomer is fixed, the design actually makes sense.
> > 
> 
> How do you know that this is the design idea? Since when do you know?
> Why was it never documented? It's kind of important.
> 

See above—I reasoned this one on my own and wasn’t a great upstream
citizen with respect to cleaning up DRM scheduler code or documenting
it.

> >  The scheduler holds
> > a reference to the job until its fence signals and until it is removed
> > from internal tracking.
> > 
> 
> Let's look at tho documentation for drm_sched_job:
> 
>  * @entity: the entity to which this job belongs.
>  * @cb: the callback for the parent fence in s_fence.
>  *
>  * A job is created by the driver using drm_sched_job_init(), and
>  * should call drm_sched_entity_push_job() once it wants the scheduler
>  * to schedule the job.
>  */
> 
> Do you see any clue anywhere at all that jobs are supposed to be
> refcounted? Where is the scheduler's reference (refcount++) taken? That
> could maybe even be taken race-free by drm_sched (likely in
> drm_sched_entity_push_job()), but I strongly suspect that what you're
> hinting at is that the driver (i.e., Xe) takes and frees the refcount
> for drm_sched.
> 

No, agree this should documented something like this:

A job is created by the driver using drm_sched_job_init() and should
call drm_sched_entity_push_job() when it wants the scheduler to schedule
the job. Once drm_sched_entity_push_job() is called, the DRM scheduler
owns a driver-side reference to the job, which is released in the
put_job() driver callback.

The above is akin to the fence returned from run_job() transferring a
reference to the DRM scheduler, which it releases when the scheduler
fence is done with the parent. So, the concept was understood—albeit one
that wasn’t documented for a very long time.

> 
> >  Transferring ownership via reference counting is
> > actually quite common and well understood. The scheduler takes ownership
> > of a ref when the job is pushed to the scheduler.
> 
> s/takes/should take
> 
> Don't get me wrong, I *think* that your design suggestion to refcount
> jobs is probably (considering the circumstances we got ourselves into)
> correct. I think I would support porting drm_sched to refcounting jobs.
> 
> But your way to formulate it as an absolute truth is plainly wrong. It
> is not the design reality, many drivers don't just drop a refcount in
> free_job; and it's not documented.
> 

If it’s coming off as the absolute truth—that’s not my intent. I’m
trying to help make sense of the DRM scheduler design so that it works
for everyone.

> Moreover, I think if refcounting jobs were a reality free_job() could
> just be deleted very easily, since the scheduler could drop its
> refcount whenever it pleases, without calling back into the driver.
> 

Right now, all the reference counting of jobs is embedded in the
driver-side job objects. However, if we moved the reference count into
the base DRM scheduler object, this would work. Of course, drivers would
need an option to override the destruction function, as the final put on
the object could have other side effects—for example in Xe, putting
other objects and dropping the RPM reference. So, we’d need a vfunc
somewhere, and I’m unsure if surgery across subsystems and drivers is
worth it.

> > 
> > > > This entire fix idea seems to circle around the concept of relying yet
> > > > again on the scheduler's internal behavior (i.e., when it schedules the
> > > > call to free_job()).
> > > > 
> > > > I think we discussed that at XDC, but how I see it if drivers have
> > > > strange job life time requirements where a job shall outlive
> > > > drm_sched's free_job() call, they must solve that with a proper
> > > > synchronization mechanism.
> > > 
> > > Well that is not correct as far as I can see.
> > > 
> > > The problem here is rather that the scheduler gives the job as parameter to the timedout_job() callback, but doesn't guarantee that ->free_job() callback isn't called while timedout_job() runs.
> > > 
> > > This should be prevented by removing the job in question from the pending list (see drm_sched_job_timedout), but for some reason that doesn't seem to work correctly.
> > > 
> > 
> > Are you sure this is happening? It doesn’t seem possible, nor have I
> > observed it.
> 
> It's impossible, isn't it?
> 
> static void drm_sched_job_timedout(struct work_struct *work) { struct drm_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET; sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work); /* Protects against concurrent deletion in drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list); if (job) { /* * Remove the bad job so it cannot be freed by a concurrent * &struct drm_sched_backend_ops.free_job. It will be * reinserted after the scheduler's work items have been * cancelled, at which point it's safe. */ list_del_init(&job->list); spin_unlock(&sched->job_list_lock); status = job->sched->ops->timedout_job(job);
> 
> 
>    1. scheduler takes list lock
>    2. removes job from list
>    3. unlocks
>    4. calls timedout_job callback
> 
> 
> How can free_job_work, through drm_sched_get_finished_job(), get and
> free the same job?
> 

It can't.

> The pending_list is probably the one place where we actually lock
> consistently and sanely.
> 
> I think this needs to be debugged more intensively, Christian.
> 
> 
> > 
> > What actually looks like a problem is that in drm_sched_job_timedout,
> > free_job can be called. Look at [2]—if you’re using free_guilty (Xe
> > isn’t, but [2] was Xe trying to do the same thing), this is actually
> > unsafe. The free_guilty code should likely be removed as that definitely
> > can explode under the right conditions.
> 
> I'm right now not even sure why free_guilty exists, but I don't see how

I'm sure why free_guilty exists either. If the fence is signaled in
timedout job free_job will get scheduled on another work_item.

> it's illegal for drm_sched to call free_job in drm_sched_job_timedout?
> 
> free_job can be called at any point in time, drivers must expect that.
> No lock is being held, and timedout_job already ran. So what's the
> problem?
> 
> For drivers with additional refcounting it would be even less of a
> problem.
> 

No, the scheduler can still reference the job.

1265         fence = sched->ops->run_job(sched_job);
1266         complete_all(&entity->entity_idle);
1267         drm_sched_fence_scheduled(s_fence, fence);
1268
1269         if (!IS_ERR_OR_NULL(fence)) {
1270                 r = dma_fence_add_callback(fence, &sched_job->cb,
1271                                            drm_sched_job_done_cb);
1272                 if (r == -ENOENT)
1273                         drm_sched_job_done(sched_job, fence->error);
1274                 else if (r)
1275                         DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
1276
1277                 dma_fence_put(fence);
1278         } else {
1279                 drm_sched_job_done(sched_job, IS_ERR(fence) ?
1280                                    PTR_ERR(fence) : 0);
1281         }
1282
1283         wake_up(&sched->job_scheduled);
1284         drm_sched_run_job_queue(sched);

At line 1269, the run_job work item is interrupted. Timed-out jobs run,
call free_job, which performs the final put. Then the run_job work item
resumes—and boom, UAF. Using the same reasoning, I think moving free_job
to the timed-out work queue could also cause issues.

If run_job work item took a reference to the job before adding it to the
pending list and dropped it after it was done touching it in this
function, then yes, that would be safe. This is an argument for moving
reference counting into the base DRM scheduler class, it would make
ownership clear rather than relying on ordered work queues to keep
everything safe.

> > 
> > [2] git format-patch -1 ea2f6a77d0c40
> > 
> > > > The first question would be: what does amdgpu need the job for after
> > > > free_job() ran? What do you even need a job for still after there was a
> > > > timeout?
> > > 
> > > No, we just need the job structure alive as long as the timedout_job() callback is running.
> > > 
> > 
> > Yes, I agree.
> 
> As far as I can see that's how it's already implemented? No one can
> free that job while timedout_job() is running in
> drm_sched_job_timedout().
>

See above, free guility is still problematic.
 
> > 
> > > > And if you really still need its contents, can't you memcpy() the job
> > > > or something?
> > > > 
> > > > Assuming that it really needs it and that that cannot easily be solved,
> > > > I suppose the obvious answer for differing memory life times is
> > > > refcounting. So amdgpu could just let drm_sched drop its reference in
> > > > free_job(), and from then onward it's amdgpu's problem.
> > > > 
> > > > I hope Matthew can educate us on how Xe does it.
> > > 
> > > We discussed this on XDC and it was Matthew who brought up that this can be solved by running timeout and free worker on the same single threaded wq.
> > > 
> > 
> > No, see my explainations above. This is not my suggestion.
> > 
> > > > 
> > > > AFAIK Nouveau doesn't have that problem, because on timeout we just
> > > > terminate the channel.
> > > > 
> > > > Would also be interesting to hear whether other driver folks have the
> > > > problem of free_job() being racy.
> > > 
> > > I think that this is still a general problem with the drm scheduler and not driver specific at all.
> > > 
> > 
> > Maybe the free_guilty is likely a scheduler problem but I'm not seeing
> > an issue aside from that.
> 
> I also can't see the bug. I fail to see how drm_sched can free a job
> that's currently in use in timedout_job(). If that can happen,
> Christian, Vitaly, please point us to where and how. Only then can we
> decide on how to fix it properly.
> 

Again see above.

Matt

> 
> P.
> 
> 
