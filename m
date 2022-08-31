Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D75A7BF8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 13:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562CD10E312;
	Wed, 31 Aug 2022 11:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD9C10E312
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 11:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i083RL7yVwlHapmYv7PNb1yZXZhhsRVmdDWcupC/CWXt6Kwr+4WiRvdps0KlHOJgvdxToE4C3B4tVxTaDPh5bI62P8aNTjJrywb+zvoLmI6f+P9wR7FtCBfteBWfsXOEIbEyNvijzYHbDWWcs5z5dG2a8em7y1iSzCGJodhh6tVO987ngVy40Njdgmb1TDOcB3c9dlZ6Bf12Ax46mup87CILtN9gDyPpjuw5Sm39XTqmXOZKSCRWpmNpvKW1pX8cyyEQMnGxqPy/YRV2pfFBik9bGWqqbqlb4MsLAAXH+TUw0hOH81Zc6A5/o/PJZlDisQz86gKQVlVrWH5KA+Gcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0VYsW8GS2oeFr9IwJLul9eD+McR0vh7NYWbBPfG2nc=;
 b=RQ6Kp2pNUSwZnz+0Sw+i5DmgUQFNRCC56fRzTyaeY7Zrtag42cOleHGAqypRutKXGD6oXzYzoXaQl8h7y0AS0Jb/3d9PSD26DPPx5jNiuHCU9IagflyEhFamFJj1fjmoh1MFO0JHP1wnfqEZ44dncufAfl4Efu4h7B2Qk4PURdms0VSN0MVbYZLGVOaf1xxmkOcR2chDOQFh1InDThE0eG/B6YqiOh4qcTqc1V3u7ePEfJ9LZxLWiIfHiwBUMHS1AX3MB1YnIym0Fopz3BCPSx029GHPpVsSzlv0DdWI8kNUSG3CDEMIuI6/3w6fz+4W5ePlDKuli2jITyri22johA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0VYsW8GS2oeFr9IwJLul9eD+McR0vh7NYWbBPfG2nc=;
 b=Nc1q02vU82hd18gV9LjWmxamsOF4QwtUac1JI44aYb3bTrdNbqy2Mw6f6wIGpvKUzZNPbZE37cGNApTCOFQPyTQHSYTFia901YYYyFzFtoBE/3MeLaB6jwalDaZi65dVQVBGIK8uq01EbZckcEkTBlz3yBnK9roz6P83sLg+4+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Wed, 31 Aug
 2022 11:07:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 11:07:43 +0000
