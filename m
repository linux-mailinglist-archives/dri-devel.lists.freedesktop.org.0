Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3807F5A76
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 22:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F786E0A1;
	Fri,  8 Nov 2019 21:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E74A6FAA4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 21:57:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6B61F720E2; Fri,  8 Nov 2019 21:57:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 08 Nov 2019 21:57:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: smith-erc@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-111481-502-6EVfHhUR7E@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1368836493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1368836493==
Content-Type: multipart/alternative; boundary="15732502365.02aE.10442"
Content-Transfer-Encoding: 7bit


--15732502365.02aE.10442
Date: Fri, 8 Nov 2019 21:57:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

Marco Liedtke <smith-erc@gmx.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #145904|0                           |1
        is obsolete|                            |

--- Comment #220 from Marco Liedtke <smith-erc@gmx.de> ---
Created attachment 145917
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145917&action=3Dedit
dmesg of new sdma0 error while watching youtube with firefox, mainline kern=
el
5.3.9, padoka ppa mesa 19.3

Hi,

after installing and testing some configurations, amdgpu pro with amdvlk and
kernel 4.15 (working..) and getting back to radv, cause only radv has no
graphical issues with World of Tanks (wine + dxvk).=20
I have another dmesg output....btw /etc/environment has "export
AMD_DEBUG=3Dnodma" included and it works for me that i can use the pc for 1=
 or 2
hours...much better then before...

so the attachment has many infos from the hang including sdma0 failure...ma=
ybe
this helps...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732502365.02aE.10442
Date: Fri, 8 Nov 2019 21:57:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:smith-erc=
&#64;gmx.de" title=3D"Marco Liedtke &lt;smith-erc&#64;gmx.de&gt;"> <span cl=
ass=3D"fn">Marco Liedtke</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #145904 is obsolete</=
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c220">Comm=
ent # 220</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
smith-erc&#64;gmx.de" title=3D"Marco Liedtke &lt;smith-erc&#64;gmx.de&gt;">=
 <span class=3D"fn">Marco Liedtke</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145917=
" name=3D"attach_145917" title=3D"dmesg of new sdma0 error while watching y=
outube with firefox, mainline kernel 5.3.9, padoka ppa mesa 19.3">attachmen=
t 145917</a> <a href=3D"attachment.cgi?id=3D145917&amp;action=3Dedit" title=
=3D"dmesg of new sdma0 error while watching youtube with firefox, mainline =
kernel 5.3.9, padoka ppa mesa 19.3">[details]</a></span>
dmesg of new sdma0 error while watching youtube with firefox, mainline kern=
el
5.3.9, padoka ppa mesa 19.3

Hi,

after installing and testing some configurations, amdgpu pro with amdvlk and
kernel 4.15 (working..) and getting back to radv, cause only radv has no
graphical issues with World of Tanks (wine + dxvk).=20
I have another dmesg output....btw /etc/environment has &quot;export
AMD_DEBUG=3Dnodma&quot; included and it works for me that i can use the pc =
for 1 or 2
hours...much better then before...

so the attachment has many infos from the hang including sdma0 failure...ma=
ybe
this helps...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732502365.02aE.10442--

--===============1368836493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1368836493==--
