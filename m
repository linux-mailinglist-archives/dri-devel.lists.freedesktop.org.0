Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1ABA79BC0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA2710E203;
	Thu,  3 Apr 2025 06:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MBXE0/Wr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87610E203
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 06:07:37 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so69266466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743660456; x=1744265256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0y1chSLTgq4by+/iKzl7cqrc4OIVMXRZ18Ndod/oVA4=;
 b=MBXE0/WraciL1EHxfem1GdD7bEj4HMf0ZQ5kdR8UxdHbwyKe47w165G3uvPizbvsQN
 E3Bt8mL2yulBDjl02JO18g72Y08W2Hqwg5h4DlxUdSptGezE4gnvXt7mNvmCOcveQU3l
 Bl5chlat2YSmxdvYmlPoI7NpVPHvL5FMOsMvASsocsZcSN+28Ebe3njncPrUU08gcF3m
 WLotvvRz/attXXyxpW61b2Qr0Baed9viDgrU2DCwqAWmE6gRtSBKtZXZ0Oe2QUK538e6
 W1jdgpmsK88FbDlqRz/7YJo489J6K8lrxlL4A95CC0ZLxnKM86lTO7wfAeJA5Lnz3JKc
 Xfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743660456; x=1744265256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0y1chSLTgq4by+/iKzl7cqrc4OIVMXRZ18Ndod/oVA4=;
 b=jGniCqxfSiyJys+GIrbP3fxLV7j7nporMa4Hh94baeXzMKEk7LpTKhA6W6Sg31spEH
 RlJduhKaJslRNoxJknS5WUcGNgi1QCN/42G/c+arozxkT4RLcxyNUfGS1qbewM20w9q1
 cIuxvrYng6Zqdm/o6TA7XBbhwOWJYouQn87Yu6aFPKIYckNi5KfTIAS8dFqj3SRa5wuP
 BRWEIM72WqBGrBZK6WnzATCLxzcSxdNExH8w0HRArk/uKP9tbsLl8XLZ/L0YrnAuBWDT
 fdwiw+IaZC6Yte9G/GzNDn4aZRMucBTXU4fUZeTAKdxbY4d+U34RhcqpiGgzrMdj3I1r
 tyUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Znr9b8r5ZqzArMwXioXLmlMlV36k4SgqUgMeLZH0mASgPAMTEJXf20xx9uo4RsbGLf1cdDiOF/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOkONDnQEUXKTCqvf974SAfiHag3+hCADN1lA7hqCfDhvWrwNl
 dTW8HvSlINEjdAUPZOLDPQ6LyDSf8bdaTZvRzVuhA0kwpJv7cAK/gwt+8R5s/u0wEv4gh79SfnL
 xKamqLecuGd6VoMHGJvS2h+rb6bs=
X-Gm-Gg: ASbGncsUUqetS50XBE1v2vBX9IkewGcSnWAjAu/TI9SoQeCQJPSCW6MfQXEZmA27s+U
 6bBJ7D8+CtJAIvANZUpkhbqaW0TDI1h/7mnrfciXPCCwEwonq1wzLGT2vSrNEz98twG3e49A+FY
 XQpfzt8u9x3xocXQ+MQjgD7a2Rfo+kMksnO6I=
X-Google-Smtp-Source: AGHT+IEf6my0Oevy7HxSEvSBLIVZB6UUtRLQAMtnvT9ULs0ZmHL4HufuJOz3Xwan6rPv7/6qdLH2tQeyB4bomKzEbiI=
X-Received: by 2002:a17:906:7955:b0:ac1:e00c:a566 with SMTP id
 a640c23a62f3a-ac738bbe6e9mr1868178566b.45.1743660456051; Wed, 02 Apr 2025
 23:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
 <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
 <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
In-Reply-To: <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 3 Apr 2025 16:07:24 +1000
X-Gm-Features: AQ5f1JqIs6baj7zESBDpkv7pR6DzQLKEPOII2QRNAbnnHufJyGkPQs5rKDbOWPQ
Message-ID: <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Tue, 1 Apr 2025 at 21:03, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 31.03.25 um 22:43 schrieb Dave Airlie:
> > On Tue, 11 Mar 2025 at 00:26, Maxime Ripard <mripard@kernel.org> wrote:
> >> Hi,
> >>
> >> On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian K=C3=B6nig wrote:
> >>> [Adding Ben since we are currently in the middle of a discussion
> >>> regarding exactly that problem]
> >>>
> >>> Just for my understanding before I deep dive into the code: This uses
> >>> a separate dmem cgroup and does not account against memcg, don't it?
> >> Yes. The main rationale being that it doesn't always make sense to
> >> register against memcg: a lot of devices are going to allocate from
> >> dedicated chunks of memory that are either carved out from the main
> >> memory allocator, or not under Linux supervision at all.
> >>
> >> And if there's no way to make it consistent across drivers, it's not t=
he
> >> right tool.
> >>
> > While I agree on that, if a user can cause a device driver to allocate
> > memory that is also memory that memcg accounts, then we have to
> > interface with memcg to account that memory.
>
> This assumes that memcg should be in control of device driver allocated m=
emory. Which in some cases is intentionally not done.
>
> E.g. a server application which allocates buffers on behalves of clients =
gets a nice deny of service problem if we suddenly start to account those b=
uffers.

Yes we definitely need the ability to transfer an allocation between
cgroups for this case.

>
> That was one of the reasons why my OOM killer improvement patches never l=
anded (e.g. you could trivially kill X/Wayland or systemd with that).
>
> > The pathological case would be a single application wanting to use 90%
> > of RAM for device allocations, freeing it all, then using 90% of RAM
> > for normal usage. How to create a policy that would allow that with
> > dmem and memcg is difficult, since if you say you can do 90% on both
> > then the user can easily OOM the system.
>
> Yeah, completely agree.
>
> That's why the GTT size limit we already have per device and the global 5=
0% TTM limit doesn't work as expected. People also didn't liked those limit=
s and because of that we even have flags to circumvent them, see AMDGPU_GEM=
_CREATE_PREEMPTIBLE and  TTM_TT_FLAG_EXTERNAL.
>
> Another problem is when and to which process we account things when evict=
ion happens? For example process A wants to use VRAM that process B current=
ly occupies. In this case we would give both processes a mix of VRAM and sy=
stem memory, but how do we account that?
>
> If we account to process B then it can be that process A fails because of=
 process Bs memcg limit. This creates a situation which is absolutely not t=
raceable for a system administrator.
>
> But process A never asked for system memory in the first place, so we can=
't account the memory to it either or otherwise we make the process respons=
ible for things it didn't do.
>
> There are good argument for all solutions and there are a couple of block=
s which rule out one solution or another for a certain use case. To summari=
ze I think the whole situation is a complete mess.
>
> Maybe there is not this one solution and we need to make it somehow confi=
gurable?

My feeling is that we can't solve the VRAM eviction problem super
effectively, but it's also probably not going to be a major common
case, I don't think we should double account memcg/dmem just in case
we have to evict all of a users dmem at some point, maybe if there was
some kind of soft memcg limit we could add as an accounting but not
enforced overhead it might be useful to track evictions, but yes we
can't have A allocating memory causing B to fall over because we evict
memory into it's memcg space and it fails to allocate the next time it
tries, or having A fail in that case.

For the UMA GPU case where there is no device memory or eviction
problem, perhaps a configurable option to just say account memory in
memcg for all allocations done by this process, and state yes you can
work around it with allocation servers or whatever but the behaviour
for well behaved things is at least somewhat defined.

Dave.
