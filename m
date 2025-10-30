Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D979C2244A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A728F10EA6A;
	Thu, 30 Oct 2025 20:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wbos0W9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AB610EA65;
 Thu, 30 Oct 2025 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856411; x=1793392411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pCNX34QetsBFI+9NFfnHLVNJmD+7XyJNZFig56fCWqs=;
 b=Wbos0W9wtZnFHDoUkmyfTdf/uhG26QStPoH+hZ8a/N7MGM084bvjowz1
 yv9xyHShXnKYGWYTMqTUDsFMEk7062ojewvKJjA62pHhdJE/b85dqLq37
 kCbD+H30CFLsHYyJa3p1Kko936TzYET0EqHvpVlGpq9Ul9T0IHTZ2/qbC
 0cHA27kSrOz9yN5cVsEXEyJ9gUiJV3AIpyTlv39xOwSaBzots6ZvJ9C9P
 FL4+NWE+3pqJVaRQaZDpCmHj+9k61NXtanbojPdSR0hQqAU0LslkcVib3
 z0PZ0zBaPD/m6oc39mhnQ23M2dWxUzBeMtsgbR9pMtJ33ApFF0d/MkWGg w==;
X-CSE-ConnectionGUID: mkw6BYoKSmaqVl08fBCNOw==
X-CSE-MsgGUID: rwhwLTdyQ4emaHixwzEuEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67664325"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67664325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:31 -0700
X-CSE-ConnectionGUID: FjdA2IGVSzeA4uoJPoCVcg==
X-CSE-MsgGUID: iLnjQqFPTFSS+bs9ovRh/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262693"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMXymnsERJGn0ChAoNQ6TB7GsaZoryABF2hRRSBfIvDtVClw1Cy5jbxeYnjPbljhPNN3H1rmaqh+I61AUipQB5LoxoBxjDhKIJIslosdwzgfwzNJ4uZYmmFk7Sf0wx6nLAeFkkeQW8T1DSTXfvAa/0o+xLTYwiimVK0QpfWrUadM/QjTXhFMDlZoeBdumxoGUJaZG3OEr4G/E2LwbimnFKH7ts3SN1InDRkxtPF4GUtv6Sj/2Aos0IQvBcsFafe43xsdgFxiHk4V3p9OLMFcudtYizFgVtLBf6XqCiSF4gYgootIFBvoA934NbzOPebrNrWSjccOcRMkz2PCewszBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po4Mhl4nZq8MSNmxfpA4PPjrU+uevrwHbUjWxTO0ktU=;
 b=QKaZ9A2FZCorxQ1k9zro7q3JdSE8FyqGZJahLfDlRxxvyi3UDbS5UZxZDXMps59gZC/e4kU7sTIPsMVZXZfZIy5o0mxFQI39FHhnlOutR9KsjNR9dJHmUlyVUBosxaXEnL44pckujRJ4Au0MQI/A6hbe8FNiEZyhmeHSgjxBWdn+u9h1/f3ZnJbljz9n1SpVZVxb1TglzpCfjbbCtnCnaFant1UBmsyYoievm91dKccDhPPRQGIKXeu5+O4BagjhvgSFhYqLNODAi+sV/1KtK1vm9/o7DfCQoz4dehtsOBOb1qpOQPBde8Tr5pak4SA8msJd9JxRjmIJab+PW3kJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:21 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:21 +0000
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
Subject: [PATCH v3 17/28] drm/xe/pf: Add helpers for VF GGTT migration data
 handling
