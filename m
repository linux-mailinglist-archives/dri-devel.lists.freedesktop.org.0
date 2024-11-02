Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B943B9BA2B4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 23:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7088C10E314;
	Sat,  2 Nov 2024 22:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.b="siV35kK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574E010E148
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gRdoADem0zi3UiPGufevBBdXeee4wC93CBeg2OV7GkM=; b=siV35kK1g1+QJ3GQvf6cmw53CE
 FRCDIEOreFqbmhbkCLZsSHAm4yeYhjJ5gKOWRUahEOiLnDvibrxUNzV2LLRsf89e8yRVbDTzIaBI8
 moOd8grqJqCQ6pEEO3yVxO1PmGYeEyXxwZBuXUdeICBocNDgVNiGssk7VPockapDNesdotdwBNpmt
 BJXcpNbaTTj1LfSn45EjlIYHYje4DY6AinU7TN+K9g2TigsS2ug4Lld7Ddo76dK93TAuvTTlzy6In
 MmEtnJ9oo3AOruesWjn9+hoH79ncjg2n1+czjydf8jl0P4jCF/1RnBGrwco7fqljjWYcecGeEs/UN
 c72enfNA==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <cjwatson@debian.org>)
 id 1t7JSZ-00AqcD-D6; Sat, 02 Nov 2024 19:06:55 +0000
Received: from ns1.rosewood.vpn.ucam.org ([172.20.153.2] helo=riva.ucam.org)
 by riva.rosewood.vpn.ucam.org with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cjwatson@debian.org>) id 1t7JSY-0044X1-0k;
 Sat, 02 Nov 2024 19:06:54 +0000
Date: Sat, 2 Nov 2024 19:06:53 +0000
From: Colin Watson <cjwatson@debian.org>
To: "G. Branden Robinson" <cjwatson@debian.org>
Cc: Alejandro Colomar <alx@kernel.org>, Ian Rogers <irogers@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <ZyZ4Tfxfr7M-EqUo@riva.ucam.org>
Mail-Followup-To: Alejandro Colomar <alx@kernel.org>,
 Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, groff@gnu.org
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102100837.anfonowxfx4ekn3d@illithid>
X-Debian-User: cjwatson
X-Mailman-Approved-At: Sat, 02 Nov 2024 22:14:05 +0000
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

On Sat, Nov 02, 2024 at 05:08:37AM -0500, G. Branden Robinson wrote:
> On GNU/Linux systems, the only man page indexer I know of is Colin
> Watson's man-db--specifically, its mandb(8) program.  But it's nicely
> designed so that the "topic and summary description extraction" task is
> delegated to a standalone tool, lexgrog(1), and we can use that.
> 
> $ lexgrog /tmp/proc_pid_fdinfo_mini.5
> /tmp/proc_pid_fdinfo_mini.5: parse failed
> 
> Oh, damn.  I wasn't expecting that.  Maybe this is what defeats Michael
> Kerrisk's scraper with respect to groff's man pages.[1]

How embarrassing.  Could somebody please file a bug on
https://gitlab.com/man-db/man-db/-/issues to remind me to fix that?  (Of
course there'll be a lead time for fixes to get into distributions.)

> Well, I can find a silver lining here, because it gives me an even
> better reason than I had to pitch an idea I've been kicking around for a
> while.  Why not enhance groff man(7) to support a mode where _it_ will
> spit out the "Name"/"NAME" section, and only that, _for_ you?
> 
> This would be as easy as checking for an option, say '-d EXTRACT=Name',
> and having the package's "TH" and "SH" macro definitions divert
> (literally, with the `di` request) everything _except_ the section of
> interest to a diversion that is then never called/output.  (This is
> similar to an m4 feature known as the "black hole diversion".)
> 
> All of the features necessary to implement this[2] were part of troff as
> far as back as the birth of the man(7) package itself.  It's not clear
> to me why it wasn't done back in the 1980s.
> 
> lexgrog(1) itself will of course have to stay around for years to come,
> but this could take a significant distraction off of Colin's plate--I
> believe I have seen him grumble about how much *roff syntax he has to
> parse to have the feature be workable, and that's without upstart groff
> maintainers exploring up to every boundary that existed even in 1979 and
> cheerfully exercising their findings in man pages.

lexgrog(1) is a useful (if oddly-named, sorry) debugging tool, but if
you focus on that then you'll end up with a design that's not very
useful.  What really matters is indexing the whole system's manual
pages, and mandb(8) does not do that by invoking lexgrog(1) one page at
a time, but rather by running more or less the same code in-process.  I
already know that getting acceptable performance for this requires care,
as illustrated by one of the NEWS entries for man-db 2.10.0:

 * Significantly improve `mandb(8)` and `man -K` performance in the common
   case where pages are of moderate size and compressed using `zlib`: `mandb
   -c` goes from 344 seconds to 10 seconds on a test system.

... so I'm prepared to bet that forking nroff one page at a time will be
unacceptably slow.  (This also combines with the fact that man-db
applies some sandboxing when it's calling nroff just in case it might
happen that a moderately-sized C++ project has less than 100% perfect
security when doing text processing, which I'm sure everyone agrees
would never happen.)

If it were possible to run nroff over a whole batch of pages and get
output for each of them in one go, then maaaaybe.  man-db would need a
reliable way to associate each line (or sometimes multiple lines) of
output with each source file, and of course care would be needed around
error handling and so on.  I can see the appeal, in terms of processing
the actual language rather than a pile of hacks that try to guess what
to do with it - but on the other hand this starts to feel like a much
less natural fit for the way nroff is run in every other situation,
where you're processing one document at a time.

Cheers,

-- 
Colin Watson (he/him)                              [cjwatson@debian.org]
