Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E207365A3F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67C36E826;
	Tue, 20 Apr 2021 13:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6986E826
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 13:35:46 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e7so28673590wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0665Q9PlPd4DaUIk9mWhDK12nGo1R6bvXcfes8jy7o=;
 b=IWajLmN5ZmjJXWRPY3Xxn1VGiWgGfCNajHv7kcIxPb6M6J5dHAGvXTLKV5TrBicQer
 GqpsO6pSTn8oyzlBNQtQkKyhgzbdmONsBQCa9vz3vK4lfWXnKBR8PAVvEC31ygMirhbc
 qJ/fhJHtGaLhcEUTll80aBeiVXw2coYcZ/N0D4eYs3ZUj5qsjat4LbvKotnQsz1OyuuF
 a4+ncr1wlsAEKY0SfeaoENT3/WVS9PMUj5PfQXZMBtmfNlCCrC3koQXGnfQ8toui7hEq
 3nRj1zDtU6auPfAo0Ut40AJNMG+ETdMu4AR2FjgHlpCKv7jjVncDGjwFGO3f6xPz55+q
 AHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0665Q9PlPd4DaUIk9mWhDK12nGo1R6bvXcfes8jy7o=;
 b=ckOo0FfuMlQYTqgZ7ju3nQtC8YRjtBMIgkguBZZ6G6j8wIp1B5DhhoOEFzF6xhTZw7
 72Aum9W6v9qSUlTycZ5Uj1C4SCBQec9MoKRqDbf1wBvsCAhT2Puo5oGZeUR2u0kXpPBV
 hSigLn6c5YZDpS1PvYmvVGqoOKfdu8Izc4W80Gyz2Z3kjRPMM1igoaW5U8XI4YDAA+p7
 qUcBQBjWbXc3Ykvo/hB7whbRjU/ntMYKqw0tIzXaeTB0yGKNCpw3J4Ioxsy/7W2ROFf6
 74LgY3DILBkpqwyHqhykmWOerRjOXRnKq5alMqktCWyLXbbZAclM1Zvn93xqBC5482Io
 mcoQ==
X-Gm-Message-State: AOAM531KEG7bq94kgCZEnZIUJrISi2HmnzlRYxOO/hz11GEZ0KGpeCtj
 IysFuJYwZiSQx9FrzISplRWBEmogErjDWSB6mITsPw==
X-Google-Smtp-Source: ABdhPJxuJXO0zzw6aKgSeT2Hl07jbqe9w8e2wOp9LJynwiaXBlRSa/MVfrZLfC4Tl9Tj/xypxtar5EW0p1iPvPkA0Do=
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr20538465wrt.256.1618925744656; 
 Tue, 20 Apr 2021 06:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210416123352.10747-1-peter.enderborg@sony.com>
In-Reply-To: <20210416123352.10747-1-peter.enderborg@sony.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 14:34:58 +0100
Message-ID: <CAPj87rM9gaPS5SOHo3CKUU=5H0PDaG28r8BXimhVp-wmCbMvWA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Add DmaBufTotal counter in meminfo
To: Peter Enderborg <peter.enderborg@sony.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 NeilBrown <neilb@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Shakeel Butt <shakeelb@google.com>, Mike Rapoport <rppt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Roman Gushchin <guro@fb.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1385376121=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1385376121==
Content-Type: multipart/alternative; boundary="000000000000eda49405c067851b"

--000000000000eda49405c067851b
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Fri, 16 Apr 2021 at 13:34, Peter Enderborg <peter.enderborg@sony.com>
wrote:

> This adds a total used dma-buf memory. Details
> can be found in debugfs, however it is not for everyone
> and not always available. dma-buf are indirect allocated by
> userspace. So with this value we can monitor and detect
> userspace applications that have problems.
>

FWIW, this won't work super well for Android where gralloc is implemented
as a system service, so all graphics usage will instantly be accounted to
it.

Cheers,
Daniel

--000000000000eda49405c067851b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 16 Apr 2021 at 13:34, Peter Enderbor=
g &lt;<a href=3D"mailto:peter.enderborg@sony.com">peter.enderborg@sony.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his adds a total used dma-buf memory. Details<br>
can be found in debugfs, however it is not for everyone<br>
and not always available. dma-buf are indirect allocated by<br>
userspace. So with this value we can monitor and detect<br>
userspace applications that have problems.<br></blockquote><div><br></div><=
div>FWIW, this won&#39;t work super well for Android where gralloc is imple=
mented as a system service, so all graphics usage will instantly be account=
ed to it.</div><div><br></div><div>Cheers,</div><div>Daniel=C2=A0</div></di=
v></div>

--000000000000eda49405c067851b--

--===============1385376121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1385376121==--
