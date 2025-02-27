Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35488A477B5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 09:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50A310E371;
	Thu, 27 Feb 2025 08:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGCnAVMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8A10E371;
 Thu, 27 Feb 2025 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740644695; x=1772180695;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0ZkvfA8jCzglHSxCD22yyECO+S5Aj7qBX9mdCxq8Rdo=;
 b=ZGCnAVMoEK9lC14u6uE9YbQYijfO4uYhHrLljaf/OiyW+ihHSYyOB9Mn
 aW/Gvdzkv5jak74lAxgCW4UyibRGS5u7XxIIv6XZLcXeD/yoK0cJDzMu8
 61r2u4bH/Y2K/old+P93pW36ESVsYeakQokpdJahlSvK6/Y0mKRTVNGGQ
 PCzyp34vc+Bh0O7gmchnV8btFkYIqJJEkzr2/BYT1lRxVMrJRlrX2d5B8
 Q845+7YvYjAU3vxMyTS6rSKONsrWksiZg6bNQoCwcaFmUD3L1m3xsRKgC
 n1d4QzLkq9+bzKv1qFmZzCQmOD5FNUHxJogTSh25+Y1ljOPK75h3y4wM+ A==;
X-CSE-ConnectionGUID: w6JILjuwSKiHTqf67Oh2CQ==
X-CSE-MsgGUID: XF6fc2NsQZWvHhve945zIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52162078"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52162078"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 00:24:55 -0800
X-CSE-ConnectionGUID: Jur+lOABTmSh2N4XK7Y4QQ==
X-CSE-MsgGUID: 4bRchzTnQMSOgqPQNMmLaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121557697"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 00:24:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 00:24:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 00:24:53 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 00:24:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kw7NdgQEYrS9mrtas0gZ0o4c6AlQB1AAaz9evf7pXEsUvh3mRP0KfujFsF5kwn2uPq5Ckt5y158Y1DdhdtdafGHdsspaT92prSrYCPRedEl5jVSQjLwxF5nVSzcRpgHPznJv2ytn/boKw4nD+MxC9kvWLSGEooACXs3sqTUFHU1A7ErLkgphPoqqxxXDCfazELlNqS3H7BXgy2E0tNvlYTkEJ7ksdjaIEk2NoU6GgYfnCXn5K/b/NMMqaNbBMN0RJE5u082j+4WWLQdeUo4V3DHSZEuXrNY9U4KaDJYXInHOgGuymgE7bEMgIg5v90CMPFmGiT6UIA5xFYEXITmq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+UUaNsI5xvh9h2dTZaZTwrY6liE57qYLZjGHekG8F0=;
 b=ovD3P1FRMqQKGo5uwZHJLE6NAx2KGpgi0r9ukd6sD14/qYeZwW0JroCF6tIOjKYNMGSBY0D4VVBOBEo+DHvhANiG2H/QQdwYnl7GSqTlNASS8SirBOr6gmSrHeMP3aJlc+sa96E94wgMCbPUy2FfMx7ukLlmlR0zkdykCxlz28V581ud52VozmQRUHLNwWBQ68s95YNdbcWKPfVD7IqLa0L/NoesS6lAJ/+T4sHTCFVDSSzfyq7YQTu9ZPaGd3SPZ6zCVhwUeGwfuLVgGWgWjho+/8TlCJEGwwYBNw+z0Vl5QxlWbdYj87iXwuAL5veob7ZnQQNfomz8O16uyI0/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 08:24:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 08:24:23 +0000
