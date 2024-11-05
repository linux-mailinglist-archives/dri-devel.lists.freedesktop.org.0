Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177519BCFAD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632410E5C6;
	Tue,  5 Nov 2024 14:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2yUACbod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF03F10E5C7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:47:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539e681ba70so22528e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 06:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730818035; x=1731422835;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/cagGAnxZqWV5y2Ato7lEE3OEZ0Tp2aD2OKM7V42p+E=;
 b=2yUACbodFYbuW3NPe4PM0dX5e9XBH+4AZCA0nA6Fih/9LK3JW0zrpbKuJ8e+HnmnN0
 4TllX4LK+iiwebU2Emzpx2zYjyiQRHikzDOZD1SzQ41nHDLAzLXUT97x3kA5Y+vXvaSU
 8U+gef5+pft70alUwtlBHNoeQrXCbTK3zZ7n8diyK9VZy10I4AmdFad8gPwxFz53lMct
 Ii9bErknK33C/5WHALtPal7Vz4C9shfWRQ/jGRQrtYMPfQrJlHBmC7pTRcu03c4Hr8D6
 hu3CW4tWu47RFWTsN4Oq9PnfLOSFY8TDeoDm0vHXsRKptMjq6dbdNH5S9xA06p3yBlKz
 B2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730818035; x=1731422835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cagGAnxZqWV5y2Ato7lEE3OEZ0Tp2aD2OKM7V42p+E=;
 b=xNAcwltyhQWj40xtFNcNS7qd0IXv49VeCKMi4RBd3o+IfPQmNDESLeBHvLqXDYMZsb
 SFnZx5AoKdrKgySfmlsaqUayn8UXLKa0T0+gvC5gM6U0Ua86jdzrCWLxMamyEPSvTPEd
 5k1i1GIg39Drctr4YhqJfrR2k3Tz5gQ10p7m+r0q9hcI9FAWv+DBlgh+Q9HCeHM3GU/N
 qt2NqSm/v8x4Z4rqmFZqKYUT04/t7sycl8TldjE881n8KQ0WPUJPHEA2Rab7Fqhv3Kh1
 9F71TM7vweCbgKXcGbZ4m2jNX2xhqFpW2n72+WeGggIrfnLs0pd1Kr7xxtEyYvY7XOGV
 EKhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0eBXZQB86n/TLkjNqrGwYaqiRhK7Z3tq8zw4JY3jteK6zUljDHxxQKsEeDJWMSQp8Jx0g9T99r04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxGypurkgOWgitmTqXdVtUk1IZn/s+ynkdI3896qiQp0tHYyry
 9Ba3/mnclRcX0J9/rLnBSm6rLgXRZT91Luqo3rQqe7yCtneIwsQpvyBd4/fo/WoXA0xZs44jaId
 PC7Fj5C0Nb+86fm45HNFZm8GBCYSNdnuuUXeb
X-Gm-Gg: ASbGncswNSgl9VXKIce/BjLVemBEmT7FQ4TRmpLVuPNJl7HpN4ASbfsTodf1uTFi0cU
 JyW9ayhuaKE9O12qLLoDULoyLDQmhmLAQAvotnjoJ56e831SzjKaQZIGNys0=
X-Google-Smtp-Source: AGHT+IGCupuoPoa9Be9DIeC1oLOgRsCVHzJMID/6QbIJuejsA52V25UUPkdSQbFWB5lj7opODxhrEwcgb4shAr5+SOU=
X-Received: by 2002:a05:6512:2243:b0:530:ae18:810e with SMTP id
 2adb3069b0e04-53d78c99ab2mr385358e87.5.1730818034320; Tue, 05 Nov 2024
 06:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20241105-panthor-flush-page-fixes-v1-1-829aaf37db93@google.com>
 <Zynr3DIY8u2c7wrB@e110455-lin.cambridge.arm.com>
In-Reply-To: <Zynr3DIY8u2c7wrB@e110455-lin.cambridge.arm.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 5 Nov 2024 15:46:37 +0100
Message-ID: <CAG48ez1YjoQMe-daQ8NSqN46STGw1UWygzU2-qo75FLBDBqaow@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Be stricter about IO mapping flags
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Tue, Nov 5, 2024 at 10:56=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
> On Tue, Nov 05, 2024 at 12:17:13AM +0100, Jann Horn wrote:
> > The current panthor_device_mmap_io() implementation has two issues:
> >
> > 1. For mapping DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET,
> >    panthor_device_mmap_io() bails if VM_WRITE is set, but does not clea=
r
> >    VM_MAYWRITE. That means userspace can use mprotect() to make the map=
ping
> >    writable later on. This is a classic Linux driver gotcha.
> >    I don't think this actually has any impact in practice:
> >    When the GPU is powered, writes to the FLUSH_ID seem to be ignored; =
and
> >    when the GPU is not powered, the dummy_latest_flush page provided by=
 the
