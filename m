Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5716ADA2F6
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 20:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F33110E134;
	Sun, 15 Jun 2025 18:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWlQMRLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3571110E08D;
 Sun, 15 Jun 2025 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750012016; x=1781548016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x3dG0Qi83dRCauoctyOTaBcFctcll4hj9PT9clNKLKc=;
 b=NWlQMRLVjl8Ntj6Z6ptFxbb18tMi1yK4yAvao3+rE4zanFWL4lTYd9IU
 69M30Kp3zQYyKCXd1/9YAaR1L7PLehLrIb/CFr+PJt7O02kl1oP/8ArZS
 tIW0wWef7oZsr236Iu8z3zCtPFnz5or5t25rlUEn6jHsL4HX08CnjNv2T
 FrO6P2DjU9/nyI6H0ZHwJ1jLcz3IatUo7MCuZd6PGkQ0SD2d4kYp4wn4a
 kg+Ztv8sJ7z7UfeZhEkxREaton9GPP02RMjVkOFepZUfpg9LAMGwdTi92
 6BkjVs7Ae7OFx8Uj18ap+VlarmNnBjU52gVSbIk3ehUeTIMztyg84I56q A==;
X-CSE-ConnectionGUID: lJs+HPcOSlq/bdroLfSUIw==
X-CSE-MsgGUID: FvMOoXbiTXKjzWtrwoN2iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52026091"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="52026091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 11:26:56 -0700
X-CSE-ConnectionGUID: GnbRTOq6QeiG1TYyJr1o1g==
X-CSE-MsgGUID: ugbhsvBjRiChmFoOzd7LIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="149160024"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 11:26:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 11:26:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 11:26:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 11:26:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFQ6irhjmRV0U3VpJjYJYXr2eTkNYPesKyvf/BzG+k59CQs/4jhuVqJ6pfzsJbgmGm/N4rmw0LJZEl9H4UlotYMNWl2ZnKupcIPgXCyxoCM8LuY0B+ym/NrxIN073h4mYK1UZhvnOZxB4kXKV0mvL/uxpB/RrRZNjr/tCWbasvysJvtiZNFz6TADVszC0gDwvevy2FYog2zMbwoK4/OksT9auN4QvqckfPrny7Fpwqop8ufTlaDegAB36DjhaenUSEEL3hCD8j0ZHZnAXiZrIEJxn4BanBP7f64Y2DKImFV0+iV5/9nXJ/beEocCjJSKxndY9BQXE054hv+UQz+s5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6pNfON7NoL24f7XKT/KCWxRPT5uLIFKJnqrAPXdd/8=;
 b=K7Reb9B0lkIFDCachYwwhlVTsKw4RpCF2z/84RTrhhVHtdktsi6/9b0ME6K8ZstGpAJwo/XLMfoOJnvdhWMAOSwEHEYdoMOZewYsmp8fKCN5I3cryqrlhKi5r8pN40fg75koxlZtGc3y8XiUzWSoeWKHgsrCMATXVrvurGDTdv5mkzu577HxQbgK37tpqT+rtbm85QuNq709TPfYbosp88+4cN8ryLl38+lRHVdxycXMNW/uN7su/S6mvUuTh6gD8bJ98r4r4j2a9u+VYG8HL6fG0ypO31Xzu75jxp1sTrGRKlyFJuAfz+ptePq0b1NhFIaIsRgaxOM4ZAMjENejtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Sun, 15 Jun
 2025 18:26:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 18:26:52 +0000
