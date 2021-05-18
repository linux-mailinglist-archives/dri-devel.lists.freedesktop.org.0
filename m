Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE573879E5
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9373F6EB76;
	Tue, 18 May 2021 13:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A136EB76
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:26:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v12so10232685wrq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RZR12pmWkFF7y/GidJZX8Aqwjr4ypoDTXEhoFqtAeZw=;
 b=i29oK3D096bW5jdcbTkpaP4VjCZwHJMNjAcFLwBSrDoUeC9W9M3KcVOQ0GpzQxBIM5
 5jw8CTfFDoH+fV6sS+YuzVWpWc1U7QnZGy75u1htqZCH1UoaQBFlAA+9aElnAFOvyw8c
 7bl+151wYX7upklWNYfqiAVAEU/Y6CQ5CoVqnEHiIYNKZRCW68AU5dp1w63y4G5cogy3
 TUC0KF+2LlgZquC/60sfzQ1A7TAZ0ASMro5Z5Mp/aTHuX4NZa8NKHioepOKcQ15LS3tR
 iYiYXqB+bRs/ajvPh3kjPQqNRMaG2iGvgmf1jF2Ak6sYoQkfPQkgU75vrtBIt4gOHR2k
 yZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RZR12pmWkFF7y/GidJZX8Aqwjr4ypoDTXEhoFqtAeZw=;
 b=h4Ua7qEBM0NI9EMpph03PcFQNjzpV3qAzST2Tx4U271/FncztoL3n/t4+Sc3jJCv2c
 IixtHgkmCEaZZlgmQwHuVYwWlxdxjJVYoWHZKQG/TG44A4EeP60THDvm87jiZsc4uUJs
 +2Tl0IeKZcR4BIf5L6Xu7qmGPKXDMs5oJTY8ZiIJb16TfRH9yrDCgTQY6vOYIyhTx60X
 KGPa+v8QZ0dbie9Vq6WfZBIavdOFv9aGF2b3yjNSBIuooIQhI2o3O26+7YByRcP7UXCN
 uW1kmD/EEdLOIMyuyKzZ6YOVwM7umdb+P4ZTFUOyYOuzs+X+4610Zkk2dWS5RW+/WHoK
 yEFg==
X-Gm-Message-State: AOAM533EsCiZjWRyRa57znR/mf6xgLzzsSUr0ZglwnyGeLBnTsGBExTe
 eQqmDvtMcLxyaRKyrwtygUX6tQmpOEc4NxvNmMzNmg==
X-Google-Smtp-Source: ABdhPJyyDliqj+Oau3C6HT8ksGUHtReIqT/JnxifuK+PO/Jlqb8MuszItOMy97raaW1Ovbgz4/XvrgkKn/Y2kgJWPsU=
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr7398351wri.244.1621344388039; 
 Tue, 18 May 2021 06:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
In-Reply-To: <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 18 May 2021 14:26:15 +0100
Message-ID: <CAPj87rN-1ST_wvnobEaeNNiOYdM9yAOvfZ+8_tcxbrFof3L-yA@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 13:49, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 18.05.21 um 07:59 schrieb Daniel Vetter:
> > First step in fixing that is (and frankly was since years) to fix the
> > amdgpu CS so winsys can pass along a bunch of flags about which CS
> > should actually set the exclusive fence, so that you stop oversyncing
> > so badly. Ofc old userspace needs to keep oversyncing forever, no way
> > to fix that.
>
> Exactly that is what we don't want to do because the winsys has no idea
> when to sync and when not to sync.

Hey, we're typing that out as fast as we can ... it's just that you
keep reinventing sync primitives faster than we can ship support for
them :P
