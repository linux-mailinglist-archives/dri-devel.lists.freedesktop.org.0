Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C89BA2B0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 23:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6F610E232;
	Sat,  2 Nov 2024 22:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ULful+kS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801EC10E1F8
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 10:08:42 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7181285c7c4so1367703a34.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730542121; x=1731146921; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VEbMde+eXraiIBbpjOpG3eujT1p+JDDLVMWK8m10qO0=;
 b=ULful+kS0xS4EdYhWE6AcbWXKKSflbbxG/vcqth5BvTYeOA5g768CHZc4jNo7ra9Jb
 PxTZIUMvOHJHGbsKH1kh/sydeVjnSmyNsPdKRIA0Nbe/9VIMwq5WIfk1S4zQGNiITRCL
 VS5M8vmvcy5JbMhUZrzcsH+PcbnF+SSrjgMk6ACmYjBdUyNu9rX2yO15uZX4PI0oT63r
 jNw6MNEK6CYNAWPn0jYkgUeYDhSisBjq6IRfpurelMD9zBhA8I1X+YvEdovARVVkAt2h
 UPxWxxiYNmSWiS07N27xhhmwYl1t+fg5qVIVSTW5ctwVrfZ/Xk92VwUCi9oltfKdWJnp
 2T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730542121; x=1731146921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEbMde+eXraiIBbpjOpG3eujT1p+JDDLVMWK8m10qO0=;
 b=ONrqqsFCDXC7SMc+foiFLe05fNP+3x95RCKhl6NvP57/tahZeYYegq2PLp2zHHdfzB
 hYfV//85QkcmEKxooOJPadab9n8M4WhC1cm1teI+0+SDKhCcujeuE2mUfDLGNTM/VMSZ
 FWwIj+9WST+5FcoeQ2IZPGtCtHJ8XBhWBkw2iP5xXw2GDMPrrUSw0mpbpLhZqWpCIB4O
 nSpTgLPAw8kBq4FqaKb3VQxC/FDxaYOxmgFKGGgn/6S26XKnU9o08wxhaII+k5KAh/02
 fv+GlLSxjIZxXt/giIwb+3kI75BiiU3zcIZ2r/snCBlF3JkF65Gj2D4VD22nRqDmnX91
 3cug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGOT5RizYevjh42XZX7ZD63dltyBGfyBq8m5HOfYUtVmyf2PJAH2uB9+/HPWrG6VCq99GutBJe9mo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMEi22h1oNw6aWf0n4FY4QGQDlBdsLWX25DuxCvvByNpiMd3YZ
 oOk1Lty/DpQCYQAzOaSP55hUtsOjE2v8TQmf3aHtvT8XXo/A470O
X-Google-Smtp-Source: AGHT+IHBvsMgeKrq3oKXKSABXqmQEbhXQYBnVtdGQacRqSwlTXiLWHPFCkbmf6VTavUq93qPG/Ax8Q==
X-Received: by 2002:a05:6871:a68a:b0:288:60bc:1361 with SMTP id
 586e51a60fabf-2949ed9d5bamr5922265fac.19.1730542121409; 
 Sat, 02 Nov 2024 03:08:41 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7189cc7e86asm1094583a34.37.2024.11.02.03.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 03:08:39 -0700 (PDT)
Date: Sat, 2 Nov 2024 05:08:37 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, cjwatson@debian.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241102100837.anfonowxfx4ekn3d@illithid>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aabs2ooqy7tzaxis"
Content-Disposition: inline
In-Reply-To: <20241101200729.6wgyksuwdtsms3eu@devuan>
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


--aabs2ooqy7tzaxis
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

[adding Colin Watson to CC; and the groff list because I started musing]

Hi Alex,

At 2024-11-01T21:07:29+0100, Alejandro Colomar wrote:
> > > > -/proc/pid/fdinfo/ \- information about file descriptors
> > > > +.IR /proc/ pid /fdinfo " \- information about file descriptors"
> > >
> > > I wouldn't add formatting here for now.  That's something I prefer
> > > to be cautious about, and if we do it, we should do it in a
> > > separate commit.
> >=20
> > I'll move it to a separate patch. Is the caution due to a lack of
> > test infrastructure? That could be something to get resolved,
> > perhaps through Google summer-of-code and the like.
>=20
> That change might be controversial.

Then let those with objections step forward and make them!

