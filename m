Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E98BDE0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 17:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BE189831;
	Tue, 13 Aug 2019 15:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C20F36E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 15:59:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BE6577215A; Tue, 13 Aug 2019 15:59:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Tue, 13 Aug 2019 15:59:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-hDUpHTMmxQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0814248364=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0814248364==
Content-Type: multipart/alternative; boundary="15657119674.07c7f92Ac.30654"
Content-Transfer-Encoding: 7bit


--15657119674.07c7f92Ac.30654
Date: Tue, 13 Aug 2019 15:59:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #86 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com> ---
(In reply to Mauro Gaspari from comment #85)
> I will first try to reintroduce the kernel parameters I previously used.
> Do you think those can help at all?
> [...]
> GPU
> amdgpu.dc=3D1

Not needed: dc will be automatically enabled on recent GPU

> amdgpu.vm_update_mode=3D0

Shouldn't be needed since it should be the default value.=20

> amdgpu.dpm=3D-1

Not needed: this is the default value

> amdgpu.ppfeaturemask=3D0xffffffff

The only difference with the default value is that you're enabling Overdriv=
e.
I'd suggest to keep the default parameter here.

> amdgpu.vm_fault_stop=3D2

I think this one isn't helpful (it's a debugging tool)

> amdgpu.vm_debug=3D1

This one can help.

> amdgpu.gpu_recovery=3D0

No opinion on this one :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657119674.07c7f92Ac.30654
Date: Tue, 13 Aug 2019 15:59:27 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c86">Comme=
nt # 86</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to Mauro Gaspari from <a href=3D"show_bug.cgi?id=3D1=
09955#c85">comment #85</a>)
<span class=3D"quote">&gt; I will first try to reintroduce the kernel param=
eters I previously used.
&gt; Do you think those can help at all?
&gt; [...]
&gt; GPU
&gt; amdgpu.dc=3D1</span >

Not needed: dc will be automatically enabled on recent GPU

<span class=3D"quote">&gt; amdgpu.vm_update_mode=3D0</span >

Shouldn't be needed since it should be the default value.=20

<span class=3D"quote">&gt; amdgpu.dpm=3D-1</span >

Not needed: this is the default value

<span class=3D"quote">&gt; amdgpu.ppfeaturemask=3D0xffffffff</span >

The only difference with the default value is that you're enabling Overdriv=
e.
I'd suggest to keep the default parameter here.

<span class=3D"quote">&gt; amdgpu.vm_fault_stop=3D2</span >

I think this one isn't helpful (it's a debugging tool)

<span class=3D"quote">&gt; amdgpu.vm_debug=3D1</span >

This one can help.

<span class=3D"quote">&gt; amdgpu.gpu_recovery=3D0</span >

No opinion on this one :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657119674.07c7f92Ac.30654--

--===============0814248364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0814248364==--
