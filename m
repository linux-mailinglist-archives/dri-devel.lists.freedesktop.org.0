Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F3AA5A9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 16:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAD489336;
	Thu,  5 Sep 2019 14:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 483BD89DFD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 14:21:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3C1F472161; Thu,  5 Sep 2019 14:21:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Thu, 05 Sep 2019 14:21:54 +0000
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
Message-ID: <bug-111482-502-5hHIyd0zzf@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0949892641=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0949892641==
Content-Type: multipart/alternative; boundary="15676933140.296fbB1Bf.8312"
Content-Transfer-Encoding: 7bit


--15676933140.296fbB1Bf.8312
Date: Thu, 5 Sep 2019 14:21:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #12 from Robert <freedesktop@postfach.xyz> ---
Andrew, you're my hero ;-) While I'm even more sad now (because I now think
that this issue will be indeed never be fixed) I now at least can imagine
what's going on.

As you recommended I changed resolution to 1920x1080. That's quite common I
would say. And tata! Indeed "sensors" reported 8W. Then I changed to 3840x2=
160.
Not so usual I guess but the 2nd biggest resolution my monitor supports. St=
ill
8W! And then back to 5120x1440. And tata! 33W :-(

That could mean two things: 1) There is a bug somewhere (firmware, driver, =
...)
with this resolution which causes that high idle power consumption or 2) wh=
ich
is even worse I suspect that with this resolution the 5700XT acts like you =
have
plugged in two monitors. And from what I read throughout all Navi10 reviews
multi monitor setups and power consumption was and still is a problem with =
AMD
graphic cards in general. Oh man, that's something I really didn't calculat=
ed
with :-( Yeah, in that case I can really only hope for the Intel Xe graphics
cards next year (if they really build a consumer card which nobody knows yet
;-) ).

I still don't understand why in console where KMS is enabled 8W is enough a=
nd
while running KDE Plasma in that resolution it takes round about 33W. But m=
aybe
it really has something to do with acceleration. It doesn't even consider
reducing memory clock at least a little bit even if I do nothing and haven't
even started any program. That's the funny thing in general: As long as I d=
on't
start Firefox, Thunderbird or something like that "sensors" don't even work=
. It
just prints garbage values and takes minutes to complete. If I start one of=
 the
programs mentioned above the screen flickers very shortly and afterwards
"sensors" works as expected. I guess only the AMD god knows what that means=
 ;-)=20

At least I now know that I can't do anything further. It just would be cool=
 if
one of the AMD engineers could confirm my assumption that with a resolution=
 of
5144x1440 the card always runs at highest memory clock speed as it does wit=
h a
multi monitor setup (from what I've read so far).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676933140.296fbB1Bf.8312
Date: Thu, 5 Sep 2019 14:21:54 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>Andrew, you're my hero ;-) While I'm even more sad now (becaus=
e I now think
that this issue will be indeed never be fixed) I now at least can imagine
what's going on.

As you recommended I changed resolution to 1920x1080. That's quite common I
would say. And tata! Indeed &quot;sensors&quot; reported 8W. Then I changed=
 to 3840x2160.
Not so usual I guess but the 2nd biggest resolution my monitor supports. St=
ill
8W! And then back to 5120x1440. And tata! 33W :-(

That could mean two things: 1) There is a bug somewhere (firmware, driver, =
...)
with this resolution which causes that high idle power consumption or 2) wh=
ich
is even worse I suspect that with this resolution the 5700XT acts like you =
have
plugged in two monitors. And from what I read throughout all Navi10 reviews
multi monitor setups and power consumption was and still is a problem with =
AMD
graphic cards in general. Oh man, that's something I really didn't calculat=
ed
with :-( Yeah, in that case I can really only hope for the Intel Xe graphics
cards next year (if they really build a consumer card which nobody knows yet
;-) ).

I still don't understand why in console where KMS is enabled 8W is enough a=
nd
while running KDE Plasma in that resolution it takes round about 33W. But m=
aybe
it really has something to do with acceleration. It doesn't even consider
reducing memory clock at least a little bit even if I do nothing and haven't
even started any program. That's the funny thing in general: As long as I d=
on't
start Firefox, Thunderbird or something like that &quot;sensors&quot; don't=
 even work. It
just prints garbage values and takes minutes to complete. If I start one of=
 the
programs mentioned above the screen flickers very shortly and afterwards
&quot;sensors&quot; works as expected. I guess only the AMD god knows what =
that means ;-)=20

At least I now know that I can't do anything further. It just would be cool=
 if
one of the AMD engineers could confirm my assumption that with a resolution=
 of
5144x1440 the card always runs at highest memory clock speed as it does wit=
h a
multi monitor setup (from what I've read so far).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676933140.296fbB1Bf.8312--

--===============0949892641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0949892641==--
