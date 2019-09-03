Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA4A7635
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FCC898A4;
	Tue,  3 Sep 2019 21:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AE61898A4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 21:31:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 658D172161; Tue,  3 Sep 2019 21:31:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109389] memory leak in `amdgpu_bo_create()`
Date: Tue, 03 Sep 2019 21:31:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: czbd@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-109389-502-h7ZPccCU0U@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109389-502@http.bugs.freedesktop.org/>
References: <bug-109389-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0059147480=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0059147480==
Content-Type: multipart/alternative; boundary="15675462682.05cE489Aa.6996"
Content-Transfer-Encoding: 7bit


--15675462682.05cE489Aa.6996
Date: Tue, 3 Sep 2019 21:31:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109389

Czcibor Bohusz-Dobosz <czbd@o2.pl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #145256|0                           |1
        is obsolete|                            |

--- Comment #6 from Czcibor Bohusz-Dobosz <czbd@o2.pl> ---
Created attachment 145257
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145257&action=3Dedit
Galactic Civilizations III memleak log with DXVK

Apologies, looks like I had forgotten to update the methodology in several
places of the DXVK memleak log - this one should be much more accurate.

The updated methodology had however, to my understanding, showcased somethi=
ng
that I had not expected: apparently, the memory allocated by amdgpu_bo_crea=
te()
does not actually accumulate in a linear fashion, instead, it seems like it=
 is
replaced the second time the game is launched. Because of that, there is a
chance that more than the 65 megabytes were actually unavailable after the =
test
without DXVK, perhaps a sum of all the amdgpu_bo_create() calls' allocation=
s.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675462682.05cE489Aa.6996
Date: Tue, 3 Sep 2019 21:31:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:czbd&#64;=
o2.pl" title=3D"Czcibor Bohusz-Dobosz &lt;czbd&#64;o2.pl&gt;"> <span class=
=3D"fn">Czcibor Bohusz-Dobosz</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389">bug 10938=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #145256 is obsolete</=
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
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389">bug 10938=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
czbd&#64;o2.pl" title=3D"Czcibor Bohusz-Dobosz &lt;czbd&#64;o2.pl&gt;"> <sp=
an class=3D"fn">Czcibor Bohusz-Dobosz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145257=
" name=3D"attach_145257" title=3D"Galactic Civilizations III memleak log wi=
th DXVK">attachment 145257</a> <a href=3D"attachment.cgi?id=3D145257&amp;ac=
tion=3Dedit" title=3D"Galactic Civilizations III memleak log with DXVK">[de=
tails]</a></span>
Galactic Civilizations III memleak log with DXVK

Apologies, looks like I had forgotten to update the methodology in several
places of the DXVK memleak log - this one should be much more accurate.

The updated methodology had however, to my understanding, showcased somethi=
ng
that I had not expected: apparently, the memory allocated by amdgpu_bo_crea=
te()
does not actually accumulate in a linear fashion, instead, it seems like it=
 is
replaced the second time the game is launched. Because of that, there is a
chance that more than the 65 megabytes were actually unavailable after the =
test
without DXVK, perhaps a sum of all the amdgpu_bo_create() calls' allocation=
s.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675462682.05cE489Aa.6996--

--===============0059147480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0059147480==--
