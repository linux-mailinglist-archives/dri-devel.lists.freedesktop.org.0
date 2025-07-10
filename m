Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D3B005FA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752210E8ED;
	Thu, 10 Jul 2025 15:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QquIh5Od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C719810E8ED;
 Thu, 10 Jul 2025 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160131; x=1783696131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HpeZNnt7bcWtrfdCxjHj+Wxr8KrNWUfvK6196BdYCMI=;
 b=QquIh5OdcbJK1x8nhfKFHPlVw/MAdnN3+Zktblg7ZXMpUueCPROC1KMm
 5XcBsCQGFTjVY1/+CMV/XfUC/1Fn6MiV1MNouPMGS1bIHiYhLe2pJOPAO
 yqAlLbqyYN/GS1DWIVTcUrvRv2G2vZSFmx7EDagQpRlkYnnRAfX/lqdjA
 MxWmDPYcRZktJh5hpamY/JtsdAIwTzz1WDr1cfi/06yROxQWHWy37mj3h
 f61MkBQ39QuXVJghvtYe756RIAggmDqH5CL5fI21SGx5DsV6nBdL0W804
 NZgDO51IsYB/mmdzJc6m7fznqnA0H3h7aqN3ekdNRfthn+XHh92T7q0J4 g==;
X-CSE-ConnectionGUID: YAUuv+IeTd+rfl7sf0GRIg==
X-CSE-MsgGUID: VrMSyehVRzae8e/Vqp4yhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54296536"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54296536"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:08:50 -0700
X-CSE-ConnectionGUID: KCPkZFHrRDKW7aJv931eeA==
X-CSE-MsgGUID: n+xdLNy3SgC8jCmKU526bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156600158"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:08:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:08:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOzLN0b5Dwxickvg6r/4x2FcPeiIxcTkD+kI7Da9eDohKBnjaTW+CENYdvK8MPb03Bj36ca9CkXSn6R/ahGi5beHv7UPTzx6gAHTREfTX7utq3OwTN/DhyTn0fCb98wNqrdppqcs91bzT8OA2x3uIUkgvgAWmTU9EMJwkQL2T7exVOmEnkMl0cgQoQYBNDFZZKIXiLtrsN4/L0JhkqgEZaATgF/jLxCn5GV8bkAerCvDV/OdqcnMIcSVgv0iNvgMnsulxBS4VYu9U5CdM+1tJfcXOQe7xbbrXLzAfzt4ajYOzq4RtH9SMl7RirIQ12/TLLapG4UspuX8BykgjtG6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SI52kwXr3r4BFaopH+1Jh7/1AaStJCy9Tb0swbKKxk=;
 b=F2Ecvla1mRLZ1BUoV3BvnICALBElBhreUbvnS6/S2mk19vU3pNWZEx84BDK+fYrFZDMoQu6OLfEDX+KB8UyxzVJgaGx+1qYN4i6+mUdq5+1CAi8O03kiljsbGGufQgCRsF4UHdV8NYFxuH7G7FAeIWK2AfDDAVa4TY5jmRXgFmGWD0GVtrIvvn/Ottvw01tCQ3373lbLFvtDR1Cj+JxFLXEQ+UwbREfHyOGQEtEKuCbziKMpW2rdIHw6NBMVfBmVodyIghN002OPMW8udHXCQohgf4dYn59ukUBY9uhRF/GWksQx2pCFdAfz6Adw3fBIkqgVKr03/U/nj1Mgcc2neg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 15:08:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:08:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/9] drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
