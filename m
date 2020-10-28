Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A429CE27
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 06:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FFF6E45E;
	Wed, 28 Oct 2020 05:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EB86E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 05:30:47 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t14so2126693pgg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 22:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oVUnL5kaK/5rf5G4sA+8aqXRjWDzkxcWebk6ujgD/a4=;
 b=lVdjvlJU8QJiTeX+orF6aiSQkRhcTKXek6pC70EbrVTGQRVobxa66NKgA+x8PuyWhl
 7i51fj9jrqvaY/A+Nq0rUmnagneca6PbrtahlzFwb1oX10Zz7IjDcEYKtKToagfhiKk9
 nZYsz2oDRR8+cBnaHrBk995yn3o0KthFHODqWTmVZ6oWZhh+SQZ4CT3/Y1NgEd4eXJXB
 gY3c+gl2Vp7G1ttS7UXUC9LZiUcWKZ1DBUNf101rzl3vzIm+8SqZwU7esW5mvCcpLYqt
 dlT8aMX4y+r5CvAXeK8QUrg+XWtPiCnylPhhDe6fWShg+SNW0py2hw4zCtU6xpbDOxIC
 3g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oVUnL5kaK/5rf5G4sA+8aqXRjWDzkxcWebk6ujgD/a4=;
 b=bZtbB2+x1wBLD+Cz2Rkt7XPGTGIyX9cnUzjc9C2fAoLNcS/2x24suflJIInp3K1Ecr
 O2HYREzxgrKmYRQZ4GkUHRS6j8+M4H1bqUi+JV8ukK0A5Y67Nge1RCmYDoYkaKJPQK9m
 u2X98ZCim8f15nBg5UDansw6A3Dzoy4qkYLgGjaY0XF+6cxfmE9Z3WnjeiBpyKI4tPcF
 ulxRXZZG/G0oKkLw2DWwL0XWmHggqyZjASEyCymPrw7CjEqsSvxYDeAqKjFh92xBOJUH
 51pdW5Q0dvfG+r/iUEhJLuuN/BonO00ZEoHOlqXCiWjazaf0rBXhZZSIXe628/WKTBI9
 2QQg==
X-Gm-Message-State: AOAM530kpdHz1ZN+uUUTrkiCUVVv81YRaEr1SJB5DiNl+hBuXPBusQzR
 9tLelc7bDRQVjSlnq+s7ulPtWB1BHgCD
X-Google-Smtp-Source: ABdhPJwEfZ3S8cf5PNLPqQJlTMzx7UgTYspNtvNwe66BtBr0YbnEEqapRdlrd4oUtTF14CnlZ5pGnw==
X-Received: by 2002:a63:9d4d:: with SMTP id i74mr4838250pgd.182.1603863047104; 
 Tue, 27 Oct 2020 22:30:47 -0700 (PDT)
Received: from PWN (n11212042025.netvigator.com. [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id q8sm4300935pfg.118.2020.10.27.22.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 22:30:46 -0700 (PDT)
Date: Wed, 28 Oct 2020 01:30:34 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/5] fbcon: Avoid hard-coding built-in font charcount
Message-ID: <20201028053034.GA1205431@PWN>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
 <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
 <20201027191353.GO401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027191353.GO401619@phenom.ffwll.local>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 08:13:53PM +0100, Daniel Vetter wrote:
> On Tue, Oct 27, 2020 at 12:37:29PM -0400, Peilin Ye wrote:
> > fbcon_startup() and fbcon_init() are hard-coding the number of characters
> > of our built-in fonts as 256. Recently, we included that information in
> > our kernel font descriptor `struct font_desc`, so use `font->charcount`
> > instead of a hard-coded value.
> > 
> > This patch depends on patch "Fonts: Add charcount field to font_desc".
> > 
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> So I think this is correct, but it also doesn't do a hole lot yet. fbcon.c
> still has tons of hard-coded 256 all over, and if (p->userfont).
> 
> I think if we instead set vc->vc_font.charcount both in fbcon_init and in
> fbcon_do_set_font (probably just replace the userfont parameter with
> font_charcount for now), then we could replace these all with
> vc->vc_font.charcount. And the code would already improve quite a bit I
> think.
> 
> With just this change here I think we have even more inconsistency, since
> for built-in fonts vc->vc_font.charcount is now set correctly, but for
> userfonts we need to instead look at FNTCHARCNT(vc->vc_font.data).

You are right, let's remove FNTCHARCNT() altogether. fbcon_do_set_font()
still needs a userfont parameter for refcount handling, I'll just add a
charcount parameter to it.

Peilin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
