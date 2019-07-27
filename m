Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C67778DB
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 15:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680316EEA8;
	Sat, 27 Jul 2019 13:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3A626EEA8
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 13:12:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B786372167; Sat, 27 Jul 2019 13:12:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111231] VM_L2_PROTECTION_FAULT
Date: Sat, 27 Jul 2019 13:12:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111231-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0497511416=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0497511416==
Content-Type: multipart/alternative; boundary="15642331400.a09F.30756"
Content-Transfer-Encoding: 7bit


--15642331400.a09F.30756
Date: Sat, 27 Jul 2019 13:12:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111231

            Bug ID: 111231
           Summary: VM_L2_PROTECTION_FAULT
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ds2.bugs.freedesktop@gmail.com

When playing minetest on an AMD ryzen 2200G with vega integrated graphics,
occasionally the system will appear to suffer a graphics lock-up during game
load when the loading bar appears.
When this occours, dmesg spits out a VM_L2_PROTECTION_FAULT and then repeat=
ed
errors about fence timeouts:

[ 5699.136659] amdgpu 0000:0b:00.0: [gfxhub] no-retry page fault (src_id:0
ring:155 vmid:5 pasid:32770, for process minetest pid 7127 thread minetest:=
cs0
pid 7133)
[ 5699.136662] amdgpu 0000:0b:00.0:   in page starting at address
0x000080014034d000 from 27
[ 5699.136664] amdgpu 0000:0b:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00501136
[ 5704.343299] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5709.259775] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5709.259860] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5709.259862] [drm] GPU recovery disabled.
[ 5709.463238] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5719.286451] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5719.286537] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5719.286539] [drm] GPU recovery disabled.
[ 5729.312836] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5729.312921] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5729.312923] [drm] GPU recovery disabled.
[ 5739.339485] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5739.339570] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5739.339572] [drm] GPU recovery disabled.
[ 5749.366552] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5749.366637] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5749.366640] [drm] GPU recovery disabled.

Notably, when playing minetest normally, this doesn't always happen, but wh=
en
it does the screen gets a light covering of graphical corruption "confetti"
(photos to follow - had to be taken on a phone, sorry).
Currently running a mesa debug build compiled from git at commit b0626c1f306
after seeing if https://bugs.freedesktop.org/show_bug.cgi?id=3D105251 had
anything to do with it - I think this is related but not entirely a duplica=
te,
as a fix mentioned there did stop the test program there from having an eff=
ect
but did not stop this problem.

In the course of trying to reproduce this problem in a more repeatable mann=
er,
I decided to take an apitrace (will attach in following messages).
Interestingly, the brief trace I took did not crash my system during record=
ing
of it, but now replaying it will fairly regularly cause the same kind of
lockup, more frequently than the game itself will.
I ran apitrace replay in verbose mode to see whereabouts it stopped to see =
if
this gave an approximate indications of where things starting going pear
shaped.  The point at which output ends is well short of the entire apitrace
dump, as expected from what I saw - and additionally the stderr appears to
contain an exception of some kind. See the apitrace.out.txt and
apitrace.err.txt attachments (to follow separately).

I haven't yet got a dmesg output during minetest running itself, but I have=
 got
some runs (spanning from boot to either hard or soft reboot - sometimes xorg
was killable, othertimes not) from replaying the offending api trace. These
will also be attached in follow-up messages.
These appear to have a lot more GPU faults before the messages about timeou=
ts
appear.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642331400.a09F.30756
Date: Sat, 27 Jul 2019 13:12:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VM_L2_PROTECTION_FAULT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231">111231</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>VM_L2_PROTECTION_FAULT
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ds2.bugs.freedesktop&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When playing minetest on an AMD ryzen 2200G with vega integrat=
ed graphics,
occasionally the system will appear to suffer a graphics lock-up during game
load when the loading bar appears.
When this occours, dmesg spits out a VM_L2_PROTECTION_FAULT and then repeat=
ed
errors about fence timeouts:

[ 5699.136659] amdgpu 0000:0b:00.0: [gfxhub] no-retry page fault (src_id:0
ring:155 vmid:5 pasid:32770, for process minetest pid 7127 thread minetest:=
cs0
pid 7133)
[ 5699.136662] amdgpu 0000:0b:00.0:   in page starting at address
0x000080014034d000 from 27
[ 5699.136664] amdgpu 0000:0b:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00501136
[ 5704.343299] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5709.259775] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5709.259860] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5709.259862] [drm] GPU recovery disabled.
[ 5709.463238] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out.
[ 5719.286451] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5719.286537] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5719.286539] [drm] GPU recovery disabled.
[ 5729.312836] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5729.312921] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5729.312923] [drm] GPU recovery disabled.
[ 5739.339485] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5739.339570] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5739.339572] [drm] GPU recovery disabled.
[ 5749.366552] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D443165, emitted seq=3D443167
[ 5749.366637] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process minetest pid 7127 thread minetest:cs0 pid 7133
[ 5749.366640] [drm] GPU recovery disabled.

Notably, when playing minetest normally, this doesn't always happen, but wh=
en
it does the screen gets a light covering of graphical corruption &quot;conf=
etti&quot;
(photos to follow - had to be taken on a phone, sorry).
Currently running a mesa debug build compiled from git at commit b0626c1f306
after seeing if <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"show_bug.cgi?id=3D105251">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D105251</a> had
anything to do with it - I think this is related but not entirely a duplica=
te,
as a fix mentioned there did stop the test program there from having an eff=
ect
but did not stop this problem.

In the course of trying to reproduce this problem in a more repeatable mann=
er,
I decided to take an apitrace (will attach in following messages).
Interestingly, the brief trace I took did not crash my system during record=
ing
of it, but now replaying it will fairly regularly cause the same kind of
lockup, more frequently than the game itself will.
I ran apitrace replay in verbose mode to see whereabouts it stopped to see =
if
this gave an approximate indications of where things starting going pear
shaped.  The point at which output ends is well short of the entire apitrace
dump, as expected from what I saw - and additionally the stderr appears to
contain an exception of some kind. See the apitrace.out.txt and
apitrace.err.txt attachments (to follow separately).

I haven't yet got a dmesg output during minetest running itself, but I have=
 got
some runs (spanning from boot to either hard or soft reboot - sometimes xorg
was killable, othertimes not) from replaying the offending api trace. These
will also be attached in follow-up messages.
These appear to have a lot more GPU faults before the messages about timeou=
ts
appear.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642331400.a09F.30756--

--===============0497511416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0497511416==--
