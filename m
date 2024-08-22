Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1D95BA26
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 17:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DA010EB35;
	Thu, 22 Aug 2024 15:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xoa0Xou9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AA210EB35
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724340562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BC2lLZmyeZx1D4kz/gj18M5l40yhANJqxGroRRB3biY=;
 b=Xoa0Xou9QDSQAyC0FQfodwtOlKqNnnOkfW1DSGMnmZbT7n6bh9aN9AyVdTjIIt8nfPxYY7
 CldwT/y7yC+HMTpKslprfN4t6K5094L1Y6vlkDSukc2F61dETT43qHjUSnQLYaBQk/wGKq
 e+tMxZ7ircVqPoS+hfgQb1cYcE6nUAM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-fDJxyOsRM9mFzk-X_p_K7Q-1; Thu, 22 Aug 2024 11:29:20 -0400
X-MC-Unique: fDJxyOsRM9mFzk-X_p_K7Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5bec2b620c2so832173a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724340560; x=1724945360;
 h=content-transfer-encoding:cc:to:subject:message-id:date
 :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BC2lLZmyeZx1D4kz/gj18M5l40yhANJqxGroRRB3biY=;
 b=hpmDyGYSbLjS7M7hg+dk0l7kokHB2E66JRJXzehGSLR/dAxCrGx76eku3sPwpVoqPW
 hqUo1qrW9GdChzR9ANOIpZZhUrWUw+YlVOEwst6GZKB457xcd0d8/7WmqBX3Gk05s/nb
 zBk2sgNngwDw4jDDpOQxnClkodGZ868SrPwwO38GeFTgwHrfpfy81AP044C3FSvkcOh3
 C8fNzt5iWs7IsfDSBqzFcmzS0LLI9fF6UBcLP6Q17e6hgVDHjfv3vrXhz2i1LCeEJP47
 SYUSXyXNe13TjcMyHL0nKZPR7VC/XiYXMhZROChewmd4uxu/YPbb4DiiWnzPIBPcGpTr
 CpyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY9QO1JuSyPCL3xbiFWHhDYGX6frhJYgnKdYPGIAx/mYtwHiYaNIu2T9KfssvfBUjbPOkEIV0LmUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznLRlsCpLQmmzUvuGPpZJ7Mdsr4PzpufNAogMnLYqMCusEIT/k
 9g7RS5NSFzBnxUtB8sa70k2JiBUBWhhEAHXrengclcJufG3EkiDR6SHqECmN1e1RNTaeDrBEBlD
 Z4e5v1G5KvPcwgxVG3WiWCLs/utO+SnQgww8Qt9nxcoY6gPzqnNM5KxNo2c/sigySanW4xbYCUT
 LUJL/6bodUTBHo1RiN6eyqzHQ/yqcS/MkxJt9jDXl9
X-Received: by 2002:a05:6402:3906:b0:5be:efb9:b203 with SMTP id
 4fb4d7f45d1cf-5c0792b5e02mr2199291a12.34.1724340559535; 
 Thu, 22 Aug 2024 08:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRJqzPNEFlYkFJXs04F+os9os2O3jXMUoqogrb/qXPfjU/csl8oC5RdbzwTRzFMonZNp35bPJ7/1S/QnksOjo=
X-Received: by 2002:a05:6402:3906:b0:5be:efb9:b203 with SMTP id
 4fb4d7f45d1cf-5c0792b5e02mr2199262a12.34.1724340559043; Thu, 22 Aug 2024
 08:29:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Aug 2024 08:29:16 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CAAfnVBkkste=HR2SKRBNWXKcunbA2iEP+rr9yhDy89+WZsYeQw@mail.gmail.com>
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
 <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
 <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com>
 <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
 <CAAiTLFUWhP+wy694MbYDvzHgUD_pZZf7Jj=AfVvTj6CWAYZ+zA@mail.gmail.com>
 <CAAfnVBkkste=HR2SKRBNWXKcunbA2iEP+rr9yhDy89+WZsYeQw@mail.gmail.com>
MIME-Version: 1.0
Date: Thu, 22 Aug 2024 08:29:16 -0700
Message-ID: <CAAiTLFVhtuzLYM0aj_CQYxAQqMVUy4WQ0KKSsJ4hDmGhL2vdGA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 tzimmermann@suse.de, mripard@kernel.org, olvaffe@gmail.com, kraxel@redhat.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
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

Gurchetan Singh <gurchetansingh@chromium.org> writes:

