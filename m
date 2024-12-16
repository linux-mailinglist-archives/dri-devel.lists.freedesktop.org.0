Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC79F2E13
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A148A10E57F;
	Mon, 16 Dec 2024 10:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F40+TpwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1C010E57F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMhHyz+dJyUH7d+rSZvgHpjhsZeijKk2evxp3CFC5lD8yxh8TWocasaNagVPo5PmRs+cQEEFZz1VHF+pJ5P3WzhPgw8/sRZJYBAJGrGSj1V2Q9PKiMQtuOkjO71dVwBjpwYqoeqel30nCFbr+ED5Nj/+dZwNgqGQAXsAn03m7wovvppQ0w9qIxm8dxM4muqCjnOium3aAF0VDWkUpZEAslRuC0/htVFoSNcKbc6BhNY7b7w1031J0DbYQzhPyYCQPV+p3LeIcHATSDGhSkKzADY5lSY2l9kkk0O8a77m56btweQnnMyg6Puf2res/J/l/tx/5NdDE6vr/b4N/zI0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46IYkEOoE7Z7L9QzfxmOohW9pkOy8J+1Lk8p+DUCDZ0=;
 b=Zq4vsE8QTPPjyCUmw5Drzb62FxGqn5FmqEVglWZAXQCrV4cfDxiKekuXIYtmm+dOpU69zEkf/wYIuUDxfOlR78UfNwh+1KBvNzMOaqJafZbvL/dBW2TDIPr8YaeZsNYeE4YQV9lpRSwUePnGYfEEEXH1+3TFJcvs9mumYkfMVA+dAvEEfDcbAT2d7Vz02KOAl0soZWVbVaOUyk2ew1ogjQ1C4ptjpn6W+JdNXihwgSVadFsIaTryn5Uy5BU64RI418sGYsmuSOBBJWvA899ULH2uTFb0YefHIVlh0zvDRAawOsWy449qh2Vbc8aCB/OecNKXia473fmAhODGHq2MEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46IYkEOoE7Z7L9QzfxmOohW9pkOy8J+1Lk8p+DUCDZ0=;
 b=F40+TpwRA5LI5kSTdh/9T18M76GRHYpXbmpM+YW0mhAR7CIgdo3271WPzDRRXQIKiDFRC7XBlmNUV3W3+RX94LxsKTgeR/MAVzhWfqiIA0Jots8OPewU8Rz1998OVDlC0FuY64pccSl7miVSljbByyKlE9xcht8gsdeU8fmlMDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 10:21:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 10:21:46 +0000
Message-ID: <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
Date: Mon, 16 Dec 2024 11:21:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
To: Wei Lin Guay <wguay@fb.com>, alex.williamson@redhat.com,
 dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org
Cc: jgg@nvidia.com, vivek.kasireddy@intel.com, dagmoxnes@meta.com,
 kbusch@kernel.org, nviljoen@meta.com, Wei Lin Guay <wguay@meta.com>,
 Oded Gabbay <ogabbay@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
