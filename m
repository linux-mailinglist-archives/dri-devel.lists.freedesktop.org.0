Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AACB2663
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 09:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626E610E696;
	Wed, 10 Dec 2025 08:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nc+KlWwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B046D10E6A9;
 Wed, 10 Dec 2025 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765355175; x=1796891175;
 h=message-id:date:from:subject:to:cc:
 content-transfer-encoding:mime-version;
 bh=I0sTAabuIZ6rGSuI4M4wrRxpTXbrKDdVhmk+MedEDCU=;
 b=Nc+KlWwl8YZCLjhQW71ScgyZrUOIqq0dE8Vn54jRFeyuJwnOA2xA5jDX
 3nSavHVU0BMu0LP/8oPelnn6fr0Se2f2YR/QVQ5GLoAXHgPjFXgDyTedN
 k5NvbD0Vn8jWDv/0q9oE+KTyHYARWLoY8KAJ10H5aGNCaoZzKnIATgwrd
 v1sLi6eIDf46w3vmRWUOCXh5P607JGe+bqPK6cDBTph19b4w9/BBpaWuN
 PvDRTRn2QqDeNK7gwdwNnWx5fTayYlF+VpVtAOpGBg3xYSUIeKhQxlxBf
 Y/yHQ3hSfjdMccVVJ48HWzP3EXKNOuSbz2vqJxJwtso/VLVXOjc1gyhhQ w==;
