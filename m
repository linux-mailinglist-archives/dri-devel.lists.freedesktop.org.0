Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732B7B148ED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4FC10E5D7;
	Tue, 29 Jul 2025 07:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kowalczyk-ws.20230601.gappssmtp.com header.i=@kowalczyk-ws.20230601.gappssmtp.com header.b="0tWrRKWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5D010E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 22:08:17 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6154d14d6f6so1565934a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kowalczyk-ws.20230601.gappssmtp.com; s=20230601; t=1753740496; x=1754345296;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVZlePzGjkHlHhNr3txJWdkuHXKAOIv3uj0JeG3SlOk=;
 b=0tWrRKWbcm1vHchn7yWyruWjV4UT5j/mTAK2IejDIzI8ocqx4ws0+xHta8qR7VwFC8
 hx9FFtQ1oSCkrDYK8Y/yFeks/S6OoHZRCIpMIcdL6VpVYJXxGlgU8sdlH9OxaMa/NgjE
 DYPeH2EGzE8mFniccMWgaElrtozcEmc+bo4Qbdf7W7aMprI5BGUxpOrmXPjJ6Bq3nRgY
 M4w3njQeHMM9qHiveppFhkqTcN3K4c3wDAf4nG1nJKQadpbgRIVQd7wNnVUlkHtusAJH
 pPppIyjpi/uqMkAeuEB8Ai8D2SXhLTajmWJK6MO2dJfmo6xSRN89brHjCOsfbhNF1eJB
 0CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753740496; x=1754345296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVZlePzGjkHlHhNr3txJWdkuHXKAOIv3uj0JeG3SlOk=;
 b=L/hJQidv+x9ySFTtmBXCGDp2hi2hPT/D8zR4t9SDQUPfUFZQ9q/rnVDmGa5uS1PJo8
 yoIjabGq5xJWiCyydxYGEzw8N3SvceMeWCnmG3VyP05AAs3La7zl12nwd+fgjlHXuC6x
 s6YZEsiKP106al/c37GJfxcSzZnjC8O13oHG7UXuz0sJ3g/gMZaWSsawrRQruFqmve9m
 iDhFsu/0XB+qOPQqMnkpXUabygcnRjw+H82JoTt/SW2TtSUTaurKyZw4WURVju9RmMhP
 vnTqaBBljw+KttfUHTPyV8TcrCEqepuL+ZFHQd8MmSfjDmeWy4mK5DWwD/wj71S+bSTp
 pHvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRO9japeOPGIlZwJ5HPWSGeVyldGO6n1+Ag+HcFO6rOw3LJfiYcq71sOLm/7m8rczNUkBiyHzEqXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOL6fH8EI8LSQgefGNEijNg7hba+fCsN4gb0BQ5zcSVXjYCY+3
 bPxa0Gfao9DhYKttu0PTHdkcQO3y+5o+YSVBfd6QyQW7ROz5oTB/PUcX5sg3sLRwox8nawuVKgs
 YlyM51IvBHydSSo8x5cp0MGI/3Jf21gCp77yNq689
X-Gm-Gg: ASbGncuOCQsD+3MZ/bshCCtDBaR2pIYuJlBLFqAG8Ju2MReJieFe80Jl6qop4FD8i+K
 ratOFIZKScf9YfLuwmaF0ne5CE/LNR7Irt/X92YIpbd1SX/yRvRot1r7zbiQXfzdtBkL1Rdi9SL
 D7cWT94aOzWQBGZyM6U8eEokbiXvTkC1H0+BKZ715MJ7xBY382yuq0LRsnZyW6SyBT1a5ehwoXK
 ku/BEBsCt2KtLA=
X-Google-Smtp-Source: AGHT+IF09mPBLrOHTEIB8WHhuFE3I3nCCAFLkKtWOTo/2h9D6SAx8Ni8uYSGEDjY0L/5w9XZjlAxtrdCm0GvAmW8byA=
X-Received: by 2002:a05:6402:2103:b0:60c:397d:d638 with SMTP id
 4fb4d7f45d1cf-614f1d4b520mr12115084a12.14.1753740496343; Mon, 28 Jul 2025
 15:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
 <20250728144424.208d58d5a95057ee7081ccd8@linux-foundation.org>
In-Reply-To: <20250728144424.208d58d5a95057ee7081ccd8@linux-foundation.org>
From: Patryk Kowalczyk <patryk@kowalczyk.ws>
Date: Tue, 29 Jul 2025 00:08:05 +0200
X-Gm-Features: Ac12FXx-SLKO8_1dJESpw0d0b6bu9iuRE34W3EgqURU7mQvBpXDzfaq2MkrIgX8
Message-ID: <CAJCW39+85dtfEjqNejB8xT=JCo2gU5XWY_ohb0OxYKs6G929jg@mail.gmail.com>
Subject: Re: [PATCH] mm: shmem: fix the shmem large folio allocation for the
 i915 driver
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, hughd@google.com, 
 ville.syrjala@linux.intel.com, david@redhat.com, willy@infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, 
 christian.koenig@amd.com, ray.huang@amd.com, matthew.auld@intel.com, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 29 Jul 2025 07:08:13 +0000
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

Hi,
I apologize for the second email; the first one contained HTML content
that was not accepted by the group.

In my tests, the performance drop ranges from a few percent up to 13%
in Unigine Superposition
under heavy memory usage on the CPU Core Ultra 155H with the Xe 128 EU GPU.
Other users have reported performance impact up to 30% on certain workloads=
.
Please find more  in the regressions reports:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14645
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13845

I believe the change should be backported to all active kernel
branches after version 6.12.

best regards,
Patryk

pon., 28 lip 2025 o 23:44 Andrew Morton <akpm@linux-foundation.org> napisa=
=C5=82(a):
>
> On Mon, 28 Jul 2025 16:03:53 +0800 Baolin Wang <baolin.wang@linux.alibaba=
.com> wrote:
>
> > After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpf=
s"),
> > we extend the 'huge=3D' option to allow any sized large folios for tmpf=
s,
> > which means tmpfs will allow getting a highest order hint based on the =
size
> > of write() and fallocate() paths, and then will try each allowable larg=
e order.
> >
> > However, when the i915 driver allocates shmem memory, it doesn't provid=
e hint
> > information about the size of the large folio to be allocated, resultin=
g in
> > the inability to allocate PMD-sized shmem, which in turn affects GPU pe=
rformance.
> >
> > To fix this issue, add the 'end' information for shmem_read_folio_gfp()=
  to help
> > allocate PMD-sized large folios. Additionally, use the maximum allocati=
on chunk
> > (via mapping_max_folio_size()) to determine the size of the large folio=
s to
> > allocate in the i915 driver.
>
> What is the magnitude of the performance change?
>
> > Fixes: acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs")
> > Reported-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
> > Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Tested-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
>
> This isn't a regression fix, is it?  acd7ccb284b8 adds a new feature
> and we have now found a flaw in it.
>
> Still, we could bend the rules a little bit and backport this, depends
> on how significant the runtime effect is.
