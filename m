Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE0933952
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 21:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6585C892DC;
	Mon,  3 Jun 2019 19:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D65389319
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 19:54:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 39B7472167; Mon,  3 Jun 2019 19:54:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107536] gfx_v8_0_priv_reg_irq [amdgpu]] *ERROR* Illegal
 register access in command stream
Date: Mon, 03 Jun 2019 19:54:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107536-502-tUPtx4xA1B@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107536-502@http.bugs.freedesktop.org/>
References: <bug-107536-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0180843004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0180843004==
Content-Type: multipart/alternative; boundary="15595916452.AEd91E.11760"
Content-Transfer-Encoding: 7bit


--15595916452.AEd91E.11760
Date: Mon, 3 Jun 2019 19:54:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107536

--- Comment #6 from Matt Coffin <mcoffin13@gmail.com> ---
I also tried to reproduce with amdgpu.vm_update_mode=3D3, but I can't get X=
org to
launch with that setting (KERNEL (not gpu) fails on a page request with that
setting on, but that might be due to a lower amt of RAM, and the fact that =
I'm
running an RX 590 w/ 8GB of GDDR5, so it might just be trying to allocate t=
oo
much memory?).

The failures do NOT occur if I disable dynamic power management with
amdgpu.dpm=3D0, but obviously, performance sucks with those low clock speed=
s.
Game gets about 14fps.

Manual power management fared no better, but some quick debugging showed th=
at
it might be getting overridden by DXVK's DXGI implementation.

I also logged `sensors` output, which showed that the failures often occur
quickly after the card reaches its maximum power draw at a little over 190W=
. I
thought about increasing that, but I didn't want to fry my hardware since I
don't have much experience mucking around with overclocking/overvolting GPU=
s.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595916452.AEd91E.11760
Date: Mon, 3 Jun 2019 19:54:05 +0000
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
   title=3D"NEW - gfx_v8_0_priv_reg_irq [amdgpu]] *ERROR* Illegal register =
access in command stream"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107536#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gfx_v8_0_priv_reg_irq [amdgpu]] *ERROR* Illegal register =
access in command stream"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107536">bug 10753=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mcoffin13&#64;gmail.com" title=3D"Matt Coffin &lt;mcoffin13&#64;gmail.com&g=
t;"> <span class=3D"fn">Matt Coffin</span></a>
</span></b>
        <pre>I also tried to reproduce with amdgpu.vm_update_mode=3D3, but =
I can't get Xorg to
launch with that setting (KERNEL (not gpu) fails on a page request with that
setting on, but that might be due to a lower amt of RAM, and the fact that =
I'm
running an RX 590 w/ 8GB of GDDR5, so it might just be trying to allocate t=
oo
much memory?).

The failures do NOT occur if I disable dynamic power management with
amdgpu.dpm=3D0, but obviously, performance sucks with those low clock speed=
s.
Game gets about 14fps.

Manual power management fared no better, but some quick debugging showed th=
at
it might be getting overridden by DXVK's DXGI implementation.

I also logged `sensors` output, which showed that the failures often occur
quickly after the card reaches its maximum power draw at a little over 190W=
. I
thought about increasing that, but I didn't want to fry my hardware since I
don't have much experience mucking around with overclocking/overvolting GPU=
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

--15595916452.AEd91E.11760--

--===============0180843004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0180843004==--
