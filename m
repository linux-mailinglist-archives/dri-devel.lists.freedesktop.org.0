Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885A48FB1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 21:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E189AB2;
	Mon, 17 Jun 2019 19:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A40E89B3C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:40:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 43C1C72168; Mon, 17 Jun 2019 19:40:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Mon, 17 Jun 2019 19:40:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-110897-502-I56R7B13ax@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1805232213=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1805232213==
Content-Type: multipart/alternative; boundary="15608004061.4D7870A.30845"
Content-Transfer-Encoding: 7bit


--15608004061.4D7870A.30845
Date: Mon, 17 Jun 2019 19:40:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

Richard Thier <u9vata@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144559|0                           |1
        is obsolete|                            |
 Attachment #144560|0                           |1
        is obsolete|                            |

--- Comment #68 from Richard Thier <u9vata@gmail.com> ---
Created attachment 144572
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144572&action=3Dedit
Added back rs400_mc_wait_for_idle - maybe final patch?

I was actually thinking about keeping that part, but it was a do-or-don't
decision. Added a patch that is basically variant 1, but keeps the mentioned
rs400_mc_wait_for_idle call parts untouched. Also I have obsoleted the earl=
ier
two variants.

Is this final patch for this issue maybe? I do not know if anyone still have
glitches with HyperZ on r300 (I do not have any at all), but this kind of h=
eavy
glitches should at least go away now completely for everyone.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15608004061.4D7870A.30845
Date: Mon, 17 Jun 2019 19:40:06 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144559 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144560 is obsolete</=
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c68">Comme=
nt # 68</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144572=
" name=3D"attach_144572" title=3D"Added back rs400_mc_wait_for_idle - maybe=
 final patch?">attachment 144572</a> <a href=3D"attachment.cgi?id=3D144572&=
amp;action=3Dedit" title=3D"Added back rs400_mc_wait_for_idle - maybe final=
 patch?">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bu=
g=3D110897&amp;attachment=3D144572'>[review]</a>
Added back rs400_mc_wait_for_idle - maybe final patch?

I was actually thinking about keeping that part, but it was a do-or-don't
decision. Added a patch that is basically variant 1, but keeps the mentioned
rs400_mc_wait_for_idle call parts untouched. Also I have obsoleted the earl=
ier
two variants.

Is this final patch for this issue maybe? I do not know if anyone still have
glitches with HyperZ on r300 (I do not have any at all), but this kind of h=
eavy
glitches should at least go away now completely for everyone.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15608004061.4D7870A.30845--

--===============1805232213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1805232213==--
