Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42EAAE7F6
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 19:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3439010E86F;
	Wed,  7 May 2025 17:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IeuQHlWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A27C10E86F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 17:37:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43d5f10e1aaso4945e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746639434; x=1747244234;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQHhiJb/IfsuDYo0XF1+Y57pCH6WG6CKDTT1nxeWSmE=;
 b=IeuQHlWhcwr7dFRacyIXxB8b2uI10AJbztVfmLq7BPb3J+NXDF66PIu5ZMOKde7Wim
 c8QOrZYLFShDSlTx8Sw6imW8iAMDl8wCcREXj4GWfbyh7JVyElwvKTTenB1U8kaEiRPz
 jJzZMKPokBsguWGupfQHPUNtpLrZ+izGeSIgQ62kBDdISLvWPhMb41n9DV6HE4Dt97pt
 hh1MVLKR73vggKcSgER3tF0tu3katlsYfceRC2weP4pppAQzt56uu7uubWlfX6TcdpAd
 z6leGyoyK5Q6u3S25nrxAbHFfKzyMt8ms2wzFmyOU05EIT66rex7lmeMBkO0JjnLlCu9
 54AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746639434; x=1747244234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQHhiJb/IfsuDYo0XF1+Y57pCH6WG6CKDTT1nxeWSmE=;
 b=pT4RZNLlcc+5mu/tm2GCZUxczQqSm9Y0FlF9Ml7tcXO2HGUBuvqa834HykwwRFqcCW
 Ju1OGbD0h/24OXBYatvqfVz1OASwuwYY60v7Zl5sVujEuxaaH94uUPcVVz5gPcoUiOvr
 Fif7LD8FaWhtgAcmgfzdgCHJ8pLIuJc0JXS2K19yWxNYZCL14FXqPlLfjuq99J2ZHhtO
 /tg96Eq/VEgra3kbClW2tqOgfCWyA3YX/zKtOnUSXdeFI6ZaeC79vlStzb5qh+8twjyK
 ax5gcE0kKcpML9+kLiyT/9U5eqYZkI0jC1tP74STU6zXsQe3/W1899Ari/0X/X7ZlFcb
 9Jeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4GIyytArL7SEF1XqI23AEN81GzhP2168+tgi9fWvLcpwGMO+MXhDWDGQZDXfhYgEk7itcocJSh+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/I6ce7Cup5S7M7rQuWvkydRHYvUF/glh7NVRFAT771LFxlAaM
 K6xTmpP5mzt77xT/sE9mOuLxEkZVS4lLDoCLQ+bcfyumWdiBiK9WrS7PXxRFmNT/hILCwG/lbra
 +ZAl4I4W45J/Oq6EkqzcL/5KoaoRsmXprj6wp
X-Gm-Gg: ASbGncuWBPQK/3sRa1F2yQjMi6/dCTkz7h2YniynViiXlvx0CS6WUrR2Objrjhzy5Ox
 //AC9jnm4wuX5oCRcW7sAYVB7VSXi2dA0kQldcDsAjsPWPUqdhY8bzsH2OcESveXqFeNcGEytfq
 wwSH96JqV0LJxQyLsZ0slMMnHqaovLs4rpBjPWjDpK8aZsFckQNxU=
X-Google-Smtp-Source: AGHT+IGhDsyDC4rx4Jh4KPoVriF6uM/2LMAigWo/dJgJXOk4tdHRjlokfIMBEcSr4ZZiHUTQp//vG2FjpjSJlL89x3c=
X-Received: by 2002:a05:600c:4448:b0:43b:c2cc:5075 with SMTP id
 5b1f17b1804b1-441d4d4b8d4mr1462165e9.5.1746639433809; Wed, 07 May 2025
 10:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250507001036.2278781-1-tjmercier@google.com>
 <20250507001036.2278781-3-tjmercier@google.com>
 <CAADnVQL2i87Q4NEX-4rXDBa_xpTWnh=VY-sMCJzK+nY0qogeqw@mail.gmail.com>
In-Reply-To: <CAADnVQL2i87Q4NEX-4rXDBa_xpTWnh=VY-sMCJzK+nY0qogeqw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 7 May 2025 10:37:01 -0700
X-Gm-Features: ATxdqUGvlgXnJv15CWumpdguGu0hVB25voP1FwyUGSqp8OgHDoPOAE5CsZeJmPA
Message-ID: <CABdmKX15i760AKT3e6BL-mOUgOjNfX7ugYJQmy_J6YD1TeNEfw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/5] bpf: Add dmabuf iterator
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf <bpf@vger.kernel.org>, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 android-mm@google.com, simona@ffwll.ch, 
 Eduard <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Jiri Olsa <jolsa@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>
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

On Wed, May 7, 2025 at 7:14=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, May 6, 2025 at 5:10=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
> >
> > +/**
> > + * get_first_dmabuf - begin iteration through global list of DMA-bufs
> > + *
> > + * Returns the first buffer in the global list of DMA-bufs that's not =
in the
> > + * process of being destroyed. Increments that buffer's reference coun=
t to
> > + * prevent buffer destruction. Callers must release the reference, eit=
her by
> > + * continuing iteration with get_next_dmabuf(), or with dma_buf_put().
> > + *
> > + * Returns NULL If no active buffers are present.
> > + */
>
> kdoc wants to see 'Return:'.
>
> See errors in BPF CI.
>
> And patch 5 shouldn't be using /** for plain comments.

Thanks, I found the CI errors, fixed, and verified with
scripts/kernel-doc. I didn't receive emails about them though, not
sure if I should have.

> pw-bot: cr
