Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBBEA79D24
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 09:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C1010E916;
	Thu,  3 Apr 2025 07:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o4Nbugwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FE410E915
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 07:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkfsH1r3zZ6bvXticTi9NgLCBFBSQ3yezK0s6bCRHWGvzn13RhvxfOSy+VgDWd+k5q4ULdZDyGW08wRYdyc3s78eij3zJMUwIXls0MmFlJrHfwJnK5LShUh5ihp1z5PEFWPW77oVyRwLr5fRrWGk2d3zELN19yugFQ0rDce016b+TRADDHvxyNXs8wJmXSZ04z/URrz/73ZEb+E5q0LVCkQ4yxEDeuGjkiLRVlO8TnZ8VxxyHarkMbnyU/ggc4CSD/xu1ECbBQFlIibGPG+3NRiB227W59ZLahjhvA+Nck7vFKItzhq+j7dLBGCcrGHnT7UEJlHLFfoolKh8Zbsq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxSkVR2KcAJeyzECw3XPydBovYqxjHMR49h3uGHncyE=;
 b=jp5oRtX+U8W+P3VCvsfF34ewJUokzjMChAOmF4/KiCrv78NvK0on8ipdXudFXvMSBOCHYvL7bNzeaoPr3JXxOR97AaPTyXSOVK6Ph3/0Ejw3FBJJ5TrV5KeewxbrpIdZdSBIG7CtMN6u6FSq6QrpNPUu5y/1B8Pcc1v+tNNpAeIX1b1cDzYpgWTWqKkCLd4seC51CiTuGn28Xi3nI0MFSNnu4xxMg5dVQKp9YpDSH4aqFwr2vvljrJkaKucV6DNMOXGdt9iVhxdN8PJHRGjwVAs3Ww1QKEnrj8GJ5FAZmB4jBOglTlNhCpg00qxS3TwkiSkWH3GzNZvs25Ho4Lo/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxSkVR2KcAJeyzECw3XPydBovYqxjHMR49h3uGHncyE=;
 b=o4NbugwtgHv1keG9pJcB333qH+t2NU0WliKuyqkFuMUyvDzUHbRr0U6pPxGaXUJu6XhoDGnSmLegmz6lWGTFurlBW9++oNlrB3TMohZTiazu+qZuhySSIX3lPT+omu4hwVuwc2RcsC4nInzwybGkK6F4Iwvj/hPnQTH6HkU6LbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7857.namprd12.prod.outlook.com (2603:10b6:806:31e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Thu, 3 Apr
 2025 07:39:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:39:59 +0000
Content-Type: multipart/alternative;
 boundary="------------Mij9yNUWalpCooAWDeWfp6rj"
Message-ID: <5ed87c80-6fe3-4f8c-bb98-ca07f1db8c34@amd.com>
Date: Thu, 3 Apr 2025 09:39:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: Dave Airlie <airlied@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
 <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
 <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
 <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: ca35c2cf-da2d-48d2-ecff-08dd7282bc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzlVVFpNZkcxNXQ3dTYvSFJmcHF3K3N6bjQxd1VzSmozY2drVVRQT3pGR0di?=
 =?utf-8?B?OGFVK3haQ1c4WElhN0NOOTVZR0hTYlMwZDEwckRBM01DajZ3cDhKeGlGL2V6?=
 =?utf-8?B?cUt1NStnamlMZHFKNkQvdHp5akY3eXMzR2dIZ2E5UGlwYytNRGhIZnlpd1Ix?=
 =?utf-8?B?bU5WZ0VaN25iMTdWd1NMRTRsVlVkMXdMWVdYTFREaGpxUExIVkI5T2FWblVv?=
 =?utf-8?B?ZkFCbG02NUhCam00RThJeXZRb29vRlJoWVdsSk5mdDRTTmJtSXVhR1dhclN1?=
 =?utf-8?B?Y1ZWZGhLUGdmSklrL2xEOVVNZnBLbHkrUkJ4SGFrOFRmdzcxeUxzaGdCNXF6?=
 =?utf-8?B?YkVWdVpwTHpxaWkxUUkwMnRvNzFUL05tZE5MSWJKUGlTbDJibEpyY2x4Rkg1?=
 =?utf-8?B?ZlpzallFZWl5N3RIZzE1SHZJWXVMc3dubmFjN1VrbWlwTFM1WVlNdXVxMkhD?=
 =?utf-8?B?M2Q5VXorbG45NVJSb2NXLzNSM2dKaXFzWEJMNWM3UmI5R0JlZUdHN1loVG5Y?=
 =?utf-8?B?bmFsL1cxZTVWOXVpbURVNjZHTEUvc1Z1dExGQUhPekQ0M1dCS3ZWZ053N2JX?=
 =?utf-8?B?SkRJNThaNUdDQnVZU3luQ25oWHRDTWNVY3FDOTJtaTY4Mjk0QXFSTUxxaTdI?=
 =?utf-8?B?SmhDUnJkd0Zvb2dlK3Bvd01GMi84ajBkTDNJMzN5VXlhM1Z3RHNVUC9IbWRj?=
 =?utf-8?B?ZzlJTllnRTkrdnR0dTkwVXU1ZzlPZkxqM3VOdFRZbXRHL3d4d3pzeFZxYXB3?=
 =?utf-8?B?eEZqc3k5SVdSM3B5NlFqWTdoOGJ6MUJNSHB6WTR4SjRJKytUM2VLYXU3Mmd2?=
 =?utf-8?B?elNKQThUQk02eGcwOWdKcjdHbDQzSkM2Ym10Umh0WkRRZ2RRdFhxVEptR0lh?=
 =?utf-8?B?Z1hMMjFjdHZjcUhIcG1TWlZTUm1zSWxQTlZJSmovbTNjYlgrK1g0RG5oUHll?=
 =?utf-8?B?N3dsY2VJMk9pY1FOckRHYjVBMHN5Q213UkJ5ME12QVFzSURRU20xdGpOVXN3?=
 =?utf-8?B?ZWVoMWZlTTFaNUR0bGJoQ2w4NkEzazZWd2ZCZDF1TFhnWVBxNHlwd3NHcTRn?=
 =?utf-8?B?SnltZWljYm9hbk9Zc1FTYkJRdE5EaDltcnM3VTVhYjZWSk5GU1pZNDFpOU9q?=
 =?utf-8?B?UmVIcUNqTzFremVZUXZ5ejQzZ0dYN2EvVWR4dGd3ZHF0ZzZ6WUtPdjBudUR3?=
 =?utf-8?B?eENNNk03Nncwc3pwWnFsdWE3R2lJTnJIVm4vNVZKYUV1QjdCL0FZazc0Ui9J?=
 =?utf-8?B?a3ZYZ1lrQlhlbmYreHlkbTFlUWEwVzkwMGlyNHB2YVJydXNzTk9pKzA1aFFt?=
 =?utf-8?B?WU5IRzEyWkx4dDBhSzdJRkNTOFo4ZlRHaXdZUnFhR0hyVlNnV2YwbElXUXBn?=
 =?utf-8?B?QlBzV3E2cklqU3JvYkFRanlMQzhGMDVaVDBUNHNuSVpLMTdhbEMvN2YzandH?=
 =?utf-8?B?T2h5Rm1BUXpJLytzS3dKR2JtSFNvVnI2OFFhZ2tPYmxEY0RIZ1lPQWRLRG40?=
 =?utf-8?B?ZmNjem9jUlBIblZZNWpNeDdBVVRwaVB6dkFqMCtVbGE0YitrZ3QwcFdiT2N4?=
 =?utf-8?B?d1U2UjZIRkJYcFBIcUlEZGEyVjNLNTZMR2lFRWVIRGpTN1I1emZBTWtLZzl2?=
 =?utf-8?B?VTZqcC9qaVR4cEdUcUF5L1hyN3BjMVJmblRtb2VHUVVPOWtzaEVrTmdRRUdG?=
 =?utf-8?B?MmgwT05aaHBHWkZFKys5N20ya1RtR0RKNWFMQ2ZQbmh2eU5udkozditVTGJj?=
 =?utf-8?B?OWRCRFllMlBrOTRYQ0lTa1BQQTdqclRISkNlYTg1blRKbDdJdDZhd0thdmRK?=
 =?utf-8?B?MGZyNEJYRXNhRHU4c1Baakp6L29NOGVxTkhveW03SG9yM0FzaExiNVRxRzhk?=
 =?utf-8?Q?Kv2yeWs7QIRO1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjV6RGVwSUxCMzJSOUllQk9pb0FEMHRpWlNCcFMrc3hNc0pvdTA0UkM1NENv?=
 =?utf-8?B?bURlaTA0TEhWQVJvOFlVR2lHeXJHSjJGS1hmMDBQajVXVnZvVWdjRmt5ZDh0?=
 =?utf-8?B?K3ByZFFiSEtvZm1vVmFicytVVnpTK0hKa3lheit5aVBQdjZDSnJiU2V6MEM4?=
 =?utf-8?B?M2pOWmpBSXgrR0c2YTdMaTFXYW1pU0pPeGpFVklKYU5ja3NaTTM5c3U0UjNz?=
 =?utf-8?B?QnY3QkIrZkVINW1rUGxWbTVBY0YzaTFvaTlUMk9mdEdOOG9HLzd1MW5URUJy?=
 =?utf-8?B?OTZYUXlWMThYSjVQYlNFTSt5SkNiVElEYUZrSG9VWTVPV0lwMi9JYTRxeWtJ?=
 =?utf-8?B?YWhEUWp1elBpSFhhak8yd2p1SzluRUR0OHUyejVHeTNCbWRXYkMvTFNEWG03?=
 =?utf-8?B?ZWdvZ2hPUUtNNHdLTUJPL0UwNm95cGNVRHNhcXRVNUZyU2FaZk96MC9kUnZX?=
 =?utf-8?B?Zk5GM21BbzQyNW9UY3RQK08wODdOMkF5aEc0MWNFM3owbi9KWXNVN2dUeTUz?=
 =?utf-8?B?UlVld2lhYlRQTytLTGh4clNVdmdRQXpxUzhrdlVIY2xnWXpDUUZYSmF3dDU4?=
 =?utf-8?B?ZHIvcGVUR3hiNW8zQWRPb0w0Q2o0UGpkdnQ5VjhzSkVVWFNPYXdkOW1QazZs?=
 =?utf-8?B?eFRVYWQ2dEdmWWdSU1RZb0lJZndCWnNqZmNNZDl3TGc0UlM3a2lPTUxaeEJ6?=
 =?utf-8?B?Z2x1Q2h6Tm9laVk3cTNqSWxqdlU4VXlSQ1hzcmllVmdTRWJxemcrZVJ0VDU0?=
 =?utf-8?B?TWEyY2twdi9LNkM0VGF0NkRnY1VsanZTM3N2cWNkdFBub25Ucm8vTWFDenVF?=
 =?utf-8?B?VVQ1cHZOTC9hSjJuMGdZZVcxQ2YvbTIwZnBZcjMwaVpmYVl6WStTNklkSTJ2?=
 =?utf-8?B?UDBlQ1hVUWlnV0l3Z28rZ3Fzc3p0TEE4WHNSMVF1NmI0TVJ0TlJmWXUwREh2?=
 =?utf-8?B?UlVmL3FsbC9meVlLRmlhcG4xOVZDL1Nad3RKdXlWbDdEUm0yNXIzR3dmVElQ?=
 =?utf-8?B?SE4vSWRJS1g1cjJ4UERZSThJQTVGZHJCU2FiYzJEcmU1dGQvRjU5azVrS0VK?=
 =?utf-8?B?ck0zT1NNZEVlY3pWZXlWYTltL0JFbVlYMXlvTkUxaTA1SVBtUVFSOVFyRC9J?=
 =?utf-8?B?UUNqWkRvb0xlVFV6VklDZVdCbzc2MDUwaUxLMlFIRGxLUVpXUjIrTzMvY1o4?=
 =?utf-8?B?MVJBU3I4QVlKbVk3SkF6ZC9pbHE4Z3BlcnI2Wi83K3NiMXNrT2pDOEw2SS8z?=
 =?utf-8?B?MlRkcVVENFA0c2VKTUgvOGtKQVZSTG5MNzhzZyt3d0xqRk9kd1U0Zm9Vczkr?=
 =?utf-8?B?R1Y4eE1ueVBIZjllNnV6Y2w5bDZWTGx6ZVgzV09haHdxTUwzMklNVEJtYTlq?=
 =?utf-8?B?NUc1djdiRlR3UTRjaEZIbWgzZ0pwVStYeStXeHVSMFo2b1daT2kxbXI0M3hM?=
 =?utf-8?B?OVBIUVFmRnpwbnV4RFdka3V4TldBclhobFhyTFdTOUJVdENLeUdjV25Yc2Ro?=
 =?utf-8?B?V1FMcUdWREtzLzhVaXYrTkx5eTFNOGtPeUQ4OHlSTjVSNCtwY09xRDhCaUZm?=
 =?utf-8?B?ZjBYSUo5aXZyRWFZaE5TaHllUDRUSGM1S2FBN0RRaWY2SnRIZExMY1VTbUln?=
 =?utf-8?B?YVEzc3dJclkzRnVvc3dOZElWZFVXVzlUaXpDVWE5TDZDR012QUpTWHR2MEhP?=
 =?utf-8?B?ZTVVQ3hSczM4aU9lMXl1cURnZWhEMmt3SzFYeTZJZXl5d21NdjJqUUFvU3g4?=
 =?utf-8?B?eWNEK0lmV0docDhMR25oejVuVVoxZjE4RkhQN2ZEaGhFc21rdjhlR0JnK0Y5?=
 =?utf-8?B?UnJ3SDhoVVJzN0gwTHFkdFAzbW5tSTMrR1FTb205MC9WQ2NBWVExeGE5enpX?=
 =?utf-8?B?RE5RZ1ZNblFoSlR2UTRuNkZCWFh4bzc5Y1ZOZklpMnhWSm5ZaEthNjZBQ2py?=
 =?utf-8?B?dmhlS3AzVlhXTDZjZFEwM2g1MlBncmVqU3BkK1h3aUdxVkNDb0Mwc053SnNN?=
 =?utf-8?B?eHpNbHpoYkZNYmppdGc0N0NIckJCb0NqRHp5ZjUvTXU0UXJ1eVBFU25XZklG?=
 =?utf-8?B?Qnk2ZlkrVU5lTVNUYkRSNUZOYmUzdkxpRDdBVVM2MndTM1c2dW9DYk82dTNN?=
 =?utf-8?Q?HO2xzhzumUkmFkx6PXbh4dQL8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca35c2cf-da2d-48d2-ecff-08dd7282bc8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 07:39:59.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMR2CfAHiBKO/ybr2ovmSFMhEQqAYsejMlyta7kJi5BQhPqQ4181a+TRP24Wt9c+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7857
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

--------------Mij9yNUWalpCooAWDeWfp6rj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 03.04.25 um 08:07 schrieb Dave Airlie:
> On Tue, 1 Apr 2025 at 21:03, Christian König <christian.koenig@amd.com> wrote:
>> Am 31.03.25 um 22:43 schrieb Dave Airlie:
>>> On Tue, 11 Mar 2025 at 00:26, Maxime Ripard <mripard@kernel.org> wrote:
>>>> Hi,
>>>>
>>>> On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian König wrote:
>>>>> [Adding Ben since we are currently in the middle of a discussion
>>>>> regarding exactly that problem]
>>>>>
>>>>> Just for my understanding before I deep dive into the code: This uses
>>>>> a separate dmem cgroup and does not account against memcg, don't it?
>>>> Yes. The main rationale being that it doesn't always make sense to
>>>> register against memcg: a lot of devices are going to allocate from
>>>> dedicated chunks of memory that are either carved out from the main
>>>> memory allocator, or not under Linux supervision at all.
>>>>
>>>> And if there's no way to make it consistent across drivers, it's not the
>>>> right tool.
>>>>
>>> While I agree on that, if a user can cause a device driver to allocate
>>> memory that is also memory that memcg accounts, then we have to
>>> interface with memcg to account that memory.
>> This assumes that memcg should be in control of device driver allocated memory. Which in some cases is intentionally not done.
>>
>> E.g. a server application which allocates buffers on behalves of clients gets a nice deny of service problem if we suddenly start to account those buffers.
> Yes we definitely need the ability to transfer an allocation between
> cgroups for this case.

The bigger issue is that you break UAPI for things which are "older" (X server, older Android approaches etc...), fixing all of this is certainly possible but most likely simply not worth it.

There are simpler approach to handle all this I think, but see below for further thoughts on that topic.

>> That was one of the reasons why my OOM killer improvement patches never landed (e.g. you could trivially kill X/Wayland or systemd with that).
>>
>>> The pathological case would be a single application wanting to use 90%
>>> of RAM for device allocations, freeing it all, then using 90% of RAM
>>> for normal usage. How to create a policy that would allow that with
>>> dmem and memcg is difficult, since if you say you can do 90% on both
>>> then the user can easily OOM the system.
>> Yeah, completely agree.
>>
>> That's why the GTT size limit we already have per device and the global 50% TTM limit doesn't work as expected. People also didn't liked those limits and because of that we even have flags to circumvent them, see AMDGPU_GEM_CREATE_PREEMPTIBLE and  TTM_TT_FLAG_EXTERNAL.
>>
>> Another problem is when and to which process we account things when eviction happens? For example process A wants to use VRAM that process B currently occupies. In this case we would give both processes a mix of VRAM and system memory, but how do we account that?
>>
>> If we account to process B then it can be that process A fails because of process Bs memcg limit. This creates a situation which is absolutely not traceable for a system administrator.
>>
>> But process A never asked for system memory in the first place, so we can't account the memory to it either or otherwise we make the process responsible for things it didn't do.
>>
>> There are good argument for all solutions and there are a couple of blocks which rule out one solution or another for a certain use case. To summarize I think the whole situation is a complete mess.
>>
>> Maybe there is not this one solution and we need to make it somehow configurable?
> My feeling is that we can't solve the VRAM eviction problem super
> effectively, but it's also probably not going to be a major common
> case, I don't think we should double account memcg/dmem just in case
> we have to evict all of a users dmem at some point, maybe if there was
> some kind of soft memcg limit we could add as an accounting but not
> enforced overhead it might be useful to track evictions, but yes we
> can't have A allocating memory causing B to fall over because we evict
> memory into it's memcg space and it fails to allocate the next time it
> tries, or having A fail in that case.

+1 yeah, exactly my thinking as well.

> For the UMA GPU case where there is no device memory or eviction
> problem, perhaps a configurable option to just say account memory in
> memcg for all allocations done by this process, and state yes you can
> work around it with allocation servers or whatever but the behaviour
> for well behaved things is at least somewhat defined.

We can have that as a workaround, but I think we should approach that differently.

With upcoming CXL even coherent device memory is exposed to the core OS as NUMA memory with just a high latency.

So both in the CXL and UMA case it actually doesn't make sense to allocate the memory through the driver interfaces any more. With AMDGPU for example we are just replicating mbind()/madvise() within the driver.

Instead what the DRM subsystem should aim for is to allocate memory using the normal core OS functionality and then import it into the driver.

AMD, NVidia and Intel have HMM working for quite a while now but it has some limitations, especially on the performance side.

So for AMDGPU we are currently evaluating udmabuf as alternative. That seems to be working fine with different NUMA nodes, is perfectly memcg accounted and gives you a DMA-buf which can be imported everywhere.

The only show stopper might be the allocation performance, but even if that's the case I think the ongoing folio work will properly resolve that.

With that in mind I think for the CXL/UMA use case we should use dmem to limit the driver allocate memory to just a few megabytes for legacy things and let the wast amount of memory allocation go through the normal core OS channels instead.

Regards,
Christian.

>
> Dave.

--------------Mij9yNUWalpCooAWDeWfp6rj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.04.25 um 08:07 schrieb Dave Airlie:<br>
    <blockquote type="cite" cite="mid:CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 1 Apr 2025 at 21:03, Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Am 31.03.25 um 22:43 schrieb Dave Airlie:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Tue, 11 Mar 2025 at 00:26, Maxime Ripard <a class="moz-txt-link-rfc2396E" href="mailto:mripard@kernel.org">&lt;mripard@kernel.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi,

On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">[Adding Ben since we are currently in the middle of a discussion
regarding exactly that problem]

