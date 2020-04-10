Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B901A4302
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 09:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE6F6EC80;
	Fri, 10 Apr 2020 07:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929AB6EC80
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 07:32:14 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F13B420757;
 Fri, 10 Apr 2020 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586503934;
 bh=CktXQo4G0AH1jtaGrkHCxrmPkUOrXFFdVEeFuTWCX1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vNe4xBieXjLUnuCmwRfYb0ygHCl6jpZrIcHotzcXZxcDa5nvLPO86R0g/HsbALL5f
 X3PTRuNoU8e+pJuzFG0KnKAWQJWy7gPgoKTLP0wlgT2ATPiURJEc2ikV0xx3g9RwPL
 TrDiWll6JvJAe7JDSlOnwdC6hIn8oGFVvdjEKPOU=
Date: Fri, 10 Apr 2020 09:32:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: R Veera Kumar <vkor@vkten.in>
Subject: Re: [PATCH v2] staging: android: ion: use macro
 DEFINE_DEBUGFS_ATTRIBUTE to define debugfs fops
Message-ID: <20200410073211.GA1668699@kroah.com>
References: <20200409171318.1730-1-vkor@vkten.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409171318.1730-1-vkor@vkten.in>
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 10:43:18PM +0530, R Veera Kumar wrote:
> It is more clear to use DEFINE_DEBUGFS_ATTRIBUTE to define debugfs file
> operation rather than DEFINE_SIMPLE_ATTRIBUTE.

No, it is not "more clear", the two defines are not the same thing, they
do different things.  If they were just identical, we would not need
them both :)

So please be very explicit as to _why_ you want to change this, and show
how you have verified that changing this is the correct thing to do, and
how you tested.  Because the user-visible change can be quite different
with this type of kernel change.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
