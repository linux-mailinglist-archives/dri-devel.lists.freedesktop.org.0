Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C338ECF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 17:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1B089D7D;
	Fri,  7 Jun 2019 15:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25F2989D7D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 15:20:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1987C72167; Fri,  7 Jun 2019 15:20:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Fri, 07 Jun 2019 15:20:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-5ltsL2AJnV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0783805278=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0783805278==
Content-Type: multipart/alternative; boundary="15599208310.5EEedbeB8.22781"
Content-Transfer-Encoding: 7bit


--15599208310.5EEedbeB8.22781
Date: Fri, 7 Jun 2019 15:20:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #54 from Richard Thier <u9vata@gmail.com> ---
> The GPU has a scaler that can scale a smaller image to the native timing.=
  Many > LCD monitors also have a scaler built in to provide the same funct=
ionality.

I see, but still I see a big performance rise when I change the resolution
smaller and let this scaler do its work in the last phase.

I have no idea if there is a real speed difference between this two:
- having 640x480 on a 4:3 aspect screen without a scaler
- Having hardware pixels of 1024x768, but using the scaler in the end as
640x480 software.
- Z tests run for smaller amount of pixels
- Stencil and Z buffers are smaller just like the backbuffer
- etc.

Memory usage on the GPU should be still smaller, pixel shaders still run ra=
rer
times, post processing things still run on smaller amount of pixels etc... =
The
only reason it can be slower if for some reason the scaler circuit would be=
 so
slow while doing its job that it cannot keep its FPS, but I think this is a
highly specialized hardware not doing anything else so I hoped it is just
"fast" and even if there is some loss I guess it is barely measurable - but
tell me if I am wrong as that would be new to me if this has a really
measurable overhead.

In any ways I think it is better to use a same aspect ratio, but smaller
resolution than using the biggest possible native size. Actually on my mach=
ine
I get faster frame rate even if I run a game in 640x480 window on the top l=
eft
corner the same way as if I turn the screen into 640x480 itself and even th=
en I
barely see a difference despite this case I feel there should be some overh=
ead
against using directly a video mode for that..

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599208310.5EEedbeB8.22781
Date: Fri, 7 Jun 2019 15:20:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c54">Comme=
nt # 54</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; The GPU has a scaler that can scale=
 a smaller image to the native timing.  Many &gt; LCD monitors also have a =
scaler built in to provide the same functionality.</span >

I see, but still I see a big performance rise when I change the resolution
smaller and let this scaler do its work in the last phase.

I have no idea if there is a real speed difference between this two:
- having 640x480 on a 4:3 aspect screen without a scaler
- Having hardware pixels of 1024x768, but using the scaler in the end as
640x480 software.
- Z tests run for smaller amount of pixels
- Stencil and Z buffers are smaller just like the backbuffer
- etc.

Memory usage on the GPU should be still smaller, pixel shaders still run ra=
rer
times, post processing things still run on smaller amount of pixels etc... =
The
only reason it can be slower if for some reason the scaler circuit would be=
 so
slow while doing its job that it cannot keep its FPS, but I think this is a
highly specialized hardware not doing anything else so I hoped it is just
&quot;fast&quot; and even if there is some loss I guess it is barely measur=
able - but
tell me if I am wrong as that would be new to me if this has a really
measurable overhead.

In any ways I think it is better to use a same aspect ratio, but smaller
resolution than using the biggest possible native size. Actually on my mach=
ine
I get faster frame rate even if I run a game in 640x480 window on the top l=
eft
corner the same way as if I turn the screen into 640x480 itself and even th=
en I
barely see a difference despite this case I feel there should be some overh=
ead
against using directly a video mode for that..</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599208310.5EEedbeB8.22781--

--===============0783805278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0783805278==--