Date: Thu, 10 Jul 2025 11:08:34 -0400
Message-ID: <20250710150831.3018674-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: b793520b-7f50-44e4-efd3-08ddbfc3ab0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFdHZHFXdHQzaXB2Snc1cnRaaUlrQWxNK3p1djBOMmxTSlR5L2w2UTlKNGYr?=
 =?utf-8?B?UkdFMnFSSnZuRFRyRVJnajlGUjVCczFRQUdYYzNpRjZSeDg1eWlRMXdteVZC?=
 =?utf-8?B?QUF0TEJPWWZKR2FnUEhwd0orNGpSK29aTVE0aEFXNFVCaXQ5R3FiMFpmcDJN?=
 =?utf-8?B?dDYwRXJVL0J4RHhOTU82TkNiWWhCRVd3NTNxcllDdVpBNnBsR3ZkdnkrdUNM?=
 =?utf-8?B?OVlFeXZhcTNlTkdUMUg5cWFLTG41VmJTMVV4NzhaUGdNOUJZOEtMTjhpS3dx?=
 =?utf-8?B?V0VGeEdSN0hwaVdHY0FNYmpmUDFTNnMzOTU3Zm1yYS92bGliSC9uNDhLYlN1?=
 =?utf-8?B?bWRWR0N5Q1M0d0JWVXFMUzhIK0M4VDZHdzV1L3p0aFMvenV6djMvVHJXYjJZ?=
 =?utf-8?B?bXFRaEhFbHlMdFcwU3VFN0NFSGN1TWdveE5Nbnh1THVteG9JV0hoUGJFbkpG?=
 =?utf-8?B?VzhGSDlXWVQzTE13L1ZRL0ppWlNpWEJ4SzdwSkx0SityOFY0aVZZMUFVZ1Yx?=
 =?utf-8?B?SUtreVBPMytVanBiTEY5STJWY1JMallUQm54UWpxWDFlTS9ZMGxreUlrcG43?=
 =?utf-8?B?N2ZPSTIwcTE0SHM1bjBXNlYrTjFGcEV6OU5jd1lSVkNlNlRHWm50dlVVc1Ez?=
 =?utf-8?B?MUdoTy9GR3Z6bFFkZE1RRWxoMGVCb3V2L2lIVzBKdEJaRzFhU1NZL2NGdXFI?=
 =?utf-8?B?STRaLytWUWkyWGdGVzk4WjNvczlPdXZUYVlDeElhMkhMQVBRdjZHL3JhVlpF?=
 =?utf-8?B?bnJLMUh6TWhWL0JrUHV2eURpSjhDblpPc05ZZi9MUTl0Z2JaZWVvRUJ2QnVL?=
 =?utf-8?B?cjI2eit6ZEFSTXdOTEEzMk5JSzN4S1JnMjA2WDBNZHA2dWUxVnNzenhmUmZW?=
 =?utf-8?B?NDFjYjhxdU5Lcm1LQkNVTkMwWEYrMEMwSHlXY2l2di9RQmQ2dlFCeDJhamNK?=
 =?utf-8?B?RC9hSnBraGFVckIyNDh6eTQrVHc0bW9Ob0lIcTBPeGFFK0xmZThyem9tYk1J?=
 =?utf-8?B?WnNLRVN3eTV3cVpVTXNua3ZTZWpPQ2FjRzMvK1QybjBRVzIwVE0rWm9nTHhQ?=
 =?utf-8?B?cVBzM3Q2U3d0Wk9QaUhJZ2h5YlhaSVprTFkvQ2ZWcVhGWFRQU3YvT0lZZ0lY?=
 =?utf-8?B?aUcrSHEyaVczM3c1MlJOcGh6bGhuM3hLN3JGajAyWnJtMG1PLy82L0ZUUmdS?=
 =?utf-8?B?RHRNQkRxTXpZS0Y4eWcra2JOdFJ5MXlHc21TTXlJTTRyNUZqbGdPMnZKcGZ5?=
 =?utf-8?B?TFJ4UFp5ZWszL0xaMnBNOThpcGgreVkxb2h6eW1wRWFXa1hpTlpheFJTOUFW?=
 =?utf-8?B?T1pCSUNmNGdLbk15cXczVVZNVWI1aW44bnJsdCtpRHNjWHVndmQzQXVIcTRB?=
 =?utf-8?B?ZE1mTHJqOSsxQ1oxa2h6VFdHVVdPNDU5RzFNS1Fjc2Y2RmwxVHB3eitqaE0x?=
 =?utf-8?B?Y0JrNWpIWTdWaUNDbHFnVFpPNFcwZnZsazhtckZvcHZWeU5qZ1hEaDErWG9H?=
 =?utf-8?B?OERhZDFXUjB4a3lTOUQrUExWTzY2TTlsOE1YUzlpVUhNQVZHY2F5bmRLOS9Z?=
 =?utf-8?B?bG0ra0VWRTdLdUhSdE81NmhvMkhWZ3kwWk5RRFJoUUV0K0U2aC9mem9vNXZq?=
 =?utf-8?B?LzRMUXI1MjNWVFl3dzdQM21lckU4dHF6S1lkWkNJQnluMnVvb21kMW80S0RD?=
 =?utf-8?B?UzEvOGJIcE5IdTdJaGo1OHBScEFSQm1DdTZ0MkozTWtEWHFUVFBVbHR1Z0No?=
 =?utf-8?B?citJOE10NlJxUHFXTnR4OXUyL3F4eDJaeU40Q3FhN2FJMk1zZHV5T2U4c1pu?=
 =?utf-8?B?ZzhOcmZ2OUFyQVVwa1FrRFlGbzZYSWx3Uzh2SWVOVEtvU0c5YS9xR0k2Y0Jw?=
 =?utf-8?B?VkFkY3BlNTdsWVVheWhEeThOdUNPUEJqaDNlOEk0QW9lYTVTTTF0S2U3NVl5?=
 =?utf-8?Q?29yTEBLxSww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGt0U0ZubHpxWWN1S3UxYjNOd0RubVBTMGRVQUR0NTZyWnpCQnlmTG1sOW1q?=
 =?utf-8?B?VDlYK2JNS0d4RHd1MUNXUVpiNmdjQVdBY2wyMFRZN3ZXdW95OGF6WVlqd0JO?=
 =?utf-8?B?STBvZFdQQ1ljc0J6MElWKzBpdzc1OGYwTmk1QllXVmF1YXloOUtlZ24rWVBG?=
 =?utf-8?B?OE9HYk9leTZEY1RKUkttV1NLM3J0YWFrZjZ4SmpIWjVkVGQ2ZlRLR0xraDRF?=
 =?utf-8?B?RTFvQ3JIUGtKR1hwZW90NmR2TXRTMkZQQXpRb1FWSnF0MVVWS3V6UU1QdmlZ?=
 =?utf-8?B?YS9Qcldiemk5ZTJ0S1Q2TjNUdnVvUndPZ1loeVJPZWFKS2FzSE92dFRFcTlR?=
 =?utf-8?B?UmQwdWRzN2FYZHgySnhEaS9XQ1RMNWZiK1haVmVqUUUrb3V4bGRoczUyOTRE?=
 =?utf-8?B?NmcrWlNJeHRvSFNMOTRCZUNmVFh2ZUZpY0s0U3QzT3FmSC9XVlB2NHVnVTk3?=
 =?utf-8?B?UXQya1MrOGdYUHdBZE42a3AwdGI1M2poUnlpK3U5OFRMczN4a2xWaXcwUlEx?=
 =?utf-8?B?ZWZSS041UUxXandWQmZacytmNmVvWlFHMDBHRjF1NXNoc1BZVUpSOHBvWnh0?=
 =?utf-8?B?Yk0vdE4wK045YTRobTVCQk9FRUVTdkZPY3h0akREVTN6bER6Nk1aMHFTbW1y?=
 =?utf-8?B?eTJITEdXYzZoTXhEMmV3UDlMbmM1dWFMWGxlcVdYN1FYVkJ1V1U4VVUwSVBK?=
 =?utf-8?B?V3ZEbUkzTHVWN2wzSG9nUTIwZnBPSVJlV2VFWU5mTDFaRXZqMTVCcU53SHl2?=
 =?utf-8?B?NTJROGo3Qk8xOHFCTHNLNEpmNmJTa2laY0NyYnRHRGxSZU85K2Y2RnhvMk1Q?=
 =?utf-8?B?RjArYnlIWUd4bzV1bjdLbE83RklwaTBYRGZaYi9FV2xtZFBkT1NEbjY0Q2Zo?=
 =?utf-8?B?YnUzYUwxa0dvZnphaG0zSUliYjAzckRUbzJNSGdETlZhelZuWWZoemUzYjZk?=
 =?utf-8?B?WjRBK0tGaW1sVzVrb1dONjJ6LzVmbTcxeFo2bGoydDBiV1dNbzN2SE95TUs2?=
 =?utf-8?B?cU9ZNFU4Vk9KVE9oVjE0UEwzaVFGRTZXWmJPbFhtWnpEQ2tOcHFMaVBJWXR5?=
 =?utf-8?B?LzB5ek51RWpBcC9jNlVUZWdDejE0N2VsY0w1Nnhkb3Eyd1JSNkRSQndORWZV?=
 =?utf-8?B?VjJHR1l0b3l1YUhNQmtWRjVzQkNaNVlXNFljcldxMitsd3Q3QTZrdlhrUXR1?=
 =?utf-8?B?ajZ1MS9TOUQ5TDFrUFQ0ZXp2U3h5V1lnZ2RvaHRvYldOVjE2Qk5lTFdzVnJ1?=
 =?utf-8?B?WGxHM2VXZzBXTjRkSlhsWC9VVXdYTUpaajVtNjQwTithaFlxTUxHNlJvSzdV?=
 =?utf-8?B?bk12VXZzOS9OTlRKS2FWRS9Id0NKUWFkTEtIUjcyQVIycGRxMXlPUVh5YVNB?=
 =?utf-8?B?TzVoQXIwUmNISlhxczRUeFJoUTNKVkx3dHl0REhISXhhUHVIUnpxWDVXQVlV?=
 =?utf-8?B?R1NsOUdDN2FGOWxmaS9UVVpNQW91Zkh5MGhMaWJkVlNxajYyS2wrMkVUMmFu?=
 =?utf-8?B?ZGpqdWg2aXRNcU5GeHpIc0p5NWpBeVZEZ1RaYzRRQkJ1aUZOZUR6cjhydVhB?=
 =?utf-8?B?NWZVaExudXJaWFdXVHpqTVR6YVIyNzg3VDYxUk1XcmRESDRyNnlKN2NSSTdj?=
 =?utf-8?B?MERPV2Z3Y3ZHeXl6cHpwT2lmU3BmemZXYjliREJaK1hIeVVORjlVNjZoc0FD?=
 =?utf-8?B?WGdYTWpSU3h1dGl0Zi8yYlJqaEFkUG1jUVhIbmJYVXc4VHRSci9XSmdYU3Ex?=
 =?utf-8?B?My9iR3g0QjlabEluQi9DU3BrRjlNaSs3bWgrSi9VRGdEekNLNlVhUHdPZEdS?=
 =?utf-8?B?Um1RbzRmMy90cVJ2RG45Rlp0dGNjN3Vib1JqQU9HcXVsYlBmc2g3TVdIWjVt?=
 =?utf-8?B?SE9IL2Q1K0Rrc2gydkpyYVY2ZmZwMjI5VWV6dEJxdTJkWEhmcE1IVEFROG13?=
 =?utf-8?B?cTM3eWx0S3NzeUNuaDIvbVZuTFRhaUlnOGQxK1NXV0pxclB3dW5UcTZGSzZV?=
 =?utf-8?B?c1VQUVBOSkFoa3cyMUdpYXl1Sjk3cFlhekJBZDNOZ3V5L1RYaFptL0RDN09x?=
 =?utf-8?B?L2pGMFBmWGJneEhtZ3lxOWdzWGRscWxLUTVRYmdmcVhwbHZtYW9rYkdvUW5z?=
 =?utf-8?B?Z3kxNzR3U3MycTgvaUhMK0VnRi9YdCt2Y3ZCOWVDRmtzRFc5SzZPRW9aVjBQ?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b793520b-7f50-44e4-efd3-08ddbfc3ab0e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:08:46.7822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1Rt2f7/KFpvfCV9ujplNRa1OyrhiCMD+Mh3YBE149+iAx8GAxPXjgBwDEXU2RiSA3S0ozWAKN6+mUrORioIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
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

