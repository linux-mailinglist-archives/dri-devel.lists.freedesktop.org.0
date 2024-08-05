Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB5947F43
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 18:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0624D10E24B;
	Mon,  5 Aug 2024 16:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ViSrNNRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296C10E24B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 16:24:19 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a1c496335aso7632255a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722875057; x=1723479857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a8C99+OTElpTmOTtUSQ4jS9OW9GVLl/7moJ7+wx1Mb4=;
 b=ViSrNNRQMsaVmU+WUSkdowdnlLzfTjmjRktxe1P0f3D6Ghy9nPjVOtNLvOobgM4kxC
 FwOagXDdFyRsLoDKtxkNK6ZDBo/+eXDN3ZwT6Ho8zqnSoAYYvXd7QYB4ZaP5GqZ6tive
 NGlsuYfIfHdcc8R6OtsQnjMHqkSWX9iYuTb5PVsSKX3Rv16AO1x70AAiR5qouGA2mn/9
 wTXB2HQ+dO8dCf82XNojSxlBlaV4Rthv1mBESD6k7ZSiAyzZeLR/INXj1dRXuPWXN7xw
 diyJ5LYQSETWykZOCjA8OD9myMtOm9brLp9BS10fS7Rfn2458LWcstjpswCazQNGuLhq
 Ctyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722875057; x=1723479857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a8C99+OTElpTmOTtUSQ4jS9OW9GVLl/7moJ7+wx1Mb4=;
 b=mCTfE4b3HZwBqV82fDhlxDyO2xArKxERBLp/8COGFZzmiwURoL5kQMutN34tsoU1HT
 HE5gzbOCbzYOK4Iuw49Tb8CExZmKD15ts0R6Dgx483ZlK6YQ1MwpLyQ0h7+deUMRgerf
 kzRJ3nCIQGZGMbFyJcxl6st/Ds5kA0lsyUKJvMH5F5E7dUlD9e6QmBLu7uZ2iyj4piWm
 SgYJmUtpwbkvc9irYmRVW2sKhHcPkx2ukYv+t4UmyV5xHH6BWTU/+hHgOAoiOjY63SkD
 qrKAO9Iuip4HIboFOrLBXimwnEdC0mboIrg+FI3iI4Aoh+nrR+f9FJzbRwXWXETXbPev
 3hng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfI2YCuPDfzQnrWbRY15riOQohtTqqzSAUNmgc3WADtIjW2UQQOH5ZMh9WHo34a19ijsJ6Q31xHMezvn6HaI/uiXT2TqCs57dNd+SgkAm3
X-Gm-Message-State: AOJu0YwY/f0di5eGCAiJzqcnATavXYlhp0JP5mDKCK1YYtDntR8/kIMb
 iWT7McZhDoLiGgvZk0QMwVXi957c2PD8x5hey2wS7b/u4IqnxCibSmieABgxdRPhdh1djkMmQjk
 nmkamz9Pt9+U+dBdt/BX+hwWjm2U=
X-Google-Smtp-Source: AGHT+IHvyHbFZJE4p8C4OL9f2eMAtF/7nSyBc86q0iTr2swDTqSonp+1rkVReAaAYjc0C810FGILIP+l2ZHt9zaqOEo=
X-Received: by 2002:a50:e613:0:b0:5a1:a08a:e08 with SMTP id
 4fb4d7f45d1cf-5b7f39e07b7mr10209743a12.11.1722875057029; Mon, 05 Aug 2024
 09:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
In-Reply-To: <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 Aug 2024 09:24:04 -0700
Message-ID: <CAF6AEGvwrYiN6nMSsRAdc3qq+qQGWEvdW_3+xJh6y2iAyW6rkw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Sergio Lopez <slp@redhat.com>, gurchetansingh@chromium.org,
 tzimmermann@suse.de, 
 mripard@kernel.org, olvaffe@gmail.com, kraxel@redhat.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jul 24, 2024 at 12:00=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/23/24 14:49, Sergio Lopez wrote:
> > There's an incresing number of machines supporting multiple page sizes
> > and on these machines the host and a guest can be running, each one,
> > with a different page size.
> >
> > For what pertains to virtio-gpu, this is not a problem if the page size
> > of the guest happens to be bigger or equal than the host, but will
> > potentially lead to failures in memory allocations and/or mappings
> > otherwise.
>
> Please describe concrete problem you're trying to solve. Guest memory
> allocation consists of guest pages, I don't see how knowledge of host
> page size helps anything in userspace.
>
> I suspect you want this for host blobs, but then it should be
> virtio_gpu_vram_create() that should use max(host_page_sz,
> guest_page_size), AFAICT. It's kernel who is responsible for memory
> management, userspace can't be trusted for doing that.

fwiw virtgpu native context would require this as well, mesa would
need to know the host page size to correctly align GPU VA allocations
(which must be a multiple of the host page size).

So a-b for adding this and exposing it to userspace.

BR,
-R

> --
> Best regards,
> Dmitry
>
