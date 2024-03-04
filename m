Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38E8702F2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 14:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F97112175;
	Mon,  4 Mar 2024 13:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ycoTpgGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90088112174
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 13:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dh3HyLal1CxAnLpXJHzHRydN45s5RKu8ro2qT4w3thFg3Drj8WBlLbuOXr9j3RHPTkl8q75oknMBEUSAsGmpHPlK40Dgw7FK37BtcA/07NfCkq3ly9qn1tqdqj19LaNyWpXqPUGYggSxoGQ+ZYCf3AQhSOh1PsYzIRqlkDRfQ8h8wcdA2JuPjG+rVdtYh1bz9TNhV0bhtNdvlMAgXyk6iXFoYYADo3bZmlkxgq2zU1NuHBNchLHqMYc8tFDKwfLPGFakMp8HHI1oI0WJe88Zj6e+8vRMgPAb4aR4RmeAs46xTn7A+hg45gu7tuoQPnIWP9m8+9EMMfYx6JrrmQCyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZKR+hcHIK+gGI3xwYH0/YLeYxhoefTNSbGkrfhSJ/o=;
 b=Mr7/60CgfQCymX43ZkbqRwtZjLpboqqvSatOhWNhayi0aJtuA+bTwUlwFzMRUBkzj1+K/vGwHWFb1fycN7DWkYvnU/Z0AcLXp7uyNKK5gYM5ah1JC4csBVYzU6ms6iL++ZEDxEmtkOb9lyKkefCPwXmDYjcFeEQ5dl8oIZX32cFbBxnEhI5T9665di5+LEOQNAqDIfRVN7nt2MjPAObNPvSXIo0jAYtv5GYZpvQS0LoSLD99v8meQ+4hsMO58xVx3/r+K6ppxHpVG1HNzhRcyMHBhvk8FmdvAPGVc8Q4toTga72VxaqGdRK8AhEeXY04Y8q7DVe6kcbLXEbeIz86lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZKR+hcHIK+gGI3xwYH0/YLeYxhoefTNSbGkrfhSJ/o=;
 b=ycoTpgGfZ1FyAcQuCSntM3/4YJ5HNleZkfTMa4N47e9P3Drjv1edHnG4cG1gWI3rk+1rjtfthM3J9f1pGPicRCcRC1Q89A8f3J8+BUJr0i+eJJpFTwvAofVclesKDQXDeMgSWDkLwDZgmIowhvM8S3VEiWLMdQXN6J1fDtuQSpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 13:40:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Mon, 4 Mar 2024
 13:40:39 +0000
Content-Type: multipart/alternative;
 boundary="------------G003fH3swmHcM6rQ5g5PdU4n"
Message-ID: <796e8189-0e1a-46d4-8251-7963e56704ac@amd.com>
Date: Mon, 4 Mar 2024 14:40:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Nuno Sa <nuno.sa@analog.com>, Vinod Koul <vkoul@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240223-iio-dmabuf-v7-3-78cfaad117b9@analog.com>
 <85782edb-4876-4cbd-ac14-abcbcfb58770@amd.com>
 <f40f018359d25c78abbeeb3ce02c5b761aabe900.camel@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f40f018359d25c78abbeeb3ce02c5b761aabe900.camel@gmail.com>
