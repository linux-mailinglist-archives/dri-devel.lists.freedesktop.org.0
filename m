Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811AD43857E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 23:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDC26E07D;
	Sat, 23 Oct 2021 21:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089A6E07D
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 21:03:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F48860F93
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635023029;
 bh=5gfheNhrSwmM/p8yQFcTEMH9CLt25276Y1boQbVHHfM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NTtGypwUQdI6vqtRmfowOpCLvi9OutXVb5nfz461LL2t6ZQIHHC5ypnObirW+Pe1F
 Qyb0CpLbu13M+eplb5CKc3QojVRMcLh7dBdbcveoYDvzmdlM0wH8+0kF1XWpHG6JN/
 tHTZVDmkV7NFpySX2HWLhVNmM9mwWHUR2ntjn4eizkPdnWkzUP2nREkOLKRGDGxj7N
 qaFPliz5c0lx5KSn2higjADUe1dFsHqjcecuOtcD2B0FB9SrLVgbP5NXpAkplVnIuy
 sgn7Fl/xh8IxQ/9JbOfuGEmhDBNwXr3dgVsT2wg847UmA5BzMsaQnC6oisXX2gdtKc
 Up3zJ1f02TmWQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0761A60FEC; Sat, 23 Oct 2021 21:03:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Sat, 23 Oct 2021 21:03:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: matthew.william.berry@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-R1XTIrWVOw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Matt Berry (matthew.william.berry@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |matthew.william.berry@gmail
                   |                            |.com

--- Comment #11 from Matt Berry (matthew.william.berry@gmail.com) ---
I'm seeing this when I use my work laptop (HP SKU 3YG73UC) with a Startech =
DP
KVM (sv231dpu2) on Ubuntu 20.04 (5.11.0-37-generic). It doesn't happen every
time, but when I switch the KVM over I'll hear the fan kick on and when I
switch the KVM back I'll see the following in `dmesg`. Given that it's a wo=
rk
laptop, I'll have to follow their kernel release cycle, but will report bac=
k if
I see it on newer kernels as they roll out.

```
sudo journalctl -b 0 | grep -i firmware | grep i915
Oct 12 14:44:59 u41fc3826021951.ant.amazon.com kernel: i915 0000:00:02.0: [=
drm]
Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)

sudo dmesg | egrep -vi 'audit|usb |hub |input: '
[941754.942373] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[941754.964462] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[941953.993504] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[942109.330113] loop12: detected capacity change from 0 to 1232
[942125.974833] loop13: detected capacity change from 0 to 337424
[942146.986960] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[942392.995237] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[942967.950060] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[942967.972573] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[942990.984072] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[943003.939382] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[943003.962504] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[943227.981538] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[943765.979086] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[943775.950453] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[943775.981195] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[944033.975975] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[945830.946882] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[945830.969342] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[946098.985432] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[947569.935525] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[947569.957792] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[947604.971146] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
000000003ba372b9 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
