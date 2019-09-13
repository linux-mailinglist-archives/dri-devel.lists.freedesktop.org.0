Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044CB28B1
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2C36F49D;
	Fri, 13 Sep 2019 22:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87C586F49F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 22:55:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8509D72167; Fri, 13 Sep 2019 22:55:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Fri, 13 Sep 2019 22:55:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-ltiKaVimdI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111077-502@http.bugs.freedesktop.org/>
References: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0319936801=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0319936801==
Content-Type: multipart/alternative; boundary="15684153382.044Ec33eF.25798"
Content-Transfer-Encoding: 7bit


--15684153382.044Ec33eF.25798
Date: Fri, 13 Sep 2019 22:55:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #39 from Matt Turner <mattst88@gmail.com> ---
(In reply to roland@rptd.ch from comment #38)
> Could it be that your patch is not for version "mesa-19.0.8" as I'm using?
> (newer ones are keyworded)

Perhaps try 19.2.0_rc3. That's much closer to master.

Whatever the case, if the patch doesn't apply to 19.0.8 and portage tried (=
and
as a result failed) to apply it, it would give an error and stop.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15684153382.044Ec33eF.25798
Date: Fri, 13 Sep 2019 22:55:38 +0000
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
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c39">Comme=
nt # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mattst88&#64;gmail.com" title=3D"Matt Turner &lt;mattst88&#64;gmail.com&gt;=
"> <span class=3D"fn">Matt Turner</span></a>
</span></b>
        <pre>(In reply to <a href=3D"mailto:roland&#64;rptd.ch">roland&#64;=
rptd.ch</a> from <a href=3D"show_bug.cgi?id=3D111077#c38">comment #38</a>)
<span class=3D"quote">&gt; Could it be that your patch is not for version &=
quot;mesa-19.0.8&quot; as I'm using?
&gt; (newer ones are keyworded)</span >

Perhaps try 19.2.0_rc3. That's much closer to master.

Whatever the case, if the patch doesn't apply to 19.0.8 and portage tried (=
and
as a result failed) to apply it, it would give an error and stop.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15684153382.044Ec33eF.25798--

--===============0319936801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0319936801==--