Date: Sun, 15 Jun 2025 11:26:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <jgg@nvidia.com>
Subject: Re: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
Message-ID: <aE8QakHX22IM4L3x@unerlige-desk.amr.corp.intel.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606175707.1403384-6-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR01CA0018.prod.exchangelabs.com (2603:10b6:a02:80::31)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 523604a7-d123-4037-21b8-08ddac3a3327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHhoeUVUSExDaWczZWdqZ0dXTEhoVFJJSE9YNGVQTEdBejVVTjh0U2svRkY0?=
 =?utf-8?B?TzN6dDFHN25vdXJTM1pjYUVxUXZOVnk4YkZ3L1EzMy9ybFJwSysxUE9QVGRV?=
 =?utf-8?B?dW8rcXVaRGxFK05WaVhSTGFSejErTGtSdWJYZ2lpbUY0TXA3L2NHcnBBYXdq?=
 =?utf-8?B?STMvT2dEZUl1ODNxczJNT2lKK1FzYkFhakJWWWd4cTU5WnhUOG9ZSlBsVVVN?=
 =?utf-8?B?ZW9vTU1DbVU0YjUyTmZXbmtKcFdwVVFubklLQUZYMFkrVER5eTJCSS9jdFdO?=
 =?utf-8?B?UnVHSFVJMlVCSFB2NDdkQmpEY1FyZHhWa3BNNlQ0ZGhxNE5WRG9JU2NqSE5S?=
 =?utf-8?B?VGNLRm9jYVJpK3RhSFUvZDFQV29RTDRhZmE4VzVZTjcvSVlvbWdTcllFbjd1?=
 =?utf-8?B?MnNxZms3S2M4RnNaK09NQkdWSzRqdmNodm1pKzVOdkhJYmY1d0FTMmlqUnpG?=
 =?utf-8?B?di9BdnZhUTlXemdqTU5CM0I3THFmd290R2tOSFh3R2I2ajdwbjBRNW14MTFh?=
 =?utf-8?B?Z1BiRm5jTU80L3p4Y2pDRTdwbFo5S2FrNjNvVmNLcnF1bEpaS013QmxFSlNK?=
 =?utf-8?B?MHFjVnpZMldZdXd1c29qRmxibVFpZlE0cC9ybUhEb0k2d0N1Z3pkR3hrMWc0?=
 =?utf-8?B?QnViblVIaWd6L3hIVlJCT1NGRGJqSkNkT0c1ZmJ4RlY1K2JNRWJ3VVdCQmhP?=
 =?utf-8?B?bkNmbDhNWmx2VmRiS0FURWxBYVhXcWxMby9Cd2Q4UlduT3A0RHhlVkY4L0gw?=
 =?utf-8?B?eGtNbEkzOFRJSlpHY2FYeFlGNXl2TEtsOC9CMXQ5aTBxMFkrc0RKZlpDREg3?=
 =?utf-8?B?ZXU3K1ZOUXZ4cmVoaGs1cHFPSnBEbHpqWFh5Qmk1dlYyclpGVG9MYTFOWGM0?=
 =?utf-8?B?QjAvakdUS1ZYRXlSd3VhakNNOHJXU2w3Y2F5MVQrT1FkazdjRUpmL3hZcXhM?=
 =?utf-8?B?Q0ZIbk9YcjBhN2JSNUxDS2ZtYVEramE3dE5WSTRObzF3Vjd3Qm9wN3RHaDd4?=
 =?utf-8?B?UVFIMHBKU3U1WWRHWExoa2QvY0UyQU9ZNkkvQzF2WWtXMzY1U0hlV2NQSDZH?=
 =?utf-8?B?cFJTNm5xdk8zMzQyeFBhMUQ0WkZ4TGpUY29hQlg2U1A4UEdDVkUwbXZBZGxQ?=
 =?utf-8?B?R0kyRUhlZUhhZVMxdkNZVmxURXkzUm9lNmsrL0VReVQ1ekNMVkEvQmtiRFo4?=
 =?utf-8?B?TkF0ZkJNcitjcStFbUVNWmVzS0YyZ0hUTytrNnJiRHZnMmY0K1BlOGxRc1lO?=
 =?utf-8?B?VHlIamlJNDFHN3N3YWJCZVlSU3A4VUFyWGVySkpuOTFlOVIzWTBmZEtzYTBY?=
 =?utf-8?B?cHNVNnB3U09NZURIRldRamowcGNuMU5STDdKZHlvdFV1SkFJa0hTck10eS9G?=
 =?utf-8?B?bzl5KzdOM3hET0JqcXMwNDN1VTVwSjFPZ0FMNXM0c1ZaQ0Mvc1Y0NHVXTjVU?=
 =?utf-8?B?Mk04TnRJQXZaRXNhMFFZOVM3ZGE1K3Z3TkVkUHpFVGR6Rmh4TTFRcm13Skov?=
 =?utf-8?B?UzFwdndwOFZMcWtCLytQa2JDZUE4dEhpM3lkSE5oY1doZmFxbXN3cXNaTUtM?=
 =?utf-8?B?b25hcjExaENwQis2KytOL0wzaGZlR2QvdXNWbHpKUzRQOHZXdzVsRmJQMHlv?=
 =?utf-8?B?TzRUenFNSWNBQXQxRGFKdmZKTU56Wis2UVlGbXlmT3dqNzBITmxsQnRQWFg3?=
 =?utf-8?B?a0VkeUNrbS9zNHRzRmUrcTJlMjBjNEN5NHpkV01ha25UTWlCMFBZQ21hRFZJ?=
 =?utf-8?B?WDhtajUxdFo1K2g4QnA1QWt1SE9YOGxvK3BLUTZqNkVub1Nka1FtQXpadTBm?=
 =?utf-8?B?MDhGVFFPVitBa1cwWkJzOGFhNk1nUWdYSWdQYWlDdTYyaEpac1BIbURlNU53?=
 =?utf-8?B?TDVmMHpzdCticU1udTdQUnJJdmFFN0o5bnBNWHR1WWx2WG55T0hzZnBVRkUw?=
 =?utf-8?Q?Lx6lmkaoDmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RiYW1SZzhuUWgrZ29QRXdBUDIrSmhrYm9KSnNYMVErMnFRWTI4b0haVnBE?=
 =?utf-8?B?SmdDUHJzd1JTdlAwcDk0ZFJQVkxRc1RHc2xlSFVpK2o4ZC8xSHdVRFZKVHli?=
 =?utf-8?B?NTQ0TENSajdjbXpKY3NuckpiNTdBem5oQ0J3M2RmWk1GY0FZWEEyTDg3TUNj?=
 =?utf-8?B?UkYyQ0tMdThTS2duRWRNOU1TckFNNFVENWd4SnVKSksyV3kyY3l0QTIwbWZq?=
 =?utf-8?B?bVZqQ0RvMjRkQmxIeEd0M0J2cGNzL1BSOWFWRGlnQlRzYXR5aWR6dXp0NDM1?=
 =?utf-8?B?Lzg2ZFFoUmZtNWVHeFM2b1orL0pNZTJoUjI1em9aSU5rbFdPVEFJTWJybmlL?=
 =?utf-8?B?TTl1d2Q0czRiRUlGN1U3cVhLc0U5YllwaXB3ZExkVEpFS3YwU3E5cElTYnY4?=
 =?utf-8?B?ODhjaEdNYmFub2JyaGYzMWdrQmdLMzUyZWxSOGc4dmFCaHh1WUVuVFpHdjZx?=
 =?utf-8?B?MS9uakc1KzRnZXl1WW0yY1RrOVVJSlB4NHhCSnVFM3B6OGxxZVlqU2RlSmk2?=
 =?utf-8?B?Mks0bmhDcW9nTHRWcVV0R0FRVTRuRTZva1pxOUhrV1E2QW55aGxZdzVUYnU2?=
 =?utf-8?B?L3BWSWEwbGVmVzdwb0h1dU81VlFHc2U1MXVxcmJhRUFDN2g0cVBOQStRa3V3?=
 =?utf-8?B?YzNtNzVNVm1lVm1SQTcwSmVuU3FCdVRBWHk4SHp6b3BIa0hBSlU2Qkk4L29N?=
 =?utf-8?B?SW4xVCtodHd0RWZhYUxxaDBOWGNNWEx1ZE9CTkhiaTBCWndNalpXWTNyajBr?=
 =?utf-8?B?WEdnZG1RcjdIemRpdmFYb0RUbWIreHhEQUsybHdyYWtvQThJQnI2R253RnFV?=
 =?utf-8?B?Vlo1MGI2dHhGUGNKOXJ4NVRXbFo4RWdFR3dUNUpvT3l0ektQaW9OQlBBaHdC?=
 =?utf-8?B?NmNoTk9aUlVVZzlzNVRpMzNOZjdVaUpuRHFSanJEdU5lZEV5SjdZQ1FzN0JY?=
 =?utf-8?B?SUJUdzBJdmZaTjJ6L2x0Sy95YXFTYzZqemp3QjBlNDlPV2hUZllnVDVMMVBw?=
 =?utf-8?B?eUtUY2h6ZkxIMlVkamdpNjRsYkwvTVVsWksvc2VPTVo5NXhoTmdNUlA2MHc3?=
 =?utf-8?B?MW5LWXBpc29nZkVqSHFJNXZQRENCeGZsLzFnVEI2N0FPWFpQRE1kQmo4U3Fa?=
 =?utf-8?B?V0w1MS8zaHR3ZEU5ejVxRGh6a0s5ZkdyNHdCWkY1YWlSWFRGVm96TWVGR0hV?=
 =?utf-8?B?eUdPMlpIbkY4bkU2Sm8vY2o3eG9FdWtQU3NOS3BzR242ZjRzQVNna1ZIOWhW?=
 =?utf-8?B?Sjd4cFBDUFZVaGhCMFpYZHFHU3pWQ3llaG9Fa1RoenBSbVZDaGFnWkRPZjhl?=
 =?utf-8?B?dktNelRpVzJrbXlXMlM2d3NDWlZOc0Nuc1V5c29DajhDYTh3ZjhBRkNEaWZi?=
 =?utf-8?B?SHBTbnIvUElRakpZR0NxZ2lMblV3dlFuN25wRnplRmJqQk9CdzgrdHhMMTBG?=
 =?utf-8?B?dXJyeGFHcFMwVWVITWxidUxqaXhTNGdPcnd3dDhNdUxzTm05SkhTL29JK05l?=
 =?utf-8?B?VHVpT0dTOGFrTGVzR3d5d0QyQjM5dUJmanUxV09iaFBpbW9OQVE0WTBqTDNB?=
 =?utf-8?B?Z2ZzMTFCZWZqNHpkbU10T1VwUWJNZlJvZDVwbjdHbHVhWHZDejlKOVNEbEcz?=
 =?utf-8?B?OFJocHBpWHVYZC9hdGwreWhaSm02OXZLSEVoYXE1Qi9YanV3bUFUUUlNeVZt?=
 =?utf-8?B?NWhJMitnaklRcVU0SitxT2pYbWZVZHRQdFM4N1Y0SDh1WFpJbVhaSUpwN2tm?=
 =?utf-8?B?c1VVV1cyakF1OExScjZGOXZ5L1RvclJPbEgxOTNXTmlLSW0vbTBuS0c4V25q?=
 =?utf-8?B?dGtYRkNmN3hkZmJteGdrRnJHZ01VQlFhcTdEYlRkMzVmSGhlVWJVNlJUZThK?=
 =?utf-8?B?YmJESzBqU2w0OVBiS1FoMzlkREd5emZjY01obnF4My9QR0kvNVlHdUl6UWox?=
 =?utf-8?B?cjJOMytZZXJvZHRBRHJzWEIycnhyd2RyNW5zVDUvZ2VhQTcwZlhzK09Xd1o3?=
 =?utf-8?B?OUkyVGZiNzdzWEFTTlM2ZGhTWXNHaTFWN2t3a3lxbnNoSWE3U1RoMG5MYk5C?=
 =?utf-8?B?bDBVSCtTNXZUWldtV3V3aXlFY1NsQ1F1WXFGV1R5MTN6NklvK1BUaHhIcDJI?=
 =?utf-8?B?L091a3kvdE5CVVB0NWJ6UWxzVmlDdlV1YzBGSHFnM0Z3VGhVamxEOUs4eXRq?=
 =?utf-8?Q?3ZHKU9aWCellgflMQMXkKBY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 523604a7-d123-4037-21b8-08ddac3a3327
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 18:26:52.4103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcU8jn0LEK2HA7xBvwmr2pqLSeePwJ628CvzmKoGt6BGYW4GoeTmH4mpuQPHP/mwWNGxXXwmNUBIEvhorOf59Typ5q/Ok9QJL607piGuMzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
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

