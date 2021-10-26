Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D5243AF0D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 11:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC95E6E514;
	Tue, 26 Oct 2021 09:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D986E6E514
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 09:27:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9613060724
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635240425;
 bh=TZlCmEYoiDC0IX64LCfoUUsHrWLnZSQtJ39OyAVp4go=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XNpnLSeeOO2k0L5TV9JBdAKeYANxhE2dZ0jfQR/msbB362bCzbagHLBIL0JkwHwtL
 VDexUgWLavb+gUWsDNYBNb+iLoyQ72PRYpHUOYcenvlirxF3C+WPOY+ZrLcosnBIi2
 We+IHD293j4/X6e6ZXqVNpICP705ZdOOS1YM86ECTP3XArjZWOVwgJWuZaZ6JyBxR7
 zkxbZr81fV5j+BMv29W6o54HZyQZEZ63sRiGdRb88NRVq794pSUE5KocS/zWgZUftD
 faX9hiomQ2IDzDX2FGS9k6c7/eNNGzVH1hG2loSPEYsjdXgUMPhKa8R6IwBeeDWxBN
 twLj8WKnsemBw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 92E16610FC; Tue, 26 Oct 2021 09:27:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Tue, 26 Oct 2021 09:27:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: zwerg12@mail.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-v7HFDRsqiv@https.bugzilla.kernel.org/>
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

--- Comment #12 from zwerg12@mail.de ---
As mentioned before, I get the same error with a monitor connected with DP =
to a
Lenovo ThinkPad USB-C Dock Gen2. My Laptop has an Intel i7 10510U no additi=
onal
graphics card. I am using Debian testing with the provided kernel.

