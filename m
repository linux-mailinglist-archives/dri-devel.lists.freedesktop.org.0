Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4C1D4644
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A96B6EBEA;
	Fri, 15 May 2020 06:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BFA6E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:29:07 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id m24so9652412vsq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p1lONUYS35pbs4qYBDMBnJb/K3YSHMVhu2z12ZOdf/c=;
 b=ulh7dTAwdni5Up4q3udCexKlA+VczFxB/1095liEwYFf90iV58bL/qtKzojJvEZZv2
 ejexsQG4bIwu4WAmkFzZQwvSpSoDDcICHZeZalGQzEaI45o4A509s+FO7/bjemQvNpVp
 ixPeZmcgUfLgPNUuQI73SCccYytj1p/6wxBL+xMHe9MnVhKENQIaHLhgNtq5bYKsUZok
 L9m20a8Yzh0r/e1DtH3tfoJ4GKeTpnCVH4e2bH28tYarv9Tojl9yHaFjRCEZPjvFZM3v
 v4mTglKX0BVaHfsALST9AtSUEyPW1/+RWtIf48j2wbt/RfTDv5Igherll4n1TqB7n6BF
 9p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1lONUYS35pbs4qYBDMBnJb/K3YSHMVhu2z12ZOdf/c=;
 b=O8wAkqwYi0iX+FLYyCbu0m7qSz6YqBwg0rxQ3N1qpfOMSgfqmIMRo9U+CAtaW0ICE0
 K4+90NABxl3iXgArWhhhLc01thHV7sOs3WkKPswBTRRENlXHmSELUf8fcqIm1JWgCpBT
 TOPG/cHJ2KeuzIS/0nrGSCAzspqtQnk+7iqvAvcwtZ5PgUDdNHPTQjd6qKCb+EA6nbzn
 sRA6NMv0D4sGf86JAd72ZjOy8aznJP0/UgfMlHzL6jt7ZUpWV9Ow2XiGdCibI/42YweX
 NKXguZordIbRxWzgqAiKIIWQ+bzdyNG3HEU5i2OtCI9xOF7OJnqU1G1Wz6h9Jht/sNlW
 y7AA==
X-Gm-Message-State: AOAM531U7YgpkrQBBKda3Z60zjaiDYIHZTBXpxYjp9tAyLDTmRKzN/rk
 MGY4yOGodxAoTgI1jQc7FysnV4XdNsXyYHh7eA==
X-Google-Smtp-Source: ABdhPJxN+ZabMzgtnu78B9DAsD9kAikPCqKO/zHwd+iX8MpwMH/1zQp9Sk7Jv8TcKmHRsotNeZFCe8M8Hh9VDrsQAAg=
X-Received: by 2002:a05:6102:22f7:: with SMTP id
 b23mr2784022vsh.172.1589362146397; 
 Wed, 13 May 2020 02:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
 <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
In-Reply-To: <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Wed, 13 May 2020 10:28:54 +0100
Message-ID: <CALjTZvZNb-KbdZwM3kLU4yK8zH+NSh35k=iBtfGJMF1xyjpSFg@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 May 2020 at 08:19, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> i915 is even worse, we manually mess around with clflush. In
> userspace. So really there's 2 axis for dma memory: coherent vs.
> non-coherent (which is something the dma-api somewhat exposed), i.e.
> do you need to clflush or not, and cached vs uncached, i.e. are the
> PAT entries wc or wb.

So, the PowerPC AGP GART ends up being cached and non-coherent, right
(assuming there's no way to set the page attributes MTRR/PAT-style)?
Would something like a fixed memory carve-out help in these cases
(like CMA, but not allowing the CPU to access the reserved area)? Not
that I expect something like that to ever be implemented, of course,
just curious to understand the requirements.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