X-ClientProxiedBy: ZR0P278CA0221.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 1784721f-ce03-413f-5666-08dc3c50adc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSvWwLGf/pITM7pTTKn2ZV06sWEcIT2KqZztqfPldGd5QiqaYiYpwX4HuHVB2R4+U2KC9K94clrJVR2GjASm+9MYd4WmtNQJlRL0aWhqqCgUp8kA5TPqzNehrdFQ/nrMMbjsEWctCzooxmGziOetkAmr/yYltUtGXONslvw2B9dC9JU4EkGvbNaAWWrwcWsn7qq2EwX8NAvYKBpK6ZcyuoLSiwh0S9xLXOkLJ84trhIJ0iKARxFvK5LVt5VDxcehNQu7sIj0teA8bzk5eoSe4+CyB9DUu0xI3zUSDjkDegVEIj8okDUmy+9uRmWlkxqacg+abaVERD7Xud4+wJe7n5PpQC25GeDM4/GfqVhSNG03JlboI7Q5jm3MOLqPfP0q/LLZfiGKviDPRlPOW5YlA4/ulwogkgeLDyWm2/oS3PJx7dskoN7uyvUDFBPu9XUOzsv7Ftfgcaup9kQWO4MrrrrEffOwsVu5vSY4WXBaHp2WD5BniprNJLMwziiNMVCltiBpz5J2sZlOdVgJs9GlxfjCwxz/3WfCfzR4WhxdBiznN5Swtd3F3GIoevsJuK9hSmEC6w5mpm/1jbGXrUWN/+x2mKKIgV8kmo02UjM+bys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWhSNFBwcVNhWmo5dzNuOTk2cjYzY0dkSWJXejk5NkF4eDZxbUUwcWw3MUw4?=
 =?utf-8?B?SWVDUW9tQjl6ZnlZV0VmVnYyaTRwY0FYWFZwTjhHTTgxOHNnbWNHSTg4dUpp?=
 =?utf-8?B?Q3NGZzZzOE9TRWZCMXgyRXNsZXN3MVM0cmJpY0VzRWQ5UjNwbmJOS1NmMG1F?=
 =?utf-8?B?RmFJYkVFREJyV3dXdlEzc1JVaWV0b21RRmhtNFJzRHRMWjA3aThVS3R3VHgr?=
 =?utf-8?B?Z2ovWm9uUDFaNjR2d3I0Q0k3b1A2WXczZktva0pyUERuQ1RoTEdoZ1RiZFcx?=
 =?utf-8?B?NjlrdDRBZFNBWjVaN21YV3JrUktmbnJoUFhFa0QvT3VGRzMwdlIvU2RFZVZx?=
 =?utf-8?B?OE1lOUFvWlhiN3V0MUxnZml5TkRLWFFDRk5XbDhwTW51RXVVemk1YVBzL1Vv?=
 =?utf-8?B?dE44RzkyMWZiWFAvaXFoSHp5VlhNaXRmZk1xVWMwODQ0a0xPVkJWTituQmhj?=
 =?utf-8?B?aGRFNGxkUERRZHZtZnlWaGkzVXRXWDJqaVk5N0tPb1hYSm5Va1d1dkQrMWlo?=
 =?utf-8?B?eEsrV3ZzRXp2N2hwUjkwWVRnOGduQ1JORnptWndFY0RrQVVSSnBiRE1tcGln?=
 =?utf-8?B?K0Rqd2s0MXNpbjNlb0VNUkdoKzYxL2J0czdNQURYTDRuRHpiL1hDMVljL0xH?=
 =?utf-8?B?dGVJOGtHclBGUnBnTFQ2VzRSNVhwbklEQWtyK09SWW1FQ2ZiTTg3WE96ZElS?=
 =?utf-8?B?YXZHMGJVaVRLVmlPcXVLT0hHUC95MlVvU1FVbDRpUlBxTlpLU01GcUhCYTBn?=
 =?utf-8?B?c2NyUitudyswVEVBUGhteDRIT0FROTBKbzZMWkh4dUpsYXN3UXFGRDFuRXZK?=
 =?utf-8?B?amN1U01BS0lZZVZrNEV2dU5uL0tRME1aS0dKa2RpYWRCZFVuY05iR29BK1p0?=
 =?utf-8?B?M2lldC9MUEQ3eVNQL3dFZ0JMNWZDeUpGTm81cUZNbVRJejZuMnNUakR5Slcw?=
 =?utf-8?B?VDk1UkUwb3JUQ0Z2cmF4NGR0NmVnb0tRUGVOZ3BJOCtPbm94WUtCeFFMZ3Rj?=
 =?utf-8?B?dkE0SCtHY1BReUU1TDVDYWJqMGpDeFNabEw2OU9FUko4Zk0zZXJwZzFtUmg1?=
 =?utf-8?B?SlNsME96M21sOFpEb0ZXVS9LZGtQSmpuUE9QN1VpSjU5YzV3eGEzeExzNlZS?=
 =?utf-8?B?REF0MWdqRFRIcGp0SUpDeElqS09MNitPcVpuRFoxNnp5cjl6am9Ia2NSZllH?=
 =?utf-8?B?dlJHY0J6SDVieisvTzFDVDNFUUJ5TjBha3BnZkpWZSsvclQ0aTUvampOWUhJ?=
 =?utf-8?B?NjdpVHNYRUQrVmZ6UWxpcHU0V0E0ZVNYWHVuRmhoNzl2Q3Eza3d3NW9ERXBj?=
 =?utf-8?B?UkxQd0dtU1FEODhzMC9vZU1OSzJmL0N4SUtEMXVZK0htbWJkVVZEQ2ttRlVG?=
 =?utf-8?B?VitrN1JDcHFldDY2bjVDRmdIUWFOZVNGSzhWaUZhRHRlTnAyVjVsTUNGeXdC?=
 =?utf-8?B?OGpqbkpCenB2UGFkaWxFazJvak5CdHk1QlZhNkVxQ1ovMzRPTjVIcEdmMFZa?=
 =?utf-8?B?bjVIemV0a0svUjg0QmdraHVmTmxESHJDSHJja2tjbjl2YWVQTEJiWkZDcjdy?=
 =?utf-8?B?bDdYR3lLaGY1b0dvVUhwZmVUM0VLWFpHRXk3MTNHNnh6TnVKQVVSM0Y2YUUx?=
 =?utf-8?B?Zm5JRVFsTE5QVGo3em91ZHdad0ZkcTNnTFVXUGNpSDZDM0huUXBhQmF2Qy9h?=
 =?utf-8?B?ZHRkTmxGZERHUjVOZnQ0d2UzSmxGMEZOeDN5bi9VMTZnVnZyeXNDeTkrbmht?=
 =?utf-8?B?eThMTHIweVdUM1BqNE1lYlgraWJZdVMxcE8xdURrUFF1THFHU2dqaHVHUkY4?=
 =?utf-8?B?L3lVZ0VzMC82S25KRk43Tm9QekdNWkpWdHBrODJkSGNHa0xIYy9hei9BU3E1?=
 =?utf-8?B?ZmlPS0NuV2pFdW9UN1VIZkVXKzBOWHAvWnk3ZVhHQ2k1VG9kWG5qTko5TUhM?=
 =?utf-8?B?TEpXbGovcldxSWEvWUNJb3loNWMxMTQ5VW0rUmRMRHdmUHo4VkU2NitKbTJE?=
 =?utf-8?B?UjdhYWc5Mmdid0thRGt4eGM5ajdTelRMQWVmN01YWENKTjgwcktxQ3hZV1RQ?=
 =?utf-8?B?V3lQL2JaZk83eHdtN1NJSldhdXhwZmYremN4dzlGVkFUTENGT09YSW9XOVp6?=
 =?utf-8?Q?/ZQUy+IEWNFjYQCh0+mUF4SHE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1784721f-ce03-413f-5666-08dc3c50adc8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 13:40:39.1986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bksGYpsDO6ToGVz7xk+KZrvTup4AMFTAdKGtV0++Fy+ur3LIfWudJ6ycuECXBruF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
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