Date: Thu, 27 Feb 2025 00:25:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <Z8Ahdyn0KgfmE9M6@lstrano-desk.jf.intel.com>
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
 <20250226225557.133076-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226225557.133076-7-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:303:6a::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: b02ce624-694e-4ece-f0c2-08dd5708240e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEtkRUxEVGM5RGd4WTNJdWFVUjYzNzJsenp6UWJxTEVaNXQxQXM5TzdUQjRi?=
 =?utf-8?B?Zi9pUnhWbEo3UTFqUDZBdVpEY05rNmxmRElrenpCamZrSHkxMExPZ08xZktE?=
 =?utf-8?B?QWVkdXE4MGF4bi8rcDgwUlh6emhuK0M0V21DZktDZUp2djA2bVhMWnV6Yk5u?=
 =?utf-8?B?MVRJS2tKQlNnSGJuUlk1TDFZWDR1MkF6ZkozOG1PcDFhZDk0dEJNWWRaMmhL?=
 =?utf-8?B?akRPYm04UE5YbFExaC9RNGhCMXB2UnhEa085blFuS2N3L2h3M0RwSmtzNVQ5?=
 =?utf-8?B?a3hNdk40WUhPclpNc1FaMUp6MTRrUHF0MUlKRlBMclFOSHRDYjF2V05IWjkx?=
 =?utf-8?B?M0czRGQxbGJYaHIxK2YxWXJxWGx6T01RdU82YXRMaXZDWUpkN2MrMWVBTHBF?=
 =?utf-8?B?MlZCbld6L3cxNGQrZU0xeGlOTC8zMjFYbUxvdVhlcitXVTVPQnpsY2xncXFN?=
 =?utf-8?B?ZjB0MnVzNmMzOW4zSXJrTGRTRm5Cclg3WVplbmtIaEZ2aVBLMjdDUEI2N2lh?=
 =?utf-8?B?YmRlSmVBc3l5NFQ4dTQyaDhuaUlJTlVsdHhocWZldHAyem8rRlhBU2F4RXRx?=
 =?utf-8?B?TXVaOWJ0dk9nZWNMNGtLSUxhaFhEbEZUZjhvZzd6a2Y5NzlXSVNFaElrTVk5?=
 =?utf-8?B?RmNPZ3FVN2pVTzRLdDJIK3FZZUhUanFYbGRBYXkyU0hqZytEQk15Q2JiOTY3?=
 =?utf-8?B?QW1IUmZaMklHWGk1Um5NT3RPUDcvMUEvdDhuY3g0NW9ndWdIdHNCYkl1VDFP?=
 =?utf-8?B?dDlUNWZjSksvRGdmbnY3c3ROQ1JvUDdnQ0hrUWFHSFRacVloQlMxUzY5TlRm?=
 =?utf-8?B?bkhocGYrbUNTOWQ4Ukd1R3Vxcm9ZWVJSMGNWY1JZWVpqWjZ6aGkraWNEekQr?=
 =?utf-8?B?blhwNnpVYmpxK3VzcDFOdGVrOWNqSm44Q2Zia2pkNjhkbDJoWGM3QVE4S1Q1?=
 =?utf-8?B?TU1CV3lxL1pTVGJvekhJSFNLaTJzWXdMOGo3L2ZwUnB2VWNHU3NMdkllUk53?=
 =?utf-8?B?MStpUnljbnFsWnNRYXZDOHRiK1F5T2g1V3Y3RVA2VlFkVjYxR3AxdmVPYWo2?=
 =?utf-8?B?amI1blI5QURTOW1NRGZwbjhTcnZEcWh6NEc4bkRLMlRvNjIxMlllNzBkbzA3?=
 =?utf-8?B?dTVFeTVsY2ZmWVY3WmhtcnI2WXdBNWpZYU52bUVTVWlaTXBtS0RuUzNWOTNz?=
 =?utf-8?B?emtVemJtWWFNVXRaUUNWWWNGNkV1dktVRk05RDNoa1FZczc1Z3R6TmpKMkhI?=
 =?utf-8?B?SCtwZzh2RE9IZllEWFRkaVFLTVc5Q2VWcm9VUXBiQnc5eU0zTFFHSUpySmZ0?=
 =?utf-8?B?eEpIL1lUWEJyOUJFUEFHMFVJa3VMQnBSVWNlTmZVTlRHSGtIQjlWVnBQT2hY?=
 =?utf-8?B?UGNCMVY4SCtsdUtLTGZoSnFUOXptZy9Uc241MnQwaU4vcmxnTE1iMGltZFNm?=
 =?utf-8?B?STBoOVJQVUsxdmNhRHpzcEpxSVVnb29zWmlDaE1NWjI4T0IyL01oQjdMVi96?=
 =?utf-8?B?VVpIa2w4S3h6VUVmWnJ6a25GQ2VsSFRNTU40QXFJUHk2SktqK2M4MjV2cFNV?=
 =?utf-8?B?dnlCcTdmU0VScDV4emFucGlKQVVBUmlNaTYvamJ0a1ViRVpSZFhVWCtXTmZ0?=
 =?utf-8?B?T21ENm5NYTNHcWQ3OTFUTHJPdTk1M1JWRzU4aFJOQnJTbkt2OGJ1eEoxenU3?=
 =?utf-8?B?aHdjU3orNzJOOHVJa29ldjA1cWwrNzFESTJjcXFsaFBYdFcyMWlRVU9vM0s3?=
 =?utf-8?B?VytDNnc2VnczaWhnOXpWQXVkYUFMdlN0ZHJNNk0vYWZ3UWY1b1JxSWhEZXU4?=
 =?utf-8?B?dmV4MkpROHdwcjdDQTVndz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZuQlY5azlqa2E1b1h5ekJVcFVnZ2g5TUNpVnpqVFVBVkV1NS9vU2J6cWdi?=
 =?utf-8?B?djhGa2xSOG5KK1NSTmh6bklCWHg1ZjVJNk5QMDVrYnVTTmZYci9XenNnSC85?=
 =?utf-8?B?V0xzc2txbU1LOTllT3BCU3hmUnV3UlZ4K2psdUIwUTdtNEt5Slc2TmxSNjRo?=
 =?utf-8?B?NDdWMktKQ1NZVzdyT1FZdVN4VkpRdVVSY3BpUzZwclZTelZXbDlNVUxOeDU5?=
 =?utf-8?B?R2VqTk9Tdlc5aUxYT2ZTVlRKVU5JYVpqcTZnOWR1a0ttT3lubHM1ZEJ0ZFZG?=
 =?utf-8?B?ZklTWW5QR3JuRHdkSzdxSUhITWxUTVppNC8rWGVZeTQrZVljUnZzOE5KWXdI?=
 =?utf-8?B?OFhqUHE0S2d3ZmlvZnNhN1ZOTHVldXM1UEhaZ0thR2oxRjdZd0ZHYWNEaElQ?=
 =?utf-8?B?Zkk1NzA4c3lSamR4L3VGN1d4S0Q3cnBnSkhFSVozcHFCQWVLMndGam1vekpD?=
 =?utf-8?B?ajZOVEJjVEh0ZDA3dml1SjNQT3J1RTZ5MitaTFpGU2RjekQ3MHYvYzFyZnRi?=
 =?utf-8?B?ZTlVMG5xcU5IbDVVNmdGaGpsdTNNOStGdUZqdGNTbC8rY1k4cTd6WDZZVUVC?=
 =?utf-8?B?enZyUzEwVW9zY0tCZzd4RkxvNk1WWCtITU5sT0hVY1dxZzFBYlY2NWxjMnAz?=
 =?utf-8?B?RWtqWFVSdjRjT21HRTZOSFNUZGVFandmMmE2UWNyeWZFRGtKaWZjR3pGWndD?=
 =?utf-8?B?QlZGRmcyR25SaC9xWjllb01SQTRpNytObTY2cWZSWTdSaGFkUFRLdEsyazFn?=
 =?utf-8?B?dGNaVTEzeW92MXdqQkJKQXErMjJJdGVXaEN0bEFMNXZxMVA1RFB0MmVnNVgz?=
 =?utf-8?B?OUswWjRuUld2K3FCeGtwWEhvV0NUN0QrZDdPYTJQTkF4aUo4d2xHUnNsdm5m?=
 =?utf-8?B?NnRxNU12T1N5bHNkQVVpQ0lOTWVrdCtMREEwL05PU1ZNZkJkSEROZlFGZFBE?=
 =?utf-8?B?OGc3ZC9XNzFCUjRxQ3JGd0wweXdlK0N3MGNrVndhS1JGMHdEVkdEcm5mbHF4?=
 =?utf-8?B?RnFRNVVUaXd0dEtWS0xUUGExdVIwcno3Q3BVRm8zRGpYVFZLNXRpT1lFSlox?=
 =?utf-8?B?SDc4WXkrSGlidGo1NHUwWUc2RHRkNHB1UFdzREJSUko1dFFxQUJVRHJ3WUdq?=
 =?utf-8?B?T3p2VEFaQXZoekx5ZnBSZ1Y5QURKT0UweUplQmt3SGcremNWNERHWXBiL1RO?=
 =?utf-8?B?N2NyNmtlc2hMYStpNUE4U0VQTTVhYmpEenJXSWZXT0RjNE1UWGd1V0lGY2pn?=
 =?utf-8?B?MVV3OGY3M1hQMS84TmZDc2dFRWpkMFgxZ2NocTVFNmRRb2ZPRW8xY1BuZEN5?=
 =?utf-8?B?bVdsczQ2blpueTZhWi9uTEpURzdrYWZXQXhzaEpFdCtyTDRYcURZOVI2b0tl?=
 =?utf-8?B?aERGbFkzN2xJeFFwZytUTU1pT0FVSXZNZ3cxVXhjMllOWmt1UU1VMnAxa1ho?=
 =?utf-8?B?QlExM2o2UiszZjdWY2xIOFJSVXZjdkRmanZDY2FWWkpFOEZhWHE4eVZvT2FR?=
 =?utf-8?B?Uzl1U0hySXc3R1Rta29iQkZ2eVZmOGZlWUZKVWJnZWRZVmkrTHUzc3oxZXd3?=
 =?utf-8?B?aUl4WUFZS01zSGZ3MFBIdkhRVEFjZENDVVA0WnZzTVpxV2RtMWdBYURpVU9S?=
 =?utf-8?B?NVdDRFpidmdueS9TeE5yT1BMOUhxVzJ5T2NOVjdRNTUrb0FsM1NhcXhEOE95?=
 =?utf-8?B?N0ZhNjZjZW9qNzBwMVlNSm10M1BlRXdqdC9sQktpcXEreXVLOGpKN3ZZM3Bj?=
 =?utf-8?B?dFEzb0FWOFV6OHBpNFFDUm1ldHF3Rml2L1ZuZkxwSk5IQXlDT1pxSHQrSzBl?=
 =?utf-8?B?Y3hBVVZHcU13eXhjSTFZbXd4UndaRXBsYy9JWldaMzA1N1FLTGVGZ1dWdHNF?=
 =?utf-8?B?clF0NFRiYUZSZFhrT3NsdG0rTUliUW92dThaUE4rUUxHa3AwY0ZzdUp3eU1O?=
 =?utf-8?B?QVZXWEVUcHdLWXk1ZXZ0bVNRKzJ2OHJCeFE3RXphT2NBRGtLMzRmcWpZVnVl?=
 =?utf-8?B?ZmFPMVBHYmNPcHZFeWFCTzVSb0dLclB2Mkt6YnFmTXJLOE9FZ1hzOEZiYVk3?=
 =?utf-8?B?YU9kcTNxNVZSL3pHRnlOMlA1d2ZTd2ZGOGlzOHp4YUloampNVDZFbFp6YzQ3?=
 =?utf-8?B?Tm50ZTdhUGRObUROOFFVV25MdHFCb3o5SDhLSGJmL1RsZVZ1ZlR1RndBeG9O?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b02ce624-694e-4ece-f0c2-08dd5708240e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 08:24:23.3951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyURBpJlIaAlMAy+xrRU2eRm2sSSj/bCM4oi89CU2NnqhLPENnx9Ah1jFHpUtzpFpte9nT+bHShgppjuPAGpCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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

