Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F48CEEC3
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2024 13:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DC310EE8C;
	Sat, 25 May 2024 11:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oTTdTr1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F0610EE8C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 11:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FFA7614A5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 11:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0CFBC3277B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 11:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716637572;
 bh=qRjq1igu7WMv6mm2l4gVDb3jzSipku93i2aCoykKv1c=;
 h=From:To:Subject:Date:From;
 b=oTTdTr1isRJwGTNWB54U7aSF5XC2k8Nke4KgOVbYmN0qi53hm9P32XxPqNUdg0kTn
 rIWwAFsJOSO/JkrwbM+WRIab6XGA8QxR/eVBUeegUGgWfuyugutpe9vhODYh+Rsx8P
 Ql8tdb2bx6mtmEVVpOWiPmRDrRAeuUwmTA39JPfxgiG5yXXOpRGKGs5ouw3IkRbW8c
 ezVhkphNKxcM4N2nOyek9XdCaWfTOXHQ9ovxRVZ1JX7FBrI83xmK8sW4/9knjDtzuw
 9SaiHlzt2ywl6RXFwf0Qyz6rpIY7ccVHZDPEQyocpyoim6gxaKfBLzzRyDSpdC88yz
 mI/EBs/XHCSAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CB8AAC53B7F; Sat, 25 May 2024 11:46:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTg4OTFdIE5ldzogSW4gZnVuY3Rpb24g4oCYZGNuMzIx?=
 =?UTF-8?B?X3VwZGF0ZV9id19ib3VuZGluZ19ib3jigJkgLSB3YXJuaW5nOiB0aGUgZnJh?=
 =?UTF-8?B?bWUgc2l6ZSBvZiAxMzM2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEyODAgYnl0?=
 =?UTF-8?B?ZXM=?=
Date: Sat, 25 May 2024 11:46:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218891-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218891

            Bug ID: 218891
           Summary: In function =E2=80=98dcn321_update_bw_bounding_box=E2=
=80=99 - warning:
                    the frame size of 1336 bytes is larger than 1280 bytes
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Kernel 6.9.0=20


...
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_utils.o
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.c:=
 In
function =E2=80=98dcn321_update_bw_bounding_box=E2=80=99:
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn321/dcn321_resource.c:=
1599:1:
warning: the frame size of 1336 bytes is larger than 1280 bytes
[-Wframe-larger-than=3D]
 1599 | }
      | ^
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_policy.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_translation_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_dc_resource_mg=
mt.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml_display_rq_dlg_calc.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dce120/dce120_timing_generator.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_compressor=
.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_compressor=
.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_regamma_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_csc_v.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_timing_generator_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_mem_input_=
v.o
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.c: In
function =E2=80=98dcn32_update_bw_bounding_box=E2=80=99:
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn32/dcn32_resource.c:20=
24:1:
warning: the frame size of 1336 bytes is larger than 1280 bytes
[-Wframe-larger-than=3D]
 2024 | }
      | ^
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_v.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_transform_=
v.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dce80/dce80_timing_generator.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_timing_generator.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_hw_sequencer=
.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/hdcp/hdcp_msg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_sink.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_surface.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_debug.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_exports.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_state.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_vm_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dc_edid_parser.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_table.o
  CC [M]=20
drivers/gpu/drm/amd/amdgpu/../display/modules/info_packet/info_packet.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers=
.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv_stat.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_reg.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn20.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn21.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn30.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn301.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn302.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn303.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn31.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn314.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn315.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn316.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn32.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn35.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn351.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_executio=
n.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transiti=
on.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_executio=
n.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transiti=
on.o

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
