Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF46542F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 11:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612276E170;
	Thu, 11 Jul 2019 09:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C9D56E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 09:52:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 89BE172167; Thu, 11 Jul 2019 09:52:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Thu, 11 Jul 2019 09:52:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ondrej@lang.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-P8GQAHBomH@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502@http.bugs.freedesktop.org/>
References: <bug-109206-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1300611405=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1300611405==
Content-Type: multipart/alternative; boundary="15628387757.AAE33AFF.6682"
Content-Transfer-Encoding: 7bit


--15628387757.AAE33AFF.6682
Date: Thu, 11 Jul 2019 09:52:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #53 from Ondrej Lang <ondrej@lang.sk> ---
According to the linux kernel 5.2 changelog
(https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2), the fix for t=
he
DMCU firmware issue on raven1 platform is included in that release.

I went ahead and tested this and can confirm that I was able to boot withou=
t a
blank screen into my machine with kernel 5.2 without needing to use the
workaround.

I tested with:
1.) re-installed latest linux-firmware package
2.) installed kernel 5.2
3.) re-generated the initramfs
4.) booted into linux using kernel 5.2 and had no blank screen, dmesg outpu=
t is
clean with no erros for amdgpu

Tested on:
HP HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.21 04/29/2019

I guess if someone else can confirm my findings, maybe on different raven1
hardware, this ticket can be closed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15628387757.AAE33AFF.6682
Date: Thu, 11 Jul 2019 09:52:55 +0000
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
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c53">Comme=
nt # 53</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ondrej&#64;lang.sk" title=3D"Ondrej Lang &lt;ondrej&#64;lang.sk&gt;"> <span=
 class=3D"fn">Ondrej Lang</span></a>
</span></b>
        <pre>According to the linux kernel 5.2 changelog
(<a href=3D"https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2">htt=
ps://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2</a>), the fix for t=
he
DMCU firmware issue on raven1 platform is included in that release.

I went ahead and tested this and can confirm that I was able to boot withou=
t a
blank screen into my machine with kernel 5.2 without needing to use the
workaround.

I tested with:
1.) re-installed latest linux-firmware package
2.) installed kernel 5.2
3.) re-generated the initramfs
4.) booted into linux using kernel 5.2 and had no blank screen, dmesg outpu=
t is
clean with no erros for amdgpu

Tested on:
HP HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.21 04/29/2019

I guess if someone else can confirm my findings, maybe on different raven1
hardware, this ticket can be closed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15628387757.AAE33AFF.6682--

--===============1300611405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1300611405==--
