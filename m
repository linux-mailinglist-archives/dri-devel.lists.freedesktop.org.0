Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DA79E06B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FFB10E46C;
	Wed, 13 Sep 2023 07:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1464A10E46C;
 Wed, 13 Sep 2023 07:05:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a9d6b98845so136010366b.0; 
 Wed, 13 Sep 2023 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694588754; x=1695193554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARucV4SPV6o29NZnTlh9kC1XvI7Cu6efHFTCveAgcl0=;
 b=A7gDv68o3rkVw0OMrrwJlxVV63VUAkH6tT7lRmW0QTd9Ryz7qAfCtly3t/bIhSdJmS
 olH5EkHuE5kHq7LOhSekm5xG1+WB5CZqfi26QQ/vHQg4PLjw6UQTwenxA1klSCDmbvgZ
 VzrQO3lRKSndMNLAWr7bfN5rTM8OfiTet3+wXa4VgVWtT5AmG4FiQilAJ1Hq7jrpqnzO
 3Yvv8ne7uQYR7qYV4b1M8Ce3G6kQpVsZABP/Bz2SYpzSKnkz7PLIBR7C6Ckr1phPtHtK
 DGFZ0gMgaQXBnE94zhmYOG1ARzQh9Y2lmrvdStW2PPu1yx5bWGK7iw/X70Sf2FABlLso
 kogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694588754; x=1695193554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ARucV4SPV6o29NZnTlh9kC1XvI7Cu6efHFTCveAgcl0=;
 b=apyrrBHa/S4ErjGqnamd/ouRwGKymSDRuAtFn2LgT7cbN14/VCI55XxGpH3JrsaROi
 k0G88qNb0tIX45YM8U8/ET6qU+aM/C/DRQQWSqHkda70OK/GjPG5mOktYrMW+M5Oa8EN
 l9Ll0NIZzqXrKrnP0p2DaQ2L5vogXZRpRgW36pyESFiIFe6XRjasdR6G6vOBQPW+0o1P
 EwnaQ6xkm7CwqM2o6yJ/XEi50aurdTlMm3h3nVxD+DUiwjTUTLLWe4IwCsFtddyCLjvE
 ouft97oTqWkhGbipH2+sUuE5X4MMywAx/QKzarhKhbFCe0W3b9WkV+d8edB5ZwG1Qkfr
 AEVw==
X-Gm-Message-State: AOJu0YwFR66EWXUWUA1WV/5vF8qx1nZepfcB+1NulLOGW0MiQS4jmCNV
 9grGW/xGOiveUlfjlBQChprYHxuHCawJ1+h2U8Y=
X-Google-Smtp-Source: AGHT+IHkJKnf5Vb1twD6bjQNQC3iEYctJfsdYHtpo6SstTdYPYDzfAgiSTsnLIEfHqr1m0kJedNPsdPs7MHhH7vSrJo=
X-Received: by 2002:a17:907:75d7:b0:9a5:a543:2744 with SMTP id
 jl23-20020a17090775d700b009a5a5432744mr2313726ejc.33.1694588754097; Wed, 13
 Sep 2023 00:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
In-Reply-To: <20230913090311.5eeb026a@collabora.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 13 Sep 2023 17:05:42 +1000
Message-ID: <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: matthew.brost@intel.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Tue, 12 Sep 2023 18:20:32 +0200
> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
>
> > > +/**
> > > + * get_next_vm_bo_from_list() - get the next vm_bo element
> > > + * @__gpuvm: The GPU VM
> > > + * @__list_name: The name of the list we're iterating on
> > > + * @__local_list: A pointer to the local list used to store already =
iterated items
> > > + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_nex=
t_cached_vm_bo()
> > > + *
> > > + * This helper is here to provide lockless list iteration. Lockless =
as in, the
> > > + * iterator releases the lock immediately after picking the first el=
ement from
> > > + * the list, so list insertion deletion can happen concurrently.
> >
> > Are the list spinlocks needed for that async state update from within
> > the dma-fence critical section we've discussed previously?
>
> Any driver calling _[un]link() from its drm_gpu_scheduler::run_job()
> hook will be in this situation (Panthor at the moment, PowerVR soon). I
> get that Xe and Nouveau don't need that because they update the VM
> state early (in the ioctl path), but I keep thinking this will hurt us
> if we don't think it through from the beginning, because once you've
> set this logic to depend only on resv locks, it will be pretty hard to
> get back to a solution which lets synchronous VM_BINDs take precedence
> on asynchronous request, and, with vkQueueBindSparse() passing external
> deps (plus the fact the VM_BIND queue might be pretty deep), it can
> take a long time to get your synchronous VM_BIND executed...

btw what is the use case for this? do we have actual vulkan
applications we know will have problems here?

it feels like a bit of premature optimisation, but maybe we have use cases.

Dave.
