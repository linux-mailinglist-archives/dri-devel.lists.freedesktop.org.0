Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A893A0DB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2AD10E0D1;
	Tue, 23 Jul 2024 13:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Curd4mrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1076610E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 13:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 850E9CE0E7C;
 Tue, 23 Jul 2024 13:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57570C4AF0A;
 Tue, 23 Jul 2024 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721739965;
 bh=4zf1JXvv0esj9HUFMk4EOsHlw0qJZffThWkBqIIdgpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Curd4mrXxyTXwZWutnk/jTDuGUZOQ83CO59yDgiYhFYG9fvqkwOUTk9xzC9LSEGYD
 GxeAPOKoBc6WeW8AbJ8OAzER1/7+J2wKPVG0AKDasGx2m+05OWgndwa4y1pYdKI9sh
 Gv1KAk8r8n++EwPW5CR3xeZRZbBXsXkwI5yCsG8Q=
Date: Tue, 23 Jul 2024 15:06:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: remove unnecessary braces in if
 statements and space before close parenthesis in function call
Message-ID: <2024072320-trimness-scribe-8055@gregkh>
References: <20240723060311.32043-1-riyandhiman14@gmail.com>
 <2024072339-elderly-charbroil-5d5d@gregkh>
 <CAAjz0QbtK=c98QP5t76_=_Xrg4+3bHksXR=_QJfz0W0f_zZ=vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjz0QbtK=c98QP5t76_=_Xrg4+3bHksXR=_QJfz0W0f_zZ=vA@mail.gmail.com>
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

On Tue, Jul 23, 2024 at 06:28:19PM +0530, Riyan Dhiman wrote:
> Hi,
> 
> Thank you for your feedback on my patch submission.
> I have reviewed the mailing list traffic and noted that the last patch
> addressing the same coding style issue was submitted in April. Given this
> timeframe, I believed it was appropriate to submit my patch to contribute
> to the resolution of the ongoing issue.
> As this is my first contribution to the Linux kernel, I want to ensure that
> my submission aligns with the requirements. I would greatly appreciate your
> guidance on how to improve my patch and avoid duplicating previous efforts.

The issue is that the checkpatch warning for too many () characters is
just not right, and shouldn't be applied for staging fixes, sorry.  The
code is fine as-is.

thanks,

greg k-h
