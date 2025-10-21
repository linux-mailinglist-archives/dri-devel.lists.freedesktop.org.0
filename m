Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB8BF5321
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECB210E58E;
	Tue, 21 Oct 2025 08:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lukowski.dev header.i=@lukowski.dev header.b="YsTqt2fd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 46639 seconds by postgrey-1.36 at gabe;
 Tue, 21 Oct 2025 08:13:10 UTC
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0F110E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lukowski.dev;
 s=default; t=1761034388;
 bh=21tz4INp76XZE73YF39d4OhuGExWH86i52/5vzcfF/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YsTqt2fdlrinIEsrbq0Yd8KxA06pQ+fD7p78ggFYqeuI1tjtSOP4izSW8cmoBN0Ar
 qMFOcJAXFrM6f0eCZYh/90f9lZ06ojqvju+zAjd8/02N7FOjzUd2yIG3SPeWZn/4b8
 9Un/gO4T+/lH+m3rp0dt0Cvq4cjK0r1jPxuzOfNEJaxNseXItNEfi9ziVTB1XG5PYG
 q53kLyWsj6LwgiXsz2EvjNekNogA0tBA9BIsZi9XvZWQnAbysJgO8IaGwznutQmJlE
 CMIcJfe/Td7Hum+D9W8j+xZUhSkFOwyIgdPdOGs71KmmzuZnuho9rJPnPfd14Vh9nb
 CeqkzZ3fZrKEQ==
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 4crQ5w6T8tz3hhZK;
 Tue, 21 Oct 2025 04:13:08 -0400 (EDT)
Received: from Olles-MacBook-Air.local (unknown [150.228.61.72])
 by mta-13.privateemail.com (Postfix) with ESMTPA;
 Tue, 21 Oct 2025 04:13:01 -0400 (EDT)
Date: Tue, 21 Oct 2025 11:12:56 +0300
From: Olle Lukowski <olle@lukowski.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_ra8875: replace udelay with
 usleep_range
Message-ID: <aPdAiG8h_bY34vfV@Olles-MacBook-Air.local>
References: <20251020-staging-fbtft-ra8875-usleep-v1-1-9592dd390c13@lukowski.dev>
 <2025102120-ride-repaint-7a22@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025102120-ride-repaint-7a22@gregkh>
X-Virus-Scanned: ClamAV using ClamSMTP
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

Hi Greg,

On Tue, Oct 21, 2025 at 09:37:50AM +0200, Greg Kroah-Hartman wrote:
> As per this type of change, have you tested it on real hardware?
> Without that, we can't accept this change, and such checkpatch.pl
> comments should be ignored.

Thanks for clarifying!

I don't have access to the hardware for this driver, so I'll skip these
types of timing-related changes for now and focus on other
non-functional cleanups in staging instead.

Thanks again,
Olle
