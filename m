Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE72AD6D2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 13:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55780892A8;
	Tue, 10 Nov 2020 12:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97F892A8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 12:49:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so2883673wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fd0rvLSxv3w0DGSQl7/MR8nNwRxQn2EkK7Jf55cFZrE=;
 b=Af/MIMAKTQFyxeHZZ16ClAESfRN5kB3gwq1ekyEsJw9VWZtvXazxaHfDBudJlv5Yfe
 sG+w67uZ1tV0fV0JuRrShzclzjjo1v5Hk4cDXOlThxui7dlxO690C+LdlsHAN7Go4jz4
 9QN0p1pD7iRWnebbIfEOspzjTobQjXBHaVga8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Fd0rvLSxv3w0DGSQl7/MR8nNwRxQn2EkK7Jf55cFZrE=;
 b=LucDSFbHE302VYh0tViVlC9smRaPU6jQYT2BwFKQkG+Pb6VMltT3nZbk472l7G8nrn
 nIe1+LofkKLs6zFxjX7ODbO/qwEsWPu0lCz7eWmHJ1LWHr7LqGfaQk+UvHgMwZQ8dcW7
 9bZBzppKVaI5d1Td4SuzKSOmB2pUcep8ntm7qaCNQRghVKqGSWWMv4lIDYfVlAYCH7Ep
 1UnP33WRKDcqXnIci2yj7CZrDeuFd8oc98arITmCsxEEMO6+vfihdUIhDl1qJuc0IxbN
 Jr3Bij/g/tPp/2oTFRiU7Aag10fofnWMUhWN5b3H0vZ/itDd9sZ1i4raw+8NBNXci1gq
 N4nw==
X-Gm-Message-State: AOAM531wcNyI7gVmEkj8B1RDqmzG/Fi7GXJoZlCU2JMmJt6OIcAPXFr+
 GUmfnfnNgOudSW/6K4wRbWa+hA==
X-Google-Smtp-Source: ABdhPJzPchZV3CYprZV/WF3ChAiYPcWT+V/aERZoo0KWm+pFd7h/KOdwCODP/u/gnKrwWH9ItChKBw==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr4458160wmb.64.1605012589235; 
 Tue, 10 Nov 2020 04:49:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h81sm2905596wmf.44.2020.11.10.04.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 04:49:48 -0800 (PST)
Date: Tue, 10 Nov 2020 13:49:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <20201110124946.GF401619@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 George Kennedy <george.kennedy@oracle.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <20201106105058.GA2801856@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106105058.GA2801856@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 11:50:58AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Oct 31, 2020 at 03:24:41AM -0400, Peilin Ye wrote:
> > `struct console_font` is a UAPI structure, thus ideally should not be
> > used for kernel internal abstraction. Remove some dummy .con_font_set,
> > .con_font_default and .con_font_copy `struct consw` callback
> > implementations, to make it cleaner.
> > 
> > Patch "fbcon: Prevent global-out-of-bounds read in fbcon_copy_font()"
> > depends on this patch, so Cc: stable.
> > 
> > Cc: stable@vger.kernel.org
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/
> > 
> >  drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
> >  drivers/video/console/dummycon.c        | 20 --------------------
> >  2 files changed, 41 deletions(-)
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Peilin, can you pls resend this together with all the other pending
patches from you? I think that's better than me trying to cherry-pick the
bits we decided to keep from random places.

Greg, ok if I just pull these in through drm-misc-next? It's a pretty bad
hairball anyway and that avoids the tree coordination issues. Only thing
that might get in the way is the vt font_copy removal, but that's in -rc3
so easy to backmerge.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
