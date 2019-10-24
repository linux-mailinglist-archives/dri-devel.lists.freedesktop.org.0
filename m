Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD5E3415
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 15:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E89B6E408;
	Thu, 24 Oct 2019 13:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 433356E415
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 13:25:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 404DE720E2; Thu, 24 Oct 2019 13:25:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 24 Oct 2019 13:25:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: ragnaros39216@yandex.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-111481-502-T9Jv6gtq9t@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1566984861=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1566984861==
Content-Type: multipart/alternative; boundary="15719235593.82C495.15019"
Content-Transfer-Encoding: 7bit


--15719235593.82C495.15019
Date: Thu, 24 Oct 2019 13:25:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

L.S.S. <ragnaros39216@yandex.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ragnaros39216@yandex.com

--- Comment #151 from L.S.S. <ragnaros39216@yandex.com> ---
Created attachment 145807
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145807&action=3Dedit
captured GCVM_L2_PROTECTION_FAULT errors in the log. This was captured on
5.4(rc) kernel.

I'm having similar issues with Navi on Manjaro (both 5.3 and 5.4 kernels). =
Both
kernels were from official Manjaro repos.

It's almost 100% reproducible using Cinnamon's file manager, Nemo. It can
happen right after I start it, or after I click something (such as opening a
folder). Interestingly, I haven't gotten a freeze from use web browsers
(Firefox, Chromium) just yet.

When the system froze, the rest of the stuffs are still running. The froze
happened in the morning and since I was about to leave for work I left the
system as is (until I get back home in the evening). The xmrig (CPU) mining
session in the background continued to work as normal as observed from the
pool's dashboard.

It seems the protection fault errors would appear after the system has froz=
en
long enough (I only saw it appear at the time I left it on frozen for a whi=
le,
and the rest of the times I reset my system right after it froze). If reset=
ting
the system only a short a while after the freeze happened, the log will end
only at "ring sdma0 timeout".

It seems the "nodma nongg" trick partially worked on 5.3 (5.3.6 to be preci=
se)
as the system hasn't frozen for the time being (even when using Nemo). It
however, doesn't work with the 5.4 (rc) kernel as I still got a freeze caus=
ed
by the same "ring sdma0 timeout" error.

Off-topic: On 5.3 kernel, the mouse cursor feels sluggish as if my monitor =
is
running at 30Hz (while xrandr reports it's indeed 60Hz), while the mouse cu=
rsor
works fine on 5.4(rc) kernel.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719235593.82C495.15019
Date: Thu, 24 Oct 2019 13:25:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ragnaros3=
9216&#64;yandex.com" title=3D"L.S.S. &lt;ragnaros39216&#64;yandex.com&gt;">=
 <span class=3D"fn">L.S.S.</span></a>
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
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>ragnaros39216&#64;yandex.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c151">Comm=
ent # 151</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ragnaros39216&#64;yandex.com" title=3D"L.S.S. &lt;ragnaros39216&#64;yandex.=
com&gt;"> <span class=3D"fn">L.S.S.</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145807=
" name=3D"attach_145807" title=3D"captured GCVM_L2_PROTECTION_FAULT errors =
in the log. This was captured on 5.4(rc) kernel.">attachment 145807</a> <a =
href=3D"attachment.cgi?id=3D145807&amp;action=3Dedit" title=3D"captured GCV=
M_L2_PROTECTION_FAULT errors in the log. This was captured on 5.4(rc) kerne=
l.">[details]</a></span>
captured GCVM_L2_PROTECTION_FAULT errors in the log. This was captured on
5.4(rc) kernel.

I'm having similar issues with Navi on Manjaro (both 5.3 and 5.4 kernels). =
Both
kernels were from official Manjaro repos.

It's almost 100% reproducible using Cinnamon's file manager, Nemo. It can
happen right after I start it, or after I click something (such as opening a
folder). Interestingly, I haven't gotten a freeze from use web browsers
(Firefox, Chromium) just yet.

When the system froze, the rest of the stuffs are still running. The froze
happened in the morning and since I was about to leave for work I left the
system as is (until I get back home in the evening). The xmrig (CPU) mining
session in the background continued to work as normal as observed from the
pool's dashboard.

It seems the protection fault errors would appear after the system has froz=
en
long enough (I only saw it appear at the time I left it on frozen for a whi=
le,
and the rest of the times I reset my system right after it froze). If reset=
ting
the system only a short a while after the freeze happened, the log will end
only at &quot;ring sdma0 timeout&quot;.

It seems the &quot;nodma nongg&quot; trick partially worked on 5.3 (5.3.6 t=
o be precise)
as the system hasn't frozen for the time being (even when using Nemo). It
however, doesn't work with the 5.4 (rc) kernel as I still got a freeze caus=
ed
by the same &quot;ring sdma0 timeout&quot; error.

Off-topic: On 5.3 kernel, the mouse cursor feels sluggish as if my monitor =
is
running at 30Hz (while xrandr reports it's indeed 60Hz), while the mouse cu=
rsor
works fine on 5.4(rc) kernel.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719235593.82C495.15019--

--===============1566984861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1566984861==--