> On Thu, Aug 8, 2024 at 3:38=E2=80=AFAM Sergio Lopez Pascual <slp@redhat.c=
om> wrote:
>
>> Gurchetan Singh <gurchetansingh@chromium.org> writes:
>>
>> > On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
>> >
>> >> On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh
>> >> <gurchetansingh@chromium.org> wrote:
>> >> >
>> >> >
>> >> >
>> >> > On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <slp@re=
dhat.com>
>> >> wrote:
>> >> >>
>> >> >> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
>> >> >>
>> >> >> > On 7/23/24 14:49, Sergio Lopez wrote:
>> >> >> >> There's an incresing number of machines supporting multiple pag=
e
>> >> sizes
>> >> >> >> and on these machines the host and a guest can be running, each
>> one,
>> >> >> >> with a different page size.
>> >> >> >>
>> >> >> >> For what pertains to virtio-gpu, this is not a problem if the p=
age
>> >> size
>> >> >> >> of the guest happens to be bigger or equal than the host, but w=
ill
>> >> >> >> potentially lead to failures in memory allocations and/or mappi=
ngs
>> >> >> >> otherwise.
>> >> >> >
>> >> >> > Please describe concrete problem you're trying to solve. Guest
>> memory
>> >> >> > allocation consists of guest pages, I don't see how knowledge of
>> host
>> >> >> > page size helps anything in userspace.
>> >> >> >
>> >> >> > I suspect you want this for host blobs, but then it should be
>> >> >> > virtio_gpu_vram_create() that should use max(host_page_sz,
>> >> >> > guest_page_size), AFAICT. It's kernel who is responsible for mem=
ory
>> >> >> > management, userspace can't be trusted for doing that.
>> >> >>
>> >> >> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creat=
ion
>> >> >> and mapping into the guest of device-backed memory and shmem regio=
ns.
>> >> >> The CREATE_BLOB ioctl doesn't update
>> drm_virtgpu_resource_create->size,
>> >> >> so the guest kernel (and, as a consequence, the host kernel) can't
>> >> >> override the user's request.
>> >> >>
>> >> >> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the
>> host
>> >> >> page size to align the size of the CREATE_BLOB requests as require=
d.
>> >> >
>> >> >
>> >> > gfxstream solves this problem by putting the relevant information i=
n
>> the
>> >> capabilities obtained from the host:
>> >> >
>> >> >
>> >>
>> https://android.googlesource.com/platform/hardware/google/gfxstream/+/re=
fs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691
>> >> >
>> >> > If you want to be paranoid, you can also validate the
>> >> ResourceCreateBlob::size is properly host-page aligned when that requ=
est
>> >> reaches the host.
>> >> >
>> >> > So you can probably solve this problem using current interfaces.
>> >> Whether it's cleaner for all context types to use the capabilities, o=
r
>> have
>> >> all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the
>> cost/benefit
>> >> tradeoff.
>> >> >
>> >>
>> >> I guess solving it in a context-type specific way is possible.  But I
>> >> think it is a relatively universal constraint.  And maybe it makes
>> >> sense for virtgpu guest kernel to enforce alignment (at least it can
>> >> return an error synchronously) in addition to the host.
>> >>
>> >
>> > virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, so could =
run
>> > into this issue.
>> >
>> >
>> https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-mem=
ory-regions
>> >
>> > virtio-fs also has the DAX window which uses the same memory mapping
>> > mechanism.
>> >
>> > https://virtio-fs.gitlab.io/design.html
>> >
>> > Maybe this should not be a virtio-gpu thing, but a virtio thing?
>>
>> This is true, but finding a common place to put the page size is really
>> hard in practice. I don't think we can borrow space in the feature bits
>> for that (and that would probably be abusing its purpose quite a bit)
>> and extending the transport configuration registers is quite cumbersome
>> and, in general, undesirable.
>>
>> That leaves us with the device-specific config space, and that implies a
>> device-specific feature bit as it's implemented in this series.
>>
>> The Shared Memory Regions on the VIRTIO spec, while doesn't talk
>> specifically about page size, also gives us a hint about this being the
>> right direction:
>>
>
> Can't we just modify the Shared Memory region PCI capability to include
> page size?  We can either:
>
> 1) keep the same size struct + header (VIRTIO_PCI_CAP_SHARED_MEMORY_CFG),
> and just hijack one of the padding fields. If the padding field is zero, =
we
> can just say it's 4096.

Yes, we can turn that padding into "__le16 page_size_order" to store
"PAGE_SIZE >> 12". That should be enough to secure some future-proofing.
There's also some space in the "MMIO Device Register Layout" to store it
as a 16 bit or 32 bit value.

This would require proposing it as a change to the VIRTIO specs. Do you
want to do it yourself or should I take the initiative?

Thanks,
Sergio.

