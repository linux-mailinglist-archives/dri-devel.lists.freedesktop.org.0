Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911CA960D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 00:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC9989CAA;
	Wed,  4 Sep 2019 22:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C194B89CAA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 22:16:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B39DF72161; Wed,  4 Sep 2019 22:16:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Wed, 04 Sep 2019 22:16:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@postfach.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-9dRApXzR6Z@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0589146041=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0589146041==
Content-Type: multipart/alternative; boundary="15676354160.A9F2.26293"
Content-Transfer-Encoding: 7bit


--15676354160.A9F2.26293
Date: Wed, 4 Sep 2019 22:16:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #9 from Robert <freedesktop@postfach.xyz> ---
Thanks Andrew, but I guess I don't know how to interpret your last comment =
;-)
Is there something I can test/change? I can't change the value of
"/sys/class/drm/card0/device/pp_dpm_mclk" which is the memclock frequency
AFAIK. It always stays at 875Mhz regardless which value I submit. As soon a=
s I
start KDE Plasma I open "konsole" and I see the 875Mhz. So the power usage =
is
already high at this point and not after using KDE Plasma for a while.
Executing=20

echo "2" > /sys/class/drm/card0/device/pp_dpm_mclk

e.g. doesn't change the freqency.

Maybe it's a "KDE Plasma + X server" thingy. Users which are using "KDE Pla=
sma
+ Wayland" seems less frequently affected by the problem. But that's not re=
ally
an option for me as I need screen sharing from time to time via Zoom video
conferencing or Slack and AFAIK that still doesn't work with Wayland (besid=
es
other problems). It's somehow funny that Wayland seems to be less of an iss=
ue
than X...

Maybe it's a X570 chipset + 5700XT thingy. I've no idea. I'm not a driver
developer ;-) I can only try things out like settings or patches (if I get
some). But I guess this is one of the issues that some future commit will m=
aybe
fix "by accident" or it will just stay there forever ;-) If I see how long
other AMD related threads stay around in this bug tracker without solution =
or
some solution after years I currently don't have much hope that there will =
be
any solution for my problem. Hopefully Intel launches a dedicated graphics =
card
sometimes next year. I never had notable issues with Intel hardware and Lin=
ux
within the last few years. It just works ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676354160.A9F2.26293
Date: Wed, 4 Sep 2019 22:16:56 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>Thanks Andrew, but I guess I don't know how to interpret your =
last comment ;-)
Is there something I can test/change? I can't change the value of
&quot;/sys/class/drm/card0/device/pp_dpm_mclk&quot; which is the memclock f=
requency
AFAIK. It always stays at 875Mhz regardless which value I submit. As soon a=
s I
start KDE Plasma I open &quot;konsole&quot; and I see the 875Mhz. So the po=
wer usage is
already high at this point and not after using KDE Plasma for a while.
Executing=20

echo &quot;2&quot; &gt; /sys/class/drm/card0/device/pp_dpm_mclk

e.g. doesn't change the freqency.

Maybe it's a &quot;KDE Plasma + X server&quot; thingy. Users which are usin=
g &quot;KDE Plasma
+ Wayland&quot; seems less frequently affected by the problem. But that's n=
ot really
an option for me as I need screen sharing from time to time via Zoom video
conferencing or Slack and AFAIK that still doesn't work with Wayland (besid=
es
other problems). It's somehow funny that Wayland seems to be less of an iss=
ue
than X...

Maybe it's a X570 chipset + 5700XT thingy. I've no idea. I'm not a driver
developer ;-) I can only try things out like settings or patches (if I get
some). But I guess this is one of the issues that some future commit will m=
aybe
fix &quot;by accident&quot; or it will just stay there forever ;-) If I see=
 how long
other AMD related threads stay around in this bug tracker without solution =
or
some solution after years I currently don't have much hope that there will =
be
any solution for my problem. Hopefully Intel launches a dedicated graphics =
card
sometimes next year. I never had notable issues with Intel hardware and Lin=
ux
within the last few years. It just works ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676354160.A9F2.26293--

--===============0589146041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0589146041==--
