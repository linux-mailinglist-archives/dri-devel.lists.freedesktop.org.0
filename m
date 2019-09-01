Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091DA4B5C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 21:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB01789BBD;
	Sun,  1 Sep 2019 19:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A421789BBD
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 19:26:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9B9EB72161; Sun,  1 Sep 2019 19:26:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111273] crash calling AMDGPU_INFO_READ_MMR_REG with count set
 to -1
Date: Sun, 01 Sep 2019 19:26:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trek00@inbox.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-111273-502-P26fFDPGsj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111273-502@http.bugs.freedesktop.org/>
References: <bug-111273-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0458457729=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0458457729==
Content-Type: multipart/alternative; boundary="15673659790.8cdc9113C.10193"
Content-Transfer-Encoding: 7bit


--15673659790.8cdc9113C.10193
Date: Sun, 1 Sep 2019 19:26:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111273

Trek <trek00@inbox.ru> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #145226|0                           |1
        is obsolete|                            |

--- Comment #2 from Trek <trek00@inbox.ru> ---
Created attachment 145229
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145229&action=3Dedit
possible fix v2

Thanks to agd5f_, here the patch with updated limit fixed to 128.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15673659790.8cdc9113C.10193
Date: Sun, 1 Sep 2019 19:26:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:trek00&#6=
4;inbox.ru" title=3D"Trek &lt;trek00&#64;inbox.ru&gt;"> <span class=3D"fn">=
Trek</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - crash calling AMDGPU_INFO_READ_MMR_REG with count set to =
-1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111273">bug 11127=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #145226 is obsolete</=
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
   title=3D"NEW - crash calling AMDGPU_INFO_READ_MMR_REG with count set to =
-1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111273#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - crash calling AMDGPU_INFO_READ_MMR_REG with count set to =
-1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111273">bug 11127=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
trek00&#64;inbox.ru" title=3D"Trek &lt;trek00&#64;inbox.ru&gt;"> <span clas=
s=3D"fn">Trek</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145229=
" name=3D"attach_145229" title=3D"possible fix v2">attachment 145229</a> <a=
 href=3D"attachment.cgi?id=3D145229&amp;action=3Dedit" title=3D"possible fi=
x v2">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=
=3D111273&amp;attachment=3D145229'>[review]</a>
possible fix v2

Thanks to agd5f_, here the patch with updated limit fixed to 128.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15673659790.8cdc9113C.10193--

--===============0458457729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0458457729==--
