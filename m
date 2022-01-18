Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C1492DEB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 19:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E8010E185;
	Tue, 18 Jan 2022 18:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FB710E185
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 18:54:53 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id m6so58860962ybc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 10:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QuweckTQS4ipVDvmzbXJd32fRhDvTN+WDj7gwwJ5UoU=;
 b=jQFQQg8xNBNZ796rZm7JSGtcgk/RVRlUMQOrW3OprZAwIy/2ezKxTUPzerHa5MEWoA
 +kfQjBOqWihjoI8v514cV21UvUHS5JntgpKuZ/16liMkZGbbSOZYF4w1r6JCuqamghHv
 vowP4DYmSxtE//fgZqRAITszSqg91cqu9Gg64FsXe9W1savFkk2plmXtLm5fBBA0jF0b
 oImfjSzLxxePgVhSUZSsFU9ZJ84ZiyGtkbd0T7VyhnxMEoyDyxlSw/pOQe3BAymEfuQ2
 L/UK5sx9cvQq7XnTqbleIw48nFYsStzQLbt2Y29R65fkhq5UTeKah55mvbCMv7n+zmyV
 rtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QuweckTQS4ipVDvmzbXJd32fRhDvTN+WDj7gwwJ5UoU=;
 b=rTkTqiyAbBEBF5e1+34/wQAPMRZGcU4smY5EH2dKcQ8ok/3eVi9f03eON4mWuspqUt
 Eeig0y40mdPrFHQ3VlAbh522klfS4wtZiqvK+z7wZJb9Zme24j2beD8wFf8mTem6qvG3
 gLAVNySV5v9GKOVbwrf8mMY7nebVwfHLTTUhUqadLFvPrdBeoLRUyjH9TsArz23oZLRB
 ak1jEAB216iL53DN3qHIPyfnoGH2e6saORuZI2sY/Q3H+Pf9119l1+cXSsjWQEF5lVOe
 ZD9nLtcQjh9ZjNf7dQs4IdtvOjQq7mzARRTzsrLGI+FwYi+BgDz4IYUQFcd4/Wy9yMsE
 QpEw==
X-Gm-Message-State: AOAM5334HC4BLBkSrShz9r9Y56Zlh78Aw/HZpANBcbGg08taBXldmn/U
 5B2U22/fzVh8E6oZ5N8wbfb16eUuInXN5Rkiou/k5g==
X-Google-Smtp-Source: ABdhPJwmF0diEuNSgYDq6VwVG2sEv2wSXB4R4GhA8CrKDHbQBq+Cp6d2D+RYzxyanPD1WMMgcwbQ0BJ4awu2dbq2mt8=
X-Received: by 2002:a25:388a:: with SMTP id
 f132mr35653202yba.102.1642532092017; 
 Tue, 18 Jan 2022 10:54:52 -0800 (PST)
MIME-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com>
 <20220115010622.3185921-5-hridya@google.com>
 <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
In-Reply-To: <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Tue, 18 Jan 2022 10:54:16 -0800
Message-ID: <CA+wgaPMjCfjQS4LA8hmVwAaGfXZhoJvvTUnOGt3duOhFb3orTw@mail.gmail.com>
Subject: Re: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF to
 a cgroup.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Kees Cook <keescook@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>, Kenny.Ho@amd.com,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Matthew Auld <matthew.auld@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Laura Abbott <labbott@redhat.com>,
 Marco Ballesio <balejs@google.com>, Jason Ekstrand <jason@jlekstrand.net>,
 linux-media@vger.kernel.org, Li Li <dualli@google.com>,
 Todd Kjos <tkjos@android.com>, Arnd Bergmann <arnd@arndb.de>,
 Vlastimil Babka <vbabka@suse.cz>, Vipin Sharma <vipinsh@google.com>,
 Nathan Chancellor <nathan@kernel.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, tjmercier@google.com,
 Christian Brauner <christian@brauner.io>, linaro-mm-sig@lists.linaro.org,
 Hang Lu <hangl@codeaurora.org>, daniels@collabora.com,
 Chris Down <chris@chrisdown.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 16, 2022 at 11:46 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.01.22 um 02:06 schrieb Hridya Valsaraju:
> > The optional exporter op provides a way for processes to transfer
> > charge of a buffer to a different process. This is essential for the
> > cases where a central allocator process does allocations for various
> > subsystems, hands over the fd to the client who
> > requested the memory and drops all references to the allocated memory.
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > ---
> >   include/linux/dma-buf.h | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 7ab50076e7a6..d5e52f81cc6f 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -13,6 +13,7 @@
> >   #ifndef __DMA_BUF_H__
> >   #define __DMA_BUF_H__
> >
> > +#include <linux/cgroup_gpu.h>
> >   #include <linux/dma-buf-map.h>
> >   #include <linux/file.h>
> >   #include <linux/err.h>
> > @@ -285,6 +286,23 @@ struct dma_buf_ops {
> >
> >       int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> >       void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > +
> > +     /**
> > +      * @charge_to_cgroup:
> > +      *
> > +      * This is called by an exporter to charge a buffer to the specif=
ied
> > +      * cgroup.
>
> Well that sentence makes absolutely no sense at all.
>
> The dma_buf_ops are supposed to be called by the DMA-buf subsystem on
> behalves of the importer and never by the exporter itself.
>
> I hope that this is just a documentation mixup.

Thank you for taking a look Christian!

Yes, that was poor wording, sorry about that. It should instead say
that the op would be called by the process the buffer is currently
charged to in order to transfer the buffer's charge to a different
cgroup. This is helpful in the case where a process acts as an
allocator for multiple client processes and we would like the
allocated buffers to be charged to the clients who requested their
allocation(instead of the allocating process as is the default
behavior). In Android, the graphics allocator HAL process[1] does
most of the graphics allocations on behalf of various clients. After
allocation, the HAL process passes the fd to the client over binder
IPC and the binder driver invokes the charge_to_cgroup() DMA-BUF op to
uncharge the buffer from the HAL process and charge it to the client
process instead.

[1]: https://source.android.com/devices/graphics/arch-bq-gralloc

Regards,
Hridya


>
> Regards,
> Christian.
>
> >   The caller must hold a reference to @gpucg obtained via
> > +      * gpucg_get(). The DMA-BUF will be uncharged from the cgroup it =
is
> > +      * currently charged to before being charged to @gpucg. The calle=
r must
> > +      * belong to the cgroup the buffer is currently charged to.
> > +      *
> > +      * This callback is optional.
> > +      *
> > +      * Returns:
> > +      *
> > +      * 0 on success or negative error code on failure.
> > +      */
> > +     int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *gpu=
cg);
> >   };
> >
> >   /**
>
