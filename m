Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D169498E0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 22:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F2410E408;
	Tue,  6 Aug 2024 20:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QSTUtCHC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B0E10E40A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 20:15:28 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f0dfdc9e16so12806991fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722975327; x=1723580127; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dcr4nYm/ORNQ3/y4PL408hIFoTg8Yy+y6wFiPltrL7k=;
 b=QSTUtCHCtUkawhZZsqngfzdBqnYXj0sJzBdzPjfAp1w8ystGvDd3SeFddYR5mz9TDH
 O2+l5/prTcW58/nICvQvzxKmHMRunWVgE9Un8oa6QwSOFENSxiXnGnfRiaXU+xUoFkv0
 z+dzsgQmMEwo4M26euTnsEDi45WihRwN2CPEuJNWeNGCWpaa4soGwSmVvF+gzgz8+e7M
 po+aK88ZzPb1EgEFHohnfblfqR3owg84fFxjiG1kOkWaGMxiAgNtiMSgHyrpkFz9EE9E
 C0b7NaVPOb/Ewd+w/zkhqjDKG9oR0iHYzKWMtNLZmQTwYQ/6oCBpzjsK9EkYQXKirxGZ
 yruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722975327; x=1723580127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dcr4nYm/ORNQ3/y4PL408hIFoTg8Yy+y6wFiPltrL7k=;
 b=oQFFKO6zhDZ0lc/wOCEP5Eh+KGh0NI/T3p8LKmmXTZcvzOh3ugNV5B1maw8h76xIvP
 9i0hAMQFkOdftLsrZNj2LiAGKeXMHlKfauhMbVG1GCtDaTTtcOQvcpFS1zLQN+NFSoFI
 GrAGJioXyTajO7R3Ari6o1vIvpgZ8cYFeiYwbEa0yE08yrgpXCLZW1xFjHWdwf+Mg0/H
 K2x5RhYNUHap4LfW2ohgVAJVxiYET47WZaoeA2VSCOCbYm6lDVciKT58bAsnH7UvaIao
 gSFPH3uGCEnVLeLxvpo/XVRvaIRpCAtp1C7LG+IxqO67VNdC5kVSJVco0opEQOmwW7+C
 qTww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLbG37LXV1SlDPxjPEe+6dEvX+YA6aSAFAk6EZTOxEsUpIL/ld2aNwBODnnMeiGhwE1I+kV/Ks+ET6ncaIi3TlCHba3tbWGkpCMOoYS9A9
X-Gm-Message-State: AOJu0Yy5Ws3x0ke67AT8GiRrW+vk0hwcOmqvvMki+jxCtb+V/K1WCcqf
 xi1EULIGGHda0Q+BYuqoV2iE8E2bKbCZw7u6ERuDO3a8pQt7wAFbTECwhddlvW/HGCEwBHU636K
 ibm7ABJhtcLhbq3EKoaa9xi95DcgQyQ==
X-Google-Smtp-Source: AGHT+IH3Tp44NrqMDhvMRbQhQ0+Eoa5hP8pm5fmmlYU+SDu3IykCst1EwAebrsLtDb/dcR3chM8jUFPBcOJNtaDvxNA=
X-Received: by 2002:a05:6512:a8a:b0:52f:ccb0:9ea7 with SMTP id
 2adb3069b0e04-530bb3e0ba6mr9551626e87.60.1722975326329; Tue, 06 Aug 2024
 13:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
 <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
In-Reply-To: <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 6 Aug 2024 13:15:14 -0700
Message-ID: <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Sergio Lopez Pascual <slp@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, tzimmermann@suse.de, 
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

On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
> On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <slp@redhat.c=
om> wrote:
>>
>> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
>>
>> > On 7/23/24 14:49, Sergio Lopez wrote:
>> >> There's an incresing number of machines supporting multiple page size=
s
>> >> and on these machines the host and a guest can be running, each one,
>> >> with a different page size.
>> >>
>> >> For what pertains to virtio-gpu, this is not a problem if the page si=
ze
>> >> of the guest happens to be bigger or equal than the host, but will
>> >> potentially lead to failures in memory allocations and/or mappings
>> >> otherwise.
>> >
>> > Please describe concrete problem you're trying to solve. Guest memory
>> > allocation consists of guest pages, I don't see how knowledge of host
>> > page size helps anything in userspace.
>> >
>> > I suspect you want this for host blobs, but then it should be
>> > virtio_gpu_vram_create() that should use max(host_page_sz,
>> > guest_page_size), AFAICT. It's kernel who is responsible for memory
>> > management, userspace can't be trusted for doing that.
>>
>> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creation
>> and mapping into the guest of device-backed memory and shmem regions.
>> The CREATE_BLOB ioctl doesn't update drm_virtgpu_resource_create->size,
>> so the guest kernel (and, as a consequence, the host kernel) can't
>> override the user's request.
>>
>> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the host
>> page size to align the size of the CREATE_BLOB requests as required.
>
>
> gfxstream solves this problem by putting the relevant information in the =
capabilities obtained from the host:
>
> https://android.googlesource.com/platform/hardware/google/gfxstream/+/ref=
s/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691
>
> If you want to be paranoid, you can also validate the ResourceCreateBlob:=
:size is properly host-page aligned when that request reaches the host.
>
> So you can probably solve this problem using current interfaces.  Whether=
 it's cleaner for all context types to use the capabilities, or have all VM=
Ms to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the cost/benefit tradeof=
f.
>

I guess solving it in a context-type specific way is possible.  But I
think it is a relatively universal constraint.  And maybe it makes
sense for virtgpu guest kernel to enforce alignment (at least it can
return an error synchronously) in addition to the host.

BR,
-R

>>
>>
>> Thanks,
>> Sergio.
>>
