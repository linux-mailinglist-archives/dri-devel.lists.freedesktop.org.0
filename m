Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB742AD76E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 14:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8371089916;
	Tue, 10 Nov 2020 13:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69F989916
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:24:54 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id v12so11397223pfm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 05:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S+QrV5GbdFaGhruHIUGFYEWHi77tyozQEbntZ4ud6Fo=;
 b=k+zWxG1uer0ohn+xFxeIJ/v6PRprgpVH7sP4/vCcDZiVHY0DRsZE88ksmsbgx/AFAm
 GBB9oNMYJebK7UfbCk638xXbMbs8VclMcOHJpe+1I30eXa2co9zrHBfmkOt0HqX1ijBn
 YMJQsO8b40szqlwuGm0jDszq6ZkjVZuG4bqgj3id1hVqQbA5IAKPn/VomPV9CEnRR/l5
 Af9kYOTZ7/2ilBcD5BQiPLtHJzrS9xlGEiCRNoryk3Ie4iKs3bP+pZRWFI1ZGNeYjtNF
 pUIc4hdZ5NuWm6v35CoJ4jrRNvX2cUlm7elN7sw7iPa3Fmy4uH0LBsLaBidK73W6Hk6r
 63/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S+QrV5GbdFaGhruHIUGFYEWHi77tyozQEbntZ4ud6Fo=;
 b=rvVCFJdlUIHm7Avv/vmaIWhSwrohxadr2aKLxOyBPwBb6XmNAZWGNqxN9tdjVMI0VZ
 yrvuQBjOkZ3gkHjtaHwPVqaZTyuFq8K/1AspQAKN3IIO0UzBLXIERILabB0fNLX2v6/z
 PZfG8VFNPyB2wCwZJr7AkEYLtkyn2unjK1dL8NfhE2ZIN7G58WpOSta/zvG4vFqBNdGE
 MPzfPtQh8vTogIKGawc5CVYGKPe4Na2L0zjMRVHG54AaXNzJZoI489gsp1OVQcEn8p0M
 XdYCzVZUcjsa0i86SJXrGntzW/ZKVB4B5BFj4+NAy6zsrx81UbQWj3z5k+texJTLsDMC
 PXhg==
X-Gm-Message-State: AOAM533Cb/5dKtuf1z2/55JZ3MX8FRYYWjd7Ch5nEFGAQ3npOCn5SIcT
 oDzCmQbdysGvSkyIhIeiwQ==
X-Google-Smtp-Source: ABdhPJwolrm32K/4m+gVTu/aqACBTH40DteoL2hIeqoeqD/xwkyyaUXnbYbOTqSNWFOpNaBr+S6VKQ==
X-Received: by 2002:a17:90b:e8c:: with SMTP id
 fv12mr5145898pjb.196.1605014694293; 
 Tue, 10 Nov 2020 05:24:54 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id z12sm14816996pfg.123.2020.11.10.05.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 05:24:53 -0800 (PST)
Date: Tue, 10 Nov 2020 08:24:45 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <20201110132445.GA2483842@PWN>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <20201106105058.GA2801856@kroah.com>
 <20201110124946.GF401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110124946.GF401619@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 01:49:46PM +0100, Daniel Vetter wrote:
> Peilin, can you pls resend this together with all the other pending
> patches from you? I think that's better than me trying to cherry-pick the
> bits we decided to keep from random places.

Oh, are we doing an -rc3 backmerge soon? At the moment I can base these
patches on neither drm-misc (due to the font_copy removal), nor mainline
(due to the signedness issue in font_desc we've talked about), so I'm
waiting for a backmerge to rebase everything properly. Sorry that I
didn't mention earlier.

> Greg, ok if I just pull these in through drm-misc-next? It's a pretty bad
> hairball anyway and that avoids the tree coordination issues. Only thing
> that might get in the way is the vt font_copy removal, but that's in -rc3
> so easy to backmerge.

I will rebase and send everything (including the font_copy
garbage-collecting) in a v3 series after the backmerge. Thanks,

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
