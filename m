Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F957E8834
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 03:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE60D10E056;
	Sat, 11 Nov 2023 02:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1E710E056
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:27:20 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-586940ee5a5so1328590eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 18:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699669640; x=1700274440;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHEiP3XV2uBmn0PqLRLjX42b0E6uQ7KYb1D3uUIKBZU=;
 b=V1N+QQ+W7QCG84rd4AO3FBidEw8GY2vz5EMzttYoBuiY0kn0XsntMd7dQHJWaU1tFt
 8InmsZ0mD2Z5D4XCV+VnOP9LgUpdd0KPz6jHVcKaEnf0/U62RdjKuTyI+Uv3qOO/5Up8
 ttEK5E+d1Y2/L/BJmBCzZfJj6Xu7vqV/8NeT+PWVDfI2KM5jcUOgH86gBmMdVHVBJ49v
 qsRxOagNiVojTj/HRZLFVZniS8S1dxzLd3StJjYfp4r46vXqXb7neHWfZJDI2mIuhtAS
 aSS7keNSPhWxR0hpefyC+94u7vj3gncdNVzjQC4nS/KVEBs18IWjel255rDnr7ooRuMX
 AY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699669640; x=1700274440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SHEiP3XV2uBmn0PqLRLjX42b0E6uQ7KYb1D3uUIKBZU=;
 b=qs+ZVy13doqAFYVLU7TSLV8ZLDwK/Gd9ZcS9rUfLmkCg83j61Xb6Wf6dqRgukcAYS+
 f0AcoaZEN6uXBgeUnKOGhD5pNyCzPgoaS20Dhk2vty73snF6fYYZ2vbuxYj63ngLijNf
 hBwntSDnZT0dZHtxYELiO7YOoGtoJGtBCP0H3sbyN26sYRafhnWU6YRFeTnEJ6lzoh+F
 tBDHiWlPcG7B3azKsCjN+ydyc0BlW5pnT37JU/4LoLnRTg9kcOT2hj8j82smGboRa7YY
 Tg7sprmL4gNOlkj2tGsWu2iRQcI7D6LBLttL9CSXE57K2pUvlcSlmlWfZe8lxanRk4/h
 dlXg==
X-Gm-Message-State: AOJu0YxOo8Qy3pvL31+W53lHWIY+al4TAnmsieYnlYC8TzFOzu5AduPK
 f2/CBgRbwWZ6zL5xG59cbM0OSok+pXxrL2oux9QAFQ==
X-Google-Smtp-Source: AGHT+IGyBV+nVxcKXqDhr/jOsghB7xKbBgit+rRkn7+/EmvaA+hI7Vwg9695v7Wh5I5Hq/ZuyDfKvkdxmxTKCmeUs+M=
X-Received: by 2002:a05:6358:7f1b:b0:16b:b980:d84b with SMTP id
 p27-20020a0563587f1b00b0016bb980d84bmr742598rwn.11.1699669639815; Fri, 10 Nov
 2023 18:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-13-almasrymina@google.com>
 <20231110151335.38a1c6ec@kernel.org>
In-Reply-To: <20231110151335.38a1c6ec@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 10 Nov 2023 18:27:08 -0800
Message-ID: <CAHS8izNFnE8RGgBhKzxhVoKXtXgZGVQCLSdm4_dWNeH9Gx-WDQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 12/12] selftests: add ncdevmem,
 netcat for devmem TCP
To: Jakub Kicinski <kuba@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 3:13=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> My brain is slightly fried after trying to catch up on the thread
> for close to 2h. So forgive me if I'm missing something.
> This applies to all emails I'm about to send :)
>
> On Sun,  5 Nov 2023 18:44:11 -0800 Mina Almasry wrote:
> > +     trigger_device_reset();
>
> The user space must not be responsible for the reset.
> We can add some temporary "recreate page pools" ndo
> until the queue API is ready.
>

Thanks for the clear requirement. I clearly had something different in mind=
.

Might be dumb suggestions, but instead of creating a new ndo that we
maybe end up wanting to deprecate once the queue API is ready, how
about we use either of those existing APIs?

+void netdev_reset(struct net_device *dev)
+{
+       int flags =3D ETH_RESET_ALL;
+       int err;
+
+#if 1
+       __dev_close(dev);
+       err =3D __dev_open(dev, NULL);
+#else
+       err =3D dev->ethtool_ops->reset(dev, &flags);
+#endif
+}
+

I've tested both of these to work with GVE on both bind via the
netlink API and unbind via the netlink socket close, but I'm not
enough of an expert to tell if there is some bad side effect that can
happen or something.

> But it should not be visible to the user in any way.
>
> And then the kernel can issue the same reset when the netlink
> socket dies to flush device free lists.
>

Sure thing, I can do that.

> Maybe we should also add a "allow device/all-queues reload" flag
> to the netlink API to differentiate drivers which can't implement
> full queue API later on. We want to make sure the defaults work well
> in our "target design", rather than at the first stage. And target
> design will reload queues one by one.

I can add a flag, yes.

--=20
Thanks,
Mina
