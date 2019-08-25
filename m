Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3579C4DA
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 18:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4478C6E112;
	Sun, 25 Aug 2019 16:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCBB96E117
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 16:26:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B9A0472161; Sun, 25 Aug 2019 16:26:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108493] Unigine Heaven at 4K crashes amdgpu and causes a GPU hang
Date: Sun, 25 Aug 2019 16:26:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@lukaszposadowski.pl
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-108493-502-cpLZFS6iB3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108493-502@http.bugs.freedesktop.org/>
References: <bug-108493-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0747523772=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0747523772==
Content-Type: multipart/alternative; boundary="15667503973.98E1BE9D4.29508"
Content-Transfer-Encoding: 7bit


--15667503973.98E1BE9D4.29508
Date: Sun, 25 Aug 2019 16:26:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108493

=C5=81ukasz Posadowski <mail@lukaszposadowski.pl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|FIXED                       |---
             Status|RESOLVED                    |REOPENED

--- Comment #20 from =C5=81ukasz Posadowski <mail@lukaszposadowski.pl> ---
Since it is my first (technically second, but by GPU crashed before I was a=
ble
to finish it the first time), hi everyone.

I am expering very similar problem on Kernel 5.2.8 on Fedora 30 and AMD RX5=
70
pci express card. I described it here -
https://bugzilla.redhat.com/show_bug.cgi?id=3D1739766 .

I can run X with 'low' in
sys/class/drm/card0/device/power_dpm_force_performance_level. Basically
everytime GPU has ~100% load, the card resets itself and never come back. I=
 can
ssh into the system and switch to the text console, it is just GPU with X
Server that doesn't work.

Card also crashes sometimes with 'low' setting, usually after 30 minutes or=
 a
hour of gaming., but then it's a hard crash and I can't even switch to the =
text
console.

Thanks for any help.
=C5=81ukasz

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15667503973.98E1BE9D4.29508
Date: Sun, 25 Aug 2019 16:26:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mail&#64;=
lukaszposadowski.pl" title=3D"=C5=81ukasz Posadowski &lt;mail&#64;lukaszpos=
adowski.pl&gt;"> <span class=3D"fn">=C5=81ukasz Posadowski</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unigine Heaven at 4K crashes amdgpu and causes a GPU=
 hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108493">bug 10849=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unigine Heaven at 4K crashes amdgpu and causes a GPU=
 hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108493#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unigine Heaven at 4K crashes amdgpu and causes a GPU=
 hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108493">bug 10849=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail&#64;lukaszposadowski.pl" title=3D"=C5=81ukasz Posadowski &lt;mail&#64;=
lukaszposadowski.pl&gt;"> <span class=3D"fn">=C5=81ukasz Posadowski</span><=
/a>
</span></b>
        <pre>Since it is my first (technically second, but by GPU crashed b=
efore I was able
to finish it the first time), hi everyone.

I am expering very similar problem on Kernel 5.2.8 on Fedora 30 and AMD RX5=
70
pci express card. I described it here -
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1739766">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1739766</a> .

I can run X with 'low' in
sys/class/drm/card0/device/power_dpm_force_performance_level. Basically
everytime GPU has ~100% load, the card resets itself and never come back. I=
 can
ssh into the system and switch to the text console, it is just GPU with X
Server that doesn't work.

Card also crashes sometimes with 'low' setting, usually after 30 minutes or=
 a
hour of gaming., but then it's a hard crash and I can't even switch to the =
text
console.

Thanks for any help.
=C5=81ukasz</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15667503973.98E1BE9D4.29508--

--===============0747523772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0747523772==--
