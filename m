Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502D27A83C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879BE6E413;
	Mon, 28 Sep 2020 07:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E174D6E223
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 19:40:06 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d9so6017204pfd.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z/Wf/3QHi80/sQfmdSfCdx2ZY+b1si1Ve9CIncWZLPc=;
 b=Aqu4VvvcLLk8HRAROUrSqzdPdruCf748+CbScaaqaVpUZOmVe5KHuLzgjLAUbmXs3t
 vzhSzKDX7QJh092q8/yOtbNLGv5fYkBGp5RlZ/pmc6PSELNxK0uHhvPimuv+qygP9fwj
 ytRePrY9vej5lD0YjDMxX7WyrBpm7G9QnzS+kZBwhX8udZvh/wfHUwYN8DuVboYwmUwt
 5wc/bKjQKp+IvFsvlsVrefOFP8w0n/xVWhrakv2bnuywehSIJKIJwh5Dbq5e0cfwqeNv
 ZcVp0SxthLG152MZvD3saw2RfTCc3m887GGs7sTu96v1HVu3wDGBBn6Hjw0F1fYLb/pw
 r6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z/Wf/3QHi80/sQfmdSfCdx2ZY+b1si1Ve9CIncWZLPc=;
 b=qaHARb+tWdErMRZTMMOm+G1wg4fiNEBAXFBZfjySG67ULDxIX1NPuZZgS1M9uXRx5U
 bEnQnuKNM81HPYCYXpnDLhh9p0rAD7XCKsRVSUs5/bMelIC1hc8B3dUflRGx8JBp4Ttw
 3z2T3Gl2U0/MW3FzI52WC4rYncOdMLS4EeUc/X2RmMMhVHXplG6qjXYP58QA5c9qjyRt
 t1iayhVWAFY3ppGRSaRCy/eIJS0vFH7YqxK0+eulHMNCntyjn7ZQILYDqwUg1K8qswTB
 gkiifOVSbENWYk/5UGdnSNTa0RR/Y7QnERmNapNTrjMWzBZY7U76Em1DVNuzIdabB9o9
 If1A==
X-Gm-Message-State: AOAM532hrwfevHdn2m0cEZi8aJJjOSLss/upfOLv4HgzSs1sBG4sfZgI
 QskUGEfgIGL1y0H/fzDSPQ==
X-Google-Smtp-Source: ABdhPJx++z5PLIkM2jj3Fb7/bzZyOIB/WkNavwfESpUe2Pl7KYRs/XdphoGaWDKJtwgYKU/tQtJqbg==
X-Received: by 2002:a62:4ed6:0:b029:142:2501:35ec with SMTP id
 c205-20020a624ed60000b0290142250135ecmr4801624pfb.76.1601149206406; 
 Sat, 26 Sep 2020 12:40:06 -0700 (PDT)
Received: from PWN ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id s70sm5557357pgc.11.2020.09.26.12.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 12:40:05 -0700 (PDT)
Date: Sat, 26 Sep 2020 15:39:57 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: KASAN: use-after-free Read in bit_putcs
Message-ID: <20200926193957.GA1033221@PWN>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch,
 deller@gmx.de, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yepeilin.cs@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 27, 2020 at 01:25:17AM +0900, Tetsuo Handa wrote:
> A simplified reproducer and debug printk() patch shown below reported that
> vc_font.height is increased to 9 via ioctl(VT_RESIZEX) after it was once
> decreased from 16 to 2 via ioctl(PIO_FONT).
> 
> 
> 
> Since vc_resize() with v.v_rows == 0 preserves current vc->vc_rows value,
> this reproducer is bypassing
> 
> 	if (v.v_clin) {
> 		int rows = v.v_vlin / v.v_clin;
> 		if (v.v_rows != rows) {
> 			if (v.v_rows) /* Parameters don't add up */
> 				return -EINVAL;
> 			v.v_rows = rows;
> 		}
> 	}
> 
> check by setting v.v_vlin == 1 and v.v_clin == 9.
> 
> If v.v_vcol > 0 and v.v_vcol != vc->vc_cols (though this reproducer is passing
> v.v_vcol == 0), tty_do_resize() from vc_do_resize() from vc_resize() can make
> "struct tty_struct"->winsize.ws_ypixel = 1 despite
> "struct tty_struct"->winsize.vc->vc_rows = vc->vc_rows (which is usually larger
> than 1). Does such winsize (a row has 1 / vc->vc_rows pixel) make sense?
> 
> 
> 
> Since I don't know the meaning of "struct vt_consize"->v_clin (which is commented
> with "/* number of pixel rows per character */" but does it mean font size ?),
> I don't know why we can assign that value to vcp->vc_font.height via
> 
> 	if (v.v_clin)
> 		vcp->vc_font.height = v.v_clin;
> 
> in vt_resizex(). While ioctl(PIO_FONT) needs to pass vc->vc_sw->con_font_set()
> check in con_font_set(), ioctl(VT_RESIZEX) does not pass it in vt_resizex()...
> 
> Since this problem does not happen if I remove
> 
> 	if (v.v_clin)
> 		vcp->vc_font.height = v.v_clin;

Hi Tetsuo!

>  from vt_resizex(), I guess that some variables are getting confused by change
> of vc->vc_font.height ...

Yes, see bit_putcs():

(drivers/video/fbdev/core/bitblit.c)
static void bit_putcs(struct vc_data *vc, struct fb_info *info,
		      const unsigned short *s, int count, int yy, int xx,
		      int fg, int bg)
{
	struct fb_image image;
	u32 width = DIV_ROUND_UP(vc->vc_font.width, 8);
	u32 cellsize = width * vc->vc_font.height;
	    ^^^^^^^^		   ^^^^^^^^^^^^^^

`cellsize` is now too large. Later, in bit_putcs_aligned():

	while (cnt--) {
		src = vc->vc_font.data + (scr_readw(s++)&
					  charmask)*cellsize;
						    ^^^^^^^^

`src` goes out of bounds of the data buffer. At first glance I guess
this is an out-of-bound read reported as a use-after-free read? The
crashlog says:

[  149.732103][ T6693] Allocated by task 6667:
[ 149.732115][ T6693] kasan_save_stack (mm/kasan/common.c:48)
[ 149.732121][ T6693] __kasan_kmalloc.constprop.0 (mm/kasan/common.c:56 mm/kasan/common.c:461)
[ 149.732126][ T6693] __kmalloc (mm/slab.c:3656 mm/slab.c:3664)
[ 149.732133][ T6693] alloc_pipe_info (fs/pipe.c:810)
[ 149.732139][ T6693] create_pipe_files (fs/pipe.c:883 fs/pipe.c:914)
[ 149.732145][ T6693] do_pipe2 (fs/pipe.c:965 fs/pipe.c:1012)

I'm not sure, but I don't think a buffer allocated in fs/pipe.c is
related here. Maybe they just live near each other on the heap?

To resolve this out-of-bound issue for now, I think the easiest way
is to add a range check in bit_putcs(), or bit_putcs_aligned().

...but yeah, that `VT_RESIZEX` ioctl looks really buggy, and is already
causing more issues:

KASAN: global-out-of-bounds Read in fbcon_get_font
Link: https://syzkaller.appspot.com/bug?id=08b8be45afea11888776f897895aef9ad1c3ecfd

This was also caused by `VT_RESIZEX`...

Thank you,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
