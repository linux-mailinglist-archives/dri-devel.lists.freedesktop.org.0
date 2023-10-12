Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E69F7C6B32
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 12:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CEF10E4A2;
	Thu, 12 Oct 2023 10:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA8310E49E;
 Thu, 12 Oct 2023 10:33:27 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso135358166b.0; 
 Thu, 12 Oct 2023 03:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697106806; x=1697711606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+trYhH6pdvjtTzpwC/GNcRs1Ixqq8ebN0gecPy8EoRE=;
 b=IgoeBI5ayUOrNFLIgTuWUdQwzHoNGmKgtWzBRUeeDpFnEOTWXs8mjPGSlC+bh3Vjty
 wW1y/yVShNmaWA6YougTpjozUiI1dLG+BZZxMKPnjuqBExEZOjL6sgwvDeWnP44sIrdp
 hNgLKZTP3RkjsWPd7Qq8Ze9oB6CBdhCzYeBFV4gWmiBCPbYVqfLDUdMEbFUYNDYadzjX
 WVPR8NxMaSHobFGNPANt7sK8i5R0jLNdZZOUiF9r3jEWENi22jURj/qwZWssOHm/6pU8
 2ZvVL9fh8hTyfJ+Pb0/R3MWYRL2IZJqKe9Lmrd+N5cx5qFbXmXt9SUBZ5hoW63c3pOr8
 0O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106806; x=1697711606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+trYhH6pdvjtTzpwC/GNcRs1Ixqq8ebN0gecPy8EoRE=;
 b=tE+N2mm2NtTPQeahgPTPiOR++7MGDDhkzkz4x/riOkzvqx5IPGBq0QkESKStdRTue/
 l3O7zZUJk/mD9Omojqwx2+MP1rc+DJK1xD+Y7DUh+/fD6R7IOs5fVqgr+A6Ia0yGsOdx
 gyIQnpm4GCBlfVh2/tBdHnkVGp0ga4TnHjWhVXOScU9PJicCq4Z+v9j9NDj/jScE7Dei
 lrENrvGBnaM642SlXVkrYg7K2MGmGx/LkI+qBwmMFSCxeG+UcraAyp7IkKm37A8nA/DT
 7nJS9WUz60qa/AesfWrToHQmrKx1RuummZPb9Q5upkr4rMvmel062FV9d8wDHGL5Z5F6
 inCw==
X-Gm-Message-State: AOJu0YxkmKjUGWrzXKX4xeB0irSBn2hBagWzf0DulZN63YCAUtbg90rc
 Rrqj/86UUXm4YY15Th7ytvxnRCOGLnOwvdEituA=
X-Google-Smtp-Source: AGHT+IEoaB7SxZK8hFiCbD0c+W1n4JETZOdvrlo3gJ+KsJAs7mMU2QDRBvipZgMugULsUgkZhMfURFQaMQedjh8/nA0=
X-Received: by 2002:a17:906:8b:b0:9b2:bb02:a543 with SMTP id
 11-20020a170906008b00b009b2bb02a543mr23857083ejc.74.1697106805715; Thu, 12
 Oct 2023 03:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-3-dakr@redhat.com>
 <0c50ff22-0f11-1e27-c32e-694ce2b1e6c5@shipmail.org> <ZO864yp3UyVEfEjz@pollux>
 <88c45fe6-0942-707c-9ea7-8486c177fcd7@shipmail.org> <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
 <ZPB26A0/oLHTmyqk@cassiopeiae>
 <a8f28d62-daec-927a-a33d-5be3eec6a1ed@shipmail.org>
 <ZPDk/lao1JlBNGoJ@cassiopeiae>
 <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
 <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
 <76963abd-77a1-4bbd-9537-7b230e648a90@amd.com>
In-Reply-To: <76963abd-77a1-4bbd-9537-7b230e648a90@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 12 Oct 2023 20:33:13 +1000
Message-ID: <CAPM=9twSHGRoSoXxG+hz1T8iBX2VgPFvFsNCDnK_nHW9WJYBtw@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 boris.brezillon@collabora.com, Danilo Krummrich <dakr@redhat.com>,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023 at 17:07, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 10.10.23 um 22:23 schrieb Dave Airlie:
> >> I think we're then optimizing for different scenarios. Our compute
> >> driver will use mostly external objects only, and if shared, I don't
> >> forsee them bound to many VMs. What saves us currently here is that in
> >> compute mode we only really traverse the extobj list after a preempt
> >> fence wait, or when a vm is using a new context for the first time. So
> >> vm's extobj list is pretty large. Each bo's vma list will typically be
> >> pretty small.
> > Can I ask why we are optimising for this userspace, this seems
> > incredibly broken.
> >
> > We've has this sort of problem in the past with Intel letting the tail
> > wag the horse, does anyone remember optimising relocations for a
> > userspace that didn't actually need to use relocations?
> >
> > We need to ask why this userspace is doing this, can we get some
> > pointers to it? compute driver should have no reason to use mostly
> > external objects, the OpenCL and level0 APIs should be good enough to
> > figure this out.
>
> Well that is pretty normal use case, AMD works the same way.
>
> In a multi GPU compute stack you have mostly all the data shared between
> different hardware devices.
>
> As I said before looking at just the Vulcan use case is not a good idea
> at all.
>

It's okay, I don't think anyone is doing that, some of the these
use-cases are buried in server land and you guys don't communicate
them very well.

multi-gpu compute would I'd hope be moving towards HMM/SVM type
solutions though?

I'm also not into looking at use-cases that used to be important but
might not as important going forward.

Dave.


> Christian.
>
> >
> > Dave.
>
