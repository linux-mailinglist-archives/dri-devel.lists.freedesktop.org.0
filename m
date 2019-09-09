Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC849ADE44
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 19:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E8289D89;
	Mon,  9 Sep 2019 17:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25A3F89DC9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 17:53:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 228A072167; Mon,  9 Sep 2019 17:53:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Mon, 09 Sep 2019 17:53:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-110659-502-IsMX9NlU0J@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1232925822=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1232925822==
Content-Type: multipart/alternative; boundary="15680515881.FD0D5F21f.11084"
Content-Transfer-Encoding: 7bit


--15680515881.FD0D5F21f.11084
Date: Mon, 9 Sep 2019 17:53:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

tempel.julian@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |NOTOURBUG
             Status|NEW                         |RESOLVED

--- Comment #80 from tempel.julian@gmail.com ---
Oh my. I've tried the oldest Proton build offered by Steam, which is based =
on
Wine 3.7, and indeed it doesn't show the issue (neither in Oblivion with
wined3d OGL nor Hitman 2 DXVK Vulkan). I tried with the older Proton 3.16
version before, which unfortunately is the one that started showing the iss=
ue.
I don't know why I didn't try 3.7 in the first place. I'm sorry for the time
you have invested into this issue. :(
Though it would appear to me that the old non-atomic DC is very resilient
toward such issues.
To be sure, I also tested with untouched Arch 5.2.13 kernel: Without that W=
ine
commit, it is totally free of that stutter issue as well.

Pierre-Eric, I reverted that commit c6b6935bb433dbbd30f5ba122a7c45ad3a2d6ee=
d,
and indeed, it introduced this issue. Should I create a Wine bug ticket for
this?

Closing now. Big thanks @ Michel and Nicholas for their great support. AMD's
kernel and Linux windowing support is simply outstanding, a dam good reason=
 to
stay with team (former) red. :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680515881.FD0D5F21f.11084
Date: Mon, 9 Sep 2019 17:53:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:tempel.ju=
lian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.julian&#64=
;gmail.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - pageflipping seems to cause jittering on m=
ouse input when running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - pageflipping seems to cause jittering on m=
ouse input when running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c80">Comme=
nt # 80</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - pageflipping seems to cause jittering on m=
ouse input when running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>Oh my. I've tried the oldest Proton build offered by Steam, wh=
ich is based on
Wine 3.7, and indeed it doesn't show the issue (neither in Oblivion with
wined3d OGL nor Hitman 2 DXVK Vulkan). I tried with the older Proton 3.16
version before, which unfortunately is the one that started showing the iss=
ue.
I don't know why I didn't try 3.7 in the first place. I'm sorry for the time
you have invested into this issue. :(
Though it would appear to me that the old non-atomic DC is very resilient
toward such issues.
To be sure, I also tested with untouched Arch 5.2.13 kernel: Without that W=
ine
commit, it is totally free of that stutter issue as well.

Pierre-Eric, I reverted that commit c6b6935bb433dbbd30f5ba122a7c45ad3a2d6ee=
d,
and indeed, it introduced this issue. Should I create a Wine bug ticket for
this?

Closing now. Big thanks &#64; Michel and Nicholas for their great support. =
AMD's
kernel and Linux windowing support is simply outstanding, a dam good reason=
 to
stay with team (former) red. :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680515881.FD0D5F21f.11084--

--===============1232925822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1232925822==--
