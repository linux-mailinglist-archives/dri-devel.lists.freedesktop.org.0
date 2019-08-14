Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C290B8CA1B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 06:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E777B6E1B6;
	Wed, 14 Aug 2019 04:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 501266E1B6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 04:10:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 49A4F721AA; Wed, 14 Aug 2019 04:10:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel:
 [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
 [CRTC:57:crtc-0] flip_done timed out
Date: Wed, 14 Aug 2019 04:10:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kai.heng.feng@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110886-502-lj4ZFQs3Ze@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0837081787=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0837081787==
Content-Type: multipart/alternative; boundary="15657558451.BB2267.15733"
Content-Transfer-Encoding: 7bit


--15657558451.BB2267.15733
Date: Wed, 14 Aug 2019 04:10:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #9 from Kai-Heng Feng <kai.heng.feng@canonical.com> ---
(In reply to Andrey Grodzovsky from comment #8)
> (In reply to Kai-Heng Feng from comment #6)
> > Created attachment 145044 [details]
> > failed log when iommu is disabled.
>=20
> What was the failur ewith IOMMU disabled ?
Blanked screen. Graphics no longer works.

>Is it the same as with IOMMU enabled ?
Yes.

> In the log I only see PSP errors on resume. Can you confirm that the only
> failure/error you observed in the log in that use case ?
Yes. I haven't seen=20
"[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:57:crtc-0] flip_done timed out"
for a while.

Now it always shows PSP fail.

>=20
> Can you please provide your FW versions by=20
> cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 40, firmware version: 0x00000099
PFP feature version: 40, firmware version: 0x000000ae
CE feature version: 40, firmware version: 0x0000004d
RLC feature version: 1, firmware version: 0x00000213
RLC SRLC feature version: 1, firmware version: 0x00000001
RLC SRLG feature version: 1, firmware version: 0x00000001
RLC SRLS feature version: 1, firmware version: 0x00000001
MEC feature version: 40, firmware version: 0x0000018b
MEC2 feature version: 40, firmware version: 0x0000018b
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 0, firmware version: 0x001ad4d4
TA XGMI feature version: 0, firmware version: 0x00000000
TA RAS feature version: 0, firmware version: 0x00000000
SMC feature version: 0, firmware version: 0x00001e4f
SDMA0 feature version: 41, firmware version: 0x000000a9
VCN feature version: 0, firmware version: 0x0110901c
DMCU feature version: 0, firmware version: 0x00000000
VBIOS version: SWBRT32481.001

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657558451.BB2267.15733
Date: Wed, 14 Aug 2019 04:10:45 +0000
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
   title=3D"NEW - After S3 resume, kernel: [drm:drm_atomic_helper_wait_for_=
flip_done [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm:drm_atomic_helper_wait_for_=
flip_done [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kai.heng.feng&#64;canonical.com" title=3D"Kai-Heng Feng &lt;kai.heng.feng&#=
64;canonical.com&gt;"> <span class=3D"fn">Kai-Heng Feng</span></a>
</span></b>
        <pre>(In reply to Andrey Grodzovsky from <a href=3D"show_bug.cgi?id=
=3D110886#c8">comment #8</a>)
<span class=3D"quote">&gt; (In reply to Kai-Heng Feng from <a href=3D"show_=
bug.cgi?id=3D110886#c6">comment #6</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D145044" n=
ame=3D"attach_145044" title=3D"failed log when iommu is disabled.">attachme=
nt 145044</a> <a href=3D"attachment.cgi?id=3D145044&amp;action=3Dedit" titl=
e=3D"failed log when iommu is disabled.">[details]</a></span>
&gt; &gt; failed log when iommu is disabled.
&gt;=20
&gt; What was the failur ewith IOMMU disabled ?</span >
Blanked screen. Graphics no longer works.

<span class=3D"quote">&gt;Is it the same as with IOMMU enabled ?</span >
Yes.

<span class=3D"quote">&gt; In the log I only see PSP errors on resume. Can =
you confirm that the only
&gt; failure/error you observed in the log in that use case ?</span >
Yes. I haven't seen=20
&quot;[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:57:crtc-0] flip_done timed out&quot;
for a while.

Now it always shows PSP fail.

<span class=3D"quote">&gt;=20
&gt; Can you please provide your FW versions by=20
&gt; cat /sys/kernel/debug/dri/0/amdgpu_firmware_info</span >
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 40, firmware version: 0x00000099
PFP feature version: 40, firmware version: 0x000000ae
CE feature version: 40, firmware version: 0x0000004d
RLC feature version: 1, firmware version: 0x00000213
RLC SRLC feature version: 1, firmware version: 0x00000001
RLC SRLG feature version: 1, firmware version: 0x00000001
RLC SRLS feature version: 1, firmware version: 0x00000001
MEC feature version: 40, firmware version: 0x0000018b
MEC2 feature version: 40, firmware version: 0x0000018b
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 0, firmware version: 0x001ad4d4
TA XGMI feature version: 0, firmware version: 0x00000000
TA RAS feature version: 0, firmware version: 0x00000000
SMC feature version: 0, firmware version: 0x00001e4f
SDMA0 feature version: 41, firmware version: 0x000000a9
VCN feature version: 0, firmware version: 0x0110901c
DMCU feature version: 0, firmware version: 0x00000000
VBIOS version: SWBRT32481.001</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657558451.BB2267.15733--

--===============0837081787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0837081787==--
