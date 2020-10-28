Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC6C29CF7E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 11:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F38A6EC69;
	Wed, 28 Oct 2020 10:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935A6EC6A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:31:04 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 15so2492721pgd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q2w0GJP+O24zlClsx6Zd9yJQfOlv+kG1yF/TN+Wun14=;
 b=n5x+LUX2iOSa9A1Ozlkg4pr/k5hWJnKWLWekiVdEHyz16IbWcYLK5XhIxltZ7k4Wp3
 vJ6VwZsa2HTmIvjsJbsOaDp8NwxAvELwDzeav6QYQqDfAy7YbNqfa3GrdkRWSfitq1bQ
 JKnm1rC6ubNYvLGylAs8E9v3WRC8dQfrQcUBDi9+m5W2wNEc5WBTFBbZAw1SrNAyQiR0
 985XTzcK7/EGV279NJLpxcy5w2l1x+MFZCueGBlsGvcDAZ3Q/of1Qk2NYPRKkEGnS7CG
 EuOurqQcrXotkY7o+MOGAYUOJtgDlvHXMyCzwZbnwjp6S7+3kQYi7xhqWAynaSWXp0no
 l2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q2w0GJP+O24zlClsx6Zd9yJQfOlv+kG1yF/TN+Wun14=;
 b=qgqVo3L/GnPDD7AB94W5piz7TsGs94OohhiFC5X2XNl4iB99aDJqPr7hOEF+eD0jT1
 mHVXXK8DiNlM+mRYzUQnGIjdRP3kODwjvIxgyQWs01Y04Y8HJrcz2AAexoSueEz1kHTv
 RpEAV0+YzFgwfkzATeOWEnibwulvvuZ7z4fsyfPLFmH16MKbutWLkq+7AVxn7/u8v9zI
 dnhm/e2FsXXtLlqeFxI8MXSjnpCFRxjFXcalKAfpx7s1zxn70l33y71Bo/+fuZmNAanX
 ePITl/ki5BKz6Fak6GQs7t1ZQvvpjG9nLWDRtC83Uyao7CBmWlIpxk1Dl3Gou0PBNeXU
 w+Rw==
X-Gm-Message-State: AOAM5323j3mDcrXCh/DaBEEIqy768uESRjWR/FuSGkYTuc7nqdiAEl8k
 lLZGkpULJ0Dm6qyHA4+0ZA==
X-Google-Smtp-Source: ABdhPJyKmvi+wrim6ggQx3fuKG0hwNY5mHGUXX+rZcx02E6mWjNckXz9MyfFa4GcSkcckzQuBqpKtw==
X-Received: by 2002:a62:b515:0:b029:155:95e8:fbed with SMTP id
 y21-20020a62b5150000b029015595e8fbedmr6479066pfe.49.1603881064332; 
 Wed, 28 Oct 2020 03:31:04 -0700 (PDT)
Received: from PWN (n11212042025.netvigator.com. [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id il17sm4149183pjb.39.2020.10.28.03.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 03:31:03 -0700 (PDT)
Date: Wed, 28 Oct 2020 06:30:50 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/5] Fonts: Make font size unsigned in font_desc
Message-ID: <20201028103050.GA1209391@PWN>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <20201027185058.GM401619@phenom.ffwll.local>
 <20201028054307.GA1205568@PWN>
 <20201028081844.GS401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028081844.GS401619@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 09:18:44AM +0100, Daniel Vetter wrote:
> On Wed, Oct 28, 2020 at 01:43:07AM -0400, Peilin Ye wrote:
> > On Tue, Oct 27, 2020 at 07:50:58PM +0100, Daniel Vetter wrote:
> > > On Tue, Oct 27, 2020 at 12:33:05PM -0400, Peilin Ye wrote:
> > > > It is improper to define `width` and `height` as signed in `struct
> > > > font_desc`. Make them unsigned. Also, change the corresponding printk()
> > > > format identifiers from `%d` to `%u`, in sti_select_fbfont().
> > > > 
> > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > 
> > > I'm not entirely sure of the motivation here ... height/width should never
> > > ever be even close to the limit here. Or have you seen integer math that
> > > could potentially go wrong if we go with unsigned instead of int?
> > 
> > Oh... No, I have not. I just thought we shouldn't represent a length
> > using a signed value. Also, width and height in console_font are
> > unsigned int - that shouldn't matter that much though.
> 
> Oh this is actually a good reason, since that's the uapi structure. And so
> using the exact same signedness should help a bit with accidental casting
> bugs.
> 
> If you mention this in the commit message I think this is good to go.

Ah, I see, v2 on the way. Please ignore [v2 3/5], that doesn't hunk with
this patch in effect...

One newbie question, should I mention in the commit message, if a patch
depends on another patch in the series in order to hunk properly?

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
