Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DEB83152B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4308710E70D;
	Thu, 18 Jan 2024 08:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E0810E70D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:54:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 340A2B813D3;
 Thu, 18 Jan 2024 08:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1043EC433F1;
 Thu, 18 Jan 2024 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1705568079;
 bh=NvDgfWGKH3611urjnU880VyH0+2OEkUrzfs6WktS424=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iLMKorbiRcg59HMkoHyJCr5ewM0nhzXX9zLT3fE3BdHariJL/proWpxBOyFV3TE0/
 su5hR3bbEFVjswif9sOCTLKPU7jTYWFaIy1mN7ALW2mwRcWP0W7xxO+9EZeaJFnzyV
 QtbVJffCzPcWTmQBQFqT5lIk08ys8CznvWpZ4xJU=
Date: Thu, 18 Jan 2024 09:54:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 31/45] tty: vt: use VESA blanking constants
Message-ID: <2024011857-anything-fascism-80f6@gregkh>
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-32-jirislaby@kernel.org>
 <39622a13-3999-4bf6-b8fc-f7a70c8cd5da@suse.de>
 <4976e06c-dffd-4b93-a828-34f998f2472a@kernel.org>
 <4ae60e8c-6a86-4895-b8fe-48de5b64b6c8@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ae60e8c-6a86-4895-b8fe-48de5b64b6c8@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 09:41:34AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.01.24 um 09:32 schrieb Jiri Slaby:
> > On 18. 01. 24, 9:30, Thomas Zimmermann wrote:
> > > Am 18.01.24 um 08:57 schrieb Jiri Slaby (SUSE):
> > > > There are VESA blanking constants defined in console.h already. So use
> > > > them in the console code instead of constant values.
> > > 
> > > These constants also exist in include/uapi/linux/fb.h. It would be
> > > nice to find a common header where they can be shared.
> > 
> > Hi,
> > 
> > see 32/45.
> > 
> > I actually don't know how to fix that nicely while keeping uapi happy.
> 
> Is it hard to get a new UAPI header accepted (honest question)?

No.

> There are a few things I'd like to split off from fbdev. But that
> would require UAPI headers.

That's fine, create them, but you can't just delete an existing .h file
as that will usually break things.

thanks,

greg k-h
