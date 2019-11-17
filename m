Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA1FF817
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 07:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8D56E26C;
	Sun, 17 Nov 2019 06:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 180DC6E26C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 06:34:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0EE2D720E2; Sun, 17 Nov 2019 06:34:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112304] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout causes system freeze
Date: Sun, 17 Nov 2019 06:34:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: saadnaji89@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112304-502-Rj4N9iA58v@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112304-502@http.bugs.freedesktop.org/>
References: <bug-112304-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1421392041=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1421392041==
Content-Type: multipart/alternative; boundary="15739724540.2FDA4.7070"
Content-Transfer-Encoding: 7bit


--15739724540.2FDA4.7070
Date: Sun, 17 Nov 2019 06:34:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112304

--- Comment #8 from saadnaji89@gmail.com ---
Comment on attachment 145976
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145976
dmesg

>[   14.586198] wlp4s0: associated
>[   14.601321] IPv6: ADDRCONF(NETDEV_CHANGE): wlp4s0: link becomes ready
>[   17.005228] audit: type=3D1131 audit(1573694773.878:186): pid=3D1 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3DNetworkManager-dispat=
cher comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
>[   21.287598] audit: type=3D1131 audit(1573694778.161:187): pid=3D1 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser@620 comm=3D"syst=
emd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? re=
s=3Dsuccess'
>[   21.295899] audit: type=3D1131 audit(1573694778.169:188): pid=3D1 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser-runtime-dir@620 =
comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? ter=
minal=3D? res=3Dsuccess'
>[   36.722300] audit: type=3D1131 audit(1573694789.782:189): pid=3D1 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-hostnamed com=
m=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termin=
al=3D? res=3Dsuccess'
>[  388.740535] sysrq: Emergency Sync
>[  388.746854] Emergency Sync complete
>[  435.364668] [drm:intel_check_cpu_fifo_underruns] *ERROR* fifo underrun =
on pipe B
>[  435.364674] [drm:intel_check_pch_fifo_underruns] *ERROR* pch fifo under=
run on pch transcoder B
>[  736.150037] logitech-hidpp-device 0003:046D:4041.0007: multiplier =3D 8
>[  746.084734] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout=
, signaled seq=3D36264, emitted seq=3D36266
>[  746.084796] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeo=
ut, signaled seq=3D328, emitted seq=3D329
>[  746.084854] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion: process hl2_linux pid 2921 thread hl2_linux:cs0 pid 2924
>[  746.084856] [drm] GPU recovery disabled.
>[  746.084913] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion: process hl2_linux pid 2921 thread hl2_linux:cs0 pid 2924
>[  746.084914] [drm] GPU recovery disabled.
>[  747.108578] Asynchronous wait on fence drm_sched:gfx:8ccf timed out (hi=
nt:submit_notify+0x0/0xa4)
>[  747.108590] Asynchronous wait on fence i915:compton[1533]:bdd5 timed ou=
t (hint:intel_atomic_commit_ready+0x0/0x58)
>[  747.108611] Asynchronous wait on fence i915:compton[1533]:bdd5 timed ou=
t (hint:intel_atomic_commit_ready+0x0/0x58)
>[  890.857127] logitech-hidpp-device 0003:046D:4041.0007: multiplier =3D 8
>[  922.726439] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout=
, signaled seq=3D36264, emitted seq=3D36266
>[  922.726493] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion: process  pid 0 thread  pid 0
>[  922.726495] [drm] GPU recovery disabled.
>[  922.749522] audit: type=3D1130 audit(1573695675.801:190): pid=3D1 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-clea=
n comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? t=
erminal=3D? res=3Dsuccess'
>[  922.749525] audit: type=3D1131 audit(1573695675.801:191): pid=3D1 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-clea=
n comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? t=
erminal=3D? res=3Dsuccess'
>[ 1364.073259] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeo=
ut, signaled seq=3D37448, emitted seq=3D37450
>[ 1364.073323] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeo=
ut, signaled seq=3D328, emitted seq=3D330
>[ 1364.073384] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion: process  pid 0 thread  pid 0
>[ 1364.073385] [drm] GPU recovery disabled.
>[ 1364.073443] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion: process  pid 0 thread  pid 0
>[ 1364.073444] [drm] GPU recovery disabled.
>[ 1484.394300] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeo=
ut, signaled seq=3D328, emitted seq=3D330
>[ 1484.394353] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informat=
ion: process  pid 0 thread  pid 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739724540.2FDA4.7070
Date: Sun, 17 Nov 2019 06:34:13 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304">bug 11230=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
saadnaji89&#64;gmail.com" title=3D"saadnaji89&#64;gmail.com">saadnaji89&#64=
;gmail.com</a>
</span></b>
        <pre>Comment on <span class=3D""><a href=3D"attachment.cgi?id=3D145=
