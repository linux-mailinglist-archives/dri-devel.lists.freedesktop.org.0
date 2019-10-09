Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEB2D04BF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 02:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9595B6E8C3;
	Wed,  9 Oct 2019 00:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 687C36E8C3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 00:24:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 659D872162; Wed,  9 Oct 2019 00:24:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111913] AMD Navi10 GPU powerplay issues when using two
 DisplayPort connectors
Date: Wed, 09 Oct 2019 00:24:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111913-502-Vq09WjXmH7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111913-502@http.bugs.freedesktop.org/>
References: <bug-111913-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0076168318=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0076168318==
Content-Type: multipart/alternative; boundary="15705806561.D6ab0.17569"
Content-Transfer-Encoding: 7bit


--15705806561.D6ab0.17569
Date: Wed, 9 Oct 2019 00:24:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111913

--- Comment #9 from Andrew Sheldon <asheldon55@gmail.com> ---
(In reply to Stefan Rehm from comment #8)
> In my case the resolution of both monitors is 2560x1440

You could try overclocking (or underclocking) one or both monitors to see if
the bug still exists, using:
https://github.com/kevinlekiller/cvt_modeline_calculator_12

I recommend using the "-b" option which uses reduced blanking V2 mode, but =
you
could experiment with different options.

Then to use it:

xrandr --output <monitor output> --newmode <modeline name> <modeline details
from cvt>

xrandr --output <monitor output> --addmode <monitor output> <modeline name>

xrandr --output <monitor output> --mode <modeline name>

Modeline name being whatever you like.

You'll probably have to launch X with one of the monitors disconnected (as =
the
bug may trigger before you can apply the modeline change). I believe the am=
dgpu
DDX has support for specifying modelines, but I don't know the syntax off t=
he
top of my head.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15705806561.D6ab0.17569
Date: Wed, 9 Oct 2019 00:24:16 +0000
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
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913">bug 11191=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>(In reply to Stefan Rehm from <a href=3D"show_bug.cgi?id=3D111=
913#c8">comment #8</a>)
<span class=3D"quote">&gt; In my case the resolution of both monitors is 25=
60x1440</span >

You could try overclocking (or underclocking) one or both monitors to see if
the bug still exists, using:
<a href=3D"https://github.com/kevinlekiller/cvt_modeline_calculator_12">htt=
ps://github.com/kevinlekiller/cvt_modeline_calculator_12</a>

I recommend using the &quot;-b&quot; option which uses reduced blanking V2 =
mode, but you
could experiment with different options.

Then to use it:

xrandr --output &lt;monitor output&gt; --newmode &lt;modeline name&gt; &lt;=
modeline details
from cvt&gt;

xrandr --output &lt;monitor output&gt; --addmode &lt;monitor output&gt; &lt=
;modeline name&gt;

xrandr --output &lt;monitor output&gt; --mode &lt;modeline name&gt;

Modeline name being whatever you like.

You'll probably have to launch X with one of the monitors disconnected (as =
the
bug may trigger before you can apply the modeline change). I believe the am=
dgpu
DDX has support for specifying modelines, but I don't know the syntax off t=
he
top of my head.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15705806561.D6ab0.17569--

--===============0076168318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0076168318==--
