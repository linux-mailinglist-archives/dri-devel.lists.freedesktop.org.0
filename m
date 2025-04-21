Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26620A959D1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 01:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A4A10E086;
	Mon, 21 Apr 2025 23:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="feO49IwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0CD10E086
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 23:39:12 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso2575840f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745278751; x=1745883551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOyh0KRZOP78elpx9kgGmLRnKlT+oLZaZTHETWW34WA=;
 b=feO49IwRoUGmsDiz9l6M0/YGT/MWnucjtVg+VtnRX6MCBjm34vZn5sGf/HjYLZDx/d
 sugLXinFGuvBsrzfA5JDHBdLq4ZG0/qe8qbk0Iz/q5b49TpNleamg30bpINmcwp46C5C
 kxOnloG5JeOIACiLBSpOTtCyDrAIAIaz4lrTdH/cMlm92R3e/b9Dp6UOZuQ4JRfykOve
 /mcRJnEdBWQ3ubm8/5nZcg7MD8MSEwHTasyq1juVU8MJVPycRJKwvSuBisiL+Jqk0L7n
 V6onmwZhliLszWrF2W+GFuZ6ReBPbkMbzFPLadeFyx4cLe4STmSjnzfo6bKI1EpWes9z
 lafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745278751; x=1745883551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOyh0KRZOP78elpx9kgGmLRnKlT+oLZaZTHETWW34WA=;
 b=UAi6+haNErr6hfaqjZqPjGs4thHXR9jddqv2hy4FmMHsy9cfg2VxcJzgb4s36mjklL
 qVusRFMiFIj/KovIGtWK3dr+9Ln0X7csXWKjZyUlE1v6HGtCX23Xc/Bs32c3jHsmD0oF
 Xl+rHbqAIDWSOxwq/oGIoYZttZTbF6B7kZyHAOZ8M3FvpyTVF35aitLWsonXi1wEEaRi
 oicPuYEuy2PlJ5PNd6R7/XanEpHpqxjEpBKOj6Mr1SNc4NeHn7duHZCbwZO7jhUTselv
 B8NlOCvu1X0/LOsakkib6fRQs0ykmge8QZ9WwjWh+ztDjlVlPNjq5egfBSUH4lH08MEi
 ml3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUQBFOWFzIJoDNojy7nU/uICnj7czicYY7PoHxUviFToRvlAmZQmoxP6YdFGyUbEtScG+B+TTv0/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztt7D0XRGseoib42d9A9VmXqd6GUhAyd3ztuxe2oUVWRaoLxZ6
 U3zBkDSJ9RKfhwDZc+lqCxNlBKkEu6SRW/xul6U5Y0lmPdSvkhRFwswo4E0GkU8QCO5kHRXIG3a
 i9Lx4zvLo1WKgKucClq4amCuR3A4=
X-Gm-Gg: ASbGncudaULpQzuvgGV9AWdUaM7LzMtPFNlL8XZ6p62Sr8hmGPAw6CuL5SwBhqOewQK
 Ld/wpaMtCRJ8D46vUU+itrPkPUcyADeEocKXnNYblSLy+lcfv+aj9CH2wHdWPwUezMEWw
X-Google-Smtp-Source: AGHT+IH0SrvREf3muergkKdQkak0YZ+ohqfk7d6fakRaBVQUXizurH1NfGeAwSFOPUHkhRWTHwrrpnJQpvzHziO1Ss0=
X-Received: by 2002:a05:6000:2510:b0:39c:30f9:339c with SMTP id
 ffacd0b85a97d-39efba5a84dmr10142882f8f.28.1745278750922; Mon, 21 Apr 2025
 16:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW54g5YCmLVX=cc3m2nfQTZrMH+6ZMBgouEMMfqcccOtww@mail.gmail.com>
 <CABdmKX1OqLLsY5+LSMU-c=DDUxTFaivNcyXG3ntD8D0ty1Pwig@mail.gmail.com>
In-Reply-To: <CABdmKX1OqLLsY5+LSMU-c=DDUxTFaivNcyXG3ntD8D0ty1Pwig@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 21 Apr 2025 16:38:59 -0700
X-Gm-Features: ATxdqUEjOlk2AFAGVhVlgaGgehsi4nkoJpm1iJUvAg9lN7-7SyoelglTBprP5Ug
Message-ID: <CAADnVQ+0PXgm_VuSJDKwr9iomxFLuG-=Chi2Ya3k0YPnKaex_w@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Song Liu <song@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 android-mm@google.com, simona@ffwll.ch, 
 Jonathan Corbet <corbet@lwn.net>, Eduard <eddyz87@gmail.com>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>
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

On Mon, Apr 21, 2025 at 1:40=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> > > new file mode 100644
> > > index 000000000000..b4b8be1d6aa4
> > > --- /dev/null
> > > +++ b/kernel/bpf/dmabuf_iter.c
> >
> > Maybe we should add this file to drivers/dma-buf. I would like to
> > hear other folks thoughts on this.
>
> This is fine with me, and would save us the extra
> CONFIG_DMA_SHARED_BUFFER check that's currently needed in
> kernel/bpf/Makefile but would require checking CONFIG_BPF instead.
> Sumit / Christian any objections to moving the dmabuf bpf iterator
> implementation into drivers/dma-buf?

The driver directory would need to 'depends on BPF_SYSCALL'.
Are you sure you want this?
imo kernel/bpf/ is fine for this.

You also probably want
.feature                =3D BPF_ITER_RESCHED
in bpf_dmabuf_reg_info.

Also have you considered open coded iterator for dmabufs?
Would it help with the interface to user space?
