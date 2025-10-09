Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE1BC896F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 12:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF97B10E214;
	Thu,  9 Oct 2025 10:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlZtEigW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F22010E20E;
 Thu,  9 Oct 2025 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760007090; x=1791543090;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Yh68UrqEtmHpBmjtUixsfYP/flpfGe4xTG1qzLG3JKY=;
 b=IlZtEigWhw2SYpSC3WONybwMPRk0gAhXB2LwerPklWMCCTSpDGBUneSl
 D0dhb1gebimyxGKOzzVSJ6QZ9Bv6wePBAu4l7tEKc3j+IqyyavdLGHENO
 yk5newkorVrVntBHLLD1jSXdoA27z4FKaZhSQMXIXuqMTjltPomZPK33g
 e5q9vDf6EurAFxuoIWx4VtuuMgCTt1acT0zaUFUxCEt4IhGQyN5WbG843
 0YIIidmZ921P9CnB23CBYotT4UWkYuFwZrD6eXuScNz67BVMDNp8Srrur
 x+p4CnAZJhfbObyPbQdbmCvtlTSC8zu+vtaTaD1DIJjt0dYsVFJ5odPHO Q==;
X-CSE-ConnectionGUID: 16WYhZpmQdiTS7JzCUlEIg==
X-CSE-MsgGUID: dFTA4wW6Ryq8xqJ1RF650A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73558727"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="73558727"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:51:30 -0700
X-CSE-ConnectionGUID: S63cbywdSMyEFUcD9ENMmQ==
X-CSE-MsgGUID: OoW0Z9QkTI2C1dujZBcrUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="181450985"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 03:51:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:51:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 03:51:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 03:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETn0gGNBDBOJsHmL9uISxXkbxZAcXU72bM3ALryfjQzgBzzovuvH0ltgwYxrYlXcbOxYPUEY3K6gfvx7q/Xrx2lZYYB0mWIVcLONKNMv2juO/+x4t0f3o0QwFgm/cm5vEmdhRr37+Xg3iasJZUc0PWlTZk6eiP8orkhY5rhYKafTxjFQq1d9AS7HXTT/ZKqs3YW2S/BtW5oZW64xz29G54CeWT1JDvaQDLjH/94IJDmJMR7Q10JYWlvf3sg63vII3CNsD+mqUE3/d3cI47NW1dBUwsmT43lUuczI+G+qv7VXypP6g9uH+eXTLR9w87+ZFTHUDquUzVk7tu0d+2W3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzUQzLQhJfmHZU3XOGBnxR9KJk8dMjfBAHNQ5a1Ar8A=;
 b=CVE9PIG/CkKJ/ilTmVUI9Un8O1E1HTnPYWl8zU5vgpQi6gja1XPWZ9C8yA21tGPrHhe+D2tcrY8kKvY0YkpApL8Fb2F7+NA2AaV4JLpAr3gMpN5u0AGanRkc1HXNu3Ldt6yNIvVfPbVns138QZit+AJZSNsgsIR1ShlrJc3b5/rVPweZr5znboCPy7lvFdQSiFTd0N/Z9q4zd4KUGKPsi1XLR9NRRM56lIJhIXDqpLmuEqohvgC40AJOezJ7GS+m2B4OILRhhUt2zCY6yg+VKHwbPkW1px55Y5Wjo573kbWaIxtXuYZX8hA07eAZ1sas+iTujT966YDeF5kdpJ+Nww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL3PR11MB6316.namprd11.prod.outlook.com (2603:10b6:208:3b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 10:51:27 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 10:51:26 +0000
Message-ID: <525d42c8-2811-4168-bef6-b0704b99433c@intel.com>
Date: Thu, 9 Oct 2025 16:21:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/i915/display: Add CASF strength and winsize
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
 <20251001063500.1259687-4-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20251001063500.1259687-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BL3PR11MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 0715c573-c440-4cf8-40b8-08de0721cb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjlqQ3A3dmV0ZmNSVndkUUdkQXB6YTdaTVd3K1hXZXNOaVdWNWkxZ3daajQr?=
 =?utf-8?B?dzFHWWxMaGVxREpQRE1IOVUzeHQwM0t1L3QvVGpSaTNjSDdYcWlsM2t4TFZz?=
 =?utf-8?B?K2I2VmZXeXZsZzZCenNhSGlETktmMjJjanlrWHlsMThoNkdSYWxROUcyT3VC?=
 =?utf-8?B?OTN4eGRTQ1l3TVIvZjNtMlVJNTR3a0RINjQxT3lzZko3NU84WGRtd2JxUERE?=
 =?utf-8?B?UjhoSlpKL2VhT3MwcnE1eE5FNGFPYkNjeGJ6UGU0Q09sMzNqdnpRNldpTEo3?=
 =?utf-8?B?cXZSSHZzeEE4b2NseGhia3JBZmtvbXNNU3drWDRXUWhCN0czQmRqU1U3MDJx?=
 =?utf-8?B?bnJkRE9zZFgvQjlJQ3FFYStjMXViUTZENGR6MjZ6bFJVa0RINWtrZThKRHZL?=
 =?utf-8?B?dS9CSmxhK2dkN1VCVW92MFhpMi9scjlIMGZUUERaU1JOY2hSajZRbFJkT2po?=
 =?utf-8?B?WnlsT3JFaUFXQmZZQ0F5aU1zd0dQc3BBR0VnT283dmJWVmNJUlVTUTdGTlFY?=
 =?utf-8?B?a3BMZnYvOCsrdzZpbEdvMUdvY002N1YrY2tST1FncDZyV0VySXVPS2RkZkxQ?=
 =?utf-8?B?WnJWS0FwM3JaSXVTK2tXczJsSDdtUS9GU0RmTVE5T3BhdUVIK2N2Q1ZyWFBG?=
 =?utf-8?B?N2ZTYWpseHJsM3NacUprNnI5YkpSYTJLK3p5YVpXN3YreTZMeEl4eEU4bGNs?=
 =?utf-8?B?WTFhaElqT0xVZllYNjMzU2NyTjVpUktJK21JQm5PT0I4eHZ4cU5EQ2gwZmxZ?=
 =?utf-8?B?QndPKzlTYjNRVitkM2taQVNUSUx3dWVvbE5Ed01malhLK2EzbDZyekhubVBw?=
 =?utf-8?B?UFgyV0RpSVh6R1JzMloxMXIvYlJHUytnSVZzaVlRYnRyeUVCN0N2L2hPTkRC?=
 =?utf-8?B?L09CVStqdlJ5RlFKWWY4anRIYURJTEI0eURBZnR5a2ExNHRjQ1pLVEduS2tV?=
 =?utf-8?B?dWMzUEZiRU9HRWdnZTMzZGkvOENGaTFJTFppZ3lvdmt1WmgrckNwWVR0Vnhj?=
 =?utf-8?B?dE5FcEc0QzY4OXJINktEc3k0VnFHT2hpVnVLWGN1RkFYNldMYUJqOUtjbmkr?=
 =?utf-8?B?V0RlekduWWhYZXRtK2hRbTZFSllZOFBibllDRE5KQmFZcXhhOHgyR1BhaU1R?=
 =?utf-8?B?cUtFSUk4ZEdGZlQ1bTVtSHRid1dCcVdhVU1OdGMvUFJJd3g4OGNnMjZHL255?=
 =?utf-8?B?VWVEb2NFNGlSejNtUUYxeXpGV1gxdnlGb1BPR0plbXZaRUFHRFQ2eHpBcHlN?=
 =?utf-8?B?UEF0YlVkZmU1TmpRNC82NE9vV05mODFDYnNtQlNic2dEWnhrVlAzb0h5N0ZS?=
 =?utf-8?B?UmFXaC9sSU1yVnNMdlY3elVKRDArc0h5RHVINEdaWFJpVVRCOXo3UHoxN1ZE?=
 =?utf-8?B?VHNMS2EycWFYZkVvekIzQlVJMmpwK0N1T0NWUExwV1d4Mm9RQXZPbjVHdXlp?=
 =?utf-8?B?ZW1Jc0hxNnRMYkpFN3VjT3hUcWZuYjgzUTNyV1M5Q3FBWlJHSWxqVDkvWmRK?=
 =?utf-8?B?aENlTU5CeGZuZzVOTG9FYlhiby9pN2N1MmZGclc1azhxWnZXWHRYcVR1dmlE?=
 =?utf-8?B?UVltZmttemhET0pXUjY1UXZNU0VZU3hCOXZWelhBL2ZBL2E1bTN3cUZzenk4?=
 =?utf-8?B?a1Q5Tkt3eXltLzZiSGFPTUpXR3krcFk4YmJnWWpYSzJZRHNQNHlvNjJwVnlO?=
 =?utf-8?B?V2M0WlpkaS8xcGlCQ3hLcXdpT3h3Umt2eEhDNm5ZaHVFVGFmenlOamU3TUdB?=
 =?utf-8?B?UllmaGFyWTl0VnJFZmVMOVVyYUwxY2l6R2txRzlTL0pNaCt3azZyOVpTcXo3?=
 =?utf-8?B?bnZ3S0VvWWdDVnFzWWcrRDZMOFQyQmM0aVUvdklIcnJhU1IzYlc3bVhVaitw?=
 =?utf-8?B?Qmt4cDJPdEdDcWhwSmhVUGNVTTBOZk1ncDVld3JJZ29JNFBaNnFVVDJlM1Ro?=
 =?utf-8?Q?u95NCBtC/Cw0xvp/5o1OczDKEUKdz9Mu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzRUY3Y5QzA2R3EyY0lBN0hkeTZwZzBML0JjQ0RQaGl0WExTQUxFNFRuR1Vt?=
 =?utf-8?B?V1h1TEZiaHZwYTkwK1pEYlFjOXhJWXpVWEE2dGhUYkR2YmV5dldUUFByUDcr?=
 =?utf-8?B?RHh1Y0VJdER5WVduM1lNeHhWdkNFSGxwbjB5aHRLS0RmeWdENWVtU2JBelZB?=
 =?utf-8?B?U3N5YnZMS0RkVzJkQ1FkNGNGRzFkeGlCOHZnSVBHY05sZ1YvR0VIVG45QVBN?=
 =?utf-8?B?Y0kxODc1VHYrZytvL0tmeEM0OXhLOU9XUXdKcHd0QzdDQzBoTk1yMVZ2N1ZQ?=
 =?utf-8?B?NFdralV1L2ZXV0NMZEJ0Z0FqUndjWHd1bWV5SVM1ZmVXdnA1cmJQelJMV0Vx?=
 =?utf-8?B?RnEzV2x1bW9YekE4ZEZtVlJpYjVDb0xSUkdVU0hRZnlvSjdSOUZPd0prTW5F?=
 =?utf-8?B?ZldjeTYySDl5bXh4L1pvSVNENmhNYTNtZ1NLcUxSVXhJQmh4MCtlMXVhZFRL?=
 =?utf-8?B?WERRTVA1OHh6OC9GbVpTTjVlUllvQ1BKdWdVRjRPb2lWNDRKb1JwdFNmdEQz?=
 =?utf-8?B?cTNUVEcxMTVGUWYwd005QkdDZXl0SnAzNVRMRFA0NXo3KzdKbXBlM3praTVS?=
 =?utf-8?B?Zk43bEpUUFhySGgrNE9LcmVSSStmZXBqcFFtd1B0eXlLQy9UK3dsUlJMTk12?=
 =?utf-8?B?RzBjc0ZxOVZweGtYTXk3Ti94bUU2OGdhbFNTeC9UY2VhMDhsbGszdXNCWVVq?=
 =?utf-8?B?YTMwbWtBV2VEVy9mNVdOVjB6VTZqWFlJSHNtZVpxdGFiZGExeUczN2I0ZWhB?=
 =?utf-8?B?UGRyMVcwRDNzN21ySG9nYkZKdHhJN0xqL2Fqd1RjNXhuSFVaSE04cjBLV0Rm?=
 =?utf-8?B?WUJrQnNodWRmSmJ4SmxabEpZb0lMdlZJY0xhSzFqZ1R5VHZjdWJ1N1dXVHIz?=
 =?utf-8?B?TVpmTUxCMmxXNWF2WUlNSzJhREtuSWpOaTBBOTd6VHEyWmVFQjVOeFBKWGph?=
 =?utf-8?B?eGtFOVN4dFgvTXpPVndTQndYUURDUTJKSnhqWFU4bTFTT3VRUEdaT3VqYnpt?=
 =?utf-8?B?dnhNWjdLb2xKWjZZSHEzaGlGV2dkSFJ2TnJaU2xlZVhWdEY0V09obitoaVNU?=
 =?utf-8?B?d2l0VFdCaVZGV3U0Z2d0NWVITjk2c1p4Q1BNZ0M4eldHUnJTRDRDMld1bTlx?=
 =?utf-8?B?OG9CN3N5UXVwRnY0a0FNYUhPVk1XUU5YK2Z5ZkMzQStkWVp1ZjlWdnRFQ3Bz?=
 =?utf-8?B?c2NuVkRyb3MrTWJWMlRUbWRabm8zL003SmZONzNmNzdGRDRMY0M3WHBxVjVP?=
 =?utf-8?B?TjRkNThWN3hqaEdiWnlwbFhCbTV6OTc2anlRMnI2WjZvME51YUhpQXcvc3Zt?=
 =?utf-8?B?ck1QZVVHa2lRUFVqZVVXRWcxcDExci9wY3dPaWRVM0JtMlNCOFY3OWZTeVBW?=
 =?utf-8?B?R2ZqM3FSOENJblhQWC92M2kwSGc0UWFjcjVUMklDR2xzemprRnMyclZlU1F5?=
 =?utf-8?B?YUVIYk5oK1hyL2x3K0RSQ0YvM1Y5WW96eTB3UytLYXlEWlpVT2pNNDV3azM4?=
 =?utf-8?B?OE12Wkd5OTJrSDlMZTRXdmUyaDlCdDlueERtVEtHcVVFbDZKdmJJbkxuSDVm?=
 =?utf-8?B?Q1NUbkJWZyswbTJHeUFwcmRKcHpDWkFRWEJOcURyV1pBWi9KRmF2TUNvRXFw?=
 =?utf-8?B?S2d6dU1xd3R1clZMNzNEaDlPZVJ1WnRZaThKNnlUNVk2dVNnOHZBNm5FS1VN?=
 =?utf-8?B?VERaVE1LUytmRC9RUzZnQWI2OFFLU0MxN0JxQXk0OU9pcjdHRHBpbDJXcVdD?=
 =?utf-8?B?REkxL0hjQzJteGR3RlNxWGttRERzTzFFRjNlTjBhSUIxT3duMExxMmp2ZEls?=
 =?utf-8?B?eWVpVTh6b3lvTGVwMXpYS1BPZitrdWFRY25CWVJNcWxiTVZ2c296N1dTK1Nu?=
 =?utf-8?B?TThiem9xcmlBODYvUTZQekpjZnphc2JCQURWVklMb2NjMGU0Zjk3NFZrc1Qw?=
 =?utf-8?B?bjBjMmVRd1pWbkpHdjdkRGtHOW5KN0xYNU1KUzZaRDN6ZmpVMmw0YjliK2pn?=
 =?utf-8?B?RVg2RUZveFJEL2E3ZSs0SzVNVGV2c1NMV1MvUGhlQWIrWnJsMmJtcTVzYlBk?=
 =?utf-8?B?V3JZR01uRXZoRERzSmd4UGJodDZRaXJJSk9Ib3NtVmdzVnRENnhlajNsNDMw?=
 =?utf-8?B?dEFOWWJYMjB2QkpVQW5WNmIrSGVZS3RVTnB2ODBkRXNWSHFEUWEvemt2MFNu?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0715c573-c440-4cf8-40b8-08de0721cb94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:51:26.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdSiXYtNPwPP/7PR+IftetQnoufByp2nflTSW8d/QIgMTMZegGOh4t5JHDzYOCQfeyj0maHOtIMJ1JCC/6RaGwye+URKTmbkMsU3uSIFb8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6316
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


On 10/1/2025 12:04 PM, Nemesa Garg wrote:
> Add register definitions for sharpness strength and
> filter window size used by CASF. Provide functions to
> read and write these fields.
>
> The sharpness strength value is determined by user input,
> while the winsize is based on the resolution. The casf_enable
> flag should be set if the platform supports sharpness adjustments
> and the user API strength is not zero. Once sharpness is
> enabled, update the strength bit of the register whenever
> the user changes the strength value, as the enable bit and
> winsize bit remain constant.
>
> Introduce helper to enable, disable and update strength.
> Add relavant strength and winsize in both enable and disable.
>
> v2: Introduce get_config for casf[Ankit]
> v3: Replace 0 with FILTER_STRENGTH_MASK[Ankit]
> v4: After updating strength add win_sz register
> v5: Replace u16 with u32 for total_pixel
> v6: Add casf logging
> v7: Add helper for enable and disable casf
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/display/intel_casf.c     | 131 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  19 +++
>   .../gpu/drm/i915/display/intel_casf_regs.h    |  22 +++
>   .../drm/i915/display/intel_crtc_state_dump.c  |   5 +
>   .../drm/i915/display/intel_display_types.h    |   7 +
>   drivers/gpu/drm/i915/display/skl_scaler.c     |   1 +
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   8 files changed, 187 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 78a45a6681df..2aeb1da455d7 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -228,6 +228,7 @@ i915-y += \
>   	display/intel_bios.o \
>   	display/intel_bo.o \
>   	display/intel_bw.o \
> +	display/intel_casf.o \
>   	display/intel_cdclk.o \
>   	display/intel_cmtg.o \
>   	display/intel_color.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> new file mode 100644
> index 000000000000..ad2faed5c1b3
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "i915_reg.h"
> +#include "intel_casf.h"
> +#include "intel_casf_regs.h"
> +#include "intel_de.h"
> +#include "intel_display_regs.h"
> +#include "intel_display_types.h"
> +
> +#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> +
> +/**
> + * DOC: Content Adaptive Sharpness Filter (CASF)
> + *
> + * Starting from LNL the display engine supports an
> + * adaptive sharpening filter, enhancing the image
> + * quality. The display hardware utilizes the second
> + * pipe scaler for implementing CASF.
> + * If sharpness is being enabled then pipe scaling
> + * cannot be used.
> + * This filter operates on a region of pixels based
> + * on the tap size. Coefficients are used to generate
> + * an alpha value which blends the sharpened image to
> + * original image.
> + */
> +
> +void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int win_size;
> +
> +	intel_de_rmw(display, SHARPNESS_CTL(crtc->pipe), FILTER_STRENGTH_MASK,
> +		     FILTER_STRENGTH(crtc_state->hw.casf_params.strength));
> +
> +	win_size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, 1));
> +
> +	intel_de_write_fw(display, SKL_PS_WIN_SZ(crtc->pipe, 1), win_size);
> +}
> +
> +static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	u32 total_pixels = mode->hdisplay * mode->vdisplay;
> +
> +	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_3X3;
> +	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_5X5;
> +	else
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_7X7;
> +}
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (!HAS_CASF(display))
> +		return 0;
> +
> +	if (crtc_state->uapi.sharpness_strength == 0) {
> +		crtc_state->hw.casf_params.casf_enable = false;
> +		crtc_state->hw.casf_params.strength = 0;
> +		return 0;
> +	}
> +
> +	crtc_state->hw.casf_params.casf_enable = true;
> +
> +	/*
> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> +	 * User can give value from 0-255 but is clamped to 239.
> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> +	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
> +	 * Also 85 + 16 = 101.
> +	 */
> +	crtc_state->hw.casf_params.strength =
> +		min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> +
> +	intel_casf_compute_win_size(crtc_state);
> +
> +	return 0;
> +}
> +
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharp;
> +
> +	sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
> +	if (sharp & FILTER_EN) {
> +		if (drm_WARN_ON(display->drm,
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
> +			crtc_state->hw.casf_params.strength = 0;
> +		else
> +			crtc_state->hw.casf_params.strength =
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp);
> +		crtc_state->hw.casf_params.casf_enable = true;
> +		crtc_state->hw.casf_params.win_size =
> +			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
> +	}
> +}
> +
> +void intel_casf_enable(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharpness_ctl;
> +
> +	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
> +
> +	sharpness_ctl |= crtc_state->hw.casf_params.win_size;
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
> +}
> +
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> new file mode 100644
> index 000000000000..753871880279
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_H__
> +#define __INTEL_CASF_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_crtc_state;
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
> +void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
> +void intel_casf_enable(struct intel_crtc_state *crtc_state);
> +void intel_casf_disable(const struct intel_crtc_state *crtc_state);
> +
> +#endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> new file mode 100644
> index 000000000000..bd763efe5c1b
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_REGS_H__
> +#define __INTEL_CASF_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +#define _SHARPNESS_CTL_A		0x682B0
> +#define _SHARPNESS_CTL_B		0x68AB0
> +#define SHARPNESS_CTL(pipe)		_MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
> +#define   FILTER_EN			REG_BIT(31)
> +#define   FILTER_STRENGTH_MASK		REG_GENMASK(15, 8)
> +#define   FILTER_STRENGTH(x)		REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define   FILTER_SIZE_MASK		REG_GENMASK(1, 0)
> +#define   SHARPNESS_FILTER_SIZE_3X3	REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
> +#define   SHARPNESS_FILTER_SIZE_5X5	REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
> +#define   SHARPNESS_FILTER_SIZE_7X7	REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
> +
> +#endif /* __INTEL_CASF_REGS__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index a14bcda4446c..1e309e7e7947 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -374,6 +374,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   
>   	intel_vdsc_state_dump(&p, 0, pipe_config);
>   
> +	drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
> +		   pipe_config->hw.casf_params.strength,
> +		   pipe_config->hw.casf_params.win_size,
> +		   pipe_config->hw.casf_params.casf_enable);
> +
>   dump_planes:
>   	if (!state)
>   		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 029c47743f8b..771026f788d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -946,6 +946,12 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct intel_casf {
> +	u8 strength;
> +	u8 win_size;
> +	bool casf_enable;
> +};
> +
>   struct intel_crtc_state {
>   	/*
>   	 * uapi (drm) state. This is the software state shown to userspace.
> @@ -982,6 +988,7 @@ struct intel_crtc_state {
>   		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>   		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>   		enum drm_scaling_filter scaling_filter;
> +		struct intel_casf casf_params;
>   	} hw;
>   
>   	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index c6cccf170ff1..19aeb8d5b79c 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_print.h>
>   
>   #include "i915_utils.h"
> +#include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_regs.h"
>   #include "intel_display_trace.h"
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c5d2388997d..457aff1cf095 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -233,6 +233,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_backlight.o \
>   	i915-display/intel_bios.o \
>   	i915-display/intel_bw.o \
> +	i915-display/intel_casf.o \
>   	i915-display/intel_cdclk.o \
>   	i915-display/intel_cmtg.o \
>   	i915-display/intel_color.o \
