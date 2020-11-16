Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF42B4963
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 16:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A8489EAC;
	Mon, 16 Nov 2020 15:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C6189EAC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 15:34:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so24138424wmm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 07:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=bftfhnX/eEwrSLEmEZfOTDJhOE+yWsLG0tNmcvU7v9E=;
 b=fYbtOv2CeJtUdxBkmjy1CRIrtst5PAeupiQlzB2MeNjjoMegwo0SgZEVQkQdQ43obg
 X+DUfSWkUXn+hncJ4JX4zYyvXil9jKWfKTHhHIBw757ucMDEKevCM7NnLjGTvA6SeOGP
 u9g6Br/jg48FNO6DoFVwX0/csmOtsw3XQMWjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=bftfhnX/eEwrSLEmEZfOTDJhOE+yWsLG0tNmcvU7v9E=;
 b=nIqRXTal6V7TNm+qMdxzaKGKe2IzY7fi71bYqg5Zybqb/rEeHkuakbn9Q5gjZt8fSS
 BdGd7Fnl+32PYgQ59xnArx26llLCK0LaWnMhP7HMiY710UsHKp2iV+Gl86CfXamz174/
 hI4wnMp7dxmw4a82o8nDrxDCd4f+YH5jNESsGRxSvOdyxLUgB+mbYSC1M4NATBH9DwJR
 tzMibmKxJaxQh0Vq2nsBLnSDWxigFPDWX2FN3rhpWwQTp6zQ3BMaSpkAR9pH7Uq8M6ze
 JOXEe1VtTJ/kXZ7FuFilwv3RUCM2YFKRQzHor1sNXfJfUdEfmwSts6LdJDF7nlJd+fCY
 J9XQ==
X-Gm-Message-State: AOAM531G9N6fEDf8ItYfcgflwWComR5eMsbadamZjWZIAK3TNSGwWhpc
 vtQ4XOIzgwslOS71V8lx2VHFyg==
X-Google-Smtp-Source: ABdhPJwRHdcSIoZEQay/4i4vu3XsVboTEU14GHj8xaq/PyiThVNWOLos8TYaBnFM/vBqNuPVAAftyg==
X-Received: by 2002:a7b:c772:: with SMTP id x18mr17074781wmk.185.1605540840938; 
 Mon, 16 Nov 2020 07:34:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x2sm17710549wru.44.2020.11.16.07.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 07:34:00 -0800 (PST)
Date: Mon, 16 Nov 2020 16:33:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <20201116153358.GB401619@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X68NFzaAuImemnqh@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 11:47:51PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 13, 2020 at 10:16:33PM +0100, Daniel Vetter wrote:
> > On Thu, Nov 12, 2020 at 07:02:21AM -0500, Peilin Ye wrote:
> > > Hi all,
> > > 
> > > This is a collection of some miscellaneous clean-ups for fbcon and some
> > > console drivers. Since v2, I rebased them on linux-next, added some
> > > Reviewed-by: tags from Daniel and Greg, and rewrote the commit messages as
> > > suggested by Jiri. See [1] for v2 links.
> > > 
> > > It does the following:
> > > 
> > >   - Garbage collect KD_FONT_OP_COPY callbacks since we disabled it
> > >     recently. Mark it as obsolete.
> > >   - Delete dummy con_font_op() callbacks. (Reviewed by Greg)
> > > 
> > >   - Add a charcount field to our new font descriptor, `struct font_desc`.
> > >     (Reviewed by Daniel)
> > >   - Do not use a hard-coded 256 for built-in font charcount in
> > >     console/sticore.c, use the new charcount field of `struct font_desc`
> > >     instead. (Reviewed by Daniel)
> > >   - Similarly, in fbcon.c, avoid using the magic negative-indexing macro,
> > >     FNTCHARCNT(). Set `vc->vc_font.charcount` properly and always use that
> > >     instead.
> > > 
> > > Daniel, hopefully [5/5] removes FNTCHARCNT() for ever, but I have not
> > > tested it sufficiently yet. I remember you mentioned elsewhere that
> > > "fbtest.c" is insufficient for framebuffer testing, then how should we
> > > test it? The first 4 patches should be fine.
> > > 
> > > Please reference commit messages for more information. Thank you!
> > > 
> > > [1] v2 links:
> > > 
> > > 2/5: https://lore.kernel.org/lkml/c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com/
> > > 3/5: https://lore.kernel.org/lkml/20201028060533.1206307-1-yepeilin.cs@gmail.com/
> > > 4/5: https://lore.kernel.org/lkml/c38042bbf5c9777c84900d56c09f3c156b32af48.1603788512.git.yepeilin.cs@gmail.com/
> > > 5/5: https://lore.kernel.org/lkml/20201028155139.1220549-1-yepeilin.cs@gmail.com/
> > > 
> > > Peilin Ye (5):
> > >   console: Delete unused con_font_copy() callback implementations
> > >   console: Delete dummy con_font_set() and con_font_default() callback implementations
> > >   Fonts: Add charcount field to font_desc
> > >   parisc/sticore: Avoid hard-coding built-in font charcount
> > >   fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount
> > 
> > Patches all look good to me, if Greg is ok with me applying the entire
> > pile to drm-misc-next I'll do that next week.
> 
> Yes, please do!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Pulled entire series into drm-misc-next.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
