Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7642B0F595
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 16:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5DA10E7DF;
	Wed, 23 Jul 2025 14:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YboFHd1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30ED310E7DE;
 Wed, 23 Jul 2025 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753281703; x=1784817703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yzX/HJlm5h3xVNGSr62F9DHgcvGL+zPJ/dumn7YYJUU=;
 b=YboFHd1L8U1gsUq/8JaGQDeyxMwmhkeDkgKebAQNJpu21JRMltbQ/s3Q
 sETuM9wwo6b4J7yk12j3UgmYKUZKcgPxusgyhQF2tlSwio/aa6+dAL6Xc
 tgC0a5GTAvhFuQYRZ/bLNKK691t8lSRtDAglxGFGLvUlHVFTSb/16Y9QU
 W5kX/jXPhWvXwaXa3mQdNT4DLpe2nMgQdwha+AloW+6pCRUUorgane0Wv
 TFr7jOrsuG84IYdYImJ5W3Wm6OqUfU2tIgdsMwAcvHa0+GkPLfaI4itwt
 1oHte7dMlrp3na7weqa4PHcdIsD58bGuEn0NT4jNgiiwZMiwoiqwPEIap Q==;
X-CSE-ConnectionGUID: 71jQLD3OSACnOZNmWvKADg==
X-CSE-MsgGUID: gBqfDp37TsaYlN5Q9oUbjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="58182160"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="58182160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:41:43 -0700
X-CSE-ConnectionGUID: QnU9IklQRmedSebdQ55NAA==
X-CSE-MsgGUID: KHcEYiNSTC6ko6hJwjQLZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159569354"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:41:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 07:41:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 07:41:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 23 Jul 2025 07:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahYBoJL7enWG8MADDfoavClVwSg+cYPHn+Ug+GmeOmplzCT5h1ZZj41N3TJEdjgHfzEPS+CMNZGy+CI3rkGvTvZOSMfPNgkgsuD9DORgSzpYhk/Bs2SEUpzjVz7gPNMQfdJZjthTu+UQ1nowv+vBMaZU7hWinuR+8D42kfiIsn0x14LUdpCwey8oTebKdTa8lyRO+z1EOzIVKMxAYrmYU2NpG3CNNCdnSZdhaCFXIEsuMkpoUiMcAm9e5tAB6FIwQqpLqRnDyScamv4f4Nlu8XrQqLcb5MwOvRnNYK+DV8DI7bHSEFTPFUC8SHTKOjup5CqyZTvYg9UWVltZ7ck2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/4DHAW0H6GEeXyTrVORZzWUN3RQuwp/jT/7bdMT2Fc=;
 b=ZDgZ3UnEzSxpZuI0YdQqlQHke/YEH8Hpv74tPz4cu63HrEw0iVT+Re7TsFBBBBlluQu6JGvhW1ooG1bBFz4iz/pJSqSue2Y1ba8PfngjYJYNnlUtGR5giTKmktD0eqTL8rr3WJ96GSWicDxAH74JixJGEo+hbxgDiWzfwrxew6TvRfmLV0CGSk4SjtacRV6sdgG/3PTKOBjtHAfsxsWegS9Qp35xRHYVxVB7hwLMmKWuj5ikEfaBhInhaCclLj/+fuCobAXC0YuR0GQ+N0KUolzT4dNKh+ZX4yFxc6PpFzgcIYm00VOPs1D/3tGNxnzrGJq7ODlaxwtkL5/Kpj6CUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 14:41:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 14:41:39 +0000
