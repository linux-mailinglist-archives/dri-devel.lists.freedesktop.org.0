Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 071328AD15
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 05:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BDC6E616;
	Tue, 13 Aug 2019 03:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 45AF66E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 03:15:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4229D72167; Tue, 13 Aug 2019 03:15:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Tue, 13 Aug 2019 03:15:19 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-n9UNHmMprF@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1474207070=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1474207070==
Content-Type: multipart/alternative; boundary="15656661193.EAAfeC.32767"
Content-Transfer-Encoding: 7bit


--15656661193.EAAfeC.32767
Date: Tue, 13 Aug 2019 03:15:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #92 from ReddestDream <reddestdream@gmail.com> ---
>If you follow the callstack:

I've been thinking all this over. The only thing unfortunately that really
sticks out at me still is how Chris Hodapp says that reverting this commit:

https://github.com/torvalds/linux/commit/d1a3e239a6016f2bb42a91696056e22398=
2e8538#diff-0bc07842bc28283d64ffa6dd2ed716de

Seems to improve things. Considering that we now know from Tom B.'s work th=
at
dpm_state.hard_min_level is apparently calculated correctly and stable the
entire time, it doesn't make sense that reverting this commit could fix
anything.=20

The code seems very similar to what we see in
vega20_notify_smc_display_config_after_ps_adjustment near where we get the "
[SetHardMinFreq] Set hard min uclk failed!" Maybe this
smum_send_msg_to_smc_with_parameter get through where others fail because of
the formatting or something?

Thanks again Tom B. for all your testing. I'd like to do some tests of my o=
wn,
but time's just not permitting for me ATM. Hoping to be more free next week=
end.
:/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656661193.EAAfeC.32767
Date: Tue, 13 Aug 2019 03:15:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c92">Comme=
nt # 92</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;If you follow the callstack:</span >

I've been thinking all this over. The only thing unfortunately that really
sticks out at me still is how Chris Hodapp says that reverting this commit:

<a href=3D"https://github.com/torvalds/linux/commit/d1a3e239a6016f2bb42a916=
96056e223982e8538#diff-0bc07842bc28283d64ffa6dd2ed716de">https://github.com=
/torvalds/linux/commit/d1a3e239a6016f2bb42a91696056e223982e8538#diff-0bc078=
42bc28283d64ffa6dd2ed716de</a>

Seems to improve things. Considering that we now know from Tom B.'s work th=
at
dpm_state.hard_min_level is apparently calculated correctly and stable the
entire time, it doesn't make sense that reverting this commit could fix
anything.=20

The code seems very similar to what we see in
vega20_notify_smc_display_config_after_ps_adjustment near where we get the =
&quot;
[SetHardMinFreq] Set hard min uclk failed!&quot; Maybe this
smum_send_msg_to_smc_with_parameter get through where others fail because of
the formatting or something?

Thanks again Tom B. for all your testing. I'd like to do some tests of my o=
wn,
but time's just not permitting for me ATM. Hoping to be more free next week=
end.
:/</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656661193.EAAfeC.32767--

--===============1474207070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1474207070==--
