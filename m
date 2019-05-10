Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B31A53A
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 00:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7A26E7BE;
	Fri, 10 May 2019 22:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 708FB6E7BE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 22:32:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6D2767215A; Fri, 10 May 2019 22:32:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110371] HP Dreamcolor display *Error* No EDID read
Date: Fri, 10 May 2019 22:32:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110371-502-iCxZ8RG9Vk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110371-502@http.bugs.freedesktop.org/>
References: <bug-110371-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1473255004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1473255004==
Content-Type: multipart/alternative; boundary="15575275332.D96C.10457"
Content-Transfer-Encoding: 7bit


--15575275332.D96C.10457
Date: Fri, 10 May 2019 22:32:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110371

--- Comment #10 from Babblebones@gmail.com ---
Best I can tell, and I may be wrong, the error checking code was moved from=
 the
DC part straight into DRM which now replicates the exact bug which was reve=
rted
by the above DC commits but were never implemented for DRM.

https://www.st.com/en/touch-and-display-controllers/stdp8028.html

My dreamcolor display uses a STDP8028 chip, istting inbetween the display a=
nd
the motherboard just behind the screen, to convert a displayport signal com=
ing
off the board into a dual channel LVDS to run the display.

https://www.st.com/en/touch-and-display-controllers/stdp8028.html

The EDID can't be read through this for some reason and it doesn't print any
modelines at all for the display so it picks the lowest resolution possible=
 and
all the timings are incorrect resulting in the display scramble.

I hope the behavior highlighted in the above commit can help someone search=
 for
the regression in the new DRM mode setting as it produces the exact same ty=
pe
of scramble and lack of modelines.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15575275332.D96C.10457
Date: Fri, 10 May 2019 22:32:13 +0000
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
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371">bug 11037=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Babblebones&#64;gmail.com" title=3D"Babblebones&#64;gmail.com">Babblebones&=
#64;gmail.com</a>
</span></b>
        <pre>Best I can tell, and I may be wrong, the error checking code w=
as moved from the
DC part straight into DRM which now replicates the exact bug which was reve=
rted
by the above DC commits but were never implemented for DRM.

<a href=3D"https://www.st.com/en/touch-and-display-controllers/stdp8028.htm=
l">https://www.st.com/en/touch-and-display-controllers/stdp8028.html</a>

My dreamcolor display uses a STDP8028 chip, istting inbetween the display a=
nd
the motherboard just behind the screen, to convert a displayport signal com=
ing
off the board into a dual channel LVDS to run the display.

<a href=3D"https://www.st.com/en/touch-and-display-controllers/stdp8028.htm=
l">https://www.st.com/en/touch-and-display-controllers/stdp8028.html</a>

The EDID can't be read through this for some reason and it doesn't print any
modelines at all for the display so it picks the lowest resolution possible=
 and
all the timings are incorrect resulting in the display scramble.

I hope the behavior highlighted in the above commit can help someone search=
 for
the regression in the new DRM mode setting as it produces the exact same ty=
pe
of scramble and lack of modelines.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15575275332.D96C.10457--

--===============1473255004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1473255004==--
