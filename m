Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455ED8BE17
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 18:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD554896B0;
	Tue, 13 Aug 2019 16:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF2DF6E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 16:19:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AC8037215A; Tue, 13 Aug 2019 16:19:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Tue, 13 Aug 2019 16:19:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-2q2leQ8bPI@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2075271404=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2075271404==
Content-Type: multipart/alternative; boundary="15657131671.C0dA4d.2538"
Content-Transfer-Encoding: 7bit


--15657131671.C0dA4d.2538
Date: Tue, 13 Aug 2019 16:19:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #87 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #86)
> (In reply to Mauro Gaspari from comment #85)
> > I will first try to reintroduce the kernel parameters I previously used.
> > Do you think those can help at all?
> > [...]
> > GPU
> > amdgpu.dc=3D1
>=20
> Not needed: dc will be automatically enabled on recent GPU
>=20
> > amdgpu.vm_update_mode=3D0
>=20
> Shouldn't be needed since it should be the default value.=20
>=20
> > amdgpu.dpm=3D-1
>=20
> Not needed: this is the default value
>=20
> > amdgpu.ppfeaturemask=3D0xffffffff
>=20
> The only difference with the default value is that you're enabling Overdr=
ive.
> I'd suggest to keep the default parameter here.
>=20
> > amdgpu.vm_fault_stop=3D2
>=20
> I think this one isn't helpful (it's a debugging tool)
>=20
> > amdgpu.vm_debug=3D1
>=20
> This one can help.
>=20
> > amdgpu.gpu_recovery=3D0
>=20
> No opinion on this one :)

Thank you!

I am currently testing on ubuntu budgie with valve-released Mesa-ACO and so
far, I am having no freezes nor crashes. Couple of days without incidents. =
But
as I posted previously, it is all a bit random so I think I will need to use
this for at least a week.=20

I will report back soon with my findings.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657131671.C0dA4d.2538
Date: Tue, 13 Aug 2019 16:19:27 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c87">Comme=
nt # 87</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D109955#c86">comment #86</a>)
<span class=3D"quote">&gt; (In reply to Mauro Gaspari from <a href=3D"show_=
bug.cgi?id=3D109955#c85">comment #85</a>)
&gt; &gt; I will first try to reintroduce the kernel parameters I previousl=
y used.
&gt; &gt; Do you think those can help at all?
&gt; &gt; [...]
&gt; &gt; GPU
&gt; &gt; amdgpu.dc=3D1
&gt;=20
&gt; Not needed: dc will be automatically enabled on recent GPU
&gt;=20
&gt; &gt; amdgpu.vm_update_mode=3D0
&gt;=20
&gt; Shouldn't be needed since it should be the default value.=20
&gt;=20
&gt; &gt; amdgpu.dpm=3D-1
&gt;=20
&gt; Not needed: this is the default value
&gt;=20
&gt; &gt; amdgpu.ppfeaturemask=3D0xffffffff
&gt;=20
&gt; The only difference with the default value is that you're enabling Ove=
rdrive.
&gt; I'd suggest to keep the default parameter here.
&gt;=20
&gt; &gt; amdgpu.vm_fault_stop=3D2
&gt;=20
&gt; I think this one isn't helpful (it's a debugging tool)
&gt;=20
&gt; &gt; amdgpu.vm_debug=3D1
&gt;=20
&gt; This one can help.
&gt;=20
&gt; &gt; amdgpu.gpu_recovery=3D0
&gt;=20
&gt; No opinion on this one :)</span >

Thank you!

I am currently testing on ubuntu budgie with valve-released Mesa-ACO and so
far, I am having no freezes nor crashes. Couple of days without incidents. =
But
as I posted previously, it is all a bit random so I think I will need to use
this for at least a week.=20

I will report back soon with my findings.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657131671.C0dA4d.2538--

--===============2075271404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2075271404==--