Hi Badal,

Just a small query below..

On Fri, Jun 06, 2025 at 11:27:02PM +0530, Badal Nilawar wrote:
>Load late binding firmware
>
>v2:
> - s/EAGAIN/EBUSY/
> - Flush worker in suspend and driver unload (Daniele)
>
>Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>---
> drivers/gpu/drm/xe/xe_late_bind_fw.c       | 121 ++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
> drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
> 3 files changed, 126 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>index 0231f3dcfc18..7fe304c54374 100644
>--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>@@ -16,6 +16,16 @@
> #include "xe_late_bind_fw.h"
> #include "xe_pcode.h"
> #include "xe_pcode_api.h"
>+#include "xe_pm.h"
>+
>+/*
>+ * The component should load quite quickly in most cases, but it could take
>+ * a bit. Using a very big timeout just to cover the worst case scenario
>+ */
>+#define LB_INIT_TIMEOUT_MS 20000
>+
>+#define LB_FW_LOAD_RETRY_MAXCOUNT 40
>+#define LB_FW_LOAD_RETRY_PAUSE_MS 50
>
> static const char * const fw_type_to_name[] = {
> 		[CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
>@@ -39,6 +49,95 @@ static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> 		return 0;
> }
>
>+static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
>+{
>+	struct xe_device *xe = late_bind_to_xe(late_bind);
>+	struct xe_late_bind_fw *lbfw;
>+
>+	lbfw = &late_bind->late_bind_fw;
>+	if (lbfw->valid && late_bind->wq) {
>+		drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>+			fw_type_to_name[lbfw->type]);
>+			flush_work(&lbfw->work);
>+	}
>+}
>+
>+static void late_bind_work(struct work_struct *work)