References: <20241216095429.210792-1-wguay@fb.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241216095429.210792-1-wguay@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d00e44f-099a-44cb-fd7d-08dd1dbb71dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVFYb1d1SXJXTmlaR3V3anBnaG1CVnJvazd6eVVSMS9kQ2FoRVlMeVdUT0xP?=
 =?utf-8?B?dit0Qm9yaGpxdTh4OHBGVjU2enpUSEJEUFZFR3oxZm81dDArRXVZNHhWdWY1?=
 =?utf-8?B?SXJIcnU0TVJpRVp2WEJ4WDB3d2EzdldOSFp5MHVxMFQ0QWl4VG5YYWRHaUZE?=
 =?utf-8?B?QjdNeEFlaHBDWi9NRktuOWlZUll6a0tqamV6VzZSNGxocFl1M1RUaUpJTWRk?=
 =?utf-8?B?Y3NWbEVNaUtUcEhnWUxLdkdod2JKZkF3VGptZnpIMjFYQ2M5dVNsS08xNHR2?=
 =?utf-8?B?ckV4dDNGVW1GNnVMYUlMbWg2RHNYQTVJVHpPVWNZeWlQVUlzWlpYWldWWDVa?=
 =?utf-8?B?cjQ4dmVCNS84TFh6YnF2YlByc2piQVFYc2xnRFJrUmRBc0NCOVFqcGJuakh2?=
 =?utf-8?B?RTJja1BYZ0ZsM25nYWJaaWZVYStzci9OSHQ2cUNjbGZQazhCMThqVXVhVU12?=
 =?utf-8?B?bDBFeXY0MVhLNDJMQTNiSTNPL2R5UUQ1eWRlbExzZ1VoNEdFdFpvbWNmTy9t?=
 =?utf-8?B?d0hJeHB0KzZVMWNWRHFyeEh1Yi9ueVpsaFBadm16QzV4YysrOVhwWXZFWVYz?=
 =?utf-8?B?QkJOWlM0MkxCdW9WamJON1RIWFBTQzhUNEpFcFJXaUc5ZkYxRkpOWC9JUk5Q?=
 =?utf-8?B?TlloR2p6RGFFMTNybytzbHFLdHJkMzNNczk1VWVMMnYzZkJJSFBka1ZLdVBi?=
 =?utf-8?B?K3dXOGkvZUd4RnZnTGZlZ2ZQQnZZL2dodk8vemhScXluamt2bloxT3FPOUdR?=
 =?utf-8?B?cmkxOXdPZlJOckh1dWJWK0ExbDNrYzA3WkNsV0prWWxCTGRQVU4wZUg3dUhF?=
 =?utf-8?B?cCtvWUFxZHUzVnNYNHdQa0dmVWQ5cTlUT0lPMFB6SWZWc1RXb1RsL3NHbStq?=
 =?utf-8?B?Tk0wQkt2NzI0MDdhT3M2eFYyRlY1UndkbnloTWh2RWJlSE5GVnF3aHlmMHhK?=
 =?utf-8?B?V0ZxV09GcEJyYStiVno1SXViRGw2S1gwRkEwL3MvaWNRWmtubGxVeEUvNXpU?=
 =?utf-8?B?YjRzL2M0ck1obklMMkljU1lzNHJlQW5kdmgwQzJBWS9WemIyeDBqT242NFNT?=
 =?utf-8?B?Y2ZaUDVmSlFWOWcyZnlWOXhMMDhZbE42T2owMTRHdGxNNmNLOVdaaWRSOHdV?=
 =?utf-8?B?a1FYYmtNbE9PcDBkZS9wTVh3ZkFHSGxMYkJsRDk5NFVGdVhRbnM3a3Z5Q1Nl?=
 =?utf-8?B?SDBrZFgxdkZCa2lqck9oNkxvQVMwWTVmNDdsTGNRbGVxdWRPUlZUdzRhaUxy?=
 =?utf-8?B?TlIxQ3p6bkIzMjVOR2Z3WUt4YjBDUkhjbElYa1lCWUs5RUpNS0JFODhUZ2lF?=
 =?utf-8?B?OE9IU1RHSUxEeFp4RDI0QkZRWjVNc3RXZ2pGZVU1US95WWhVUlZ4Mjk1TEgr?=
 =?utf-8?B?YU9QazRoNFc2cDNaTXY0d3QycHFIWDVXZDdVVEdpQlRsSzVSb2tkU1FtNkYx?=
 =?utf-8?B?dnl0Z0JqWUFTWlhiQnlvSlB2dTVTa3NaNy9pcG5kK3VqekM3enNKdy9YbzZH?=
 =?utf-8?B?Rnd0K1JkNFVYMjJTTXNkbFZORUZva2VLblZSVUd2S1F3MllHa0QvRnNUVi9n?=
 =?utf-8?B?Yy8rN0l1QTQvOUViVWlDVFJVRWVrNFoySVhNL0pzSHNCTGxmVXF1SjBoSkhB?=
 =?utf-8?B?ekQ5VWptR25ra2JGb0xVU0E3MmpIRzhTSHFZZ0ZyTU1YMHVmSXJWUDlOV2lu?=
 =?utf-8?B?dzg2eXQ2dktsdUZmTHZ0SGlqL0VMTnl1emxWeGxDMi9Tam05RVEzM3REYXA0?=
 =?utf-8?B?M0xCdTVFS2VCTzBEemZKVXZZQ1htZDNoQWhXL0VLbTdlZDdVbzR0VXNZL1FK?=
 =?utf-8?B?MUZETDB0Uk04bTd5S3hocEUzc2piM2xaZkhEd3VQNjl6RDdvamZNd0huenA2?=
 =?utf-8?B?RUhMUVFYbFhWV284cW5QNjVwYW5GY21SdnFQVDRPQUQxblE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHJlNGZjUTNrQzVrZUNleFEvNDFCblpoWW5FM1ZjcXoxRkdRd0JMUy82Q3F1?=
 =?utf-8?B?MVEzd3ZWdWp4S0FoMEhwU0hnb0o1QU9oUmY1eHo3REtSNWtIVzNEOENNa2ow?=
 =?utf-8?B?Y1VrL2ZZRk5HZlN2OVh6cHlVc3d0T2dDTzJpOEVDUExHR1MvT0hKTzBVQU1M?=
 =?utf-8?B?OUpBTGdHc0hBWmROb2MwaEtuV0s5T1FEOEhGM2xnMlZYUXhIU2pwWWxyN293?=
 =?utf-8?B?S3VBd2NWMzh3MXZTcXU0VytLR3UxKzJDTmd3T1lkNkhoZVYxR3VpbjBCQktk?=
 =?utf-8?B?OEJzQ2pZWkQ0Z3NvOWswQlRGZFpWalJjbFo5dW9vVkJseVFncTNzaW5OSElO?=
 =?utf-8?B?Vm93bTR5anFTdkc5K042TUVQTUgyN2NlTEtRTElQVU12YlVWNjdoQ0JxWTNJ?=
 =?utf-8?B?Y3RXdjVuYmtoU3JvdlBwUFM4QVVwMjVWZ0doMFFqMXFuNCtoMWFPRksrNGlx?=
 =?utf-8?B?Q1NJb1hmMjNVY1Zrb091SVZrOGlES005bm53Y3M4RmhUbGdhU0kyWFp0ME5D?=
 =?utf-8?B?dTk5b2R1ckRWTlRuek02dUtTdTd6N29xcFhMd3NpamhEbDF0ZVhGckFpdGsx?=
 =?utf-8?B?MitlT1lSOGtqa1dPZmlwaVZLZ2pZRkRMRjVUbHE1Y2ZNYzNsbktXME5HanFU?=
 =?utf-8?B?VnFaNW1vQys4UHJiaUp1R2tOMktDamNiakQ5bHlsUWoyK3NybjBiamNieGxu?=
 =?utf-8?B?N25ZYnMydUJ0UXY5NE8rcEhMV3EzVmxReEVyaTRQVzQwckwxZkM3NTR1RDhC?=
 =?utf-8?B?UEZXK1ZEKzlBWUJyZy9lUk42aThUZm5mUkNpaGFyVUZmYTc1MFIzbDJFZk9o?=
 =?utf-8?B?VTI3SHFoU3EzeGFSeGV2SUdvQ0hZZXhpTk1mK2pUS3djeGlva2MxVTVKS1g2?=
 =?utf-8?B?ZENTUytLdExqSGttR2toL21KM0FudnRZbnZ2aXhxNllLZi9rd3dLWWtGWnRP?=
 =?utf-8?B?M1c3SEZ5TGkyVy9HOE9oQktBVjVHTzIzcHNlMm1tSWhtd2xxSExDNXpKUldy?=
 =?utf-8?B?TkJsdDJVdmdSc1FYTnJOaFV2YkVpREZidkRaNFo2YWczWlkyY2pZSEJnSWEz?=
 =?utf-8?B?Ukd5aitmZFZTd1VkZWZyNmZmbWhRb1graUk2RTNkV3pUc0Q5Y2d0ZEhaamlQ?=
 =?utf-8?B?WDZCdXlKdWlIdXlIU3NYM1RkMWVMS2N4Z3Q3L29tMW14dWlsS2NsWjUycVYr?=
 =?utf-8?B?ME5YSGxQTWlnTlM2ZUpLTDdNcG5LYSttMys1MElwMExYMzZKVWwxZTFLWEp3?=
 =?utf-8?B?ajI5cklIT3B0WTVpRmtHUFNXT09OczkzaE0vY05UNnE1T3U0TzdFMGZwbGRa?=
 =?utf-8?B?WVBLU3pZazJNSDVDRWZMNFRDMTl5T1pXTlp3WmVDTHdFYXo0YkhweUxjT0Zx?=
 =?utf-8?B?ZnJSTmxLRFlSd29HcDk5bTM1ZUt2VGFMRHFSY1crK05INGlDZ1BhTDQva0Uy?=
 =?utf-8?B?VnByeXVjeGFLZmI4R01tNUlTT3NBc1VJNi9icjhjSTMrL0g3QU1ScVJXUHB0?=
 =?utf-8?B?TUNOVlUrQk1mZ0NraWcvTDY4U1ZQdk1jb25tZGhCUmR5T1B0OUZZTXJQTGZo?=
 =?utf-8?B?cmhoOS9xL3NtSTVRUy9Ca0xrQmljbngydGtKV1gvdDgrM21CTk9xYTY4MEkx?=
 =?utf-8?B?MkJQSzliSW9SRmFFZ01kRHFOSDRJYTFENkhGUVVmZWRSd2VneGFmaW5zM0xO?=
 =?utf-8?B?Q1VFRmtBSkQ3Tm1rMTJWTkFLcUdKeU13SFE1d0dEaWd4Y0ZoMVB5NktwRVBY?=
 =?utf-8?B?Y2diNE1HUDRTUEF6WFVYU2tNME9NY0h5ZWUwQ3VFM05iZzVnbDZ0a2w1NmRP?=
 =?utf-8?B?T0ttZU15RVdNdEtyeXRteUNIV1JSQWZWeS9HQ29UWnI2NzNrQWJESytOVkFl?=
 =?utf-8?B?WkdiU2NRUVNCU1pucGNuZXVtVWgyNDhzOXk3RXpuQlcyUmMzc2RkdEIxRlNh?=
 =?utf-8?B?SU1mVlB6TEo4RzFPVEVJclRrRzVUcXdwKzd4Z0g4dUdEUDBYTkVKQUNkcjBH?=
 =?utf-8?B?VG5kdjJ5cXFzanB5K0ZNTUdZN3VsSlc2UFRaNUd2ZEJlbHQrK0F5cXd5L3BE?=
 =?utf-8?B?c3dWOWd0WXJMWWQ1Y1hQTVdDQzNJL04rZy92WEozRUxXWXU0NkF4S29OdEtD?=
 =?utf-8?Q?LX93mh259xM9gubwp6qVrgMmh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d00e44f-099a-44cb-fd7d-08dd1dbb71dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 10:21:46.5838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkYqgi14TwSMqgXESEsE6VtUMjLBW7T11pGuAZoiGYiJM/wNousxU07Fj8rwkeWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140
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

