Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE967981
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 11:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A256E3DB;
	Sat, 13 Jul 2019 09:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C92EC6E3CB
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 09:41:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C63A072167; Sat, 13 Jul 2019 09:41:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Sat, 13 Jul 2019 09:41:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: jayfitzpatrick@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-B1M85pbBco@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1939819330=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1939819330==
Content-Type: multipart/alternative; boundary="15630108711.ca9F9a.4600"
Content-Transfer-Encoding: 7bit


--15630108711.ca9F9a.4600
Date: Sat, 13 Jul 2019 09:41:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #59 from Jay Fitzpatrick <jayfitzpatrick@gmail.com> ---
(In reply to Jay Fitzpatrick from comment #56)
> (In reply to Ondrej Lang from comment #53)
> > According to the linux kernel 5.2 changelog
> > (https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2), the fix f=
or
> > the DMCU firmware issue on raven1 platform is included in that release.
> >=20
> > I went ahead and tested this and can confirm that I was able to boot wi=
thout
> > a blank screen into my machine with kernel 5.2 without needing to use t=
he
> > workaround.
> >=20
> > I tested with:
> > 1.) re-installed latest linux-firmware package
> > 2.) installed kernel 5.2
> > 3.) re-generated the initramfs
> > 4.) booted into linux using kernel 5.2 and had no blank screen, dmesg o=
utput
> > is clean with no erros for amdgpu
> >=20
> > Tested on:
> > HP HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.21 04/29/2019
> >=20
> > I guess if someone else can confirm my findings, maybe on different rav=
en1
> > hardware, this ticket can be closed.
>=20
>=20
> Hi Ondrej
>=20
> While I have not been able to test the 5.2 kernel on my Fedora system I h=
ave
> installed the 5.3 kernel from rawhide and am seeing the same results:
>=20
> [root@envy ~]# cp /home/XXX/raven_dmcu.bin /usr/lib/firmware/amdgpu/
> [root@envy ~]# dracut -f --kver 5.3.0-0.rc0.git2.2.fc31.x86_64
> [root@envy ~]# reboot
>=20
> Tested on HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.20 12/25/2018
> Kernel version 5.3.0-0.rc0.git2.2.fc31.x86_64=20
>=20
> Installing rawhide kernel on Fedora without debug enabled:
> sudo dnf config-manager
> --add-repo=3Dhttp://alt.fedoraproject.org/pub/alt/rawhide-kernel-nodebug/
> fedora-rawhide-kernel-nodebug.repo
> sudo yum upgrade

--Update--

While kernel versions 5.3.0-0.rc0.git2.2.fc31.x86_64 and
5.3.0-0.rc0.git2.4.fc31.x86_64 versions of the kernel seemed to be pretty
stable when it came to booting the system / touchscreen working etc, there =
was
a massive amount of video tearing (within Chrome / Konsole) within my KDE
session, enough to force me to roll back to 5.1.16-300.fc30.x86_64

Jay

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15630108711.ca9F9a.4600
Date: Sat, 13 Jul 2019 09:41:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c59">Comme=
nt # 59</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jayfitzpatrick&#64;gmail.com" title=3D"Jay Fitzpatrick &lt;jayfitzpatrick&#=
64;gmail.com&gt;"> <span class=3D"fn">Jay Fitzpatrick</span></a>
</span></b>
        <pre>(In reply to Jay Fitzpatrick from <a href=3D"show_bug.cgi?id=
=3D109206#c56">comment #56</a>)
<span class=3D"quote">&gt; (In reply to Ondrej Lang from <a href=3D"show_bu=
g.cgi?id=3D109206#c53">comment #53</a>)
&gt; &gt; According to the linux kernel 5.2 changelog
&gt; &gt; (<a href=3D"https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLo=
g-5.2">https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2</a>), the=
 fix for
&gt; &gt; the DMCU firmware issue on raven1 platform is included in that re=
lease.
&gt; &gt;=20
&gt; &gt; I went ahead and tested this and can confirm that I was able to b=
oot without
&gt; &gt; a blank screen into my machine with kernel 5.2 without needing to=
 use the
&gt; &gt; workaround.
&gt; &gt;=20
&gt; &gt; I tested with:
&gt; &gt; 1.) re-installed latest linux-firmware package
&gt; &gt; 2.) installed kernel 5.2
&gt; &gt; 3.) re-generated the initramfs
&gt; &gt; 4.) booted into linux using kernel 5.2 and had no blank screen, d=
mesg output
&gt; &gt; is clean with no erros for amdgpu
&gt; &gt;=20
&gt; &gt; Tested on:
&gt; &gt; HP HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.21 04/29/2019
&gt; &gt;=20
&gt; &gt; I guess if someone else can confirm my findings, maybe on differe=
nt raven1
&gt; &gt; hardware, this ticket can be closed.
&gt;=20
&gt;=20
&gt; Hi Ondrej
&gt;=20
&gt; While I have not been able to test the 5.2 kernel on my Fedora system =
I have
&gt; installed the 5.3 kernel from rawhide and am seeing the same results:
&gt;=20
&gt; [root&#64;envy ~]# cp /home/XXX/raven_dmcu.bin /usr/lib/firmware/amdgp=
u/
&gt; [root&#64;envy ~]# dracut -f --kver 5.3.0-0.rc0.git2.2.fc31.x86_64
&gt; [root&#64;envy ~]# reboot
&gt;=20
&gt; Tested on HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.20 12/25/2018
&gt; Kernel version 5.3.0-0.rc0.git2.2.fc31.x86_64=20
&gt;=20
&gt; Installing rawhide kernel on Fedora without debug enabled:
&gt; sudo dnf config-manager
&gt; --add-repo=3D<a href=3D"http://alt.fedoraproject.org/pub/alt/rawhide-k=
ernel-nodebug/">http://alt.fedoraproject.org/pub/alt/rawhide-kernel-nodebug=
/</a>
&gt; fedora-rawhide-kernel-nodebug.repo
&gt; sudo yum upgrade</span >

--Update--

While kernel versions 5.3.0-0.rc0.git2.2.fc31.x86_64 and
5.3.0-0.rc0.git2.4.fc31.x86_64 versions of the kernel seemed to be pretty
stable when it came to booting the system / touchscreen working etc, there =
was
a massive amount of video tearing (within Chrome / Konsole) within my KDE
session, enough to force me to roll back to 5.1.16-300.fc30.x86_64

Jay</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15630108711.ca9F9a.4600--

--===============1939819330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1939819330==--
