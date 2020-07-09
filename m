Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C616219A1A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E33F6E9AE;
	Thu,  9 Jul 2020 07:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED6E6E9B2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 07:36:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so1255772wrw.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKtQly4ao6B6nwRWEDkHlPwVhDZwmTFzlBzK230IGUs=;
 b=q1a8xJM/Q9Wj785BtNlEuDFVR1eQk54JebnUrlGorLvEHVMtqdFOuaGKrTYCsphJ1h
 jdn7d6bEOoYqm6Dc8k5LjNzJMPs7sqOYl93W/0yr7CIrm1h2/Lv3g+fhNpsEY21yKMZh
 ju/lEovQ160zqDVi53k34kcqcJLZdTHFacxSS0a8W4cpfdDptcuxHSPlubyxOMMuaSBC
 zAyYruzxGOJbmMUqmjN2Chf/XWhBZgAcu1tmI7ShCPPddj04M/M8Yf8LAduuKxgJQlTV
 rIzd0KYtUf5G7qRV/73bX9CHJ9uhQaanPFGitTqRJCgzv1EMfeBg/7UHJHVTRmYqPihB
 A8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKtQly4ao6B6nwRWEDkHlPwVhDZwmTFzlBzK230IGUs=;
 b=NnmOn9IJkaBzj8Urp1XTsDIRutSfrXAdKp/AlJG4NKCm4DYKV3RHvFrpnRMLgi21ue
 AxU/q15K8jGP8lUjFrZXNHwaHStCX9UUjwdFOP4RzwSOM58kDzLFMDbpqwrKOFV4ZkS0
 +N6Tj/uePPCilyQRlVo8QJVuqQVeKA2oSXdtc0dpgG+35ZA5/wffLPF0nLPh/j7LlVv3
 UxWTFWCh1a8Bw86GWiqHhkY7Z0zpEi48u1pRXINW5/w/LfV3xtFX/sq0mne9OmbnlSsf
 uAeRJUnQICCnHtRJ5lFHlOABieW9yr6Qs3qVq8Q3+MSKD/pASrYJdHS4uDBcYFgfj5xi
 oYLw==
X-Gm-Message-State: AOAM532bPA+hNLLSxqFHNYruuH0E9q9+IfFeZnKNNbwBKgq0lFCWrX+k
 R2PHr2UaURZccxqZKM1+xwzNNWw85cL9fBDMUb7iVA==
X-Google-Smtp-Source: ABdhPJwOIE8GoaZZk1aSRinMLKGhWIbTpQIZ0IBDLoLaRN5k6dzJvrX8BOXeDjMLQXA3ybdstuq5y6Y6MSCOm3lN/7s=
X-Received: by 2002:adf:f9c8:: with SMTP id w8mr60764235wrr.354.1594280214366; 
 Thu, 09 Jul 2020 00:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 9 Jul 2020 08:36:43 +0100
Message-ID: <CAPj87rO4mm-+sQbP07cgM8-=b6Q8Jbh5G0FsV8rwYx2hnEzPkA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 03/25] dma-buf.rst: Document why idenfinite
 fences are a bad idea
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 7 Jul 2020 at 21:13, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Comes up every few years, gets somewhat tedious to discuss, let's
> write this down once and for all.

Thanks for writing this up! I wonder if any of the notes from my reply
to the previous-version thread would be helpful to more explicitly
encode the carrot of dma-fence's positive guarantees, rather than just
the stick of 'don't do this'. ;) Either way, this is:
Acked-by: Daniel Stone <daniels@collabora.com>

> What I'm not sure about is whether the text should be more explicit in
> flat out mandating the amdkfd eviction fences for long running compute
> workloads or workloads where userspace fencing is allowed.

... or whether we just say that you can never use dma-fence in
conjunction with userptr.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