Am 16.12.24 um 10:54 schrieb Wei Lin Guay:
> From: Wei Lin Guay <wguay@meta.com>
>
> This is another attempt to revive the patches posted by Jason
> Gunthorpe and Vivek Kasireddy, at
> https://patchwork.kernel.org/project/linux-media/cover/0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
> https://lwn.net/Articles/970751/
>
> In addition to the initial proposal by Jason, another promising
> application is exposing memory from an AI accelerator (bound to VFIO)
> to an RDMA device. This would allow the RDMA device to directly access
> the accelerator's memory, thereby facilitating direct data
> transactions between the RDMA device and the accelerator.
>
> Below is from the text/motivation from the orginal cover letter.
>
> dma-buf has become a way to safely acquire a handle to non-struct page
> memory that can still have lifetime controlled by the exporter. Notably
> RDMA can now import dma-buf FDs and build them into MRs which allows for
> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> from PCI device BARs.
>
> This series supports a use case for SPDK where a NVMe device will be owned
> by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> may directly access the NVMe CMB or directly manipulate the NVMe device's
> doorbell using PCI P2P.
>
> However, as a general mechanism, it can support many other scenarios with
> VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
> generic and safe P2P mappings.
>
> This series goes after the "Break up ioctl dispatch functions to one
> function per ioctl" series.

