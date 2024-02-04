Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6988849013
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 20:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8910F940;
	Sun,  4 Feb 2024 19:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="H64FwgkV";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="80V/cH2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [46.30.211.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E2C10F940
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 19:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:to:from:
 date:from; bh=fpJe+ZWxuYGRqiTWDJhGrptuD0C5OKl3hDjFax0lIjw=;
 b=H64FwgkV5WZ4jw3sVS4I3jHDmdQheACk3uS6z+GzDDnTxABipZMyPZqiiDkP95NduZDXM5Yv/53Yo
 1I1QRB/kF8RIohD6zt2MgYsB0H0mT5fu37fHJfGFZejhH8Kc6EYpqtD+9jD1J8ZBYKC0wkUjPB3kZz
 eyJpZHIOUTb1s9oYe+tOYOWjgSCkx7KSe8ox3F3ct2CYEiMlwE1uJq+doULNvx43AllqL+GeKqUnLT
 2b6l0cXMDNCN024IsspAijbf/ZEfs6nXpAQPFFkosmOGKsyMTQKp1WI5m1mqnNTHNiRdTEtc+u6xXN
 Arn8bHYgBZopHj8qCQZxPbRBFUs5EHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:to:from:
 date:from; bh=fpJe+ZWxuYGRqiTWDJhGrptuD0C5OKl3hDjFax0lIjw=;
 b=80V/cH2HNCxHVLy7b/Oi7n46poVf24quLfcg0PY17uNn3UYE7AtbM/m5JYa7O28gsIXzj9K8gf0D4
 IuBv35bAg==
X-HalOne-ID: 9c002278-c392-11ee-980a-b520e3c7e1da
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 9c002278-c392-11ee-980a-b520e3c7e1da;
 Sun, 04 Feb 2024 19:21:35 +0000 (UTC)
Date: Sun, 4 Feb 2024 20:21:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@kernel.org>,
 Andreas Larsson <andreas@gaisler.com>, Helge Deller <deller@gmx.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/27] sparc32: sunset sun4m and sun4d
Message-ID: <20240204192134.GB896678@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
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

Hi Andreas.

Congratulation being the new sparc co-maintainer!

On Tue, Dec 19, 2023 at 11:03:05PM +0100, Sam Ravnborg via B4 Relay wrote:
> This is the second attempt to sunset sun4m and sun4d.
> See [1] for the inital attempt.

I have now verified that the kernel can boot with qemu.
There was a bug in the uart driver that is fixed and upstream, and then
using the instructions you provided I could use buildroot with an
external kernel tree to get a booting kernel.

Assuming you agree with the patchset how do you want me to move forward?
I can rebase on top of the latest -rc and collect acks if that helps.

Arnd promised to pick up the patches until you got a git tree up,
but I do not expect Arnd to pick up anything unless you have acked or
reviewed said patch(es).

If I rebase the patch-set I will likely include a few bug-fix patches that
was prepared in the meantime.
I can also send them as a separate series, no worries.

	Sam
