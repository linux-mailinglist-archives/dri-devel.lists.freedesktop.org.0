Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A5A870399
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 15:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFE11121D0;
	Mon,  4 Mar 2024 14:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i80SSS/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B96E1121D1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 14:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENWRqW49UCk3cDmqebYR9X5x2jkwC+8LhMitvr9l47FNCXE28VHjYKkD6d3R1ZGQGeeoPxqscqLm9YDQo9k7pFKdZdpbgGC17Ovrid0HgVl/C9HUfcdBjlDTyR8HEJl7HXShg3Ua25Voq/iu6NOTw4NmB/UM2dk6e1HByumU36S1WReVPFOUupcTo3AsXCLLZ/AnnaJ66nuQ2BYr9d05ZYevoeybkVzXihqXIBqXHcjTTrD/2IHkR7l+mXiAsxZDwYTzGMc467otZ6eLV86j8aJ4nYCSTOiNrE1VxeSq3MjYYYoYbe5mwaSrZJEsopHM1KaSIzrWnCSLlHHbOAChMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giJzMAjGzgO5xRM1VIgQpGF4mAdEnrqBct3MlYnGiNc=;
 b=HX6YSuRYQXwx6/eRaARWJPgHkSUBS8lE64rEXbqEnCGfdKjAte/3Aq4g6yg8TC9ml2FItyhEnu829Immt8SOB9+yGKIvJMRrpCBy/OnqHI6HulXtGMZCm5Dcz3EDkLMTn+L9WsuTIC1+c5uy31YNl/5bj/GWqYiJXMBGsktigYg+XrHrR+sBfRy6rvYOyfZ22WYzdWNxW/AxyillChnZAD+62cEbrSWTOdMwFPICIfz2EH/l15L/0UaP7QUXWmBZSIOC9r0baX7284sBuQgOBUSeMjdV8CD0z4zibbDdVrSaZigA+y2SfhSTh6BgKHTyUwrs71l97e1g7nDoTM46lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giJzMAjGzgO5xRM1VIgQpGF4mAdEnrqBct3MlYnGiNc=;
 b=i80SSS/bHzUYQFBEFPmKh4IOsk9hxJGb5dmZgqdxhNKW5cveAQV7w1nNPGfmETEMYwrSWUzRIno5zpLioi3GXTKccxEKghixYIRXwJLX/vmbG+qiVYWaDPemRkwIxqifhvNLwgLD2W35tzJpOiezrU5uEBQ4JvRuf1dSj9KJe7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5743.namprd12.prod.outlook.com (2603:10b6:8:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 14:07:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Mon, 4 Mar 2024
 14:07:17 +0000
Content-Type: multipart/alternative;
 boundary="------------EPzh60HdejG5yPGqLZzXs02Y"
Message-ID: <63f8a0f5-55a4-47c9-99d7-bb0b8ad22b3a@amd.com>
Date: Mon, 4 Mar 2024 15:07:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, Nuno Sa <nuno.sa@analog.com>,
 Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240223-iio-dmabuf-v7-3-78cfaad117b9@analog.com>
 <85782edb-4876-4cbd-ac14-abcbcfb58770@amd.com>
 <d17bd8aa17ac82773d0bdd6ce4edfe4a6249f179.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d17bd8aa17ac82773d0bdd6ce4edfe4a6249f179.camel@crapouillou.net>
X-ClientProxiedBy: ZR0P278CA0145.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: a52e8aa8-49dc-4cab-6e87-08dc3c546645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z/sSZb6ZmxtPN/qLTAj++ZRBfxgotwgi7d/+GRruFmGwZG3N9gxV00jvAO6tMbcPqMzCWtsqyN7epAJONX4pyi0ewSGvBYZdhhjk+w31nD3CChGXJd3SqyVuDvbPwgvuG9vNzR2MVcTtsUhzBRWeoGS67Qjv5W6txsjj/4rYkYEj5TRfL4mORhUpNnMpIJr8MXV7zBSI+PXQSleAfprDlMhLWcTOmn9jx5Lzif7bIYCpg/5u60tXvplTZdpFim16qAtvJlzNK1ZZF/OUFcyoF4D2BGnuTCfRB97iv3l/00v8FjQLfUOCp1ya1pkHszjlSPw2lmtGqsxVSfYJwiZhG3aWsGhk2JtZRANEyz/h7FAGvQ0gbzfEfxG6r//v8qgMyzy3vOEty+lmpMmM8yxv5rQPjYF5Nb+/Fy4Bgi4DGlZla1xT1SVMgyp2lHrFy9R81YF7lqJOpb5kW+nzDC01WDV9vMOFgvLI6MNJTsQjTOs8gFhWUobSpKTFnpyovvTNy8KC9dtj4JrRVA3zQG1tKOFk1JGNFqg7dCnFo0GnZ0KcSJ95UNBaSMKLuXNEcV9UeMWuxAX08KsKrFKTcS8SMYIYiKFT1zkTAk1tlACcwzJb164t4bXsboDalPftH9JP1WG9Ztl2tWxQZ6zMSQLxfODIWwBl/wr8Uiq1ZaMlbcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDJ0RkVzWWQzbWx2S2p5dWFqYW9Bc2RFazlYaXlqZkU3ZEEzeFRzTG9TelpC?=
 =?utf-8?B?LzN0Z1c0RnI2TFhLMk03QVNxUUg5TWdHNzlZeFhveUpFODRoZG1oWWFSZG5G?=
 =?utf-8?B?dHNiY3NpVnQ0VUdFdHhxNzQwTlRMR0x4QjlFbXdoNzllSEt5Y1V3ZEJQbk0r?=
 =?utf-8?B?MTByVEtRQm0raUtrYUtiYnRVcUZrSlJLT0xKZlpRY3dQTytlTXRkRVpBMHor?=
 =?utf-8?B?eGthMmduRm92bTJsdXhhTjlaTnE3cWl6YmlBcXFSczJ3Sjc4SDlyQkhuOEZT?=
 =?utf-8?B?b1JvNGFvMnZsVEdqT293N2R2VVY4WHpUU1M4enNJSnIvWUtvUmpuUGYwenJS?=
 =?utf-8?B?SHRaLzNMZWtpRjFvd1U1RjN5TmxYSVFWYTlJWXhWN3c3dU1hODZCd05DVmsz?=
 =?utf-8?B?Q0tqMkROeTdjenRtM1JUK1lpcG0yWkN0OE9VYmJNVjQ5bU9CWGNVdW12UEo5?=
 =?utf-8?B?Qjh5dU4yb0JzR1FGVXJYQzRrNTl1ZjZqeWx2a2d6QUFqcWxlS0JBQ1VUVXIx?=
 =?utf-8?B?TStTV3lYR0YyVUpRd2p5NlV2eXB6NG5LK2duNXhaMDQ1bWQ1a3Y5dGViSHUr?=
 =?utf-8?B?c0FqRFB3OEZwMWFmTjA3VmpuN2dHeHpBQURFc3haVDY4UmVmMTQ5SFVXYmZN?=
 =?utf-8?B?ZDIvZDN6R3cwc1pDU1BOblRrOCtqSXR2TVVTY0JBRHg5OUlvWC80QzIyRUl1?=
 =?utf-8?B?WGZEQ3NNTHFROElBSkpheVU5L2lTb0h4NTZxODV5ckhPVDRIeEtTcmM2bGZT?=
 =?utf-8?B?bzJuemFZa2dZcWsraXdrRjJiSEtNTmlsMlJvYWZVbG53aVBmYW1lNlB4dGRR?=
 =?utf-8?B?R2ZjY1U0NnhDdEpFS0JKODdXMW5FSUJJOHJEVDJpZ1BBQnp5dEZab1VPM0Y0?=
 =?utf-8?B?VytXdkJNaTFINHRwek14MWxuczdGM0ZwQURLcW5vbjh1Wmp2Q2FZQmZJOE0r?=
 =?utf-8?B?aW04OHBpVVlWZU90V2hKLy85K2FILzVYcmJmZ3FNS09PNTQxUE1ud25yaEkv?=
 =?utf-8?B?NFNaVnJqbFdDTG1oRFhzNnQrcGRGL2w3VjM4ZVpaYzhKaUlTY2FVRjY1UWtq?=
 =?utf-8?B?QmN6bjlRcVFBK2JoeThZQjdqTTViZUZDN3pCaGZGemtFNTFDMjZzWUtWSy9j?=
 =?utf-8?B?Um1qWTVEbG0wWWdSOGFmZ0I0YkZyb0JIL0FPYXZ2R0RnVTNjZGN5ZFJiaGM2?=
 =?utf-8?B?ZExNalJDai9paStwQ1dTYUlKUG85MUNkSDlyQTUwc0Q3SXNCY1RxYUtqZjMz?=
 =?utf-8?B?YWVlSktYUUd0WEFNeFNpWkEwZEhBSHJJWlV2bVJ6TnJNTytWQ1dMZW4yak5p?=
 =?utf-8?B?cmlETlQ3YjVxMzVNOGRaMHBSTmJRTk9FUVpDMklpNlRSNktsYXliRHJtd1Br?=
 =?utf-8?B?akhlM2RMWGR4QmlTWk1JNVk1TGRmZjBjbGhNSVFXR0xPZy9ydjU1R21OTUFl?=
 =?utf-8?B?MWswOVZ3TmlVS04yVXg4azljcWdiS0xBYjQ0NC9mZ3ZCSXQwNDRBS0RsOFV6?=
 =?utf-8?B?aG4wQ2tNMDhMc09QdjNmbkVWcllPM3F2UWlISXI4VS9PK1g5K2hIUGVranBV?=
 =?utf-8?B?S0NBcjhSamo0clJaMjJIK1JveHdpd0hFeWpVRFduYlZCUWFNQURyRlhuM3lO?=
 =?utf-8?B?VVIyWUd4M1VLNkgweStWRFhvZ0lpbW0rbnhEL1BxaFdEVFVkZ2ZVNStRKzJI?=
 =?utf-8?B?THBhVHhnalU4OUZNNldQY0g5eHdQV25qbS93dFZLd2xBSFlYRkoxWk4wYjdE?=
 =?utf-8?B?MndPaGRyZDRKOUowVTc2UE45blBybyt5ekNKTGoxYWRialFlUmRZYWZkWGZ4?=
 =?utf-8?B?K0V6TmFKTFV3aVlVcWhZTU8yck01aTMrNSt6V1JZKzdpM2MxbzI4R0RJZ29N?=
 =?utf-8?B?czdCbkhxZmc2aWQ3UHQvRnlCbkxzT05EOCs5ck5lTFFDLzhWb3owY08xbm5R?=
 =?utf-8?B?ekIwK3V2Zkd3cXZsbzFEZlJvQVRPVFBCOTdDKzJVUkJZVFBSU09qcXNFdGtj?=
 =?utf-8?B?OGdwTksrTHpGejRaY25MQ1A4TDdhaG1hOW1mUFFuN3pVS0J3aldnYzZ0UExI?=
 =?utf-8?B?V3JyYWoxZ3ZSaW5rdmhiTEVoQUZhRExQMHozbWg1WC9qSy83Tkx5YzRqV3Rp?=
 =?utf-8?Q?p1tJSeOxD6hlvWiQXwEfi+AJE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52e8aa8-49dc-4cab-6e87-08dc3c546645
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 14:07:17.1682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xzamYIgJnGfcUE6j12pIXJSOZV6bEpMAT1vGZfD1vbFSNZMmQ6HgYOgf8+URcq7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5743
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

--------------EPzh60HdejG5yPGqLZzXs02Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.03.24 um 14:59 schrieb Paul Cercueil:
> [SNIP]
>>> +	dma_to_ram = buffer->direction == IIO_BUFFER_DIRECTION_IN;
>>> +
>>> +	if (dma_to_ram) {
>>> +		/*
>>> +		 * If we're writing to the DMABUF, make sure we
>>> don't have
>>> +		 * readers
>>> +		 */
>>> +		retl = dma_resv_wait_timeout(dmabuf->resv,
>>> +					     DMA_RESV_USAGE_READ,
>>> true,
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
>> That is incorrect use of the function dma_resv_usage_rw(). That
>> function
>> is for retrieving fences and not adding them.
>>
>> See the function implementation and comments, when you use it like
>> this
>> you get exactly what you don't want.
> No, I get exactly what I want. If "dma_to_ram", I get
> DMA_RESV_USAGE_READ, otherwise I get DMA_RESV_USAGE_WRITE.

Ah, so basically !dma_to_ram means that you have a write access to the 
buffer?

> If you really don't like the macro, I can inline things here.

Yeah, that would still be incorrect use.

The dma__resv_usage_rw() is for retrieving the fences to sync to for 
read and write operations and should never be used together with 
dma_fence_resv_add().

Regards,
Christian.

>
> Cheers,
> -Paul
>
>> Regards,
>> Christian.
>>
>>> +	dma_resv_unlock(dmabuf->resv);
>>> +
>>> +	cookie = dma_fence_begin_signalling();
>>> +
>>> +	ret = buffer->access->enqueue_dmabuf(buffer, priv->block,
>>> &fence->base,
>>> +					     priv->sgt,
>>> iio_dmabuf.bytes_used,
>>> +					     cyclic);
>>> +	if (ret) {
>>> +		/*
>>> +		 * DMABUF enqueue failed, but we already added the
>>> fence.
>>> +		 * Signal the error through the fence completion
>>> mechanism.
>>> +		 */
>>> +		iio_buffer_signal_dmabuf_done(&fence->base, ret);
>>> +	}
>>> +
>>> +	if (buffer->access->unlock_queue)
>>> +		buffer->access->unlock_queue(buffer);
>>> +
>>> +	dma_fence_end_signalling(cookie);
>>> +	dma_buf_put(dmabuf);
>>> +
>>> +	return ret;
>>> +
>>> +err_queue_unlock:
>>> +	if (buffer->access->unlock_queue)
>>> +		buffer->access->unlock_queue(buffer);
>>> +err_resv_unlock:
>>> +	dma_resv_unlock(dmabuf->resv);
>>> +err_fence_put:
>>> +	dma_fence_put(&fence->base);
>>> +err_attachment_put:
>>> +	iio_buffer_dmabuf_put(attach);
>>> +err_dmabuf_put:
>>> +	dma_buf_put(dmabuf);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void iio_buffer_cleanup(struct work_struct *work)
>>> +{
>>> +	struct iio_dma_fence *fence =
>>> +		container_of(work, struct iio_dma_fence, work);
>>> +	struct iio_dmabuf_priv *priv = fence->priv;
>>> +	struct dma_buf_attachment *attach = priv->attach;
>>> +
>>> +	dma_fence_put(&fence->base);
>>> +	iio_buffer_dmabuf_put(attach);
>>> +}
>>> +
>>> +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int
>>> ret)
>>> +{
>>> +	struct iio_dma_fence *iio_fence =
>>> +		container_of(fence, struct iio_dma_fence, base);
>>> +	bool cookie = dma_fence_begin_signalling();
>>> +
>>> +	/*
>>> +	 * Get a reference to the fence, so that it's not freed as
>>> soon as
>>> +	 * it's signaled.
>>> +	 */
>>> +	dma_fence_get(fence);
>>> +
>>> +	fence->error = ret;
>>> +	dma_fence_signal(fence);
>>> +	dma_fence_end_signalling(cookie);
>>> +
>>> +	/*
>>> +	 * The fence will be unref'd in iio_buffer_cleanup.
>>> +	 * It can't be done here, as the unref functions might try
>>> to lock the
>>> +	 * resv object, which can deadlock.
>>> +	 */
>>> +	INIT_WORK(&iio_fence->work, iio_buffer_cleanup);
>>> +	schedule_work(&iio_fence->work);
>>> +}
>>> +EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
>>> +
>>> +static long iio_buffer_chrdev_ioctl(struct file *filp,
>>> +				    unsigned int cmd, unsigned
>>> long arg)
>>> +{
>>> +	struct iio_dev_buffer_pair *ib = filp->private_data;
>>> +	void __user *_arg = (void __user *)arg;
>>> +	bool nonblock = filp->f_flags & O_NONBLOCK;
>>> +
>>> +	switch (cmd) {
>>> +	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
>>> +		return iio_buffer_attach_dmabuf(ib, _arg,
>>> nonblock);
>>> +	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
>>> +		return iio_buffer_detach_dmabuf(ib, _arg,
>>> nonblock);
>>> +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
>>> +		return iio_buffer_enqueue_dmabuf(ib, _arg,
>>> nonblock);
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +}
>>> +
>>>    static const struct file_operations iio_buffer_chrdev_fileops = {
>>>    	.owner = THIS_MODULE,
>>>    	.llseek = noop_llseek,
>>>    	.read = iio_buffer_read,
>>>    	.write = iio_buffer_write,
>>> +	.unlocked_ioctl = iio_buffer_chrdev_ioctl,
>>> +	.compat_ioctl = compat_ptr_ioctl,
>>>    	.poll = iio_buffer_poll,
>>>    	.release = iio_buffer_chrdev_release,
>>>    };
>>> @@ -1953,6 +2414,7 @@ static void iio_buffer_release(struct kref
>>> *ref)
>>>    {
>>>    	struct iio_buffer *buffer = container_of(ref, struct
>>> iio_buffer, ref);
>>>    
>>> +	mutex_destroy(&buffer->dmabufs_mutex);
>>>    	buffer->access->release(buffer);
>>>    }
>>>    
>>> diff --git a/include/linux/iio/buffer_impl.h
>>> b/include/linux/iio/buffer_impl.h
>>> index 89c3fd7c29ca..f4b1147291e5 100644
>>> --- a/include/linux/iio/buffer_impl.h
>>> +++ b/include/linux/iio/buffer_impl.h
>>> @@ -9,8 +9,12 @@
>>>    #include <uapi/linux/iio/buffer.h>
>>>    #include <linux/iio/buffer.h>
>>>    
>>> +struct dma_buf_attachment;
>>> +struct dma_fence;
>>>    struct iio_dev;
>>> +struct iio_dma_buffer_block;
>>>    struct iio_buffer;
>>> +struct sg_table;
>>>    
>>>    /**
>>>     * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of the
>>> buffer can not be
>>> @@ -39,6 +43,13 @@ struct iio_buffer;
>>>     *                      device stops sampling. Calles are
>>> balanced with @enable.
>>>     * @release:		called when the last reference to the
>>> buffer is dropped,
>>>     *			should free all resources allocated by the
>>> buffer.
>>> + * @attach_dmabuf:	called from userspace via ioctl to attach
>>> one external
>>> + *			DMABUF.
>>> + * @detach_dmabuf:	called from userspace via ioctl to detach
>>> one previously
>>> + *			attached DMABUF.
>>> + * @enqueue_dmabuf:	called from userspace via ioctl to queue
>>> this DMABUF
>>> + *			object to this buffer. Requires a valid
>>> DMABUF fd, that
>>> + *			was previouly attached to this buffer.
>>>     * @modes:		Supported operating modes by this buffer
>>> type
>>>     * @flags:		A bitmask combination of
>>> INDIO_BUFFER_FLAG_*
>>>     *
>>> @@ -68,6 +79,17 @@ struct iio_buffer_access_funcs {
>>>    
>>>    	void (*release)(struct iio_buffer *buffer);
>>>    
>>> +	struct iio_dma_buffer_block * (*attach_dmabuf)(struct
>>> iio_buffer *buffer,
>>> +						       struct
>>> dma_buf_attachment *attach);
>>> +	void (*detach_dmabuf)(struct iio_buffer *buffer,
>>> +			      struct iio_dma_buffer_block *block);
>>> +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
>>> +			      struct iio_dma_buffer_block *block,
>>> +			      struct dma_fence *fence, struct
>>> sg_table *sgt,
>>> +			      size_t size, bool cyclic);
>>> +	void (*lock_queue)(struct iio_buffer *buffer);
>>> +	void (*unlock_queue)(struct iio_buffer *buffer);
>>> +
>>>    	unsigned int modes;
>>>    	unsigned int flags;
>>>    };
>>> @@ -136,6 +158,12 @@ struct iio_buffer {
>>>    
>>>    	/* @ref: Reference count of the buffer. */
>>>    	struct kref ref;
>>> +
>>> +	/* @dmabufs: List of DMABUF attachments */
>>> +	struct list_head dmabufs; /* P: dmabufs_mutex */
>>> +
>>> +	/* @dmabufs_mutex: Protects dmabufs */
>>> +	struct mutex dmabufs_mutex;
>>>    };
>>>    
>>>    /**
>>> @@ -156,9 +184,14 @@ int iio_update_buffers(struct iio_dev
>>> *indio_dev,
>>>     **/
>>>    void iio_buffer_init(struct iio_buffer *buffer);
>>>    
>>> +void iio_buffer_dmabuf_get(struct dma_buf_attachment *attach);
>>> +void iio_buffer_dmabuf_put(struct dma_buf_attachment *attach);
>>> +
>>>    struct iio_buffer *iio_buffer_get(struct iio_buffer *buffer);
>>>    void iio_buffer_put(struct iio_buffer *buffer);
>>>    
>>> +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int
>>> ret);
>>> +
>>>    #else /* CONFIG_IIO_BUFFER */
>>>    
>>>    static inline void iio_buffer_get(struct iio_buffer *buffer) {}
>>> diff --git a/include/uapi/linux/iio/buffer.h
>>> b/include/uapi/linux/iio/buffer.h
>>> index 13939032b3f6..c666aa95e532 100644
>>> --- a/include/uapi/linux/iio/buffer.h
>>> +++ b/include/uapi/linux/iio/buffer.h
>>> @@ -5,6 +5,28 @@
>>>    #ifndef _UAPI_IIO_BUFFER_H_
>>>    #define _UAPI_IIO_BUFFER_H_
>>>    
>>> +#include <linux/types.h>
>>> +
>>> +/* Flags for iio_dmabuf.flags */
>>> +#define IIO_BUFFER_DMABUF_CYCLIC		(1 << 0)
>>> +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000001
>>> +
>>> +/**
>>> + * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
>>> + * @fd:		file descriptor of the DMABUF object
>>> + * @flags:	one or more IIO_BUFFER_DMABUF_* flags
>>> + * @bytes_used:	number of bytes used in this DMABUF for
>>> the data transfer.
>>> + *		Should generally be set to the DMABUF's size.
>>> + */
>>> +struct iio_dmabuf {
>>> +	__u32 fd;
>>> +	__u32 flags;
>>> +	__u64 bytes_used;
>>> +};
>>> +
>>>    #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i',
>>> 0x91, int)
>>> +#define IIO_BUFFER_DMABUF_ATTACH_IOCTL		_IOW('i', 0x92,
>>> int)
>>> +#define IIO_BUFFER_DMABUF_DETACH_IOCTL		_IOW('i', 0x93,
>>> int)
>>> +#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i',
>>> 0x94, struct iio_dmabuf)
>>>    
>>>    #endif /* _UAPI_IIO_BUFFER_H_ */
>>>

