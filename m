Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9010F93B21C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7C610E0E3;
	Wed, 24 Jul 2024 13:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p6rMMhxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67AA10E6E5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 13:55:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2259ECE10A2;
 Wed, 24 Jul 2024 13:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EF7C32781;
 Wed, 24 Jul 2024 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721829327;
 bh=bc7va+Bv8EJLQaG0jjbUekIN+PKCy7lo0JaWmHs7U9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6rMMhxV66cyVaeQLl0mQuFFXt0CvFks9Xm2efTGYmmtt04q96gsI9W9ASrP3rYXB
 MSOTlrCDpTCy0yn8XQ8RphW8kvmdqNZTxSbFFbh/xswRS52Hl8FX91G3dZIPM+biPX
 ZohPwweMHHeyAzDIfy2teE16j02AYTktgw3/elss=
Date: Wed, 24 Jul 2024 15:55:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: remove unnecessary braces in if
 statements and space before close parenthesis in function call
Message-ID: <2024072441-evasion-armored-42f1@gregkh>
References: <20240723060311.32043-1-riyandhiman14@gmail.com>
 <2024072339-elderly-charbroil-5d5d@gregkh>
 <CAAjz0QbtK=c98QP5t76_=_Xrg4+3bHksXR=_QJfz0W0f_zZ=vA@mail.gmail.com>
 <2024072320-trimness-scribe-8055@gregkh>
 <CAAjz0QZpJWBHxn131xaeGHoUyLA3rf4JGRW9Vaw6ko9+zEz8hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjz0QZpJWBHxn131xaeGHoUyLA3rf4JGRW9Vaw6ko9+zEz8hA@mail.gmail.com>
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

On Wed, Jul 24, 2024 at 06:22:55PM +0530, Riyan Dhiman wrote:
> Hi,
> 
> Thank you for your feedback on my patch submission.
> I understand that the fix provided by my patch is not needed. As this is my
> first contribution to the Linux kernel, I am eager to learn and make
> valuable contributions.
> To ensure my future submissions are more aligned with the needs, I would
> like to know if it would be helpful for me to focus on the following types
> of fixes:
> 
>    - CHECK: usleep_range is preferred over udelay; see
>    Documentation/timers/timers-howto.rst

That's very hard to fix without access to the device and the knowledge
of what needs to happen.  See the archives for where people have tried
to do this and the responses they got.

>    - WARNING: Unnecessary ftrace-like logging - prefer using ftrace

That's good to clean up, try that and see!

thanks,
g
reg k-h
