Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C52B4A3E4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4F10E644;
	Tue,  9 Sep 2025 07:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GogxzaWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFE310E648
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757403558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAKUDqp9B42xLRKoQ1q6HPvlaG3y/KW0AuPqPz6MER0=;
 b=GogxzaWCPqOimdDnLxD8MoiLOakbeZcMurlRYzeMu22prQIza9IAjWFdK7+SUyq6q5JUoS
 o2BztCnyvNwCC9S+nJtksQhs1bp8P8y//1foY2MC3yhqqcX1g7QFl1jQAw3hNNtrroIdcw
 l9j/CApDmO91S4GDD/38/dEH5z8iueA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-AL6SW_0fNjaPki-XUBTqlQ-1; Tue, 09 Sep 2025 03:39:16 -0400
X-MC-Unique: AL6SW_0fNjaPki-XUBTqlQ-1
X-Mimecast-MFC-AGG-ID: AL6SW_0fNjaPki-XUBTqlQ_1757403556
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24458345f5dso74602835ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403555; x=1758008355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fAKUDqp9B42xLRKoQ1q6HPvlaG3y/KW0AuPqPz6MER0=;
 b=eX9AwKgKelWWx0fk4JcmyUEmtSXTbUbafH7kJQ7YQcIMoVxDSe1Src/rFWR+vKyItz
 eOn2YtnXKMulMIdSQBHL0BkIHjbm9r6Su/0OtCLuQEVDv3azN51i1qatQe27sodTUe+u
 DPt41Jr2is689ehr1t1II9a6a7+tvrkIrDxZIND/YfUWCmJcsMSb7oueB9mZekAE/WE1
 YIGTqffjbgqhXG+0RAhfyWhcZYxlCR4V5Wv3XP7tRwdTnOZ6/idMzZawm+po86+tgths
 KzIlJE7VuGxr4rmkb34oF6Rq4elFfdx+FMRCVFEfjG/4lqxJcwkZS0u2m5nToWheK8pq
 vhxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaWYezFESlOxDqEKc+jE24c+wWTZ1DG7WD491l2uu55w7N1p4Npm8s6CzPXBk0wP+gQ1oguHYmHGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw781HyATYPv0xeAli63btQ7ZTXE/Xrq+KFYSssAw2nBG1Zk9Jd
 sUwEFHBL9CeZr3FShKVLCI4BIaYgKXCs2tEvf37N/CiuY7XAEvLmcgBwslnpzHkPQPGOowK36yj
 HgE8j4HY1nZl5UyoP5x5hp4iMcEy56ZpW2bD4P/EkIx5ILNOA2HNBieKu/zc2Yq+E7aGdz22uOL
 rZg5kiYz7SjisUnmSmNgAnT8b1KdOn7J4qT4bkjWGPCfO/1JO6Sc9F
X-Gm-Gg: ASbGncsrJyaSqwJO0+8S41rrNvTf7LEfMArAyZWgR6SQMeSOnq0Lwow+yWhysiUVOPt
 1Jvf1i10PnKbrZtRJAtAj6JDT7OiHkPm3AMTOlj92UkZZDiC9vLNhBm974k/OcrWbXmbEDg22Tk
 AMZUBuZh6++yCLBT/c4nY=
X-Received: by 2002:a17:903:22c4:b0:24a:aca0:7cfd with SMTP id
 d9443c01a7336-2516e97ee9emr149034175ad.18.1757403555596; 
 Tue, 09 Sep 2025 00:39:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFws9UMff+lYUWjk7dlv8T0Vfle1aaCxV2ydo6Ckwkr11EIgvutJ3JTdfzRrO9sh5080jxOijCYRHiWesES14k=
X-Received: by 2002:a17:903:22c4:b0:24a:aca0:7cfd with SMTP id
 d9443c01a7336-2516e97ee9emr149033815ad.18.1757403555217; Tue, 09 Sep 2025
 00:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250904021643.2050497-1-airlied@gmail.com>
 <DCO3EPQXQSUL.2XUR07VDP2Q38@kernel.org>
In-Reply-To: <DCO3EPQXQSUL.2XUR07VDP2Q38@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Tue, 9 Sep 2025 17:39:03 +1000
X-Gm-Features: Ac12FXyjIQ0qOrbbH4fghQY0RT-bCeGwqRXV7o-Bt5agSu5xwejaQ2q5EkKz5jk
Message-ID: <CAMwc25qsD2qtLzPmWR-U1AOg_zs+oGPrDotPjUXRVSvmCGEGSw@mail.gmail.com>
Subject: Re: [PATCH 1/4] ttm/bo: add an API to populate a bo before exporting.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Christian Koenig <christian.koenig@amd.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RIe0gcyp69bbj5eKIF-I7t1DgPJBinI2cKgGXQJQ5PA_1757403556
X-Mimecast-Originator: redhat.com
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

On Tue, Sep 9, 2025 at 5:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu Sep 4, 2025 at 4:16 AM CEST, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > While discussing cgroups we noticed a problem where you could export
> > a BO to a dma-buf without having it ever being backed or accounted for.
> >
> > This meant in low memory situations or eventually with cgroups, a
> > lower privledged process might cause the compositor to try and allocate
> > a lot of memory on it's behalf and this could fail. At least make
> > sure the exporter has managed to allocate the RAM at least once
> > before exporting the object.
>
> The below use of TTM_PL_FLAG_MEMCG suggests that this goes on top of your=
 cgroup
> patch series. However, wouldn't a similar change make sense regardless?

Indeed, I just rebased it onto misc-next and dropped that parameter today.

Dave.
>