--------------G003fH3swmHcM6rQ5g5PdU4n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.03.24 um 14:28 schrieb Nuno Sá:
> On Mon, 2024-03-04 at 13:44 +0100, Christian König wrote:
>> Am 23.02.24 um 13:14 schrieb Nuno Sa:
>>> From: Paul Cercueil<paul@crapouillou.net>
>>>
>>> Add the necessary infrastructure to the IIO core to support a new
>>> optional DMABUF based interface.
>>>
>>> With this new interface, DMABUF objects (externally created) can be
>>> attached to a IIO buffer, and subsequently used for data transfer.
>>>
>>> A userspace application can then use this interface to share DMABUF
>>> objects between several interfaces, allowing it to transfer data in a
>>> zero-copy fashion, for instance between IIO and the USB stack.
>>>
>>> The userspace application can also memory-map the DMABUF objects, and
>>> access the sample data directly. The advantage of doing this vs. the
>>> read() interface is that it avoids an extra copy of the data between the
>>> kernel and userspace. This is particularly userful for high-speed
>>> devices which produce several megabytes or even gigabytes of data per
>>> second.
>>>
>>> As part of the interface, 3 new IOCTLs have been added:
>>>
>>> IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
>>>    Attach the DMABUF object identified by the given file descriptor to the
>>>    buffer.
>>>
>>> IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
>>>    Detach the DMABUF object identified by the given file descriptor from
>>>    the buffer. Note that closing the IIO buffer's file descriptor will
>>>    automatically detach all previously attached DMABUF objects.
>>>
>>> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>>>    Request a data transfer to/from the given DMABUF object. Its file
>>>    descriptor, as well as the transfer size and flags are provided in the
>>>    "iio_dmabuf" structure.
>>>
>>> These three IOCTLs have to be performed on the IIO buffer's file
>>> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
>> A few nit picks and one bug below, apart from that looks good to me.
> Hi Christian,
>
> Thanks for looking at it. I'll just add some comment on the bug below and for
> the other stuff I hope Paul is already able to step in and reply to it. My
> assumption (which seems to be wrong) is that the dmabuf bits should be already
> good to go as they should be pretty similar to the USB part of it.
>
> ...
>
>>> +	if (dma_to_ram) {
>>> +		/*
>>> +		 * If we're writing to the DMABUF, make sure we don't have
>>> +		 * readers
>>> +		 */
>>> +		retl = dma_resv_wait_timeout(dmabuf->resv,
>>> +					     DMA_RESV_USAGE_READ, true,
>>> +					     timeout);
>>> +		if (retl == 0)
>>> +			retl = -EBUSY;
>>> +		if (retl < 0) {
>>> +			ret = (int)retl;
>>> +			goto err_resv_unlock;
>>> +		}
>>> +	}
>>> +
>>> +	if (buffer->access->lock_queue)
>>> +		buffer->access->lock_queue(buffer);
>>> +
>>> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
>>> +	if (ret)
>>> +		goto err_queue_unlock;
>>> +
>>> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
>>> +			   dma_resv_usage_rw(dma_to_ram));
>> That is incorrect use of the function dma_resv_usage_rw(). That function
>> is for retrieving fences and not adding them.
>>
>> See the function implementation and comments, when you use it like this
>> you get exactly what you don't want.
>>
> Does that mean that the USB stuff [1] is also wrong?
>
> [1]:https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/drivers/usb/gadget/function/f_fs.c?h=usb-next#n1669