Message-ID: <41b495a6-d1c1-922d-ec4d-febaa01ae75c@amd.com>
Date: Wed, 31 Aug 2022 13:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [bug report] dma-buf: Add debug option
Content-Language: en-US
To: yf.wang@mediatek.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20220831103521.3019-1-yf.wang@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831103521.3019-1-yf.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49a69372-424e-4779-240a-08da8b4106b9
X-MS-TrafficTypeDiagnostic: SN7PR12MB6885:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Ro8lHHSV0/2ld7WY8x4Tqt43PuFB+uDSUwJLNIAvkJI2MvrHXzQc+qjS8vvJ2h1Iat+1xzr+M1rNwQOwpoQnr2B0S2gLeCybra+Vkt7fKqj93/0H2HtgElRIxKpuJLGal/G1LX1D4iYGCpwohC2ALKBdpuhaWvhB2ZKSw2lPROqB1wj/FgfGC2FkikwqScu+pG3Iq2IvDdYD1rCV2MhFXsWYN+VaEYrinpJEDPX+LzBGoZmDuYZ7TM8lJCwHvgM2EbOBuGlNx4Dw2a4k6u/mksm+j9WZ4dJLd8Y0CzYtQNYhw2r1BFGTwBGEM85d9pZ3H93KLef8ahx+q3Km7IEPVFiWCyms9VdNGqQrbmXrDP47w1g2CdKoG/wprXGnj4RPoUndMnqdNGWRmRMnZPI4wyR4fpvvxb53SuTrdUEey1wVsCc4KeyaWhvWtjy8IUFBqsTFY48juQ/Gl78cQIVsPwg3eW3q5lWrMwEv1jW5F7TmVfvxgZ48rEk0p3eG6LgMqkc5gTk4M+r+lu0KcfoFCMnkNRfYzs9BsVRgg7A5GFE89YW95As4ypaSVFmjDaSW4eN2XPKdOJleYjnGn6Aae7UfH4Gc5f6R1XdbPocsp8E0zfxeEiXhsO+e9j7ZIN5BPiz+ftzpf5HkRbiXJdmVmQMKIkpENj+TJN3rM3bDT7b3/fSMCdbH38ydhoECA6LGehR5sqm9RT2eTkqjgwYcvDgX/0vc/DAF1zvauxQwfvA0qrdW3nNseIV5Vs+b0Yr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(316002)(66476007)(5660300002)(66556008)(36756003)(8676002)(2906002)(86362001)(66946007)(4326008)(7416002)(8936002)(31696002)(83380400001)(38100700002)(478600001)(110136005)(41300700001)(6486002)(54906003)(186003)(2616005)(6512007)(6666004)(966005)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VTb0hDZlBvSHM1ZTE3L202QjBBR2g1SnR6bEVRNSsyZGVZQUJtYTFNOHFB?=
 =?utf-8?B?SUtPaUc2MTFPVHhRMm9KL2tuUXNQc0I4Mkk3d3VLdFJ1T2ZQY3NyY3Q2d0tp?=
 =?utf-8?B?MXRkdGY5OHJ3ZlNTdXZKaWtRYzdsV1ZrKy9EUDhjYmI5N3ZBb3pmajc3amts?=
 =?utf-8?B?TDBWZ3hZWWhyZmJmWHdPVTNjK09ScnBuTXRKb2hLUGE3V1hWQ1gveTlUem4v?=
 =?utf-8?B?WWI1WlhYdjNFb0U2QWZTdzQ5Qks0TWNoZUhvVHpPcjN2Tmh3OHMySnFJeER0?=
 =?utf-8?B?by92QXllRVRlKytXM1BDM1k5VW9EZEJiNFlPaTBmOHhwRzMyMVhPZlkwU3pP?=
 =?utf-8?B?eVhYTU56MVlySVc1QW5XSWxEWWx1NDllTkpSQnl1R2lodkYxUWZyUWxoa3Fr?=
 =?utf-8?B?UzJEdFhkaEVMWVNkSWRSMUI2L0svMENidWFLdzZ0UEEvNEVlZTk2bTg0MXlD?=
 =?utf-8?B?b2draHNNNFV6OVQzNHg2MDBYcVQreU9mZ2EwRCsxZmY2ZVJSNkxORDJYUW93?=
 =?utf-8?B?bitqdGhKYlFOVTI2SURQcHA3YkZEZFMwZW1GOS80LzJpL2Z0bzFqdU9MU0JR?=
 =?utf-8?B?cHdmLytQcTg1aUpldzh0UGk4bTBKM2NMVUNpOGp1NmNyRExOS21PRTZ6a0pI?=
 =?utf-8?B?TnAvQnZZenFRWmNXdnVHbzF0Mzg0MjFiWG1EWkptYnFiTk9FbnBXMGxka2lR?=
 =?utf-8?B?Vlg4eGd5ZkwrVTg3bm1IQWVTT2ZwSmZQNlMwb1VEbEZzbk9VSkZnMWVDOFZE?=
 =?utf-8?B?VzE5UnB4TFowQ0NQbjkyVUh3UGllTlE2WTN4cE1Pa1lSUEl5cG5KV25kZUxK?=
 =?utf-8?B?Z2thand0M0RMQ1dYMGtmWVdDcDZ3THVsdWpPcnYwMlFuNEE4OVp5bWZDSGFz?=
 =?utf-8?B?SGRSQlpiNGE2SmdXeGpya09Rc2xsT01LdFlYY2VkK2tkUzlQaDMwcWRPenZL?=
 =?utf-8?B?Z1RSbjlqZ0ExWmxDN3pEU2IxUXFGWDlkMXlJa1VuYnROcU9SMittbVlBckJG?=
 =?utf-8?B?T0VhMk1NQU1idU5vRGZwNFBXaW5HVC8wd0h4M0xDNFArTDBGWVliS0VwMHc5?=
 =?utf-8?B?TC9YaVUzRGV2RG9qcDJUWkptZDZERnFiTjNpRTBzdE1QU3hBcU1WVnp5UEhD?=
 =?utf-8?B?OEY5dXlUczdKR2ZIQ3VNQ2U0ZW9vSWtQSU5ZNWhDT3ZNTW5MNlMwUDl3K2I1?=
 =?utf-8?B?QXh6OFNMYzRnU29IN0c4RTNrbmNzR3VEM1M5YjltcHlvalRsYXFzZ1RYVkpp?=
 =?utf-8?B?cVRTNlFiaFRQRDlaVlppWFZ3Q2lvUFVjV3lwNUhOdU1oSnlaa2Q0SGZWM21m?=
 =?utf-8?B?aHdWdWxlbmpMMnU0ZTZ1RVlUWXVBYkNKcFpyNE51ZFoxUFM4cGRCZldVdGpn?=
 =?utf-8?B?OWxaUW5ZWkNPYTh0bnkzOVFsSW50b3I4R0R2TlpaclNJSkJnWjlNaVFKcGI5?=
 =?utf-8?B?UnFmUmpjYVVxdDVSY2xVOURtR1hvUWZyQk1DZ1BuTTh6VW5qUVFCbjcwcXh1?=
 =?utf-8?B?RWdtWkZ6bkkvdkFGcWlIWFZxMzBCblNWdDR6NTR3QkI1blpPUy8ySUg4SmJh?=
 =?utf-8?B?RVdlWFJHUlQ4a0d5dEsrdlJ1T3gzSEErYm93em5iajZra1RZUmxOQU1jU2Qy?=
 =?utf-8?B?ZXN0T09YVkhZakZQUUtyMG5tRGpoZlJwR3RiNE1JOTdwS2NiS29HMmZvaTJY?=
 =?utf-8?B?a1VFR2RCOUE4MjVYczdnSUxhWGpyUkNRRUVWZDFqOWY0RjY0M3d1cFB1blIz?=
 =?utf-8?B?dGhmdUxBMXhrdExKK3NBdGQ4cVRrbTVoQ01mUnpVMjNxcER2MTBKVlVZQnZn?=
 =?utf-8?B?aFJIWTVOa2ZzeitwSzhib0tMQTB5b2dUS3lnSjV4VUlvWkJ2TU9tWU1ZV2g2?=
 =?utf-8?B?YTM0UkdMUnNncGVmSFdFMnpFcUtYZURsQXAzWU40MUJBM05WQVJIcXIrVkJk?=
 =?utf-8?B?NnRUZHBXM2JEL1dtcjFiZWt1Uk9tMm9Sb0ZIN0xaakxGeGtuQ1lETTNYSms5?=
 =?utf-8?B?UjVnUW12MHJVMTNnVHpEMllXWXZqMGo5WHRvQ0Y0QVlZd0ZCVkxwaWY4VEJK?=
 =?utf-8?B?SE9ET2ZIbExiajRHSHg3RVFubnowUTc2amJnYUd3eGtWUHVnRUNmNFp5VGJ1?=
 =?utf-8?B?T05PMW4yOXBSUmtlK09iMXVZOFh6N1hZZXVsRXNIeGZscFJjNnlOdkowVUdh?=
 =?utf-8?Q?3ij4wUPokaP5H56SIfVnzoGLNiwgp6GSiBhSZzgNLROB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a69372-424e-4779-240a-08da8b4106b9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 11:07:43.0309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZHMjdR3JNUP/Y6QrlBp8uK+6NaInedoQD6Fp7nB4BjjilgXwBc0om0xXEwq6IsE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
