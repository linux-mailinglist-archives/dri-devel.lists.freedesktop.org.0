Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F8EAAD0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 08:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F217E6ED83;
	Thu, 31 Oct 2019 07:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C75216ED87
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 07:02:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C405B720E2; Thu, 31 Oct 2019 07:02:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112086] [CI][RESUME]igt@i915_pm_rpm@modeset-non-lpsp - skip -
 Test requirement: setup_environment(), SKIP
Date: Thu, 31 Oct 2019 07:02:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lakshminarayana.vudum@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to component qa_contact
Message-ID: <bug-112086-502-oybAD9BW9e@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112086-502@http.bugs.freedesktop.org/>
References: <bug-112086-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1709529895=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1709529895==
Content-Type: multipart/alternative; boundary="15725053211.dCaCd.21632"
Content-Transfer-Encoding: 7bit


--15725053211.dCaCd.21632
Date: Thu, 31 Oct 2019 07:02:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112086

Lakshmi <lakshminarayana.vudum@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org
          Component|DRM/Intel                   |IGT
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |

--- Comment #7 from Lakshmi <lakshminarayana.vudum@intel.com> ---
(In reply to Don Hiatt from comment #6)
> setup_environment() (tests/i915/i915_pm_rpm.c) requires that the DUT
> suspends, otherwise tests are skipped (as gem-mmap-cpu in the latest run).
>=20
> I recently added some logging to IGT (see below) and it is showing that t=
he
> DUT's pm_status is active but we are expecting it to be suspended. The te=
st
> only allows 10 seconds to suspend before giving up. This appears to be ju=
st
> a race in the IGT where occasionally DUTs take longer that 10 seconds, he=
nce
> the reason we only see this occasionally.
>=20
> Since this is an IGT issue, I think the severity is medium. We should
> probably add some additional retries to close this race condition.
>=20
>=20
> (i915_pm_rpm:910) igt_pm-WARNING: timeout: pm_status expected:suspended,
> got:active
> Subtest gem-mmap-cpu: SKIP

Changing the component to IGT.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725053211.dCaCd.21632
Date: Thu, 31 Oct 2019 07:02:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lakshmina=
rayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.vudum&#64;=
intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME]igt&#64;i915_pm_rpm&#64;modeset-non-lpsp - sk=
ip - Test requirement: setup_environment(), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112086">bug 11208=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME]igt&#64;i915_pm_rpm&#64;modeset-non-lpsp - sk=
ip - Test requirement: setup_environment(), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112086#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME]igt&#64;i915_pm_rpm&#64;modeset-non-lpsp - sk=
ip - Test requirement: setup_environment(), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112086">bug 11208=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lakshminarayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.v=
udum&#64;intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span></b>
        <pre>(In reply to Don Hiatt from <a href=3D"show_bug.cgi?id=3D11208=
6#c6">comment #6</a>)
<span class=3D"quote">&gt; setup_environment() (tests/i915/i915_pm_rpm.c) r=
equires that the DUT
&gt; suspends, otherwise tests are skipped (as gem-mmap-cpu in the latest r=
un).
&gt;=20
&gt; I recently added some logging to IGT (see below) and it is showing tha=
t the
&gt; DUT's pm_status is active but we are expecting it to be suspended. The=
 test
&gt; only allows 10 seconds to suspend before giving up. This appears to be=
 just
&gt; a race in the IGT where occasionally DUTs take longer that 10 seconds,=
 hence
&gt; the reason we only see this occasionally.
&gt;=20
&gt; Since this is an IGT issue, I think the severity is medium. We should
&gt; probably add some additional retries to close this race condition.
&gt;=20
&gt;=20
&gt; (i915_pm_rpm:910) igt_pm-WARNING: timeout: pm_status expected:suspende=
d,
&gt; got:active
&gt; Subtest gem-mmap-cpu: SKIP</span >

Changing the component to IGT.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725053211.dCaCd.21632--

--===============1709529895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1709529895==--
