Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60CC8084B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 22:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8706E1CF;
	Sat,  3 Aug 2019 20:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9AC8C6E1CF
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 20:30:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9569072168; Sat,  3 Aug 2019 20:30:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111240] RX 560x is very slow
Date: Sat, 03 Aug 2019 20:30:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: haagch@frickel.club
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-111240-502-aPECXRSplU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111240-502@http.bugs.freedesktop.org/>
References: <bug-111240-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0265613948=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0265613948==
Content-Type: multipart/alternative; boundary="15648642181.d785A.764"
Content-Transfer-Encoding: 7bit


--15648642181.d785A.764
Date: Sat, 3 Aug 2019 20:30:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111240

Christoph Haag <haagch@frickel.club> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |haagch@frickel.club

--- Comment #1 from Christoph Haag <haagch@frickel.club> ---
Created attachment 144944
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144944&action=3Dedit
moment of performance drop

I have the same laptop so I tried it and there is actually an interesting
effect, see attached screenshot.

At first performance is quite good, but at some point during the benchmark,
performance and GPU usage suddenly drops a lot.

The performance then stays low permanently, even when restarting the benchm=
ark,
after waiting for the dgpu get shutdown by runpm.

Maybe I'll take a closer look later with more gallium hud graphs and maybe =
umr
--top, but for now I'll just leave a comment here confirming that there is =
an
issue.

Also loading the benchmark seems to take much longer after the performance =
drop
happens, which seems very suspicious.

Tested on Arch with mesa 19.1.3, Linux 5.1, 5.2 and 5.3-rc2. Happens on all
three kernel versions.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15648642181.d785A.764
Date: Sat, 3 Aug 2019 20:30:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:haagch&#6=
4;frickel.club" title=3D"Christoph Haag &lt;haagch&#64;frickel.club&gt;"> <=
span class=3D"fn">Christoph Haag</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">bug 11124=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>haagch&#64;frickel.club
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">bug 11124=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haagch&#64;frickel.club" title=3D"Christoph Haag &lt;haagch&#64;frickel.clu=
b&gt;"> <span class=3D"fn">Christoph Haag</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144944=
" name=3D"attach_144944" title=3D"moment of performance drop">attachment 14=
4944</a> <a href=3D"attachment.cgi?id=3D144944&amp;action=3Dedit" title=3D"=
moment of performance drop">[details]</a></span>
moment of performance drop

I have the same laptop so I tried it and there is actually an interesting
effect, see attached screenshot.

At first performance is quite good, but at some point during the benchmark,
performance and GPU usage suddenly drops a lot.

The performance then stays low permanently, even when restarting the benchm=
ark,
after waiting for the dgpu get shutdown by runpm.

Maybe I'll take a closer look later with more gallium hud graphs and maybe =
umr
--top, but for now I'll just leave a comment here confirming that there is =
an
issue.

Also loading the benchmark seems to take much longer after the performance =
drop
happens, which seems very suspicious.

Tested on Arch with mesa 19.1.3, Linux 5.1, 5.2 and 5.3-rc2. Happens on all
three kernel versions.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15648642181.d785A.764--

--===============0265613948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0265613948==--
