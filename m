Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4B8BF70
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 19:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850076E200;
	Tue, 13 Aug 2019 17:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B035C6E200
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 17:11:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A61DF7215A; Tue, 13 Aug 2019 17:11:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Tue, 13 Aug 2019 17:11:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-Q1iwrrBV1a@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0155961645=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0155961645==
Content-Type: multipart/alternative; boundary="15657162950.C3Ac7d5BC.11267"
Content-Transfer-Encoding: 7bit


--15657162950.C3Ac7d5BC.11267
Date: Tue, 13 Aug 2019 17:11:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #97 from Tom B <tom@r.je> ---
I've been investigating this:

https://github.com/torvalds/linux/commit/94ed6d0cfdb867be9bf05f03d682980bce=
5d0036

Because vega20 doesn't export display_configuration_change, it jumps to the
newly added else block and calls smu_display_configuration_change. This did=
n't
happen in 5.0.13. It's not the cause of this as I commented it out and it s=
till
breaks.=20
I'll also note that pp_display_cfg->display_count is correct at this point,=
 it
shows 2 for me with 2 screens connected. But why doesn't vega20 export
display_configuration_change? It has display_config_changed and I can't find
where that's called from so I wonder if display_config_changed should be be=
ing
called at this point.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657162950.C3Ac7d5BC.11267
Date: Tue, 13 Aug 2019 17:11:35 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c97">Comme=
nt # 97</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>I've been investigating this:

<a href=3D"https://github.com/torvalds/linux/commit/94ed6d0cfdb867be9bf05f0=
3d682980bce5d0036">https://github.com/torvalds/linux/commit/94ed6d0cfdb867b=
e9bf05f03d682980bce5d0036</a>

Because vega20 doesn't export display_configuration_change, it jumps to the
newly added else block and calls smu_display_configuration_change. This did=
n't
happen in 5.0.13. It's not the cause of this as I commented it out and it s=
till
breaks.=20
I'll also note that pp_display_cfg-&gt;display_count is correct at this poi=
nt, it
shows 2 for me with 2 screens connected. But why doesn't vega20 export
display_configuration_change? It has display_config_changed and I can't find
where that's called from so I wonder if display_config_changed should be be=
ing
called at this point.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657162950.C3Ac7d5BC.11267--

--===============0155961645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0155961645==--