Cc: wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Miles Chen <miles.chen@mediatek.com>,
 Ning Li <Ning.Li@mediatek.com>, Yong Wu <Yong.Wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei,

well it looks like system_heap_dma_buf_begin_cpu_access() is exactly 
doing what this patch tries to prevent.

In other words the dma_heap implementation is doing something which it 
shouldn't be doing. The patch from Daniel is just surfacing this.

Regards,
Christian.

Am 31.08.22 um 12:35 schrieb yf.wang@mediatek.com:
> Hi Daniel Vetter,
>
> The patch https://patchwork.freedesktop.org/patch/414455/:
> "dma-buf: Add debug option" from Jan. 15, 2021, leads to the following expection:
>
> Backtrace:
>
> [<ffffffc0081a2258>] atomic_notifier_call_chain+0x9c/0xe8
> [<ffffffc0081a2d54>] notify_die+0x114/0x19c
> [<ffffffc0080348d8>] __die+0xec/0x468
> [<ffffffc008034648>] die+0x54/0x1f8
> [<ffffffc0080631e8>] die_kernel_fault+0x80/0xbc
> [<ffffffc0080630fc>] __do_kernel_fault+0x268/0x2d4
> [<ffffffc008062c4c>] do_bad_area+0x68/0x148
> [<ffffffc00a6dab34>] do_translation_fault+0xbc/0x108
> [<ffffffc0080619f8>] do_mem_abort+0x6c/0x1e8
> [<ffffffc00a68f5cc>] el1_abort+0x3c/0x64
> [<ffffffc00a68f54c>] el1h_64_sync_handler+0x5c/0xa0
> [<ffffffc008011ae4>] el1h_64_sync+0x78/0x80
> [<ffffffc008063b9c>] dcache_inval_poc+0x40/0x58
> [<ffffffc009236104>] iommu_dma_sync_sg_for_cpu+0x144/0x280
> [<ffffffc0082b4870>] dma_sync_sg_for_cpu+0xbc/0x110
> [<ffffffc002c7538c>] system_heap_dma_buf_begin_cpu_access+0x144/0x1e0 [system_heap]
> [<ffffffc0094154e4>] dma_buf_begin_cpu_access+0xa4/0x10c
> [<ffffffc004888df4>] isp71_allocate_working_buffer+0x3b0/0xe8c [mtk_hcp]
> [<ffffffc004884a20>] mtk_hcp_allocate_working_buffer+0xc0/0x108 [mtk_hcp]
>
> Because of CONFIG_DMABUF_DEBUG will default enable when DMA_API_DEBUG enable,
> and when not support dma coherent, since the main function of user calling
> dma_buf_begin_cpu_access and dma_buf_end_cpu_access is to do cache sync during
> dma_buf_map_attachment and dma_buf_unmap_attachment, which get PA error from
> sgtable by sg_phys(sg), this leads to the expection.
>
> 1.dma_buf_map_attachement()
>   -.> mangle_sg_table(sg)  // "sg->page_link ^= ~0xffUL" to rotate PA in this patch.
>
> 2.dma_buf_begin_cpu_access()
>   -.> system_heap_dma_buf_begin_cpu_access() in system_heap.c  // do cache sync if mapped attachment before
>      -.> iommu_dma_sync_sg_for_cpu() in dma-iommu.c
>          -.>  arch_sync_dma_for_device(sg_phys(sg), sg->length, dir) // get PA error since PA mix up
>
> 3.dma_buf_end_cpu_access() and dma_buf_begin_cpu_access are similar.
>
> 4.dma_buf_unmap_attachement()
>         -.> mangle_sg_table(sg) // "sg->page_link ^= ~0xffUL" to rotate PA
>
>
>
> drivers/dma-buf/Kconfig:
> config DMABUF_DEBUG
> 	bool "DMA-BUF debug checks"
> 	default y if DMA_API_DEBUG
>
>
> drivers/dma-buf/dma-buf.c:
> static void mangle_sg_table(struct sg_table *sg_table)
> {
> #ifdef CONFIG_DMABUF_DEBUG
> 	int i;
> 	struct scatterlist *sg;
>
> 	/* To catch abuse of the underlying struct page by importers mix
> 	 * up the bits, but take care to preserve the low SG_ bits to
> 	 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
> 	 * before passing the sgt back to the exporter. */
> 	for_each_sgtable_sg(sg_table, sg, i)
> 		sg->page_link ^= ~0xffUL;
> #endif
> }
>
>
> drivers/iommu/dma-iommu.c:
> static void iommu_dma_sync_sg_for_cpu(struct device *dev,
> 		struct scatterlist *sgl, int nelems,
> 		enum dma_data_direction dir)
> {
> 	struct scatterlist *sg;
> 	int i;
>
> 	if (dev_is_dma_coherent(dev) && !dev_is_untrusted(dev))
> 		return;
>
> 	for_each_sg(sgl, sg, nelems, i) {
> 		if (!dev_is_dma_coherent(dev))
> 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
>
> 		if (is_swiotlb_buffer(sg_phys(sg)))
> 			swiotlb_tbl_sync_single(dev, sg_phys(sg), sg->length,
> 						dir, SYNC_FOR_CPU);
> 	}
> }
>
>
> Thanks,
> Yunfei.

