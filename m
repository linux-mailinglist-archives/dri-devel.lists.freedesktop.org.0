Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8vUxL0SJm2n21QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:55:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B84A170A54
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D379B10E1B4;
	Sun, 22 Feb 2026 22:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L8OJlC2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F50010E1B4
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:54:56 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-8947e6ffd20so39830646d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 14:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771800894; cv=none;
 d=google.com; s=arc-20240605;
 b=KI3fTaqfQD+zwhbNiIT5ZTtBx09t2x4T+o6A9kEuPn/OTW2rgoX99N50ic6cSvjAkf
 4KM5bLmSxG6gYjuLdCwrYsLctanhJDRR4q49p6QfMmwO1LQlB9Braae/TFeS7OSl+1qT
 Fq+cywBhEdy8UskMxSnQj+jlu0kGysP1qF54OtGloFm2Dd7sdxzaF2OYeC0/vRGLccLF
 4i+tYKv60oIVkEOM0x0k+nUm2SyTWvatLaJrKEU+NIWweSx1aPndaYEybUlPohbNvqxf
 LgzaTNbORsSy18MHBSE7J7muTFI90FtDFMbFQGfQxXkXUO/RxpsWcoal1xlCtpYfOfd9
 hHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=P9df7E5H0nqL1MWwN2zbB00tp2oWMXHat79dUOI6V1s=;
 fh=MUu2frE81JBAbaA3jeYXpIJ392rD5gyITHS5sKCh7JM=;
 b=EQlPP7OQzFEA/I287fyz0uTUZN7NWuWPvn82YtrVz4gAN0ywOqysrm8OZ+s4JmyPoW
 eXI1EH3Jw/Y/6JydfG0iJFDKqQ2yQ0YNwSnNpMfF2ptushtiZDWnj7JmWaWyWduGJwCA
 CebL+xAzl15grFYt4xYOgf34Umy8T6HEUogogxRb2aARE7jue4vVh8N0z2P5Koea0inP
 JxeudNsboyLJ9/IPzqm6eWiooht0AkUP3oF9fHMpDJNPhhkxb13r7yEXuDkby6tyaoF4
 LperU4LCzO/jCt6MJBSoOe1E70KHibJASout0qG9rlzP7vaiTrO8kizdjHTT8ZsDCND0
 3bsw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771800894; x=1772405694; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P9df7E5H0nqL1MWwN2zbB00tp2oWMXHat79dUOI6V1s=;
 b=L8OJlC2nfOh6iiAknqLevPJAhFojR07/YsGWkZJXFyGcLWrVkqDhb5Nnk8nhy5PSOn
 IOvJkhhOr+VxzwbWTnC68kVEo5lDlJslXN4/sn78VDEXRtaMJF64AzUQGLe1fLS3uhfe
 u8oWL2auJdbOS8hlKpnbi6y5VRqWnKIEdLx85N95ucHWVMyTiaIfVblTiUdto2tbpLVF
 whP5r/cOZGRmEF+PR2B+Byg/LgWlvQvEdJHi6NQBcTZgdBBYtYT2CO33g8afJOTD8oKL
 gt1kxYua3zcpEVisQlDb3rpoVK/WGzWIJQ7wx6irguwbdS03jNMWYodBfA2riYaR+SyY
 sYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771800894; x=1772405694;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P9df7E5H0nqL1MWwN2zbB00tp2oWMXHat79dUOI6V1s=;
 b=pOWdjiec2sSjI7qkBIy9BsSAMPNY+niX30dbLfVqO8LiX8fl3x360PEzksgJm/MESi
 8GeZlfxrnXzodwaSX/6ZvFfMIgs/ijurV0K573xi1Cl+cv9LTDtZM3pEJHPiMFJGNHfd
 grP4Xl022Lg3fpLi58HFJ0/BQVXk9do0TjiHRCbCkZTD3fXqdFni2V6wkxOmeLNyFNz4
 Zt1+x4Y6XI1dMXuLE5kIF/gckz1AXOUfz/gw1QspKqu3CN3KNoqD+5PyqM2L/XL5mRSg
 SPV5rzNlHtkYNZqO3pECqeustya7E6crnmQdT+J+N2q8ENnXZVWgrb6tDrhSRKxovW9n
 CTHg==
X-Gm-Message-State: AOJu0YxItnAyLpGOvV8JFsdkFqRp29zA8eiPA+iG4z7BMAqxthQoKWA8
 GFStqZp43737tLGPE0OpbeWkxUlMj/3UMG7VrOGAi5PFS2XGL/+Am3eQxvpx33rRYqYs71jck96
 GD3PQzM74PNGYhGxh/9zgOc4twHtfHLR3TlCv
X-Gm-Gg: AZuq6aIVx8nKCfj2AdNL7kP9WkX0tX3wmHfaA8llf0rRkO25C4LpWPSVmnsqtdwMYL5
 iicGNdYdt2/zRn/T2evTiGvNuBhXIjNiqQdPiiz5I0sC9Lf77P6myJv3RrYN9WxGdQ+isl2+z41
 YsI/+rsi5Q1sLkpwNfG5mOxFYUdBEAyqaUONty7m0xSFNwYf+pxHugi5O3H408upOkpJrdh03Lx
 LhKvFsqncE5d1+i/+FXa9rTNQAwl8jmuU221xamR8TR/P9dsafrXgsddNUoJHxijcXPGMS4L4DU
 0qAY7UG/fShQIwsPxOw8xWQug6mWkcmUxgNoJsQa1YwbziFukDno6katW8V/FoBHSApdDMvhW5p
 MBFwmrL7C1nQsHi67ucH2nlvr
X-Received: by 2002:a05:6214:d0d:b0:892:755c:93b1 with SMTP id
 6a1803df08f44-89979e343a0mr106238336d6.15.1771800894560; Sun, 22 Feb 2026
 14:54:54 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 23 Feb 2026 08:54:43 +1000
X-Gm-Features: AaiRm53gPks0_bBeoBUsfMAi3I_DMLQkSL4I-IL5_ZEZIyWyI6Fbn3Js1DvkQ-U
Message-ID: <CAPM=9twkqUu=CJ6+AotavnDga5F=2SGRcjLeZNRy1soFbrO6cA@mail.gmail.com>
Subject: power saving, dpcd access and fwupd/userspace expectations
To: dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Hughes <hughsient@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1B84A170A54
X-Rspamd-Action: no action

I've been hitting a problem on the laptop I used as my desktop for the
last while, and I finally has the inspiration to track it down this
morning at 5am.

The problem is when nouveau goes into runtime pm suspend, and fwupd
hits the /dev/drm_dp_aux* nothing wakes up nouveau, we get to sending
a message to GSP and it times out and I get an oops and things fail.

Now the question I have is what do we want to do in this situation, do
we really want to restore power to the GPU because fwupd is probing
possibly attached docks, or whatever. Like do we want to integrate the
drm_dp_aux stuff into the power domains properly so we can have a
proper hierarchy so it wakes up the parent device when it gets used,
or do we just want to return -EBUSY from the driver when the device is
dynamically off.

I'll probably submit a patch doing the latter when I get to writing it
and test it on my laptop.

Regards,
Dave.
