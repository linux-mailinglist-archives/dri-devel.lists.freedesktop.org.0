Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953DD27812A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AC56EC09;
	Fri, 25 Sep 2020 07:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18C86EB40
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:30:48 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id g29so2119961pgl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yanHGoZJj/tcEI8AVG6llL0fhzRiqvwYaviiL5Ezz3E=;
 b=ezNq1DHk4aNb+MSOycaRr9VWUq1Qil3Y4UoOygCV1AX9tQN1xlt+KEI3xDsK4hm60D
 GFOugf47Qt1NC/tZueImMyAiEYCqCXEP26A9qXOgblPKBalIb6Fp+r87y8OkF24rtv2e
 1p8+WnTVov6uGi64oLAPHumRF4sskzWR3wFGEG7DiUIf0lWJQ/c9yG+61mFwp6K+kRct
 gm1ASwt/Tj9es80OzDDvf30uxyZ46OdNkhAIf6Md/MCZVpqREZu7gKj3fZk4H48JYKBB
 zbO82ZiSr+J1f1iAwv21h7zWDDL6cm1AKIL97ZEhHahS4+3ZCOZuy1sGWtGq/PVX+nZB
 nQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yanHGoZJj/tcEI8AVG6llL0fhzRiqvwYaviiL5Ezz3E=;
 b=hZ3CutFH+sNZZ6VdRUdeOk5K77TMshSuwH6NPPUgls/01RgfVsXfjOahfTqh+4fEEB
 cFpKc7/UDE/yjgPCcryTyOIhk2JW/Ay38yW/zjmH23u6GGrZGYjzz4ig5BygEwdIdSTF
 qE1UJDqCGo5o9fBndBxwa5R+aY0IpAqG2Gs3DwsGC2a6GziEptd7p8rsFGhOzbc6/zpx
 UaWVWazYaRjju1RWMKZtWbN2HfHIdRStIJX+g0V2p+IumtkHKIf4oTJ1WS3opUsoW0+3
 kZqgRZhd0e35bCnXU1zy1cb6rbJEJ/9kPIDgxfN4A+gaHMxMt6v/jzdqLUJhJ0j1Qlol
 qGkw==
X-Gm-Message-State: AOAM5336AJU+1fIfkUSYij/t/kmKKSfsGt+XCAdbvFtBJdRBbT7RXh2u
 kqp/SKd3w8iiwGkf2nhH+Q==
X-Google-Smtp-Source: ABdhPJwqZfwiI24nj6maCQ3FVjnC1hLBovtP3quILpVSg5gXxUjuwWRHxbd90tmjpkb4DXHr/yYuNA==
X-Received: by 2002:a62:3812:0:b029:13e:d13d:a062 with SMTP id
 f18-20020a6238120000b029013ed13da062mr4689781pfa.40.1600961448347; 
 Thu, 24 Sep 2020 08:30:48 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id u2sm2825443pji.50.2020.09.24.08.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 08:30:47 -0700 (PDT)
Date: Thu, 24 Sep 2020 11:30:35 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200924153035.GA879703@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
 <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Thu, Sep 24, 2020 at 02:42:18PM +0000, David Laight wrote:
> > On Thu, Sep 24, 2020 at 09:38:22AM -0400, Peilin Ye wrote:
> > > Hi all,
> > >
> > > syzbot has reported [1] a global out-of-bounds read issue in
> > > fbcon_get_font(). A malicious user may resize `vc_font.height` to a large
> > > value in vt_ioctl(), causing fbcon_get_font() to overflow our built-in
> > > font data buffers, declared in lib/fonts/font_*.c:
> ...
> > > (drivers/video/fbdev/core/fbcon.c)
> > >  	if (font->width <= 8) {
> > >  		j = vc->vc_font.height;
> > > +		if (font->charcount * j > FNTSIZE(fontdata))
> > > +			return -EINVAL;
> 
> Can that still go wrong because the multiply wraps?

Thank you for bringing this up!

The resizing of `vc_font.height` happened in vt_resizex():

(drivers/tty/vt/vt_ioctl.c)
	if (v.v_clin > 32)
		return -EINVAL;
	[...]
	for (i = 0; i < MAX_NR_CONSOLES; i++) {
			[...]
			if (v.v_clin)
				vcp->vc_font.height = v.v_clin;
				     ^^^^^^^^^^^^^^

It does check if `v.v_clin` is greater than 32. And, currently, all
built-in fonts have a `charcount` of 256.

Therefore, for built-in fonts and resizing happened in vt_resizex(), it
cannot cause an interger overflow.

However I am not very sure about user-provided fonts, and if there are
other functions that can resize `height` or even `charcount` to a really
huge value, but I will do more investigation and think about it.

Thank you,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
