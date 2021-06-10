Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772943A22D3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 05:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7174F6E446;
	Thu, 10 Jun 2021 03:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB23E6E446
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 03:33:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ho18so30709803ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 20:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rlu7ADzUmOZbc3EJQBcy2kamIFeD9ilwHTbR0roYyyE=;
 b=P4pUZ1VojUT7z6e6FITXg4qXT6+1GbChRnbVPEclP/wztrDjRtn20tCUb2I5ikK/pW
 AmrGLJqR8a20KlsTJ6McKrPme/jO/TCMnRiZ+dUI9Urk7IK68dR3bCJRzIfcu9w7oEUE
 vsyUeJI5j7vtZ/l2jDgG27RZZiSXLd45ktXGQqpxAJQx11ocF/POJpnbg6u/AZx+Pzkz
 r5gD9ZlM7AAcDA+rENppKphXzqNy673CLfPJ7y+Y7z7rjM6nEhyPu8NUktOlg+5dR7K5
 UK1EXaHIKUG0yomiYl+TzTOyPnGuQ9SxpzlRM1X8BHle2xJn9nYEg2r8Mz0gilKF09Mn
 au6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rlu7ADzUmOZbc3EJQBcy2kamIFeD9ilwHTbR0roYyyE=;
 b=ZCkNjUqYx+xDLVBzoVrpb6n5myukTvDg15PCc85qOn+tK0VBspeJw9QRANnccpS4ng
 HvDwufZ8L5UZHhpahtkgcBy7fpPjleOGEvXHtgqytexjDn/5B7oyjWigfAZGCcWZicBH
 YrpdRmhKOw+YBPELIuOYrAV5z5FbuUUaJ5uEi/uSEkL3Wcwt6Twoss07UhBIxdzoRgcX
 525qIQT2sqtRV6YHZscVxId6pdHcZ3SZ3WCNNhlAbrdqXOGyzHJEs6Wzd/wa7JQHcuBN
 XG45WSr1AcfSJoJhR2EnW7EPWXI1/uABL1r7xzNohSgfP67oU3OFp16pEBd3jpdpY/CP
 PEHg==
X-Gm-Message-State: AOAM530VFgVO504Iiw+j94D6LjGUneSZfANrjsO6u4vYCluEzAJmSQdb
 674j+tHMP2DSNADDzVdmlloCwxuEm8RXEwxbkZQ=
X-Google-Smtp-Source: ABdhPJzvTnMa2cJ0cP6bf5ydeYiB6yT/ldWmJlYCrtaKZEw3k6zlGjpkA1tXzO81p8yO087UmvJKBk1KSCxHQQne4ZE=
X-Received: by 2002:a17:906:365a:: with SMTP id
 r26mr2614479ejb.340.1623295995316; 
 Wed, 09 Jun 2021 20:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210610030344.117897-1-airlied@gmail.com>
 <CADnq5_NsAmBLMLmWsCc0VJO130z+ARhGXM6kVS_YD++nQ_Gy_Q@mail.gmail.com>
In-Reply-To: <CADnq5_NsAmBLMLmWsCc0VJO130z+ARhGXM6kVS_YD++nQ_Gy_Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 10 Jun 2021 13:33:04 +1000
Message-ID: <CAPM=9tyS7pjTAKXbs-1gXtMsy39ysNTKKOE-cidsg1xqLNb-7A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use correct rounding macro for 64-bit
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Jun 2021 at 13:23, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Jun 9, 2021 at 11:10 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This fixes 32-bit arm build due to lack of 64-bit divides.
> >
> > Fixes: cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

I'm going to apply this directly to next.

Dave.