Message-ID: <aab4d187-3a9f-4399-bccc-8e6634a16110@intel.com>
Date: Wed, 23 Jul 2025 20:11:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>, <airlied@gmail.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-6-riana.tauro@intel.com>
 <aIDsz7UkxW1XRRtP@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aIDsz7UkxW1XRRtP@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: c3af5d90-f404-45fe-6639-08ddc9f70836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0pHTnZnb3lBMSt1dWZYa3lWSXVIL0ZlOTl6cjZvMzhPUUNsTk5sdDNvb0Fl?=
 =?utf-8?B?eFRXdklJWjRsUmxkLzE2OFh3ZmtGeDNmU1NjU0p5RnplMVc4WjNDRWVmWFp5?=
 =?utf-8?B?S3F3a0NVMkhGUWkya1dOOUdaamRzWU8xZklUTW0vOUhnWnBxdkJUNHNuem1j?=
 =?utf-8?B?U0Npdi9RRkxzaFNCTXpIWGhCMjBqMlVsY3VVMDkzVjM5N0VLa01VRDlXU1dS?=
 =?utf-8?B?bkNKei80VGFlVXpDL0U4Nm9aMzY3OUlvTmFqRldRWi9PNlBCRVhSR2VZRFIx?=
 =?utf-8?B?VnVQb1pxUTRVS3lSWmhrMlhyTTByQWpiYW5PcnVNUkhweERNM1dwZGRpMTQ3?=
 =?utf-8?B?ZlNWR2xSVTFjcStJUFlIR2lSZnFMSVR5aUZCT3JhYWg2YVFaTzdnZDBucURx?=
 =?utf-8?B?emxYZFZxS1NCWHVGQ3VqRXFNdjFPazRsamFzYkRzOEpZbXZjOWZOZXBCc3RM?=
 =?utf-8?B?WXk5K2ZjWUd6b1lWMmtyWW9hSFpreDQyVUp4cUdrNzVHY29zTVhyM25mbEI4?=
 =?utf-8?B?cERNeVVrdWhZQXZuYVkzWmFZMDlXTlc3eGtaRkhJS3V5bi9ET3NQa0l3OFBV?=
 =?utf-8?B?aWpmVm9SYmRjcnN2NVdtSk83aEVXeFNEM3NJTGhjbU9XMEZQb2RXZkdtMlgz?=
 =?utf-8?B?eEIrSmpmM3Q5ODhUNjBZa3dSa2RBRkJxby8wYjM5YmNrNTgzbFdFZkhxcXU1?=
 =?utf-8?B?MDBPZ0poMWhyeFB4b0Y1d2ZvTHltcnpWeCsrQ2NhNUNweGlxM3dlMXR0eTgv?=
 =?utf-8?B?VW5YM3laZW5idjdYc0pmc1JjZUx5aFdjZFJncko5M3hxZXI5MVEvZ1JpeU1z?=
 =?utf-8?B?ZWRxcVFnOUxrZmdzelExSUplWXJ5bGx1VDd1YkVEeUZqU2RjSW9BZ3lRYmlC?=
 =?utf-8?B?NmdaTUs0ZTBPdzk3eHZPTDVtTEVtOFZUSFlqOExsRGRDOXBrVTBTZ0lPZHdE?=
 =?utf-8?B?eDZSZ0RseHIvMGo5Uk05SSsrVjNVKzVBeU9lSEZBb00rNjVJWWE0MExreUZ2?=
 =?utf-8?B?eElQcGszeWY0dy9iRnVjMWhodWRON2R3Y2NaL3BYLzE3d1pmQ2s1MzhiQTlx?=
 =?utf-8?B?bWVJMHFqc1RaallZUmRlUDAyeHpXU256YmtqNE5UY1lCS2c3NFRna3pBRDZY?=
 =?utf-8?B?TDgyc0hFd2pNc2VSRUttWm1sUVF1b0w1ZHNOcisrU0F5alBEK254eGlIZHFP?=
 =?utf-8?B?KzRlbGtKNGdBZHhCQStDYzZuUmZGTXpNUGZENnJ6N2FZY3RaRDZQUzFJcHNP?=
 =?utf-8?B?bkdDZEJSalZIeFBheVlWbjZwR2Y2S01yaG5ncFBJM1VqcnJrTjNVV0ZLaVZO?=
 =?utf-8?B?WkdadWJLYUlieHFUQmZKZnpMR3JQZG04cDZCTDdUaHF5dXcwQ21KenA0aHlC?=
 =?utf-8?B?QVpwVlRiTkZ6eXNRSW16dUFIVWtyQVNKUTVmM1Qvai8vSTNJQUxRNVBacTFl?=
 =?utf-8?B?dEpkZDEyNkNzT3pVUjhjRGtpM3g4Ymw0YkRvZ0ZqWGplblJNN3NLRUMwdU90?=
 =?utf-8?B?MDhHMVU5TkEvSjNMQmNBYW5uOVhNNUMwMzBSVXNPZGpEUHNjS0crbHljSGl3?=
 =?utf-8?B?Q3luck5xTVBoNVY3dm9paTNPdFJlRUt1NnBEZVYwYXV6UTJ4VWk1LzRpZUk4?=
 =?utf-8?B?c3NlaEFaazlFeHZsL0JnSXlaRVkzM0FwWkxFd0cwUnExdnc3WUFmNWpJWGt5?=
 =?utf-8?B?VVJLOEdVcnJyNWN0WkdWQXhsMlRQWVJUTStxSXF5RWhySlYvTHA0bmEzaXJB?=
 =?utf-8?B?dVprUVU1M0I4WFFyVmVtN2cxMzI5Y1ZEbS93NmtJYlV2ZXd5N3BDTCtwcnpj?=
 =?utf-8?Q?r4P7+xHuBR4keMDY413zGc5LpG77Ii0i04Hrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzN5Q2tTNWVvODh6TWpucnJSL0JCbkRzOGZQSTBwMWM1NS96bUM0cktaRzc5?=
 =?utf-8?B?Mll1dHpkVkY3QzJLaVhpMW1HWjlXUDBaaEZEN1dIVDFjc0FrV3R0bFVUNVZV?=
 =?utf-8?B?T3ZFUFhndmdKYkc5RTFGZHVQUGIzMW9qMHRPdjVsektaME5vY2RLOTZ4NkJt?=
 =?utf-8?B?d3hmS0pyNXBKUTlxZnZYcGhLOE5OZmUwQ0txc0dJUGdnQ2NXWCtUOFQ2S2hT?=
 =?utf-8?B?SkxEb01EWmZXSU1MR0ZVVnVFUm9GTVJXN0tEaFRxM2VFTDY4Mk52UzFMZzJT?=
 =?utf-8?B?LzUvNHFET1g3OHpzUzk5WVlQRFlWT2N0RUtlOEhmcUJZK1hYMzRPY0xoYlRG?=
 =?utf-8?B?Um5vUzBuZWxsdUdTdnRaOGhKaHdLM2hzOFBzcStKODdPS0dXZjh5V0RTRGtW?=
 =?utf-8?B?VmNaYytsZE5PVTdvbWsvb2lWRUh4VlhPYmRMemRTQnRhMGdPVGY3NWNYZW81?=
 =?utf-8?B?ajVhOThpaW1yY3NDRWFWNUsySzB4aHNCSzZnOU0xOXR6amRlRUJCMVBzS1hY?=
 =?utf-8?B?Z1pXTXM4NDRsNnFKa1FUTTZoQk40RS85ZDhhR0YyZ2lmVmtEUlZwSGlOYm4w?=
 =?utf-8?B?SWZINnpnelQ5V1Y4Tkt3ajRDVU90WUNFc1Q4ZnFqV2hwVUh3RTF3UlJwWkJZ?=
 =?utf-8?B?MTNMRnZnVjZyaEdka0pPNVhMRFplSnEvZFVxcGhMdllFT21KUHJPWS85Uk1J?=
 =?utf-8?B?ZGhPakgvSWR5WjNjMVVJR2I1dmVwTFZGM3hpZndKNWhtK3pJR3ZYb3ZkWno4?=
 =?utf-8?B?S3crKzN6ZTdrdjJKd2dJdkZzUGZMMWtVMWl1RlNubW9aMGRJV1E1OS9qd1hx?=
 =?utf-8?B?OVphRDJQUkNIa0U3cWhTcGRFNEl1ck5YcDJCeUNtWDdhbFhOTEJ4bmNJdWJx?=
 =?utf-8?B?WDJmc3RUbjFkZ0p4Vm1NOXd5UnpKcEFtTFNKNTVKeHQzQlZzbGE3UUJlZEF0?=
 =?utf-8?B?eFo1R1Y2ell2clg4ZUZpOVJPUXhJU2JPV2ZrRGdlc2FwS3dzaHlUdEY1V2NB?=
 =?utf-8?B?bURaOUo5SjZ6RndGa2swcCtiRzhjUVdJTzZCRTJzbnVaVUovUHVTdkkvZThs?=
 =?utf-8?B?NUZ0NUxMczBlbksrbGQ2a1JOUGh5S1FsOHlTbEtDWU1uaFJFMkZTNU1OQzhm?=
 =?utf-8?B?UVM2bS9TcGtVa2g5T1RwVi9rd2doOXd5eEdkSndmTzJFS0lYd1hTYlR4dkdq?=
 =?utf-8?B?ajhzMUNIS0wwOVZkT0o3Tk5lZnFLZ3FERnNXQTJCbmFadnYrU3E4N0xzVWhr?=
 =?utf-8?B?YlhCUCt2VkVmN1JSeEozSC9XaERyNXJCZFBoUVpNT01mNUR1aEY3aVV3NThl?=
 =?utf-8?B?c28rZlFIZFJTOXN0SzJXTzI2aXVCT2FPZjhhS0lITjQ4SE93S0pxVkxqT1RB?=
 =?utf-8?B?RGgwWWQvZzI0enZ5WVdzZC9qdGhpZTgzaHlpQk9ERld1ZnhrOFIwa2FESzQ3?=
 =?utf-8?B?MXBocHlXMTRzT0ZLSXpidGJBNkM1UU9OY0haaUNtaGk1aDlid0ZhYTd0aDhL?=
 =?utf-8?B?eUN1OHZMbW5zRFRTekVTMUlIQXdXbXBYTmVsRmsyUTFSMFlJUHF1di9LdGtl?=
 =?utf-8?B?UytycXErZjhhdndsSVRZZTdGRnlBYzF3OUFDby9CeHRYVVgwMnB0UEdqcTAz?=
 =?utf-8?B?UmVLMFNhaS9Kc3RNRmFJby9PcUV4eVhoSFo1VTU2SXhXOHQ4LzJOUVNQK0pI?=
 =?utf-8?B?NE8xOS9tTjNqUWg2WU9GMUZ4QUkyRVh3alowYWM4d1VIRW9WWnMzblFkOWor?=
 =?utf-8?B?YkhFRFVpdEJlS0QyY1ZiTFl0RXdaV2ZsdG1LcXViYVZJejVkRkViVmU0WTRm?=
 =?utf-8?B?cllrNXBZNGlhZ3dGV3JCSFBYQXVXT1Y2ZlpzWkdrdzJOblEzZzN6YWQ1UXF4?=
 =?utf-8?B?R2VmM0c2NERqSXpZekJGME5XODBDdDk3VVZtaS95UlpjeDB3WUUwWmR2bmZm?=
 =?utf-8?B?bUtBcklzUzBWeVFZRkN0SjNQOWJlY1NGYmhhV0xYOGpsYkNXOUdraWt5a0Q4?=
 =?utf-8?B?WVRFV1pCZVdDQWZTalJpU21nSkF5MEdoeEdFeStKcXpOQ0JaSnZBbzZKSkwy?=
 =?utf-8?B?ZFNTWmx0TFhYQ29jbkVQdHkxQTVsUk1BYk1RbHFWcEJjTEE2a0hTQ2t4NmN0?=
 =?utf-8?Q?lfs/UesAj2RbsCgoAvEOv6A7H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3af5d90-f404-45fe-6639-08ddc9f70836
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 14:41:39.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvC0xbApgkaq/Y3bypgrlpznsJ8jDlQ7igYS8/pUddsgcauONoe4mlHP9kcD7kzqd9NQGa+5Q5f6QSbn64GiXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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



