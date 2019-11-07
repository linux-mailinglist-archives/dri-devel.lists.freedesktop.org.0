Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18D0F319A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF89B6EE4A;
	Thu,  7 Nov 2019 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 476136F6C1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 14:35:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 447BC720E2; Thu,  7 Nov 2019 14:35:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112226] [HadesCanyon/regression] GPU hang causes also X server
 to die
Date: Thu, 07 Nov 2019 14:35:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: eero.t.tamminen@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-112226-502-ENBHHeLYwO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112226-502@http.bugs.freedesktop.org/>
References: <bug-112226-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1746990608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1746990608==
Content-Type: multipart/alternative; boundary="15731373532.3Ba4Fce.8206"
Content-Transfer-Encoding: 7bit


--15731373532.3Ba4Fce.8206
Date: Thu, 7 Nov 2019 14:35:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112226

Eero Tamminen <eero.t.tamminen@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[HadesCanyon] GPU hangs     |[HadesCanyon/regression]
                   |don't anymore recover       |GPU hang causes also X
                   |(although kernel still      |server to die
                   |claims that they do)        |

--- Comment #3 from Eero Tamminen <eero.t.tamminen@intel.com> ---
(In reply to Alex Deucher from comment #1)
> Please attach your dmesg output and xorg log is using X.  Please note that
> after a GPU reset, in most cases you need to restart your desktop
> environment because no desktop environments properly handle the loss of
> their contexts at the moment.

Failed tests complain about the invalid MIT-MAGIC-COOKIE-1, so it seems that
later failures are because X went down (and came back up with display manag=
er).

AFAIK reset should affect only the context running in the GPU when it was
reseted, not the others [1], and in this case the problematic client should=
 be
GfxBench (Manhattan test-case, see bug 108898), not X server.

Btw. Why AMD kernel module doesn't tell which process / context had the iss=
ue,
like i915 does?

[1]=C2=A0At least that's the case with i915, as long as the whole system do=
esn't
hang.=20


(In reply to Eero Tamminen from comment #0)
> * If latest Mesa is used with drm-tip kernel 5.3, 4/5 times X fails to
> start.  This started to happen with Mesa version within couple of days of
> the GPU hang recovery issue, so potentially there are more issue in Mesa
> (HadesCanyon) AMD support

Correction.  That issue happens only when using latest Mesa with few months=
 old
X server and (5.3) drm-tip kernel. If latest git versions of all are used, X
starts fine.  But since the indicated date, it dies later, when Manhattan
test-case causes problems.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731373532.3Ba4Fce.8206
Date: Thu, 7 Nov 2019 14:35:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:eero.t.ta=
mminen&#64;intel.com" title=3D"Eero Tamminen &lt;eero.t.tamminen&#64;intel.=
com&gt;"> <span class=3D"fn">Eero Tamminen</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [HadesCanyon/regression] GPU hang causes also X server to=
 die"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226">bug 11222=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>[HadesCanyon] GPU hangs don't anymore recover (although kern=
el still claims that they do)
           </td>
           <td>[HadesCanyon/regression] GPU hang causes also X server to die
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [HadesCanyon/regression] GPU hang causes also X server to=
 die"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [HadesCanyon/regression] GPU hang causes also X server to=
 die"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226">bug 11222=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eero.t.tamminen&#64;intel.com" title=3D"Eero Tamminen &lt;eero.t.tamminen&#=
64;intel.com&gt;"> <span class=3D"fn">Eero Tamminen</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
2226#c1">comment #1</a>)
<span class=3D"quote">&gt; Please attach your dmesg output and xorg log is =
using X.  Please note that
&gt; after a GPU reset, in most cases you need to restart your desktop
&gt; environment because no desktop environments properly handle the loss of
&gt; their contexts at the moment.</span >

Failed tests complain about the invalid MIT-MAGIC-COOKIE-1, so it seems that
later failures are because X went down (and came back up with display manag=
er).

AFAIK reset should affect only the context running in the GPU when it was
reseted, not the others [1], and in this case the problematic client should=
 be
GfxBench (Manhattan test-case, see <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - (Recoverable) GPU hangs with GfxBench Manhatta=
n GL tests"
   href=3D"show_bug.cgi?id=3D108898">bug 108898</a>), not X server.

Btw. Why AMD kernel module doesn't tell which process / context had the iss=
ue,
like i915 does?

[1]=C2=A0At least that's the case with i915, as long as the whole system do=
esn't
hang.=20


(In reply to Eero Tamminen from <a href=3D"show_bug.cgi?id=3D112226#c0">com=
ment #0</a>)
<span class=3D"quote">&gt; * If latest Mesa is used with drm-tip kernel 5.3=
, 4/5 times X fails to
&gt; start.  This started to happen with Mesa version within couple of days=
 of
&gt; the GPU hang recovery issue, so potentially there are more issue in Me=
sa
&gt; (HadesCanyon) AMD support</span >

Correction.  That issue happens only when using latest Mesa with few months=
 old
X server and (5.3) drm-tip kernel. If latest git versions of all are used, X
starts fine.  But since the indicated date, it dies later, when Manhattan
test-case causes problems.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731373532.3Ba4Fce.8206--

--===============1746990608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1746990608==--
