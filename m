Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F541B34DA8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB0010E286;
	Mon, 25 Aug 2025 21:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTsYA116";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB39E10E286;
 Mon, 25 Aug 2025 21:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756156153; x=1787692153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mgyxN7Rs/2YvJE9oLpct6rwGqG1Ddlf3+Dj7pwgLueE=;
 b=PTsYA116/4Rfm5cLZu6RiiCSfS8+xWcMJwE3YazgPV8VdXPdrJtOCc6L
 PaY8gX8L/VKe1r8EXX43KfRhxkNnEnWI3mjWt46eqWILx6VwPo9ZuLpc1
 a7etnQ0e6YVDK6A0nNhLfA4SVEs9kxUd9WjweNHs02CeEW3CmE2dAghDO
 kj/LE2BFVTDHOg0KBpm+cGF+eV4IXAvpkUzehh8LeFb705I7qDJ3pm9lH
 lZChgk/n4Dm4xTtvL+is+HE0aR8DOd2klpOnOhABBFY9dHIJt8IH1dhiA
 GiVKB1jIpI1iem6vucltb0H9X7YgW3yQUkvrdEfaiod6FY3pCgQvhnA7D g==;
X-CSE-ConnectionGUID: ARYwTvGDQbSroK4ntbU5vQ==
X-CSE-MsgGUID: oqJueHujRl6Irce7XEozCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69093935"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69093935"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 14:09:13 -0700
X-CSE-ConnectionGUID: 7FHLxNBiSruGtNHci92x6w==
X-CSE-MsgGUID: 7OR10S13RrezxIxzrtG/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169330920"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 14:09:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 14:09:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 14:09:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.51)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 14:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXBco8Ql3jNBAEk765S6MUSMqy0FP5W6stjvrmmNGk6Hj8P1MzRbZW61WEFflcGq7sm4efSl2rFPT63AS816G+eemi9SVAF51uKZr7eiqj+kJbVcYjsVVNJSQ3UZP5b6AfXdBsm936GTfxNUnTjtpxwai2LK0Q8s8uZ/xQGQ+N895CI4RIqa1YTf7opV47sPO/yNRFZbwP7qQLFgJhfoadye5mhArf47p3N7eZPjxAgumfzBdTTm54FWGPw4Y/nlWqWlxMEhab9DwH4jBiiWZR08kjBxxcxW38vLx0tkqyFhAT3J/gx62sv0sIf1BCeWZmZ4JZotHnqPJ54TY65qXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHZmW53/0E+VsV7iCsDOr9WkUaFG5imf98OlOXms/6Q=;
 b=Uzmq2IRJyA6Qk2d91nremTvueABnTCNxV2/AFCEfTx5wvrOAirAyTcSDlv+VWt82RNPqGjbsB4yMIpMs8ABqE9NiPkNV9WA5rkBSsuqJJllRk0aTuUj50jYRuMYwPcJkAh+JoND0lk7tsmqvnwOz7ol6qoNwzgRPRv5SoJ0eU4ysx+Imo8WAt59JWy1cWFVUBJtiQ9YEXYaMKkWHSlfgyaqGvtcweDMEfEC6iDNhVX6UcxcSQbvECbxby8mml8+zuZcyLXIep0JXV9mXsHrSiY1059XOHjzFDYmxlxM4Vb5gc4qrZj+eo7fNGBaYrgclykaunGMKZZxTP1Vw/XbIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 21:09:09 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 21:09:09 +0000
