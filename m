Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B598BD0BFA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 22:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1B10E043;
	Sun, 12 Oct 2025 20:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYWSXVpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA7110E043;
 Sun, 12 Oct 2025 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760299793; x=1791835793;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wvJgnGdbZtqgfTxD96x1WUE3YGOCsoVM2AHoJF0c3UY=;
 b=TYWSXVpxqDziQTTMETzf8X/96JY4EQWub4UV6lE1T6Bpo5dyWAZHJmau
 YhmPlzOAylT2Ial1U5s7Y6i917sCedPqWez9D6NLjKpLG5PutivLYR0C2
 TiAQg9abFACnd+g/tvuyTBr+Od9QRcORXGmO8BhVWMzdKqs0IkEIVkMvw
 x95xzEzJGpUFVD3QXov2Ia4hE9TWgz7z6aBXdF5vfwh4/yeZOGpcuNC3W
 +8gw3hltc92RVG0DVq2Ysk/1KBeC7XhCbtqasjw2U01qT767JEXbj0sFY
 TESJGa4G4y1zqXB+nMvD0SgHV6MpXwM712GMCgMbWMrTjvNZ8anfX+YB+ Q==;
X-CSE-ConnectionGUID: dWay03FiRJKqpC5nhTg4Yg==
X-CSE-MsgGUID: YMzGJfXST6W0T9grqHmkKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="79889308"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="79889308"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 13:09:52 -0700
X-CSE-ConnectionGUID: PhyLgCrhSKiZH2lJV9Zdog==
X-CSE-MsgGUID: kZ0BDP7VRXeu1vK0WmI9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="180998508"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 13:09:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 13:09:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 13:09:50 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 13:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx0u6VWb3xhE/lN5icyfAvGEywIyUK6J30t7PoYKY2fH61c9UhmWS1NGwo01XnZlM/CW25BfqAaBjUuyTu2+qvn97FICuq7y1UxKRM/vgX7RS2kY7X8hFJbT3fGCfREOgSjv5pIa/VDSuULwsgksCGVZacqaICdcpSX/yob0nKN/Z4WaxhgrirR/n3688tqk4rFWh3bpHY4B59dpvXeYhooTb+7l5SK50eumYF9fhvlT7u/1alpCyvfA1C6kkDYrNyO191ugeDcuQpkF+Cnx9gd9OAwyXhzFlBKxc4UIwkRhKbR/l8gYdvYBDUrATtFozCq80ScV7KklACWrhlzfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGjI+wRr56gwAA5x6ZpaHO3b4RfcceoDHeDM4GL6I28=;
 b=pZFz5nXJAd4kzcXdOnqF/6z8MY5Z77ICQnUVEEfIRk55FL1U0bpe8Z95drU8lNxdo+dvqKExeWSExnqoCNmHYwFLjVOZ6N9bQdOHmTqszWvRIx+i8GO1ti0SCs8rWBB5mq7NcUdkCvFw0qILxUtIUfGficXEP0Dj4sNrFr41iByCDtETHqRfkcWL1G0cjOT2RempWwXs/JdqHU8jAHB7qvgIFhuyC4meER+XYTBQ7x2mqReEf72drXltTQSiyIhJjCWzvDTz2Dm1hfcOL6R+277pxehLkN3jOvJZP9AaBewq5YytoVp/RgvVbd76ZHiiV9M4Ri8CtyCJbgfQnhDGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 20:09:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 20:09:47 +0000
