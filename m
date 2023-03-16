Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D66BD1A1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84C410E1EB;
	Thu, 16 Mar 2023 13:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DBA10E1EB;
 Thu, 16 Mar 2023 13:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9KIM/qUPtArMXcXb3SGZBWWqHgr5CDfZrhOksdEHvSYfZUP6A4tx751ST5E7m3nrWPkX7N99hSLoi7dzVMo12hC0RpuitWP9l6vWEPFaOmCTz6I2ar1PEtUFFKaKe/58cOydow552Hgb+F4yaE10Uzvq+w9R4ZWdGxYAA4l4DCevZdrDiIJ6QVLhdztXFsVgQZiiJ00lgXfkpx6PGGnAtmYd991cWz42U5Ye9wKeXHl18SUWjYVZSJy44kTlpPHKqvdkpOzL2khHjfyYFJPzdJ0A5MJSdXr8o62sdu8pY1mlglfD65DWD83LcP0qm06k30FeH6zJUr5Hyw2elXyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLcooodllh1xsZDvwPGQ69LKffMVQqs6Qi1qy8Cv+6o=;
 b=SG4dR0/zg1eXkGF+HTu3sBA2w7dQfqylfKiOGMZf9DhCr5qKPXv6iVLEhzoVaNulkV3mKQ/dwCjAvT3a3KBpSiE1LkRL8/51bOjqrdeyswt2o/DqylPaYzvvsX8k3S510qPHysqLYNoB719Wi+hYh9+eOEwZJQQ+smtZK0f6gAPdOL64P0VdpOCJURfO2tG84T7z9gEH/V4+62VtN3ssxsZKqsg2pq3cpGRG8o5c71tMQ5Eatp4A6ko9Cz//ADoa5OwE+0hQbIv6An+blN4iMPE44XNqXq/saw13HR7psT2F1E1qnoetCWBZ4MtwE8wnIloFXYJECI4xN22HyGZE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLcooodllh1xsZDvwPGQ69LKffMVQqs6Qi1qy8Cv+6o=;
 b=Fyt3tNaaQhBH+Lj+xoBD7xu1fGIrgjS4PnTrdOLz3VZb2XOrshHW/v+28GulYj9Rdclg3NcIu6r6loE16RWCCahjbPH3ym0vmyG7ZdcaKHURD6cDLBk+z88pFQ7pT5zQrQDJ+g68/TLbFB+tm5ZaPiEgFe838dMvrL5on6d1g6yZ7YThkcMez65TbrOWsIuJCoM/Zmz1gzBjGWzz4swbj8OpMJtoVfuVh1NV5AeVcFvX/WFyESmg4fLubXvWtuSt0zknq+qnhZDNv75vOgYa6WXB8NJO1LvVvkX90PCoEwqf7MB2Ug8TFWmDxItM8SRUklI+Hf5YjOHaaSXUofjpbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:58:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 13:58:52 +0000
