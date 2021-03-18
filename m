Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352F33FD60
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 03:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A978F6E072;
	Thu, 18 Mar 2021 02:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF306E072
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=ZDE7T
 kpNw2HAyd5WKd7F2ZaXSySBRfBW4yjJ09EgjKQ=; b=kSr253wgxZTcZIzg9t/sT
 AdA6BqkuAqCIRhq65VfY4Tk37A2wHDuCASMeHxoRVb1t265dJtG2b4MBfXebQ0wT
 MowRyF07NARpO+IwX/ECqUsEA1/0vrAFDoTv87xzAfz8AHNP8YnVa2OuvJHlwHBi
 y3kxMEjWVZzio8/TjYvlik=
Received: from localhost (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowAC3tLE3v1JgeOlcqg--.1500S2;
 Thu, 18 Mar 2021 10:47:19 +0800 (CST)
Date: Thu, 18 Mar 2021 10:47:18 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] drivers/video/fbdev:modify 0 to NULL
Message-ID: <20210318104718.00005767@163.com>
In-Reply-To: <20f1664e-df4c-d085-cb25-1d05e8a793a3@embeddedor.com>
References: <20210318023329.488-1-tangchunyou@163.com>
 <20f1664e-df4c-d085-cb25-1d05e8a793a3@embeddedor.com>
Organization: yulong
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-CM-TRANSID: EcCowAC3tLE3v1JgeOlcqg--.1500S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1kXw1UJF1kXF47uF4DArb_yoWDZrX_Zr
 4DZrsrWrZ0yr1SvFn7ArZavr98tw4DZws7ZFnFqr93Gry3Arn5Wr1jvrn2vw4xGF47GrZr
 WrnFvFWIyr1S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbhFx5UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiHhdZUVSItUPMzQAAsq
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tangchunyou@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI,Gustavo

On Wed, 17 Mar 2021 20:41:15 -0500
"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> On 3/17/21 21:33, ChunyouTang wrote:
> > From: tangchunyou <tangchunyou@yulong.com>
> > 
> > modify 0 to NULL,info is a pointer,it should be
> > 
> > compared with NULL,not 0
> > 
> > Signed-off-by: tangchunyou <tangchunyou@yulong.com>
> > ---
> >  drivers/video/fbdev/offb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> > index 4501e84..cd1042f 100644
> > --- a/drivers/video/fbdev/offb.c
> > +++ b/drivers/video/fbdev/offb.c
> > @@ -412,7 +412,7 @@ static void __init offb_init_fb(const char
> > *name, 
> >  	info = framebuffer_alloc(sizeof(u32) * 16, NULL);
> >  
> > -	if (info == 0) {
> > +	if (info == NULL) {  
> 
> if (!info) is better.
> 
> --
> Gustavo
> 
> >  		release_mem_region(res_start, res_size);
> >  		return;
> >  	}
> >   

I think "if (info == NULL)" is more intuitive,and there have many
compare likes "if (info == NULL)" in this file.

--
ChunyouTang

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