--------------EPzh60HdejG5yPGqLZzXs02Y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 04.03.24 um 14:59 schrieb Paul Cercueil:<br>
    <blockquote type="cite" cite="mid:d17bd8aa17ac82773d0bdd6ce4edfe4a6249f179.camel@crapouillou.net">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	dma_to_ram = buffer-&gt;direction == IIO_BUFFER_DIRECTION_IN;
+
+	if (dma_to_ram) {
+		/*
+		 * If we're writing to the DMABUF, make sure we
don't have
+		 * readers
+		 */
+		retl = dma_resv_wait_timeout(dmabuf-&gt;resv,
+					&nbsp;&nbsp;&nbsp;&nbsp; DMA_RESV_USAGE_READ,
true,
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
That is incorrect use of the function dma_resv_usage_rw(). That
function 
is for retrieving fences and not adding them.

See the function implementation and comments, when you use it like
this 
you get exactly what you don't want.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, I get exactly what I want. If &quot;dma_to_ram&quot;, I get
DMA_RESV_USAGE_READ, otherwise I get DMA_RESV_USAGE_WRITE.</pre>
    </blockquote>
    <br>
    Ah, so basically !dma_to_ram means that you have a write access to
    the buffer?<br>
    <br>
    <blockquote type="cite" cite="mid:d17bd8aa17ac82773d0bdd6ce4edfe4a6249f179.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">If you really don't like the macro, I can inline things here.</pre>
    </blockquote>
    <br>
    Yeah, that would still be incorrect use.<br>
    <br>
    The dma__resv_usage_rw() is for retrieving the fences to sync to for
    read and write operations and should never be used together with
    dma_fence_resv_add().<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:d17bd8aa17ac82773d0bdd6ce4edfe4a6249f179.camel@crapouillou.net">
      <pre class="moz-quote-pre" wrap="">

Cheers,
-Paul

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	dma_resv_unlock(dmabuf-&gt;resv);
+
+	cookie = dma_fence_begin_signalling();
+
+	ret = buffer-&gt;access-&gt;enqueue_dmabuf(buffer, priv-&gt;block,
&amp;fence-&gt;base,
+					&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;sgt,
iio_dmabuf.bytes_used,
+					&nbsp;&nbsp;&nbsp;&nbsp; cyclic);
+	if (ret) {
+		/*
+		 * DMABUF enqueue failed, but we already added the
fence.
+		 * Signal the error through the fence completion
mechanism.
+		 */
+		iio_buffer_signal_dmabuf_done(&amp;fence-&gt;base, ret);
+	}
+
+	if (buffer-&gt;access-&gt;unlock_queue)
+		buffer-&gt;access-&gt;unlock_queue(buffer);
+
+	dma_fence_end_signalling(cookie);
+	dma_buf_put(dmabuf);
+
+	return ret;
+
+err_queue_unlock:
+	if (buffer-&gt;access-&gt;unlock_queue)
+		buffer-&gt;access-&gt;unlock_queue(buffer);
+err_resv_unlock:
+	dma_resv_unlock(dmabuf-&gt;resv);
+err_fence_put:
+	dma_fence_put(&amp;fence-&gt;base);
+err_attachment_put:
+	iio_buffer_dmabuf_put(attach);
+err_dmabuf_put:
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+
+static void iio_buffer_cleanup(struct work_struct *work)
+{
+	struct iio_dma_fence *fence =
+		container_of(work, struct iio_dma_fence, work);
+	struct iio_dmabuf_priv *priv = fence-&gt;priv;
+	struct dma_buf_attachment *attach = priv-&gt;attach;
+
+	dma_fence_put(&amp;fence-&gt;base);
+	iio_buffer_dmabuf_put(attach);
+}
+
+void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int
ret)
+{
+	struct iio_dma_fence *iio_fence =
+		container_of(fence, struct iio_dma_fence, base);
+	bool cookie = dma_fence_begin_signalling();
+
+	/*
+	 * Get a reference to the fence, so that it's not freed as
soon as
+	 * it's signaled.
+	 */
+	dma_fence_get(fence);
+
+	fence-&gt;error = ret;
+	dma_fence_signal(fence);
+	dma_fence_end_signalling(cookie);
+
+	/*
+	 * The fence will be unref'd in iio_buffer_cleanup.
+	 * It can't be done here, as the unref functions might try
to lock the
+	 * resv object, which can deadlock.
+	 */
+	INIT_WORK(&amp;iio_fence-&gt;work, iio_buffer_cleanup);
+	schedule_work(&amp;iio_fence-&gt;work);
+}
+EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
+
+static long iio_buffer_chrdev_ioctl(struct file *filp,
+				&nbsp;&nbsp;&nbsp; unsigned int cmd, unsigned
long arg)
+{
+	struct iio_dev_buffer_pair *ib = filp-&gt;private_data;
+	void __user *_arg = (void __user *)arg;
+	bool nonblock = filp-&gt;f_flags &amp; O_NONBLOCK;
+
+	switch (cmd) {
+	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
+		return iio_buffer_attach_dmabuf(ib, _arg,
nonblock);
+	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
+		return iio_buffer_detach_dmabuf(ib, _arg,
nonblock);
+	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
+		return iio_buffer_enqueue_dmabuf(ib, _arg,
nonblock);
+	default:
+		return -EINVAL;
+	}
+}
+
&nbsp; static const struct file_operations iio_buffer_chrdev_fileops = {
&nbsp;&nbsp;	.owner = THIS_MODULE,
&nbsp;&nbsp;	.llseek = noop_llseek,
&nbsp;&nbsp;	.read = iio_buffer_read,
&nbsp;&nbsp;	.write = iio_buffer_write,
+	.unlocked_ioctl = iio_buffer_chrdev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
&nbsp;&nbsp;	.poll = iio_buffer_poll,
&nbsp;&nbsp;	.release = iio_buffer_chrdev_release,
&nbsp; };
@@ -1953,6 +2414,7 @@ static void iio_buffer_release(struct kref
*ref)
&nbsp; {
&nbsp;&nbsp;	struct iio_buffer *buffer = container_of(ref, struct
iio_buffer, ref);
&nbsp; 
+	mutex_destroy(&amp;buffer-&gt;dmabufs_mutex);
&nbsp;&nbsp;	buffer-&gt;access-&gt;release(buffer);
&nbsp; }
&nbsp; 
diff --git a/include/linux/iio/buffer_impl.h
b/include/linux/iio/buffer_impl.h
index 89c3fd7c29ca..f4b1147291e5 100644
--- a/include/linux/iio/buffer_impl.h
+++ b/include/linux/iio/buffer_impl.h
@@ -9,8 +9,12 @@
&nbsp; #include &lt;uapi/linux/iio/buffer.h&gt;
&nbsp; #include &lt;linux/iio/buffer.h&gt;
&nbsp; 
+struct dma_buf_attachment;
+struct dma_fence;
&nbsp; struct iio_dev;
+struct iio_dma_buffer_block;
&nbsp; struct iio_buffer;
+struct sg_table;
&nbsp; 
&nbsp; /**
&nbsp;&nbsp; * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of the
buffer can not be
@@ -39,6 +43,13 @@ struct iio_buffer;
&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device stops sampling. Calles are
balanced with @enable.
&nbsp;&nbsp; * @release:		called when the last reference to the
buffer is dropped,
&nbsp;&nbsp; *			should free all resources allocated by the
buffer.
+ * @attach_dmabuf:	called from userspace via ioctl to attach
one external
+ *			DMABUF.
+ * @detach_dmabuf:	called from userspace via ioctl to detach
one previously
+ *			attached DMABUF.
+ * @enqueue_dmabuf:	called from userspace via ioctl to queue
this DMABUF
+ *			object to this buffer. Requires a valid
DMABUF fd, that
+ *			was previouly attached to this buffer.
&nbsp;&nbsp; * @modes:		Supported operating modes by this buffer
type
&nbsp;&nbsp; * @flags:		A bitmask combination of
INDIO_BUFFER_FLAG_*
&nbsp;&nbsp; *
@@ -68,6 +79,17 @@ struct iio_buffer_access_funcs {
&nbsp; 
&nbsp;&nbsp;	void (*release)(struct iio_buffer *buffer);
&nbsp; 
+	struct iio_dma_buffer_block * (*attach_dmabuf)(struct
iio_buffer *buffer,
+						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct
dma_buf_attachment *attach);
+	void (*detach_dmabuf)(struct iio_buffer *buffer,
+			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct iio_dma_buffer_block *block);
+	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
+			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct iio_dma_buffer_block *block,
+			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence *fence, struct
sg_table *sgt,
+			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t size, bool cyclic);
+	void (*lock_queue)(struct iio_buffer *buffer);
+	void (*unlock_queue)(struct iio_buffer *buffer);
+
&nbsp;&nbsp;	unsigned int modes;
&nbsp;&nbsp;	unsigned int flags;
&nbsp; };
@@ -136,6 +158,12 @@ struct iio_buffer {
&nbsp; 
&nbsp;&nbsp;	/* @ref: Reference count of the buffer. */
&nbsp;&nbsp;	struct kref ref;
+
+	/* @dmabufs: List of DMABUF attachments */
+	struct list_head dmabufs; /* P: dmabufs_mutex */
+
+	/* @dmabufs_mutex: Protects dmabufs */
+	struct mutex dmabufs_mutex;
&nbsp; };
&nbsp; 
&nbsp; /**
@@ -156,9 +184,14 @@ int iio_update_buffers(struct iio_dev
*indio_dev,
&nbsp;&nbsp; **/
&nbsp; void iio_buffer_init(struct iio_buffer *buffer);
&nbsp; 
+void iio_buffer_dmabuf_get(struct dma_buf_attachment *attach);
+void iio_buffer_dmabuf_put(struct dma_buf_attachment *attach);
+
&nbsp; struct iio_buffer *iio_buffer_get(struct iio_buffer *buffer);
&nbsp; void iio_buffer_put(struct iio_buffer *buffer);
&nbsp; 
+void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int
ret);
+
&nbsp; #else /* CONFIG_IIO_BUFFER */
&nbsp; 
&nbsp; static inline void iio_buffer_get(struct iio_buffer *buffer) {}
diff --git a/include/uapi/linux/iio/buffer.h
b/include/uapi/linux/iio/buffer.h
index 13939032b3f6..c666aa95e532 100644
--- a/include/uapi/linux/iio/buffer.h
+++ b/include/uapi/linux/iio/buffer.h
@@ -5,6 +5,28 @@
&nbsp; #ifndef _UAPI_IIO_BUFFER_H_
&nbsp; #define _UAPI_IIO_BUFFER_H_
&nbsp; 
+#include &lt;linux/types.h&gt;
+
+/* Flags for iio_dmabuf.flags */
+#define IIO_BUFFER_DMABUF_CYCLIC		(1 &lt;&lt; 0)
+#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000001
+
+/**
+ * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
+ * @fd:		file descriptor of the DMABUF object
+ * @flags:	one or more IIO_BUFFER_DMABUF_* flags
+ * @bytes_used:	number of bytes used in this DMABUF for
the data transfer.
+ *		Should generally be set to the DMABUF's size.
+ */
+struct iio_dmabuf {
+	__u32 fd;
+	__u32 flags;
+	__u64 bytes_used;
+};
+
&nbsp; #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i',
0x91, int)
+#define IIO_BUFFER_DMABUF_ATTACH_IOCTL		_IOW('i', 0x92,
int)
+#define IIO_BUFFER_DMABUF_DETACH_IOCTL		_IOW('i', 0x93,
int)
+#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i',
0x94, struct iio_dmabuf)
&nbsp; 
&nbsp; #endif /* _UAPI_IIO_BUFFER_H_ */

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------EPzh60HdejG5yPGqLZzXs02Y--