Yes, that's broken as well. The dma_resv_usage_rw() function is supposed 
to be used while retrieving fences.

In other words your "if (dma_to_ram) ..." above is incorrect as well. 
That one should look more like this:

/*
  * Writes needs to wait for other writes and reads, but readers only have to wait for writers.
  */

retl = dma_resv_wait_timeout(dmabuf->resv, dma_resv_usage_rw(dma_to_ram), timeout);


Regards,
Christian.

>
> - Nuno Sá
>
>

--------------G003fH3swmHcM6rQ5g5PdU4n
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 04.03.24 um 14:28 schrieb Nuno Sá:<br>
    <blockquote type="cite" cite="mid:f40f018359d25c78abbeeb3ce02c5b761aabe900.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 2024-03-04 at 13:44 +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 23.02.24 um 13:14 schrieb Nuno Sa:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Paul Cercueil <a class="moz-txt-link-rfc2396E" href="mailto:paul@crapouillou.net">&lt;paul@crapouillou.net&gt;</a>

Add the necessary infrastructure to the IIO core to support a new
optional DMABUF based interface.

With this new interface, DMABUF objects (externally created) can be
attached to a IIO buffer, and subsequently used for data transfer.

A userspace application can then use this interface to share DMABUF
objects between several interfaces, allowing it to transfer data in a
zero-copy fashion, for instance between IIO and the USB stack.