Just for my understanding before I deep dive into the code: This uses
a separate dmem cgroup and does not account against memcg, don't it?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yes. The main rationale being that it doesn't always make sense to
register against memcg: a lot of devices are going to allocate from
dedicated chunks of memory that are either carved out from the main
memory allocator, or not under Linux supervision at all.

And if there's no way to make it consistent across drivers, it's not the
right tool.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">While I agree on that, if a user can cause a device driver to allocate
memory that is also memory that memcg accounts, then we have to
interface with memcg to account that memory.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This assumes that memcg should be in control of device driver allocated memory. Which in some cases is intentionally not done.

E.g. a server application which allocates buffers on behalves of clients gets a nice deny of service problem if we suddenly start to account those buffers.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes we definitely need the ability to transfer an allocation between
cgroups for this case.</pre>
    </blockquote>
    <br>
    The bigger issue is that you break UAPI for things which are &quot;older&quot;
    (X server, older Android approaches etc...), fixing all of this is
    certainly possible but most likely simply not worth it.<br>
    <br>
    There are simpler approach to handle all this I think, but see below
    for further thoughts on that topic.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
That was one of the reasons why my OOM killer improvement patches never landed (e.g. you could trivially kill X/Wayland or systemd with that).

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The pathological case would be a single application wanting to use 90%
of RAM for device allocations, freeing it all, then using 90% of RAM
for normal usage. How to create a policy that would allow that with
dmem and memcg is difficult, since if you say you can do 90% on both
then the user can easily OOM the system.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, completely agree.

