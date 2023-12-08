Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B380A81D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8FA10EAB0;
	Fri,  8 Dec 2023 16:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B6910EAB0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:05:36 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-59064bca27dso1122843eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 08:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702051536; x=1702656336;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5hzJO8yTOOmWqcY0MuzAVnhi+7X/9ZZXmPHeSk3Rcw=;
 b=OGX6sEP4lilu+cPY2iTq9WMj8DQgujMF0cw4snoKtoQepb/Qi0G4iSZG2lxrkj+gO/
 rgrRfF0eVTeQ2oiWOo5XlaidW6X5sJLrepWVVgZmbMgV1IB7bTiNoNI/HNw74n9Rh4Q7
 nnYSfcW6wfZktbstT06m6ikFwcoDAaG2fc3yQFCkBUP5t2jLJLbMw//n2VaIpj0BQOBv
 J3sf0ZZ2TLbCW13xEiRdT/huBOlc303QH0uPm2S9Z1sQASc1oumb8Bm1Uxv6jU3ebufB
 KSVuwMhBIqbn3w3J/dXL06EdEeub8RzmfrMTSkN3ybepFpSVGBOa0iGDV5XqO/M8aHE8
 BvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702051536; x=1702656336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e5hzJO8yTOOmWqcY0MuzAVnhi+7X/9ZZXmPHeSk3Rcw=;
 b=WMiMz2OJWw+itz9u0l4VRnmVFNy40QxBmlxvIYFIwexD+jMTydePYSwsztNxDylbXw
 rOdcY/Tr4mC6wW7IUKv2SH+TCKWbnZnZR7f0SsHEeVeQbIn893xtZUI1ZUPjN6HiGaM/
 OstNwceBrkgd3HXTIrzsFRZ2/+spXuYa3rv72Wv+ogus7AXedyZxHVeJRihQrtZFPLJw
 FMBmD9riBhTx/EzyskmEAZ2cIJNTc789lMV6CqtD2rWMtYY/oYPqY3w/oLsyMo2+K4Ii
 u6fdHxdFaLK2CsHhBhPCfXB6U/yS0pP3uFFQdaH+q5VpheFqAOV16GnJhnFjbYUJnTlC
 zyYw==
X-Gm-Message-State: AOJu0Yyj44svkpSzlGI8WsA33utRjl5ZrHy7mrFZF/i1TLujm+aSoOtv
 Aalhr+Oq41ZYsP0KYCiOKCGgIouJSNRr0v83dUOFaYiNzKkdqkofLxGkSlmp
X-Google-Smtp-Source: AGHT+IHGL9I69KlXE84BwGl5GPy9pGIJCFOfAY8CuVMTHvJTVezRqKK9zxZSLL0J2ODaF4dUlwCbTKVYsFtIXkR7BGM=
X-Received: by 2002:a05:6358:60c1:b0:16c:4fe:7bfc with SMTP id
 i1-20020a05635860c100b0016c04fe7bfcmr109970rwi.22.1702051535503; Fri, 08 Dec
 2023 08:05:35 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-10-almasrymina@google.com>
 <32211cbf-3a4e-8a86-6214-4304ddb18a98@huawei.com>
In-Reply-To: <32211cbf-3a4e-8a86-6214-4304ddb18a98@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Dec 2023 08:05:22 -0800
Message-ID: <CAHS8izOQcuLPwvDff96fuNB7r6EU9OWt3ShueQp=u7wat3L5LA@mail.gmail.com>
Subject: Re: [net-next v1 09/16] page_pool: device memory support
To: Yunsheng Lin <linyunsheng@huawei.com>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 1:30=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
>
> As mentioned before, it seems we need to have the above checking every
> time we need to do some per-page handling in page_pool core, is there
> a plan in your mind how to remove those kind of checking in the future?
>

I see 2 ways to remove the checking, both infeasible:

1. Allocate a wrapper struct that pulls out all the fields the page pool ne=
eds:

struct netmem {
        /* common fields */
        refcount_t refcount;
        bool is_pfmemalloc;
        int nid;
        ...
        union {
                struct dmabuf_genpool_chunk_owner *owner;
                struct page * page;
        };
};

The page pool can then not care if the underlying memory is iov or
page. However this introduces significant memory bloat as this struct
needs to be allocated for each page or ppiov, which I imagine is not
acceptable for the upside of removing a few static_branch'd if
statements with no performance cost.

2. Create a unified struct for page and dmabuf memory, which the mm
folks have repeatedly nacked, and I imagine will repeatedly nack in
the future.

So I imagine the special handling of ppiov in some form is critical
and the checking may not be removable.

> Even though a static_branch check is added in page_is_page_pool_iov(), it
> does not make much sense that a core has tow different 'struct' for its
> most basic data.
>
> IMHO, the ppiov for dmabuf is forced fitting into page_pool without much
> design consideration at this point.
>
...
>
> For now, the above may work for the the rx part as it seems that you are
> only enabling rx for dmabuf for now.
>
> What is the plan to enable tx for dmabuf? If it is also intergrated into
> page_pool? There was a attempt to enable page_pool for tx, Eric seemed to
> have some comment about this:
> https://lkml.kernel.org/netdev/2cf4b672-d7dc-db3d-ce90-15b4e91c4005@huawe=
i.com/T/#mb6ab62dc22f38ec621d516259c56dd66353e24a2
>
> If tx is not intergrated into page_pool, do we need to create a new layer=
 for
> the tx dmabuf?
>

I imagine the TX path will reuse page_pool_iov, page_pool_iov_*()
helpers, and page_pool_page_*() helpers, but will not need any core
page_pool changes. This is because the TX path will have to piggyback
on MSG_ZEROCOPY (devmem is not copyable), so no memory allocation from
the page_pool (or otherwise) is needed or possible. RFCv1 had a TX
implementation based on dmabuf pages without page_pool involvement, I
imagine I'll do something similar.

--=20
Thanks,
Mina
