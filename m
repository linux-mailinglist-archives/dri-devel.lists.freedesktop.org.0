Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18509341C1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 10:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412DF897F0;
	Tue,  4 Jun 2019 08:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CD55897F5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 08:24:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 48E8372167; Tue,  4 Jun 2019 08:24:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 04 Jun 2019 08:24:41 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-110781-502-iFsbca2Fvc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1662339158=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1662339158==
Content-Type: multipart/alternative; boundary="15596366812.bA8C29a7F.28748"
Content-Transfer-Encoding: 7bit


--15596366812.bA8C29a7F.28748
Date: Tue, 4 Jun 2019 08:24:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

Richard Thier <u9vata@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144427|0                           |1
        is obsolete|                            |

--- Comment #26 from Richard Thier <u9vata@gmail.com> ---
Created attachment 144439
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144439&action=3Dedit
Hacky fix working also for 19.x versions

I can confirm the problem with the "possible fix" is because
radeon_get_heap_index does not handle both GTT and VRAM domains at the same
time, but r300 still asks for that.

Added a hacky fix that works on 19.x versions but forces VRAM domain. This
highlights problematic areas for the new versions. I think this latter issu=
e is
because of bitrot happening with r300 as now we re-enabled a code path that=
 was
never happening after the slowdown in 17.x as analysed before.

PS.: Of course the "possible fix" still works when applied directly to the =
17.x
commit that made things slow and that is the better direction, just not to =
the
latest code because of this issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596366812.bA8C29a7F.28748
Date: Tue, 4 Jun 2019 08:24:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:u9vata&#6=
4;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;"> <span cl=
ass=3D"fn">Richard Thier</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144427 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c26">Comme=
nt # 26</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144439=
" name=3D"attach_144439" title=3D"Hacky fix working also for 19.x versions"=
>attachment 144439</a> <a href=3D"attachment.cgi?id=3D144439&amp;action=3De=
dit" title=3D"Hacky fix working also for 19.x versions">[details]</a></span=
> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D110781&amp;attachment=3D=
144439'>[review]</a>
Hacky fix working also for 19.x versions

I can confirm the problem with the &quot;possible fix&quot; is because
radeon_get_heap_index does not handle both GTT and VRAM domains at the same
time, but r300 still asks for that.

Added a hacky fix that works on 19.x versions but forces VRAM domain. This
highlights problematic areas for the new versions. I think this latter issu=
e is
because of bitrot happening with r300 as now we re-enabled a code path that=
 was
never happening after the slowdown in 17.x as analysed before.

PS.: Of course the &quot;possible fix&quot; still works when applied direct=
ly to the 17.x
commit that made things slow and that is the better direction, just not to =
the
latest code because of this issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596366812.bA8C29a7F.28748--

--===============1662339158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1662339158==--