976" name=3D"attach_145976" title=3D"dmesg">attachment 145976</a> <a href=
=3D"attachment.cgi?id=3D145976&amp;action=3Dedit" title=3D"dmesg">[details]=
</a></span>
dmesg

<span class=3D"quote">&gt;[   14.586198] wlp4s0: associated
&gt;[   14.601321] IPv6: ADDRCONF(NETDEV_CHANGE): wlp4s0: link becomes ready
&gt;[   17.005228] audit: type=3D1131 audit(1573694773.878:186): pid=3D1 ui=
d=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3DNetworkManager-dispa=
tcher comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot;=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;[   21.287598] audit: type=3D1131 audit(1573694778.161:187): pid=3D1 ui=
d=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser&#64;620 comm=3D=
&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; hostname=3D?=
 addr=3D? terminal=3D? res=3Dsuccess'
&gt;[   21.295899] audit: type=3D1131 audit(1573694778.169:188): pid=3D1 ui=
d=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Duser-runtime-dir&#64=
;620 comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;[   36.722300] audit: type=3D1131 audit(1573694789.782:189): pid=3D1 ui=
d=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-hostnamed co=
mm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; hostnam=
e=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;[  388.740535] sysrq: Emergency Sync
&gt;[  388.746854] Emergency Sync complete
&gt;[  435.364668] [drm:intel_check_cpu_fifo_underruns] *ERROR* fifo underr=
un on pipe B
&gt;[  435.364674] [drm:intel_check_pch_fifo_underruns] *ERROR* pch fifo un=
derrun on pch transcoder B
&gt;[  736.150037] logitech-hidpp-device 0003:046D:4041.0007: multiplier =
=3D 8
&gt;[  746.084734] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx time=
out, signaled seq=3D36264, emitted seq=3D36266
&gt;[  746.084796] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 ti=
meout, signaled seq=3D328, emitted seq=3D329
&gt;[  746.084854] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process hl2_linux pid 2921 thread hl2_linux:cs0 pid 2924
&gt;[  746.084856] [drm] GPU recovery disabled.
&gt;[  746.084913] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process hl2_linux pid 2921 thread hl2_linux:cs0 pid 2924
&gt;[  746.084914] [drm] GPU recovery disabled.
&gt;[  747.108578] Asynchronous wait on fence drm_sched:gfx:8ccf timed out =
(hint:submit_notify+0x0/0xa4)
&gt;[  747.108590] Asynchronous wait on fence i915:compton[1533]:bdd5 timed=
 out (hint:intel_atomic_commit_ready+0x0/0x58)
&gt;[  747.108611] Asynchronous wait on fence i915:compton[1533]:bdd5 timed=
 out (hint:intel_atomic_commit_ready+0x0/0x58)
&gt;[  890.857127] logitech-hidpp-device 0003:046D:4041.0007: multiplier =
=3D 8
&gt;[  922.726439] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx time=
out, signaled seq=3D36264, emitted seq=3D36266
&gt;[  922.726493] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process  pid 0 thread  pid 0
&gt;[  922.726495] [drm] GPU recovery disabled.
&gt;[  922.749522] audit: type=3D1130 audit(1573695675.801:190): pid=3D1 ui=
d=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-cle=
an comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; ho=
stname=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;[  922.749525] audit: type=3D1131 audit(1573695675.801:191): pid=3D1 ui=
d=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3Dsystemd-tmpfiles-cle=
an comm=3D&quot;systemd&quot; exe=3D&quot;/usr/lib/systemd/systemd&quot; ho=
stname=3D? addr=3D? terminal=3D? res=3Dsuccess'
&gt;[ 1364.073259] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 ti=
meout, signaled seq=3D37448, emitted seq=3D37450
&gt;[ 1364.073323] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 ti=
meout, signaled seq=3D328, emitted seq=3D330
&gt;[ 1364.073384] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process  pid 0 thread  pid 0
&gt;[ 1364.073385] [drm] GPU recovery disabled.
&gt;[ 1364.073443] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process  pid 0 thread  pid 0
&gt;[ 1364.073444] [drm] GPU recovery disabled.
&gt;[ 1484.394300] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 ti=
meout, signaled seq=3D328, emitted seq=3D330
&gt;[ 1484.394353] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process infor=
mation: process  pid 0 thread  pid 0</span ></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739724540.2FDA4.7070--

--===============1421392041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1421392041==--
