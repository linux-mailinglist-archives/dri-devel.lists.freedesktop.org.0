Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1B3C13894
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18E910E5AA;
	Tue, 28 Oct 2025 08:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="gxPWMQuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 752 seconds by postgrey-1.36 at gabe;
 Tue, 28 Oct 2025 04:08:02 UTC
Received: from outbound.ms.icloud.com
 (p-west3-cluster2-host6-snip4-1.eps.apple.com [57.103.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5AD10E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 04:08:02 +0000 (UTC)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPS id
 4337918000AC; Tue, 28 Oct 2025 04:02:53 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai;
 bh=YdJUwIqmtQxYRwFx4n9+CvoBPFB6u8eKUtmPnn5+SZA=;
 h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version:x-icloud-hme;
 b=gxPWMQuc9uKqSKNdF/ZeVRY+uJtojIMt2h83ylvSygL/K0HmkajamTVy3xWhJFxmFld9NvFaLyck97u8lv2hTI0Qwh7A0mto8C40kXV5DJ65N+H17Gbx0vqaTlodbiioNxNRS6hgtlPwkk1/XN4j/jQLULFpWkzVXOypVWh5c6ncIuyiLXzK6H2rue7Bpz9xyLaKmfZc2PIv0RHu6xXRzwLx8Av2G3uLmAvglMZIbJSkULZTLC0/cqwB+8RKFzeXkGco1IeLeJFYTRgfm28AQm56BIv6I//uCz05Mye8fi+ITCw2N6ViXUn0k2CAeKPeoLGcXJIcsffT6nSvkFak4A==
Received: from [192.168.4.116] (unknown [17.57.154.37])
 by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPSA id
 8CEA318000B2; Tue, 28 Oct 2025 04:02:52 +0000 (UTC)
Message-ID: <8603b67049805f8b2d187a2d4e4a82a18c656470.camel@icloud.com>
Subject: [PATCH 3/3] drm/plane: Correct typo in update_plane docs
From: Zoe Gates <zoe.blair.gates@icloud.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 23:02:50 -0500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (by Flathub.org) 
MIME-Version: 1.0
X-Proofpoint-GUID: EAE4rW_LQrmipeqfdkPBKuC0jX3ShehK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAzMyBTYWx0ZWRfX9+ZXVC9qP9Gj
 emEJZDkJ8WHkMfRhT7Vv3tosWui7qwRAjq0pwwIBst2DP8OM9D/H+h8ntbtShLXI7rc3oTn3Btl
 uLGKQvKhavSFBuBFg2eGbRwxI2O5ZvYCS6pLTknDdzVM7EYR5oTw+DkjnOprEPY3sfjywfiK7v3
 5J3lN8BNPCf6gVxH6kcR8dPh2IEzQDNTwkWiu6p5q9kSjztIyEg85j7afpNhHxA+eJZ5pfcVnhh
 PI4yojUdAeV7KcQkkxMAOjAarjMTMOKG35A7K1wERN1+1wankwyDmlNuUapZpNXN6hXgXTcjI=
X-Proofpoint-ORIG-GUID: EAE4rW_LQrmipeqfdkPBKuC0jX3ShehK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2510280033
X-JNJ: AAAAAAAB7VEUwYnqwEWr147H2Rp8xJEKDD5nYq5NnjQSoDdce2oYYIc/Zl4X5TNER8dcVYpY7OHcLt2aFTWpcJ/cDNuGPBoOnt50xcCecixql51U4l48QUeEiSyH53X3elFfWyqiTN2xm0YPN6p8CAqnKUWXuugxsbcN+vroHIVAMH7G1Po9qxq9lEv8yIhpvwl+3eA9+7FwtYuRp87hPEdOUuFNkw13w6bHZoqDTWh+eRZYzhtXofr+2vbIkh9C94ueIdmGEGmlSEUHVktEIuFRYGxznfyNC05Hj80Ra6mIMV1gTERdaf2cp4xFBJB6oOKT2eCWMHSw1m4uiwlI+5+51Z3mreyOizSxGtk18DFnQdRfENX1c3Sb06b2ivdubvRDWKeGNVX5M7tmKrIWRttwGPg7Fd/6yePVPjH5Iu0DpJUzICvUYzc044edGfW6YaVVjSZxixXT8f+3cGAsmDl7D+6+3IPL9iSCgFfWSJI5YQD2JJP/lxuk5nHFSG0v+aH32/3EvHpAr1LDqFHyXQEzPB8FYXUwrF3oM6LYUA2PI8IY9qVxsC6GZ+vUlJX8sim+TRO1GMICaBuX05P9I4s6zMHOfLi6gICSs5GRGTQDRoAgUqX+LyorgcOxRIHIA51561B8LDd+HZ3tmRcdiSYrBzSUcM/AdRMkpIc2v0QtPa73vmSKr5JB609/9LcFup/tzbiym1R4/ZLpOjkTZjfQPFAmGOyblekIGNrMvYuHsLQM2FxvdPWB/t/yXSrGQf9CaJ2t7z7Hdqa/TEis+3hWPsWSdgvv
X-Mailman-Approved-At: Tue, 28 Oct 2025 08:28:06 +0000
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

From 931f0f259c881c892e78df75a7bcd1263a838d5b Mon Sep 17 00:00:00 2001
From: Zoe Gates <zoe@zeocities.dev>
Date: Mon, 27 Oct 2025 22:15:11 -0500
Subject: [PATCH 3/3] drm/plane: Correct typo in update_plane docs

Fix the kernel-doc spelling so the update_plane parameter description
uses the proper wording.

Signed-off-by: Zoe Gates <zoe@zeocities.dev>
---
 include/drm/drm_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 01479dd94e76..90006a811d57 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -295,7 +295,7 @@ struct drm_plane_funcs {
 	 *
 	 * This is the legacy entry point to enable and configure the
plane for
 	 * the given CRTC and framebuffer. It is never called to
disable the
-	 * plane, i.e. the passed-in crtc and fb paramters are never
NULL.
+	 * plane, i.e. the passed-in crtc and fb parameters are never
NULL.
 	 *
 	 * The source rectangle in frame buffer memory coordinates is
given by
 	 * the src_x, src_y, src_w and src_h parameters (as 16.16
fixed point
--=20
2.51.1