X-CSE-ConnectionGUID: DvC8icAURxqt3BiTyzJubA==
X-CSE-MsgGUID: yEk+petsTre0KfccFr4aUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="92798786"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="92798786"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 00:26:13 -0800
X-CSE-ConnectionGUID: hk8iFyZpSmSE6ASKSSl07A==
X-CSE-MsgGUID: PfNNWeP+QEON4bWMDhjFZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233855034"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 00:26:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:26:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 00:26:10 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:26:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHz0unVF9mA5jpijAjHj0IdE/EQL5LmRiWhwohPFO8knBc1ZatD8JjRNZsgMdwBOukY3v6yAhYEHhzvRy0FGgk39PPwDE5w28sPykOaVh1ant+nbdnvPvuf4a9zB+QxtyqjeqXQIjxeUjaPXdWxpZ2BX67iXrao1A6bJCD+mmL5mWZzW3rrGB0u5IWxMSoWd3/kYgjsVCoXGx6p0XVZXq+MS9Kh0UcxpDI6YerIQXua3c2JZRErNm7gdsVLyHWKTAT0dXp0Q7zoUpo0W76FbHCiLsucCgv0BkKDnZuUEa8aT5pHSqf8W+c23kw2KNXUbdXtZVaByHNkU3h20zKuGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nT5tczjjJfNcSL+rM6dCVzXj9zg0GDG0MH/entopLI=;
 b=ewudPwAsXiOd+bgDLy5zwmatnOZorh5PCEy3EMFGLom8Qqf/BMU+dcoIFgeYWj4DT2qCfzysysKFJyH/ovUYJ3AMCkz3dJqk4ZFd9YtjkHlF7/ztZtrWW/yUQRUPP0gNmcrEH3Npm+/qTFPnhVpM6On4XsyxnrkO45x9Qr52PdBKoz4j8oU9rcAJxxmliU3z+X4pkfCTnegOKXsLbZtvYNcczlZmyvzyVrKBKA9GDvol54bpg6SipPuV4pNan4FMWLLNBN3IeNESw8Oq8qjGGXWjxpwOSSOMuFA2+iE/04d1MuEw2HIp0iUZCg1kjvOReMsEbME1Hp9Mojn8KGkkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by BL4PR11MB8848.namprd11.prod.outlook.com (2603:10b6:208:5a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 08:26:07 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 08:26:07 +0000
Message-ID: <d73adfa8-d61b-46b3-9385-dde53d8db8ad@intel.com>
Date: Wed, 10 Dec 2025 13:55:59 +0530
User-Agent: Mozilla Thunderbird
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: Regression on drm-tip (CI_DRM_17644)
Content-Language: en-GB
To: <loic.molinari@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Nikula, 
 Jani" <jani.nikula@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, <tursulin@ursulin.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|BL4PR11MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 152ad4f8-fd64-48cf-d243-08de37c5c419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1NWYVM1QWFZK1h0dFFJRTN4ZUx4dFIvdDVtM3g0LzhGVStaTFU2djlGVzV3?=
 =?utf-8?B?RjVZWjZpOTFvM1QzVXVqVmZGck1NOXhweUNXVTZIOFRVQUJnT1N5VFZESFFn?=
 =?utf-8?B?RVdMTDRMY2ZobTlQcys4SFIvUnpLdm9kQmVRcnV3b1N1Qm1qT01jSUtocmhu?=
 =?utf-8?B?N3pSZTI5MFR2Zlg1NU9oei9ZbTFVNDNRSnpWREtTV2x3R0dhTDZ4bWwwdU9o?=
 =?utf-8?B?azdvL1pFYzdNNHVSOFdJYWtoOGY2dmdSUkFnSEZvaGhKNzdUZFNnK1JlZ2tD?=
 =?utf-8?B?NytNSTNtSGJ5Z0NablN3T2Nkc29pRVFvSVJ4Rm5yRGhSN1VYWEh4ajB1RFZa?=
 =?utf-8?B?dGhmL0ZVZWJxMWM2RzRGUUcrZUdDdjBhSVBYZmhFMFMzWExCbys5ZHRPMGl5?=
 =?utf-8?B?cktwTFRQV3IzdTFDdXljVjhxYzQwOGJrU21JUzNKQmNjUER4QStOa1RhamlW?=
 =?utf-8?B?bXVmQlNLZXkzTmwxTzdPZWpaWVNHTnFWbUdOZldIYmV3SHZwYUVMM0NpMEpu?=
 =?utf-8?B?TFhzVVZsQStySWNDS29HYmlRMGlsV3l6T0pFc3REQitBWkNoVXNHUlM2VHBL?=
 =?utf-8?B?cno3L2hFVmd5a1lXZTk0eGtlSS9SZURPeU1GV29FTjNqVnZHTHhJYWttZitB?=
 =?utf-8?B?a29ZbUk5bXdCQTVzNlhnd0tmaUU0MFpVazZ4dU5PdU5DYStYb0pzYU9mM0lF?=
 =?utf-8?B?MjR0MEl3cHVxMkt5L1dhNnY4ZlNybjVHTDVaV0ttcDRVa3V6NDJTWm1GM21V?=
 =?utf-8?B?TUlHbEs4NktLaUhteGEveDlNNkdIMTdkVyttUFFvMllVQXg3QUVNeSs4M0pn?=
 =?utf-8?B?ZGg1a2JYSXF0eDRublJ2QUpERGU0R2xzVFdoaFVTSCtiRWhsaldNamsyR3lu?=
 =?utf-8?B?dkd2U0t4dGRqZkdaS2h4cEpYOFpHK25nRDl0cDhVVERxci9jTXhoQm9iR1FL?=
 =?utf-8?B?UGkyekZUSzh2c25FYlRFeGdtdnplVzdROFZ4Qk9qeDZtQ2U1clh4eE9zMjdn?=
 =?utf-8?B?eVFtYVVlUVhrMzVnRjdyQlZRY0lndWZJd0hEYU9mdko5MkR2UXhoTElFTDYz?=
 =?utf-8?B?Y1dvMjJLZzVzZ1lJR3poUFR3MnpMTUFMd3VUSDA3NU9USjgxendYL2NsTDZ5?=
 =?utf-8?B?SzRIOVk5MFVyL1F1U2VYdm1KUnRGUDhucVAvZGQvTE9pMVZMQndPb3RkQVlq?=
 =?utf-8?B?QXpLOVROa1pqYmV2c0w4L2p3dm90bVU3NStIOTIwME5MRm9WVm4wVTM2d3pL?=
 =?utf-8?B?RWlSQ080MXhxU05rT1ZXS3ZDUlI4MnhlQjJqSkdSWG5Pakt3UktTRWpreXNv?=
 =?utf-8?B?YW9ValNidVAwZy9Mc0dpU3E2UHFpZjBtVk5PWDE2R0ZycWZoT2xlWlBUa2NW?=
 =?utf-8?B?dFk2SDVtWGR1ellEZFQ1b3k4QlFFcmhvTyt2czJsaUFybUZ4VVlSZitBc0Zz?=
 =?utf-8?B?TmxJMEpwd1UrS2tTYzVaVGlDRDlnRUZGbHBLKzlRVjRGWlg4Z0YyTExiYkV1?=
 =?utf-8?B?YnBKMFZQY3B1YzlZWk5vVGtzMHZ2OGJPT2JwUVR0MS92bm96elRaSXVVclA0?=
 =?utf-8?B?N0ZBN2lqczBQQ2Y5andhVlhXdUp3akU5QTVQc0NySWNRQ3R6QW9JbkhOZU1U?=
 =?utf-8?B?MHlUK3NoV2tJVG85MlhyOVZMdUY0bm5TdzhLTm5zcGpSQnJ1REJjNnhJMEdi?=
 =?utf-8?B?WTJySzQzVm9VTy92SGM4WmpDR1pDeE0yb21MZ1NZbkdQQlNMYjJ6aTcwbk5X?=
 =?utf-8?B?Z1FCaXFoWUVSMlN1RXp6dFVHSkcvai92RHR4QjJsd1VoK29QMU4rSTNSOUYy?=
 =?utf-8?B?K1RaQzFZSkRMWXBubDJCWEZEOVVHWXlxS09KMEJYeTE3eHJ3VXhRV1VkUTRr?=
 =?utf-8?B?L2kxMXQ2NnpRYWJ2UW9ZaUwwWEI1dVFhVEZaV0FPdTBKZWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzM1L2ZyWjNIcStGMit3S0M0S3VsQi9iOVN5bzF1b0dXT0diK1Z4b0ZGOVZs?=
 =?utf-8?B?ZGw1UGhTamtPRTZ5enpsa201bVh1bmxjS044YTE2MUI0RXFSb0xzKzRPSUVL?=
 =?utf-8?B?TXRTZWw0czVtT0I2bjJpbWJvU1JrdFluT2FJdG5sK3VCaXBZWUtkRHpKYlBl?=
 =?utf-8?B?VFRPNnZaSjBwTVNXeXNwV2RaUmVrcC96K0dnT3Fpd0c5QnRRQnY0andtRGo2?=
 =?utf-8?B?aTgvZTV0ckFQS3l3ZHdKOUxNZklvamovOVF4SmxaNzlLeEV2MDk1VjB3VTN3?=
 =?utf-8?B?Vm9nUXBWUUs1eVcyOHlFWlJNZTFSQ3pEeDdYUGZDQ3orcXNycldyZC8xYmFB?=
 =?utf-8?B?dE0zdVZiUGt4ZEhHcExOekJ0QzZMSWR0djhqYm9vOEtCYlNIVXZsbks1L3h1?=
 =?utf-8?B?ZFhxeWdybktmZWxrUm10ZTE1b0RGRUNWL0Z2bmVGZG03UHlxTVBQdkFxNDVS?=
 =?utf-8?B?RmlOcGxseHlwcFBBbGllVEptaW1MWDFlS1QzRThXTm9xc21NYnhEZkdocVpz?=
 =?utf-8?B?M0RvUWdkdHdSSzV0WWYrY29JdkR6VmtyT2xIdFlwbnpsS1N6TVZnQTRDN1ZO?=
 =?utf-8?B?VmdGRjVPc0U0UXplTEEzUHRybHZtdFlKMjRYREpEMHozSFA2TStZN29kYTVH?=
 =?utf-8?B?T2dPbGhMNUFsbVR4UmszUHNnZ0NlS2FJVUw4RGFGOFFxdWdKaURnVURqSVZJ?=
 =?utf-8?B?blo5bWNIVG5TQmZpaWZ4eGJxVFcxKzNhU1dCL3BNUGlvOTVKSFRVaXdiWmEw?=
 =?utf-8?B?akg5T09qbUZpVmxOQ0h6TTlmMGdseno1YWIyenFtQmdEbm1CT0RPdWVjMm41?=
 =?utf-8?B?R3NWNVJaUnkxS3ZXcWVpZDNhaWt1bVQzdTVadFJKVmhtL0QvQUlZd3VyN1kz?=
 =?utf-8?B?V3hHYlRLNjExZEZEcUdtTWc5L2RQbzNnQmN5TWVpN0E4cXBIZFdCMkRWWUlQ?=
 =?utf-8?B?ZDVJNzFNUEF5SlQrV25oMmdnWTJHMzdSSFpDYkRHenoyTFRHLzNsMjBVRDYz?=
 =?utf-8?B?NWJWMkV6M3F6Z2ltNUdCR3ZhNXMrYStnUGJ1MWdkRWVWaDZUb1cxalFybk9U?=
 =?utf-8?B?ZUh2Qk1rdzZ2YjdqRkE2cWFkajI4MlJJTXNPY1hjWWFKa0RoWXB0TnYvdWMz?=
 =?utf-8?B?TFR4TFBZQlVseDBIZ1pjZE1EWjI4UzBGc3p1enZIU3k5QVNvSGR1czc3ZW51?=
 =?utf-8?B?RUNKVWhUN3hxRTVNVlh0RTNvZHhLL1VIYTFJK1p0VU4wZTBmN0s3UUp2bnFr?=
 =?utf-8?B?eVVveWhwK0Fnc3BKdEdkUUsvWGpRSmk5MS9IV3JrUEFDTjUrMFllYSswdHFW?=
 =?utf-8?B?ZUVMUTNvWHhhd0NKSXRFK015WUxFbkcyRDNxcWNOdi9xZkNIUFl5Tms2NW4v?=
 =?utf-8?B?NjZsdytkSUs2eU5uK0t2dzRJakExSStHeG9ueEZmKzFOcEJQSnM5czJYL3hX?=
 =?utf-8?B?a3FKYTlROG5QQkN6aHFmRHdrV1dkZW1wdEg0MDJZK0VuLzJhaUxvaVhIb2wv?=
 =?utf-8?B?TE1BWUlqWTcrWXZpWmcva09RbU1oZ1pBSzgxQlhBdU90RmlTY0VDTnBtNndp?=
 =?utf-8?B?QVYyU1BGZHBYT01NNGV1Y2tVQUxBT0dzaTFXNFYvWG9HK0xmcjlFQnV4bEVx?=
 =?utf-8?B?aWNOTXBuODVNWEFsWGtCT090WjFVcUFyN1hIUDFBNVV6MCtMR29vL3ZKWnJ5?=
 =?utf-8?B?anZOYUJhNlVhZ0RuSjZCWTZTeHVTRkY5c3gxZkhoRGlYRWlPTXFHbytleml6?=
 =?utf-8?B?UkE3ZERpTy80OEVLcGJURkd3Y0tnSjVIaUE4akN5QjgwVUk3S080L3pUditX?=
 =?utf-8?B?NU1aM2p3Nm83andMME1neUxXTjRnbUFNTngyQW9LYkRHOGh1OVo3SGdXZkRq?=
 =?utf-8?B?bzk4SnhNZzBzdnJISnNZZUwraHA3QUNVWjFwcG1naEN1NjNpM0hxcmY4WjBz?=
 =?utf-8?B?akdvZ1V5RmhSWlF1V1BKbVp1VDNtYi81VHJXTVNvaXhTU1pOQnhmYmtXTWJj?=
 =?utf-8?B?UDh6NHd2WlFoQTVqOFpPUlhNa1h6WW50NHZaQjl6UUppdTZqcVY2VVpVNmZC?=
 =?utf-8?B?TlduUktBZ0RxZ3dFYTJwMDBIMGpuRFFwb0dSYllpNWp3djFXaUdmRzc3dGp5?=
 =?utf-8?B?RE9aelorUkh6cjlwRm5LWGthRDQySWdXVUd0ank5QmVJRzEyeHBKbURqcVV2?=
 =?utf-8?Q?9r+uXZzcdh7ohQ0otgJ19vA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 152ad4f8-fd64-48cf-d243-08de37c5c419
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 08:26:07.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyT/xgSIldIcgwNCJt922vyJuJCXQ5xcu4bHkxNOVcBXlk/HpWLgqHQR2qzKKQgrelAbg/JsTbVvo5NmzW2PJ0nYiR/ebpqzt0cTQ8cgW4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8848
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

Hello Loïc,

Hope you are doing well. I am Chaitanya from the linux graphics team in 
Intel.

This mail is regarding a regression we are seeing in our CI runs[1] on
drm-tip repository.

Since the version CI_DRM_17644, we are seeing the following regression

`````````````````````````````````````````````````````````````````````````````````
<4> [392.386571] ------------[ cut here ]------------
<2> [392.386578] kernel BUG at 
drivers/gpu/drm/i915/gem/i915_gem_region.c:49!
<4> [392.386597] Oops: invalid opcode: 0000 [#1] SMP NOPTI
<4> [392.386604] CPU: 0 UID: 0 PID: 5710 Comm: i915_selftest Tainted: G 
S   U  W    L      6.18.0-CI_DRM_17644-g20a0f6f7ed00+ #1
...
<4> [392.387153] RSP: 0018:ffffc9000142f740 EFLAGS: 00010246
<4> [392.387158] RAX: 0000000000000000 RBX: ffff8882427b8000 RCX: 
0000000000000000
<4> [392.387162] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
<4> [392.387165] RBP: ffffc9000142f770 R08: 0000000000000000 R09: 
0000000000000000
<4> [392.387168] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff888144dcb800
<4> [392.387170] R13: ffff8881412b8a40 R14: 0000000000000100 R15: 
ffff8882427b8000
<4> [392.387173] FS:  0000702699044940(0000) GS:ffff8888dc8ea000(0000) 
knlGS:0000000000000000
<4> [392.387177] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [392.387180] CR2: 000058e25b5beef3 CR3: 00000001412d7000 CR4: 
0000000000352ef0
<4> [392.387183] Call Trace:
<4> [392.387186]  <TASK>
<4> [392.387191]  i915_gem_object_create_region+0x1e/0x30 [i915]
<4> [392.387663]  igt_tmpfs_fallback+0xaf/0x3c0 [i915]
<4> [392.388109]  __i915_subtests+0xb8/0x250 [i915]
<4> [392.388557]  ? __pfx___i915_live_teardown+0x10/0x10 [i915]
<4> [392.388981]  ? __pfx___i915_live_setup+0x10/0x10 [i915]
<4> [392.389405]  ? _printk+0x57/0x80
<4> [392.389413]  i915_gem_huge_page_live_selftests+0xac/0xe0 [i915]
<4> [392.389835]  __run_selftests+0xc5/0x220 [i915]
<4> [392.390263]  i915_live_selftests+0xaa/0x130 [i915]
<4> [392.390688]  i915_pci_probe+0x11b/0x220 [i915]

`````````````````````````````````````````````````````````````````````````````````
Details log can be found in [2].

After bisecting the tree, the following patch [3] seems to be the first 
"bad" commit

`````````````````````````````````````````````````````````````````````````````````````````````````````````
commit a8a9a590221c1959716277d4b13fe658816afc0e
Author: Loïc Molinari <loic.molinari@collabora.com>
Date:   Fri Dec 5 19:22:26 2025 +0100

     drm/i915: Use huge tmpfs mountpoint helpers
`````````````````````````````````````````````````````````````````````````````````````````````````````````

We also verified that if we revert the patch the issue is not seen.

Could you please check why the patch causes this regression and provide 
a fix if necessary?

Thank you.

Regards

Chaitanya

[1]
https://intel-gfx-ci.01.org/tree/drm-tip/combined-alt.html?
[2]
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17644/bat-jsl-5/igt@i915_selftest@live@hugepages.html#dmesg-warnings394
[3] 
https://cgit.freedesktop.org/drm-tip/commit/?id=a8a9a590221c1959716277d4b13fe658816afc0e
