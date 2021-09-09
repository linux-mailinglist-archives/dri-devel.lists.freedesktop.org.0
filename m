Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81C405B96
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1BC6E8C2;
	Thu,  9 Sep 2021 16:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752A6E8C2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:56:51 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id z2so1560365qvl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 09:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UiJsyTO13Cu36LYbRcUP/9R9fJ87vyTozxXzfzHu2CE=;
 b=Xw4CyYP+DbMjHZgvk+HrE8KRfG88yP3tMbfOkwYhf+DQCHLDM/8/XKlSaRZGLfExC/
 gsUc14791yxFDfJUIRRlfWQzdq1rDQp02KAIFdeXG/foxjRL2YwrJ6fYts9D7T2z5QjK
 9Gcmj41tJF8nMwkCqXqCudZySDIVuKEaqKySi2jKSW+blrBafF4odjWTInhleljB78JV
 3rL5WGQzjWACTC0RePMdAKOBFaKClqjPdh4ddLaoZIefW68/7mG+bc8eFmdkY6yjER+n
 eUaVcoRgQ+36GEmghZyWFRwUY7ks0QyDaVxcuCoSaDAiH4qDOhvGoYZ7goLrSj2bOUgd
 6oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UiJsyTO13Cu36LYbRcUP/9R9fJ87vyTozxXzfzHu2CE=;
 b=ycqwTx4OIOMdYYaJcGjtSOqOSbho+BR6qRHR582AxO5xGgL58xJIyQ6MG/yWtFn5oo
 d9BDa+A0Bqzh0XZd36U5UkvgpRPrunAO2ntTvDneUnZ2kWezGCuEl+jkcGAKynRdX4hF
 HNnCRK/+kAKQrRfmdu+tkbjePnl3pPfdNv9Qj351kuiUNeaNSYI7qq2LnkylfPc+w6/f
 oxXAplD9vJz0xlH1X4bh+7WRjdOG/eBM4W3v3bQz415rMrJqiKSHcVfaC1jnFBLBiVlK
 5Zm5TbMw48IwbsnYS5lZ2TjApogcU7zqQ1cHdyh4MyMK+DZ30LHGpD0zYBJj2jYn7E05
 xXaA==
X-Gm-Message-State: AOAM533b6EFkA2VeTr8T6WS0vG2iojFgcr2pAp9UrSmIj3zcxc6P+SCP
 UbeDGhB4whNWUCMJw9F8PpEuSiXYt0r6RgT8JT4=
X-Google-Smtp-Source: ABdhPJxZEy0uMTyA/3OBW7xoq4yuX7LMpgwsGbG9E/FI5aRDIgxfcFRO+SM7TB9aS1yOe2kh0DeHJPNwv7cJ7n/1aH0=
X-Received: by 2002:a0c:cb10:: with SMTP id o16mr4000486qvk.57.1631206610377; 
 Thu, 09 Sep 2021 09:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
 <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Sep 2021 17:56:22 +0100
Message-ID: <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
Subject: Re: i915 ttm_tt shmem backend
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 9 Sept 2021 at 17:43, Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Hi Matthew,
>
> this doesn't work, I've already tried something similar.
>
> TTM uses the reverse lookup functionality when migrating BOs between syst=
em and device memory. And that doesn't seem to work with pages from a shmem=
 file.

Hmm, what do you mean by reverse lookup functionality? Could you
please point out where that is in the TTM code?

>
> Regards,
> Christian.
>
> ________________________________
> Von: Matthew Auld <matthew.william.auld@gmail.com>
> Gesendet: Donnerstag, 9. September 2021 16:56
> An: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>; Koenig, Chri=
stian <Christian.Koenig@amd.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>; ML dri-deve=
l <dri-devel@lists.freedesktop.org>
> Betreff: i915 ttm_tt shmem backend
>
> Hi Christian,
>
> We are looking into using shmem as a ttm_tt backend in i915 for cached
> system memory objects. We would also like to make such objects visible
> to the i915-gem shrinker, so that they may be swapped out or discarded
> when under memory pressure.
>
> One idea for handling this is roughly something like:
> - Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
> - Skip the ttm_pages_allocated accounting on such objects, similar to
> how FLAG_SG is already handled.
> - Skip all the page->mapping and page->index related bits, like in
> tt_add_mapping, since it looks like these are set and used by shmem.
> Not sure what functionally this might break, but looks like it's maybe
> only driver specific?
> - Skip calling into ttm_bo_swap_out/in and just have
> ttm_populate/unpopulate handle this directly for such objects.
> - Make such objects visible to the i915-gem shrinker.
>
> Does this approach look acceptable?
