Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEAD8098C1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7221F10E030;
	Fri,  8 Dec 2023 01:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2490D10E030
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:47:34 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-db3fa47c2f7so1937082276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702000053; x=1702604853;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QasjkTvE12oeIkeDPIYBXwIAiruihNVVX4fkQH8L17I=;
 b=LmkRHyWmE8/O8u1V/u/RWnujL5zRwpeaD8/rw2oN+Ms/yyt5cJxDnBp6csElrUO+oC
 dNiXbiKhGlCnyXtBFMDYT9MK6m5DS1p6VsTib1kB2VefQYpzJRr46JM7/NyP2GZ3qyO3
 DjfylfsSRDq8mSrUSNKY8YfD1SJEaVd6iGqRhGVwNlanrE9FknbgBAbXLIOQY/Ca0/KY
 3dWoAr5AYNw1r5EhNSAxf1X1GUg+OfKBCEz37FsRioWbS5vGZJY52TbOUXSeI1UuXdxD
 jcwM2DpOizH+KE9rDyaZg6Vt83QChwpFH7ee36Pq3SvPRiSCzk3cKxHdoE97BjNJt1pj
 knqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702000053; x=1702604853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QasjkTvE12oeIkeDPIYBXwIAiruihNVVX4fkQH8L17I=;
 b=kgdRaLlf+vwfN/EdU8+VRR2bxR9NbDz2Ni8y8uzlhBsPQcBe8xr6ddR3uF02CmDEiU
 WVLl7GIKl+ilXCyZrdlqrPP13Ng7AP2FtQ0IaQZqKGRLFjlcTuq2PBJ6z5qaMByFXPni
 ZElVlVMmksemrM8J22JJyrXPSRQjcvty7DN8FfpZv3Ymk3yIJRPI/YhmbfI0HTjmxIrb
 sBlB6OvqgtKy6kJir5UK/rmq9mha4fZe3kJb3hhwiLNlWNSusmFDMZtFgzi3W5802mos
 Lvf/MC/oTTYoi2WLGe4BwBY261xiVFohhCPO94pA6YODaaVKidp6WfQF1DLH4IDEoJX2
 dU2w==
X-Gm-Message-State: AOJu0YyZ3pHhgIriera6Rd+Xez3BJE8oBCbA2JuJpfoMMgyspAGyJy3E
 b9aFcOQMKmfTpw+nWrgCR5qKgbObJ3KupmjL5x8xkA==
X-Google-Smtp-Source: AGHT+IGkcaN4vvcrb8T5smexqtqjrDfI96Nzc421af0VFhb8gbbvwzsJEs/NJAkNTu4GFPThK+R150NgDMf09+eZHpo=
X-Received: by 2002:a05:6902:18ca:b0:db7:dad0:60d7 with SMTP id
 ck10-20020a05690218ca00b00db7dad060d7mr4259393ybb.100.1702000052997; Thu, 07
 Dec 2023 17:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 7 Dec 2023 17:47:19 -0800
Message-ID: <CAHS8izPitBiASmmdZQ91HRmK33YBZJXOmmCybgeuGYTjP231ug@mail.gmail.com>
Subject: Re: [net-next v1 00/16] Device Memory TCP
To: Shailend Chand <shailend@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Wei <dw@davidwei.uk>, 
 Pavel Begunkov <asml.silence@gmail.com>
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 7, 2023 at 4:52=E2=80=AFPM Mina Almasry <almasrymina@google.com=
> wrote:
>
> Major changes in v1:
> --------------
>
> 1. Implemented MVP queue API ndos to remove the userspace-visible
>    driver reset.
>
> 2. Fixed issues in the napi_pp_put_page() devmem frag unref path.
>
> 3. Removed RFC tag.
>
> Many smaller addressed comments across all the patches (patches have
> individual change log).
>
> Full tree including the rest of the GVE driver changes:
> https://github.com/mina/linux/commits/tcpdevmem-v1
>
> Cc: Yunsheng Lin <linyunsheng@huawei.com>
> Cc: Shailend Chand <shailend@google.com>
> Cc: Harshitha Ramamurthy <hramamurthy@google.com>
>

Welp, I messed up the subject line. It should say [PATCH net-next...]
across all the patches. This may trip up bots and email filters. If
this is annoying, I'll resend with the fixed subject line after the
24hr cooldown period. Sorry about that.

--=20
Thanks,
Mina
