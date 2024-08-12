Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9B094F694
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 20:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CC410E274;
	Mon, 12 Aug 2024 18:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CrbB9Qso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B20510E274
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 18:22:24 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f15790b472so58536871fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723486943; x=1724091743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=coUi0/ohCVhoxzgHSkTjcFNIQKRPd60M4TbuFg/3kwI=;
 b=CrbB9QsoT+LsvE+Z6RmvTwes5fk4zwBTEOM/LtAW3qzrMVyo7Jvd8HB3vCYhkYYcYE
 U1Mt20AAcjBvrQ1dqUEhsk0wHp65QVB81OE+YEkkCp0anB7+jI8dCfqdVJnk8yyJUqvv
 18wuO+cE4QbnQrcN3U8hnYYy1kCKYxXZSKPQLMK8sG9M1U21nfA1JZjU7nD6tiHH8tEC
 sbxmG7A5XlaQ3qTbSn96BwaUN7fdXBF+xJmosoj51W5vvqIwLH6e9cdqS6pdNfBHsdoJ
 1EK8TYVP380AJCpkZRtu4hqeAqIbEchZepDZbPG8QEu0Bajug+NooMkBXpg5gdTCkijq
 FELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723486943; x=1724091743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=coUi0/ohCVhoxzgHSkTjcFNIQKRPd60M4TbuFg/3kwI=;
 b=Aai3nT0Zecs0dN18U0DfThsYWapszW8d4k1Af9uIUJ3CwO92dLCKX/ibEILAJGPtRP
 20dbM5sderoQzJudCx17EuKJfjCEr6FcipuTmKuxXKGYKxFKvYNmqE5ayrZp0QUN/1YS
 calRo0a6SfFTSB1W2CizIjqAeFY3v96q2UN2TleVbg37fw5g4AypurqtK3CSf8ymtDXl
 98XTd2cqkw79JZa64Rx+FjX4AigQw2NKv+lT90+NmRgxr5Zuo81KQkaNK1iyxbhFRYXK
 ysdoe5SHBbENHQe6Ou0CUfHl0xgY6Ddp+F4SlQkEpQJHAAUWbRssYn3+H83SRNDRxxug
 srNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV16ue6K2WbAl9SaqikrSib31NLdmvmULe+7iVr7fNUKU/A4j3uFdIdAdW0/b2CKm4PisDLj0yEcIH2noT9NsBJ9StbLy7Xv73E5P7GwAm3
X-Gm-Message-State: AOJu0YwC72Tzm1uug+V2b9/US5dTcqW7aRRGMzBGq+lM4uZoz1ReyIYE
 ZnAOtK+hfbMJB7IEoSllIEp0vWouRshzeMkzgnjMIzAu4e/e/B2A+PwLE+46l5Slx5MrUtsY/A3
 FIdhQkcsWxhnBXAXqBDFBei5BE64=
X-Google-Smtp-Source: AGHT+IGsw5wOKenJ4/S6cK3uyE7tsHyzF1jzrmqdqVsPGZnCBKOLdTZr3nAw3POmcblOWHUs99+JFc65/My6jbBmV4M=
X-Received: by 2002:a2e:98c3:0:b0:2ef:2eb9:5e55 with SMTP id
 38308e7fff4ca-2f2b7150337mr7651301fa.13.1723486942050; Mon, 12 Aug 2024
 11:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAF6AEGvwrYiN6nMSsRAdc3qq+qQGWEvdW_3+xJh6y2iAyW6rkw@mail.gmail.com>
 <46a5ec89-be9b-4342-820d-019b595fa379@collabora.com>
In-Reply-To: <46a5ec89-be9b-4342-820d-019b595fa379@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Aug 2024 11:22:10 -0700
Message-ID: <CAF6AEGseD2=+vZG=ZfigLhDXt4WJ=XkP=NeT3ERTiiPifpbd+Q@mail.gmail.com>
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

On Thu, Aug 8, 2024 at 4:16=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 8/5/24 19:24, Rob Clark wrote:
> > On Wed, Jul 24, 2024 at 12:00=E2=80=AFPM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 7/23/24 14:49, Sergio Lopez wrote:
> >>> There's an incresing number of machines supporting multiple page size=
s
> >>> and on these machines the host and a guest can be running, each one,
> >>> with a different page size.
> >>>
> >>> For what pertains to virtio-gpu, this is not a problem if the page si=
ze
> >>> of the guest happens to be bigger or equal than the host, but will
> >>> potentially lead to failures in memory allocations and/or mappings
> >>> otherwise.
> >>
> >> Please describe concrete problem you're trying to solve. Guest memory
> >> allocation consists of guest pages, I don't see how knowledge of host
> >> page size helps anything in userspace.
> >>
> >> I suspect you want this for host blobs, but then it should be
> >> virtio_gpu_vram_create() that should use max(host_page_sz,
> >> guest_page_size), AFAICT. It's kernel who is responsible for memory
> >> management, userspace can't be trusted for doing that.
> >
> > fwiw virtgpu native context would require this as well, mesa would
> > need to know the host page size to correctly align GPU VA allocations
> > (which must be a multiple of the host page size).
> >
> > So a-b for adding this and exposing it to userspace.
>
> In general, GPU page size has no connection to the CPU page size. It
> happens that MSM driver uses same page size for both GPU and CPU. Likely
> you could configure a different GPU page size if you wanted. dGPUs would
> often use 64k pages.

The smmu actually supports various different page sizes (4k, 64k,
etc.. I think up to 2g), and will try to map larger contiguous sets of
pages using larger page sizes to reduce TLB pressure.  This
restriction about aligning to host page size is because the kernel
expects allocations and therefore (currently, pre-sparse) gpu mappings
to be a multiple of the host page size.

As far as whether this should be something outside of virtio-gpu, this
does feel a bit specific to how GEM buffer allocations work and how
host blob resources work.  Maybe other subsystems like media end up
with similar constraints for similar reasons, idk.  But it at least
feels like something applicable to all/most virtgpu context types.

BR,
-R
