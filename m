Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D8E63E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 17:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F0B8912B;
	Mon, 29 Apr 2019 15:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22B4C89216
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 15:24:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1F1C872155; Mon, 29 Apr 2019 15:24:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105684] Loading amdgpu hits general protection fault: 0000 [#1]
 SMP NOPTI
Date: Mon, 29 Apr 2019 15:24:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: j.frenzel@openthinclient.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-105684-502-EKfs64mFb7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105684-502@http.bugs.freedesktop.org/>
References: <bug-105684-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0862194788=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0862194788==
Content-Type: multipart/alternative; boundary="15565514661.251E.31193"
Content-Transfer-Encoding: 7bit


--15565514661.251E.31193
Date: Mon, 29 Apr 2019 15:24:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105684

J=C3=B6rn Frenzel <j.frenzel@openthinclient.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |j.frenzel@openthinclient.co
                   |                            |m

--- Comment #44 from J=C3=B6rn Frenzel <j.frenzel@openthinclient.com> ---
Created attachment 144109
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144109&action=3Dedit
Oops on debian kernel 4.19.0-0.bpo.4-amd64

Hi,

the issue seems to persist in Debian 9 with kernel 4.19.0-0.bpo.4-amd64. My
hardware:

Handle 0x0001, DMI type 1, 27 bytes
System Information
        Manufacturer: HP
        Product Name: HP t530 Thin Client
        Version:=20=20

00:01.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Stoney [Radeon R2/R3/R4/R5 Graphics] [1002:98e4] (rev 83)
        Subsystem: Hewlett-Packard Company Stoney [Radeon R2/R3/R4/R5 Graph=
ics]
[103c:8267]
        Kernel modules: amdgpu

Any new ideas on this?

Regards, J=C3=B6rn

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565514661.251E.31193
Date: Mon, 29 Apr 2019 15:24:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:j.frenzel=
&#64;openthinclient.com" title=3D"J=C3=B6rn Frenzel &lt;j.frenzel&#64;opent=
hinclient.com&gt;"> <span class=3D"fn">J=C3=B6rn Frenzel</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Loading amdgpu hits general protection fault: 0000 [=
#1] SMP NOPTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105684">bug 10568=
4</a>
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
           <td>j.frenzel&#64;openthinclient.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Loading amdgpu hits general protection fault: 0000 [=
#1] SMP NOPTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105684#c44">Comme=
nt # 44</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Loading amdgpu hits general protection fault: 0000 [=
#1] SMP NOPTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105684">bug 10568=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
j.frenzel&#64;openthinclient.com" title=3D"J=C3=B6rn Frenzel &lt;j.frenzel&=
#64;openthinclient.com&gt;"> <span class=3D"fn">J=C3=B6rn Frenzel</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144109=
" name=3D"attach_144109" title=3D"Oops on debian kernel 4.19.0-0.bpo.4-amd6=
4">attachment 144109</a> <a href=3D"attachment.cgi?id=3D144109&amp;action=
=3Dedit" title=3D"Oops on debian kernel 4.19.0-0.bpo.4-amd64">[details]</a>=
</span>
Oops on debian kernel 4.19.0-0.bpo.4-amd64

Hi,

the issue seems to persist in Debian 9 with kernel 4.19.0-0.bpo.4-amd64. My
hardware:

Handle 0x0001, DMI type 1, 27 bytes
System Information
        Manufacturer: HP
        Product Name: HP t530 Thin Client
        Version:=20=20

00:01.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Stoney [Radeon R2/R3/R4/R5 Graphics] [1002:98e4] (rev 83)
        Subsystem: Hewlett-Packard Company Stoney [Radeon R2/R3/R4/R5 Graph=
ics]
[103c:8267]
        Kernel modules: amdgpu

Any new ideas on this?

Regards, J=C3=B6rn</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565514661.251E.31193--

--===============0862194788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0862194788==--