From: Badal Nilawar <badal.nilawar@intel.com>

Introducing xe_late_bind_fw to enable firmware loading for the devices,
such as the fan controller, during the driver probe. Typically,
firmware for such devices are part of IFWI flash image but can be
replaced at probe after OEM tuning.
This patch binds mei late binding component to enable firmware loading.

v2:
 - Add devm_add_action_or_reset to remove the component (Daniele)
 - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
v3:
 - Fail driver probe if late bind initialization fails,
   add has_late_bind flag (Daniele)
v4:
 - %S/I915_COMPONENT_LATE_BIND/INTEL_COMPONENT_LATE_BIND/
v6:
 - rebased

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/xe_device.c             |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h       |  6 ++
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 84 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 33 +++++++++
 drivers/gpu/drm/xe/xe_pci.c                |  2 +
 drivers/gpu/drm/xe/xe_pci_types.h          |  1 +
 8 files changed, 147 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1d97e5b63f4e..97e2b1368a6e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -76,6 +76,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_lrc.o \
+	xe_late_bind_fw.o \
 	xe_migrate.o \
 	xe_mmio.o \
 	xe_mocs.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..cb595bae5f55 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -44,6 +44,7 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_nvm.h"
@@ -866,6 +867,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_late_bind_init(&xe->late_bind);
+	if (err && err != -ENODEV)
+		return err;
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 78c4acafd268..a8891833f980 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -16,6 +16,7 @@
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
+#include "xe_late_bind_fw_types.h"
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
@@ -325,6 +326,8 @@ struct xe_device {
 		u8 has_heci_cscfi:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @info.has_late_bind: Device has firmware late binding support */
+		u8 has_late_bind:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @info.has_mbx_power_limits: Device has support to manage power limits using
@@ -557,6 +560,9 @@ struct xe_device {
 	/** @nvm: discrete graphics non-volatile memory */
 	struct intel_dg_nvm_dev *nvm;
 
+	/** @late_bind: xe mei late bind interface */
+	struct xe_late_bind late_bind;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
new file mode 100644
index 000000000000..152f3e58de94
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/component.h>
+#include <linux/delay.h>
+
+#include <drm/drm_managed.h>
+#include <drm/intel/i915_component.h>
+#include <drm/intel/intel_lb_mei_interface.h>
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_late_bind_fw.h"
+
+static struct xe_device *
+late_bind_to_xe(struct xe_late_bind *late_bind)
+{
+	return container_of(late_bind, struct xe_device, late_bind);
+}
+
+static int xe_late_bind_component_bind(struct device *xe_kdev,
+				       struct device *mei_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_late_bind *late_bind = &xe->late_bind;
+
+	late_bind->component.ops = data;
+	late_bind->component.mei_dev = mei_kdev;
+
+	return 0;
+}
+
+static void xe_late_bind_component_unbind(struct device *xe_kdev,
+					  struct device *mei_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_late_bind *late_bind = &xe->late_bind;
+
+	late_bind->component.ops = NULL;
+}
+
+static const struct component_ops xe_late_bind_component_ops = {
+	.bind   = xe_late_bind_component_bind,
+	.unbind = xe_late_bind_component_unbind,
+};
+
+static void xe_late_bind_remove(void *arg)
+{
+	struct xe_late_bind *late_bind = arg;
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+
+	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+}
+
+/**
+ * xe_late_bind_init() - add xe mei late binding component
+ * @late_bind: pointer to late bind structure.
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
+int xe_late_bind_init(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int err;
+
+	if (!xe->info.has_late_bind)
+		return 0;
+
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
+		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
+		return -ENODEV;
+	}
+
+	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
+				  INTEL_COMPONENT_LB);
+	if (err < 0) {
+		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+}
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
new file mode 100644
index 000000000000..4c73571c3e62
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_LATE_BIND_FW_H_
+#define _XE_LATE_BIND_FW_H_
+
+#include <linux/types.h>
+
+struct xe_late_bind;
+
+int xe_late_bind_init(struct xe_late_bind *late_bind);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
new file mode 100644
index 000000000000..f79e5aefed94
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_LATE_BIND_TYPES_H_
+#define _XE_LATE_BIND_TYPES_H_
+
+#include <linux/iosys-map.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/**
+ * struct xe_late_bind_component - Late Binding services component
+ * @mei_dev: device that provide Late Binding service.
+ * @ops: Ops implemented by Late Binding driver, used by Xe driver.
+ *
+ * Communication between Xe and MEI drivers for Late Binding services
+ */
+struct xe_late_bind_component {
+	struct device *mei_dev;
+	const struct late_bind_component_ops *ops;
+};
+
+/**
+ * struct xe_late_bind
+ */
+struct xe_late_bind {
+	/** @component: struct for communication with mei component */
+	struct xe_late_bind_component component;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ffd6ad569b7c..69b8ead9ca59 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -332,6 +332,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.max_gt_per_tile = 2,
+	.has_late_bind = true,
 	.needs_scratch = true,
 };
 
@@ -578,6 +579,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
+	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 4de6f69ed975..51a607d323fb 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -39,6 +39,7 @@ struct xe_device_desc {
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
+	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_pxp:1;
-- 
2.49.0

