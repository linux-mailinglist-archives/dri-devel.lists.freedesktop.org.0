Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83A2495AF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B689D6E202;
	Wed, 19 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBD089BFC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:19:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p20so18474010wrf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7J/r1E+lQgwxAYRstL7rf8C32+EXOMnod+NMk/hBTHw=;
 b=PJJrwh3oAQCHYtG1D3/AT1wch3gMDb0LnX7tOl5ZAw03jrQv1wjtZ7aq3JFvygskhT
 yKCQx6xLh2ZyFzCCdT7s13ourBuPJqI0znwxo/JMtk46hjxMfSXY2OsR8jHBdTdMyJsQ
 NbjSNCd7MMJPWTuBk6F1DbadYQbVG9LmHt1uQAX5ii3a/b/IH73wobb0eqquCTjZ8ybF
 HpFiUSfJGh7+1hhEMn+VyEwHKWMb8hBWy7XLccGUQjPe9rJCKUluS05i8dikv8mfi1PG
 CtJyBPF2Cxee8db8qdgwaVbB35rLsVFrqA7SO9vsx6XMTkbjUwJTcDbDH6BTvtZ/enXg
 ZZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7J/r1E+lQgwxAYRstL7rf8C32+EXOMnod+NMk/hBTHw=;
 b=GT7h0kuCpgOK7i/tMuq6jX/z5VuW1MKgGIQhcinF6G7izkYMK6mS0UNNcwEJPEqXmb
 orKiT65kSk3rvG+x4kVys9iwoqWqpIIKAkDrBguEYq4oKch298UKANFmQkANwaSzBL9M
 ukOrpJCQI7uyOJQ8MAvTWxd8vOI97Dzdm7TumDfksInsHnK7h0qKevsd1/NHXrCB9b4F
 VmE/zLxvGmz012tX5gKb4XCFlhQuVAiJ+FFua44GqcLekiqNrDtidtTsAcp2Ei3IYfna
 0yI4/An0QMedKSTWJ44+kEUidAxsmxJUU0c27eFV6zTwpuv4fIaBTCAwFoROicvbVJIF
 CwSw==
X-Gm-Message-State: AOAM531KujKhIq3mV5j/c5Beue7Hce+NzgOwfNmcbUpeFZGc9zaKxYz8
 Idg4MM3xBI4RhaP1m1RRNMg=
X-Google-Smtp-Source: ABdhPJzxT9GBf8wTWBH60WuPWnbzAmw2HJeyQL0biUOSzv5uQPE/uCUdy9ZeBHEyX5vDda9O2/QZZA==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr21199676wrn.2.1597760384066; 
 Tue, 18 Aug 2020 07:19:44 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id t11sm32487327wrs.66.2020.08.18.07.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 07:19:43 -0700 (PDT)
Date: Tue, 18 Aug 2020 17:19:40 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/4] staging: android: Replace BUG_ON with WARN_ON
Message-ID: <20200818141940.GA357037@tsnow>
References: <cover.1597602783.git.tomersamara98@gmail.com>
 <fd55c53cb20c4887a87c05fffa28c28a740cd314.1597602783.git.tomersamara98@gmail.com>
 <20200818141106.GB562377@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818141106.GB562377@kroah.com>
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joel Fernandes <joel@joelfernandes.org>,
 Riley Andrews <riandrews@android.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Laura Abbott <labbott@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 04:11:06PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Aug 16, 2020 at 10:23:25PM +0300, Tomer Samara wrote:
> > BUG_ON() is replaced with WARN_ON at ion_page_pool.c
> 
> Why?
> 
> > Fixes the following issue:
> > Avoid crashing the kernel - try using WARN_ON & recovery code ratherthan BUG() or BUG_ON().
> 
> Ideally you can get rid of WARN_ON() too, right?
> 
> Many systems run in panic-on-warn mode, so this really does not change
> anything.  Try fixing this up properly to not crash at all.
> 
You mean by that to just remove the WARN_ON and leave the condition the
same?

> > 
> > Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
> > ---
> >  drivers/staging/android/ion/ion_page_pool.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
> > index 0198b886d906..c1b9eda35c96 100644
> > --- a/drivers/staging/android/ion/ion_page_pool.c
> > +++ b/drivers/staging/android/ion/ion_page_pool.c
> > @@ -46,11 +46,13 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
> >  	struct page *page;
> >  
> >  	if (high) {
> > -		BUG_ON(!pool->high_count);
> > +		if (WARN_ON(!pool->high_count))
> > +			return NULL;
> 
> And can you test this that it works properly?
> 
> thanks,
> 
> greg k-h

Will do :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
