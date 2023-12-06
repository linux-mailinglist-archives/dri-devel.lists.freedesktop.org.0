Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1A8070D2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C59210E11E;
	Wed,  6 Dec 2023 13:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A809710E11E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:25:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 04A7461CA0;
 Wed,  6 Dec 2023 13:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399A2C433C7;
 Wed,  6 Dec 2023 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701869120;
 bh=NrbaR+I19vj4Tpr/BrYQ0GE6ymZl2sXq/eZMlCLqGbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lQ+zGdRq0JJeQ04A6+6Dbyks0WBqIUtnxO1tRjhjml2Vr0JQMnJr3B9l8BYgrZe2Y
 fHIYw35dcejkqbjpfgaPivlbLEInN2lusgFvpD6I99RZJv0r2Fe15d0p7lSkvqZ1Jy
 rtgb81rTRJtVP83iZ/dnaw2UXMncAdfrh3+n/nkdq9OeSb8wZTWPiMKH/qLnMpiiU2
 WcSdG4yAwb9wQNQJUVrvS6hmfT/SG71si5gGjRJgr0n6wH0F6ko6+mBnOBQhjHLT8l
 6gThC75e5918JFTId9VeBGrhZoZyYhQhfrxVaqf70FBn0yQKhrJamoRP2pTMAPZfJF
 5rIAAzc9g2CiA==
Date: Wed, 6 Dec 2023 13:25:16 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: ili922x: fix W=1 kernel-doc warnings
Message-ID: <20231206132516.GB3375667@google.com>
References: <20231205225638.32563-1-rdunlap@infradead.org>
 <20231206112645.GA81045@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206112645.GA81045@aspen.lan>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Dec 2023, Daniel Thompson wrote:

> On Tue, Dec 05, 2023 at 02:56:38PM -0800, Randy Dunlap wrote:
> > Fix kernel-doc warnings found when using "W=1".
> >
> > ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> > ili922x.c:85: warning: missing initial short description on line:
> >  * START_BYTE(id, rs, rw)
> > ili922x.c:91: warning: contents before sections
> > ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
> >
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-fbdev@vger.kernel.org
> > ---
> >  drivers/video/backlight/ili922x.c |    9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff -- a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> > --- a/drivers/video/backlight/ili922x.c
> > +++ b/drivers/video/backlight/ili922x.c
> > @@ -82,13 +82,12 @@
> >  #define START_RW_READ		1
> >
> >  /**
> > - * START_BYTE(id, rs, rw)
> > - *
> > - * Set the start byte according to the required operation.
> > + * START_BYTE() - Set the start byte according to the required operation.
> >   * The start byte is defined as:
> >   *   ----------------------------------
> >   *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
> >   *   ----------------------------------
> 
> I'm not sure we want "The start byte is defined as" in the brief
> description. Needs a blank line between the brief and full description
> (or hoist the argument descriptions up to match the idiomatic
> form for a kernel-doc comment in the docs if you prefer).

I'd consider dropping the kernel-docness of this header entirely.
Kerneldoc is designed for documenting exported (or at least externally
available) functions and data structures, with allowances for static
functions in the name of consistency or in cases of excessive
complication.  I've fixed A LOT of kernel-doc headers in my time and I
can't say I remember coming across MACROs being documented this way
before now.

-- 
Lee Jones [李琼斯]
