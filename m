Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE366FC1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 15:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA786E079;
	Fri, 12 Jul 2019 13:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B32C6E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 13:10:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6804C72167; Fri, 12 Jul 2019 13:10:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Fri, 12 Jul 2019 13:10:41 +0000
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
Message-ID: <bug-109206-502-nbRqHCxTT5@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0821222260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0821222260==
Content-Type: multipart/alternative; boundary="15629370416.f2fe.304"
Content-Transfer-Encoding: 7bit


--15629370416.f2fe.304
Date: Fri, 12 Jul 2019 13:10:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #56 from Jay Fitzpatrick <jayfitzpatrick@gmail.com> ---
(In reply to Ondrej Lang from comment #53)
> According to the linux kernel 5.2 changelog
> (https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2), the fix for
> the DMCU firmware issue on raven1 platform is included in that release.
>=20
> I went ahead and tested this and can confirm that I was able to boot with=
out
> a blank screen into my machine with kernel 5.2 without needing to use the
> workaround.
>=20
> I tested with:
> 1.) re-installed latest linux-firmware package
> 2.) installed kernel 5.2
> 3.) re-generated the initramfs
> 4.) booted into linux using kernel 5.2 and had no blank screen, dmesg out=
put
> is clean with no erros for amdgpu
>=20
> Tested on:
> HP HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.21 04/29/2019
>=20
> I guess if someone else can confirm my findings, maybe on different raven1
> hardware, this ticket can be closed.


Hi Ondrej

While I have not been able to test the 5.2 kernel on my Fedora system I have
installed the 5.3 kernel from rawhide and am seeing the same results:

[root@envy ~]# cp /home/XXX/raven_dmcu.bin /usr/lib/firmware/amdgpu/
[root@envy ~]# dracut -f --kver 5.3.0-0.rc0.git2.2.fc31.x86_64
[root@envy ~]# reboot

Tested on HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.20 12/25/2018
Kernel version 5.3.0-0.rc0.git2.2.fc31.x86_64=20

Installing rawhide kernel on Fedora without debug enabled:
sudo dnf config-manager
--add-repo=3Dhttp://alt.fedoraproject.org/pub/alt/rawhide-kernel-nodebug/fe=
dora-rawhide-kernel-nodebug.repo
sudo yum upgrade

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15629370416.f2fe.304
Date: Fri, 12 Jul 2019 13:10:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c56">Comme=
nt # 56</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jayfitzpatrick&#64;gmail.com" title=3D"Jay Fitzpatrick &lt;jayfitzpatrick&#=
64;gmail.com&gt;"> <span class=3D"fn">Jay Fitzpatrick</span></a>
</span></b>
        <pre>(In reply to Ondrej Lang from <a href=3D"show_bug.cgi?id=3D109=
206#c53">comment #53</a>)
<span class=3D"quote">&gt; According to the linux kernel 5.2 changelog
&gt; (<a href=3D"https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2=
">https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.2</a>), the fix =
for
&gt; the DMCU firmware issue on raven1 platform is included in that release.
&gt;=20
&gt; I went ahead and tested this and can confirm that I was able to boot w=
ithout
&gt; a blank screen into my machine with kernel 5.2 without needing to use =
the
&gt; workaround.
&gt;=20
&gt; I tested with:
&gt; 1.) re-installed latest linux-firmware package
&gt; 2.) installed kernel 5.2
&gt; 3.) re-generated the initramfs
&gt; 4.) booted into linux using kernel 5.2 and had no blank screen, dmesg =
output
&gt; is clean with no erros for amdgpu
&gt;=20
&gt; Tested on:
&gt; HP HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.21 04/29/2019
&gt;=20
&gt; I guess if someone else can confirm my findings, maybe on different ra=
ven1
&gt; hardware, this ticket can be closed.</span >


Hi Ondrej

While I have not been able to test the 5.2 kernel on my Fedora system I have
installed the 5.3 kernel from rawhide and am seeing the same results:

[root&#64;envy ~]# cp /home/XXX/raven_dmcu.bin /usr/lib/firmware/amdgpu/
[root&#64;envy ~]# dracut -f --kver 5.3.0-0.rc0.git2.2.fc31.x86_64
[root&#64;envy ~]# reboot

Tested on HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.20 12/25/2018
Kernel version 5.3.0-0.rc0.git2.2.fc31.x86_64=20

Installing rawhide kernel on Fedora without debug enabled:
sudo dnf config-manager
--add-repo=3D<a href=3D"http://alt.fedoraproject.org/pub/alt/rawhide-kernel=
-nodebug/fedora-rawhide-kernel-nodebug.repo">http://alt.fedoraproject.org/p=
ub/alt/rawhide-kernel-nodebug/fedora-rawhide-kernel-nodebug.repo</a>
sudo yum upgrade</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15629370416.f2fe.304--

--===============0821222260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0821222260==--
