Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B85813B30
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA4410E22D;
	Thu, 14 Dec 2023 20:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB2910E1DA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:03:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3364a657564so818456f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702584207; x=1703189007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3t3FbK18GrHFwKE4zIkpGcLL7FiHaNow8xNq3R4/QdI=;
 b=voBfBDOdE7/jV8mAuOLiaMIAjj5KpryvOAxcWLWk/gI5uFN0rfA03TYjnyVOtnHNAH
 GdcXH76S0CD8GEugjgm2Ma9xuIcQDf2tG+ynMShBm9GvLjEXJjKorMflW5peFkK3CD3w
 lsN4oYK6sFAfzgPwN8YxdNheNvCZCZtvco2gGx+pzHLXrCYG95MqbV0la9LqfpLEjOux
 11oryDqioN3gs7xEkTKc6O6caoy4tcqZW/fgimxyy28tlKHBL1KMNnpCFoROXqkKV+hi
 xqZFYx/kihvRwPsrdscby/dk5mfR0sWJtbS8NJJ5wxF6edSXS8EJ9xrDToMaY2iQF712
 jy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702584207; x=1703189007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3t3FbK18GrHFwKE4zIkpGcLL7FiHaNow8xNq3R4/QdI=;
 b=iW9upSDSlubO/zKaqzgAfIBivq6ioPnX1ciU0aH6KFM7sVWVzkozLzoF2/81yH/yBi
 FxgWdq8CFqfSPLgGi2LmSNSTzYK1Ahcbj/EfzCrpL8oOZEdbbkjyJS9mWgXvK2di/Fke
 VypNPXC+inZq1HlWh00002D4qxQquPcIkJCwbYA3JAz+MVF8KMvv4KMdWaY4Hl5HhlRL
 rZbEO2+nAOUU6L8J73R4QkSCEMpLlyDCLIC1WXjLoKy/1fhf9y8RdkdPRypUpk9QaWyR
 ENO037aROBDAZjMxq2QGwAVDYliEvALgw2ssfhrkjaW58/oIAnrl/A6muKywNIaUog5Y
 oUUQ==
X-Gm-Message-State: AOJu0Yy48s4Oy/HKqjMlNO4C1QV5Z7xT+5dNyEGi3EoJGoTwYu8yFdAC
 +yGbD5qvmquetojiZqd5E3hZlYj59onP3LnxFCLe2A==
X-Google-Smtp-Source: AGHT+IFJxGuMnKvxp55N7GC1tz5/h738b4XoM+FeA8fRtBht8xQJ/kBDFL2qAi3ZYkZt7idruFgudyPvdRKWDedOoVg=
X-Received: by 2002:a05:600c:2313:b0:40c:3e43:4183 with SMTP id
 19-20020a05600c231300b0040c3e434183mr4682976wmo.5.1702584207011; Thu, 14 Dec
 2023 12:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-9-almasrymina@google.com>
 <b07a4eca-0c3d-4620-9f97-b1d2c76642c2@gmail.com>
 <CAHS8izNVFx6oHoo7y86P8Di9VCVe8A_n_9UZFkg5Wnt=A=YcNQ@mail.gmail.com>
 <b1aea7bc-9627-499a-9bee-d2cc07856978@gmail.com>
 <CAHS8izPry13h49v+PqrmWSREZKZjYpPesxUTyPQy7AGyFwzo4g@mail.gmail.com>
 <661c1bae-d7d3-457e-b545-5f67b9ef4197@gmail.com>
In-Reply-To: <661c1bae-d7d3-457e-b545-5f67b9ef4197@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 14 Dec 2023 12:03:15 -0800
Message-ID: <CAHS8izOY9xm=LBEN8sYwEa3aFB4GWDvJVacom3o4mHZPdHzTUg@mail.gmail.com>
Subject: Re: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
To: Pavel Begunkov <asml.silence@gmail.com>
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 12:37=E2=80=AFPM Pavel Begunkov <asml.silence@gmail=
.com> wrote:
...
> >> If you remove the branch, let it fall into ->release and rely
> >> on refcounting there, then the callback could also fix up
> >> release_cnt or ask pp to do it, like in the patch I linked above
> >>
> >
> > Sadly I don't think this is possible due to the reasons I mention in
> > the commit message of that patch. Prematurely releasing ppiov and not
> > having them be candidates for recycling shows me a 4-5x degradation in
> > performance.
>
> I don't think I follow. The concept is to only recycle a buffer (i.e.
> make it available for allocation) when its refs drop to zero, which is
> IMHO the only way it can work, and IIUC what this patchset is doing.
>
> That's also I suggest to do, but through a slightly different path.
> Let's say at some moment there are 2 refs (e.g. 1 for an skb and
> 1 for userspace/xarray).
>
> Say it first puts the skb:
>
> napi_pp_put_page()
>    -> page_pool_return_page()
>      -> mp_ops->release_page()
>         -> need_to_free =3D put_buf()
>            // not last ref, need_to_free=3D=3Dfalse,
>            // don't recycle, don't increase release_cnt
>
> Then you put the last ref:
>
> page_pool_iov_put_many()
>    -> page_pool_return_page()
>      -> mp_ops->release_page()
>         -> need_to_free =3D put_buf()
>            // last ref, need_to_free=3D=3Dtrue,
>            // recycle and release_cnt++
>
> And that last put can even be recycled right into the
> pp / ptr_ring, in which case it doesn't need to touch
> release_cnt. Does it make sense? I don't see where
> 4-5x degradation would come from
>
>

Sorry for the late reply, I have been working on this locally.

What you're saying makes sense, and I'm no longer sure why I was
seeing a perf degradation without '[net-next v1 10/16] page_pool:
don't release iov on elevanted refcount'. However, even though what
you're saying is technically correct, AFAIU it's actually semantically
wrong. When a page is released by the page_pool, we should call
page_pool_clear_pp_info() and completely disconnect the page from the
pool. If we call release_page() on a page and then the page pool sees
it again in page_pool_return_page(), I think that is considered a bug.
In fact I think what you're proposing is as a result of a bug because
we don't call a page_pool_clear_pp_info() equivalent on releasing
ppiov.

However, I'm reasonably confident I figured out the right thing to do
here. The page_pool uses page->pp_frag_count for its refcounting.
pp_frag_count is a misnomer, it's being renamed to pp_ref_count in
Liang's series[1]). In this series I used a get_page/put_page
equivalent for refcounting. Once I transitioned to using
pp_[frag|ref]_count for refcounting inside the page_pool, the issue
went away, and I no longer need the patch 'page_pool: don't release
iov on elevanted refcount'.

There is an additional upside, since pages and ppiovs are both being
refcounted using pp_[frag|ref]_count, we get some unified handling for
ppiov and we reduce the checks around ppiov. This should be fixed
properly in the next series.

I still need to do some work (~1 week) before I upload the next
version as there is a new requirement from MM that we transition to a
new type and not re-use page*, but I uploaded my changes github with
the refcounting issues resolved in case they're useful to you. Sorry
for the churn:

https://github.com/mina/linux/commits/tcpdevmem-v1.5/

[1] https://patchwork.kernel.org/project/netdevbpf/list/?series=3D809049&st=
ate=3D*

--=20
Thanks,
Mina
