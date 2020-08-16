Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05202245D3E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005E06E503;
	Mon, 17 Aug 2020 07:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1769A6E365
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 17:43:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f1so12710317wro.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nn0Ssx3+c526gox1QvsdRl3BZJs+iVNQgS1FvYlELz4=;
 b=YuyPAEXgZvzHBK677iO7Tvg89GTdZ024gYRGXwq59GXCRP2Q/bWXdEVPft7Uz4qEkA
 /nr3XuTk6ptczo0FpRsJhpBnwXBrurk1ik23l3/Lo7PUo9pHk210E1SBgnr2CdlhzveJ
 CsA1xsqihHq1g+p92q4hLAJ04FZ4TZCIQljemf4LbYv1Lp2/9PJ5HYvilPCSlnJqhRr+
 HPdFAHXG1MDOzP8wK3XrPRW9eV04LwRicZ4VjfAzxLjl6a1fXmAxydbBBgrmEAZdLx0R
 v63YfugikFVfnxusVnmX8rQ+NpgJ76nnbcj3evqUsLRGdrBv+P/+C9nmDm/v0UkH2qxB
 Y0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nn0Ssx3+c526gox1QvsdRl3BZJs+iVNQgS1FvYlELz4=;
 b=OdDYCiTgkg+p2Ks2aW6cheYUjw65AlFtV1woIdetpw6LG3m+trDYh/Mlz4zz2s7tDZ
 TOn/Z64t8H3SjKUnYDub5TmqzwXCpix0WRo4cFePbKdZd6svVTjAGmsSNe6QECYdF6KJ
 rhiFPEBwXE9slVzf4psDW1E7LFAfK+090tHUpj6oXZ+4yum0dS6TXiQRMrOVUpRNPPqy
 hbElhjNvgTbH0wADBukGc91RZaHOJ4KdMbKiMjkMAN8jVZHdqQN9pVxtdJmOuKr8kJG+
 YWHOxBinBmjnmP9scbh+RTYQeR28JY+ZW+Eaksju4ExXvSyY5LktU2Vdkki6yD8gJgy5
 cKSw==
X-Gm-Message-State: AOAM531hsCaH4Umf6ij6cSGct12KRGbdbUiT2xDMv0gMrBZXa2mW6ZE6
 TZiSMxaeY28CQzxC6TS+X/U=
X-Google-Smtp-Source: ABdhPJxvyqPjh2aOYwOIzUhLE2lT6M/udf3WrdcOACdqp9pQaZlxt1N8eW/LSL2crIqyI/WB7MCKyQ==
X-Received: by 2002:adf:d0c4:: with SMTP id z4mr11608654wrh.245.1597599825799; 
 Sun, 16 Aug 2020 10:43:45 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id y16sm27330124wrr.83.2020.08.16.10.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 10:43:45 -0700 (PDT)
Date: Sun, 16 Aug 2020 20:43:40 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 3/3] staging: androind: Convert BUG() to WARN()
Message-ID: <20200816174340.GA236914@tsnow>
References: <cover.1597597955.git.tomersamara98@gmail.com>
 <8df6206000524d4a0043a7a1df97b2be2d277995.1597597955.git.tomersamara98@gmail.com>
 <df5e2206-51be-3fc7-ddc2-6f318a8e5a1a@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df5e2206-51be-3fc7-ddc2-6f318a8e5a1a@infradead.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:43 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joel Fernandes <joel@joelfernandes.org>,
 Riley Andrews <riandrews@android.com>, Martijn Coenen <maco@android.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Laura Abbott <labbott@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 16, 2020 at 10:34:50AM -0700, Randy Dunlap wrote:
> On 8/16/20 10:22 AM, Tomer Samara wrote:
> > replace BUG() with WARN() at ion_sytem_heap.c, this
> > fix the following checkpatch issue:
> > Avoid crashing the kernel - try using WARN_ON &
> > recovery code ratherthan BUG() or BUG_ON().
> > 
> > Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
> > ---
> >  drivers/staging/android/ion/ion_system_heap.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
> > index eac0632ab4e8..37065a59ca69 100644
> > --- a/drivers/staging/android/ion/ion_system_heap.c
> > +++ b/drivers/staging/android/ion/ion_system_heap.c
> > @@ -30,7 +30,8 @@ static int order_to_index(unsigned int order)
> >  	for (i = 0; i < NUM_ORDERS; i++)
> >  		if (order == orders[i])
> >  			return i;
> > -	BUG();
> > +
> > +	WARN(1, "%s: Did not found index to order %d", __FUNCTION__, order);
> >  	return -1;
> >  }
> 
> Hi,
> Did you look at what happens when order_to_index() returns -1
> to its callers?
> 
> 
> Also: fix spelling in Subjects: android and BUG/BUG_ON
> 
> -- 
> ~Randy
> 

Hi,
yes I've made a patch for that too but it seems I forgot to
include him in the patch set.
I will send new version for this patch set soon.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
