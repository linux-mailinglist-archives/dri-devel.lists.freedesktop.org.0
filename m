Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFED2DF3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 17:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE536EAB4;
	Thu, 10 Oct 2019 15:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 864CA6EB40
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 15:41:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B82DD72167; Thu, 10 Oct 2019 15:41:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111968] Navi10 null pointer dereference in kernel 5.4 while
 running Vulkan CTS
Date: Thu, 10 Oct 2019 15:41:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111968-502-QGh5G5wQnR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111968-502@http.bugs.freedesktop.org/>
References: <bug-111968-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0972576325=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0972576325==
Content-Type: multipart/alternative; boundary="15707220740.5EA6F5ADc.5563"
Content-Transfer-Encoding: 7bit


--15707220740.5EA6F5ADc.5563
Date: Thu, 10 Oct 2019 15:41:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111968

--- Comment #1 from Alex Deucher <alexdeucher@gmail.com> ---
I think that's a bug in dma-buf fixed with this patch:
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D7fbd0782bf94d46993a7=
e5c08c0feda8dcab1f76

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15707220740.5EA6F5ADc.5563
Date: Thu, 10 Oct 2019 15:41:14 +0000
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
   title=3D"NEW - Navi10 null pointer dereference in kernel 5.4 while runni=
ng Vulkan CTS"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111968#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi10 null pointer dereference in kernel 5.4 while runni=
ng Vulkan CTS"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111968">bug 11196=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>I think that's a bug in dma-buf fixed with this patch:
<a href=3D"https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D7fbd0782b=
f94d46993a7e5c08c0feda8dcab1f76">https://cgit.freedesktop.org/drm/drm-misc/=
commit/?id=3D7fbd0782bf94d46993a7e5c08c0feda8dcab1f76</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15707220740.5EA6F5ADc.5563--

--===============0972576325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0972576325==--
