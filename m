Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E59A90E63
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 00:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E9F10E9D8;
	Wed, 16 Apr 2025 22:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vQVw8gfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C3410E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 22:02:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F9E55C561E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 22:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91876C4CEF5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744840959;
 bh=pEWNCN4ZX0qZhZ3W3spaJM2B3e1c6C6EMR/RLHg+n0Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vQVw8gfhLmq41PEpDf+Q7IZasp8I0ezszztme0m2nyMwSrwmGiOpTfjcJno7WFCSP
 ludJQwFLaJ4mhVZW/r3hr/3LqCmU/MbA8enWGWm0GL6AvPWtI6p/EvecpXrxmAPEwg
 VRfxGaNiqL9fv1RnLj35RKE/eKf9p3EK6xr0H3ig8zgkMGSEfgEChvAkIHdja/txaQ
 6vwyNe+6US6vqHLHII4v8QZHtTmVvaxJ4Tt8VMgzKD5Uo6T6cCDYnPZib8KUhyp2AH
 XMzn1d6oaHYcCGCemtinLafjQs+NPu0aVbehMJxABNLxxi4ezUUbGqBxWNEifd37Kw
 pXsI6xtPiHaSA==
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4775ccf3e56so12725981cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 15:02:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPRX3SbBb7dIY2juZvOabqID8qXUTpBxYAdEBG/uLdeNgNqksM1PO193FgetjSKuqH/YegHMzdfJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5VBHWCHqOMTdyPvZ9bx+nNmnE+wgnLsjunc3mSoxpGhb+6o4y
 Ss62lLifdHms4micByF5GEqfF7E/5VVQd4MewNckDNVFl4aAaCjLmNLUJCTJoJLPfOszJkMyf/9
 i9kjFymKBCQ/3yOMpaWs0/B57k8I=
X-Google-Smtp-Source: AGHT+IH2FW3F7i+zlhWoFLsnu5ZjPE99AtfOVpaO0+OP0tveE8dajNhBdza9/ZM6TT0O9R83dKaY9ZEW3XMZcAC8g6E=
X-Received: by 2002:a05:622a:5147:b0:475:19cc:a81a with SMTP id
 d75a77b69052e-47adf238197mr10613471cf.21.1744840958640; Wed, 16 Apr 2025
 15:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
In-Reply-To: <20250414225227.3642618-3-tjmercier@google.com>
From: Song Liu <song@kernel.org>
Date: Wed, 16 Apr 2025 15:02:27 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
X-Gm-Features: ATxdqUG8pASefvj0hrBbKUPzLq8VtsN3bPrVvtjdcRijfVngZmMaVn9SzVG5PSo
Message-ID: <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com
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

On Mon, Apr 14, 2025 at 3:53=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
[...]
> +
> +BTF_ID_LIST_GLOBAL_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
> +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_buf =
*dmabuf)
> +
> +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> +{
> +       struct dma_buf *dmabuf, *ret =3D NULL;
> +
> +       if (*pos) {
> +               *pos =3D 0;
> +               return NULL;
> +       }
> +       /* Look for the first buffer we can obtain a reference to.
> +        * The list mutex does not protect a dmabuf's refcount, so it can=
 be
> +        * zeroed while we are iterating. Therefore we cannot call get_dm=
a_buf()
> +        * since the caller of this program may not already own a referen=
ce to
> +        * the buffer.
> +        */
> +       mutex_lock(&dmabuf_debugfs_list_mutex);
> +       list_for_each_entry(dmabuf, &dmabuf_debugfs_list, list_node) {
> +               if (file_ref_get(&dmabuf->file->f_ref)) {
> +                       ret =3D dmabuf;
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&dmabuf_debugfs_list_mutex);

IIUC, the iterator simply traverses elements in a linked list. I feel it is
an overkill to implement a new BPF iterator for it. Maybe we simply
use debugging tools like crash or drgn for this? The access with
these tools will not be protected by the mutex. But from my personal
experience, this is not a big issue for user space debugging tools.

Thanks,
Song


> +
> +       return ret;
> +}
