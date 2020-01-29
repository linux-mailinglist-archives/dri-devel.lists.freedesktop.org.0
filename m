Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C36114CC2F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 15:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2265D89C94;
	Wed, 29 Jan 2020 14:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BCA89C94
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 14:18:03 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id b9so8892624pgk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ieZZcAiwddRgO1I0z1VjIfd2VtBIxW540IZSnXnxT2s=;
 b=dGM2xrbtbMK7IXKjwz05uLZHREq4IRPRGMaBC8INdXdt9Tw7kwtLHQlJYlP6xqAoNX
 JLSilAmj3EKtOzaFzv3Az/YH00YXiKVeYgZ42ei9ECmOZc0m0Cpftp4BkVdi7qgb7OI7
 wmyeCo2dDJXfZJiY9tz34m1yuSnYLr7fK/GQqBRDOamoF0sctR2FyIx2QQwMDQKMhayT
 UTCd9T056YQAIxEZVLy9/Dev7774pOgpsVK08Vuc5q/CsvB+3UQPJwZn9s9fgJo1ngLB
 seUbANkaefwcgdrJczgTL628chAhCuG71t7N/L+OmOuc7hung7VC5cgZtA+r1cuEIDP3
 ZUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ieZZcAiwddRgO1I0z1VjIfd2VtBIxW540IZSnXnxT2s=;
 b=Yo1dLm+VEvv+rfWhL4NTAFdkxf2SgxewXIs4wHhq535X6YsdeKggvUo9MA0ZcyMR3P
 zEw46J7B5rLz5+Iv71I7d82HKihS7Bgltddfvz7RAAsBJA2wRZ9VDY9j8iIuFHffUXd5
 a7deU8b++qS8x3TVODMort2Hraa7OowJJXOLPD/04jmDx04QnbWkfx47d9kaXy02pomi
 2+PwozT97CXqJuf+hbHNcN6pZv0ZgGZXzSa+SUjXK5vcPR8VhhXjExsSvMfO9ujx2610
 3GFKX4aZPhnbXoFC22uI8CqAKEpRWhuaOEESQf1i15FUYBKtSy/jaSw/zFbkWQifVXTl
 ithg==
X-Gm-Message-State: APjAAAVhIGcl+LMIUPduTN+PHpA3MepTyDjehWabVEYxqBXClL2S8+KO
 HCPZSfQhUwQxytY+he4GTxU=
X-Google-Smtp-Source: APXvYqwCfc4jCxY5BtbthWGX6JJXox9KjSvlQXxmyhs527/tGzSYKdnmWlvaER7eAOW6/YyczwXQZQ==
X-Received: by 2002:a65:4685:: with SMTP id h5mr23680746pgr.203.1580307482770; 
 Wed, 29 Jan 2020 06:18:02 -0800 (PST)
Received: from localhost (167.117.30.125.dy.iij4u.or.jp. [125.30.117.167])
 by smtp.gmail.com with ESMTPSA id b12sm2917846pfi.157.2020.01.29.06.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 06:18:01 -0800 (PST)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Wed, 29 Jan 2020 23:17:59 +0900
To: anon anon <742991625abc@gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
Message-ID: <20200129141759.GB13721@jagdpanzerIV.localdomain>
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz>
 <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
 <20200129141517.GA13721@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129141517.GA13721@jagdpanzerIV.localdomain>
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
Cc: Petr Mladek <pmladek@suse.com>, wangkefeng.wang@huawei.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, anon anon <742991625abc@gmail.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, syzkaller@googlegroups.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (20/01/29 23:15), Sergey Senozhatsky wrote:
> Date: Wed, 29 Jan 2020 23:15:17 +0900
> From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Petr Mladek <pmladek@suse.com>, anon anon <742991625abc@gmail.com>,
>  wangkefeng.wang@huawei.com, sergey.senozhatsky@gmail.com,
>  syzkaller@googlegroups.com, linux-kernel@vger.kernel.org,
>  dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
> Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
> Message-ID: <20200129141517.GA13721@jagdpanzerIV.localdomain>
> 
> On (20/01/28 15:58), Bartlomiej Zolnierkiewicz wrote:
> [..]
> > 
> > Help is welcomed as I'm not going to look at it in the foreseeable future
> > (I'm busy enough with other things).
> > 
> > > (dri-devel@lists.freedesktop.org or linux-fbdev@vger.kernel.org) into CC?
> > 
> > Added to Cc:, thanks.
> 
> Hmm. There is something strange about it. I use vga console quite
> often, and scrolling happens all the time, yet I can't get the same
> out-of-bounds report (nor have I ever seen it in the past), even with
> the reproducer. Is it supposed to be executed as it is, or are there
> any preconditions? Any chance that something that runs prior to that
> reproducer somehow impacts the system? Just asking.

These questions were addressed to anon anon (742991625abc@gmail.com),
not to Bartlomiej.

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