Message-ID: <53bec38f-ec3f-4ce3-bd7e-e9e230663c48@intel.com>
Date: Sun, 12 Oct 2025 22:09:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/26] drm/xe/pf: Add save/restore control state stubs and
 connect to debugfs
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-4-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0290.eurprd07.prod.outlook.com
 (2603:10a6:800:130::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 260d3c7f-3591-4ea7-5818-08de09cb4afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3hWRU5uR05oWjRTZFNCMXU4UnhJSVRVYVAwVWI4RXRSM3BPQk9jam1CU0pl?=
 =?utf-8?B?b3Y5RmdsTDJiY244bjZwTzNYVDdFMThGMG1LcmFyblJacmI0T0wvVTgrWHI0?=
 =?utf-8?B?Mkg5TEpid0ppY2NrckRBSGlVL0xuVHZrRVMzenFjU1I2aE5XS1BNTTVEbjll?=
 =?utf-8?B?YzlhM1IxYXpVUmd6U1FhWC9MbDVFQ3BDWDE3ZGFzMnpyMmM3V1NIb3ViVmxS?=
 =?utf-8?B?akk2cnU5ZVl5dUpYUGFSdE5xWCs5Y1JlNjFPMngyM0RhY2NLSDFiRnBxSXoy?=
 =?utf-8?B?L05EMi93WnYvS3M1S2VvaXlScEo5cXlQN2NueVdkWTVDNlI5Wm0xTWZMWm85?=
 =?utf-8?B?dHNUSzFiRlJLSzQxb3kyMHNRVlpQOEl4SUZ2YlFQMHdOLy94eHZYQTZuYW8v?=
 =?utf-8?B?QWNDSk5HVnF6U0VIcCtNdEtza1M3QWlpWXZGRllTLzFXTEdJdVhwZ0tuMita?=
 =?utf-8?B?QmYxY2xMRkpmRENNZWRzODNXekhCUVlXL2IwTmhHdEFiNi9yeENmd2tESVRh?=
 =?utf-8?B?YlRiazlGdjFLQ3kyazBxSCtlRldZWDlVVzNXNThyQkc3ME5rUXZKWnlWYzNr?=
 =?utf-8?B?d2p6RmZEK2tUVTh6WGNHemtRVFhmblpESlFjd1RRTUlUdVhsZEhpcVJUSzN0?=
 =?utf-8?B?V0cvZXkxR3lQRlBBWldidFdvYU5wSzJ6MzNLdVFvN0RTdFB0b3JQUGpNbW04?=
 =?utf-8?B?SWdPd2dRcVFHcDh4bVBsSnNEKzkyTG5SL1YrakpDRnNXYWtCSkhscXNDM28r?=
 =?utf-8?B?cjYxTmllMUp6TjI1RG5QOHl5NzFTSDVMTkxJVEhzb0ZHTm1IRnY2WFExR0tj?=
 =?utf-8?B?RkFBUXhrT3IvOWpzTDVlREpobGFoa3l4V0VaeXpyV1NMZzZQeEpVeGNVeW9R?=
 =?utf-8?B?YkVDWkRpL3lMQkp4dGZ0WHhaNGRHVTZESm1JY2FCKy91VXk2NUwvZUk3UjM5?=
 =?utf-8?B?bExZYnJQSzIrOWdmV3FHdSsxN084di9LUE83dnhQT2F0ZnExeXdVUjhtN2dh?=
 =?utf-8?B?Wmk4ZTJuR01JL2NRemRlWGZtN292ZEowQmFkU0pEYldVUTI5UXd6R0gwRTd5?=
 =?utf-8?B?R3RQOERPZHU0ZlgxZXd6enVQSEkzQ2d2YlRIQnFUWDlGSG5NNnBqWTBTdHIw?=
 =?utf-8?B?UkRkSFpmZVV0TkZPTTc4R291VmV6UktVUkNha1A1WnVvdktCSllBR2pTYXZo?=
 =?utf-8?B?TDlQTGxQRFFyY29RVHNUNWR3QW5VdStDNDltOWh0S3Y2anNuenNmVytKVFFv?=
 =?utf-8?B?TkRkWUhHcHNxWnRRRDlDc3QvVGY4VFd3amIxNDhWcmhuY2VNYUM3S202bWpP?=
 =?utf-8?B?SFF4N2p2bHFBYmFyT001RW1HeHNxc29WWkluc2hyYlJTWHJrblI0WlNldGZ6?=
 =?utf-8?B?c0dZNkEzcVhlckhrLzJjUzAwVkE1ME5jbTh2TUpQekZHdkxaQ2FGOGV1dEJW?=
 =?utf-8?B?cUZPdTRlQ25QV2JoSmNDREhia0RkSXExbit1d05qbVhkUUZSRjBBQ3Zzczdh?=
 =?utf-8?B?bmtUV250NUowYWFaVDhVSytUbTlFT1lIRk5EbzQwUXB3bnU4MDUwOWd3U1ZZ?=
 =?utf-8?B?V0NlcnhibkVCMkU1bXJSZTdxMEtDWENvTTFQaWVGQ29TT0pNeTNtTTNYajBR?=
 =?utf-8?B?eHpxTXJEbVhXdmRYQXM3anZybFYzczhabWdJeUpUeVFzTEdiTmFWOTRkREZi?=
 =?utf-8?B?aVpyeTBXeUh1bmlmYlpVZUhiZjZqT0NaODF0M1p1N09saDRUdXliOVdVNXJK?=
 =?utf-8?B?ZXNhUlFmQlFOTkF0aCtPSnQ0VmRQcHpmemlpYjBrWmNNQ0VQMFdqcml4UDd3?=
 =?utf-8?B?MmJOeFc3ejN4RjNGdlNuZm1qOG9Ebk9WZXZSR3dLcDFtRlM5TFJSZzJ3NTVp?=
 =?utf-8?B?UmJSQW50ZEhVcGdzWTNIOWRnd1I4RWVNSE11Y0pEQkpIQ09LWThORUFlZE5m?=
 =?utf-8?B?VjMrK1pzbE1mVFY5cjRSekZpS3RZN0hEVCt4endZZVJHbU1DSmxVZmN1RnVn?=
 =?utf-8?Q?TqGrozQ9hDX4T2HlqnPrDTubnL9edc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODlhczhmcFZQK2lvTE5ucXRCUllJb2tzSUcxOUZ0RGpNM0VsQURXZ2pXT3F6?=
 =?utf-8?B?Q0U3ZmlSbnVjaXdTeE5QM0Vsa3VoS2hmSjN0L3M3MWhSdlp2TEtoeldMNGpP?=
 =?utf-8?B?VUUvOTYzbzAwaTV6OW5mbE01SmRtaEFYaEVab0NBUk4vRk1Ra3gwTndpZmpK?=
 =?utf-8?B?aEtIbDg1OEE4bHFON1hHeHBzenJ2amQ3NE1NUUQvdEhQd1dzSUVFd3hmRGE2?=
 =?utf-8?B?K3lHRXVKNk9HZ1lybldWalRhdGhDR0NMWUIxbUNvUVE2aktwS1NXUkVKNXly?=
 =?utf-8?B?QWhucTRVNUdpQ1o1OW1uVnZtOWtFK25hdWpZdzBXSFlTS3FjTmNPVjh2RXFW?=
 =?utf-8?B?YzlIUjU0YzI0a3ZFdjZyUWQ5aEs3N0Y3eE1Ub0hRQVJkYTVqMmVyck5UMXFp?=
 =?utf-8?B?MWlCNkJHNGdRVnMxOXpyNEk3ZEVLR0xXTUNpYTd1bG9OL1hySlpxK3E0T3pK?=
 =?utf-8?B?L3NWclNMM0F2SnNUVFljU0FQZ2h2U0RJRlptbDhzL0pOSnIyTTFlTnhjQ05S?=
 =?utf-8?B?NTlkYVhMRU9SQzY2QitONnN6N28zWGhJMFAvbzRFSVNvVzdINGE0WFppcWFO?=
 =?utf-8?B?am80Z01MZTNsSkpDQnVIMUQ4TWZNVjM5UzBEQmhZQzh4eUVHR0ZvOURUZ3E0?=
 =?utf-8?B?UVFTSENaVjZYSEFzQnMvMXRNUExHczZJZUJqZFBycHRONVJtOENBa3Rqc3pH?=
 =?utf-8?B?T2EvbEcwL0R2T01mb0I0ZDB4Y3A0bTdDMWlubjRkU1dKZ1FCcXQwM0kwZFZp?=
 =?utf-8?B?R2xoZFlxb09VNEt1VGs2REFvK1hhVlEzcjN1U2F2eFp5QkFOVXM3YW9zdXFI?=
 =?utf-8?B?eTdOaWs0Q2dSNEw1c3pjd0ZYR1F2cUcvRVNsMll1VHBuaG1YL1k3b1pKeHZX?=
 =?utf-8?B?S0ZjcXhYOXpXbGY1dnNueDRZekJsTSswZUdaQ1lIRUxDaE51YTdsdi9GTWh0?=
 =?utf-8?B?bllXMlVpZE12T0JNNklxdHZCeXFTbjE1UkRnbFY3SGt5YU5LZTdMQWMvWGlK?=
 =?utf-8?B?YlBJZHY4UTU5VEttQTJoMG1wQU5LYUJZZG81NTM4dEdBSHQ5c0NLYmxiN1Ny?=
 =?utf-8?B?bk5IaXFnN2dkZW9DQytQUGhibVJNRTV4QmhFMy9lSFdGV1g1bnIyek5vOEs1?=
 =?utf-8?B?enN3NDdsUWozNXpkYjVVQ2JXTkN4MENrZXRkS01iZEJhM2NETGYzK1piY0Ry?=
 =?utf-8?B?MlNoVTZ2cnV6NTlxUzBNbHVjd3NyN2toR0F2NDc3eEJEMEd4NlBxSUNSaHVN?=
 =?utf-8?B?NnNTK01kYUd3elBncUpEUG96bXpLNWlXdXYvL084ZUNjbm05WHhNOVE4OXJZ?=
 =?utf-8?B?d01tS1pUbkNIT3J5Y0dEZkR5clRWMnUzUW05bTJuOHZ2anlWOXYzMzM3WFpB?=
 =?utf-8?B?dERmWHZ0TVI1clh2aTV6LzVtMVdpc1daRVVRN1VVV1g1T1BhYlY0bzJrR0tG?=
 =?utf-8?B?MjNURVFZU3ZwVFVvejJtSEZGUWJZalBjU3RQamZKSkVCa3FjQUhJSk9kUUU0?=
 =?utf-8?B?c0ZrMkx2OGVVWGRITHBTc2tKdlJYOUtzV0FsTDNUZWJUL1FYbDg4cGJVTEFk?=
 =?utf-8?B?VU1odjJkcGZpZDIwai9KYkFJRUJjMlBid3g4bUJsenVTUklHRzIzWDFHYXMy?=
 =?utf-8?B?M2hKQzBBTUNBQU9Zc0I3eVI3QUo2UzlPZUpKd1AxME82QVpLYVBCZjNaamQ3?=
 =?utf-8?B?NlRSRHZzbGxVZzFBb0VEWVdHdU5EZUNJc0Y4L1RUMFEvNCtkdEdmYlpQL2V6?=
 =?utf-8?B?MXRUQnR1TTI4aHc5OGp4L2VBanM2VkRGM2VtMURkQjgxQWN0OXNqWmk2dGph?=
 =?utf-8?B?WFlJamR0c05HKzlrK2Y4T1l5SCtFQWlDUDlFa2RQc3NqQ1haZUJlVUd1TXQ5?=
 =?utf-8?B?azB0ajlEWmxKOXZ2UWlORnNUOFo1Z09DbVMxU1FoVXd6VVB4NmQxOUI2a0Jy?=
 =?utf-8?B?VWJDWjVpbWZrL2VXbmR0RVFwR21INEVZVG5CT0NEOXkvWTdBckFFQWhmL3U3?=
 =?utf-8?B?emF3T3RVUnFJQ1BlWXJLUzhwUEsrSXJpRFRxR1hKUEoxSmpVdU94azRMYkls?=
 =?utf-8?B?RjIyZ0NNZngrMjJROUhWc1BrUVBweWszME0xVXk4UGNHV0FPWHFIME9Telcx?=
 =?utf-8?B?TWlMVWlONnQ2bkJvUFV0eXVON2xFZHBQeUpoMytSK0dRekpZNFZaaXFWVnhj?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 260d3c7f-3591-4ea7-5818-08de09cb4afe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 20:09:47.7206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6DLjxcu65cFkfA9sglYmTYHXhErZ+YdfcgTlBMFcSb0ie3ULMB7qRAfUcQ1v97/e44d/9SUmzGz8RlMoTbBLaeDMRbuKQynVLSqxqkibr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> The states will be used by upcoming changes to produce (in case of save)
> or consume (in case of resume) the VF migration data.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 270 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  17 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
>  6 files changed, 431 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 2e6bd3d1fe1da..44df984278548 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -184,6 +184,13 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(PAUSE_SAVE_GUC);
>  	CASE2STR(PAUSE_FAILED);
>  	CASE2STR(PAUSED);
> +	CASE2STR(MIGRATION_DATA_WIP);
> +	CASE2STR(SAVE_WIP);
> +	CASE2STR(SAVE_FAILED);
> +	CASE2STR(SAVED);
> +	CASE2STR(RESTORE_WIP);
> +	CASE2STR(RESTORE_FAILED);
> +	CASE2STR(RESTORED);
>  	CASE2STR(RESUME_WIP);
>  	CASE2STR(RESUME_SEND_RESUME);
>  	CASE2STR(RESUME_FAILED);
> @@ -207,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
>  		return HZ / 2;
>  	case XE_GT_SRIOV_STATE_FLR_WIP:
>  	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
> +	case XE_GT_SRIOV_STATE_SAVE_WIP:
> +	case XE_GT_SRIOV_STATE_RESTORE_WIP:
>  		return 5 * HZ;
>  	default:
>  		return HZ;
> @@ -359,6 +368,10 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
>  
>  static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
>  static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_saved(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
> +static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid);
>  static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
>  static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
>  
> @@ -380,6 +393,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
>  
>  		pf_exit_vf_flr_wip(gt, vfid);
>  		pf_exit_vf_stop_wip(gt, vfid);
> +		pf_exit_vf_save_wip(gt, vfid);
> +		pf_exit_vf_restore_wip(gt, vfid);
>  		pf_exit_vf_pause_wip(gt, vfid);
>  		pf_exit_vf_resume_wip(gt, vfid);
>  
> @@ -399,6 +414,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
> +	pf_exit_vf_saved(gt, vfid);
> +	pf_exit_vf_restored(gt, vfid);
>  	pf_exit_vf_mismatch(gt, vfid);
>  	pf_exit_vf_wip(gt, vfid);
>  }
> @@ -675,6 +692,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
>  {
>  	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_saved(gt, vfid);
> +	pf_exit_vf_restored(gt, vfid);
>  	pf_exit_vf_mismatch(gt, vfid);
>  	pf_exit_vf_wip(gt, vfid);
>  }
> @@ -776,6 +795,249 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  	return -ECANCELED;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_check_vf_data_wip - check if new SR-IOV VF migration data is expected