Date: Thu, 30 Oct 2025 21:31:24 +0100
Message-ID: <20251030203135.337696-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0030.eurprd02.prod.outlook.com
 (2603:10a6:803:14::43) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e33a74-5f44-45f8-a6fb-08de17f3913a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1QvakNWRlI4RlBHdWpBNi81emxEN0I4Q3NlOWtOYWhkTXpkeUNnU2RPaHRY?=
 =?utf-8?B?azZjZ3ZTa2lNTS95TUxNZ21xZnpnK3pjV0luSktjWGJTWldtR3BNU2VYcHFS?=
 =?utf-8?B?VGRpYVk1ZDVaazZvcnRvTStXTE8vOW1TTXFpZC9MaklxdDZ6NmhNb3dMbUNl?=
 =?utf-8?B?WG1WSndEd0VrK2NMVG5CSk9IekJvM3JHQjNnOXNsblcySGNXNHlaWVErY1hu?=
 =?utf-8?B?dnZCSjhMOExhSTNFVmZTTEQ5VkFCbVU4OXlPVUgyS2U4N1lnNlZZb2taQmhC?=
 =?utf-8?B?L2pEdEFpTVovb1lSUFhZQXR0dnhFRzlJR2UyejNZbXVuVGJXeGpBbVZydy9S?=
 =?utf-8?B?V2ErQjdkZlJiMVFSSG1RUnA4M1ZLbHFxOERvT0RtSUU3U1Y0eEc2YWlRZlBE?=
 =?utf-8?B?M29DMm4wc2tkTzY4aGtSeGMvTyszK3lObGhxdnFZaVlxTHhnSk51RGF1RHlQ?=
 =?utf-8?B?VFlrbVR5ZjQyanRobW9zSCsvYnZMb0pKaHJ6a2dBaGM4SDF4cEdFUlBBNTEz?=
 =?utf-8?B?aUdWb3o2ZTdxL251cDdvMXRpSFdJRzYra2ZZSUdya3RiUmx6TE1wRExIOE54?=
 =?utf-8?B?N0ZqQTZyalFoUkVsZnZGRFFJWDJkVmRCc2RlUkxna1V4NldBbm5YcGU1N01t?=
 =?utf-8?B?bjYyTUx4enRzVmFMcW0rL05IdXpKQnRxM09xdElIV0RFR2xPT2FUd2J0TjV5?=
 =?utf-8?B?RDFON0MvRUl5cm5ydDMrMCtPN0pkdXhqcUNxd1hmOVEydS9BVDBrQUh6QjlT?=
 =?utf-8?B?MjN3YkF3Yml3R3RxSktIcWxtWTlKRlV6OGZjaC9iZnZNRWpXYkd2cVZHNnFS?=
 =?utf-8?B?SnhxdEE1VHB2TVN0aGhIZlN6eTFRYlpEVzRZNWxscC92N0EweWNveTR2TXJT?=
 =?utf-8?B?cHhxNFhCUjFGMnlpcWdEelVncHozSFVUeUdOMWE1S3Jpb2NJcTdSWGRLclg2?=
 =?utf-8?B?MWpHaUZNQ3BXZ1FYZm9aenBoSXJvTUpiem9SdVBTZGFqbi9YNU9vbGFRTlBL?=
 =?utf-8?B?QVMyREpLM0tqaThuMzBpd0RiOW9yU2NYeXVlNXdhU3RBZWI1aGJXK3pOa0xk?=
 =?utf-8?B?UmRKR2MweVRIazJDbFdIZmtmdU5ONXc2Z3B4MVBlWWRPdjdmbXhReUlEYkN4?=
 =?utf-8?B?QmlZb0lLcFBjMGlvUmpaT29qZG9hSnJBRDlRWEFSL3JvUXZaUU44V2NZKzFh?=
 =?utf-8?B?UndmUG40aGFwRUw4dTFGTnlHN3BpZHovS2o5L2V3UXhTbzN6M3hteW04TE1U?=
 =?utf-8?B?RkV1V1VKd1YxVGZRRFlBZ2NmYmE2MC9WQXpud2U1aTNLZktWR3FXdnRaejRD?=
 =?utf-8?B?V3dBYmpaWG9oNmUyRlJwNWs5VjF4U3p5ZDE4TzhmMUprNUMrMmhvOGt1MENy?=
 =?utf-8?B?dzhqSGdNYzEzcHZzc1BCUm50bkJqb3VTajZPKzN1NjhXM083TXVaZE9ETnN3?=
 =?utf-8?B?VGRoSzJSSFBmdzdHcmd2eHd3UytoTjhrR2sxeVZ5STZQVXpKbDlkZjFEWGtF?=
 =?utf-8?B?OHBadHVWbmszV3M3bDVoZWdNTkhHTHovRjJZbXRQSjUrMmVPL0J3STUxN2Y4?=
 =?utf-8?B?c2wwcEFMQVBCVVliVDJOcVFGT1FKNVMzWHRtR3FKZ3N6OW43YWZTbWRFRGRw?=
 =?utf-8?B?UDFNd3RsaWp2d3UwNWMzVm9CQWtjdGtNcVZtRjBkRU9INFdYUk1iNlZEVUh1?=
 =?utf-8?B?KzBPdCtpaE5jd09ZUWVabmJZeW9UNU84cWdiZDFxcVlrUjA1dHNmeDNNOGZt?=
 =?utf-8?B?cHhpdmpOUDdXcGRucmF4eW96bThWTXROQTFoaDNlbWxzZE9vQ0ZNMVcvYmZo?=
 =?utf-8?B?MjNYenNHWHdKa0hwZHNVTWlrVGVsajh1NTNZL2N5SHg5MXJOTGxmOGdDdnlD?=
 =?utf-8?B?U1NoZXBtRVQvcTFhQjM0dW1SV1p1TEljUHFJd0xCWGRxckJyYm9JdGNFM0ti?=
 =?utf-8?B?Q3ZKTkYwSTZ3RWIzV1VYNHVLVXJPSENVYWN2aWFKZm1RVER1MmloaENjbXZW?=
 =?utf-8?Q?EYrK5l1j9DYi0ovySWsM4oSo2fqfk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVh0MU8zbC9YM3U5bEVSZjhKUFNBeXR1eHVyeFZ3QU1KQjdrMzFhRVA3Z2NU?=
 =?utf-8?B?N0dSbU9zOHQyckNmbFlNa1lmK1lPV2xlQkZ1amZoelBSNWs1cUkzbnhyQXlM?=
 =?utf-8?B?YnQyUU13ZDQ2TmQyYS9wN2FUbkVMRzBXQkd1RGJORVRCN3psM3FpNzNkQnhT?=
 =?utf-8?B?Tk1nY29RMXUrdkdCZG55Wm1MWVFvUWJYYVY4c3JMTStIOEZXUjYxcGNSd3pV?=
 =?utf-8?B?NkVrZ1pIVFdyMWhLVmJXbnJUMGN1Sm9UblBoRm1GTi9Hdm52ZWJSVWZDWkRx?=
 =?utf-8?B?OEYvcExYNmlTSGIwVkRyaUVLUTRkMjUvOWgxOFNXSXd1a2dMSFBuK293NFRp?=
 =?utf-8?B?T0ltbXNYOHNXVit3RGYySExORTJ2d0FjQitzVWFxWXNUQitQMXVkMHhwNVAy?=
 =?utf-8?B?NVRvWUlTdExxTXRsRXJZL2pHY3BaMG1XaGlzQVQ3a1lSR011SFptLzZYR3RH?=
 =?utf-8?B?RUhJdURQUExOcnNYWGZ6cVF1ZWp4WHhydm1vejFDbWV5dnd2aDhSYmVZdzJN?=
 =?utf-8?B?QTJ5V2JvNHZDZWcyQnNzUTJ1anRGOG5PY3orM2g1M3gzdWtMWlRIaG4wMS9t?=
 =?utf-8?B?S3hVRlZlRHVNY1hja0Ewa3B0UmxtZm4yS00rVWpwWUxkK0lOWHg3aGM4ZzZ5?=
 =?utf-8?B?Rkk4MU5HZCt1T3hKcVdvRDNyNFlrYjdBdjRHekhtSm8rMlN1UUR4MW9MRHU2?=
 =?utf-8?B?Q2s3T1pQQ29IbUVBSUZmc2dZZTdNbWJNZnZlaXVPbU9hc3VjUzdTSUxwS0d2?=
 =?utf-8?B?aVZyb0VHQWtpRWt0UTd6SE1jSHBYN3ZhT0VpeEpXRTZmYlJwZmpHMU5sWDdN?=
 =?utf-8?B?MlpOUlhZT3IvYmQ1SFJzQVVydEJJbzBwSW1JcmtZWUloSGI2NmZDYUpyOFFy?=
 =?utf-8?B?QUVHMXZnMzFEN3BFRnVZNHZ4eUxWeGcwSGxNNm8yZHBoRTc1U0FQMHhhclNI?=
 =?utf-8?B?c0o0bXc0cnpNdkdiS2V5L2xlTHlqTnl6YnlsN2J0Z1NzWk82MXBUaHE2WjV5?=
 =?utf-8?B?ODNPU3oxNVY0dTRxU3NGeXpLZmNZelBlRUF2em9HU1BpRUZZOUxpa0NSMTRU?=
 =?utf-8?B?eDE5ZEI4d1FkYmJ1T3N5OWpobEZRTlIyUUNjV25NSVQwRUVQb1JIMjl3VVUv?=
 =?utf-8?B?UW4vYnRETTRYN3UrdUdRNENpOC9OQmJ2b1ZyVHlyZlprS3BCUndTam9LYlZW?=
 =?utf-8?B?dnd6TSs0OHBDTVdnZi9OVlRMQjJvY2VJaDVDUWphV0YvS1poSG9SQytyeWNY?=
 =?utf-8?B?cTU4NkpxTjF2TWNvdGllVWZ2bFpkaU5jTTFDc3E1N01pR3I2SnRaQ1dVTkJm?=
 =?utf-8?B?RklROEhFQ2VPU3RIbmY1NDZ4cnl5QWl6T3IwRHBESFptTE01djB6UUVXVEJo?=
 =?utf-8?B?ZHlpVlVaOXVZby9UY2NrbnkwNzBSdmpORkZRK0M4ejNTMWhIR0VWR2R5dHlS?=
 =?utf-8?B?TnhyeXJRYW9tTkRMMitJayswVi9BTSt2MTM3bEtMeks3SGgxdFpSeit5cGo5?=
 =?utf-8?B?eXEzdS91c2hqTjNCWE9vQ3JKLzBVbk51WmdWMFNrbnlTMEs3cVhlcVZjVEhY?=
 =?utf-8?B?SmJGM0tEcWRUUGxwUStpS3ljNVIyLzBlMVJZMXF5NWFCcndGUlBwc2gwRjh5?=
 =?utf-8?B?K0hMQTZyMGNIcXlDRWQ2aGROU1M3L1cxTndzcU8vMmt0cjhNa2h0cWs3K216?=
 =?utf-8?B?eHZOMTI1ZjlXZjZ3cVRHUHlEWldsRjg4OGhUNXdKUWt4Z3haQlBVTEI3Q0hv?=
 =?utf-8?B?VHVEU0xyb2NLQ3I2OFdhZncySUZkTGtzekRSK0Fma3dySXZRTEFFWnQyejZK?=
 =?utf-8?B?TDczRnBsenpoSTZXVnpyODJUc1RuTFh2dVZwUHBsblRZU2J1aVIzRkxscG5p?=
 =?utf-8?B?ckJ2WUhsaW11V0NhdFYrRURzMy8rRTBBbHF6bVY2cVBla01vc05ibjFKb2RO?=
 =?utf-8?B?L2FRRWNDVC9uVURyYmVXbXdaaXN2UFU3YStVZzY1QjZjeGQxcXVlaFlOaFU3?=
 =?utf-8?B?UHVNbUpmNCtGbEV6bXY3WnFFWGNZY3JGL3RtNXdIcVZYN2c2Qjc0akd6dWxJ?=
 =?utf-8?B?VWM0aDR0c3R0ZkluSTZmR2t2NDhMa3hobU5GUmNjSlVueEwvQ3hoV0U1Q2tB?=
 =?utf-8?B?MThDWHpRNXpiS043cy9LMFdDQnJkdnU1SlB1c1kzOCtzc1dZcVdjSWJqbEc2?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e33a74-5f44-45f8-a6fb-08de17f3913a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:21.6147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofBgc5ebW0ZtEc3G77wVgeo80RchW9lLb+q4Nc0suF2GvEPG3llMLoH7KR/eVJv+B0WE16GdjJDIm0xnvn3aM98WeXQsn1UX2BWxn7U8BtM=
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

