Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70182B34592
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 17:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B0E10E0B8;
	Mon, 25 Aug 2025 15:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="r1/DCBDo";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s7kcunYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDEA10E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 15:20:43 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PEL4ZM026271;
 Mon, 25 Aug 2025 15:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=vKStDhVG14fuTMZIbPmtAxa9opa4eZyamB/A3yI2HAg=; b=
 r1/DCBDojXAxPS9E8cfODX6X55xe9wHa91kpdOdfu61Ez5LUf6neOs582HyX9/7V
 gTctZEYQ6NLL/Sx1JDFubifbiRhFhvcxyuvUB5c6gbBJD1J6GwSX6HYaaMcSE+8E
 llsAH+WlMfyt6RPEfgmEKITJvcE+qxjEa0a8ffTcMY02q1VIVVhZ8NgqHqPDdMI2
 udFNYW13RZNTq74ZmEX6TaxQJyrC2Fu55lrP1gmoZyvE5Td2Lnv4Yh3ayakozbMw
 Riz4d9I6Jxjsg36beR+lvel2nyjgxHEm/XXZIcFtbOLTyJ1amJqpHP9m57INSJop
 BMUvcCKK8rc46WbJDi+OjQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q5pt2jf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Aug 2025 15:20:31 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57PE1Z1g005115; Mon, 25 Aug 2025 15:20:31 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 48qj88kr7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Aug 2025 15:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J42YGcysuZejOHwdscEVuEDrMXSlt8wRCjMCtPI4sAJK6SLnmbO/lncuqKAPocyoHporb+zs/RWLDc3clgTRaKxg5FEPGlnZBaopL7SnUn+iL61zw6vE3Zxpxc3dtWPjkOxYsz9dAEUlYnniq0XRZUsHWLNyuwFOSTT+rzRbU5MGGhehgcnTSwgmDJJ8tY+6ueobEY2a2BPVVvPs69ttmo2hMkiwFe93StHtikwQjEWSA66rNOTeo2mSuvsC2b8MUqcsWTiMMJmwtl2ayGUvdqJvo1u+HYPl2UnnZ39/SmSjtTnNKXACBTmnapb9LYycpln7Qj71AI3ps63pl+rUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKStDhVG14fuTMZIbPmtAxa9opa4eZyamB/A3yI2HAg=;
 b=pCns8zkIAaITqrtwFity5KhcGd4yIkNqh7Yxl5BcKXbYxaYpvlwfxnfjc3LuJv/8zkFNZMYwKPaku78a8bYOdXJYoeLHM74JVe9bt9S9wL8JHQlbHpzwY03LCYMSrIB+ZiKuSGmvpbgR5tSrk7E1DMelxbajiE5ZIup2iCzrt6T9iASOmeyN92EDbpvihY6mgJIjE8GZShcP/BCIeYm9LhD+IkZAG6TT/D4ZSyOgQ+pywbLLZVLReb/pmVQsKlR0Jc+4B9XLfjnLe0mGYuahwZzJlh9Q0X9eYRO/bXb2FPrFQk8EHFgjVDE3aypWxXr7bXreGBYQLfx7rf9h+Gjo1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKStDhVG14fuTMZIbPmtAxa9opa4eZyamB/A3yI2HAg=;
 b=s7kcunYW7cqdakbW5WUhDFTqysqSzBuAjB8Bg/sen4RF3fE7TJ+LbZ5ePU9rD95qehnM0YcNOx42oDMMf2ayVcbvFpv4N9VnGj8MCOzQ0+ZVsLniMQmD5B93dMgDThBma9x+1wSNQKDfwcLwrHt+y7k4HzqWggCUzx8XSlh88PI=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by DS7PR10MB5198.namprd10.prod.outlook.com (2603:10b6:5:3a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Mon, 25 Aug
 2025 15:20:28 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 15:20:28 +0000
Message-ID: <453e4d9a-b798-401b-9bdd-23786f693baf@oracle.com>
Date: Mon, 25 Aug 2025 11:20:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] DRM IDR to Xarray conversions
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250821145429.305526-1-sidhartha.kumar@oracle.com>
 <f69669c873dbb99c239e9f2ddf154e983baa61e3@intel.com>
 <e80a3fd9-56ca-40c5-8ac8-237ce14cc79f@oracle.com>
 <aKiEUlldVf2YazK9@casper.infradead.org>
 <586cd833db27544321eb9521720803e148519557@intel.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <586cd833db27544321eb9521720803e148519557@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:510:23c::17) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|DS7PR10MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d30e8d0-8550-4c98-e72c-08dde3eaebfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3JDQUhCL0gzYkJNWGZUMm14STJzaFVodXI1bHAzMlVuTzAyeXNyak9rWjlN?=
 =?utf-8?B?UFdDZVI4cmFuNjVSeHUreERNZGpZWmMxUEV6Vk5XRmlVU3NSak5tWHNCZUJj?=
 =?utf-8?B?d1pxZnhtUGdoTUR1SFFOWmYraFpQUkVieVpXdkpzdzBWbzFzR2wzL0FwZnly?=
 =?utf-8?B?czRNbm1LQmEzKzJlTkR3OUNKVTlMMWd5RFE5SlArZ1UyL3p5ZnNKbG5QbGRD?=
 =?utf-8?B?QWlZUXhJQldDUlB2OHV0VmZxM3lDL1Fmbi9kY0xrZCtVZVNrS1ZSU2NuZmxI?=
 =?utf-8?B?M1pwWGRzbWdJSGZRcllSMUJDaGx0QXl3dEEvZllPNDdTZ1k5YTlmRHFMNjNW?=
 =?utf-8?B?bThVU0hUdkRuM3dyQXJXQ0NmaThMRFNrWEVLRnJJSmExbUVDd25YSlV3a1BL?=
 =?utf-8?B?Y1M0WjRVSnd6ODJ6WTMyL25lb1JtS0hxNjE0by9ZMXcrbTFqbSt2RldBT2JC?=
 =?utf-8?B?MFNwdGtzK0hMWnRVVDhZblZselBadDFHR1FsTkFDQWlQeUxjL3ppczAvL0lT?=
 =?utf-8?B?cEJ6QmVDbzk1VDZUZUlvWW1qTlVwWlhEd0dhZCtrTisxenEzcEh6WXptVkZr?=
 =?utf-8?B?QXJlOUZVQjR5ak1ISTlBMTdDNGtNcGVlN1ZLcXdlVElwd3dyUnhCNGIwaWdk?=
 =?utf-8?B?NGdldnJKbWc3RWNDME5CTzAxWlZ1N1prSFBjZVhJRjU3dDU3UTA4dExpeDU0?=
 =?utf-8?B?cmdldi8wSHprOFdWSkE5eWFlR0NnS0g4MnREcWVmWXlQajNGc1pVQVhjM2Nr?=
 =?utf-8?B?aG9Mb2hGZGJqMnhwc3lXb2wyem9JU29xVU9yWVh5dEo1ZWNtWFl0YTBKVnU4?=
 =?utf-8?B?VUkwOFRMN1JUdjNEc0ZqN2JvOXM5U3RzdWpEbWhpdklyckg0Q2FWWVc5TlJn?=
 =?utf-8?B?WGxtZmY5N0s2aDArOGVtRXN5YWdFZ3dZaW0ybHBnVFlHalN1RnBRZWxEV1RB?=
 =?utf-8?B?eGRMNkpIbHJzTE4wNHVwRHJEWll5Z2ZScDBYVkQyNkNWSUNGaVpHVTd6cCtm?=
 =?utf-8?B?amJBaC9Semo1RkVadU16TWtyakJHdHRyVExYb0h0U3MwQ3NJMzlPOUV5RzZF?=
 =?utf-8?B?YnF0eXdNaGJUN1NuOTlpeEJOclIwaGRNOExDVzFiVmZhSXdyN1FKSy9LOE9m?=
 =?utf-8?B?d0hHQlR2N2t0NHRqVnd4ZlVvemRtc2lsZ0RNM0pKbVd4TTBZTWFzUys0ek9T?=
 =?utf-8?B?Nm5YWUN2T0ZEdTdEbHljaXRUM0kzVkx0WVFxamI3ZGxENWsybHJMYWwyY3Iv?=
 =?utf-8?B?eW8yWFoyamhIampwMld5VUgwNndLeTdyQmxwS0Z0ZkxUUDNpeTB1dlkvNVBm?=
 =?utf-8?B?c21CU2tLRXo0SnhjRHd6NE93UDVRRXdaRUV2b3Ezb0h4OG5oZEVITjNGMEI4?=
 =?utf-8?B?eVFKc2FLVnU2N2dWMU1CRFdmWlJJc2RxczU4SlEvcXdwM00zbmtFcFZ0Rmp1?=
 =?utf-8?B?ODJZeVVVY1RQSy8vL09TT1I3UXdGQStWaVhFeG5qVTI2ZVk4c0NWY29xdWZL?=
 =?utf-8?B?MGVzeUpYd0Rmd052UUMyVStEeWZYWFNqdHo5OGg1R0I0QmhVRlFPTmFVQVBZ?=
 =?utf-8?B?WUZoalI3Z3NFWWJJSVpYMnBWdzdnZWxpeFhQMTVYSmV1U3VuOW5YcllZKzlD?=
 =?utf-8?B?RlpVL3NRTSsvamNpbmducWVZd3ptSjFrV3lXT0t3a1BFWHlWdTV5a05EbFV5?=
 =?utf-8?B?c0k4bWJucWIwVVQyLzUyOG4xUG14T0owQ1RqVFQ1dXNEU1dlRDhUOS84Z3pt?=
 =?utf-8?B?R0d1N05NSWRhYTFMUVJwYmdCdlFGSWdrYTdHcEZ2S2t2MEFOOWN3YmRrRXlI?=
 =?utf-8?B?T044MGdTTWV1Z2lsZXArNGVaa1d1UTZXSDA2QklmTWU4VEsvVnhTVzNFSUps?=
 =?utf-8?B?a0lUMXNRaTFkZ1BuckNoTFE1cXE3WVZCNmZYZEZQZ25GK2c4Y3h0REdMa3JW?=
 =?utf-8?Q?ZWBX2Xqpl1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5113.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0F5cWxuSVI3K05pTlBQcFdvemQ0eDIrU1lJYi9pemhoRC9EZmNHV1lmYnpC?=
 =?utf-8?B?ZVJhVzgrMlFoclQ2VWxybVZ3bUEydGtSS285TVlrWUh1WVE5MU04cUVHbnBU?=
 =?utf-8?B?WE00WE5pVk51S29sTGViL2w4ZURWeHl6TGJIaVZBOWhVWjFFdmxycTQ2eGNW?=
 =?utf-8?B?US9FdHM0UzVGb0hNOHJzNkdLdHROR0dHVjFEb2FOdjk3WEtJWG9DVTZYd3lK?=
 =?utf-8?B?dVBSUUxucUl6ODZIcjNORlhzQTh3RWQ1eUZnUXN5TXA2VUhIQ1RDVjVLbUlP?=
 =?utf-8?B?QzRlT1lBTS9tbGphd09la3VqVmxFbU1xbFRWdE8wNDg3aG5TTWtxZWhqT0Fn?=
 =?utf-8?B?MFBVeVV2cnhpYXJNaDZtUU5ERmRzZUJka0RXWVREd251SUNRYWJQM1ZTbHND?=
 =?utf-8?B?OUxyT0RNdzh1SUVUa1Y4ZmwvZGk0a1lRanAxVjlmV2NudW9lU08zSVgwSXQ5?=
 =?utf-8?B?T2RBWHVNRU5nWkpKNjlQZVd6TjY0aUZoY1gwbENRWTRPQjVLK250NFQzK1RM?=
 =?utf-8?B?cWhrQUMzMU5iSlhLc3o2ZUg5U2J5dTRZd0dCRWVvN1FRSVlpUUdWQ0FyM05v?=
 =?utf-8?B?TE5UUHJwUFQ1R1ZLQWcxMWFQWDhHQkxuQXRXNmZwbTRlSTFxSmFOZGM0eEJv?=
 =?utf-8?B?aDRBaEtCdnAxcUkyVUIyM014MGF0a3pURjRORzNhMzZJZWppMld3R0MrWFVO?=
 =?utf-8?B?RzZQd3BQazFmZ1JLMjloOUUzcVdmbUgvL2dTU2JpVzdNQzhVWFN6czlxSG42?=
 =?utf-8?B?bUI2S21oTWluRmdmZUROMTIrV2R3OHZ0aC94RlptQVZJSDNCZ1dWdGdpeFJW?=
 =?utf-8?B?bjhxUDlmTjBBR1lpV2FxREg3eTFuYnNJRjdWa1l6ZkFmT0k4VmtmQURXQlho?=
 =?utf-8?B?QnMyNXF1em5aNlhCd0pqRXhqSDhQcWc5Nk9GWExwbk5zWGlkdi9RZWR3TDVZ?=
 =?utf-8?B?ME1GRGc3elRQSUZ3ckd0MUJNN3c1N0RrclFyYnVueWl0RHVUaWQ1ZTlkSXRN?=
 =?utf-8?B?b3FqMS9KZnRJYnZ2WE1rSC9kc2xqNmFPUkhDSjJnUENXTElha1FuWStHbllW?=
 =?utf-8?B?ZTNsQ1RxaHNIL3FwdzdzdVVxQ3VRWUdBQ3lEMFZEWE1mckluSnVkSWtLT2lj?=
 =?utf-8?B?OTlRWnhLT2JhZkRzWWppNVgveXd0VmxrcTVBRGtBOFcrZWJoZjIrVm5semdp?=
 =?utf-8?B?S01iZmlUSSs3Tml0M0UwQkhyMGlRQUdiek1HZ2FLMkl4c2NtM09sQjRlaWR2?=
 =?utf-8?B?VzlvMVUwYjRqVVVDamRuMFR0bWYvU3VpcDB5K3lDVGR3WlFEVGlLUWdPdG9a?=
 =?utf-8?B?bjNiWkV0RTRVL1k2czhkdTJ1Ym9USDVvc01RNVFZdWZnMzZrcEt3U0VqWmZO?=
 =?utf-8?B?MW1VN0YwZHo3TGNrVzBud3lWZldYbjFwWm9zdDJXcjB0ZTZFTTZBTjlFZkZV?=
 =?utf-8?B?OWtEcnhZb25sam1wY2N3RlFRWGN4cXVzQUFZZ3FPQUhxMnVCZzVvUm5hYVNn?=
 =?utf-8?B?djltRFVTOFgrN0M5bE5VOHBSN1pXNVRSWGZqaHRrUnNIb1FoYzFHTGJZOGRw?=
 =?utf-8?B?VkJUSUVUQ2dOMUdRTHlYMzhmMGJnK0ZPa3FpOHV4SXBqTnNielFKNytqNUxE?=
 =?utf-8?B?RVNCY1hDYU1CYkdrUVUyUzhGNGVhcXFOYTgrZmNZOGZBQmtkTDNJaXlQL3BZ?=
 =?utf-8?B?RlFPaUJIcld3Wnp6K0VQSDB3S0NqOVhrSGhTYXpWdXNEbFNZWXVmNEhkS2cz?=
 =?utf-8?B?S2E3dmZycFNUL2pMNzJsUkhOVm42Qkh6Yy9Cd0h4YStWNWIraWlVTVA2ajhZ?=
 =?utf-8?B?Wkgrd0ZWU2hjRzBHS1hIZnpSUFJlbHZUYi9Sb2x4VENoak9RS1lQVXZpVkJj?=
 =?utf-8?B?Y0U2N0pXcHFUOXVkRUVGOHBHNEpkQVpWZ2ltcEpreUhLbVRJSzNlbzAwL3Qy?=
 =?utf-8?B?enFvUVZUWFRXMVZ6SzMvWU5RQVJkS0RWcVFSVktvcWM4N3hheVk3UXltMkE5?=
 =?utf-8?B?U1dmM2FuY1ZOLzlaT3ByZWxZcmExRnNuQ2RFbndqVE9TLzFTb3dwb3FBczJw?=
 =?utf-8?B?UDlDNi9VSndtd3cwTmJDSG9NZ1FySnRwbGFzTlhjMkNJWHVtTTByZG5sMC9C?=
 =?utf-8?B?dlhQKzg5SjNOWmtncFRRSHVLWVVoRzU1RlYxNEVMdVBSUzlvVCtTRTVSZ043?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8tqNma6AVJJ9EBGhzvThivDSODDxEDBHvyISmmQB4i/MXUVsb7uqJK/p9RhX7uPkopI3fKSQSqWG7G+rx+tO9MgtQ+3XaBo0erHLrADH0eaM8zHw1tPJ2JFaUMTtaRc16wsQm+Lsyzv7zF9v6qmUz69ZsMXQ45gv5StDuxkRlEZTWjNjpLoLKVNtvuq/ugdO3Qakx7gXmc97d0Abkh5+pj8eg4ird5k5xJSNHorou3ueX1YIDbf34Pta3NTE7YQA6hKn4A75YHjDwjCrvHSnWudXed1ppTY1Xl/9gZ7PPMoAHSiYv0Wi7ZHEz/AYgvuZXFpQ332O0uHhX/MGFtPpwTHSd7anVoQN8vlZTBjn9nU1RrZejeTLu16FfstUNxOHZCXD5azeyfXbtzwMeLEelY8WI6I64OBTDDl+DjOPnG09TbJTjL9/xSm+NR81ufRyMzE3w4N/T5uAVRXQkZvOBZt4PTMQmMBn48RoW3YYSPpIrQoPJ1ixNGL/nyJCdOK/0R+wSEZBSyPl+qAEc7wpUcMFICdSsivEVIHo0acz2jjbHtYrH/vS7BUSB4vaS4NbQ6SuAVOJMCUUvWifotonpeQfsigkLNMTtZQrogpbmrg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d30e8d0-8550-4c98-e72c-08dde3eaebfa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:20:27.9996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TT0CTZ4ShS9qD/mRxJC6L7I+FdJvd33aEeJoU44gKtDOoSo0gC4yv5BOkGEISgcNjin2aU/Wr0pBH6hux7jzK7jaPuAZ3PSdz2dtEHsJbhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508250139
