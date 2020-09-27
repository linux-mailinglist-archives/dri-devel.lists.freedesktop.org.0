Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65427A850
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB0D6E426;
	Mon, 28 Sep 2020 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3886E072
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 09:27:10 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d13so5779548pgl.6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/+0v4K0vmArclBVNRS/fx6ONczXgbxr9rkdov+E0hJQ=;
 b=uhn8pjG4O8w8yKQYba0Eqi7d+4yEDRRterRVfsBkbBzHte3tCxkee/VgACvDRoQOEB
 m8HlLZD8Rvmqz29YH+gKFlueoL77fiAxJYnHQMr9t84twhsh85cQI5Rev7kbALp43kfi
 yZodv8kSYLEUmgK6sxazd6Ljn1IA/lYSgdCJaU9+93jI6qE/yxUMMT/WEgo/qTerkg47
 sIR97q1Gpo38eUBE4uAg4/cqRxlfq5t3BtKpVQwy8HTHCpnzw8aFtAITvXQOO49IRS6x
 YSookZTniu56Aam3V0J3jvjGU0YD3WdyEmxzCchnhGCm+85xK9/EqcEk7GXrZrG1NE3R
 ojkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/+0v4K0vmArclBVNRS/fx6ONczXgbxr9rkdov+E0hJQ=;
 b=t2MX/Ksj1iagLiJgL8rlADEQh9IfiMwXV1aqymnWCZB0EaJEjY/Pe5D3gDZB3cyEs2
 to5bbp9uN3SSPaKwfW7H2UBxO5vJlshUiLWAkW32qrhfHzozu6tt5mDm7rJE+jhb3k1R
 WFmz39bb/1rdDOVSR20HzBP6Q/3+MiiP7uxKydmZJwUPZBj6/+k2EiYcr631N8tjoBq9
 TScvjearuCUBBC7czGOuUsNIcDnrRHy+jHTkmtPC9Ie/93vH/CWfcufNBFCyOkEgxuuS
 Ln5uQ8/6OMmPC7ALnLkJCl/QxPevPh/o7+fo786tyWIvnTDb7IZ9Asp1tv5LVx1p9Q4K
 PZLg==
X-Gm-Message-State: AOAM532sAmuNG040heXTOs7aLLWmyF3aK9yV+FOl4EYnXR36yZrQVNeT
 4iwfZ+FQTmJm7LcvXt0ngg==
X-Google-Smtp-Source: ABdhPJzznsWE+vGPA76opHSWu8mdz1RLxc0cgGQ4T3jeUXYXq5bYqi3z1U4Ii5LxZ7AyjI1MX6tBxw==
X-Received: by 2002:a63:1f1a:: with SMTP id f26mr5227671pgf.150.1601198830044; 
 Sun, 27 Sep 2020 02:27:10 -0700 (PDT)
Received: from PWN ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id r6sm7556304pfq.11.2020.09.27.02.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 02:27:09 -0700 (PDT)
Date: Sun, 27 Sep 2020 05:27:01 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: KASAN: use-after-free Read in bit_putcs
Message-ID: <20200927092701.GA1037755@PWN>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
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
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 27, 2020 at 05:28:12PM +0900, Tetsuo Handa wrote:
> Well, vt_io_ioctl(PIO_FONT) initializes "struct console_font_op op;" with
> 
>   op.width = 8;
>   op.height = 0;
>   op.charcount = 256;
> 
> and calls con_font_set() from con_font_op(). But the "/* Need to guess font height [compat] */"
> chunk in con_font_set() guesses font's height due to being initialized with op.height = 0.
> Then, con_font_set() calls fbcon_set_font() via vc->vc_sw->con_font_set(), and fbcon_set_font()
> allocates minimal amount of memory for font data based on font's height calcllated by con_font_set().
> 
> Therefore, any attempt to change font's height (like vt_resizex()) larger than font's height
> calculated by con_font_set() can cause OOB read of memory block for font data. If we allocate
> maximal amount of memory for any font, OOB read of memory block for font data should not happen.
> 
> ----------------------------------------
> 
> static char fontdata[8192] = { 2 };
> 
> [  227.065369] bit_putcs: width=1 cellsize=1 count=80 maxcnt=8192 scan_align=0 buf_align=0 image.height=1
> [  227.066254] bit_putcs: width=1 cellsize=1 count=80 maxcnt=8192 scan_align=0 buf_align=0 image.height=1
> [  227.067642] vc=ffff8880d69b4000 v.v_rows=0 v.v_cols=0 v.v_vlin=1 v.v_clin=9 v.v_vcol=0 v.v_ccol=0 ret=0
> [  227.067699] vcp=ffff8880d69b4000 before: ->vc_rows=480 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=1
> [  227.067774] vcp=ffff8880d69b4000 after: ->vc_rows=480 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=400 ->vc_font.height=9 save_font_height=1 ret=0
> [  227.067831] vcp=ffff8880cac4b000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.067891] vcp=ffff8880cac4b000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.067947] vcp=ffff8880c6180000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068007] vcp=ffff8880c6180000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.068063] vcp=ffff8880d6b84000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068123] vcp=ffff8880d6b84000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.068179] vcp=ffff8880ca8c0000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068255] vcp=ffff8880ca8c0000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.068455] vcp=ffff8880cbd5d000 before: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16
> [  227.068515] vcp=ffff8880cbd5d000 after: ->vc_rows=30 ->vc_cols=80 ->vc_scan_lines=1 save_scan_lines=0 ->vc_font.height=9 save_font_height=16 ret=0
> [  227.084709] ==================================================================
> [  227.084729] BUG: KASAN: slab-out-of-bounds in soft_cursor+0x34e/0x4a0
> [  227.084748] Read of size 9 at addr ffff8880c98d5930 by task a.out/1662

Very interesting, I remember seeing this on the syzbot dashboard...

Yes, I guess it is this one:
	KASAN: slab-out-of-bounds Read in soft_cursor
	https://syzkaller.appspot.com/bug?id=6b8355d27b2b94fb5cedf4655e3a59162d9e48e3

There is a `0x560aul` ioctl() in the reproducer, which is `VT_RESIZEX`.

Thank you,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
