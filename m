Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E888CE21
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818FF10F293;
	Tue, 26 Mar 2024 20:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FDYWzNtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D4610F289
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:19:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56be32b9775so5864447a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711484373; x=1712089173;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/HolUtBGOSvO7vytyqHWVK1okzyRfH/uWmvtvWb27FA=;
 b=FDYWzNtjwuSGrA1SGtDv3JXYSrJqtZH7dJJNlD5Ugx9Rk1cEt322Fy62HANfcIPgqO
 yB+IS2Omhwp1ZhEKN90tbvqJT3Lce/i4lUyrl+iu4f+TU45ebOaeFFratKRez/GWC+ZU
 GfB5vjZC/6LWQdg5Gy+MI44/kCTamUh8eChKlCo5XyPdCMXuuphAmarU6TsiDYt9E2ar
 mPzWAJ8pq1dV0ApfVWyij6i/j70uRNCtd+RxVlcQdVNXG5ldB1+XR1p0DYkY5juAYli2
 KSjLLNwUwz/USypSUYdz+JGAlZ1KDSPcVm88Dol0MCf3XN+vE0brqwAVnvT3mjPIR6Sv
 fTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484373; x=1712089173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/HolUtBGOSvO7vytyqHWVK1okzyRfH/uWmvtvWb27FA=;
 b=rDQ476N2/7E5QSl7CdroGpxOVjhhBNm9qQ5Oa+585eqWSREfJa+3FCCsDG3PZr5hS1
 nb3V6fkXyrjauQ6fxcNuNbywI/hjE4PrO7I1sKmcprthnRCEMXIYzVsbx9UyQkCPleQJ
 zoXnVj36F2VzzqdXvQYGJUnm0r1Oc9RZ5TT/0pUYhtrx8+XHuJab+yUr6Nw+jmhZRqy+
 bY/z7Brc9orK+NApDXn1U9bnm6wWjYl0f7CnJKuTtrblmbd839uP5kiM7uLugqrvOH8n
 LJu6VerZrMlTALWv/N23oaYrs0hkY2r4YgBUJosWf4cJeE03tvCnI5bCU5whCoZ/o1LV
 5Suw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGCvLykwCOiVDILdH389LBQVl01r1ZsSU2lMBFeHKzykdIcCy59TPt5ZpIO4KRSJNkbXATMO+p7jLjm+LYUY6JmyFz6OdtQLB1zVdblUKs
X-Gm-Message-State: AOJu0YwCu7G4x6qKqBLUycSOwqjFZm5jQSF1gCCRUgfgvD46M9nbHZE1
 8OHZpIQquOyMI3AaCi3w+b15dhBP3+bEsNhnb/k0XjKMVNVg0ZxnO5IQ7Ld2X/iSfuRxU42t+A9
 fudFvulZzrOnHnzsQlDW9I22oM2T/Le7avUEA
X-Google-Smtp-Source: AGHT+IFjAY/eoFDY4BwdVzDOePbePtoPltk1wuczOVWu/9VSVvPKPc9DWk1TgGZAdfUjGFfCBB9+wtsJgpHCZYEgPKU=
X-Received: by 2002:a17:906:2dc9:b0:a46:70d1:dda6 with SMTP id
 h9-20020a1709062dc900b00a4670d1dda6mr1426517eji.28.1711484372999; Tue, 26 Mar
 2024 13:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <ZfegzB341oNc_Ocz@infradead.org>
 <CAHS8izOUi6qGp=LSQb_o5oph-EnhNOuhLkPSfbQRU3eniZvbdA@mail.gmail.com>
 <ZgC5JoSiWAYf3IgX@infradead.org>
In-Reply-To: <ZgC5JoSiWAYf3IgX@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 26 Mar 2024 13:19:20 -0700
Message-ID: <CAHS8izO5-giYhM1bVCLLOXRXq-Xd0=pi0kPq5E1-R=3i=XihmQ@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>, shakeel.butt@linux.dev
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>
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

On Sun, Mar 24, 2024 at 4:37=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Mar 22, 2024 at 10:54:54AM -0700, Mina Almasry wrote:
> > Sorry I don't mean to argue but as David mentioned, there are some
> > plans in the works and ones not in the works to extend this to other
> > memory types. David mentioned io_uring & Jakub's huge page use cases
> > which may want to re-use this design. I have an additional one in
> > mind, which is extending devmem TCP for storage devices. Currently
> > storage devices do not support dmabuf and my understanding is that
> > it's very hard to do so, and NVMe uses pci_p2pdma instead. I wonder if
> > it's possible to extend devmem TCP in the future to support pci_p2pdma
> > to support nvme devices in the future.
>
> The block layer needs to suppotr dmabuf for this kind of I/O.
> Any special netdev to block side channel will be NAKed before you can
> even send it out.

Thanks, a few questions if you have time to help me understand the
potential of extending this to storage devices.

Are you envisioning that dmabuf support would be added to the block
layer (which I understand is part of the VFS and not driver specific),
or as part of the specific storage driver (like nvme for example)? If
we can add dmabuf support to the block layer itself that sounds
awesome. We may then be able to do devmem TCP on all/most storage
devices without having to modify each individual driver.

In your estimation, is adding dmabuf support to the block layer
something technically feasible & acceptable upstream? I notice you
suggested it so I'm guessing yes to both, but I thought I'd confirm.

Worthy of note this is all pertaining to potential follow up use
cases, nothing in this particular proposal is trying to do any of this
yet.

--=20
Thanks,
Mina
