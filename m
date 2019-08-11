Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC5892B9
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 19:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6CE6E392;
	Sun, 11 Aug 2019 17:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C56A76E393
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 17:00:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C275572168; Sun, 11 Aug 2019 17:00:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 11 Aug 2019 17:00:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-4MhG2bZbJX@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2002538548=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2002538548==
Content-Type: multipart/alternative; boundary="15655428253.816DA6EA.15976"
Content-Transfer-Encoding: 7bit


--15655428253.816DA6EA.15976
Date: Sun, 11 Aug 2019 17:00:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #71 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
On Sun, Aug 11, 2019 at 01:15:48AM +0000, bugzilla-daemon@freedesktop.org
wrote:
> I think the clock dysregulation and excessive voltage/wattage are symptom=
s of

Is there a way to configure the smu block to keep the memory clock to its m=
ax
with the appropriate power/voltage? If the smu block do configure some of t=
he
vram arbiter block priority, could we tell it to keep the dc[en]x to max
priority and ignore display vram watermarks? (due to the realtime requireme=
nt
of monitor data transmission, I still don't understand the existence of
watermarks in the first place, I would need data which proves me wrong).

On my AMD TAHITI XT, the memory clock seems to be locked to the max (only 1
full hd 144Hz monitor). I recall dce6 has fancy inner-blocks configuration:=
 I
simplified it in my custom driver (something about availability of display
clocks and memory bandwidth. Maybe the smu while clock/power managing breaks
due this dc[en]x "fancy" inner-blocks configuration.=20

Additionnally, never heard of 2 displays which would be driven by a common
display block and being in sync. Is the sync dependant on the monitors and =
not
the display block??  What I am missing ? The nasty displayport mst thingy?
I would always set this to false.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655428253.816DA6EA.15976
Date: Sun, 11 Aug 2019 17:00:25 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c71">Comme=
nt # 71</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>On Sun, Aug 11, 2019 at 01:15:48AM +0000, <a href=3D"mailto:bu=
gzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>
wrote:
<span class=3D"quote">&gt; I think the clock dysregulation and excessive vo=
ltage/wattage are symptoms of</span >

Is there a way to configure the smu block to keep the memory clock to its m=
ax
with the appropriate power/voltage? If the smu block do configure some of t=
he
vram arbiter block priority, could we tell it to keep the dc[en]x to max
priority and ignore display vram watermarks? (due to the realtime requireme=
nt
of monitor data transmission, I still don't understand the existence of
watermarks in the first place, I would need data which proves me wrong).

On my AMD TAHITI XT, the memory clock seems to be locked to the max (only 1
full hd 144Hz monitor). I recall dce6 has fancy inner-blocks configuration:=
 I
simplified it in my custom driver (something about availability of display
clocks and memory bandwidth. Maybe the smu while clock/power managing breaks
due this dc[en]x &quot;fancy&quot; inner-blocks configuration.=20

Additionnally, never heard of 2 displays which would be driven by a common
display block and being in sync. Is the sync dependant on the monitors and =
not
the display block??  What I am missing ? The nasty displayport mst thingy?
I would always set this to false.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655428253.816DA6EA.15976--

--===============2002538548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2002538548==--