(I may be one of them; see below.)

> We'd first need to check that all software that reads the NAME section
> would behave well for this.

Not _all_ software, surely.  Anybody can write a craptastic man(7)
scraper, and several have, mainly back when Web 1.0 was going to eat the
world.  Most of those have withered on the vine.

This is the _Linux_ man-pages project, so what matters are (1) man page
formatters and (2) man page indexers that GNU/Linux systems actually
use.  Where people get nervous with the "NAME" section is because of the
indexer; if one's man(7) _formatter_ can't handle an `IR` call, it
hasn't earned the name.

Here's a sample input.

$ cat /tmp/proc_pid_fdinfo_mini.5
=2ETH proc_pid_fdinfo_mini 5 2024-11-02 "example"
=2ESH Name
=2EIR /proc/ pid /fdinfo " \- information about file descriptors"
=2ESH Description
Text text text text.

Starting with formatters, let's see how they do.

$ nroff -man /tmp/proc_pid_fdinfo_mini.5
proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mini=
(5)

Name
       /proc/pid/fdinfo - information about file descriptors

Description
       Text text text text.

example                           2024=E2=80=9011=E2=80=9002           proc=
_pid_fdinfo_mini(5)
$ mandoc /tmp/proc_pid_fdinfo_mini.5 | ul
proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mini=
(5)

Name
       /proc/pid/fdinfo - information about file descriptors

Description
       Text text text text.

example                           2024-11-02           proc_pid_fdinfo_mini=
(5)
$ ~/heirloom/bin/nroff -man /tmp/proc_pid_fdinfo_mini.5 | ul
proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mini=
(5)



Name
       /proc/pid/fdinfo - information about file descriptors

Description
       Text text text text.



example                           2024-11-02           proc_pid_fdinfo_mini=
(5)
$ DWBHOME=3D~/dwb ~/dwb/bin/nroff -man /tmp/proc_pid_fdinfo_mini.5 | cat -s=
 | ul

       proc_pid_fdinfo_mini(5)example (2024-11-02)roc_pid_fdinfo_mini(5)

       Name
            /proc/pid/fdinfo - information about file descriptors

       Description
            Text text text text.

       Page 1                                        (printed 11/2/2024)

I leave the execution of these to perceive the correct font style
changes as an exercise for the reader, but they all get the
"/proc/pid/fdinfo" line right.

On GNU/Linux systems, the only man page indexer I know of is Colin
Watson's man-db--specifically, its mandb(8) program.  But it's nicely
designed so that the "topic and summary description extraction" task is
delegated to a standalone tool, lexgrog(1), and we can use that.

$ lexgrog /tmp/proc_pid_fdinfo_mini.5
/tmp/proc_pid_fdinfo_mini.5: parse failed

Oh, damn.  I wasn't expecting that.  Maybe this is what defeats Michael
Kerrisk's scraper with respect to groff's man pages.[1]

Well, I can find a silver lining here, because it gives me an even
better reason than I had to pitch an idea I've been kicking around for a
while.  Why not enhance groff man(7) to support a mode where _it_ will
spit out the "Name"/"NAME" section, and only that, _for_ you?

This would be as easy as checking for an option, say '-d EXTRACT=3DName',
and having the package's "TH" and "SH" macro definitions divert
(literally, with the `di` request) everything _except_ the section of
interest to a diversion that is then never called/output.  (This is
similar to an m4 feature known as the "black hole diversion".)

All of the features necessary to implement this[2] were part of troff as
far as back as the birth of the man(7) package itself.  It's not clear
to me why it wasn't done back in the 1980s.

lexgrog(1) itself will of course have to stay around for years to come,
but this could take a significant distraction off of Colin's plate--I
believe I have seen him grumble about how much *roff syntax he has to
parse to have the feature be workable, and that's without upstart groff
maintainers exploring up to every boundary that existed even in 1979 and
cheerfully exercising their findings in man pages.

I also of course have ideas for generalizing the feature, so that you
can request any (sub)section by name, and, with a bit more ambition,[4]
paragraph tags (`TP`) too.

So you could do things like:

nroff -man -d EXTRACT=3D"RETURN VALUE" man3/bsearch.3

and:

nroff -man -d EXTRACT=3D"OPTIONS/-b" man8/zic.8

=2E..does this sound appetizing to anyone?

