Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF77E2FB2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 23:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2269810E451;
	Mon,  6 Nov 2023 22:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8A810E451
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 22:19:01 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7ba9bd62fdfso1523422241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 14:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699309140; x=1699913940;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVe8tsFd38G8mudEItn1e9pUK3iBPROvgvogaV1TSrE=;
 b=rKhLnjv70H3SpU6M7/4o3mU4Z52MClNWmWTHbgq+ciimePrMT/DIwjCLFpmb8iIxK5
 i6veBoinLf7gc/rZWZGMF538mujmupxgdfbA/3pkKAAw/n+PkrBMlGKNRL/FaxHZ9CWY
 Dv5Q6L7BKRUXDNqhuV7Rcp3yv8RLvXA7+TUPLdYK5b7pREksoLpByvE3plotFa0jHb5Q
 ZCqdCQ6G2b20KhICn6iin2WZFEMlAyUxm+1obBder8Ve6gaLGjW56d23KDfpTrZ1Luzp
 2btB/QX5HnKjQ/igdk0clMlTpUDICuCFkwxgqG7t+Ddy7T2wi+ck2bX9AAWxNDkUrm0L
 Abyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699309140; x=1699913940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVe8tsFd38G8mudEItn1e9pUK3iBPROvgvogaV1TSrE=;
 b=wR8kk2FCVmKYjix7ELESfrwAsbZDUTM4Fs+Qy+vyEa+O3Rka64oRGZl8qEFSCAR2nJ
 WMHgki7kqfCwLfOdpTHc+I9OG953NdsMRH3/DfuCx/d2lfOs0dCGbQCFFwm2ybl0mJi0
 +KNvRvLLu+XgQouaxbFgqhb3iTsYRQVCBUzwluf0YEGpnf8gIEz9aC9R0tA/zP+jNCkW
 YFNBV1g1pBmCAZayMxgmXqPTRh5FZEoI4ye/M0BRvFOa2pBTvrVd5bjyBAY8G+bx2fbc
 aQTcL2LnyyMRkqR+BoCDUNPPTLTwaErORqoQLMnmmtPL0aEizeZmoJ1zD16MPVDds2WV
 ueYA==
X-Gm-Message-State: AOJu0YymcEE9YUJ3YrY9Nbfv3vwqbyfPvHuxoKn+vVH2rV2Bf9JlOgPJ
 1jFp2ftlvMBDrM9l9cJDHOk7PxpVEdnGMiwXMNUhng==
X-Google-Smtp-Source: AGHT+IETz+GjKs7UxN4zP1XHdksBZh5d6q/RDjmzyDBzuwUW4rr3rEfHXLef56zICeXwbmmbul0YyFrTOhim5/h2TIY=
X-Received: by 2002:a67:e11c:0:b0:452:d9d4:a056 with SMTP id
 d28-20020a67e11c000000b00452d9d4a056mr24216370vsl.26.1699309139903; Mon, 06
 Nov 2023 14:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
In-Reply-To: <ZUlhu4hlTaqR3CTh@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 6 Nov 2023 14:18:46 -0800
Message-ID: <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
To: Stanislav Fomichev <sdf@google.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 1:59=E2=80=AFPM Stanislav Fomichev <sdf@google.com> =
wrote:
>
> On 11/06, Mina Almasry wrote:
> > On Mon, Nov 6, 2023 at 11:34=E2=80=AFAM David Ahern <dsahern@kernel.org=
> wrote:
> > >
> > > On 11/6/23 11:47 AM, Stanislav Fomichev wrote:
> > > > On 11/05, Mina Almasry wrote:
> > > >> For device memory TCP, we expect the skb headers to be available i=
n host
> > > >> memory for access, and we expect the skb frags to be in device mem=
ory
> > > >> and unaccessible to the host. We expect there to be no mixing and
> > > >> matching of device memory frags (unaccessible) with host memory fr=
ags
> > > >> (accessible) in the same skb.
> > > >>
> > > >> Add a skb->devmem flag which indicates whether the frags in this s=
kb
> > > >> are device memory frags or not.
> > > >>
> > > >> __skb_fill_page_desc() now checks frags added to skbs for page_poo=
l_iovs,
> > > >> and marks the skb as skb->devmem accordingly.
> > > >>
> > > >> Add checks through the network stack to avoid accessing the frags =
of
> > > >> devmem skbs and avoid coalescing devmem skbs with non devmem skbs.
> > > >>
> > > >> Signed-off-by: Willem de Bruijn <willemb@google.com>
> > > >> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > > >> Signed-off-by: Mina Almasry <almasrymina@google.com>
> > > >>
> > > >> ---
> > > >>  include/linux/skbuff.h | 14 +++++++-
> > > >>  include/net/tcp.h      |  5 +--
> > > >>  net/core/datagram.c    |  6 ++++
> > > >>  net/core/gro.c         |  5 ++-
> > > >>  net/core/skbuff.c      | 77 ++++++++++++++++++++++++++++++++++++-=
-----
> > > >>  net/ipv4/tcp.c         |  6 ++++
> > > >>  net/ipv4/tcp_input.c   | 13 +++++--
> > > >>  net/ipv4/tcp_output.c  |  5 ++-
> > > >>  net/packet/af_packet.c |  4 +--
> > > >>  9 files changed, 115 insertions(+), 20 deletions(-)
> > > >>
> > > >> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > > >> index 1fae276c1353..8fb468ff8115 100644
> > > >> --- a/include/linux/skbuff.h
> > > >> +++ b/include/linux/skbuff.h
> > > >> @@ -805,6 +805,8 @@ typedef unsigned char *sk_buff_data_t;
> > > >>   *  @csum_level: indicates the number of consecutive checksums fo=
und in
> > > >>   *          the packet minus one that have been verified as
> > > >>   *          CHECKSUM_UNNECESSARY (max 3)
> > > >> + *  @devmem: indicates that all the fragments in this skb are bac=
ked by
> > > >> + *          device memory.
> > > >>   *  @dst_pending_confirm: need to confirm neighbour
> > > >>   *  @decrypted: Decrypted SKB
> > > >>   *  @slow_gro: state present at GRO time, slower prepare step req=
uired
> > > >> @@ -991,7 +993,7 @@ struct sk_buff {
> > > >>  #if IS_ENABLED(CONFIG_IP_SCTP)
> > > >>      __u8                    csum_not_inet:1;
> > > >>  #endif
> > > >> -
> > > >> +    __u8                    devmem:1;
> > > >>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
> > > >>      __u16                   tc_index;       /* traffic control in=
dex */
> > > >>  #endif
> > > >> @@ -1766,6 +1768,12 @@ static inline void skb_zcopy_downgrade_mana=
ged(struct sk_buff *skb)
> > > >>              __skb_zcopy_downgrade_managed(skb);
> > > >>  }
> > > >>
> > > >> +/* Return true if frags in this skb are not readable by the host.=
 */
