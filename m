Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EF19FE77
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 11:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37235897EB;
	Wed, 28 Aug 2019 09:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D0EA897EB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 09:29:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 59B1B72161; Wed, 28 Aug 2019 09:29:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107825] *ERROR* Couldn't read Speaker Allocation Data Block: -2
Date: Wed, 28 Aug 2019 09:29:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jdelvare@suse.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-107825-502-z2HfzRYXNE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107825-502@http.bugs.freedesktop.org/>
References: <bug-107825-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0632705226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0632705226==
Content-Type: multipart/alternative; boundary="15669845952.9D3cC4.26866"
Content-Transfer-Encoding: 7bit


--15669845952.9D3cC4.26866
Date: Wed, 28 Aug 2019 09:29:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107825

Jean Delvare <jdelvare@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #3 from Jean Delvare <jdelvare@suse.de> ---
Error -2 is ENOENT (No such file or directory). The driver queries the disp=
lay
for audio-related information, while my display does not have speakers nor
headset connector.

Paul, can you confirm that you are also using a DisplayPort cable and that =
your
display does not have speakers?

I suspect that the "error" is pretty much expected in this case and the dri=
ver
is being too verbose about it. Either the calling code should consider -ENO=
ENT
as a non-error, or the helper functions should simply return 0 when no
audio-related data is available from the display.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669845952.9D3cC4.26866
Date: Wed, 28 Aug 2019 09:29:55 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jdelvare&=
#64;suse.de" title=3D"Jean Delvare &lt;jdelvare&#64;suse.de&gt;"> <span cla=
ss=3D"fn">Jean Delvare</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - *ERROR* Couldn't read Speaker Allocation Data Block:=
 -2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107825">bug 10782=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - *ERROR* Couldn't read Speaker Allocation Data Block:=
 -2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107825#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - *ERROR* Couldn't read Speaker Allocation Data Block:=
 -2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107825">bug 10782=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jdelvare&#64;suse.de" title=3D"Jean Delvare &lt;jdelvare&#64;suse.de&gt;"> =
<span class=3D"fn">Jean Delvare</span></a>
</span></b>
        <pre>Error -2 is ENOENT (No such file or directory). The driver que=
ries the display
for audio-related information, while my display does not have speakers nor
headset connector.

Paul, can you confirm that you are also using a DisplayPort cable and that =
your
display does not have speakers?

I suspect that the &quot;error&quot; is pretty much expected in this case a=
nd the driver
is being too verbose about it. Either the calling code should consider -ENO=
ENT
as a non-error, or the helper functions should simply return 0 when no
audio-related data is available from the display.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669845952.9D3cC4.26866--

--===============0632705226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0632705226==--