nit: add () to function name:

	xe_gt_sriov_pf_control_check_vf_data_wip() - Check ...

> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: true when new migration data is expected to be produced, false otherwise
> + */
> +bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
> +}
> +
> +static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> +}
> +
> +static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	xe_gt_sriov_info(gt, "VF%u saved!\n", vfid);
> +
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_exit_vf_saved(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
> +}
> +
> +static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> +		return false;
> +
> +	pf_exit_vf_save_wip(gt, vfid);
> +	pf_enter_vf_saved(gt, vfid);
> +
> +	return true;
> +}
> +
> +static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
> +		pf_exit_vf_restored(gt, vfid);
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_queue_vf(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +

please add diagram for the inner state machines for both new SAVE/RESTORE states

and also update master diagram how SAVE/RESTORE interacts with existing states

with diagrams that include expected flows it will be easier to review the impl

> +/**
> + * xe_gt_sriov_pf_control_save_vf - Save SR-IOV VF migration data.
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_save_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_enter_vf_save_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pf_wait_vf_save_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_SAVE_WIP);
> +	int err;
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err) {
> +		xe_gt_sriov_notice(gt, "VF%u SAVE didn't finish in %u ms (%pe)\n",
> +				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_wait_save_done() - Wait for a VF Save to complete
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_wait_save_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> +		return 0;
> +
> +	return pf_wait_vf_save_done(gt, vfid);
> +}
> +
> +static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> +}
> +
> +static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	xe_gt_sriov_info(gt, "VF%u restored!\n", vfid);

since commit ac43294e8ec2 for GT-level state changes we use dbg() messages

> +
> +	pf_exit_vf_mismatch(gt, vfid);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
> +}
> +
> +static bool pf_handle_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +		return false;
> +
> +	pf_exit_vf_restore_wip(gt, vfid);
> +	pf_enter_vf_restored(gt, vfid);
> +
> +	return true;
> +}
> +
> +static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
> +		pf_exit_vf_saved(gt, vfid);
> +		pf_enter_vf_wip(gt, vfid);
> +		pf_enter_vf_restored(gt, vfid);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_restore_vf - Restore SR-IOV VF migration data.
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_restore_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
> +		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
> +		return -EPERM;
> +	}
> +
> +	if (!pf_enter_vf_restore_wip(gt, vfid)) {
> +		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
> +		return -EALREADY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
> +	int err;
> +
> +	err = pf_wait_vf_wip_done(gt, vfid, timeout);
> +	if (err) {
> +		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
> +				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
> +		return err;
> +	}
> +
> +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_wait_restore_done() - Wait for a VF Restore to complete
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_wait_restore_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +		return 0;
> +
> +	return pf_wait_vf_restore_done(gt, vfid);
> +}
> +
>  /**
>   * DOC: The VF STOP state machine
>   *
> @@ -817,6 +1079,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
>  
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_saved(gt, vfid);
> +	pf_exit_vf_restored(gt, vfid);
>  	pf_exit_vf_mismatch(gt, vfid);
>  	pf_exit_vf_wip(gt, vfid);
>  }
> @@ -1461,6 +1725,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
>  	if (pf_exit_vf_pause_save_guc(gt, vfid))
>  		return true;
>  
> +	if (pf_handle_vf_save_wip(gt, vfid))
> +		return true;
> +
> +	if (pf_handle_vf_restore_wip(gt, vfid))
> +		return true;
> +
>  	if (pf_exit_vf_resume_send_resume(gt, vfid))
>  		return true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 8a72ef3778d47..2e121e8132dcf 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -14,8 +14,14 @@ struct xe_gt;
>  int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
>  
> +bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> +
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_save_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_wait_save_done(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_restore_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_wait_restore_done(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index c80b7e77f1ad2..02b517533ee8a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -31,6 +31,13 @@
>   * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
>   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
>   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> + * @XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP: indicates that the new data is expected in migration ring.

hmm, that looks like a wrong optimization, likely we should have separate:

> + * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.

       XE_GT_SRIOV_STATE_SAVE_WAIT_DATA - indicates that the new SAVE data is expected

> + * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> + * @XE_GT_SRIOV_STATE_SAVED: indicates that VF is saved.
> + * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.

and
       XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA - indicates that the new RESTORE data is expected 

> + * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF restore operation has failed.
> + * @XE_GT_SRIOV_STATE_SAVED: indicates that VF is restored.

2x copy/paste typo

>   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
>   * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
>   * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
> @@ -63,6 +70,16 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_PAUSE_FAILED,
>  	XE_GT_SRIOV_STATE_PAUSED,
>  
> +	XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP,
> +
> +	XE_GT_SRIOV_STATE_SAVE_WIP,
> +	XE_GT_SRIOV_STATE_SAVE_FAILED,
> +	XE_GT_SRIOV_STATE_SAVED,
> +
> +	XE_GT_SRIOV_STATE_RESTORE_WIP,
> +	XE_GT_SRIOV_STATE_RESTORE_FAILED,
> +	XE_GT_SRIOV_STATE_RESTORED,
> +
>  	XE_GT_SRIOV_STATE_RESUME_WIP,
>  	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
>  	XE_GT_SRIOV_STATE_RESUME_FAILED,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index 416d00a03fbb7..e64c7b56172c6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_pf_control_save_vf - Save VF migration data on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_save_vf(gt, vfid);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_control_wait_save_vf - Wait until VF migration data was saved on all GTs
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_wait_save_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 id;

"unsigned int" like above?

> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_wait_save_done(gt, vfid);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_pf_control_restore_vf - Restore VF migration data on all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_restore_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_restore_vf(gt, vfid);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_pf_control_wait_save_vf - Wait until VF migration data was restored on all GTs
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_wait_restore_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_wait_restore_done(gt, vfid);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> index 2d52d0ac1b28f..512fd21d87c1e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> @@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_wait_save_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_restore_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_wait_restore_vf(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index 97636ed86fb8b..74eeabef91c57 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -75,11 +75,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>   *      │   │   ├── reset
>   *      │   │   ├── resume
>   *      │   │   ├── stop
> + *      │   │   ├── save
> + *      │   │   ├── restore
>   *      │   │   :
>   *      │   ├── vf2
>   *      │   │   ├── ...
>   */
>  
> +static int from_file_read_to_vf_call(struct seq_file *s,
> +				     int (*call)(struct xe_device *, unsigned int))
> +{
> +	struct dentry *dent = file_dentry(s->file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = call(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return s->count;

since we don't expect to put anything into "s", maybe we can explicitly return 0 here?

> +}
> +
>  static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
>  					  size_t count, loff_t *ppos,
>  					  int (*call)(struct xe_device *, unsigned int))
> @@ -118,10 +138,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
>  }										\
>  DEFINE_SHOW_STORE_ATTRIBUTE(OP)
>  
> +#define DEFINE_VF_RW_CONTROL_ATTRIBUTE(OP)					\

rename it to have RW as suffix (like other ATTR macros):

	DEFINE_VF_CONTROL_ATTRIBUTE_RW

> +static int OP##_show(struct seq_file *s, void *unused)				\
> +{										\
> +	return from_file_read_to_vf_call(s,					\
> +					 xe_sriov_pf_control_wait_##OP);	\
> +}										\
> +static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
> +			  size_t count, loff_t *ppos)				\
> +{										\
> +	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
> +					  xe_sriov_pf_control_##OP);		\
> +}										\
> +DEFINE_SHOW_STORE_ATTRIBUTE(OP)
> +
>  DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
> +DEFINE_VF_RW_CONTROL_ATTRIBUTE(save_vf);
> +DEFINE_VF_RW_CONTROL_ATTRIBUTE(restore_vf);
>  
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
> @@ -129,6 +165,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
>  	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
>  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
> +	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
> +	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)

