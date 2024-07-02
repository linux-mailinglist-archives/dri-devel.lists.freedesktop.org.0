Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CDD923FD8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93B610E0A3;
	Tue,  2 Jul 2024 14:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yqqTiKtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D49210E097
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 14:06:24 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57d16251a07so22330a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719929182; x=1720533982;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNmU32dvBm3gfxYwarWNLU2+3UhXNNMikScGS5Lo7nM=;
 b=yqqTiKtD2TtNo44Z8zkO566CcYaXMyegqnAFLnr9nRQqtv6c322w63z5cA8Yc7bI14
 PkTTj7mp4UUj+qUMcp7/P3HwA+mPqzFT42mm2H2LSYgcGEA2pZ+QDF0C3JvXqMr9Cfni
 X8aoDUmgZW/6q2KDw90JVrnpzxeeES4aBC6wN0wrgHjOqx33R6eWXMsA/LRjKkgGoKrT
 AwldLn6DpHJHnNznGD8IDmRQIKCPwX8TRujIsin9Phs9rFjHAVdl6+X2zadKCPU1zVEm
 VGkXo9EEL+/DU3p6gyLTWz9BpsPOwlnShKrDNxzHNns2sFiTIc5dwuWI8opb0U6vBptv
 lTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719929182; x=1720533982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NNmU32dvBm3gfxYwarWNLU2+3UhXNNMikScGS5Lo7nM=;
 b=MUT/hWLyprxmXFlw0Fg/eSmt8kgrHmOZwvzjMrOV5k+unWK+wnAyBjR9t9ar15rpcx
 cOqhkKh44tZmSFdhL454SsnI0Ar8LO5YckeI8D8zBNvRhtO189jo5LQ0bwCtrdFwbXNb
 Xyl9dMTzt+DoatNoLNLYzrQmbfvl/0EUvuunHyBAUig2hHGKho0eRGQj9mvWFthUsRVf
 2odge5kE96SnGRyWDzU8Gu15tyUI2reYNqfOQGZGp+Sm9xLxeio9JZWIuk976gMKsbmq
 5NWXwXTn9qWyGMRq5Zsc9JJYLf6FY/1Cqr4H1Xqm9FuElEVZBHRLKva42K/DRp3mH+Q0
 rQNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaiLsO5n1xOcRhi8BlvRgZ2g66z+p5Letw8ijYpCzuLWPOuuJDuLMo7ftqJFste7OwSxW2I1saXgrVCEGGfPClOH+mhYbdpf8hupMRwReD
X-Gm-Message-State: AOJu0Yydavozxi4Xfhu7nyIHf7+lvIeAfnRjcmfS6LduyGbDliGOXznX
 /GDxXr1Ns8KvtoBBGTjKNXvWpGj4K2/OwKiTWfYV3IsoCK0wKtxMA/3WYqQKXYqpWAbx7mexjQM
 UlQXVoQ+L5qw6wms6f1SeknSYerZaDF+DZ8qk
X-Google-Smtp-Source: AGHT+IEG7n3/i48gk+qC4VGln3p1L3XzY4pEsX95WNl49QKZclbmPxQTL5jw92OBBJ24lHPaRlK9u6jETGlZtKwmQIg=
X-Received: by 2002:a50:9e8d:0:b0:58b:21f2:74e6 with SMTP id
 4fb4d7f45d1cf-58c61e89244mr448a12.0.1719929182092; Tue, 02 Jul 2024 07:06:22
 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-10-almasrymina@google.com>
In-Reply-To: <20240628003253.1694510-10-almasrymina@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Jul 2024 16:06:08 +0200
Message-ID: <CANn89i+3YbpWvmzmGVLQwyUgBpuQND3RbmXgB-AD-Ka9vRkd2A@mail.gmail.com>
Subject: Re: [PATCH net-next v15 09/14] net: add support for skbs with
 unreadable frags
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>,
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
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
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