Message-ID: <5714a47e-8b36-491a-a2e7-5af89491b6a4@intel.com>
Date: Mon, 25 Aug 2025 17:09:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/guc: Add synchronization on interrupt enable
 flag
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250822141356.3775250-1-zhanjun.dong@intel.com>
 <lmfc6jvlzgmd3xy7ed7rwk2yp66o572hnp7wmq7t4qlenzwv56@izbw6hrdkfa2>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <lmfc6jvlzgmd3xy7ed7rwk2yp66o572hnp7wmq7t4qlenzwv56@izbw6hrdkfa2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: abbcd810-26ff-4ea1-6740-08dde41ba238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejhGNS9maFZ2a1l0Tm1OVm5MY3pPOXNkQmwzMTFBSkdoV0NmKzlhUlFFOEpN?=
 =?utf-8?B?Umo3K0tiMVI0ajV0TGJqWkhTdzkrUHBaS3pNNDNNVGVtWGRhamNUSmVESlRl?=
 =?utf-8?B?UEk3YVRUcy81bHJLYXNGNWhGc3dDM0RuK2o0SjhIUFVjRjkwRG5KYTVVSUR0?=
 =?utf-8?B?aWFRTkwyZm1hZ0JFTFplNXpMSklxeW9kZVBQUWtMaEtsUUV2L1BFVWNlZ01Y?=
 =?utf-8?B?OU5jSTZrSHVFWWhyYWUwVHdkYjYxemJsWTNpVHJxY2x1ckF1WjZQSnpROVZJ?=
 =?utf-8?B?RnN2aXBRbHlmcG14T0pTeTluN3ZSY0tBQXJNQmVrOC9NanpkZDJVaFJrcVdL?=
 =?utf-8?B?T1hFSlllYnJ6b1lsMDRUMGtQaDlwRmtVSkpMTitCcVpkUlRldUZ3VXZDYXFv?=
 =?utf-8?B?Yyt4aFFDKzJTZHozcVdWR1NGS1NnakNtYUxkTDB4QjZhc1JvbzRwVURwWlFy?=
 =?utf-8?B?Q3Jza2J1ZjFadUxrbS9NYllCbVRDM1FMc0JnWlB5M1BQeFZLRlh2VEFCTGNX?=
 =?utf-8?B?c2VaQ1VUT3MybGJ2eEhUbFUxNUk4NEJXY3NLNHpMNSs2WHhDd01jdDdTNWZi?=
 =?utf-8?B?MHlrUjlEZWhHdCtNbTVOUldVS1BsN2poQ3h4Tkd4Qkx5NFVPUENhbnRBa0wv?=
 =?utf-8?B?UlB0RWw5L040OEZSUjhkblY2ZnpiMDV0RVZvYU9SanNzNThZRGZtM2s0RHRK?=
 =?utf-8?B?TWx1aWVIQnJ6QVBvVEY3N3I3d0NmaldaUTQxa3lZN1RKUXhidFpOS2NZNXlL?=
 =?utf-8?B?MDdoWXB6eVMvU2N1VktIeDRQMXdLSUFVTzR2RzJmMzJFV3pXOGc4T1MvS0Qz?=
 =?utf-8?B?WitaMkdmUTJ3NjEydEwxb0pMcUEwWFJqcmZxY2FwTWpIL0x6UllvOGVKWnBG?=
 =?utf-8?B?N3dWRHlqdTFmWUsxZVBlNGpINjMzVHRNMnVBYTJENHFMbUk0WUg1MFBlMGw4?=
 =?utf-8?B?L3NPQUJOdkZCOFJLVDdpaTRpZXV1NFhUL2hxdWtKS1l4cHM0MHZRMzFEZWZw?=
 =?utf-8?B?OG9OYlluUDFxUTd3V002L1VDOC9zTXhRMnduVkR5QnlLRWljUkFYa3dhSzNP?=
 =?utf-8?B?Znk2TnZ3TlJSRHBKaG5oWUhrVVE4M1lJSW1aNTFGTVlRWUxPSUEzbFpISWMy?=
 =?utf-8?B?UU1JUEVSVVl6ejRZaDhMRTMwN1UxeFQ3TyswLzVsbG01VWduVVZPamVLbzRo?=
 =?utf-8?B?QStGUVNkd2JCMmUwZVdFNlZKc00vUlU5YTZ1UnZLWDNXWnVQNE9ISi9xV2tn?=
 =?utf-8?B?VGdDOXA3enlyeTdZYVBacWhEakNYbkl1a1kxMFQzSVVxdzlScXRMWnAxNmU0?=
 =?utf-8?B?T0tTM0pEK04yb2V5MTVwTEhSMVAzVGIzUW12WTRKQWpTQklld0NuY0wycUVP?=
 =?utf-8?B?b3gzTUZseHdEajdhMVZSSXRMTmlNMkdLUnlIdGZaWDJacysxM3MrNk55T05Q?=
 =?utf-8?B?bDZtRnBsTVN2b3FmQUZERXRJR09qTCtpRUI3SzlFYXF4MTBBZmJUSzhuN3NG?=
 =?utf-8?B?dkhpaGZJZmVqRkFLcU9BLzRvNTM2SUtTaDNMSmxDcVZ4KzNKVDdycHh6WmpN?=
 =?utf-8?B?UWtKQ3V2ZnVHcXl2NjQrdldIV1U4bWh1ejZCMDJpaXNCbHZReWlzUmdoS243?=
 =?utf-8?B?WEtLQzhCMXNiUS9RT2k4Y0xjSzgwamVGelZSeHFWM21CcUtSeEtzRUIyNnNl?=
 =?utf-8?B?MXFmSjJDeEpBNmpXalJSa216MncvVUVVRFE3Z004VEl5ZlNFeUFweW9wbG5x?=
 =?utf-8?B?ajdhK2t4bXZLZTVHWjhqVndrb1JMNE1vOWNLWjFxT2l2MVJCVHNkeUNMblpV?=
 =?utf-8?B?ZWZSckdMR0tib09mMGxhWXF2cWNZRlB0b0ZyUEtxYUk2Mmc4OWF2cjVhcUxo?=
 =?utf-8?B?VVYrVHp0ZXZsVFhGZWJvY0dYdmdPRHByZkpXTmpQcXpXUm0yQjdncnNyUU1t?=
 =?utf-8?Q?/FUosWRecAY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHR6cnI2djZRYUNMVnJKdWxDYTNYdHlSeGRxazVwYmZMZ0VyNy9ZWUZjU0ZQ?=
 =?utf-8?B?OXU4Q1FBYTI2WWtJUm9BTmttTUhiSU9pTVJFc0l6VUNaLzU5WjFWb0ZtNW0z?=
 =?utf-8?B?OUhISlVaZkdFMXI4VUJjUC93amFyL21meXI3SEtEZzZXTDNKYjg3cGQrZ2Jk?=
 =?utf-8?B?SHM1UC9TcTVWZU0veUJwdkNlMFpKbUFGQ295cDdJUUxMUWw2L2QrMzRXVGQ0?=
 =?utf-8?B?QWo5cmVrUkF2dXVrak5sMTdmUTdySzVqNHpZbkxSQVJacE9WVUdxbkxFUVRy?=
 =?utf-8?B?S0ZRVk5DV1BzOGNwNU5rM0dsNTQrOGxvK2NkRys0aEFsMnFYbmFtVXIrb3B1?=
 =?utf-8?B?RnkwcGhENWNZYTFUWm5nSHVEN1ROOFliS1JZd3VEbnIwczJ2UFJLZTJXMTZN?=
 =?utf-8?B?NHRKeDl4NXFLYlNPYmtwMzVlNGxhZjZqeFNjSTRiSVF5c0JvN2F5YitOMmxh?=
 =?utf-8?B?TGVCVll3U1ExL2dIcDQrTVNTeWhJaEdDelJLaTd2ODBNYnpvbjgySWZBYVE4?=
 =?utf-8?B?SFZZYk5TaDBrdW1VenJOTUlqeThNSG8vQnVIUitqSXorWDNleW5lT29pMGJI?=
 =?utf-8?B?aWtNS0x0azBSRDI1eC9SL1hEWjBhcG1zZFBlM1lwTi9LNm53a0F4c3pHSnoy?=
 =?utf-8?B?ejNkMmpONUFEK3pnUEhoOFNkdEdXZHExRUZwRmdFdjE2c3pBZ0ZZVGU1aWtM?=
 =?utf-8?B?SWJEVmFwbm9OUTZIelozampFc2pnNjZZYU5SUWlOMDEreWxhb1J0QjRrbG9m?=
 =?utf-8?B?QTNQRWZTTWNUTHp1TE9wMTJWYmlLdGkzaUhFMjJaVXBUcFV5ZnFZVjM3YzdM?=
 =?utf-8?B?a3JyS21KT2VvZ3NvSkZBWjh5T3M2bzErMTNHRVVGZm4vU1cxcmxYTXlsdGhX?=
 =?utf-8?B?b3FzVS9kWWt6Vm9YZzZOdUk2SFlhNTNLMkRQWmZ4RXh0OVBIZEZFVGY0VlFa?=
 =?utf-8?B?ZkJWTmZwZTRMaU9BNGtuZjJVQTh5bXdDWW9ONlptWVlYOXZiNHpORW1DZjVu?=
 =?utf-8?B?N2dLWGpndS9MZ1RNRkpFK2hlUCtZR0RlUzJPc3lva3YxQllmMkVRZy9aUmpB?=
 =?utf-8?B?U2E1NjgwQlNDdk90R0U5RW95UjdZdjZoWC90L3lhQjN5dnpJUmN3dDFLUFQ0?=
 =?utf-8?B?dzlmcHQrdE10SG1PMWpNblBNUWc1NVd1S2dPNkQrUHFieUdCYUd5Mm5Hc20y?=
 =?utf-8?B?N20rWDVRK2J2SUt1VEFpSWYxZlBwck45bHpSalBlaG9vS1ZpL3dTS0JzS0Rt?=
 =?utf-8?B?cGlQZUl5UXdVMGdUVkdKbnVycUVVRm1mUkVSTXlVaHZ5bkFBWFdtRkVHT1Bj?=
 =?utf-8?B?ZXFkUWNrMlRoYjN4elFXSlo4OEh5eEdjYjdiTnRDR0lzdEN4eTZJYUNHSVI0?=
 =?utf-8?B?SHplM2w3ak5YeEY1a0h1TGY0MHVKdC96a09BVzBjVnR6TTRZNmFHNUhCRTMv?=
 =?utf-8?B?VDM3dG5UbXN2M3UvaE9zODlKbFJkT3lwdjdLaVJhZGpqdHRQd05URXNlbmdp?=
 =?utf-8?B?S0Q5YjBrclhhMXBUOWRBYm1PclNYMDNPY1hNcDZlTHlEbjF6OHgyUVJIdWpS?=
 =?utf-8?B?QUlqZW9uM3ZUMVN6UFZUckN0ZkJ6b0p1bkJTTHJrR2VtRmlzdzJscitwVVJV?=
 =?utf-8?B?V0dOUFNZUjlVOStnNU5YVDQwTkxlcEpPNkdCREdJTmUzaThvK1NYeTB1T29L?=
 =?utf-8?B?RHJzNSt2K0dRMENYelBjYWZpS05iaVVJc1FrNnU1bVNVYUFtZHgvTFZManBN?=
 =?utf-8?B?aVVvb01BeEZHVmFiQmdYVFJYKzNkaGwyK0t2blU3SWRBczJGaElySktmdGZp?=
 =?utf-8?B?UEtsUUtwWmZCZGl2MnBYNzVWU2tQTnpIRmR5OHpDRkRIN2xpRGJ5T1VPbGpy?=
 =?utf-8?B?Tkt1NjRubmY0ZGNUbTN1SSs2V1ZBUXJYaHNjek8vSVpZQzBmSkRienBGQVo1?=
 =?utf-8?B?NHMwcnkwV0k5Y0c1MWJZMlUxN3RpS3ZHTzZCMURhWWh6RXJTcmpJSHAwYTRP?=
 =?utf-8?B?L1ZaM0FDT3JWcUthN1h0Y3JQT01XU3ZxWkU2S1I1T0hXMkJHWEpQTnpURXB3?=
 =?utf-8?B?MDFucHVrS3Qwc3lIc2tISFM0REo0TU54MHhlUG1wcHRwOUNtV0R3b0xSdGRO?=
 =?utf-8?B?cnJyYTZGeUtPN1gvZjlKeHVzMnN1b0RMOVNqZTl4bzJ3cGdpZTN2Vk02RCt4?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abbcd810-26ff-4ea1-6740-08dde41ba238
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 21:09:09.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7OatOZoXT6H0yiIiDg9dliqHDg6a/cMEsc/Gm1856LSBDhDBRcQGKWZQ10U+opgLkf9ct9yZC8KjA/WvrxiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

