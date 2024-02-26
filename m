Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0EA8675A2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D1A10F174;
	Mon, 26 Feb 2024 12:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rT5LQvi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D59D10F173;
 Mon, 26 Feb 2024 12:52:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B7EABCE16C4;
 Mon, 26 Feb 2024 12:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1491CC433C7;
 Mon, 26 Feb 2024 12:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708951936;
 bh=fZH+U9WKhQH4ZWiXzAST0yU7viLHXCnk1wkEi0y7miE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rT5LQvi/Ie8zpJvS9vTRBFbcNvWb2YZ6Litpoc2gmG/iVgPfsgrb5U2NHi/2A9xE4
 lfYNYvIJYx8n2BPx8hOQWCqp77EqUemTpWwi0bjalxN6PUyRAUd+uTt68QJEAH7bNi
 TrkonldQtBcKZFnjoMMril65adw08G/kq/EN1kX9J8/opb5lZmsdHa4i++3V4al16h
 1fAYo1HNPK+qqNolVsVHgVze3jPPPw1A5wCQHPKEIDqkfHzgLE6gTcpDEcJppTFHQV
 MtvsQqOMspRMmvXXC+M3vCh8aOKQtVvTaisxDc/sv0aWMs2vMcVcbL7ehh0Xq4pcB1
 Hk62H+O5pyklQ==
Date: Mon, 26 Feb 2024 12:52:09 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, deller@gmx.de,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/9] backlight/corgi-lcd: Include <linux/backlight.h>
Message-ID: <20240226125209.GB23065@google.com>
References: <20240219093941.3684-1-tzimmermann@suse.de>
 <20240219093941.3684-2-tzimmermann@suse.de>
 <1e577f18-c6f7-44e7-b50f-720915f257eb@suse.de>
 <20240223105652.GT10170@google.com> <874jdvo3ia.fsf@intel.com>
 <20240226123313.GA23065@google.com>
 <62ad32cb-3fd1-4c21-ab2c-a194e559d12a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62ad32cb-3fd1-4c21-ab2c-a194e559d12a@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Feb 2024, Thomas Zimmermann wrote:

> Hi
> 
> Am 26.02.24 um 13:33 schrieb Lee Jones:
> > On Mon, 26 Feb 2024, Jani Nikula wrote:
> > 
> > > On Fri, 23 Feb 2024, Lee Jones <lee@kernel.org> wrote:
> > > > On Wed, 21 Feb 2024, Thomas Zimmermann wrote:
> > > > 
> > > > > cc'ing backlight maintainers
> > > > I cannot review/accept patches like this.
> > > > 
> > > > Please submit a [RESEND].
> > > I bounced the original [1] to you. Please consider acking to merge the
> > > one-line #include addition via fbdev so we don't have to respin the
> > > series for no good reason.
> > The "good reason" would be that it was not sent properly in the first
> > place.  My kernel.org mail is filtered by the recipients headers.  If
> > the original wasn't sent to me, bouncing won't work either.  I've since
> > reviewed the patch and seen the set on LORE.  This is non-optimal.
> > Please use get_maintainer.pl next time.
> > 
> > This time only, patch is:
> > 
> > Acked-by: Lee Jones <lee@kernel.org>
> 
> No problem, I'll send out another series. I just didn't get to do it.

No need to do that now on my behalf.  You have my Ack.

-- 
Lee Jones [李琼斯]
