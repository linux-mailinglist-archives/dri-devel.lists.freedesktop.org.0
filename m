Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C913DA36E1A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 13:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932F10E19F;
	Sat, 15 Feb 2025 12:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codeweavers.com header.i=@codeweavers.com header.b="jNDFOzmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 933 seconds by postgrey-1.36 at gabe;
 Fri, 14 Feb 2025 18:28:44 UTC
Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BAD10E35D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=s1; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mg29O1IWvz6AYrtMgt2bPfsw5RmrLKeehUhBhUOdQIY=; b=jNDFOzmuvMoKoCXGiFtVfob5ap
 y+MMBpQ9ZkI15CEF72uJt5S/DhA23yquETfZ6oVPqIxJi3ZVXT1VhW6eVMaj7Ic1LURuCy5Ca8Lhq
 zSzN8cvjGFUbOezj2rfA2NnlEltofQyTPdCuxLO9SzHlo6s/Snf9DgG1E1DvKaV7e0kWDxPi3VX1x
 uq4K8b0pcdBSESfgQ0wEwrzjOvUEi25j4Mg4M341Wgear6GGUYEdEo/EgIxdP+WC79f10PN0m1taT
 CgRz770wx5CRLZNZGzRQDnmcG5k8dKgyCA+Vrcgocca8PZCTOuj7CUgTkc5ewaxGkXQBVDYvjS1JA
 50Zq5mzQ==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160]
 helo=camazotz.localnet)
 by mail.codeweavers.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <zfigura@codeweavers.com>) id 1tj0BT-00EN9U-1p;
 Fri, 14 Feb 2025 12:13:03 -0600
From: Elizabeth Figura <zfigura@codeweavers.com>
To: Mike Lothian <mike@fireburn.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 wine-devel@winehq.org, =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
 Wolfram Sang <wsa@kernel.org>, Arkadiusz Hiler <ahiler@codeweavers.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH] ntsync: Set the permissions to be 0666
Date: Fri, 14 Feb 2025 12:13:03 -0600
Message-ID: <1911589.tdWV9SEqCh@camazotz>
In-Reply-To: <2025021456-easiness-facebook-636e@gregkh>
References: <20250214122759.2629-2-mike@fireburn.co.uk>
 <2025021456-easiness-facebook-636e@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Sat, 15 Feb 2025 12:34:12 +0000
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

On Friday, 14 February 2025 07:06:20 CST Greg Kroah-Hartman wrote:
> On Fri, Feb 14, 2025 at 12:28:00PM +0000, Mike Lothian wrote:
> > This allows ntsync to be usuable by non-root processes out of the box
> 
> Are you sure you need/want that?  If so, why?  How did existing testing
> not ever catch this?

Hi, sorry, this is of course my fault.

We do need /dev/ntsync to be openable from user space for it to be useful. I'm not sure what the most "correct" permissions are to have in this case (when we don't specifically need read or write), but I don't think I see a reason not to just set to 666 or 444.

I originally assumed that the right way to do this was not to set the mode on the kernel file but rather through udev; I believe I was using the code for /dev/loop-control or /dev/fuse as an example, which both do that. So I (and others who tested) had just manually set up udev rules for this, with the eventual intent of adding a default rule to systemd like the others. I only recently realized that doing something like this patch is possible and precedented.

I don't know what the best way to address this is, but this is certainly the simplest.


