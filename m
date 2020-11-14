Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E582B2C09
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 09:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B2E6E8F0;
	Sat, 14 Nov 2020 08:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450F46E8F0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 08:10:28 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c66so9497543pfa.4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UjoM/Jb9YzMDUNLXPrC2c7aiTcht0/xGNSfdesVAVqI=;
 b=IGiUSEBZx9/TmLfHHpK3pQ7GSrhfMQFNSfGAC1pbY2Ge/tO189H8uPBwgsjiUksNnA
 j8Ndu+iaMovK3CgVOmlPYgIj7a2okENhx0LNMOjoJ9I49pmMbyrGBLDrvnzipOKZszP+
 5m9NTEoCxkjkCEznH0MTgdqoqEYERxY36mFXnGHG4SJQsLogUrAbkT4p8CdUO8XPBrR/
 2AQERdbw1QMl7UijRsIkesKRf96Xe3T7FiPOnUy0Dslpsvy4lxQm6m8btQMU0Ij1CY+c
 Mz1wpWy4yLvc5zXBIHwW2N7c85QpN90wx4Eb8minXiKj7+IAqJWA6yyEFXGmMawl7GWT
 4qCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UjoM/Jb9YzMDUNLXPrC2c7aiTcht0/xGNSfdesVAVqI=;
 b=f4GbNw09PPvgDjmyNBJleUA2YWNwjL6dwV150UjdBo+BaOG3Y8oweGPB0RvmFWxsxt
 J1yimCBtuAjOZvLdfIDraxDxW2bjPkAr7UWHmwj39SyyrFkx7Jl9aukoq7C+PIt7+fmz
 ijEvfzn0L5hwbmCp6eaN155l4GKromxIKh9rgPVjyBeEuRk9dDPTF1M+tbXY1ZHSkDw5
 RfryvCPPzjy24uSH1DZOAAWQDZP+4V7SbQN/Lqv93G9M4IZyFNMym1JkeBK6mBqOqRFP
 PoRJ1xDz81bTfnqzbEmazU3mJ2JUSt9aPYDcI7pp6BWuU08i5M7EeVU9XS2q74Cx8A9B
 +AJQ==
X-Gm-Message-State: AOAM5324NLfiAb14sTs9srnYhiustSoae0AsHI4RSOGvi7Clk+vZktFx
 4S8uf9UN1hqAbffvGYj3rA==
X-Google-Smtp-Source: ABdhPJwBZoL847JBlahwrxY8TlcxOqmdTrJsXnzO985GLU/rubIRHIugmq6wYmm4RUzNOKzyfzkQ7A==
X-Received: by 2002:a62:1c47:0:b029:18b:9e22:593e with SMTP id
 c68-20020a621c470000b029018b9e22593emr5691287pfc.42.1605341427792; 
 Sat, 14 Nov 2020 00:10:27 -0800 (PST)
Received: from PWN ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id t32sm11314155pgl.0.2020.11.14.00.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 00:10:27 -0800 (PST)
Date: Sat, 14 Nov 2020 03:10:21 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <20201114081021.GA11811@PWN>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X68NFzaAuImemnqh@kroah.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Fri, Nov 13, 2020 at 10:16:33PM +0100, Daniel Vetter wrote:
> > On Thu, Nov 12, 2020 at 07:02:21AM -0500, Peilin Ye wrote:
> > > Peilin Ye (5):
> > >   console: Delete unused con_font_copy() callback implementations
> > >   console: Delete dummy con_font_set() and con_font_default() callback implementations
> > >   Fonts: Add charcount field to font_desc
> > >   parisc/sticore: Avoid hard-coding built-in font charcount
> > >   fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount
> > 
> > Patches all look good to me, if Greg is ok with me applying the entire
> > pile to drm-misc-next I'll do that next week.

On Fri, Nov 13, 2020 at 11:47:51PM +0100, Greg Kroah-Hartman wrote:
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing!  Questions about the last patch [5/5] though, it
depends on the following assumption:

"""
For each console `idx`, `vc_cons[idx].d->vc_font.data` and
`fb_display[idx].fontdata` always point to the same buffer.
"""

Is this true?  I think it is true by grepping for `fontdata`.  I also
noticed that fbcon.c is using `vc->vc_font.data` and `p->fontdata`
interchangeably, see fbcon_get_requirement():

		vc = vc_cons[fg_console].d;
		[...]
			p = &fb_display[fg_console];
			caps->x = 1 << (vc->vc_font.width - 1);
					^^^^^^^^^^^
			caps->y = 1 << (vc->vc_font.height - 1);
					^^^^^^^^^^^
			caps->len = (p->userfont) ?
				FNTCHARCNT(p->fontdata) : 256;
					   ^^^^^^^^^^^

If it is true, then what is the point of using `fontdata` in `struct
fbcon_display`?  Just for the `userfont` flag?  Should we delete
`fontdata`, when we no longer need the `userfont` flag?

In this sense I think [5/5] needs more testing.  Do we have test files
for fbcon, or should I try to write some tests from scratch?

Thank you,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