On Wed, Feb 26, 2025 at 10:55:56PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to get various properties from a specified VM.
> The currently supported properties are:
> 
> - The number of engine resets the VM has observed
> - The number of exec queue bans the VM has observed, up to the last 50
>   relevant ones, and how many of those were caused by faults.
> 
> The latter request also includes information on the exec queue bans,
> such as the ID of the banned exec queue, whether the ban was caused by a
> pagefault or not, and the address and address type of the associated
> fault (if one exists).
> 

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     | 106 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +
>  include/uapi/drm/xe_drm.h      |  73 +++++++++++++++++++++++
>  4 files changed, 183 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9454b51f7ad8..3a509a69062c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -193,6 +193,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3e88652670e6..047908eb9ff7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3258,6 +3258,112 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err;
>  }
>  
> +static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> +{
> +	u32 size = -EINVAL;
> +
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->bans.lock);
> +		size = vm->bans.len * sizeof(struct drm_xe_ban);
> +		spin_unlock(&vm->bans.lock);
> +		size += sizeof(struct drm_xe_faults);
> +		break;
> +	case DRM_XE_VM_GET_PROPERTY_NUM_RESETS:
> +		size = sizeof(u64);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return size;
> +}
> +
> +static enum drm_xe_fault_address_type
> +xe_pagefault_access_type_to_address_type(struct xe_vm *vm, struct xe_pagefault *pf)
> +{
> +	if (!pf)
> +		return 0;
> +
> +	vma = lookup_vma(vm, pf->page_addr);

The VMA state is not stable; for example, it can change between the time
of the fault and the time this IOCTL is called. Therefore, we need an
intermediate structure fully populated at fault time, which is then
converted to user output upon IOCTL.

> +	if (!vma)
> +		return DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT;
> +	if (xe_vma_read_only(vma) && pf->access_type != XE_PAGEFAULT_ACCESS_TYPE_READ)
> +		return DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT;
> +	return 0;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	u32 size;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	size = xe_vm_get_property_size(vm, args->property);

For both this size calculation and the population if statements below,
I'd lean toward using vfunc tables for the implementations based on the
property index. Maybe overkill, though—not a strongly held opinion.

> +	if (size < 0) {
> +		return size;
> +	} else if (!args->size) {
> +		args->size = size;
> +		return 0;
> +	} else if (args->size != size) {
> +		return -EINVAL;
> +	}
> +
> +	if (args->property == DRM_XE_VM_GET_PROPERTY_FAULTS) {
> +		struct drm_xe_faults __user *usr_ptr = u64_to_user_ptr(args->data);
> +		struct drm_xe_faults fault_list;
> +		struct drm_xe_ban *ban;
> +		struct xe_exec_queue_ban_entry *entry;
> +		int i = 0;
> +
> +		if (copy_from_user(&fault_list, usr_ptr, size))
> +			return -EFAULT;
> +
> +		fault_list.num_faults = 0;
> +
> +		spin_lock(&vm->bans.lock);
> +		list_for_each_entry(entry, &vm->bans.list, list) {
> +			struct xe_pagefault *pf = entry->pf;
> +
> +			ban = &fault_list.list[i++];
> +			ban->exec_queue_id = entry->exec_queue_id;
> +			ban->faulted = !!pf ? 1 : 0;
> +			ban->address = pf ? pf->page_addr : 0;
> +			ban->address_type = xe_pagefault_access_type_to_address_type(vm, pf);
> +			ban->address_type = pf ? pf->fault_type : 0;
> +			fault_list.num_faults += ban->faulted;
> +		}
> +		spin_unlock(&vm->bans.lock);
> +
> +		fault_list.num_bans = i;
> +
> +		if (copy_to_user(usr_ptr, &fault_list, size))
> +			return -EFAULT;
> +
> +	} else if (args->property == DRM_XE_VM_GET_PROPERTY_NUM_RESETS) {
> +		u64 __user *usr_ptr = u64_to_user_ptr(args->data);
> +		u64 num_resets = atomic_read(&vm->reset_count);
> +
> +		if (copy_to_user(usr_ptr, &num_resets, size))
> +			return -EFAULT;
> +
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 78dbc5d57cd3..84653539d8db 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -184,6 +184,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>  
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 76a462fae05f..00328d8a15dd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_VM_GET_BANS

s/DRM_IOCTL_XE_VM_GET_BANS/DRM_IOCTL_XE_VM_GET_PROPERTY

>   */
>  
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_GET_PROPERTY		0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)

s/DRM_IOW/DRM_IOWR as we write back the size.

For reference: DRM_IOW does not copy back the modified IOCTL structure
(e.g., struct drm_xe_vm_get_property), while DRM_IOWR does.

>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1166,6 +1169,76 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> +/** Types of fault address */
> +enum drm_xe_fault_address_type {
> +	DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT,
> +	DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT,
> +	DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT,
> +};

No enum uAPI in header files—use defines instead. Enums can change at
the compiler's discretion, while defines cannot.

> +
> +struct drm_xe_ban {
> +	/** @exec_queue_id: ID of banned exec queue */
> +	__u32 exec_queue_id;

I don't think we can reliably associate a page fault with an
exec_queue_id at the moment, given my above statement about having to
capture all state at the time of the page fault. Maybe we could with
some tricks between the page fault and the IOMMU CAT error G2H?
Regardless, let's ask the UMD we are targeting [1] if this information
would be helpful. It would seemingly have to be vendor-specific
information, not part of the generic Vk information.

Additionally, it might be good to ask what other vendor-specific
information, if any, we'd need here based on what the current page fault
interface supports.

[1] https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_device_fault.html

> +	/** @faulted: Whether or not the ban has an associated pagefault.  0 is no, 1 is yes */
> +	__u32 faulted;
> +	/** @address: Address of the fault, if relevant */
> +	__u64 address;
> +	/** @address_type: enum drm_xe_fault_address_type, if relevant */
> +	__u32 address_type;

We likely need a fault_size field to support VkDeviceSize
addressPrecision; as defined here [2]. I believe we can extract this
information from pagefault.fault_level.

[2] https://registry.khronos.org/vulkan/specs/latest/man/html/VkDeviceFaultAddressInfoEXT.html

> +	/** @pad: MBZ */
> +	__u32 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
> +struct drm_xe_faults {
> +	/** @num_faults: Number of faults observed on the VM */
> +	__u32 num_faults;
> +	/** @num_bans: Number of bans observed on the VM */
> +	__u32 num_bans;

I don't think num_bans and num_faults really provide any benefit for
supporting [1]. The requirement for [1] is device faults—nothing more.
With that in mind, I'd lean toward an array of a single structure
(returned in drm_xe_vm_get_property.data, number of faults can be
inferred from the returned size) reporting all faults, with each entry
containing all the fault information. If another use case arises for
reporting all banned queues, we can add a property for that.

> +	/** @reserved: MBZ */
> +	__u64 reserved[2];
> +	/** @list: Dynamic sized array of drm_xe_ban bans */
> +	struct drm_xe_ban list[];

list[0] would be the prefered way.

> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM ID and a property to query to this ioctl,
> + * and the ioctl returns the size of the return value.  Calling the
> + * ioctl again with memory reserved for the data will save the
> + * requested property data to the data pointer.
> + *
> + * The valid properties are:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS : Property is a drm_xe_faults struct of dynamic size
> + *  - %DRM_XE_VM_GET_PROPERTY_NUM_RESETS: Property is a scalar

We need to consider where the number of resets requirement is coming
from. As far as I know, the Vk extension [1] we are targeting does not
need this information. I'm unsure about the compute UMD requirements at
the moment, so let's focus on supporting the Vk extension first.

Any uAPI must also have a UMD component, so focusing on one issue at a
time makes sense.

> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> +#define DRM_XE_VM_GET_PROPERTY_NUM_RESETS	1
> +	/** @property: The property to get */
> +	__u32 property;
> +
> +	/** @size: Size of returned property @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[2];

I'd put the reserved bits at the end.

> +
> +	/** @data: Pointer storing return data */
> +	__u64 data;

union {
	__u64 data;
	__u64 ptr;
};

We would simply return 'data' for properties that fit in a u64 and
perform the size=0, return size process for properties that require a
user allocation.

This may not be relevant at the moment if we drop
DRM_XE_VM_GET_PROPERTY_NUM_RESET.

Matt

> +};
> +
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>   *
> -- 
> 2.43.0
> 
