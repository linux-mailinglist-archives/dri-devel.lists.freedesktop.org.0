Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA6B497C5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 20:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3E410E59D;
	Mon,  8 Sep 2025 18:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="iA/EaYkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B233E10E59D;
 Mon,  8 Sep 2025 18:00:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C20BB40E01AC; 
 Mon,  8 Sep 2025 18:00:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
 reason="fail (body has been altered)"
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aIim8rGBWOt3; Mon,  8 Sep 2025 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1757354435; bh=OCrISNUnSS2VoLZwShkAhPqzsofsopmEGS3rLcrAN4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iA/EaYkd24u/h4NMmpO3jw1MDb3TuADzZMzFUlrEA9VKz0JuAsM7d9nvRMN0yDaqd
 BnbPIWsEwmv/HFSRm6JO+o2sAhcFZ58kOdwSTqCyFSx+ghK+bYsOKJ+Lh+s1X6WO2m
 Wt0gq8jNMJgKTBJyYDmU6Qah7M5D+3mL5SCJ0WLvRG/ea1PDy1ooVYVddzQEKhVK6W
 KUsj/QNK/pumVeFs6y6mrWtKAGbQPp9p2L7WOEuo0UcmmPgAGe9ypTK6ilE4rWLgAD
 BlCTqh/3LSbNnDv+5UnFyLfyY5uIlAmrsANUq7xV2aXxjaOKVQ2QiP1AMwvdPclp3j
 ABWDDAPRAggfLNdxBdaBGGILoY/yDFs+DK1m8TvR9ZUWeqjlkU4ctHycgn5S4qXu+r
 Gxb1uyImlczThycfk6EDXqBowVCPhCC1Mva3lyA4ZEPVe3114HUSLwSNJaHRl35yKX
 dZo39Ugykxs3r+9BmJt7Swp14gl2FJGDmuRd+faKEo0m7I9Naezr1nXryPmM9MevzG
 YMpk7MlTOyzL6osIIipmm1HKcuDg/ao0V9RaDj8OQav+A1qyI06TTxfrcfAKiwFprz
 vRwfu7rW3UigUSVjwR/NClHWbbMuJawmtEHocN8zy5sV8uwHqbSkIdRDigvCP63SLI
 MdrBB6rDhc7CBXR3ZxwAuV8E=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 A215040E015D; Mon,  8 Sep 2025 18:00:28 +0000 (UTC)
Date: Mon, 8 Sep 2025 20:00:22 +0200
From: Borislav Petkov <bp@alien8.de>
To: Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
Message-ID: <20250908180022.GHaL8Zto-PsVsPa0e0@fat_crate.local>
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
 <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
 <51ae551b-6708-4fcd-84f9-fc1400f02427@mailbox.org>
 <20250901101011.GAaLVxA_Ax0R-Wy2IX@fat_crate.local>
 <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 08, 2025 at 07:05:17PM +0200, Michel D=C3=A4nzer wrote:
> These messages are primarily intended for developers, not users

But everybody sees them! And they're flooding the console.

And most people seeing them are users, not developers.

And if those messages are only for developers, they better be not visible=
 by
default but behind a CONFIG_DEBUG or a similar switch.

And developers don't have every hw to test on. So you need to rely on use=
rs to
report issues to you. Because those messages probably don't fire on your =
hw
but someone else would hit them. And the chances are high that someone el=
se is
a user.

So you want to make *all* your messages for users and have them report th=
em
back to you.

> (which will notice and report the corresponding user-space issues inste=
ad).

The case due to which we're having this conversation didn't manifest itse=
lf
into anything - it was only flooding my dmesg. So users will notice nothi=
ng.

> The once variant means user-space developers need to reboot after hitti=
ng it
> once.

/sys/kernel/debug/clear_warn_once

Although when I tried it, it didn't help with dev_warn_once(). Perhaps ne=
eds
adding.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