On 2025-08-25 6:00 a.m., Andi Shyti wrote:
> Hi Zhanjun,
> 
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> index 75e802e10be2..21804eec8320 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> @@ -20,7 +20,7 @@
>>   
>>   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>>   {
>> -	if (unlikely(!guc->interrupts.enabled))
>> +	if (unlikely(!atomic_read(&guc->interrupts.enabled)))
>>   		return;
>>   
>>   	if (iir & GUC_INTR_GUC2HOST)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index f360f020d8f1..48148cb6cba0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -100,8 +100,9 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>>   			 gt->pm_guc_events);
>>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>>   	spin_unlock_irq(gt->irq_lock);
>> -
>> -	guc->interrupts.enabled = true;
>> +	atomic_set(&guc->interrupts.enabled, true);
>> +	/* make sure interrupt handler will see changes */
>> +	smp_mb();
> 
> Are we sure we need the barriers here? Can you please explain
> better what you are trying to achieve?
> 
> My idea of barriers was to use in order to avoid converting
> everything into atomic, which doesn't necessarily mean that it's
> the best solution, it was just a thought.
> 
> But maybe I misunderstood your intention.
> 
> Andi

The barriers seems not needed, the synchronization issue is for 
interrupt.enable only, no extra memory barrier is needed, to be removed 
in next rev.


Regards,
Zhanjun Dong