In an upcoming change, the VF GGTT migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the HW GGTT resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 104 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |   4 +
 drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  52 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
 5 files changed, 167 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 20d226d90c50f..00ddb4f013466 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
+static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
+{
+	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+
+	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
+}
+
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
@@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
@@ -889,6 +900,20 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 	return max_hole;
 }
 
+/**
+ * xe_ggtt_node_pt_size() - Convert GGTT node size to its page table entries size.
+ * @node: the &xe_ggtt_node
+ *
+ * Return: GGTT node page table entries size in bytes.
+ */
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node)
+{
+	if (!node)
+		return 0;
+
+	return node->base.size / XE_PAGE_SIZE * sizeof(u64);
+}
+
 #ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
@@ -930,6 +955,85 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
 	mutex_unlock(&node->ggtt->lock);
 }
+
+/**
+ * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
+ * @node: the &xe_ggtt_node to be saved
+ * @dst: destination buffer
+ * @size: destination buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid)
+{
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+	u64 *buf = dst;
+	u64 pte;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + size - 1;
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	while (start < end) {
+		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
+		if (vfid != u64_get_bits(pte, GGTT_PTE_VFID))
+			return -EPERM;
+
+		*buf++ = u64_replace_bits(pte, 0, GGTT_PTE_VFID);
+		start += XE_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
+ * @node: the &xe_ggtt_node to be loaded
+ * @src: source buffer
+ * @size: source buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
+{
+	u64 vfid_pte = xe_encode_vfid_pte(vfid);
+	const u64 *buf = src;
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + size - 1;
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	while (start < end) {
+		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, vfid_pte);
+		start += XE_PAGE_SIZE;
+	}
+	xe_ggtt_invalidate(ggtt);
+
+	return 0;
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 75fc7a1efea76..1edf27608d39a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -41,8 +41,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
+
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
 #endif
 
 #ifndef CONFIG_LOCKDEP
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..dacd796f81844 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	/** @ggtt_get_pte: Directly read from GGTT's PTE */
+	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c0c0215c07036..55444883f2ac3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -726,6 +726,58 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
 }
 
+/**
+ * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data destination buffer (or NULL to query the buf size)
+ * @size: the size of the buffer (or 0 to query the buf size)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: size of the buffer needed to save GGTT data if querying,
+ *         0 on successful save or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size)
+{
+	struct xe_ggtt_node *node;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+	xe_gt_assert(gt, !(!buf ^ !size));
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
+
+	if (!buf)
+		return xe_ggtt_node_pt_size(node);
+
+	return xe_ggtt_node_save(node, buf, size, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data source buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_ggtt_node_load(pf_pick_vf_config(gt, vfid)->ggtt_region, buf, size, vfid);
+}
+
 static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
 {
 	/* XXX: preliminary */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 513e6512a575b..0293ba98eb6df 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -61,6 +61,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 				  const void *buf, size_t size);
 
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size);
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size);
+
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
-- 
2.50.1

