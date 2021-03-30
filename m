Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3934EB5A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785206E912;
	Tue, 30 Mar 2021 15:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1006E912;
 Tue, 30 Mar 2021 15:00:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o16so16609777wrn.0;
 Tue, 30 Mar 2021 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eyleulbhx+njoqqH6BwP+l7pCWQF8y0aALwi12vfKYM=;
 b=fCSzzlhwIZRxnh8WlrLMYbm5+Njdfj6dEm0bHf8r+xDzYIMacTSD3i3NQycSovzuSj
 EVXrsaeA+8Q6clda2Fzt4qondyXdQQukQijU645yfl1pKwDdMg7e0hWT+6yAAVSUFuAI
 +Wy1BnSqMiT25Xv8Eh/rM+OWoPrHHNKMd1huKxUhZX3A1kI+9r4cSt2vualljOOYrzRq
 mNNZkNSVQQuKhfEkIKegbY/PcTiIj000vuo7Lx+eJ97k/smtTH32v+AczD0ypz4/NGG5
 TXj0QNsAfH8tw3UI0GxZAqJ4Z4+5VzZoZJMbwM+UPAScRykVfUXfpx69lKfy1ADRVNE5
 lX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyleulbhx+njoqqH6BwP+l7pCWQF8y0aALwi12vfKYM=;
 b=KZ6lcDN/QVSH3eYVC8hT0UkpSIhAlXhiDfgjA2PY7UtqhnhkEBbd6E+5NUs5bCk1QF
 kmgRr3DXN0Vpw1yg6DpUStJlO017Pza8ShuWNjRTWq/wRY8PwU6GgSm8DrU0lIZlNtUQ
 m5Y2bdYJf0vWZdC4waVT1HNS2nghKtybT6SX0/Eexc57m7jwfxOAswT3UU5XLBZ6ZL46
 CiVeGO7KSoIuGbIDyfEkiQQni4xT056Q69fhi+5O/FIrNA19dQwBDCMelg/DYr1Ko8TF
 DhFnxBA1gaifACUj4LJaX2zqwHfGQHkL3wYiAyRByYt4JjNZmL3fX2LIQ9OCVH626Eig
 0cZA==
X-Gm-Message-State: AOAM5324UQT3qXUar3iqFLoPgrpv+nrx/yqvUA+t7EjF7qZz2wy/p600
 rtJcPUqZwven0sAr+V6um2DfAFzdgVTECfk7Uns=
X-Google-Smtp-Source: ABdhPJwtCDJtqvJEY4d1K+b5/Nk9wM8y2m8HXX6bF4f+S6YTvz+OX7rJ6BNzGHpGdn+v7GZmGIK8aRudda7rzHLsgwk=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr35449048wrh.28.1617116413088; 
 Tue, 30 Mar 2021 08:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210326231303.3071950-1-eric@anholt.net>
 <20210329144729.GB4203@willie-the-truck>
 <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com>
 <20210330093432.GB5281@willie-the-truck>
In-Reply-To: <20210330093432.GB5281@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 30 Mar 2021 08:03:36 -0700
Message-ID: <CAF6AEGvCCWvmRBhzY4MsdzgwfJ+GF2AUOS-_NTyhM8wtnDzY2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
To: Will Deacon <will@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 2:34 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Mar 29, 2021 at 09:02:50PM -0700, Rob Clark wrote:
> > On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > > > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > > > the GPU from wedging and then sometimes wedging the kernel after a
> > > > page fault), but it doesn't have separate pagetables support yet in
> > > > drm/msm so we can't go all the way to the TTBR1 path.
> > >
> > > What do you mean by "doesn't have separate pagetables support yet"? The
> > > compatible string doesn't feel like the right way to determine this.
> >
> > the compatible string identifies what it is, not what the sw
> > limitations are, so in that regard it seems right to me..
>
> Well it depends on what "doesn't have separate pagetables support yet"
> means. I can't tell if it's a hardware issue, a firmware issue or a driver
> issue.

Just a driver issue (and the fact that currently we don't have
physical access to a device... debugging a5xx per-process-pgtables by
pushing untested things to the CI farm is kind of a difficult way to
work)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
