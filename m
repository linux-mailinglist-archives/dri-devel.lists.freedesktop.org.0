Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC45F2C9E98
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87276E51A;
	Tue,  1 Dec 2020 10:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33716E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:04:12 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id x15so1111695otp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 02:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=33/zkU0aBUbm6IWtg6RLVv0ESfiR5fSbnSusLdV9U28=;
 b=G0+nZemJpfABRr8a7b1eByhc6uhcVo6zsElrKMWHFxlZD+pLmEtjR2R59L01CQTmgO
 11NQOeiE3lZpqrLRN0KMSN6XGUyuxMo6oXInOnpnVf+0eN+M4aItZqOBobKdmDBPfGWL
 g9XvkWlzK3sCOIQew6TAJ/TLLTZXRaDqP9Zy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=33/zkU0aBUbm6IWtg6RLVv0ESfiR5fSbnSusLdV9U28=;
 b=ZcVBYNdo4cs3JSB/xzbYuKwbbyNtcO3wkhYsHT7o1Py0I9qwxaX+BRWdvgfRVP3fNy
 jRRdSFa0HjrJR8daj/5dm/mJABIPlH9KOqCw+G+8SgC2f2qu5JiDnAZHWpuSAF/bNxIq
 CPsaR+AfTVeOhdCUHKEnP8KlLJlaIiUmMu3ns56CDf6JqsSvPv5v9QXqvoaY0tMmgCWQ
 TLCvLOgf04fUBgnH4uN9Vgwt6+Wi9qUS50ztBTiUrJvXptG5YiUq+XxGHqeIK94m3ZO0
 clBFTOYxO0f7TQ9wy2OZ8I7OtJDdXJGEasxbJAq8R3hQEp8gEEprh6muNhvJMKJDCR1V
 VC/Q==
X-Gm-Message-State: AOAM531sl5QWyPghTBRW1S26I9kdyvPwJoV/qSeAgHiU2ekWT9CKBaV7
 fL9RFqmXD+5+j0WSDTofFb2VYRz6aH0ul6AUrdU/MR3cw6c=
X-Google-Smtp-Source: ABdhPJzqOqsKVD+FVmIaGGSHLAUt8mchKo3H7Mm8FVT7YBHYWw6zIst2LgZAOvDrbg95Sm8xGEWCTlx1bkkp+TClhn8=
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr1325493otf.188.1606817052174; 
 Tue, 01 Dec 2020 02:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-14-sam@ravnborg.org>
 <53f3e91e-d8da-bce6-878c-7842250a7a7c@suse.de>
 <20201130183549.GA1498572@ravnborg.org>
 <20201201084718.GF4801@dell> <20201201090745.GA1980788@ravnborg.org>
 <20201201094629.GG4801@dell>
In-Reply-To: <20201201094629.GG4801@dell>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 1 Dec 2020 11:04:01 +0100
Message-ID: <CAKMK7uGUJbVRVTO8xL8Kc8BbYMXzqS2KAVYL8bgex3Zz=aF9EQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/28] video: fbdev: riva: Fix kernel-doc and set but
 not used warnings
To: Lee Jones <lee.jones@linaro.org>
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
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 1, 2020 at 10:46 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 01 Dec 2020, Sam Ravnborg wrote:
>
> > Hi Lee,
> >
> > >
> > > Cop-out!
> > >
> > > Do what I do and make something up (joke)! :'D
> >
> > If I thought anyone would actually read the comments then maybe yes.
> > But I assume that apart from this thread no-one will read it.
> >
> > >
> > > > > Well, it fixes the warning ;)
> > > >
> > > > Yeah, I could not dig up anything useful to say here.
> > > > Was tempted to just drop all the kernel-doc syntax but that
> > > > was a larger change.
> > >
> > > Did you trace it from it's origin down to it's final use?
> > Yeah, but not something that seemed useful.
> > I could have added "translating from pixels->bytes" as they
> > are described somewhere else. But I could not convince myself
> > this was right so I just silenced the warning.
> >
> > The only reason I kept the kernel-doc in the first place is
> > that I am told some editors use it.
> >
> > The only effect the kernel-doc in fbdev has right now is burning
> > effort that could have been spent (better?) somewhere else, and
> > I would personally prefer to drop the kernel-doc annotations.
> >
> > But I already discussed this in another thread (not fbdev related)
> > and I was told it was useful for some, so it is kept.
>
> I personally think they should be kept.  Despite not being referenced
> by any kernel-doc:: key-words.  As you say, it can be helpful as an
> in-code reference for driver writers, people debugging code, et al.
>
> Not sure I would just repeat the variable name just to silence the
> warning though - that is definitely a hack.  In the thousands
> (literally!) of these that I've fixed thus far, I haven't needed to do
> that.

Personally what I've done is to just remove the kerneldoc marker (and
anything else that's obviously wrong) and leave plain comments behind.
At least for old outdated code that no one actively maintains anymore.
Keeps the comment as maybe something useful, and avoids pointless busy
work of inventing kerneldoc which might or might not actually be
correctly describing what's going on.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