That's why the GTT size limit we already have per device and the global 50% TTM limit doesn't work as expected. People also didn't liked those limits and because of that we even have flags to circumvent them, see AMDGPU_GEM_CREATE_PREEMPTIBLE and  TTM_TT_FLAG_EXTERNAL.

Another problem is when and to which process we account things when eviction happens? For example process A wants to use VRAM that process B currently occupies. In this case we would give both processes a mix of VRAM and system memory, but how do we account that?

If we account to process B then it can be that process A fails because of process Bs memcg limit. This creates a situation which is absolutely not traceable for a system administrator.

But process A never asked for system memory in the first place, so we can't account the memory to it either or otherwise we make the process responsible for things it didn't do.

There are good argument for all solutions and there are a couple of blocks which rule out one solution or another for a certain use case. To summarize I think the whole situation is a complete mess.

Maybe there is not this one solution and we need to make it somehow configurable?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
My feeling is that we can't solve the VRAM eviction problem super
effectively, but it's also probably not going to be a major common
case, I don't think we should double account memcg/dmem just in case
we have to evict all of a users dmem at some point, maybe if there was
some kind of soft memcg limit we could add as an accounting but not
enforced overhead it might be useful to track evictions, but yes we
can't have A allocating memory causing B to fall over because we evict
memory into it's memcg space and it fails to allocate the next time it
tries, or having A fail in that case.</pre>
    </blockquote>
    <br>
    +1 yeah, exactly my thinking as well.<br>
    <br>
    <blockquote type="cite" cite="mid:CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">For the UMA GPU case where there is no device memory or eviction