> > > >> +static inline bool skb_frags_not_readable(const struct sk_buff *s=
kb)
> > > >> +{
> > > >> +    return skb->devmem;
> > > >
> > > > bikeshedding: should we also rename 'devmem' sk_buff flag to 'not_r=
eadable'?
> > > > It better communicates the fact that the stack shouldn't dereferenc=
e the
> > > > frags (because it has 'devmem' fragments or for some other potentia=
l
> > > > future reason).
> > >
> > > +1.
> > >
> > > Also, the flag on the skb is an optimization - a high level signal th=
at
> > > one or more frags is in unreadable memory. There is no requirement th=
at
> > > all of the frags are in the same memory type.
>
> David: maybe there should be such a requirement (that they all are
> unreadable)? Might be easier to support initially; we can relax later
> on.
>

Currently devmem =3D=3D not_readable, and the restriction is that all the
frags in the same skb must be either all readable or all unreadable
(all devmem or all non-devmem).

> > The flag indicates that the skb contains all devmem dma-buf memory
> > specifically, not generic 'not_readable' frags as the comment says:
> >
> > + *     @devmem: indicates that all the fragments in this skb are backe=
d by
> > + *             device memory.
> >
> > The reason it's not a generic 'not_readable' flag is because handing
> > off a generic not_readable skb to the userspace is semantically not
> > what we're doing. recvmsg() is augmented in this patch series to
> > return a devmem skb to the user via a cmsg_devmem struct which refers
> > specifically to the memory in the dma-buf. recvmsg() in this patch
> > series is not augmented to give any 'not_readable' skb to the
> > userspace.
> >
> > IMHO skb->devmem + an skb_frags_not_readable() as implemented is
> > correct. If a new type of unreadable skbs are introduced to the stack,
> > I imagine the stack would implement:
> >
> > 1. new header flag: skb->newmem
> > 2.
> >
> > static inline bool skb_frags_not_readable(const struct skb_buff *skb)
> > {
> >     return skb->devmem || skb->newmem;
> > }
> >
> > 3. tcp_recvmsg_devmem() would handle skb->devmem skbs is in this patch
> > series, but tcp_recvmsg_newmem() would handle skb->newmem skbs.
>
> You copy it to the userspace in a special way because your frags
> are page_is_page_pool_iov(). I agree with David, the skb bit is
> just and optimization.
>
> For most of the core stack, it doesn't matter why your skb is not
> readable. For a few places where it matters (recvmsg?), you can
> double-check your frags (all or some) with page_is_page_pool_iov.
>

I see, we can do that then. I.e. make the header flag 'not_readable'
and check the frags to decide to delegate to tcp_recvmsg_devmem() or
something else. We can even assume not_readable =3D=3D devmem because
currently devmem is the only type of unreadable frag currently.

> Unrelated: we probably need socket to dmabuf association as well (via
> netlink or something).

Not sure this is possible. The dma-buf is bound to the rx-queue, and
any packets that land on that rx-queue are bound to that dma-buf,
regardless of which socket that packet belongs to. So the association
IMO must be rx-queue to dma-buf, not socket to dma-buf.

> We are fundamentally receiving into and sending from a dmabuf (devmem =3D=
=3D
> dmabuf).
> And once you have this association, recvmsg shouldn't need any new
> special flags.


--=20
Thanks,
Mina
