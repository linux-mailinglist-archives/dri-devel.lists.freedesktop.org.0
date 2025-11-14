Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2602C5D7D8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3EF10EA80;
	Fri, 14 Nov 2025 14:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QY852fgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6B10EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:10:46 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d7JvQ6yhXz9v68;
 Fri, 14 Nov 2025 15:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763129443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIQi+YNbeakcmVTH0uEqLlp2i6YOdiJ+KsJW6Yga/1Y=;
 b=QY852fgxywa9xxdkTzwzXG7FZvkJ5mecy6K5nWIYhF2LCG/8nSj3pD8ZbmSMJKPZqDsHUh
 CkUHthxzV8ytvWN8XssOmZ0u9vCJjlef9fLETM+bEYrfx77G30dLqUBZz0G6+lUPyORaU1
 ymOMEBKj25+bv2TgURFgXQCE6mdWQwkVrBqC80p9s5ft82KkwX8EtUxLe5rEM3nFhvMRPE
 SWoqQbPAnhTtcHdC+2Y7g2Y5++pkrPP9OOHd9vo9aXWVA5x+u0i+6s/UwSE7bhISWsE+hi
 i3bytx+xGmrleDCecQb/5+uF4OOsHRZl7UOX5neRZ0rpFoKVIQxe6pkpq9QjaQ==
Message-ID: <add6d09c-ea2d-410a-971d-77c8afc1bb0e@mailbox.org>
Date: Fri, 14 Nov 2025 15:10:41 +0100
MIME-Version: 1.0
Subject: Re: Plea for low-latency cursor rendering functionality.
To: rat marrow <ratmarrow@gmail.com>
References: <CAP4Oc0n+CHTR+BNrDhLEjHd5+AK73W5qthaPu6d2jSiD1jC=Ug@mail.gmail.com>
 <bd64a6ca-2a3c-419b-afd8-237a26c9fa1c@mailbox.org>
 <CAP4Oc0ngMRqohS9-PeCApi9FDF2qUZTvYf9xZxN5gk1Nkfhw0A@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
In-Reply-To: <CAP4Oc0ngMRqohS9-PeCApi9FDF2qUZTvYf9xZxN5gk1Nkfhw0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: te3sgbmf31go9x5dnop9pw7isgxdx8ar
X-MBO-RS-ID: 788513d6ec68e62d25c
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


[ Adding the dri-devel list back, please keep it in Cc when following up ]

On 11/13/25 18:21, rat marrow wrote:
>> The choices you're describing are mostly up to the Wayland compositor.
> 
> I suppose I worded that wrong, but you understood where I was getting to. I meant having this functionality available for Wayland compositors to expose control for.

Many of those choices are independent of any new KMS functionality.


>> Instead, I'm proposing a HW_DONE_DEADLINE CRTC property, which the compositor can use to minimize cursor latency. See https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4540 <https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4540> , which also references the kernel changes.
>> 
>> (Speaking to AMD developers, apparently my assumption that AMD GPUs can reflect cursor position changes while a frame is being scanned out was wrong, in which case this should allow getting cursor latency very close to Xorg, certainly within a millisecond)
> 
> Very comforting knowing you've shared similar latency concerns, I was starting to think myself crazy! (Or, /crazier.../)
> 
> I really hope more eyes get put on https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4540 <https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4540> , because from where I am standing, that is a very promising proposal.
> 
> This may again be my short-sightedness around the technicalities of this all, but for posterity sake: all of this work on Mutter specifically /does/ have general application across the compositor space as a whole?

Other compositors will need to implement something similar.

Note that in mutter, this is just a minor optimization for the existing deadline-based cursor handling on the KMS thread, shaving off ~500µs of latency. If a compositor doesn't have something like the latter yet, the new CRTC property on its own is unlikely to be useful.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
