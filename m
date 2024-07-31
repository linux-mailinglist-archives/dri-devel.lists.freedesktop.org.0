Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5294294C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 10:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD30610E59C;
	Wed, 31 Jul 2024 08:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zJokyidU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C0810E59C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 08:38:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EB475CE12F7;
 Wed, 31 Jul 2024 08:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B281C116B1;
 Wed, 31 Jul 2024 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1722415102;
 bh=PJHNRap1ONRw06JzQHZ+bOu/QyvhIVKClDqpdRjag/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zJokyidUtVT1Ip+sjNrv8uHyUI4ihMnAx4Xt0h33GjiFtU2P9X4WQdK6nzNvq+Zo3
 RVn1ZswiuRm2j8KTcJEedLepgaQZsXajV7nYMB2tkg8pxY9UQjgyC2GQQEbra2AEKq
 JK3eTWHVuWvXSsMSbl6zulnwADtR8sF9LPLUvAxU=
Date: Wed, 31 Jul 2024 10:38:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: vme_bridge.h: Fix mutex without
 comment warning
Message-ID: <2024073122-abnormal-carefully-f53e@gregkh>
References: <20240731073605.9857-1-riyandhiman14@gmail.com>
 <2024073127-babbling-antiquely-22a2@gregkh>
 <CAAjz0Qahd96tQEpbWPXiGQ7Frku3sXpKQ6BfTWzqxcf4ApSYEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAjz0Qahd96tQEpbWPXiGQ7Frku3sXpKQ6BfTWzqxcf4ApSYEA@mail.gmail.com>
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

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Jul 31, 2024 at 01:34:56PM +0530, Riyan Dhiman wrote:
> Hello,
> 
> Thank you for reviewing my patch. I received your feedback:
> > Are you sure about all of these?  Please document them individually and
> > put the proof of that in the changelog text.
> 
> I'd like to clarify a few points to ensure I address your concerns
> correctly:
> 
> 1. By "document them individually", do you mean I should submit
> separate patches for each mutex documentation change?

Yes.

> 2. Regarding the "proof" for the changelog text, could you please elaborate
> on what kind of proof you 're looking for? Should I include:
>  - References to the code where these mutexes are used?
>  - Explanations of the race conditions these mutexes prevent?
>  - Citations from the driver's design documentation (if available)?

Whatever you feel would be needed to convince everyone that the comment
is now correct.

> 3. Is there a preferred format or level of detail you'd like to see in the
> changelog for each documentation change?

What would you want to see if you had to review this type of change to
be comfortable accepting it?

thanks,

greg k-h