Why is this a worker? Do we let the kmd probe go ahead while this worker 
is trying to do a push_config? Wondering why this logic is not directly 
called from the bind here.

Thanks,
Umesh

>+{
>+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
>+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
>+						      late_bind_fw);
>+	struct xe_device *xe = late_bind_to_xe(late_bind);
>+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
>+	int ret;
>+	int slept;
>+
>+	if (!late_bind->component_added)
>+		return;
>+
>+	if (!lbfw->valid)
>+		return;
>+
>+	/* we can queue this before the component is bound */
>+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>+		if (late_bind->component.ops)
>+			break;
>+		msleep(100);
>+	}
>+
>+	xe_pm_runtime_get(xe);
>+	mutex_lock(&late_bind->mutex);
>+
>+	if (!late_bind->component.ops) {
>+		drm_err(&xe->drm, "Late bind component not bound\n");
>+		goto out;
>+	}
>+
>+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_type_to_name[lbfw->type]);
>+
>+	do {
>+		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
>+							    lbfw->type, lbfw->flags,
>+							    lbfw->payload, lbfw->payload_size);
>+		if (!ret)
>+			break;
>+		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
>+	} while (--retry && ret == -EBUSY);
>+
>+	if (ret)
>+		drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
>+			fw_type_to_name[lbfw->type], ret);
>+	else
>+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
>+			fw_type_to_name[lbfw->type]);
>+out:
>+	mutex_unlock(&late_bind->mutex);
>+	xe_pm_runtime_put(xe);
>+}
>+
>+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>+{
>+	struct xe_device *xe = late_bind_to_xe(late_bind);
>+	struct xe_late_bind_fw *lbfw;
>+
>+	if (!late_bind->component_added)
>+		return -EINVAL;
>+
>+	lbfw = &late_bind->late_bind_fw;
>+	if (lbfw->valid) {
>+		drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
>+			fw_type_to_name[lbfw->type]);
>+			queue_work(late_bind->wq, &lbfw->work);
>+	}
>+
>+	return 0;
>+}
>+
>+/**
>+ * late_bind_fw_init() - initialize late bind firmware
>+ *
>+ * Return: 0 if the initialization was successful, a negative errno otherwise.
>+ */
> static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
> {
> 	struct xe_device *xe = late_bind_to_xe(late_bind);
>@@ -87,6 +186,7 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>
> 	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
> 	release_firmware(fw);
>+	INIT_WORK(&lb_fw->work, late_bind_work);
> 	lb_fw->valid = true;
>
> 	return 0;
>@@ -99,7 +199,17 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>  */
> int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> {
>-	return late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
>+	int ret;
>+
>+	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
>+	if (!late_bind->wq)
>+		return -ENOMEM;
>+
>+	ret = late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
>+	if (ret)
>+		return ret;
>+
>+	return xe_late_bind_fw_load(late_bind);
> }
>
> static int xe_late_bind_component_bind(struct device *xe_kdev,
>@@ -122,6 +232,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
> 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> 	struct xe_late_bind *late_bind = &xe->late_bind;
>
>+	xe_late_bind_wait_for_worker_completion(late_bind);
>+
> 	mutex_lock(&late_bind->mutex);
> 	late_bind->component.ops = NULL;
> 	mutex_unlock(&late_bind->mutex);
>@@ -140,9 +252,16 @@ static void xe_late_bind_remove(void *arg)
> 	if (!late_bind->component_added)
> 		return;
>
>+	xe_late_bind_wait_for_worker_completion(late_bind);
>+
> 	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> 	late_bind->component_added = false;
>+	if (late_bind->wq) {
>+		destroy_workqueue(late_bind->wq);
>+		late_bind->wq = NULL;
>+	}
> 	mutex_destroy(&late_bind->mutex);
>+
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>index a8b47523b203..166957e84c2f 100644
>--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>@@ -12,5 +12,6 @@ struct xe_late_bind;
>
> int xe_late_bind_init(struct xe_late_bind *late_bind);
> int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>index c427e141c685..690680e8ff22 100644
>--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>@@ -9,6 +9,7 @@
> #include <linux/iosys-map.h>
> #include <linux/mutex.h>
> #include <linux/types.h>
>+#include <linux/workqueue.h>
>
> #define MAX_PAYLOAD_SIZE (1024 * 4)
>
>@@ -43,6 +44,8 @@ struct xe_late_bind_fw {
> 	u8  payload[MAX_PAYLOAD_SIZE];
> 	/** @late_bind_fw.payload_size: late binding blob payload_size */
> 	size_t payload_size;
>+	/** @late_bind_fw.work: worker to upload latebind blob */
>+	struct work_struct work;
> };
>
> /**
>@@ -71,6 +74,8 @@ struct xe_late_bind {
> 	struct mutex mutex;
> 	/** @late_bind.late_bind_fw: late binding firmware */
> 	struct xe_late_bind_fw late_bind_fw;
>+	/** @late_bind.wq: workqueue to submit request to download late bind blob */
>+	struct workqueue_struct *wq;
> };
>
> #endif
>-- 
>2.34.1
>
