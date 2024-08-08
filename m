Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBCB94BB59
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E8710E6C9;
	Thu,  8 Aug 2024 10:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZiTmUFQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6450610E6C9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723113517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRwnpUIdbkqOIA1QwdrH67QxUD8NaDJn9Y50HZQIuz4=;
 b=ZiTmUFQo5VS3f1dlSUdQhzy4/hCtq3Nvkh2IHpEpjrYpsa91IWYTs27dxQ/2ZC1YZMEooZ
 6tnktsTswxZcbE8MkyAZA58oVNzZ5ITFmMFtHW037zffTKq/bHSfGZSaHriPQVg1tqbWrs
 mp0t97nzh1geZVTryhagG3vcJMjauz8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-DFKrTMjGMsSzK1wiTvUI8A-1; Thu, 08 Aug 2024 06:38:36 -0400
X-MC-Unique: DFKrTMjGMsSzK1wiTvUI8A-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2cb63abe6f7so1153707a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 03:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723113515; x=1723718315;
 h=content-transfer-encoding:cc:to:subject:message-id:date
 :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MRwnpUIdbkqOIA1QwdrH67QxUD8NaDJn9Y50HZQIuz4=;
 b=by/eT1D+iRIKrtykq/m7uKbHBySHMj3vkfi1iB1OOk168DWSLnH5LwnuoIhYij6SRq
 lP2300NSNkDJ1ZgzI2/iFZrrOlod2N+BrraFgLJEidMP8M9SSx+j9PRi/ecq3yU6njqG
 HABdbEMM2hoNmv5zOslzV4R27Zt412YqAJouhtyEcBA4l7loqZ1Cx1Zr8nr8GmsD+IAG
 PeDgH7aNf1iOWO2iLWDioznuDkzjEAotTxWi8xAa4PX4ZUuNfo6/t61kb5s+psxPTEgj
 tpk4vR8T5ir9nGv5jjns6PBtnGBrIE9+FcxWhPY84GtQOuhGfLpeTpbZKX/H8GYLGATC
 FwCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnH3AwRiKNn1CTXqX9z8Uw4ES3bchXY97iIiuQmSmuajBwB3vfCppcA20vykHzBd0/KSKHHMD1pIv65VOiyi/SV/chEHa2dni8QWQHYemq
X-Gm-Message-State: AOJu0YyDBsItCzkm1g8uwh0w2kVISvWI21Mh81Lz/weS8ebZF86eUfVT
 2pYpge+GGeRzQAwAw7Cq8Cao3kEyPUzZwQnRlB+8ro770DKSQHvo4pEQfYlWIsZWawEW1ciRhBX
 Aedfd3do4HltRzUWe3GWDbJHpd8Jzi18nEZrhLL4l+RqpDMNxqhyo4d799EGa/SXMyvokDlVzqE
 AG3FwEnRGCkFl3FLOv4z35kUCsMDRNr5MKiGwSlcgv
X-Received: by 2002:a17:90a:5d12:b0:2cd:3445:f87e with SMTP id
 98e67ed59e1d1-2d1c3363e33mr1679347a91.2.1723113515120; 
 Thu, 08 Aug 2024 03:38:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOzJRKQe2DGOfVTSSGEssWue8gMrWTXP9ffNqImYaeYOp5wav62zp54H1TgQfbyYloERWPOSL4qaV62zRFwW0=
X-Received: by 2002:a17:90a:5d12:b0:2cd:3445:f87e with SMTP id
 98e67ed59e1d1-2d1c3363e33mr1679323a91.2.1723113514650; Thu, 08 Aug 2024
 03:38:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Aug 2024 05:38:33 -0500
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
 <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
 <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com>
 <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
MIME-Version: 1.0
Date: Thu, 8 Aug 2024 05:38:33 -0500
Message-ID: <CAAiTLFUWhP+wy694MbYDvzHgUD_pZZf7Jj=AfVvTj6CWAYZ+zA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, tzimmermann@suse.de,
 mripard@kernel.org, 
 olvaffe@gmail.com, kraxel@redhat.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
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

> On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
>
>> On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh
>> <gurchetansingh@chromium.org> wrote:
>> >
>> >
>> >
>> > On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <slp@redha=
t.com>
>> wrote:
>> >>
>> >> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
>> >>
>> >> > On 7/23/24 14:49, Sergio Lopez wrote:
>> >> >> There's an incresing number of machines supporting multiple page
>> sizes
>> >> >> and on these machines the host and a guest can be running, each on=
e,
>> >> >> with a different page size.
>> >> >>
>> >> >> For what pertains to virtio-gpu, this is not a problem if the page
>> size
>> >> >> of the guest happens to be bigger or equal than the host, but will
>> >> >> potentially lead to failures in memory allocations and/or mappings
>> >> >> otherwise.
>> >> >
>> >> > Please describe concrete problem you're trying to solve. Guest memo=
ry
>> >> > allocation consists of guest pages, I don't see how knowledge of ho=
st
>> >> > page size helps anything in userspace.
>> >> >
>> >> > I suspect you want this for host blobs, but then it should be
>> >> > virtio_gpu_vram_create() that should use max(host_page_sz,
>> >> > guest_page_size), AFAICT. It's kernel who is responsible for memory
>> >> > management, userspace can't be trusted for doing that.
>> >>
>> >> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creation
>> >> and mapping into the guest of device-backed memory and shmem regions.
>> >> The CREATE_BLOB ioctl doesn't update drm_virtgpu_resource_create->siz=
e,
>> >> so the guest kernel (and, as a consequence, the host kernel) can't
>> >> override the user's request.
>> >>
>> >> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the ho=
st
>> >> page size to align the size of the CREATE_BLOB requests as required.
>> >
>> >
>> > gfxstream solves this problem by putting the relevant information in t=
he
>> capabilities obtained from the host:
>> >
>> >
>> https://android.googlesource.com/platform/hardware/google/gfxstream/+/re=
fs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691
>> >
>> > If you want to be paranoid, you can also validate the
>> ResourceCreateBlob::size is properly host-page aligned when that request
>> reaches the host.
>> >
>> > So you can probably solve this problem using current interfaces.
>> Whether it's cleaner for all context types to use the capabilities, or h=
ave
>> all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the cost/benefi=
t
>> tradeoff.
>> >
>>
>> I guess solving it in a context-type specific way is possible.  But I
>> think it is a relatively universal constraint.  And maybe it makes
>> sense for virtgpu guest kernel to enforce alignment (at least it can
>> return an error synchronously) in addition to the host.
>>
>
> virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, so could run
> into this issue.
>
> https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memo=
ry-regions
>
> virtio-fs also has the DAX window which uses the same memory mapping
> mechanism.
>
> https://virtio-fs.gitlab.io/design.html
>
> Maybe this should not be a virtio-gpu thing, but a virtio thing?

This is true, but finding a common place to put the page size is really
hard in practice. I don't think we can borrow space in the feature bits
for that (and that would probably be abusing its purpose quite a bit)
and extending the transport configuration registers is quite cumbersome
and, in general, undesirable.

That leaves us with the device-specific config space, and that implies a
device-specific feature bit as it's implemented in this series.

The Shared Memory Regions on the VIRTIO spec, while doesn't talk
specifically about page size, also gives us a hint about this being the
right direction:

"
2.10 Shared Memory Regions
(...)
Memory consistency rules vary depending on the region and the device
and they will be specified as required by each device."
"

Thanks,
Sergio.

