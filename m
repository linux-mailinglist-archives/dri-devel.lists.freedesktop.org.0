Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7ABF8EE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 20:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4242B6EDBA;
	Thu, 26 Sep 2019 18:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E8F66EDBA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 18:11:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1B2ED72162; Thu, 26 Sep 2019 18:11:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel: [drm] psp command failed and
 response status is (-65529) at 27th time of S3. 28th time of S3 freeze the
 system.
Date: Thu, 26 Sep 2019 18:11:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrey.grodzovsky@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110886-502-5E1JmMQvLh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110886-502@http.bugs.freedesktop.org/>
References: <bug-110886-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1739869503=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1739869503==
Content-Type: multipart/alternative; boundary="15695215051.B9971EB.10573"
Content-Transfer-Encoding: 7bit


--15695215051.B9971EB.10573
Date: Thu, 26 Sep 2019 18:11:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #19 from Andrey Grodzovsky <andrey.grodzovsky@amd.com> ---
(In reply to Kai-Heng Feng from comment #9)
> (In reply to Andrey Grodzovsky from comment #8)
> > (In reply to Kai-Heng Feng from comment #6)
> > > Created attachment 145044 [details]
> > > failed log when iommu is disabled.
> >=20
> > What was the failur ewith IOMMU disabled ?
> Blanked screen. Graphics no longer works.
>=20
> >Is it the same as with IOMMU enabled ?
> Yes.
>=20
> > In the log I only see PSP errors on resume. Can you confirm that the on=
ly
> > failure/error you observed in the log in that use case ?
> Yes. I haven't seen=20
> "[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
> [CRTC:57:crtc-0] flip_done timed out"
> for a while.
>=20
> Now it always shows PSP fail.
>=20
> >=20
> > Can you please provide your FW versions by=20
> > cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
> VCE feature version: 0, firmware version: 0x00000000
> UVD feature version: 0, firmware version: 0x00000000
> MC feature version: 0, firmware version: 0x00000000
> ME feature version: 40, firmware version: 0x00000099
> PFP feature version: 40, firmware version: 0x000000ae
> CE feature version: 40, firmware version: 0x0000004d
> RLC feature version: 1, firmware version: 0x00000213
> RLC SRLC feature version: 1, firmware version: 0x00000001
> RLC SRLG feature version: 1, firmware version: 0x00000001
> RLC SRLS feature version: 1, firmware version: 0x00000001
> MEC feature version: 40, firmware version: 0x0000018b
> MEC2 feature version: 40, firmware version: 0x0000018b
> SOS feature version: 0, firmware version: 0x00000000
> ASD feature version: 0, firmware version: 0x001ad4d4
> TA XGMI feature version: 0, firmware version: 0x00000000
> TA RAS feature version: 0, firmware version: 0x00000000
> SMC feature version: 0, firmware version: 0x00001e4f
> SDMA0 feature version: 41, firmware version: 0x000000a9
> VCN feature version: 0, firmware version: 0x0110901c
> DMCU feature version: 0, firmware version: 0x00000000
> VBIOS version: SWBRT32481.001

Can you please confirm the issue happens regardless of graphic enabled, load
system in console mode and verify you still observe the problem.(In reply to
Kai-Heng Feng from comment #12)
> > Now it always shows PSP fail.
> I've dug up more info about this issue. It always times out in
> psp_cmd_submit_buf(). Particularly, this code section:
>=20
> 	while (*((unsigned int *)psp->fence_buf) !=3D index) {
> 		if (--timeout =3D=3D 0)
> 			break;
> 		msleep(1);
> 	}
>=20
> psp->fence_buf stuck at 406 and index stuck at 407 and it eventually times
> out.
> This _always_ happens at 27th time of S3, and freeze the whole system at
> 28th S3 attempt.

Does it happen also when no acceleration in system - i mean if you do S3 cy=
cles
from console mode ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695215051.B9971EB.10573
Date: Thu, 26 Sep 2019 18:11:45 +0000
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
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey.grodzovsky&#64;amd.com" title=3D"Andrey Grodzovsky &lt;andrey.grodzo=
vsky&#64;amd.com&gt;"> <span class=3D"fn">Andrey Grodzovsky</span></a>
</span></b>
        <pre>(In reply to Kai-Heng Feng from <a href=3D"show_bug.cgi?id=3D1=
10886#c9">comment #9</a>)
<span class=3D"quote">&gt; (In reply to Andrey Grodzovsky from <a href=3D"s=
how_bug.cgi?id=3D110886#c8">comment #8</a>)
&gt; &gt; (In reply to Kai-Heng Feng from <a href=3D"show_bug.cgi?id=3D1108=
86#c6">comment #6</a>)
&gt; &gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D1450=
44" name=3D"attach_145044" title=3D"failed log when iommu is disabled.">att=
achment 145044</a> <a href=3D"attachment.cgi?id=3D145044&amp;action=3Dedit"=
 title=3D"failed log when iommu is disabled.">[details]</a></span>
&gt; &gt; &gt; failed log when iommu is disabled.
&gt; &gt;=20
&gt; &gt; What was the failur ewith IOMMU disabled ?
&gt; Blanked screen. Graphics no longer works.
&gt;=20
&gt; &gt;Is it the same as with IOMMU enabled ?
&gt; Yes.
&gt;=20
&gt; &gt; In the log I only see PSP errors on resume. Can you confirm that =
the only
&gt; &gt; failure/error you observed in the log in that use case ?
&gt; Yes. I haven't seen=20
&gt; &quot;[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERR=
OR*
&gt; [CRTC:57:crtc-0] flip_done timed out&quot;
&gt; for a while.
&gt;=20
&gt; Now it always shows PSP fail.
&gt;=20
&gt; &gt;=20
&gt; &gt; Can you please provide your FW versions by=20
&gt; &gt; cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
&gt; VCE feature version: 0, firmware version: 0x00000000
&gt; UVD feature version: 0, firmware version: 0x00000000
&gt; MC feature version: 0, firmware version: 0x00000000
&gt; ME feature version: 40, firmware version: 0x00000099
&gt; PFP feature version: 40, firmware version: 0x000000ae
&gt; CE feature version: 40, firmware version: 0x0000004d
&gt; RLC feature version: 1, firmware version: 0x00000213
&gt; RLC SRLC feature version: 1, firmware version: 0x00000001
&gt; RLC SRLG feature version: 1, firmware version: 0x00000001
&gt; RLC SRLS feature version: 1, firmware version: 0x00000001
&gt; MEC feature version: 40, firmware version: 0x0000018b
&gt; MEC2 feature version: 40, firmware version: 0x0000018b
&gt; SOS feature version: 0, firmware version: 0x00000000
&gt; ASD feature version: 0, firmware version: 0x001ad4d4
&gt; TA XGMI feature version: 0, firmware version: 0x00000000
&gt; TA RAS feature version: 0, firmware version: 0x00000000
&gt; SMC feature version: 0, firmware version: 0x00001e4f
&gt; SDMA0 feature version: 41, firmware version: 0x000000a9
&gt; VCN feature version: 0, firmware version: 0x0110901c
&gt; DMCU feature version: 0, firmware version: 0x00000000
&gt; VBIOS version: SWBRT32481.001</span >

Can you please confirm the issue happens regardless of graphic enabled, load
system in console mode and verify you still observe the problem.(In reply to
Kai-Heng Feng from <a href=3D"show_bug.cgi?id=3D110886#c12">comment #12</a>)
<span class=3D"quote">&gt; &gt; Now it always shows PSP fail.
&gt; I've dug up more info about this issue. It always times out in
&gt; psp_cmd_submit_buf(). Particularly, this code section:
&gt;=20
&gt; 	while (*((unsigned int *)psp-&gt;fence_buf) !=3D index) {
&gt; 		if (--timeout =3D=3D 0)
&gt; 			break;
&gt; 		msleep(1);
&gt; 	}
&gt;=20
&gt; psp-&gt;fence_buf stuck at 406 and index stuck at 407 and it eventuall=
y times
&gt; out.
&gt; This _always_ happens at 27th time of S3, and freeze the whole system =
at
&gt; 28th S3 attempt.</span >

Does it happen also when no acceleration in system - i mean if you do S3 cy=
cles
from console mode ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695215051.B9971EB.10573--

--===============1739869503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1739869503==--
