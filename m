Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9285F9BA37F
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 02:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069D810E009;
	Sun,  3 Nov 2024 01:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.b="u6nDwis5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF32E10E009
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 01:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SULx6WWex0zzFL0T/OSMqTCr1B9gJbo9/bk9Ij2EfwI=; b=u6nDwis57Rnxvgsa2eYvT8mt1a
 CGT3O9g8y6unsU9cd4hiWHI3Nlu833C1T/dYb3EpnmzKMaFy2KqBRFx+UbhDOYqpDMzdOyYAsbHG/
 NgFx4MTzGto8f97RMXUV8CJP750z/pJ0PkhKhLuw2uZ1ZaLkuy0LBmUzxtF77FsY+JwhJjv/GGYOe
 OvEvgkC1Zgu6VpSY1cFFicdCPQ+3aLJxbQYK9QkeY1AhEcweXthomy2CzbdGVuoGubyO8AD+K4+Ti
 DPDhHkiO//LXPOhNVe/sVzeG1kY2G/j9tzdrKmB92JCN6XHdcWH3FsB6WeDOAiaD3Jh5tuM25P2TB
 3iAFAsHg==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <cjwatson@debian.org>)
 id 1t7PpZ-00B5DZ-Hg; Sun, 03 Nov 2024 01:55:06 +0000
Received: from ns1.rosewood.vpn.ucam.org ([172.20.153.2] helo=riva.ucam.org)
 by riva.rosewood.vpn.ucam.org with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cjwatson@debian.org>) id 1t7PpX-004umt-2m;
 Sun, 03 Nov 2024 01:55:03 +0000
Date: Sun, 3 Nov 2024 01:55:02 +0000
From: Colin Watson <cjwatson@debian.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
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
Message-ID: <ZybX9q_zReTgdMxU@riva.ucam.org>
Mail-Followup-To: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Alejandro Colomar <alx@kernel.org>, Ian Rogers <irogers@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
 <ZyZ4Tfxfr7M-EqUo@riva.ucam.org>
 <20241103005023.kdv5bkpqkpmsom5g@illithid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103005023.kdv5bkpqkpmsom5g@illithid>
X-Debian-User: cjwatson
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

On Sat, Nov 02, 2024 at 07:50:23PM -0500, G. Branden Robinson wrote:
> At 2024-11-02T19:06:53+0000, Colin Watson wrote:
> > How embarrassing.  Could somebody please file a bug on
> > https://gitlab.com/man-db/man-db/-/issues to remind me to fix that?
> 
> Done; <https://gitlab.com/man-db/man-db/-/issues/46>.

Thanks, working on it.

> > I already know that getting acceptable performance for
> > this requires care, as illustrated by one of the NEWS entries for
> > man-db 2.10.0:
> > 
> >  * Significantly improve `mandb(8)` and `man -K` performance in the
> >    common case where pages are of moderate size and compressed using
> >    `zlib`: `mandb -c` goes from 344 seconds to 10 seconds on a test
> >    system.
> > 
> > ... so I'm prepared to bet that forking nroff one page at a time will
> > be unacceptably slow.
> 
> Probably, but there is little reason to run nroff that way (as of groff
> 1.23).  It already works well, but I have ideas for further hardening
> groff's man(7) and mdoc(7) packages such that they return to a
> well-defined state when changing input documents.

Being able to keep track of which output goes with which input pages is
critical to the indexer, though (as you acknowledge later in your
reply).  It can't just throw the whole lot at nroff and call it a day.

One other thing: mandb/lexgrog also looks for preprocessing filter hints
in pages (`'\" te` and the like).  This is obscure, to be sure, but
either a replacement would need to do the same thing or we'd need to be
certain that it's no longer required.

> > and of course care would be needed around error handling and so on.
> 
> I need to give this thought, too.  What sorts of error scenarios do you
> foresee?  GNU troff itself, if it can't open a file to be formatted,
> reports an error diagnostic and continues to the next `argv` string
> until it reaches the end of input.

That might be sufficient, or man-db might need to be able to detect
which pages had errors.  I'm not currently sure.

> > but on the other hand this starts to feel like a much less natural fit
> > for the way nroff is run in every other situation, where you're
> > processing one document at a time.
> 
> This I disagree with.  Or perhaps more precisely, it's another example
> of the exception (man(1)) swallowing the rule (nroff/troff).  nroff and
> troff were written as Unix filters; they read the standard input stream
> (and/or argument list)[1], do some processing, and write to standard
> output.[2]
> 
> Historically, troff (or one of its preprocessors) was commonly used with
> multiple input files to catenate them.

But this application is not conceptually like catenation (even if it
might be possible to implement it that way).  The collection of all
manual pages on a system is not like one long document that happens to
be split over multiple files, certainly not from an indexer's point of
view.

-- 
Colin Watson (he/him)                              [cjwatson@debian.org]