> >    driver is deliberately designed to not do any flushes, so the only t=
hing
> >    writing to the dummy_latest_flush could achieve would be to make *mo=
re*
> >    flushes happen.
> >
> > 2. panthor_device_mmap_io() does not block MAP_PRIVATE mappings (which =
are
> >    mappings without the VM_SHARED flag).
> >    MAP_PRIVATE in combination with VM_MAYWRITE indicates that the VMA h=
as
> >    copy-on-write semantics, which for VM_PFNMAP are semi-supported but
> >    fairly cursed.
> >    In particular, in such a mapping, the driver can only install PTEs
> >    during mmap() by calling remap_pfn_range() (because remap_pfn_range(=
)
> >    wants to **store the physical address of the mapped physical memory =
into
> >    the vm_pgoff of the VMA**); installing PTEs later on with a fault
> >    handler (as panthor does) is not supported in private mappings, and =
so
> >    if you try to fault in such a mapping, vmf_insert_pfn_prot() splats =
when
> >    it hits a BUG() check.
> >
> > Fix it by clearing the VM_MAYWRITE flag (userspace writing to the FLUSH=
_ID
> > doesn't make sense) and requiring VM_SHARED (copy-on-write semantics fo=
r
> > the FLUSH_ID don't make sense).
> >
> > Reproducers for both scenarios are in the notes of my patch on the mail=
ing
> > list; I tested that these bugs exist on a Rock 5B machine.
> >
> > Note that I only compile-tested the patch, I haven't tested it; I don't
> > have a working kernel build setup for the test machine yet. Please test=
 it
> > before applying it.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> > First testcase (can write to the FLUSH_ID):
> >
> > ```
> >
>
> There is a missing line here, I guess is something like
>
> #define SYSCHK(x) ({  \

Oops. Yes, sorry, the tool that I stored this comment message in
interpreted all lines starting with "#" as comments... the proper
versions:

First testcase (can write to the FLUSH_ID):

```
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <sys/mman.h>

#define SYSCHK(x) ({          \
  typeof(x) __res =3D (x);      \
  if (__res =3D=3D (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

#define GPU_PATH "/dev/dri/by-path/platform-fb000000.gpu-card"
#define DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET (1ull << 56)

int main(void) {
  int fd =3D SYSCHK(open(GPU_PATH, O_RDWR));

  // sanity-check that PROT_WRITE+MAP_SHARED fails
  void *mmap_write_res =3D mmap(NULL, 0x1000, PROT_READ|PROT_WRITE,
      MAP_SHARED, fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET);
  if (mmap_write_res =3D=3D MAP_FAILED) {
    perror("mmap() with PROT_WRITE+MAP_SHARED failed as expected");
  } else {
    errx(1, "mmap() with PROT_WRITE+MAP_SHARED worked???");
  }

  // make a PROT_READ+MAP_SHARED mapping, and upgrade it to writable
  void *mmio_page =3D SYSCHK(mmap(NULL, 0x1000, PROT_READ, MAP_SHARED,
      fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET));
  SYSCHK(mprotect(mmio_page, 0x1000, PROT_READ|PROT_WRITE));

  volatile uint32_t *flush_counter =3D (volatile uint32_t*)mmio_page;

  uint32_t last_old =3D -1;
  while (1) {
    uint32_t old_val =3D *flush_counter;
    *flush_counter =3D 1111;
    uint32_t new_val =3D *flush_counter;
    if (old_val !=3D last_old)
      printf("flush counter: old=3D%u, new=3D%u\n", old_val, new_val);
    last_old =3D old_val;
  }
}
```

Second testcase (triggers BUG() splat):
```
#include <err.h>
#include <fcntl.h>
#include <stddef.h>
#include <sys/mman.h>

#define SYSCHK(x) ({          \
  typeof(x) __res =3D (x);      \
  if (__res =3D=3D (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

#define GPU_PATH "/dev/dri/by-path/platform-fb000000.gpu-card"
#define DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET (1ull << 56)

int main(void) {
  int fd =3D SYSCHK(open(GPU_PATH, O_RDWR));

  // make a PROT_READ+**MAP_PRIVATE** mapping
  void *ptr =3D SYSCHK(mmap(NULL, 0x1000, PROT_READ, MAP_PRIVATE,
      fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET));

  // trigger a read fault
  *(volatile char *)ptr;
}
```
