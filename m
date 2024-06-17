Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA60290B437
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C830310E42D;
	Mon, 17 Jun 2024 15:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kp9v/qMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464D710E432
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:27:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0496FCE0F19;
 Mon, 17 Jun 2024 15:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18A8C4AF1C;
 Mon, 17 Jun 2024 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1718638047;
 bh=JqQieqOI7uaMFyxd7GU6ZdU463tO4X0tPf2fLy0tgxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kp9v/qMeE///xRyWXaDyuuwUtJYSiliwMIDIoQTzGa1dKJ9eXZjFd2xZHl57uwt81
 G1KoA67VdxH7Oek6QhLYDnFrgF3ArqWjpIsFijgj+WgbBVnPjEaouzhzCJZdN0jd+1
 9uoEJrgsG7INGo92rGtK0aJlCKQzJKK5WL3puKfo=
Date: Mon, 17 Jun 2024 17:27:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shiva Kiran K <shiva_kr@riseup.net>
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Remove unnecessary parentheses
Message-ID: <2024061759-hemlock-humped-ac2f@gregkh>
References: <20240617142746.51885-2-shiva_kr@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617142746.51885-2-shiva_kr@riseup.net>
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

On Mon, Jun 17, 2024 at 07:57:47PM +0530, Shiva Kiran K wrote:
> Remove unnecessary parentheses in `if` statements.
> Reported by checkpatch.pl

As per the many times this came up in the past (see the mailing list
archives), checkpatch is wrong here.

sorry,

greg k-h
