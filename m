Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7613D4DF0
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 16:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D846E3EC;
	Sun, 25 Jul 2021 14:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D656E3EC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627221727;
 bh=340oxUqB+pwxiqxWW/cd7DjFI0xOrzq59FIfoXP3S1I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gbvFuDGOyKNCqw5KidhNLWnATQrXYGbCL60RErsLk8WUUv80FI6ipKOydrqL1w6XY
 2xDmvC5Yf/EsHCQVvDue/mNxqwP4idWefRTY5NBrBfoWVmGXt+gNLgTfG3o5JFM0Bf
 kpi/gLgRJ19i3fu6szYRigGoq2qdxdNQZCfzCEuI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([83.52.228.41]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N63VY-1l1VBu38Wm-016S1K; Sun, 25
 Jul 2021 16:02:06 +0200
Date: Sun, 25 Jul 2021 16:02:04 +0200
From: Len Baker <len.baker@gmx.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/3] staging/fbtft: Fix braces coding style
Message-ID: <20210725140204.GB1953@titan>
References: <20210724151411.9531-1-len.baker@gmx.com>
 <20210724151411.9531-4-len.baker@gmx.com>
 <CAMuHMdX6PUr0irndogg=Aa+AFDdiDJMeMWM74mLBkuLrW+zWng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX6PUr0irndogg=Aa+AFDdiDJMeMWM74mLBkuLrW+zWng@mail.gmail.com>
X-Provags-ID: V03:K1:3Eg3v7AELPHXFdoJHGTE5b05uHbis/dRr8ApGFt/g1+gkHNbSSg
 KSHc03AunknsizsegEZKOcG0miDl6Ne1a/radEDdbQ3VP4TJhjoU5qW5U8qCJTxKuJ9qiva
 u91KUIi8wpJOrhsSZLaBz9LJvnmmQNbtRhlk32j3azogf4uNS4mIs7R/t7MeP1II6juDyTl
 K7VvjSL0a7vD9NSEJW5tQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2xiUjm9aORg=:xoqOPOdWGflIJ4WGEGkMFX
 bOCy2BhOi925zBfTtkX8yYLF6T0iQXo9hgeFgB7zzS57DL2EK8UXbCD5MVSiwZwmpT8KTOQBA
 Aj9KHT9jfQ/5a03etCykDe7InMaDfoE0e+rVV7EA+FAa5RrCkfycn7vKCTtzM8YG1qsSy/v47
 KuV1CzL/dLjXr4qKwIbP6MCICTkDCsqWtz1H7C2zCAsbQqWYsXc94T7k4gEMVPoMmRC+QbTxz
 vgtNrbOlVnCWIj5cdXXmlQRvGoWhaTs2G1+xo7egfgnIZmIi36FKVHP9RYdqbTwokJXR66gyl
 aZ2XMylFK2Xt30NYSv+Fzo2ookmxTz089a2UJCs2yuiyYRoA+wNdquQ+ocIhv4xWt+pGBh/Fd
 AtYzoJIplwayVMRtJWx5ZAS0MwGc4tUhKTyHrEPOtEmi4fcf/SXij4pgInsyPaOXYxNL9tBPq
 CBIyZffZ0PA5UaL5e4YQ1nAjVuJRB9V8bhcdHKcuWgBmS51Q8MM862KLT5a0Ey5RSA/sYh0X0
 o+87gwdZSFKmPPRxQhIfjhqhq67xRI8Cx/bDdkJ5brFj0wusgnhD36MsxEyG+O9RlZMVM+q0O
 nFLTcLfjLIMT8Qu8qjEhdxBemT1GibOHaL6HJXztsP2dZoDDv5WjUkyTn8zD6Yaxg3ARt5lCz
 McCFp0E33C+bfLtkUrD2KEf1nsHyL9EUshkWLDI/6zXR67tP8FYQbRvUXGTSZZUNi9sHLylOE
 8b4YFP4SpcCLCroz/O0eQjtN3/MnThINO7+amlF9yEidr8kSRRLSDaRqTXEK0CWOeafkxMLDf
 YodzEnnsa4gMtiSHFU35RYzg48rqs/KTPE4AxCSg0Zc3KD4+v36A5qwFpgIjsqkSdveL2vBi6
 GO3cYaaUy8R65Efn935qlAYLej8IkvF1AMKMEpSxo7scDuTlRUlzS5x+CNfEAX/o4P/KOztin
 UVi3vlWtKghw2Ox0F8zStg+7ujU6rcYNOPgWHQVUzlYf6EWwmHQN++7GpgHYuDtQeeGbsgZ+F
 0jPEjxGjvP3CHbOF/tu1EgbtJITWkLEZuJ7l7X1lMI+/AF5CqHv+fZtbtVJ0FQR2z7T9JCJuj
 6dQnNQI8bD4bJ13eAPboqYD+k5iqbjPtrQI
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Phil Reid <preid@electromag.com.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jul 24, 2021 at 08:01:53PM +0200, Geert Uytterhoeven wrote:
> Hi Len,
>
> On Sat, Jul 24, 2021 at 7:44 PM Len Baker <len.baker@gmx.com> wrote:
> > Add braces to the "for" loop and remove braces from the "if" statement=
.
> > This way the kernel coding style is followed.
> >
> > Signed-off-by: Len Baker <len.baker@gmx.com>
>
> Thanks for your patch!
>
> > --- a/drivers/staging/fbtft/fbtft-core.c
> > +++ b/drivers/staging/fbtft/fbtft-core.c
>
> > @@ -1016,10 +1018,9 @@ int fbtft_init_display(struct fbtft_par *par)
> >
> >         i =3D 0;
> >         while (i < FBTFT_MAX_INIT_SEQUENCE) {
> > -               if (par->init_sequence[i] =3D=3D -3) {
> > -                       /* done */
> > -                       return 0;
> > -               }
>
> These braces should not be removed, due to the presence of
> the comment.

Ok, I leave it as is.

Thanks,
Len
