Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309814CCA6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 15:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C698D89D8D;
	Wed, 29 Jan 2020 14:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFFF89D8D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 14:40:55 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id y8so4573pll.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JvoTSG0VTvs6pJMcpuNeyCO599C87Lk3Oo9v+qxULZI=;
 b=blg8gwsapzbY2PNjCATaR8gACZe4IAbMvIOPlaVwZBVD+KK+/DRYL5ZRX7kF54mC3a
 0fudadBagP03wxrtq0bOFzOmazsOj80LePzcicX65cKWQewU1WqfC8hPl4JQgHYn3ZFD
 lilBxSeLwnsbY/Kn8KQCZEBRzd6zG7K72A9B8nknpGeAwGG3BMr5pr6n0yDJnxJ8K8yd
 H560zsGnT5Hlh2YKsErc2ue0CV6BbGg5XmqwQ/ZH8wmJ3D4mXX/q0gyEm9bt+ytH++rV
 zji6ig7TkU6ron1fTOW4QSekxzr9iRzpuV0JGz9IdJ08IJQk8gKk0SzDJi4GCNz4Z11l
 4v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JvoTSG0VTvs6pJMcpuNeyCO599C87Lk3Oo9v+qxULZI=;
 b=M17kcVh6z0n0er5NCIe2sxXmn4Kae/Bp8gW5RCxzAArYE4vySPaljFEFnaaGbqAJF1
 Fn4x4eodjoW6ehomtxmoBYfifmm1WXLpwz9YiQdV8kTiKhWG3nsSCQv9rnX6KGsj3ZO3
 bWFhAc9VGr4uj+U6wOXzGwPoaTnqjpdZxe5nlPy6i/oceehOrqsXUZcb9PsWAzEt9JcH
 V9vDjbXR2b3eGPDfhgjQeue8GYdPNRPDaJIamS1FFVysMAOplbbN0wHq/PW171vc0USj
 LzMS9E56yNv7jfsq1hjSqojj6GkZ8+TZRBnY+wZbVC81tyLnOxYK/cuC7gApya23bOTt
 vRBA==
X-Gm-Message-State: APjAAAVyx6MDdjcvBWyAVTvQctS/DgfHC5fR/ZgGWRRARq4JmHzdJwHt
 Dt93XtoaHUczn2h12NLraR8=
X-Google-Smtp-Source: APXvYqxYEyfC9oqU0Z47wPGTFSxtroHT+AOWj1ahbryAH1H5ZIJWeQqJn6nq9evPrLs8x+gGJZ38mA==
X-Received: by 2002:a17:90a:a416:: with SMTP id
 y22mr11586404pjp.114.1580308855223; 
 Wed, 29 Jan 2020 06:40:55 -0800 (PST)
Received: from localhost (167.117.30.125.dy.iij4u.or.jp. [125.30.117.167])
 by smtp.gmail.com with ESMTPSA id x10sm3134798pfi.180.2020.01.29.06.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 06:40:54 -0800 (PST)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Wed, 29 Jan 2020 23:40:52 +0900
To: anon anon <742991625abc@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: KASAN: slab-out-of-bounds Write in vgacon_scroll
Message-ID: <20200129143754.GA15445@jagdpanzerIV.localdomain>
References: <CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com>
 <CGME20200128124918eucas1p1f0ce2b2b7b33a5d63d33f876ef30f454@eucas1p1.samsung.com>
 <20200128124912.chttagasucdpydhk@pathway.suse.cz>
 <4ab69855-6112-52f4-bee2-3358664d0c20@samsung.com>
 <20200129141517.GA13721@jagdpanzerIV.localdomain>
 <20200129141759.GB13721@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129141759.GB13721@jagdpanzerIV.localdomain>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, syzkaller@googlegroups.com,
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc-ing Dmitry and Tetsuo

Original Message-id: CAA=061EoW8AmjUrBLsJy5nTDz-1jeArLeB+z6HJuyZud0zZXug@mail.gmail.com

On (20/01/29 23:17), Sergey Senozhatsky wrote:
> > Hmm. There is something strange about it. I use vga console quite
> > often, and scrolling happens all the time, yet I can't get the same
> > out-of-bounds report (nor have I ever seen it in the past), even with
> > the reproducer. Is it supposed to be executed as it is, or are there
> > any preconditions? Any chance that something that runs prior to that
> > reproducer somehow impacts the system? Just asking.
> 
> These questions were addressed to anon anon (742991625abc@gmail.com),
> not to Bartlomiej.

Could this be GCC_PLUGIN related?

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