problem, perhaps a configurable option to just say account memory in
memcg for all allocations done by this process, and state yes you can
work around it with allocation servers or whatever but the behaviour
for well behaved things is at least somewhat defined.</pre>
    </blockquote>
    <br>
    We can have that as a workaround, but I think we should approach
    that differently.<br>
    <br>
    With upcoming CXL even coherent device memory is exposed to the core
    OS as NUMA memory with just a high latency.<br>
    <br>
    So both in the CXL and UMA case it actually doesn't make sense to
    allocate the memory through the driver interfaces any more. With
    AMDGPU for example we are just replicating mbind()/madvise() within
    the driver.<br>
    <br>
    Instead what the DRM subsystem should aim for is to allocate memory
    using the normal core OS functionality and then import it into the
    driver.<br>
    <br>
    AMD, NVidia and Intel have HMM working for quite a while now but it
    has some limitations, especially on the performance side.<br>
    <br>
    So for AMDGPU we are currently evaluating udmabuf as alternative.
    That seems to be working fine with different NUMA nodes, is
    perfectly memcg accounted and gives you a DMA-buf which can be
    imported everywhere.<br>
    <br>
    The only show stopper might be the allocation performance, but even
    if that's the case I think the ongoing folio work will properly
    resolve that.<br>
    <br>
    With that in mind I think for the CXL/UMA use case we should use
    dmem to limit the driver allocate memory to just a few megabytes for
    legacy things and let the wast amount of memory allocation go
    through the normal core OS channels instead.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Dave.
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Mij9yNUWalpCooAWDeWfp6rj--