On 7/23/2025 7:38 PM, Raag Jadav wrote:
> On Tue, Jul 15, 2025 at 04:17:25PM +0530, Riana Tauro wrote:
>> Certain runtime firmware errors can cause the device to be in a unusable
>> state requiring a firmware flash to restore normal operation.
>> Runtime Survivability Mode indicates firmware flash is necessary by
>> wedging the device and exposing survivability mode sysfs.
>>
>> The below sysfs is an indication that device is in survivability mode
>>
>> /sys/bus/pci/devices/<device>/survivability_mode
> 
> ...
> 
>> +int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int ret;
>> +
>> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>> +		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = init_survivability_mode(xe);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = create_survivability_sysfs(pdev);
>> +	if (ret)
>> +		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
>> +
>> +	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>> +	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>> +
>> +	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>> +	xe_device_declare_wedged(xe);
>> +	dev_err(&pdev->dev, "Firmware update required, Refer the userspace documentation for more details!\n");
> 
> Do we have it? Or did I miss it somewhere? :D

fwupd currently implements it and they have a generic documentation
and https://github.com/fwupd/fwupd/blob/main/plugins/intel-gsc/README.md 
intel specific. Once the patches are good to merge the dmesg and sysfs 
will be added in the same location by Frank.

I have mentioned "userspace" as there can be other tools in the future 
that might use this. There has to be a message indicating firmware 
update is required.

Thanks
Riana

> 
> Raag


