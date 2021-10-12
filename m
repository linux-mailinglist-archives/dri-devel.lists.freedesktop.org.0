Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A547042A353
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 13:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950DC6E909;
	Tue, 12 Oct 2021 11:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAA96E819
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634038177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+956HXQTjGs6a34u/u+/FjVYaM1e8zxxcd9Fx/dYps8=;
 b=S/dabcEG9ULECkofY7tOHVwcSkVlkRqm2uhSktU4itFX976xigSUvXK9QU0L4CGtdXbg1D
 AoOId0KxJrorPxCEEWmmCuS/sSrLQrPJ13QHRpA/wADi5KRqN67XcBlRoNzikQQoDVoaXz
 1QLOB8NYWrzS98aScxPO1pxf1bE5oH4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ebwLtvDpNiala8l81_5QNw-1; Tue, 12 Oct 2021 07:29:36 -0400
X-MC-Unique: ebwLtvDpNiala8l81_5QNw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r25-20020adfab59000000b001609ddd5579so15492109wrc.21
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 04:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+956HXQTjGs6a34u/u+/FjVYaM1e8zxxcd9Fx/dYps8=;
 b=KoftANQWp3O3kKt9iDZAqzA89P9mlHwqscdYCcV4uqgoKX85OVuX6cKs4qWT42o2+K
 fgaM3T1/shQay2n95tNjIHVhve3pAw4EYCQvr/FVO4UXuYpgv73333HbyxgXlnSez18T
 CUOIz1uU0RIUbiCHBpPerTImQlc6Tfwf+eSBcRGNJ8WGcyVk/t/QA1CB9na8/qR7fmGd
 RgsTjKT2mc1092iVhOoUIz42kwILB81ndjmi40iKrEDaIbqUfGX8wspLFZIayTyIGvMA
 YBGtMJ5nXlVCn+zycWkZQIOGy1R7wgmnWop1vYX1bsjuw+Dt14YKWVTicHLrAX7SoPQm
 t3tg==
X-Gm-Message-State: AOAM5307AvJ4+qmQ4/CFyQeEGXpDCv0+NT5HGOW7OEbOHfLrVzCYBJ7/
 f973v7ymHpXzepn/nptXRYdJa3d2EYPbRnTPAjjVWTEGlMIiKYGYQhvmRwYIvyiQEUjVGaXtNM0
 5oU1tixVVU52+GMcRpz5b/K+rKHZsRdnmspROVxf2VxmJ
X-Received: by 2002:a05:600c:284b:: with SMTP id
 r11mr4940979wmb.179.1634038174952; 
 Tue, 12 Oct 2021 04:29:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSIW87MAnP/YGW/e3O+0hW0JLMaF3rLvNqNrNOXN3NYEhTe6teWlliWCUN6zZ66tm7KP2tKzRbb4aLIwOsxAQ=
X-Received: by 2002:a05:600c:284b:: with SMTP id
 r11mr4940959wmb.179.1634038174772; 
 Tue, 12 Oct 2021 04:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211012131836.4e17a031@canb.auug.org.au>
In-Reply-To: <20211012131836.4e17a031@canb.auug.org.au>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 12 Oct 2021 13:29:24 +0200
Message-ID: <CACO55ttUA1nwFf0UP_+8q8f_baYey0+WwcwJvLMixFDv=RsncQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, 
 Luo penghao <luo.penghao@zte.com.cn>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

uhh, that's on me. I will send out a patch today. I just noticed that
the config file I used for testing had WERROR disabled.

On Tue, Oct 12, 2021 at 4:18 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c: In function 'gp100_vmm_fault_cancel':
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c:491:6: error: unused variable 'inst' [-Werror=unused-variable]
>   491 |  u32 inst, aper;
>       |      ^~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   404046cf4805 ("drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.")
>
> I have used the drm-misc tree from next-20211011 for today.
>
> --
> Cheers,
> Stephen Rothwell

