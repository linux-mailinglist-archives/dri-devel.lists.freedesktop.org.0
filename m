Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993A78512D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 09:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4276D10E2C5;
	Wed, 23 Aug 2023 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E531E10E2C5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 07:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu+TFixh215w5iroVrdRfEsrNBFNIBF7QZAR4WFcwCgaBjoVAtGPSHjAoDc2VWbQp6sJvG1U8k3xv9NrLqMXVUBPH1Mcx9yQzfQRBg28inozpTVpJc0Ocj7VYASkZ6Tga4arggAwNlnbHt6cDy1O+5TWReggFTPB07QLNnBmnEf2s0VKd6WLAmw5nUQSMi0qrIeJj8+79WNz254b+zmUlpKpnES8wgkGdc6OaahCGD2GltKhDHgzZikW+5Jn1DlMb0t3XBNf8/IIzJK/FPIdesoNv3k4tPcL+O7KRRmKBG1NXEhUUV+04Jb2swyy6jwP10YjgFa2CeZoOoOGJc5H/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ9oCRnnTBuaXNUXSnIcU7+yBcbLaSDpO41hmwCnXu0=;
 b=X/VTx9Dz3U/faoWJjeggenHzW6Gk/x6PXsTiNKW686XDlFB89EXFVc1vG+5WtB4BamRDWGEDgd8Kxj8sGmnXLfk/bGxmNt6iPxoENhpz2A6VvhRny02xdMlLTfXGewENLTK8/+Q+1RQhr2r0uPuREZdgtDCzvWLDM5GG+A3YDivVwYWB865GHXA69WSMiuN7272jM/Y28sHCEb0BZUVrYwJ+11qndZlxkL9eYNKSQGXhlH76VQZbcmUbBki2sZEyCHhK6gPyqkiOb4i9WY+NlFacqMthqhgfU4nMQVCJNsOAltlnV1LVtv6RIobCWjsJFjqDkaiWrorjorLc+2yv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ9oCRnnTBuaXNUXSnIcU7+yBcbLaSDpO41hmwCnXu0=;
 b=V5b2BqPI3wsvXcMwrkjfiOhoJYpjxpoghJ+za5oX978uYfAKAPb9njB8PlAP7yA9ZXcl+q2jjG+F2Hcv2R+W6M1SvtP4PM+mb25QVn1tQA0sTQMX6h+84XH/vlm8QTzngEEZ1OJVg+suDmkHQuBdckyhOY3/I0M5GUMLDxXQ7mo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DS0PR03MB7251.namprd03.prod.outlook.com (2603:10b6:8:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 07:11:37 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 07:11:37 +0000
Message-ID: <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
Date: Wed, 23 Aug 2023 15:11:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
Content-Language: en-GB
To: Tomasz Figa <tfiga@chromium.org>
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|DS0PR03MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2f1bf7-85f1-480e-cf85-08dba3a830de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfS5l1NrAoleWoMhAhz2IRxCg++aSXYSlj/+NqddLo8Rh5zzRwoZ45mqWWQEIkBbd4QwFQmghb8xPFVXRE2ywSydFrOBnOdBdmeU73RKG1dakbFDfoT7csp7aSpdszSNNHkdyJVk11GliE/JI6XtnM+tyC8TjXna+1ZXcf3aEBaAPJ4HbeTlTnq/y6teF618jn4QaeVPM82QNH1kfMsIQy6KaezKR1WhS3WLUnLbHyRpvkPq6T2+e2Av+yzk0ICHx0Hdb6qniOtzs0tb9+2DjjRTtUTFfArMhbMOM8lgHyCYJT5XxeEidCbvZYfG1+KcWY5XxmBs3x7T32yYBbFyr2taYJUGj1tDxyzPxFq4Sga12ARfndlhiFSsMIz2WmMPr+XVt8yA3+RQ96VLyfxftZDCoN8adCemmSVv+Ekw/LFgXhzHkGoccxv/DwysMfBCfLfPLthUk2sawsWjfQ0f+D8HR63qVdAlezGjMbLuyqp1oskFRMtxScPyIUm2yGtHDpKcLLYZUjpoe3fe/QL8mZZzKgwYGWOlPmMSW5XkQ0++czfRoORDeMyEknfJPi6L3h3qVani9BWccl98krH4AeYntvxZen+iwnhfhvY72I/O/6MUDw3QiUvVh9bbhVFvCoaHcfeDuMrTozAoGtsnAEtUCvfHJjTOzszJVVznojM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(66946007)(6512007)(316002)(8676002)(8936002)(2616005)(966005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(38350700002)(52116002)(6506007)(6486002)(53546011)(83380400001)(7416002)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVhLeDUvVVgzWXZkaU1WUTQ1Q0JxNmIwaXdKbTg5ZXI1YlJJK25HOXFqSzNQ?=
 =?utf-8?B?TUgrbElyTk9wQi9SbjNmdGJ5RkRDYndvSU54ejl2QmtxOGdKNy9UN1hVQUYx?=
 =?utf-8?B?UWxEYUUvelBJcFlCUmpCRWl1b3BoLzZJd1hKTDBGclFEeUx1bW5KVzZRREJ5?=
 =?utf-8?B?cU9rcjhSeldQaDgzVDZTc3pOV2R5ZGJKN1ZzNHFXdkVONzhtSmtpMTJ1cUs3?=
 =?utf-8?B?MjYvM2Y5ekFQRWQ0V1UvWmFPUkt0Yk9nSGZmU3N0VS9Ldjk2MVFheHBOZHlH?=
 =?utf-8?B?TjMwV1M5WVZhQ2JOajFvc25XeGVWOUloNFNCQUNLNUlFeHlqeEwzc3pnZitl?=
 =?utf-8?B?U0kvUkdPbnY4ZTBqNTN4U3drYVRvNTJENkNkVFIzdER4QW01cWJ3eVoxNU51?=
 =?utf-8?B?SXR5N3pKUnRYNmgyZWhEdlk1NjB4MDBRWk5CYVBTT1N1ODRQZFJ0bFQ4aVp3?=
 =?utf-8?B?MVlOc2dqVDh5VXBEcnVJNGI1Z1VDOVRZdXFrdUIwT09LWm1sOXpUTzFNQ3VP?=
 =?utf-8?B?ZDVWb0xMcUI4d0VQbkZvNWRtV3NIL2VDRkFwTmVlajVrY05VQ3d4OW5PeTNv?=
 =?utf-8?B?bFRYSENhS0VyWXh4TUNORVdtUm9CT3JSdktENmZheTRZa1NobE5wVVVxdWRx?=
 =?utf-8?B?amFQSmdvVTZETG5UVDVuQ3hxcW9Ub0VxOHZJNGdVTDJNS1k2NGhWdUs5aEhD?=
 =?utf-8?B?dVhJcnhQTWt2MzBFdFBNbElQZFFVN0Y0c1d4aVhYV2Y5RHphZXJVdldMOVZG?=
 =?utf-8?B?QUprREZwQlMzNWsydnNNbUh4bjYvUkNzZFZBWGxZdUMrR1BqS2Q5bGkzYlFo?=
 =?utf-8?B?K0xkY2IwMkJlVUl4Q1p1Z3gybnliclprWWgyZ3pZdnpWSHdHUEdUaWFVaWhw?=
 =?utf-8?B?R0ZnMXo1MnNIZDdGdHFza01ZOVNmdFRqQ1BRSTg5UmZwRGV3dlo1NFp4UElW?=
 =?utf-8?B?cFlSUDVhR2xFZnNOeWF0Z1VtQjJuSXNRZDFHeDNzVWJ1RFRzM0tBQ2RVaUZL?=
 =?utf-8?B?aWxvSjNNSUpBVFdzSVduVzBSQ0R0VkZDdUVEUXQ5QVd4NC9iRFdraHFSTnRH?=
 =?utf-8?B?VVljeXJNVE1UZGdKaWxITlYrUDcyRW1oZFJVZDR1dHBkeStqZXQ5Mjc1S010?=
 =?utf-8?B?MmwycnIxN0dEM3VTeHN1SDBlUGI1UUNDSittck1ZOFBZL2gvOENxMTZCdHJB?=
 =?utf-8?B?ZU0wV0JCRlA0T2hVMTBUdHBPSUFJYVErNDZMSE9udTZWQWRGSEtiSXQ5enR5?=
 =?utf-8?B?TWYycFVoOFdsR1BKT2xLU0xvSDFIdExIVnJNbk8zcVNmRHUwUytHTm9UY1Yx?=
 =?utf-8?B?RW5SVTVRcjVJeUtjUHZqL05HUEVhWXExa0R6a2Y2YmtSbXhjcmFlb0pJKzRh?=
 =?utf-8?B?MHF2YmVFdzBOMlhpaG1WQmtQQ2F1MDRmTXNKK3lWdTJ1RFBveU5QNEo0bk80?=
 =?utf-8?B?dWZzTDk3a2lGZWl5NkJRK3BzMFdZcXBjMWc2bzdiSzkya3pEeGdJcjYyc3JG?=
 =?utf-8?B?cm16dm9yaHRZR2xsMjMzVGJmUlpnc1ZDdVUvM0JJczAvMTFLT1dsdnhlYWp0?=
 =?utf-8?B?UW8vUXVscFRkYVVVdnVLWXlyQWJHUklBdklzd2lJRWo2MEpGRzVhOFVlNjJL?=
 =?utf-8?B?RXZucUNuVnVadnNMRVVLN2tqajgxeGlWK3ViTVhrejZROFhBNkZuZ0VtdnVh?=
 =?utf-8?B?SUE2Uk9yTXM5MTNjVGFpUDJUZWVCRTRDSGhPQk5aWG5oTlA5RHhWUkV2aDFh?=
 =?utf-8?B?dFVEbVh1eU1oOGZVQUhZVVU0aWxSRmxHaDZZcm0vTU9ZLytqaktxVDc5UHU3?=
 =?utf-8?B?UldQTnFVWGp4WE1IVG1rUThqbHVONjVPR0VhcnNuMFA5bktGWG83SGEvNHNB?=
 =?utf-8?B?Q2xjQTM0dWsvSTdaMi9hWjZxUGRyUHAvQVFnbHlwUWJDc2x6TFVOTW04Nyt1?=
 =?utf-8?B?eEw4aGJhcmJwY3NjRUpoSzllelFVbm9lZlVQRmx4L2Nla0RIYkx4YnZSOWlO?=
 =?utf-8?B?TlpBWnBxN0oyUTduRVJPVXFxTVdyOUVXR0ZLcmVGemtDaEZ3d3ZaRTYxMWQy?=
 =?utf-8?B?OTQ4Yk5TK0xqdTZKSjlZL2I4NndYd2hXR2VJeW9wa1RsT0dPeXhaUWJ5QW9y?=
 =?utf-8?Q?uC8OoDOz4ZhAe670JJjcbl5C6?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2f1bf7-85f1-480e-cf85-08dba3a830de
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:11:37.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PS93sEMgbKu/X8Ov48qRErgQnUJyQ+qT3F2EK9R8qr0QyP9mT2UptuGuLzg1O3HjP0uS5c/aqyFYBixxgItdFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7251
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-mm@kvack.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, akpm@linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/23/23 12:46, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Hsia-Jun,
> 
> On Tue, Aug 22, 2023 at 8:14 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>
>> Hello
>>
>> I would like to introduce a usage of SHMEM slimier to DMA-buf, the major
>> purpose of that is sharing metadata or just a pure container for cross
>> drivers.
>>
>> We need to exchange some sort of metadata between drivers, likes dynamic
>> HDR data between video4linux2 and DRM.
> 
> If the metadata isn't too big, would it be enough to just have the
> kernel copy_from_user() to a kernel buffer in the ioctl code?
> 
>> Or the graphics frame buffer is
>> too complex to be described with plain plane's DMA-buf fd.
>> An issue between DRM and V4L2 is that DRM could only support 4 planes
>> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
>> interface to support that 4 more planes which would lead to revision of
>> many standard likes Vulkan, EGL.
> 
> Could you explain how a shmem buffer could be used to support frame
> buffers with more than 4 planes?
> If you are asking why we need this:
1. metadata likes dynamic HDR tone data
2. DRM also challenges with this problem, let me quote what sima said:
"another trick that we iirc used for afbc is that sometimes the planes 
have a fixed layout
like nv12
and so logically it's multiple planes, but you only need one plane slot 
to describe the buffer
since I think afbc had the "we need more than 4 planes" issue too"

Unfortunately, there are vendor pixel formats are not fixed layout.

3. Secure(REE, trusted video piepline) info.

For how to assign such metadata data.
In case with a drm fb_id, it is simple, we just add a drm plane property 
for it. The V4L2 interface is not flexible, we could only leave into 
CAPTURE request_fd as a control.
>>
>> Also, there is no reason to consume a device's memory for the content
>> that device can't read it, or wasting an entry of IOMMU for such data.
> 
> That's right, but DMA-buf doesn't really imply any of those. DMA-buf
> is just a kernel object with some backing memory. It's up to the
> allocator to decide how the backing memory is allocated and up to the
> importer on whether it would be mapped into an IOMMU.
> 
I just want to say it can't be allocated at the same place which was for 
those DMA bufs(graphics or compressed bitstream).
This also could be answer for your first question, if we place this kind 
of buffer in a plane for DMABUF(importing) in V4L2, V4L2 core would try 
to prepare it, which could map it into IOMMU.

>> Usually, such a metadata would be the value should be written to a
>> hardware's registers, a 4KiB page would be 1024 items of 32 bits registers.
>>
>> Still, I have some problems with SHMEM:
>> 1. I don't want the userspace modify the context of the SHMEM allocated
>> by the kernel, is there a way to do so?
> 
> This is generally impossible without doing any of the two:
> 1) copying the contents to an internal buffer not accessible to the
> userspace, OR
> 2) modifying any of the buffer mappings to read-only
> 
> 2) can actually be more costly than 1) (depending on the architecture,
> data size, etc.), so we shouldn't just discard the option of a simple
> copy_from_user() in the ioctl.
> 
I don't want the userspace access it at all. So that won't be a problem.
>> 2. Should I create a helper function for installing the SHMEM file as a fd?
> 
> We already have the udmabuf device [1] to turn a memfd into a DMA-buf,
> so maybe that would be enough?
> 
> [1] https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/dma-buf/udmabuf.c
> 
It is the kernel driver that allocate this buffer. For example, v4l2 
CAPTURE allocate a buffer for metadata when VIDIOC_REQBUFS.
Or GBM give you a fd which is assigned with a surface.

So we need a kernel interface.
> Best,
> Tomasz
> 
>>
>> --
>> Hsia-Jun(Randy) Li

-- 
Hsia-Jun(Randy) Li
