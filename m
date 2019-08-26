Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753349C7DD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 05:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78756E15B;
	Mon, 26 Aug 2019 03:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 636996E167
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 03:20:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5F02D72161; Mon, 26 Aug 2019 03:20:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 26 Aug 2019 03:20:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110674-502-LItGBEsKjV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0709367128=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0709367128==
Content-Type: multipart/alternative; boundary="15667896343.8079.10914"
Content-Transfer-Encoding: 7bit


--15667896343.8079.10914
Date: Mon, 26 Aug 2019 03:20:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #119 from ReddestDream <reddestdream@gmail.com> ---
Created attachment 145158
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145158&action=3Dedit
DebugAMD2Monitors

>I don't think I have time to try it today but if anyone is recompiling the=
 code adding
>pr_err("msg: %d / parameter: %d\n", msg, parameter);=20
>to this function in smumgr.c would be a useful addition.


So, I've done just this. I also added a speed/width check to
amdgpu_device_get_min_pci_speed_width in amdgpu_device.c to check the value=
s of
cur_speed and cur_width.

I ran two checks with 5.2.9, one with two monitors on Radeon VII and another
with my stable 1 monitor on each Radeon VII and Intel iGPU.

Please find them attached.

Thanks so much for all your help!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667896343.8079.10914
Date: Mon, 26 Aug 2019 03:20:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c119">Comm=
ent # 119</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145158=
" name=3D"attach_145158" title=3D"DebugAMD2Monitors">attachment 145158</a> =
<a href=3D"attachment.cgi?id=3D145158&amp;action=3Dedit" title=3D"DebugAMD2=
Monitors">[details]</a></span>
DebugAMD2Monitors

<span class=3D"quote">&gt;I don't think I have time to try it today but if =
anyone is recompiling the code adding
&gt;pr_err(&quot;msg: %d / parameter: %d\n&quot;, msg, parameter);=20
&gt;to this function in smumgr.c would be a useful addition.</span >


So, I've done just this. I also added a speed/width check to
amdgpu_device_get_min_pci_speed_width in amdgpu_device.c to check the value=
s of
cur_speed and cur_width.

I ran two checks with 5.2.9, one with two monitors on Radeon VII and another
with my stable 1 monitor on each Radeon VII and Intel iGPU.

Please find them attached.

Thanks so much for all your help!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667896343.8079.10914--

--===============0709367128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0709367128==--
