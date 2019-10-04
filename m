Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7E7CC024
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 18:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606989F2A;
	Fri,  4 Oct 2019 16:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE74F89F2A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 16:07:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B6EA272162; Fri,  4 Oct 2019 16:07:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111599] [CI][RESUME] igt@gem_ctx_isolation@* - skip - Test
 requirement: !(gen > LAST_KNOWN_GEN), SKIP
Date: Fri, 04 Oct 2019 16:07:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: chris@chris-wilson.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-111599-502-Nz7vplKI1B@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111599-502@http.bugs.freedesktop.org/>
References: <bug-111599-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0590061794=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0590061794==
Content-Type: multipart/alternative; boundary="15702052390.00D8f.22124"
Content-Transfer-Encoding: 7bit


--15702052390.00D8f.22124
Date: Fri, 4 Oct 2019 16:07:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111599

Chris Wilson <chris@chris-wilson.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Chris Wilson <chris@chris-wilson.co.uk> ---
commit d17a484b3c22706b2b004ef1577f367d79235e43 (upstream/master,
origin/master, origin/HEAD)
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Wed Oct 2 12:22:29 2019 +0100

    i915/gem_ctx_isolation: Bump support for Tigerlake

    There's very little variation in non-privileged registers for Tigerlake,
    so we can mostly inherit the set from gen11. There is no whitelist at
    present, so we do not need to add any special registers.

    v2: Add COMMON_SLICE_CHICKEN2, GEN9_SLICE_COMMON_ECO_CHICKEN1 and a
    variety of huc readonly status registers.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D111599
    Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
    Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702052390.00D8f.22124
Date: Fri, 4 Oct 2019 16:07:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:chris&#64=
;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wilson.co.uk=
&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* -=
 skip - Test requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111599">bug 11159=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* -=
 skip - Test requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111599#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* -=
 skip - Test requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111599">bug 11159=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>commit d17a484b3c22706b2b004ef1577f367d79235e43 (upstream/mast=
er,
origin/master, origin/HEAD)
Author: Chris Wilson &lt;<a href=3D"mailto:chris&#64;chris-wilson.co.uk">ch=
ris&#64;chris-wilson.co.uk</a>&gt;
Date:   Wed Oct 2 12:22:29 2019 +0100

    i915/gem_ctx_isolation: Bump support for Tigerlake

    There's very little variation in non-privileged registers for Tigerlake,
    so we can mostly inherit the set from gen11. There is no whitelist at
    present, so we do not need to add any special registers.

    v2: Add COMMON_SLICE_CHICKEN2, GEN9_SLICE_COMMON_ECO_CHICKEN1 and a
    variety of huc readonly status registers.

    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* -=
 skip - Test requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"show_bug.cgi?id=3D111599">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111599</a>
    Signed-off-by: Chris Wilson &lt;<a href=3D"mailto:chris&#64;chris-wilso=
n.co.uk">chris&#64;chris-wilson.co.uk</a>&gt;
    Cc: Mika Kuoppala &lt;<a href=3D"mailto:mika.kuoppala&#64;linux.intel.c=
om">mika.kuoppala&#64;linux.intel.com</a>&gt;
    Reviewed-by: Mika Kuoppala &lt;<a href=3D"mailto:mika.kuoppala&#64;linu=
x.intel.com">mika.kuoppala&#64;linux.intel.com</a>&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702052390.00D8f.22124--

--===============0590061794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0590061794==--
