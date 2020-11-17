Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A03E2B59AB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 07:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B686E06E;
	Tue, 17 Nov 2020 06:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956AE6E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 06:21:49 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id g7so16572890pfc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 22:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HCO4Do1TIW6WV/IMbSI0sS4snTkErwGgRb9lWw/XdAg=;
 b=Rr63UEzLxGfhz2R7lf/axt7voqBBoKNdMPe/zmgEAeo5ROdwghZGYIqmzQYotoRl2q
 4Gj9PfviEklD8ew0JlFvaigE9lvgueJyFLb5wzLH93ESO+eRkp50NKM+ScK5E370QW5q
 vF1I0D/bZgbXYrjVW/2gs30rFuHt9l0NOKZTdTBN/JcN4Ta9to2n1wd9sbDDF+EUMa2g
 W5ndu3re91O+xMTu+AqL58r5uBnwykUpIuR1KOdax8l5MrMMABi8QyenWS5nBXSMyPg2
 HQeDq/CFhGkSArBohdaeggOSSGoFKcXcJ5cDweuqddoIIhy7Gm+EnCtmYWL9lEZW5Cyz
 jBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HCO4Do1TIW6WV/IMbSI0sS4snTkErwGgRb9lWw/XdAg=;
 b=iKg3G2lffuv2zdQsqeEu6Q5OHBAclByL5rWKpmsXXOb9xEj9LIHBU790yJiEY/tkiU
 jlIqMSzHd+RNnY5lHudWsxi5VWc07MdQ9jZHZ328hAQ6lb7F6Hn+nDblB4YB6DxIwTgW
 OzxGVQyuJ/lPQO6j2GuCZeFBpynR5Lpk6CdiUkM+Yw5uXvnh6oa8ESW5dJjeKhdoig3D
 3jcy4SRgssIvXE7TpkVi9OOm/O4avhdnPVVCpB/bT/26FD/EB+d3sjPk9hCLztcZYhWz
 k/Kyh8syqZIIQlUJFHPxYVGWaB89vUK6+0A3BwSUxCP73+cJZruU1L1aUSMuy4XTBGuL
 kraQ==
X-Gm-Message-State: AOAM530LBLWoThS/cIgKmUFFP9uj1VMRuWLZ8+nQ1J4GMt0csA4bkmtj
 Da49HzKImwRg19AgFvvBJA==
X-Google-Smtp-Source: ABdhPJynVMmV4480o8KA0uueSRkFm2Dde8Vp8IwxbZJtqWyUskYCET+gGac+0YqDVdnVW8v1cPO53A==
X-Received: by 2002:aa7:9f9a:0:b029:18b:a203:3146 with SMTP id
 z26-20020aa79f9a0000b029018ba2033146mr17064311pfr.36.1605594109108; 
 Mon, 16 Nov 2020 22:21:49 -0800 (PST)
Received: from PWN ([116.92.233.28])
 by smtp.gmail.com with ESMTPSA id j11sm16908116pgp.82.2020.11.16.22.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 22:21:48 -0800 (PST)
Date: Tue, 17 Nov 2020 01:21:42 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/5] console: Miscellaneous clean-ups, do not use
 FNTCHARCNT() in fbcon.c
Message-ID: <20201117062142.GA28766@PWN>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
 <20201113211633.GY401619@phenom.ffwll.local>
 <X68NFzaAuImemnqh@kroah.com> <20201114081021.GA11811@PWN>
 <X6/K/S9V7rj2hI5p@kroah.com> <X6/L/lE2pA7csBwd@kroah.com>
 <20201114124716.GA12895@PWN>
 <20201116100949.GA401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116100949.GA401619@phenom.ffwll.local>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 11:09:49AM +0100, Daniel Vetter wrote:
> On Sat, Nov 14, 2020 at 07:47:16AM -0500, Peilin Ye wrote:
> > On Sat, Nov 14, 2020 at 01:22:22PM +0100, Greg Kroah-Hartman wrote:
> > > On Sat, Nov 14, 2020 at 01:18:06PM +0100, Greg Kroah-Hartman wrote:
> > > > On Sat, Nov 14, 2020 at 03:10:21AM -0500, Peilin Ye wrote:
> > > > > Thanks for reviewing!  Questions about the last patch [5/5] though, it
> > > > > depends on the following assumption:
> > > > > 
> > > > > """
> > > > > For each console `idx`, `vc_cons[idx].d->vc_font.data` and
> > > > > `fb_display[idx].fontdata` always point to the same buffer.
> > > > > """
> > > > > 
> > > > > Is this true?  I think it is true by grepping for `fontdata`.  I also
> > > > > noticed that fbcon.c is using `vc->vc_font.data` and `p->fontdata`
> > > > > interchangeably, see fbcon_get_requirement():
> > > > > 
> > > > > 		vc = vc_cons[fg_console].d;
> > > > > 		[...]
> > > > > 			p = &fb_display[fg_console];
> > > > > 			caps->x = 1 << (vc->vc_font.width - 1);
> > > > > 					^^^^^^^^^^^
> > > > > 			caps->y = 1 << (vc->vc_font.height - 1);
> > > > > 					^^^^^^^^^^^
> > > > > 			caps->len = (p->userfont) ?
> > > > > 				FNTCHARCNT(p->fontdata) : 256;
> > > > > 					   ^^^^^^^^^^^
> > > > > 
> > > > > If it is true, then what is the point of using `fontdata` in `struct
> > > > > fbcon_display`?  Just for the `userfont` flag?  Should we delete
> > > > > `fontdata`, when we no longer need the `userfont` flag?
> > > > 
> > > > Yes, after a quick look, I think your analysis here is correct.  So if
> > > > you can delete that, it would be nice if possible.
> > 
> > I see, at the moment we still need `userfont` for refcount handling, I
> > will try to delete both `fontdata` and `userfont` after refcount is
> > taken care of.
> 
> +1 on sunsetting fondata. I think there's a bunch of these in fbcon code,
> because the console subsystem is older than the standard "allow drivers to
> embed the subsystem struct into their own private struct" subclassing
> model. So lots of global arrays indexed by the console id :-/

Yeah, I saw your comments about registered_fb[] :(

> We're also trying to start some kind of test suite for fbdev chardev ioctl
> interface in the gpu test suite. fbcon tests are maybe more related to
> tty/vt, and I have no idea whether anything exists there already.
> 
> But if you want to do some automated testcases for fbcon and there's
> absolutely no other home for them, the gpu test suite might be an option
> of last resort too:
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-and-validation

Oh, I didn't know about igt-gpu-tools, thanks for the pointer!  Now,
since charcount is taken care of, and font_desc now contains all fields
of console_font, I think it is a good time to replace console_font with
font_desc in vc_data.  Then we can get rid of FNTSUM(), FNTSIZE(), then
(finally) REFCOUNT().

I will start working on vc_data, after done enough testing on [5/5],
ofc. Thanks,

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