Message-ID: <1097b40a-704f-62a8-129c-758ea50a073b@suse.com>
Date: Thu, 16 Mar 2023 14:58:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
 <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
 <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9f9bde-d4ac-44c7-4f32-08db26269304
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pz1c9WBrqFXE5r21p+eBbae+oKOxv+aNxnKKWZOxo35ORazVcCR33B3n0BmLjVZ/O9SbqgB5TrVslug16AUKENhX0AsfvuMBjHAgoyxN1HBtqc+s5VeLOCGPMjhknY7Vpx9eTZb/MulFcUdlHCJc8sheS97qwcpSCYSjEEnlOgzZSQ6/pu/7GgO0u3nAXB5ai1Ki9+8JtiCd5XmlrKlTAOAcPgsFR7VM+SDnEKzUnPaoFoB+lUXQ9v403eqBjKRAK+HJEr+6VaGG9lebxyPpqML7adYU+SOwoXkTCJVN8vlwAE3Iu6mbjErkzyCWKCsGg9ZcVvqfgmKPPA3N45jmZyla7YzFNacZrHRXPjY2KAvhuTUwwZ3JRH0e3WHsZnTWyDOUoqlRct1ypU170+pvdDX02mpTU5aM21yusFVvWeXOoxLbEEeQUxW37cn2kZYfCoLLbLqZMokCPLXab18QIh7pFDxCdpkVNyYHPZTC/Ep21e5tBPudp/nfxbXPJqpMxtaTlRBcKhenkHZexZko1ykQTkL4uWvwuAivfh/PBa/HPWVrwDYJZRRtu59+zUHO39rL3LiPTuQDJmeD4avHVvyAInN8Bo3Q314e48HNcoXQ6bLpjkOS2aNimz+B/GgrbEKMFPtlnPvLehiqO0gqTaG1JWCZ+6woRSU6QxQ/QHihHaE0Yb90ps5KKcG4d/Uu/OXBxpi4ILxRDKF91kZ6tsHHdPVuAG8wrGtqJJc30pY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199018)(31686004)(36756003)(4326008)(7416002)(41300700001)(8936002)(5660300002)(2906002)(31696002)(38100700002)(86362001)(478600001)(66946007)(66476007)(8676002)(66556008)(6486002)(107886003)(6666004)(6916009)(54906003)(316002)(186003)(53546011)(6506007)(6512007)(26005)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXppUHhwMDZ3dC93MkNPMlB5MEp2TXR5S1FGK2ZhT0JRQlJrSXlxakkrSHNz?=
 =?utf-8?B?TW9JZTBkQXcvRDU1N2tUTXU5SG9rc1J0T3lyZVhxdG55endwcUN2VjRQdWly?=
 =?utf-8?B?UWdjTStJS01kaWg1OGhTZ0xURk9QNk11ZE9Da2ZQZlpCTUptUTUwYlVMZFpH?=
 =?utf-8?B?SGk2dVUrZzJtYkRtdkludTVhbjJSOUN0RG1WTXV1b3UyWlI1MXhQdkdLNWoz?=
 =?utf-8?B?T0ppRzlqZm5YZEdUUCswcmsvZThjNVhwQWhRZ1Z6RDYrbmt6K0I0MnZFNTZh?=
 =?utf-8?B?N0dkZ1BFYVJld2FvVUdLUm1ZSWhrK3c2VW05ZzlQYVdoN3VmdWZaUGxBa3Qw?=
 =?utf-8?B?MjVUVUl6THFURVVYT1YzZTNSSXVCL0RiMW93dGlwNTlzSkNRT1IzTXpWbUNq?=
 =?utf-8?B?N1VNYXQ1WkVvQ0Rpc2pzWG5SL0lVMzRBWjVwOC94UG50RkVZSUdua3hpMm5L?=
 =?utf-8?B?T0paclRrdldzZEIxSGxvY2lUQUd3MVpReWppL2diSm83ZDFGekU5dEVDdEEx?=
 =?utf-8?B?eWhoUVArVHB1SFo4SG9yOGh6NVpPWDNvQlB1eWRxdXZjdFFvak03eTlWcXZr?=
 =?utf-8?B?VUExQzY0S0o4T1BzOWNHSG1hbVVMd1NkWXEzOHFzQndpSklUWGhtajcwQkdH?=
 =?utf-8?B?ZzZma2MxNEsvRUhFVEJNTVdjVlB4dlpzMU8xRjlpMXJGMkJaMHJoTUtOaTlW?=
 =?utf-8?B?TVc3Vkh3MXZTL0xSV0xBZEFUWnlwK0xzYWpCYTYrZkxRZzVsUXZ3THl5dGFz?=
 =?utf-8?B?b2t5VkJNQUduMitOSU03aU50MkJuUVpUUUhPZGo3N3JBUy8rank0ekJpRzRR?=
 =?utf-8?B?YUVJOTNiWGkxeVZmQndHVWU1V3BqS2M2S3BvaytSbkYxV3pqUzdQTUpmazNj?=
 =?utf-8?B?aWMwaFhlalRjV21YNjE0QXlQVXBDT05BbFhIc2U5dVRaaUlaS2sxbGphRWU2?=
 =?utf-8?B?Z3JvSHhtQkVIZy9YbnQxUGRsdGlkRnFxRGo0Q1ZRcWd1RHo2SzJ2MXdCc2xS?=
 =?utf-8?B?LzJ3aEFmekM2K3R4cE5ZenJyZzVYKzlxeldJaVVkdzA0QU1yNXFoODl4b2lN?=
 =?utf-8?B?YmtGM0RMd3dCdmNwdVR6c3NaOXo4SXNISy9YRTQwVWJIN05MUkt3cUJlTW5N?=
 =?utf-8?B?VUJxMjAvbkJuU0ltMEJiY2oza29SSlZ1K2ZFYVhFcURmOGZCRnlXaVVUNkFn?=
 =?utf-8?B?OHFrdjJlVXkzYUlWZDhQR3QwRjkveUxxeDhuZ2JZNFV3dDJvdnZuUlFzMGJj?=
 =?utf-8?B?S3c5MVMyZS9YMkZGc3dUYjVyTitGTnlPYVZucUljN1pqaUF1V2srZk5HRWdE?=
 =?utf-8?B?TnRQMVRWQ2hUWVBRb3BSQW9uaDNWQU1WcHZHV29OeG00cWMrNjhyakFEU3Uz?=
 =?utf-8?B?dWVlSDd2SUxKT1VmSXVMZXpFZWllT0JBMGpjKzhLWFROWHg3bHVpZDdXbG1O?=
 =?utf-8?B?NFBtWE9HRk8wWGorSXRFZUFLYnVob05ac1pRZ3RtMm9HR2praG5yaVZpQ0w2?=
 =?utf-8?B?eVloRVRRd090cWw2TVN0RFBuakVDUWhWNHB5bXBaSURMT1B1WUN1YVNaMnU0?=
 =?utf-8?B?SUJ2T0JFTEFORVk5SnIvSlpWc3YxalE1dlNkOThZMmJrcTRhLy91MDMyWWhw?=
 =?utf-8?B?UTYyZ0VucW5HYkdqTW02akZDNWdPWUQzVHNLZ0NESVgrVGQwTFFRQS9pTjhZ?=
 =?utf-8?B?MDNab0FGZXV4L1RGV24yNFZ4cVFZNEt0cmc0TjIvQUs4TVBvT1VZWk9jNnZO?=
 =?utf-8?B?RFlkQTQ1cWdYdHZhdTNXRFl4ZFV0ZXpBNUhOc2FSeW9pWTUvYjdRRld5bE5j?=
 =?utf-8?B?RWliKzEwRXJ5MlduMG1OZHlaQ2ZRc3UxN0E1WklkSGZ0Q3NLTmNsQXIrTnFj?=
 =?utf-8?B?aVFySjVNdnR4Wlh1aGh3dURJL0RHbFVtNDV5VWF5aU9rbG15ZTRNdmNNT052?=
 =?utf-8?B?RkgzVzNmay91RUhLZ0RqZjlqTzZ2VVk3bWxTT0NFQTZHeVdYRjdEckhobTc0?=
 =?utf-8?B?SnVsUlcwZ0F4dXdybmN3M3oyYnpCZ0ppejBDalRWUDdmNGV0Q1c3TDJmcW9E?=
 =?utf-8?B?bjVDYTE2RzZ6YkVKUUkzZ2k1ek43RGUra0Q1T3hxSitzV1h0d3AzMjBBMmhK?=
 =?utf-8?Q?IoloZmCIt4Is4aMDFiE0VIZ6K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9f9bde-d4ac-44c7-4f32-08db26269304
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:58:52.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6L+yeBSgKN5l7iVlVOtTPT9fKR7592IQUaO4ykg9M6IOzs6tXipPy5kJ5XNb+tlA1tdiMQadjxAO4jAy0IRfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Chen Jiqian <Jiqian.Chen@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.03.2023 14:53, Alex Deucher wrote:
> On Thu, Mar 16, 2023 at 9:48 AM Juergen Gross <jgross@suse.com> wrote:
>>
>> On 16.03.23 14:45, Alex Deucher wrote:
>>> On Thu, Mar 16, 2023 at 3:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 16.03.2023 00:25, Stefano Stabellini wrote:
>>>>> On Wed, 15 Mar 2023, Jan Beulich wrote:
>>>>>> On 15.03.2023 01:52, Stefano Stabellini wrote:
>>>>>>> On Mon, 13 Mar 2023, Jan Beulich wrote:
>>>>>>>> On 12.03.2023 13:01, Huang Rui wrote:
>>>>>>>>> Xen PVH is the paravirtualized mode and takes advantage of hardware
>>>>>>>>> virtualization support when possible. It will using the hardware IOMMU
>>>>>>>>> support instead of xen-swiotlb, so disable swiotlb if current domain is
>>>>>>>>> Xen PVH.
>>>>>>>>
>>>>>>>> But the kernel has no way (yet) to drive the IOMMU, so how can it get
>>>>>>>> away without resorting to swiotlb in certain cases (like I/O to an
>>>>>>>> address-restricted device)?
>>>>>>>
>>>>>>> I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
>>>>>>> need for swiotlb-xen in Dom0. Address translations are done by the IOMMU
>>>>>>> so we can use guest physical addresses instead of machine addresses for
>>>>>>> DMA. This is a similar case to Dom0 on ARM when the IOMMU is available
>>>>>>> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the corresponding
>>>>>>> case is XENFEAT_not_direct_mapped).
>>>>>>
>>>>>> But how does Xen using an IOMMU help with, as said, address-restricted
>>>>>> devices? They may still need e.g. a 32-bit address to be programmed in,
>>>>>> and if the kernel has memory beyond the 4G boundary not all I/O buffers
>>>>>> may fulfill this requirement.
>>>>>
>>>>> In short, it is going to work as long as Linux has guest physical
>>>>> addresses (not machine addresses, those could be anything) lower than
>>>>> 4GB.
>>>>>
>>>>> If the address-restricted device does DMA via an IOMMU, then the device
>>>>> gets programmed by Linux using its guest physical addresses (not machine
>>>>> addresses).
>>>>>
>>>>> The 32-bit restriction would be applied by Linux to its choice of guest
>>>>> physical address to use to program the device, the same way it does on
>>>>> native. The device would be fine as it always uses Linux-provided <4GB
>>>>> addresses. After the IOMMU translation (pagetable setup by Xen), we
>>>>> could get any address, including >4GB addresses, and that is expected to
>>>>> work.
>>>>
>>>> I understand that's the "normal" way of working. But whatever the swiotlb
>>>> is used for in baremetal Linux, that would similarly require its use in
>>>> PVH (or HVM) aiui. So unconditionally disabling it in PVH would look to
>>>> me like an incomplete attempt to disable its use altogether on x86. What
>>>> difference of PVH vs baremetal am I missing here?
>>>
>>> swiotlb is not usable for GPUs even on bare metal.  They often have
>>> hundreds or megs or even gigs of memory mapped on the device at any
>>> given time.  Also, AMD GPUs support 44-48 bit DMA masks (depending on
>>> the chip family).
>>
>> But the swiotlb isn't per device, but system global.
> 
> Sure, but if the swiotlb is in use, then you can't really use the GPU.
> So you get to pick one.

Yet that "pick one" then can't be an unconditional disable in the source code.
If there's no way to avoid swiotlb on a per-device basis, then users will need
to be told to arrange for this via command line option when they want to use
the GPU is certain ways.

Jan
