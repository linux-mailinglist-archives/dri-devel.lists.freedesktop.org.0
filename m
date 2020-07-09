Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A9221A21D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 16:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1F6EA88;
	Thu,  9 Jul 2020 14:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD636EA55;
 Thu,  9 Jul 2020 14:28:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f7so2637829wrw.1;
 Thu, 09 Jul 2020 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7tqZDmODxpfwBrZOHP4mWeKzffcGLgXr9vfeGZmKNBU=;
 b=UrpSVLa3i4fx+oUjE8nAxb4rXdCD53H/8bOIv4xQumhe0e7CQ8MSbyobjYuUDN+elj
 5ckDUsYJlUFwMBITNVVhAuDD1ntL6R5si8UkCbrFwBa1o23XClPoW3CKS4dWxyoxcntP
 dJqsDgcKZ7AO7FkD0aTnLTbBnG66j8oAWeBRelevedSmD8Zs032jXTG9snLK4ogose0T
 xszt4fue3yxbEy3JONwHirds5693uN2B9BDJL9fArtc7BMdD97zIbltXJ8ct7rLVTDTB
 mAZaIj2edOMdCqYTfAGZZGyWQ0m80neg9YFUm9WSoDmvWI989Ihja/q5tJJwk4C760/1
 ToVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=7tqZDmODxpfwBrZOHP4mWeKzffcGLgXr9vfeGZmKNBU=;
 b=h+De0IDEQ4E96jmRmg6obyOvKz0ia8yp/1Q8gDdWGnhPCvakCNouZ+v3NqC/DWXP3R
 pLavqvzKylJ7ws+JoW1KNZ1PatGui8OyE6qpDWbRGRQKXEb29NyITRbufGkTwP2dS//t
 +TsEg1t/H/5yfb27h+UTLUqd52Opr9Rgco8TIzeKr95u6ZZC3te0NSzdafphasZ6oaT9
 Bm5Ox3pf+M65Mig+ykHX/mRm02tYXdFMcEI2AHtWGQFCrxXwyPvj4qT+OPNixhtXOWUY
 wzcPtIzTGo/L2JAFEcFnHvXg7inrITxL0PQ3txL3Fi2Ki6p1CzFkIu8rTduEV93JbKSi
 ds8Q==
X-Gm-Message-State: AOAM530+8K5OS/EwEOJQb2GWkbEcK1gTPkhD1u1pldZ83f9aiS1DO8cv
 rgkmM9b+q8xCOqHWr4La5AecftZC
X-Google-Smtp-Source: ABdhPJyn8DKog/l6kOIY+x27ufbwVcpLzTGrf++rITJqcgOZsb4u39XLOgBaVXLNO9Fzi5QL+9FCzw==
X-Received: by 2002:adf:f14c:: with SMTP id y12mr62667346wro.30.1594304919952; 
 Thu, 09 Jul 2020 07:28:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d28sm4735671wrc.50.2020.07.09.07.28.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 07:28:39 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 03/25] dma-buf.rst: Document why idenfinite
 fences are a bad idea
To: Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <CAPj87rO4mm-+sQbP07cgM8-=b6Q8Jbh5G0FsV8rwYx2hnEzPkA@mail.gmail.com>
 <20200709080458.GO3278063@phenom.ffwll.local>
 <CAPj87rPtD04099=sBzL2jKN6NNFNnM-hH3qfOLL10nPoF==VbA@mail.gmail.com>
 <CAKMK7uG6T+86+11CKpRpEY8v6_Xrm=hWv01tzPPLHq_H7p-AuA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4f42300f-9733-5536-ef25-95ed8f25bcf8@gmail.com>
Date: Thu, 9 Jul 2020 16:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG6T+86+11CKpRpEY8v6_Xrm=hWv01tzPPLHq_H7p-AuA@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.07.20 um 14:31 schrieb Daniel Vetter:
> On Thu, Jul 9, 2020 at 2:11 PM Daniel Stone <daniel@fooishbar.org> wrote:
>> On Thu, 9 Jul 2020 at 09:05, Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Thu, Jul 09, 2020 at 08:36:43AM +0100, Daniel Stone wrote:
>>>> On Tue, 7 Jul 2020 at 21:13, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>> Comes up every few years, gets somewhat tedious to discuss, let's
>>>>> write this down once and for all.
>>>> Thanks for writing this up! I wonder if any of the notes from my reply
>>>> to the previous-version thread would be helpful to more explicitly
>>>> encode the carrot of dma-fence's positive guarantees, rather than just
>>>> the stick of 'don't do this'. ;) Either way, this is:
>>> I think the carrot should go into the intro section for dma-fence, this
>>> section here is very much just the "don't do this" part. The previous
>>> patches have an attempt at encoding this a bit, maybe see whether there's
>>> a place for your reply (or parts of it) to fit?
>> Sounds good to me.
>>
>>>> Acked-by: Daniel Stone <daniels@collabora.com>
>>>>
>>>>> What I'm not sure about is whether the text should be more explicit in
>>>>> flat out mandating the amdkfd eviction fences for long running compute
>>>>> workloads or workloads where userspace fencing is allowed.
>>>> ... or whether we just say that you can never use dma-fence in
>>>> conjunction with userptr.
>>> Uh userptr is entirely different thing. That one is ok. It's userpsace
>>> fences or gpu futexes or future fences or whatever we want to call them.
>>> Or is there some other confusion here?.
>> I mean generating a dma_fence from a batch which will try to page in
>> userptr. Given that userptr could be backed by absolutely anything at
>> all, it doesn't seem smart to allow fences to rely on a pointer to an
>> mmap'ed NFS file. So it seems like batches should be mutually
>> exclusive between arbitrary SVM userptr and generating a dma-fence?
> Locking is Tricky (tm) but essentially what at least amdgpu does is
> pull in the backing storage before we publish any dma-fence. And then
> some serious locking magic to make sure that doesn't race with a core
> mm invalidation event. So for your case here the cs ioctl just blocks
> until the nfs pages are pulled in.

Yeah, we had some iterations until all was settled.

Basic idea is the following:
1. Have a sequence counter increased whenever a change to the page 
tables happens.
2. During CS grab the current value of this counter.
3. Get all the pages you need in an array.
4. Prepare CS, grab the low level lock the MM notifier waits for and 
double check the counter.
5. If the counter is still the same all is well and the DMA-fence pushed 
to the hardware.
6. If the counter has changed repeat.

Can result in a nice live lock when you constantly page things in/out, 
but that is expected behavior.

Christian.

>
> Once we've committed for the dma-fence it's only the other way round,
> i.e. core mm will stall on the dma-fence if it wants to throw out
> these pages again. More or less at least. That way we never have a
> dma-fence depending upon any core mm operations. The only pain here is
> that this severely limits what you can do in the critical path towards
> signalling a dma-fence, because the tldr is "no interacting with core
> mm at all allowed".
>
>> Speaking of entirely different things ... the virtio-gpu bit really
>> doesn't belong in this patch.
> Oops, dunno where I lost that as a sparate patch. Will split out again :-(
> -Daniel
>
>> Cheers,
>> Daniel
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