The userspace application can also memory-map the DMABUF objects, and
access the sample data directly. The advantage of doing this vs. the
read() interface is that it avoids an extra copy of the data between the
kernel and userspace. This is particularly userful for high-speed
devices which produce several megabytes or even gigabytes of data per
second.

As part of the interface, 3 new IOCTLs have been added:

IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
&nbsp; Attach the DMABUF object identified by the given file descriptor to the
&nbsp; buffer.

IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
&nbsp; Detach the DMABUF object identified by the given file descriptor from
&nbsp; the buffer. Note that closing the IIO buffer's file descriptor will
&nbsp; automatically detach all previously attached DMABUF objects.

IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
&nbsp; Request a data transfer to/from the given DMABUF object. Its file
&nbsp; descriptor, as well as the transfer size and flags are provided in the
&nbsp; &quot;iio_dmabuf&quot; structure.

These three IOCTLs have to be performed on the IIO buffer's file
descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
A few nit picks and one bug below, apart from that looks good to me.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Christian,

Thanks for looking at it. I'll just add some comment on the bug below and for
the other stuff I hope Paul is already able to step in and reply to it. My
assumption (which seems to be wrong) is that the dmabuf bits should be already
good to go as they should be pretty similar to the USB part of it.

...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	if (dma_to_ram) {
+		/*
+		 * If we're writing to the DMABUF, make sure we don't have
+		 * readers
+		 */
+		retl = dma_resv_wait_timeout(dmabuf-&gt;resv,
+					&nbsp;&nbsp;&nbsp;&nbsp; DMA_RESV_USAGE_READ, true,
+					&nbsp;&nbsp;&nbsp;&nbsp; timeout);
+		if (retl == 0)
+			retl = -EBUSY;
+		if (retl &lt; 0) {
+			ret = (int)retl;
+			goto err_resv_unlock;
+		}
+	}
+
+	if (buffer-&gt;access-&gt;lock_queue)
+		buffer-&gt;access-&gt;lock_queue(buffer);
+
+	ret = dma_resv_reserve_fences(dmabuf-&gt;resv, 1);
+	if (ret)
+		goto err_queue_unlock;
+
+	dma_resv_add_fence(dmabuf-&gt;resv, &amp;fence-&gt;base,
+			&nbsp;&nbsp; dma_resv_usage_rw(dma_to_ram));
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That is incorrect use of the function dma_resv_usage_rw(). That function 
is for retrieving fences and not adding them.

See the function implementation and comments, when you use it like this 
you get exactly what you don't want.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Does that mean that the USB stuff [1] is also wrong?

[1]: <a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/drivers/usb/gadget/function/f_fs.c?h=usb-next#n1669">https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/drivers/usb/gadget/function/f_fs.c?h=usb-next#n1669</a></pre>
    </blockquote>
    <br>
    Yes, that's broken as well. The dma_resv_usage_rw() function is
    supposed to be used while retrieving fences.<br>
    <br>
    In other words your &quot;<span style="white-space: pre-wrap">if (dma_to_ram) ...&quot; above is incorrect as well. That one should look more like this:

</span>
    <pre class="moz-quote-pre" wrap="">/*
 * Writes needs to wait for other writes and reads, but readers only have to wait for writers.
 */

retl = dma_resv_wait_timeout(dmabuf-&gt;resv, dma_resv_usage_rw(<span style="white-space: pre-wrap">dma_to_ram), timeout);</span>
</pre>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:f40f018359d25c78abbeeb3ce02c5b761aabe900.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">

- Nuno Sá


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------G003fH3swmHcM6rQ5g5PdU4n--
