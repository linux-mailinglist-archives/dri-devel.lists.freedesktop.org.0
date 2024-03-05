Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5387277A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 20:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565E810E588;
	Tue,  5 Mar 2024 19:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oAKG/Q1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86C10E588
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 19:22:31 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a45a15f2bafso137789066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 11:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709666549; x=1710271349;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zz04MsiLPf1EieQ9O8SZKHnfGRYziipBu1MQvsGASi0=;
 b=oAKG/Q1E/N33Br7Llber2gsdVoHIe2YiP3CYWV7I9D+o1jek7Ameo6wS59zxg6FrYP
 yh5ntAPkOwM44NOdz0L1aDX31fsSNjQfhwM/58wPh0tH46HAZS2Jq2JOjwdX+l0hUHj9
 zeurXEhtPE+KSV8peoWfZi4rrUA8ZvfdtD0A07YLLjY6QgydZZqFGvXEkLkyGmlWDPe3
 PT35C/nPvqlDUJP74oKfyv10+KthYBhFFQqKlZsM88T/KoOpFAuzbFUfnVW+8++2f70P
 OHydvbBirPAjQDuwbsIP3z8/6OnYhIkPg2twTWNwDrNoSDnHEPlqOjng/117TRvqurqy
 Ti2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709666549; x=1710271349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz04MsiLPf1EieQ9O8SZKHnfGRYziipBu1MQvsGASi0=;
 b=VGLDlALoD8CZlMbwgr+Ciq7C7/QDj1ixaLiakvIaSym1vECtFjDZYT1vBhcIfKOIZL
 3fQb7VTos+4kMkTAGblcv+lSAEg8mrdERpHK1Rv2STOfOmWLi+R8j9RAbJFY/nr2QDlU
 VQz59Iu3i3k4rloW8Ys51HebryaxjLEmz8imo1DvcikLY8Y7ZnMClbX+A934q/98PP7m
 j7/lwMrqOjtdK8wu18z/JEPzv1rSpkCtauwm/CZGQ/31WvySHILVntM8CzLQSUdk78Nk
 OAE5XHIvvMmca/UcXmNMj62Sfc/q6pdQavfCb7npj34kG+nIsgb4OPcW8N6zeLHotIQp
 uDnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVONAODPrh2Pzd4WqyZxZax8SYwvaLU2lyM2Ob4t/bvPhg9iTojZGA9T2uDAowaT+DfU2JAnfk2rZZeL2AHqzZ1t+R7zdd6Jxx9T15J84kk
X-Gm-Message-State: AOJu0Yx4XfHSd23Ysi+8xH93V5rGPlURSLYS4wOPXQiojqrdy+sonycy
 KD5HyMb8frjNG7Y4x8t7AFrRUUwixIR2gnBLV7yGQbFJZDFdw21T2UqlMOkQIOLUd0sSJVMMf93
 v1+egKB+zZ5xDsnadQJYMHDBqF4mPqpDN+0Fh
X-Google-Smtp-Source: AGHT+IGfm5Q9d1QQtEV+FHngrLRB7RaEIdB98iS7LcjxrbCUYiUnZIxAhZ7sX2WiKXZhI6ep9u27+39/LAWZPVIzVjw=
X-Received: by 2002:a17:906:1cd5:b0:a44:15c3:c8e9 with SMTP id
 i21-20020a1709061cd500b00a4415c3c8e9mr10269704ejh.28.1709666549065; Tue, 05
 Mar 2024 11:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-13-almasrymina@google.com>
 <a2d926be-695a-484b-b2b5-098da47e372e@app.fastmail.com>
In-Reply-To: <a2d926be-695a-484b-b2b5-098da47e372e@app.fastmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 5 Mar 2024 11:22:15 -0800
Message-ID: <CAHS8izPbBHz=rr65ZtCy-+OGPbXXaY66_5EFSXw2bbhfGweRWg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 12/15] tcp: RX path for devmem TCP
To: Arnd Bergmann <arnd@arndb.de>
Cc: Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 Linux-Arch <linux-arch@vger.kernel.org>, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, shuah <shuah@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
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

On Tue, Mar 5, 2024 at 12:42=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Mar 5, 2024, at 03:01, Mina Almasry wrote:
> > --- a/arch/alpha/include/uapi/asm/socket.h
> > +++ b/arch/alpha/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD         77
> > +#define SO_DEVMEM_LINEAR     79
> > +#define SO_DEVMEM_DMABUF     80
> > --- a/arch/mips/include/uapi/asm/socket.h
> > +++ b/arch/mips/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD         77
> > +#define SO_DEVMEM_LINEAR     79
> > +#define SO_DEVMEM_DMABUF     80
> > --- a/arch/parisc/include/uapi/asm/socket.h
> > +++ b/arch/parisc/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD         0x404B
> > +#define SO_DEVMEM_LINEAR     98
> > +#define SO_DEVMEM_DMABUF     99
> > --- a/arch/sparc/include/uapi/asm/socket.h
> > +++ b/arch/sparc/include/uapi/asm/socket.h
> >  #define SO_PEERPIDFD             0x0056
> > +#define SO_DEVMEM_LINEAR         0x0058
> > +#define SO_DEVMEM_DMABUF         0x0059
> > --- a/include/uapi/asm-generic/socket.h
> > +++ b/include/uapi/asm-generic/socket.h
> > @@ -135,6 +135,11 @@
> >  #define SO_PEERPIDFD         77
> > +#define SO_DEVMEM_LINEAR     98
> > +#define SO_DEVMEM_DMABUF     99
>
> These look inconsistent. I can see how you picked the
> alpha and mips numbers, but how did you come up with
> the generic and parisc ones? Can you follow the existing
> scheme instead?
>

Sorry, yes, this is a bit weird. I'll change this to use the next
available entry rather than leave a gap.

> > diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
> > index 059b1a9147f4..ad92e37699da 100644
> > --- a/include/uapi/linux/uio.h
> > +++ b/include/uapi/linux/uio.h
> > @@ -20,6 +20,16 @@ struct iovec
> >       __kernel_size_t iov_len; /* Must be size_t (1003.1g) */
> >  };
> >
> > +struct dmabuf_cmsg {
> > +     __u64 frag_offset;      /* offset into the dmabuf where the frag =
starts.
> > +                              */
> > +     __u32 frag_size;        /* size of the frag. */
> > +     __u32 frag_token;       /* token representing this frag for
> > +                              * DEVMEM_DONTNEED.
> > +                              */
> > +     __u32  dmabuf_id;       /* dmabuf id this frag belongs to. */
> > +};
>
> This structure requires a special compat handler to run
> x86-32 binaries on x86-64 because of the different alignment
> requirements. Any uapi-visible structures should be defined
> to avoid this and just have no holes in them. Maybe extend
> one of the __u32 members to __u64 or add another 32-bit padding field?
>

Honestly the 32-bit fields as-is are somewhat comically large. I don't
think extending the __u32 -> __u64 is preferred because I don't see us
needing that much, so maybe I can add another 32-bit padding field.
Does this look good to you?

struct dmabuf_cmsg {
  __u64 frag_offset;
  __u32 frag_size;
  __u32 frag_token;
  __u32 dmabuf_id;
  __u32 ext; /* reserved for future flags */
};

Another option is to actually compress frag_token & dmabuf_id to be
32-bit combined size if that addresses your concern. I prefer that
less in case they end up being too small for future use cases.

--=20
Thanks,
Mina
