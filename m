Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D09B8C0E6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 20:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239D96E160;
	Tue, 13 Aug 2019 18:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B16D86E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 18:41:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A77787215A; Tue, 13 Aug 2019 18:41:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel:
 [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
 [CRTC:57:crtc-0] flip_done timed out
Date: Tue, 13 Aug 2019 18:41:31 +0000
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
Message-ID: <bug-110886-502-laF4slxLNp@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1061794042=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1061794042==
Content-Type: multipart/alternative; boundary="15657216910.eEdA3.26449"
Content-Transfer-Encoding: 7bit


--15657216910.eEdA3.26449
Date: Tue, 13 Aug 2019 18:41:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #8 from Andrey Grodzovsky <andrey.grodzovsky@amd.com> ---
(In reply to Kai-Heng Feng from comment #6)
> Created attachment 145044 [details]
> failed log when iommu is disabled.

What was the failur ewith IOMMU disabled ? Is it the same as with IOMMU ena=
bled
?
In the log I only see PSP errors on resume. Can you confirm that the only
failure/error you observed in the log in that use case ?

Can you please provide your FW versions by=20
cat /sys/kernel/debug/dri/0/amdgpu_firmware_info

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657216910.eEdA3.26449
Date: Tue, 13 Aug 2019 18:41:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm:drm_atomic_helper_wait_for_=
flip_done [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey.grodzovsky&#64;amd.com" title=3D"Andrey Grodzovsky &lt;andrey.grodzo=
vsky&#64;amd.com&gt;"> <span class=3D"fn">Andrey Grodzovsky</span></a>
</span></b>
        <pre>(In reply to Kai-Heng Feng from <a href=3D"show_bug.cgi?id=3D1=
10886#c6">comment #6</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145044" name=3D"attach_145044" title=3D"failed log when iommu is di=
sabled.">attachment 145044</a> <a href=3D"attachment.cgi?id=3D145044&amp;ac=
tion=3Dedit" title=3D"failed log when iommu is disabled.">[details]</a></sp=
an>
&gt; failed log when iommu is disabled.</span >

What was the failur ewith IOMMU disabled ? Is it the same as with IOMMU ena=
bled
?
In the log I only see PSP errors on resume. Can you confirm that the only
failure/error you observed in the log in that use case ?

Can you please provide your FW versions by=20
cat /sys/kernel/debug/dri/0/amdgpu_firmware_info</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657216910.eEdA3.26449--

--===============1061794042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1061794042==--