X-Proofpoint-ORIG-GUID: kDgwwyatsX65mnyTO5nLLdvWY6D9h6J2
X-Proofpoint-GUID: kDgwwyatsX65mnyTO5nLLdvWY6D9h6J2
X-Authority-Analysis: v=2.4 cv=EcXIQOmC c=1 sm=1 tr=0 ts=68ac7f3f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=ucFPuhCDKb2rmmKE6_UA:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMCBTYWx0ZWRfXy9pys6CaDD+F
 11wYBenfinrqWZCdKQvp9wnNdHKaTTfEVvm/yWQ/tsTos3FcP5UB6vSzgKNMZg7ENHniGUkqfEb
 0s+7eFK6uP9Ha2TPOCziOU+g16O4f+fTMqpPrm4WIdu8m48KyTOE1svHv1F70IeLRV8tXD0zd32
 dt7CbVA67XTdy+XjxtfzPuNYkricNqKbDPREKx3rT90mMt9PFd5Vz+Ku2Jt18lV1mVGqOxLZ/mi
 eKitFVPYjWwAZmR1A3Ofkks+W94tBzC936/x0daukS1O+o53lO1JfklVDFtX9aOnC2JYdxo0R80
 C7/BaswNDqr8VMHsDs/XSr1jymxtB9Ap2AHnze21YehYRMGVYUtGU9mCu3q5OtvHNTa715QFdR7
 A4Vk2FELXaHVoDULD/FT9+Z68oz0gA==
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

On 8/25/25 2:52 AM, Jani Nikula wrote:
> On Fri, 22 Aug 2025, Matthew Wilcox <willy@infradead.org> wrote:
>> On Fri, Aug 22, 2025 at 10:36:24AM -0400, Sidhartha Kumar wrote:
>>> On 8/22/25 8:33 AM, Jani Nikula wrote:
>>>> It would be great if the commit messages mentioned whether the
>>>> identifiers are expected to remain the same in the conversion.
>>>
>>> By identifiers do you mean if the name of the previous idr variable is the
>>> same as the XArray variable that is introduced? Sure I can add that in a v3.
>>
>> I think Jani means that the actual numbers assigned should remain the
>> saame after the conversion.
> 
> Yes. Do they?

Yes, they'll remain the same after the patches. I'll add this to the 
commit messages in v3.

Thanks,
Sid


> 
> BR,
> Jani.
> 
> 

