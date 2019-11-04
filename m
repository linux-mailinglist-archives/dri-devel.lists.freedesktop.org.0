Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3896AEE0D6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 14:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FFA6E423;
	Mon,  4 Nov 2019 13:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBE496E42C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 13:18:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B8FB972104; Mon,  4 Nov 2019 13:18:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110580] [CI][BAT] igt@.* - skip - Chamelium ports not enabled
Date: Mon, 04 Nov 2019 13:18:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arkadiusz.hiler@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact component assigned_to
Message-ID: <bug-110580-502-UFrVsji0zm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110580-502@http.bugs.freedesktop.org/>
References: <bug-110580-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0268082361=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0268082361==
Content-Type: multipart/alternative; boundary="15728734866.50947AD.2312"
Content-Transfer-Encoding: 7bit


--15728734866.50947AD.2312
Date: Mon, 4 Nov 2019 13:18:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110580

Arek Hiler <arkadiusz.hiler@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |
          Component|DRM/Intel                   |IGT
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org

--- Comment #61 from Arek Hiler <arkadiusz.hiler@intel.com> ---
Seems like the only way to get this under control is to make sure that
chamelium ports are plugged at the beginning of each test using displays.

This will add a lot of execution time:
1. XMLRPC calls + reprobing connectors
2. waiting for network to be up after suspend can take multiple seconds

This would only affect [idle runs] as we don't have Chamelium connected to =
any
of the shards (so it's a nop there), so it may be worth a shot.

Moving to IGT.

[idle runs]: https://intel-gfx-ci.01.org/#idle-runs

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15728734866.50947AD.2312
Date: Mon, 4 Nov 2019 13:18:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:arkadiusz=
.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;intel.com=
&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][BAT] igt&#64;.* - skip - Chamelium ports not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110580">bug 11058=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][BAT] igt&#64;.* - skip - Chamelium ports not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110580#c61">Comme=
nt # 61</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][BAT] igt&#64;.* - skip - Chamelium ports not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110580">bug 11058=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
arkadiusz.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;=
intel.com&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span></b>
        <pre>Seems like the only way to get this under control is to make s=
ure that
chamelium ports are plugged at the beginning of each test using displays.

This will add a lot of execution time:
1. XMLRPC calls + reprobing connectors
2. waiting for network to be up after suspend can take multiple seconds

This would only affect [idle runs] as we don't have Chamelium connected to =
any
of the shards (so it's a nop there), so it may be worth a shot.

Moving to IGT.

[idle runs]: <a href=3D"https://intel-gfx-ci.01.org/#idle-runs">https://int=
el-gfx-ci.01.org/#idle-runs</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15728734866.50947AD.2312--

--===============0268082361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0268082361==--