> Also, many other pages might need to be changed accordingly for
> consistency.

I withdraw the suggestion until lexgrog(1) flexes its own muscles, or
has groff(1) do the lifting.  I'm sorry for prompting churn, Ian.

> No, this isn't outdated, since that reduces the quality of the diff.
> Also, I review a lot of patches in the mail client, without running
> git(1).  And it's not just for reviewing diffs, but also for writing
> them.  Semantic newlines reduce the amount of work for producing the
> diffs.

It's a real win for diffs.

Here's a very recent example from groff.

diff --git a/man/groff.7.man b/man/groff.7.man
index 1fb635f2b..1d248b237 100644
--- a/man/groff.7.man
+++ b/man/groff.7.man
@@ -1281,6 +1281,7 @@ .SH Identifiers
 typeface,
 color,
 special character or character class,
+hyphenation language code,
 environment,
 or stream.
 .


(So recent that in fact I haven't pushed that yet.)

Lists like the foregoing are common in man pages.

Regards,
Branden

[1] https://man7.org/linux/man-pages/dir_by_project.html#groff
[2] String definitions, "string comparisons"[3], and diversions.
[3] strictly, "formatted output comparisons"

    https://www.gnu.org/software/groff/manual/groff.html.node/Operators-in-=
Conditionals.html

    You can do stricter string comparisons in GNU troff.  And I've
    thought of some syntactic sugar for performing them that wouldn't
    break backward compatibility.

[4] To really land the feature, we need automatic tag generation from
    input text (we don't want to make the man page author construct
    their own tags).  Another reason we want the construction to be
    automatic is to make the tags unique when multiple man pages are
    formatted in one run, as one might do when making a book of man
    pages.  Automatic tagging will also enable the slaying of two other
    ancient dragons.

    1.  deep internal links for PDF bookmarks
    2.  pod2man's `IX`-happy output; the widespread use of this
        nonstandard macro confuses way too many novice page authors, and
        bloats document size.

   Another feature we'll really want to do this right is improved string
   processing facilities.  That, too, is something that will pay
   dividends in several areas.  With a proper string iterator in the
   formatter (and a couple more conditional operators),[5] it will be
   possible to write a string library as a macro file, slimming down the
   formatter itself a little and making macro writers' lives easier.
   We're only two days into the month and this has already come up on
   the groff list.

   https://lists.gnu.org/archive/html/groff/2024-11/msg00002.html

[5] https://savannah.gnu.org/bugs/?62264

--aabs2ooqy7tzaxis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcl+h0ACgkQ0Z6cfXEm
bc6Tew//bjp8yetBBhlWQr0hlq2SWKJNTLzeH4Vvwvljv0BOnDDj/HgewU7aGSxh
sRqcB77/5zH7XQxaRIIyRzwro2v5/4fCxwM93yCG3W3TH0M99TSVNh08MHEdouPy
G0TH430t7jH3yvEx+Jk6GAn/1n28Yp3KJbqhiM6lRkpAIJCTKw1Ul2Fb3LzVhzyy
mK2Q1z04P+rKQxY+LjWTSLiu8z09vvY8V1EQGEIaQ7xGdmYMUJ6YMZvwjMwbPg7i
Plsc7A6kCSdYvxuGg8aanY9iUOeVj7XezWfYLOO0fBIFAL3BRk/jfnauhmmWV0lH
LtakHqeH1Fi0fgQmMCF9KuIHJ2ugjkmu/Vh5WnlLHpJlw++xLElHydPggIwKdPW3
fMv0cY8kT0LOhx+Cq8nyBQRhDCnkBqR4x6N3oY44DcMYQ9NhT8YKhRJOfHhanQ5F
vwsnG8f1llPAI9JPosjZp4Sdi0euOPLQIKCHPe1IXcX2XpugXA0DIJYXJOy/9qxH
ULYKAyDa5dVaWf/+M2lu3KBArYvrX/gdBYflyT2jb4tcmOE5mffgbKD/02TNtD5M
YdsVRdHV6wor4m7+KBKckoTEW0azfaYrF7tqBlwu9d7XT28byMtdVzbDwNAUi/87
JXd1R+vqgoUIBa5M2bUnwdt67fgYFSgd6ahz2kefHmH7IloiSYY=
=8bLa
-----END PGP SIGNATURE-----

--aabs2ooqy7tzaxis--
