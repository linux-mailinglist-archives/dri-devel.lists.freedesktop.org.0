Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C0AAFB211
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 13:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9984D10E446;
	Mon,  7 Jul 2025 11:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkerVeck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704DB10E443
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 11:14:27 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ae3703c2a8bso601696866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751886866; x=1752491666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ISbJeBw9NAi5f57BeJCVw181+eBAYp7u8b9Kdohio9o=;
 b=jkerVeckU0pMbpuOiIyvwxfZBV2l/e3Vb+iBb++pODN9F0SA55sPg5wLGhY5GbindY
 coZbdsHTueHaHeWHEPScCCHR8uPUQD23plyTF9kRgcDUwwlA+hbEMnc5/AK79WMvRE1O
 k6zR8s6rH8rBYu7FWj/4t62YGwmNjafYGeSwC1S4tY3UzSE/UQxqylU4kHQG8l3DuiYD
 bjkm+UxQmmetNigpJdHcOC/OrLaXR7NVB7+5OSomCh6ntAp21SYIfwk/t/8SebR58YsS
 bfvdnnNCtzLoHXajEHMdi4PrhI+hDeovUVLy2psjVgtBHuAeduodVKwMouwzcRd7OhrT
 eDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751886866; x=1752491666;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ISbJeBw9NAi5f57BeJCVw181+eBAYp7u8b9Kdohio9o=;
 b=i1w4R0SJiM9IoaJFS06iFJwDtRoPfIAhhJc978ZiLQB12G8UZixfPI75pIUgHBZDu8
 SXEqWzGc9AZGkTbpAAzp0RStbrzHyE2Lif0XoMEsnheRJVZBtvdn26/lfrWOSehyKpfb
 xGUGuFUt+szKKZhKgadw4UEwthYR1jpBju6o/OAG6TmjVZELHtHGqiycQ7Xu52rN0ZXE
 DdW9HEswQgqv/qSlF3GwM8if2dQlcP6WLAoT1wgeik8N22HR9se2K7Z9BEnn0bxcM53v
 cHCLdHUcTmpeACebAra/xOxzABEDMdolJNccmgIrSoiX9fhStFiTqv7bxQ3F63z3CH5/
 6EtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4DsZs5Q9/qtca9nHHCU0Myuwzi679R4GLIJk6uMNJZO5VLbhFV5OHBDXDKWPWmyBsyurZDwFz0AY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0n1XNwcu8fiu2uz6pYVV2NFQbVDTJXEQQnRR0YpZmJiWHopqX
 AtCEtDXSEOJ8iMWBPKzc+fyYevpsP/qcJNSZlP+nQvDAbQDNZqWrAEZ8
X-Gm-Gg: ASbGncsGWIhwBBCkQSDZgDN0YONEJ/s+61bTGKDYTKu8Ku2mRn3m6T3jwmOol9ghngT
 fRAxRMUMtd1X9MwqY/SgHZxeTr9tBHwDrm7ICZ3pxh4eiNWEbkEWx4XTpIJEpDJhFfpO14KlImM
 RinIwrzlEvSoRbSpQleY4FzDtcqbCHAC6pbrNbDLf+1gzkMwnTH2vxM7VIRHDVZrbqDqmSfrpCW
 pPVgeeNRT/GDq2yLAU1gVk78xdR891i7BTSW7XoL4PDt3e8rk8JPEAQXVQ078F6t/KKWA6CDoXL
 4pGqyzz6gGmAxw15UvlbPywH6SUSE0rNjmH9r55aznWT6ySgE/OPiHMejLlWIWP+30Gdrx+pGzo
 IkeWrGxQwhg==
X-Google-Smtp-Source: AGHT+IHXy0DieX4Ryfe7fnqNm2npiGA05vFcH84u4de0iwjmdTb2PEXlvbji/iKcic0iBMD+4uS9wg==
X-Received: by 2002:a17:907:dab:b0:ae0:c523:780c with SMTP id
 a640c23a62f3a-ae4108c85a2mr739098066b.5.1751886865420; 
 Mon, 07 Jul 2025 04:14:25 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:adc3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b0336asm688993666b.115.2025.07.07.04.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 04:14:24 -0700 (PDT)
Message-ID: <f2216c30-6540-4b1a-b798-d9a3f83547b2@gmail.com>
Date: Mon, 7 Jul 2025 12:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/12] io_uring dmabuf read/write support
To: Christoph Hellwig <hch@infradead.org>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, David Wei <dw@davidwei.uk>,
 Vishal Verma <vishal1.verma@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <cover.1751035820.git.asml.silence@gmail.com>
 <aGaSb5rpLD9uc1IK@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aGaSb5rpLD9uc1IK@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 7/3/25 15:23, Christoph Hellwig wrote:
> [Note: it would be really useful to Cc all relevant maintainers]

Will do next time

> On Fri, Jun 27, 2025 at 04:10:27PM +0100, Pavel Begunkov wrote:
>> This series implements it for read/write io_uring requests. The uAPI
>> looks similar to normal registered buffers, the user will need to
>> register a dmabuf in io_uring first and then use it as any other
>> registered buffer. On registration the user also specifies a file
>> to map the dmabuf for.
> 
> Just commenting from the in-kernel POV here, where the interface
> feels wrong.
> 
> You can't just expose 'the DMA device' up file operations, because
> there can be and often is more than one.  Similarly stuffing a
> dma_addr_t into an iovec is rather dangerous.
> 
> The model that should work much better is to have file operations
> to attach to / detach from a dma_buf, and then have an iter that
> specifies a dmabuf and offsets into.  That way the code behind the
> file operations can forward the attachment to all the needed
> devices (including more/less while it remains attached to the file)
> and can pick the right dma address for each device.

By "iter that specifies a dmabuf" do you mean an opaque file-specific
structure allocated inside the new fop? Akin to what Keith proposed back
then. That sounds good and has more potential for various optimisations.
My concern would be growing struct iov_iter by an extra pointer:

struct dma_seg {
	size_t 	off;
	unsigned len;
};

struct iov_iter {
	union {
		struct iovec *iov;
		struct dma_seg *dmav;
		...
	};
	void *dma_token;	
};

But maybe that's fine. It's 40B -> 48B, and it'll get back to
40 when / if xarray_start / ITER_XARRAY is removed.

> I also remember some discussion that new dma-buf importers should
> use the dynamic imported model for long-term imports, but as I'm
> everything but an expert in that area I'll let the dma-buf folks
> speak.

I'll take a look

-- 
Pavel Begunkov