Yeah that sounds like it should work.

But where is the rest of the series, I only see the cover letter?

>
> v2:
>   - Name the new file dma_buf.c
>   - Restore orig_nents before freeing
>   - Fix reversed logic around priv->revoked
>   - Set priv->index
>   - Rebased on v2 "Break up ioctl dispatch functions"
> v1: https://lore.kernel.org/r/0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com
> Cc: linux-rdma@vger.kernel.org
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Maor Gottlieb <maorg@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Jason Gunthorpe (3):
>    vfio: Add vfio_device_get()
>    dma-buf: Add dma_buf_try_get()

That is usually a no-go. We have rejected adding dma_buf_try_get() 
multiple times.

Please explain *exactly* what you need that for and how you protect 
against races with tearndown.

Regards,
Christian.

>    vfio/pci: Allow MMIO regions to be exported through dma-buf
>
> Wei Lin Guay (1):
>    vfio/pci: Allow export dmabuf without move_notify from importer
>
>   drivers/vfio/pci/Makefile          |   1 +
>   drivers/vfio/pci/dma_buf.c         | 291 +++++++++++++++++++++++++++++
>   drivers/vfio/pci/vfio_pci_config.c |   8 +-
>   drivers/vfio/pci/vfio_pci_core.c   |  44 ++++-
>   drivers/vfio/pci/vfio_pci_priv.h   |  30 +++
>   drivers/vfio/vfio_main.c           |   1 +
>   include/linux/dma-buf.h            |  13 ++
>   include/linux/vfio.h               |   6 +
>   include/linux/vfio_pci_core.h      |   1 +
>   include/uapi/linux/vfio.h          |  18 ++
>   10 files changed, 405 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/vfio/pci/dma_buf.c
>
> --
> 2.43.5

