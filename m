Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5947177
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 19:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3E7890AD;
	Sat, 15 Jun 2019 17:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1096B89169
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 17:45:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0C0AA72167; Sat, 15 Jun 2019 17:45:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sat, 15 Jun 2019 17:45:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-Jgf94iKjxZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0333982400=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0333982400==
Content-Type: multipart/alternative; boundary="15606207360.23B4.7622"
Content-Transfer-Encoding: 7bit


--15606207360.23B4.7622
Date: Sat, 15 Jun 2019 17:45:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #51 from Richard Thier <u9vata@gmail.com> ---
(In reply to cosiekvfj from comment #17)
>            *-display
>                 description: VGA compatible controller
>                 product: RC410M [Mobility Radeon Xpress 200M]
>                 vendor: Advanced Micro Devices, Inc. [AMD/ATI]
>                 physical id: 5
>                 bus info: pci@0000:01:05.0
>                 version: 00
>                 width: 32 bits
>                 clock: 66MHz
>                 capabilities: pm msi vga_controller bus_master cap_list r=
om
>                 configuration: driver=3Dradeon latency=3D66 mingnt=3D8
>                 resources: irq:17 memory:d0000000-dfffffff
> ioport:9000(size=3D256) memory:c0000000-c000ffff memory:c0000-dffff

Hi cosiekvfj!

Can you attach what your dmesg output is?

The whole output, but especially this part:

radeon: 3 quad pipes, 1 z pipes initialized.

Do you also get 3 quad pipes and 1 z pipes?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606207360.23B4.7622
Date: Sat, 15 Jun 2019 17:45:36 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c51">Comme=
nt # 51</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>(In reply to cosiekvfj from <a href=3D"show_bug.cgi?id=3D11089=
7#c17">comment #17</a>)
<span class=3D"quote">&gt;            *-display
&gt;                 description: VGA compatible controller
&gt;                 product: RC410M [Mobility Radeon Xpress 200M]
&gt;                 vendor: Advanced Micro Devices, Inc. [AMD/ATI]
&gt;                 physical id: 5
&gt;                 bus info: pci&#64;0000:01:05.0
&gt;                 version: 00
&gt;                 width: 32 bits
&gt;                 clock: 66MHz
&gt;                 capabilities: pm msi vga_controller bus_master cap_lis=
t rom
&gt;                 configuration: driver=3Dradeon latency=3D66 mingnt=3D8
&gt;                 resources: irq:17 memory:d0000000-dfffffff
&gt; ioport:9000(size=3D256) memory:c0000000-c000ffff memory:c0000-dffff</s=
pan >

Hi cosiekvfj!

Can you attach what your dmesg output is?

The whole output, but especially this part:

radeon: 3 quad pipes, 1 z pipes initialized.

Do you also get 3 quad pipes and 1 z pipes?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606207360.23B4.7622--

--===============0333982400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0333982400==--