Furthermore sudo dmesg output says:
[  148.088024] wrong crc01 50 63 ff ff 00 00 00 00 50 63 ff ff 00 00 00
[  148.088028] wrong crc00 04 90 c0 01 00 00 00 00 00 00 00 00 00 00 00
[  148.088029] wrong crc00 00 00 00 95 00 00 00 00 00 00 00 00
[  148.152590] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
00000000deb5c7d4 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  148.182726] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
00000000deb5c7d4 port 0: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  148.202439] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
00000000deb5c7d4 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  148.557719] [drm:drm_dp_mst_hpd_irq [drm_kms_helper]] *ERROR* Got unknown
reply 0x00 (GET_MSG_TRANSACTION_VERSION)
[  148.812803] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
00000000e591bea5 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  149.036253] wrong crc80 81 40 95 00 a9 40 b3 00 d1 00 e1 c0 37 38 51
[  149.036257] wrong crc56 0a 20 20 20 20 20 00 00 00 ff 00 4c 35 4c 4d
[  149.036259] wrong crc51 53 31 37 34 34 38 33 0a 01 05 02 00
[  149.119816] wrong crc80 81 40 95 00 a9 40 b3 00 d1 00 e1 c0 37 38 51
[  149.119819] wrong crc56 0a 20 20 20 20 20 00 00 00 ff 00 4c 35 4c 4d
[  149.119821] wrong crc51 53 31 37 34 34 38 33 0a 01 05 02 00
[  149.161970] wrong crc20 20 20 20 20 00 00 00 fc 00 50 41 32 37 38 51
[  149.161973] wrong crc56 0a 20 20 20 20 20 00 00 00 ff 00 4c 00 00 00
[  149.161975] wrong crc00 00 00 00 00 00 00 00 00 00 00 00
[  149.219517] wrong crc80 81 40 95 00 a9 40 b3 00 d1 00 e1 c0 37 38 51
[  149.219520] wrong crc56 0a 20 20 20 20 20 00 00 00 ff 00 4c 35 4c 4d
[  149.219522] wrong crc51 53 31 37 34 34 38 33 0a 01 05 02 00
[  149.248529] wrong crc22 02 80 00 ff ff ff ff ff ff 00 06 b3 56 5e 00
[  149.248532] wrong crca0 a0 a0 29 50 30 20 35 00 55 50 21 00 00 1a 00
[  149.248534] wrong crc00 00 fd 00 2e 4b 70 70 1e 01 0a 20 d3
[  149.357568] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
00000000e591bea5 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  149.386520] wrong crc22 02 80 00 ff ff ff ff ff ff 00 06 b3 00 27 01
[  149.386523] wrong crc01 01 01 16 1e 01 04 a5 3c 22 78 3b ff 00 1a 00
[  149.386524] wrong crc00 00 fd 00 2e 4b 70 70 1e 01 0a 20 d3
[  149.433016] wrong crc80 81 40 95 00 a9 40 b3 00 d1 00 e1 c0 37 38 51
[  149.433019] wrong crc56 0a 20 20 20 20 20 00 00 00 ff 00 4c 35 4c 4d
[  149.433020] wrong crc51 53 31 37 34 34 38 33 0a 01 05 02 00
[  149.452176] wrong crc22 02 80 00 ff ff ff ff ff ff 00 06 b3 00 27 01
[  149.452179] wrong crc01 01 01 16 1e 01 04 a5 3c 22 78 3b ff 00 1a 00
[  149.452180] wrong crc00 00 fd 00 2e 4b 70 70 1e 01 0a 20 d3
[  149.465498] wrong crc80 81 40 95 00 a9 40 b3 00 d1 00 e1 c0 56 5e 00
[  149.465501] wrong crca0 a0 a0 29 50 30 20 35 00 55 50 21 00 35 4c 4d
[  149.465503] wrong crc51 53 31 37 34 34 38 33 0a 01 05 02 00
[  149.476472] i915 0000:00:02.0: [drm] DP-3: EDID is invalid:
[  149.476477]  [00] BAD  00 ff ff ff ff ff ff 00 06 b3 00 27 01 01 01 01
[  149.476479]  [00] BAD  16 1e 01 04 a5 3c 22 78 3b ff 00 1a 00 00 00 fd
[  149.476481]  [00] BAD  00 2e 4b 70 70 1e 01 0a 20 80 81 40 95 00 a9 40
[  149.476483]  [00] BAD  b3 00 d1 00 e1 c0 56 5e 00 a0 a0 a0 29 50 30 20
[  149.476484]  [00] BAD  35 00 55 50 21 00 35 4c 4d 51 53 31 37 34 34 38
[  149.476486]  [00] BAD  33 0a 01 05 02 20 20 20 20 20 00 00 00 fc 00 50
[  149.476487]  [00] BAD  41 32 37 38 51 56 0a 20 20 20 20 20 00 00 00 ff
[  149.476489]  [00] BAD  00 4c 35 4c 4d 51 53 31 37 34 34 38 33 0a 01 05
[  149.533039] wrong crc22 02 80 00 ff ff ff ff ff ff 00 06 b3 56 5e 00
[  149.533042] wrong crca0 a0 a0 29 50 30 20 35 00 55 50 21 00 00 1a 00
[  149.533044] wrong crc00 00 fd 00 2e 4b 70 70 1e 01 0a 20 d3
[  149.698698] wrong crc01 05 6c ff ff 00 00 00 00 05 6c ff ff 00 00 00
[  149.698702] wrong crc00 04 90 c0 01 00 00 00 00 00 00 00 00 00 00 00
[  149.698704] wrong crc00 00 00 00 95 00 00 00 00 00 00 00 00
[  149.732698] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
0000000076514e96 port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  149.750841] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
0000000076514e96 port 0: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  149.772810] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
0000000076514e96 port 3: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  150.080471] failed hdr00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  154.083081] [drm:drm_dp_send_link_address [drm_kms_helper]] *ERROR* Send=
ing
link address failed with -5
[  156.605509] [drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb
00000000f470192a port 1: DPCD read on addr 0x4b0 for 1 bytes NAKed
[  160.905655] wrong crc22 02 80 00 ff ff ff ff ff ff 00 06 b3 56 5e 00
[  160.905659] wrong crca0 a0 a0 29 50 30 20 35 00 55 50 21 00 00 1a 00
[  160.905661] wrong crc00 00 fd 00 2e 4b 70 70 1e 01 0a 20 d3
[  161.043938] wrong crc80 81 40 95 00 a9 40 b3 00 d1 00 e1 c0 56 5e 00
[  161.043941] wrong crca0 a0 a0 29 50 30 20 35 00 55 50 21 00 35 4c 4d
[  161.043942] wrong crc51 53 31 37 34 34 38 33 0a 01 05 02 00
[  161.355912] wrong crc22 02 80 00 ff ff ff ff ff ff 00 06 b3 00 27 01
[  161.355915] wrong crc01 01 01 16 1e 01 04 a5 3c 22 78 3b ff 00 1a 00
[  161.355916] wrong crc00 00 fd 00 2e 4b 70 70 1e 01 0a 20 d3

During this my notebook monitor is blinking.
This setup worked for around four weeks when suddenly these errors occurred.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
