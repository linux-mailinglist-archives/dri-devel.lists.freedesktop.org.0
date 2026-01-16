Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BDD38D69
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 10:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EB810E061;
	Sat, 17 Jan 2026 09:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=quihel.net header.i=@quihel.net header.b="DznRSbDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4779 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jan 2026 20:21:44 UTC
Received: from outbound.ci.icloud.com (ci-2004f-snip4-7.eps.apple.com
 [57.103.89.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAAB10E92C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:21:44 +0000 (UTC)
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-central-1k-100-percent-6 (Postfix) with ESMTPS id
 8D68918011D9; Fri, 16 Jan 2026 19:02:02 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quihel.net; s=sig1;
 bh=FBxdHnJCK2ejuMypaTl09JxukHKuI4PGMqQOsqdXEFs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=DznRSbDay7Y+Clgy+9Mxaa+4y5m4h0b1Ieq6W89slI7gjFWrz7oIQvwi+Z4U613rXa43DnU8auhGINBVoM/mMTtSSrqHK7/6mvrDeU8JbNIpQNbO+/MJ5NEnIdFEdUo0E6HnpNp9COZ5z7/LK4GqM7Jure40QlzblQWYCy91RFNCZshNwq4pcjU6GnAZ92G47KZbDYT0Ty7CcCF32/KTmyzAHiXvMwDO0ghibgnVfYQATpNwc+MmLDLGCT/jz/ovllwaIUJF1De07RT32k4xeOE6YyyO1I0yy0BjIg7gKLJl8vmUiqDKsreNMNnMZeamQQ/pSFwO6thM1gBhwPgd+A==
mail-alias-created-date: 1318565135000
Received: from thinkbook16.fritz.box (unknown [17.57.156.36])
 by p00-icloudmta-asmtp-us-central-1k-100-percent-6 (Postfix) with ESMTPSA id
 3AE6918019EB; Fri, 16 Jan 2026 19:02:00 +0000 (UTC)
From: Alejandro Quintanar <alejandro@quihel.net>
To: dri-devel@lists.freedesktop.org
Cc: dianders@chromium.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch,
 Alejandro Quintanar <alejandro@quihel.net>
Subject: [PATCH] drm/panel: panel-edp: Add Tianma TL160ADMP17
Date: Fri, 16 Jan 2026 19:59:35 +0100
Message-ID: <20260116185936.25283-1-alejandro@quihel.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info: v=2.4 cv=AM3e4JrT c=1 sm=1 tr=0 ts=696a8b2b
 cx=c_apl:c_apl_out:c_pps a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CIKbnwSMAAAA:8 a=qQTrVw4DbPXDt4VSsqwA:9 a=WAq3Gk0LTMTrdeoBeQ09:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0MSBTYWx0ZWRfX9ZPsqY43PYdv
 uu0TSxOH5PiZVobPvli3uoyGhVTasJhi5N8ZTDlai3Mbig6Gb+nbD3pYVq2O+iWUe4+2FUHCyF3
 fgjGcY5+61eE0a1IZQErXUVB96qdhP3R80ZmS8xbxw01CkzLz8gt12Vezq35HMJOqNlAcV8Tss9
 KKPm7YQUzd6UBRtHo7/MGkydyOMZSGYXgUXkqKbMu4Z4rvT8QKQUJuHSARnnR9eSm+CU6fJJg6F
 U+yFs/7pYicCtshyzQaUhcGfTeg3UFBoDe5TXxuiGq6BoLknQjn28iArPUqtb9t49XOCRu7b+Qp
 kE11RGHU1473kN6AV3y
X-Proofpoint-GUID: LJoKuCnI8zCWx6HAb7GHKMUeYuHbGFhg
X-Proofpoint-ORIG-GUID: LJoKuCnI8zCWx6HAb7GHKMUeYuHbGFhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1030 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2601160141
X-JNJ: AAAAAAABfcsPPsC28R5h8w1VMgzGZ8hwiQduGCLdETgf3zTGhm+/yruA19lilEFyz9I5SCxxx07R7/7pV5GaObEyEy0p9JFUr5MzTxdAq1/g6kdYTORIXhIqVI9TqftvFM10QSCmB+0wcHPSwuHYo7ABAdAZTmqOnDldNe3rgeuA4JLNjt1sw5ezxqg8wtR9abgGztUTlcV175AsfELTQEJ64cteCX2q//00qW46o5OaZaGBuIWYw7qn/rd0EqhmylP3Hw1GCiPl9Q35dSGo8fbUBwef8+tBrqszmjwx12u0cKZ6GfcuNLvj2Bh5UDeaSG+m2o90PwS2QH/SZLxmQfBa3imHrXzT09qxapVHixPsrevIzXS/QZVcruihfOdoD2gbrd/rhX80o7TQzt2Sa/YRqRQDNBAO8W7Org4UL6fgJf3qlFPjq03nMSrpxBIi/HyPp+womvdL8Dpyj01zE1wzEfOSdIYo73Fb7ZSUSUF02nkgcu/KWjAg0HiqjMaO2f+EZkQFHf0/nKa45w+NkubAwi9oWZTJXdUmXWzOgY4kW0lZhKpDQTai3GTgbby/3clwEm35IltUYf8yC4vqyKxNfaJSQENQ7uVAL+9rtOVCjRSF2sB6Ye3CJeM0iGwbfI4pviEwXW5Nv7fsUDcDnGvnv3DgzLwFzmLs3jnOqO49S6LiFrz/Cn+iR8msUpE0HummVG4VPq2up6s8mbSc3ZSGsJ7Y5G2V/A==
X-Mailman-Approved-At: Sat, 17 Jan 2026 09:39:27 +0000
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

Add support for the Tianma TL160ADMP17 panel (EDID manufacturer ID 'TMA',
product ID 0x2033). This is a 16" 2560x1600 panel with 60Hz/120Hz refresh
rates found in the Lenovo ThinkBook 16 Gen 7 (21NH).

Without this entry, the panel-edp driver prints:
  "Unknown panel TMA 0x2033, using conservative timings"

Signed-off-by: Alejandro Quintanar <alejandro@quihel.net>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b89489..d3dffbfee 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2084,6 +2084,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
 	EDP_PANEL_ENTRY('T', 'M', 'A', 0x0811, &delay_200_500_e80_d50, "TM140VDXP01-04"),
+	EDP_PANEL_ENTRY('T', 'M', 'A', 0x2033, &delay_200_500_e50, "TL160ADMP17"),
 	EDP_PANEL_ENTRY('T', 'M', 'A', 0x2094, &delay_200_500_e50_d100, "TL140VDMS03-01"),
 
 	{ /* sentinal */ }
-- 
2.51.0

