Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936BD6365C1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 17:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0CE10E5B3;
	Wed, 23 Nov 2022 16:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0368410E5B5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:26:51 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id i9so3249969qkl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MVWe1KbwH32KSdOuQUG2Cu353SfSlMLZuLamaD0dXtw=;
 b=Np4/bmkbkzbftxGu4Xfe3xPQnjtFBVjVs43hK0IMuIqj9d2b1aoHPdKTK7d9Ke8toz
 vOgB2vyRSUHIOeOu08dhDULtwQ5j+Nbp3OXGGHP8uw0vYLcrZi8vWive1qZKcSt9hoRV
 jFsR4rVjQqfhTeGYX8ZG5pyjJ3Eg2qkFKwYOYV1JnyWVyaKQd5Rmsk3g9LEj/9JeMwHW
 amUNSpUWJBWWt+UHDSHxKcCBFghFqojIUB4o8Z7v5GEjrMyNSaiD1O7YOJziZes7RGDa
 +2zg/YESx8k6j6m/4J/9pN9kTb9ioXiCa5Zk1vAlP3lGUhhmojae4twzM8At5SJfTPkR
 FaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MVWe1KbwH32KSdOuQUG2Cu353SfSlMLZuLamaD0dXtw=;
 b=rMNWqLeYPuj5LIUlX3r0lI7djg+QXII8bGv2MoiV2Wp8wbpNji1ROE/K70Yvyr54I4
 DwIfqKa1/KxeQ2oEWKGFyRxG7DDOHpa1iTS2iCjVO9MZQ+mrW9DkGdAhS+Dox7eYP6hj
 /5iwM+RVfUjeRIgS40R9S2dpynbCjXMZr0P+JNh4Og4i4etTJ1uwB/0Jmh0Y4MHE9dFO
 /zeaqzZviCi0Va/2mOGXglVzfEe0ch192UCrPNkM4ctDfl2SQZUO1GwbgJoMrJoq6jQs
 UWddsdYXO426HTRKA4DijWloTB9KmPvaaZCwFZ9MkGQyrMqVMlXJxG5ppwfNEH1orQPO
 PjWA==
X-Gm-Message-State: ANoB5plxtGh1PyyIzUcp70WWYGgTf1Mj9FMRoRHYY0RXc8K3wTztqU8h
 913C/8JagLPq/KsnaWg6FEkq1Q==
X-Google-Smtp-Source: AA0mqf4OyB3Ehnx6E7JWKWLmbM/ehJ6uXDD6TAq7u3b6JJ9+PO7nvAjKFynqi4t74Jyi+NjK8gQVJQ==
X-Received: by 2002:a05:620a:2795:b0:6ec:51cd:c376 with SMTP id
 g21-20020a05620a279500b006ec51cdc376mr22947878qkp.300.1669220810961; 
 Wed, 23 Nov 2022 08:26:50 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 q25-20020a05620a2a5900b006ee7923c187sm12521991qkp.42.2022.11.23.08.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:26:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxsaH-00AONK-SY;
 Wed, 23 Nov 2022 12:26:49 -0400
Date: Wed, 23 Nov 2022 12:26:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y35JyVM/jvYjjDb+@ziepe.ca>
References: <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
 <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca>
 <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
 <Y343ijGoqyf73d+I@ziepe.ca>
 <dcb88724-c68e-6f2a-03d5-0641d2e68ec6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcb88724-c68e-6f2a-03d5-0641d2e68ec6@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 04:15:05PM +0100, Christian König wrote:

> I have not the slightest idea how people got this impression, but I have
> heard it so many time from so many different sources that there must be some
> common cause to this. Is the maybe some book or tutorial how to sophisticate
> break the kernel or something like this?
> 
> Anyway as far as I can see only correct approach would be to use an MMU
> notifier or more high level hmm_range_fault()+seq number.

It already uses a mmu notifier, this is why I have no idea what the
page ref is doing..

Jason
