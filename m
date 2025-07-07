Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBFCAFB4B2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AC610E46F;
	Mon,  7 Jul 2025 13:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IZyof4/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CD410E46F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 13:35:21 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so4299210a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751895320; x=1752500120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iglN2fDJo6Jj8oOAA17PlpCWLQPcfqHRK3QqDqJauNc=;
 b=IZyof4/YeM8y21zr0uJFhS6mwhIQCjh/HJGnPjuITsO3VK/0RWir+MZCK0SdvoTkbu
 ANPX768nJjnlj+EHQ4gXx1xLLI7cUJMbpJCKomryi5Vo72OKgvz7qATyzrFDwiAz+Gva
 8cVbKDoU2VkWEyjYcsxZnMICshWlaMQACbybj8sitCRomC/wc6j1pxjlNNE0IVqm0ELO
 o4e0vQdZhTlvKf4MqFnm8wjuNmutavl+cCOkOm8eWQbSMF0HvwYhFZl9Nk1MdMPDHn1F
 ibUMfr7/LlSyLaiJIQzHYd3VGmZ3odl9XNwk7WOW/YwIsF4m7Np6tpbkHKM/+l7zmZQP
 9N9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751895320; x=1752500120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iglN2fDJo6Jj8oOAA17PlpCWLQPcfqHRK3QqDqJauNc=;
 b=sG5RmHucHcDig8D0BcuysMkXjXWA7BNy08aLRRUoF7JZPNHzZatPU1qiCs0u1i42Ye
 b+vrlvNW3d5DnE9kcCOCJUg0D5g9nceWP5KMuyfj4qqX8o4w9gGzwVRBlfrX8NRwnD4h
 rUO+qSj7hCHr2oraBns8ehrTM01socDAm8p4gePrUsZb1heUzOeb2p4nGUnadxFK/AwQ
 mGAKJqrZHuo0OME5kCvIXKqOzvgQDeah16TtWAHtK7B9PupmHgSg6Kus6Z7iuTBdt6qs
 nCGtA6aZIK8gf0tBk8Nz5g3Gtb4vpYTR0nHfct7KIZl5Jf2m3cCqUs2tNNUZ1t/CjqpR
 XCbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwNN55dRMjn21e/hmquOq8QeyEsjW/qREHZILEjSnRFHxhszZh+ZVmhdK3tjPgFb4cZHVjuugYWmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSiGPbe6qnkXLcjS3EEfIdmN2tq7MRh4lZGkkxFKCHscT9rs7i
 ZM7D/YyzZhCOwgV8vDRQrr3XJZL87iTKn2p3YeqAKjuPbD8Vk+AUaCM8miD8eNGNs+s2fKAafdX
 cr0SDfKd1aIwEUzjVvpXVFOgMAlEKNybUbgmNColXdQ==
X-Gm-Gg: ASbGncvnHwAlop18FSa0tMUb14FnhLjevhQAKwuhuep1xK9PwE5VorDkeCnH7dzGHKg
 kvrQjDfZ0QGN6dZ1fH6BdX9LYeGWeX1YRpgZua8Wa7xAlAMAyWylCQQtgVBGlrafVxLxFWS/IkR
 AnEEWBQL0EBy2u7S1u1AJRt8o+X91G8snQ+YLRcRBqt4qfKE9MV7xHMOXcv1pXNVcRO4bzsa3Vw
 dunBYIKSgfRew==
X-Google-Smtp-Source: AGHT+IET++QyEw80P77BIRzs6JWa9kHBMfwtkMIUTg5pCT3exqjnCE5AHFUJIOdI1A973C72FUTiNPTJJ/5qE+IOutw=
X-Received: by 2002:a50:eb0c:0:b0:607:32e8:652 with SMTP id
 4fb4d7f45d1cf-60ff3c0d6e8mr6977121a12.19.1751895320263; Mon, 07 Jul 2025
 06:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131231.1724627-1-jkangas@redhat.com>
 <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
In-Reply-To: <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 7 Jul 2025 19:05:09 +0530
X-Gm-Features: Ac12FXyRxHcDe4-WqyYgc42A2U_9x5Uy_U3EHMTjmhyPcBLa1jvXKcYwtoIgS80
Message-ID: <CAO_48GHtUG_hTFvLVQfG06FxdO_6z5m0WofXKh=WhgCjNguxPg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
To: Jared Kangas <jkangas@redhat.com>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, christian.koenig@amd.com, mripard@kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

Hello Jared,

On Mon, 7 Jul 2025 at 18:40, Jared Kangas <jkangas@redhat.com> wrote:
>
> On Tue, Jun 10, 2025 at 06:12:28AM -0700, Jared Kangas wrote:
> > Hi all,
> >
> > This patch series is based on a previous discussion around CMA heap
> > naming. [1] The heap's name depends on the device name, which is
> > generally "reserved", "linux,cma", or "default-pool", but could be any
> > arbitrary name given to the default CMA area in the devicetree. For a
> > consistent userspace interface, the series introduces a constant name
> > for the CMA heap, and for backwards compatibility, an additional Kconfi=
g
> > that controls the creation of a legacy-named heap with the same CMA
> > backing.
> >
> > The ideas to handle backwards compatibility in [1] are to either use a
> > symlink or add a heap node with a duplicate minor. However, I assume
> > that we don't want to create symlinks in /dev from module initcalls, an=
d
> > attempting to duplicate minors would cause device_create() to fail.
> > Because of these drawbacks, after brainstorming with Maxime Ripard, I
> > went with creating a new node in devtmpfs with its own minor. This
> > admittedly makes it a little unclear that the old and new nodes are
> > backed by the same heap when both are present. The only approach that I
> > think would provide total clarity on this in userspace is symlinking,
> > which seemed like a fairly involved solution for devtmpfs, but if I'm
> > wrong on this, please let me know.
> >
> > Changelog:
> >
> > v4:
> >   - Fix ERR_PTR() usage for negative return value.
> >
> > v3:
> >   - Extract documentation markup fix to separate patch.
> >   - Adjust DEFAULT_CMA_NAME per discussion in [2].
> >   - Warn if the legacy heap name and the default heap name are the same=
.
> >   - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
> >   - Touch up commit log wording.
> >
> > v2:
> >   - Use tabs instead of spaces for large vertical alignment.
> >
> > [1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@t=
i.com/
> > [2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=3Dc71kzFFaWK-fF5rCdn=
r9P5h1sgPOWSGSw@mail.gmail.com/
> >
> > Jared Kangas (3):
> >   Documentation: dma-buf: heaps: Fix code markup
> >   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
> >   dma-buf: heaps: Give default CMA heap a fixed name
> >
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
> >  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
> >  3 files changed, 46 insertions(+), 11 deletions(-)
> >
> > --
> > 2.49.0
> >
>
> Hi Sumit,
>
> Just wanted to check in on this since discussion has died down this
> iteration: what's the status on this series? If there's anything I can
> do to help, I'm happy to lend a hand.

I'm sorry, I had to be out for a bit due to some personal reasons;
overall it looks good to me. I'll apply it very soon.

Thank you for your patience!

>
> Thanks,
> Jared
Best,
Sumit.
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed
