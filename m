Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1260FBC2CE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248BB897FB;
	Tue, 24 Sep 2019 07:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 819C0897FB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:40:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 71AA072162; Tue, 24 Sep 2019 07:40:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111784] Hang when using glWaitSync with multithreaded shared GL
 contexts
Date: Tue, 24 Sep 2019 07:40:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111784-502-wiepS5aOQo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111784-502@http.bugs.freedesktop.org/>
References: <bug-111784-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0554321271=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0554321271==
Content-Type: multipart/alternative; boundary="15693108070.8998f.12100"
Content-Transfer-Encoding: 7bit


--15693108070.8998f.12100
Date: Tue, 24 Sep 2019 07:40:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111784

--- Comment #3 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
Created attachment 145487
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145487&action=3Dedit
output from gdb

Using the env var "GALLIUM_THREAD=3D0" makes the issue worse (the example h=
angs
at the first iteration).

One app thread is stuck at: glWaitSync(_textureUploadFence, 0,
GL_TIMEOUT_IGNORED);

The other thread is stuck waiting for the first thread to release the mutex.
Before waiting for the mutex it made a call to: "_textureUploadFence =3D
glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0);"

All the mesa internal threads are waiting for work to do.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693108070.8998f.12100
Date: Tue, 24 Sep 2019 07:40:07 +0000
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
   title=3D"NEW - Hang when using glWaitSync with multithreaded shared GL c=
ontexts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111784#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Hang when using glWaitSync with multithreaded shared GL c=
ontexts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111784">bug 11178=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145487=
" name=3D"attach_145487" title=3D"output from gdb">attachment 145487</a> <a=
 href=3D"attachment.cgi?id=3D145487&amp;action=3Dedit" title=3D"output from=
 gdb">[details]</a></span>
output from gdb

Using the env var &quot;GALLIUM_THREAD=3D0&quot; makes the issue worse (the=
 example hangs
at the first iteration).

One app thread is stuck at: glWaitSync(_textureUploadFence, 0,
GL_TIMEOUT_IGNORED);

The other thread is stuck waiting for the first thread to release the mutex.
Before waiting for the mutex it made a call to: &quot;_textureUploadFence =
=3D
glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0);&quot;

All the mesa internal threads are waiting for work to do.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693108070.8998f.12100--

--===============0554321271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0554321271==--
