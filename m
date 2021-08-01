Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A13DCBE3
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 15:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3176A6E0DB;
	Sun,  1 Aug 2021 13:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA7A6E0DB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627824855;
 bh=Q/dcoSBUFR0wkRhCtWTaj2W+MgEtc+eWAxQm14Cb/Lc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Off6RzThUjmsVS5ZtJbBRxOQDs1SmQwvn5QgY962YAs51ZTpHFTowGf1WC7Ei1FAO
 yIsLbSD75IwpasBqZzSHf8B3RNpo/KIhdE5OUeudiX0TcD0ev5fX59X2wy9G2J6gDQ
 0Zw8MorDm7sIK2BTzWyeyN2KE+3o59A+bpzyhJ3M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MKbkC-1mSxyd2auy-00KzLZ; Sun, 01
 Aug 2021 15:34:15 +0200
Date: Sun, 1 Aug 2021 15:34:04 +0200
From: Len Baker <len.baker@gmx.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Len Baker <len.baker@gmx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
Message-ID: <20210801133404.GA5988@titan>
References: <20210801085155.3170-1-len.baker@gmx.com>
 <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
X-Provags-ID: V03:K1:4+Pp4U/a3eSnM89ROA2oEnBRHBcVjHUvh/sOFYn7YGYbhQXrOK3
 gIIzhRk1TOmkGk1sFHh2YVEYJjCu1Qso3Id/QdM0w58LyJbBIhqgHBWjfnAfzaG4/mbcDJZ
 rEwEZpDxC59TL9nSjLQbEIHAXdSmp47hSiul/4wX3151mcV8guZYKlnDmYdVsx1rnIhtdQT
 daY6wAb19kHUDxREuLOPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TOOnf/w1Jdk=:/0N54ezEkdw4FzS5U1m82p
 BYkyYs7ZB1sM1mtlLA0StOdcoX20D8NuiciAiVB1x24xveLcMHpzYqSNLknYDh5fiC36Ymu1d
 aGGW+Wb/gItkYj7w7T/TvYKhHJo5RaggnRNq9EuP+isCSYxLMQjU1l5r0jLNHqhGuY54S+M6s
 GEuM7J8VgACMNJXe+jxdYV/0ctHImxvZvJ/8GJNhxXKL/GMXQyAdjj1rf9e7Yj+Yt/vLbwVhK
 zD3NxNzjUReXeiiNhdq/m/USxW6uVPzV81hzEiEfFbXTZHsmQVIxD5k9Z91jgIEol5Xzhpwcj
 fNpnF35tBur3M8z3KHdGwNBtDkcQ6Zln9DnWFv1eu4dMiVlRVTcXfi9kYfouWARkr/xoXtgft
 R/1bRFS4r3zIXc23nbFniqL8J7YtO2ndH8p4EhaQLFG4CBrPOkZ+DQ3ZqshxSUjrUuO7uJSJ0
 vLb/B2OasUxn9GRBsA55qM0W2XDrlSQgtj3Hlw1lof54FUl3v4wg0K+ijPJn7jED2NBk5Wfks
 Z6GiZyKgnbShIJtW0mJGhF67ilRyNcNCWV690KUwx8zuSs79kgooEWfKaYy2ft22t1EW16y1S
 /MzYEzm9TdqzlPLVnZUS92b6JquQ0Fv80XAhF4O0FnWVvZGUw3lPbBPME5tYgxL/JocyVlkCh
 Zb4JtUtirKOARRBCAAjwltLdi4EAT77yB4COqp4/J/SnQcRa7pbeUKd3Al3rHMq82SJRSSR/B
 uUgHP9pKS2PxZ6Q7DENJKkbcOjlU9mxdlKnK33dd9uJTeINI2HZ2/79pbUhJtwY0+8hnglrQ7
 Fw8ZVHQJkEltHq0WRJhT6anNebqQseQsc0XUKCgt6kRvWuKEs+91ULK2l6h4BnGUCJ/B12CWu
 oFnPz6y/kv+U0Ayodd7JZ/ifwMSwlZF8SiEb/kDTIpqhAAq3+7QodfQD0/1F4z6tuyM9HnD3W
 QtUwfJlG8/tSawhQGkbOmF+k1dwvlbkcXX0h8Bm5E1D5Y0GZan/D6Y7JlG/5grkZlwvccCHA3
 9kZar2RXyi+uNWu06pHCcsCBz60mhQie9tv8yABFEhyZug7RI9pxwRBYpDmJS2CmEraVnICcO
 BcTCpHvPf+Gzcu2uDSLHe7cAK7zfZ+wdGUO
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

Hi Andy,

On Sun, Aug 01, 2021 at 02:40:40PM +0300, Andy Shevchenko wrote:
> On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
> >
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. So, this serie removes all strcpy uses
> > from the "staging/fbtft" subsystem.
> >
> > Also, refactor the code a bit to follow the kernel coding-style and
> > avoid unnecessary variable initialization.
>
> I don't see patch 3 (even on lore.kernel.org).

Due to my email provider restrictions (number of emails per hour), I
need to send an email every x time.

Regards,
Len