On Fri, Jun 28, 2024 at 2:33=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> For device memory TCP, we expect the skb headers to be available in host
> memory for access, and we expect the skb frags to be in device memory
> and unaccessible to the host. We expect there to be no mixing and
> matching of device memory frags (unaccessible) with host memory frags
> (accessible) in the same skb.
>
> Add a skb->devmem flag which indicates whether the frags in this skb
> are device memory frags or not.
>
> __skb_fill_netmem_desc() now checks frags added to skbs for net_iov,
> and marks the skb as skb->devmem accordingly.
>
> Add checks through the network stack to avoid accessing the frags of
> devmem skbs and avoid coalescing devmem skbs with non devmem skbs.
>
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>
>
> ---
>
> v11:
> - drop excessive checks for frag 0 pull (Paolo)
>
> v9: https://lore.kernel.org/netdev/20240403002053.2376017-11-almasrymina@=
google.com/
> - change skb->readable to skb->unreadable (Pavel/David).
>
> skb->readable was very complicated, because by default skbs are readable
> so the flag needed to be set to true in all code paths where new skbs
> were created or cloned. Forgetting to set skb->readable=3Dtrue in some
> paths caused crashes.
>
> Flip it to skb->unreadable so that the default 0 value works well, and
> we only need to set it to true when we add unreadable frags.
>
> v6
> - skb->dmabuf -> skb->readable (Pavel). Pavel's original suggestion was
>   to remove the skb->dmabuf flag entirely, but when I looked into it
>   closely, I found the issue that if we remove the flag we have to
>   dereference the shinfo(skb) pointer to obtain the first frag, which
>   can cause a performance regression if it dirties the cache line when
>   the shinfo(skb) was not really needed. Instead, I converted the
>   skb->dmabuf flag into a generic skb->readable flag which can be
>   re-used by io_uring.
>
> Changes in v1:
> - Rename devmem -> dmabuf (David).
> - Flip skb_frags_not_readable (Jakub).
>
> ---
>  include/linux/skbuff.h | 19 +++++++++++++++--
>  include/net/tcp.h      |  5 +++--
>  net/core/datagram.c    |  6 ++++++
>  net/core/skbuff.c      | 48 ++++++++++++++++++++++++++++++++++++++++--
>  net/ipv4/tcp.c         |  3 +++
>  net/ipv4/tcp_input.c   | 13 +++++++++---
>  net/ipv4/tcp_output.c  |  5 ++++-
>  net/packet/af_packet.c |  4 ++--
>  8 files changed, 91 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 3cd06eb3a44da..5438434b61300 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -827,6 +827,8 @@ enum skb_tstamp_type {
>   *     @csum_level: indicates the number of consecutive checksums found =
in
>   *             the packet minus one that have been verified as
>   *             CHECKSUM_UNNECESSARY (max 3)
> + *     @unreadable: indicates that at least 1 of the fragments in this s=
kb is
> + *             unreadable.
>   *     @dst_pending_confirm: need to confirm neighbour
>   *     @decrypted: Decrypted SKB
>   *     @slow_gro: state present at GRO time, slower prepare step require=
d
> @@ -1008,7 +1010,7 @@ struct sk_buff {
>  #if IS_ENABLED(CONFIG_IP_SCTP)
>         __u8                    csum_not_inet:1;
>  #endif
> -
> +       __u8                    unreadable:1;
>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
>         __u16                   tc_index;       /* traffic control index =
*/
>  #endif
> @@ -1820,6 +1822,12 @@ static inline void skb_zcopy_downgrade_managed(str=
uct sk_buff *skb)
>                 __skb_zcopy_downgrade_managed(skb);
>  }
>
> +/* Return true if frags in this skb are readable by the host. */
> +static inline bool skb_frags_readable(const struct sk_buff *skb)
> +{
> +       return !skb->unreadable;
> +}
> +
>  static inline void skb_mark_not_on_list(struct sk_buff *skb)
>  {
>         skb->next =3D NULL;
> @@ -2536,10 +2544,17 @@ static inline void skb_len_add(struct sk_buff *sk=
b, int delta)
>  static inline void __skb_fill_netmem_desc(struct sk_buff *skb, int i,
>                                           netmem_ref netmem, int off, int=
 size)
>  {
> -       struct page *page =3D netmem_to_page(netmem);
> +       struct page *page;
>
>         __skb_fill_netmem_desc_noacc(skb_shinfo(skb), i, netmem, off, siz=
e);
>
> +       if (netmem_is_net_iov(netmem)) {
> +               skb->unreadable =3D true;
> +               return;
> +       }
> +
> +       page =3D netmem_to_page(netmem);
> +
>         /* Propagate page pfmemalloc to the skb if we can. The problem is
>          * that not all callers have unique ownership of the page but rel=
y
>          * on page_is_pfmemalloc doing the right thing(tm).
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 2aac11e7e1cc5..e8f6e602c2ad4 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -1060,7 +1060,7 @@ static inline int tcp_skb_mss(const struct sk_buff =
*skb)
>
>  static inline bool tcp_skb_can_collapse_to(const struct sk_buff *skb)
>  {
> -       return likely(!TCP_SKB_CB(skb)->eor);
> +       return likely(!TCP_SKB_CB(skb)->eor && skb_frags_readable(skb));
>  }
>
>  static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
> @@ -1069,7 +1069,8 @@ static inline bool tcp_skb_can_collapse(const struc=
t sk_buff *to,
>         /* skb_cmp_decrypted() not needed, use tcp_write_collapse_fence()=
 */
>         return likely(tcp_skb_can_collapse_to(to) &&
>                       mptcp_skb_can_collapse(to, from) &&
> -                     skb_pure_zcopy_same(to, from));
> +                     skb_pure_zcopy_same(to, from) &&
> +                     skb_frags_readable(to) =3D=3D skb_frags_readable(fr=
om));
>  }
>
>  static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
> diff --git a/net/core/datagram.c b/net/core/datagram.c
> index 95f242591fd23..e1d12f55236df 100644
> --- a/net/core/datagram.c
> +++ b/net/core/datagram.c
> @@ -407,6 +407,9 @@ static int __skb_datagram_iter(const struct sk_buff *=
skb, int offset,
>                         return 0;
>         }
>
> +       if (!skb_frags_readable(skb))
> +               goto short_copy;
> +
>         /* Copy paged appendix. Hmm... why does this look so complicated?=
 */
>         for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
>                 int end;
> @@ -619,6 +622,9 @@ int __zerocopy_sg_from_iter(struct msghdr *msg, struc=
t sock *sk,
>         if (msg && msg->msg_ubuf && msg->sg_from_iter)
>                 return msg->sg_from_iter(sk, skb, from, length);
>
> +       if (!skb_frags_readable(skb))
> +               return -EFAULT;
> +
>         frag =3D skb_shinfo(skb)->nr_frags;
>
>         while (length && iov_iter_count(from)) {
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index cc47774bbeb98..1e82222d0a6dd 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -1968,6 +1968,9 @@ int skb_copy_ubufs(struct sk_buff *skb, gfp_t gfp_m=
ask)
>         if (skb_shared(skb) || skb_unclone(skb, gfp_mask))
>                 return -EINVAL;
>
> +       if (!skb_frags_readable(skb))
> +               return -EFAULT;
> +
>         if (!num_frags)
>                 goto release;
>
> @@ -2141,6 +2144,9 @@ struct sk_buff *skb_copy(const struct sk_buff *skb,=
 gfp_t gfp_mask)
>         unsigned int size;
>         int headerlen;
>
> +       if (!skb_frags_readable(skb))
> +               return NULL;
> +
>         if (WARN_ON_ONCE(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST))
>                 return NULL;
>
> @@ -2479,6 +2485,9 @@ struct sk_buff *skb_copy_expand(const struct sk_buf=
f *skb,
>         struct sk_buff *n;
>         int oldheadroom;
>
> +       if (!skb_frags_readable(skb))
> +               return NULL;
> +
>         if (WARN_ON_ONCE(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST))
>                 return NULL;
>
> @@ -2823,6 +2832,9 @@ void *__pskb_pull_tail(struct sk_buff *skb, int del=
ta)
>          */
>         int i, k, eat =3D (skb->tail + delta) - skb->end;
>
> +       if (!skb_frags_readable(skb))
> +               return NULL;
> +
>         if (eat > 0 || skb_cloned(skb)) {
>                 if (pskb_expand_head(skb, 0, eat > 0 ? eat + 128 : 0,
>                                      GFP_ATOMIC))
> @@ -2976,6 +2988,9 @@ int skb_copy_bits(const struct sk_buff *skb, int of=
fset, void *to, int len)
>                 to     +=3D copy;
>         }
>
> +       if (!skb_frags_readable(skb))
> +               goto fault;
> +
>         for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
>                 int end;
>                 skb_frag_t *f =3D &skb_shinfo(skb)->frags[i];
> @@ -3164,6 +3179,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, =
struct pipe_inode_info *pipe,
>         /*
>          * then map the fragments
>          */
> +       if (!skb_frags_readable(skb))
> +               return false;
> +
>         for (seg =3D 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
>                 const skb_frag_t *f =3D &skb_shinfo(skb)->frags[seg];
>
> @@ -3387,6 +3405,9 @@ int skb_store_bits(struct sk_buff *skb, int offset,=
 const void *from, int len)
>                 from +=3D copy;
>         }
>
> +       if (!skb_frags_readable(skb))
> +               goto fault;
> +
>         for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
>                 skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
>                 int end;
> @@ -3466,6 +3487,9 @@ __wsum __skb_checksum(const struct sk_buff *skb, in=
t offset, int len,
>                 pos     =3D copy;
>         }
>
> +       if (!skb_frags_readable(skb))
> +               return 0;
> +
>         for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
>                 int end;
>                 skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> @@ -3566,6 +3590,9 @@ __wsum skb_copy_and_csum_bits(const struct sk_buff =
*skb, int offset,
>                 pos     =3D copy;
>         }
>
> +       if (!skb_frags_readable(skb))
> +               return 0;
> +
>         for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
>                 int end;
>
> @@ -4057,6 +4084,7 @@ static inline void skb_split_inside_header(struct s=
k_buff *skb,
>                 skb_shinfo(skb1)->frags[i] =3D skb_shinfo(skb)->frags[i];
>
>         skb_shinfo(skb1)->nr_frags =3D skb_shinfo(skb)->nr_frags;
> +       skb1->unreadable           =3D skb->unreadable;
>         skb_shinfo(skb)->nr_frags  =3D 0;
>         skb1->data_len             =3D skb->data_len;
>         skb1->len                  +=3D skb1->data_len;
> @@ -4071,6 +4099,7 @@ static inline void skb_split_no_header(struct sk_bu=
ff *skb,
>  {
>         int i, k =3D 0;
>         const int nfrags =3D skb_shinfo(skb)->nr_frags;
> +       const int unreadable =3D skb->unreadable;
>
>         skb_shinfo(skb)->nr_frags =3D 0;
>         skb1->len                 =3D skb1->data_len =3D skb->len - len;
> @@ -4104,6 +4133,12 @@ static inline void skb_split_no_header(struct sk_b=
uff *skb,
>                 pos +=3D size;
>         }
>         skb_shinfo(skb1)->nr_frags =3D k;
> +

Minor point : skb->unreadable can be left as is ?

> +       if (skb_shinfo(skb)->nr_frags)
> +               skb->unreadable =3D unreadable;


Minor point : skb_shinfo(skb1)->nr_frags can't be zero at this point.

> +
> +       if (skb_shinfo(skb1)->nr_frags)
> +               skb1->unreadable =3D unreadable;
>  }

This means we probably could remove the unreadable variable and

   skb1->unreadable =3D skb->unreadable;

No need to send a new version, this can be incrementally changed later.

Reviewed-by: Eric Dumazet <edumazet@google.com>
