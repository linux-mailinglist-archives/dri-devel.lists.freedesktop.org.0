Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOApGr/Kj2nMTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:07:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F113A76F
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313E310E861;
	Sat, 14 Feb 2026 01:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nt0WhKvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219AF10E861
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:07:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E3A8A42A6B;
 Sat, 14 Feb 2026 01:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11138C16AAE;
 Sat, 14 Feb 2026 01:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031227;
 bh=AtmoDHtKVA/a36YmCk0Y1gR4wMQO6mPNCvwwKHIREbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nt0WhKvK+XJDBzy5YhDczT/GlQ3/OKbujMoCr8uZYc9tfB1RgJ9BskuNEn1ejSGTP
 sjNuIfYtHnccjMg1Tmy8j/0DgJUDqP0TQn4VyjF6v2qa8+47tmLNBDlMQhRrEcTxtU
 VvlwJGxRm1LpmnGobHshBP8hogeQY6z/vZ5Xgqc8Cyluz014HUsOmzSLBvzcnxmeDz
 23VN9SFkuS6+YeqgBIKR9AS8uS4GHxzQjZaP9gJQI4i5OqT2bvBHXq2U9h2rPXrLNI
 nCb0cUxoAjwnMLiDFAHai+MaJjmQF3aGp3IcFvWe6chdTAezYG8sx/1Fw5t4PqwNXY
 OmitCspLn/q9Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, Sasha Levin <sashal@kernel.org>,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.19-6.18] drm/panel: edp: add BOE NV140WUM-T08 panel
Date: Fri, 13 Feb 2026 19:59:52 -0500
Message-ID: <20260214010245.3671907-112-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:dianders@chromium.org,m:sashal@kernel.org,m:neil.armstrong@linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,chromium.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: D68F113A76F
X-Rspamd-Action: no action

From: Hans de Goede <johannes.goede@oss.qualcomm.com>

[ Upstream commit 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b ]

Add powerseq timing info for the BOE NV140WUM-T08 panel used on Lenovo
Thinkpad T14s gen 6 (Snapdragon X1 Elite) laptops.

edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 26 0c 00 00 00 00
0a 21 01 04 a5 1e 13 78 03 d6 62 99 5e 5a 8e 27
25 53 58 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 57 55 4d 2d 54 30 38 0a 00 fa

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://patch.msgid.link/20260105155134.83266-1-johannes.goede@oss.qualcomm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a complete picture. Here's my detailed analysis:

## Commit Analysis: drm/panel: edp: add BOE NV140WUM-T08 panel

### 1. COMMIT MESSAGE ANALYSIS

The commit adds power sequencing timing information for the BOE
NV140WUM-T08 eDP panel, which is used in the **Lenovo ThinkPad T14s gen
6 (Snapdragon X1 Elite)**. The message includes the full EDID hex dump,
which is the standard practice for new panel entries. The commit was
authored by Hans de Goede (a very well-known and prolific kernel
developer, especially for laptop hardware) and reviewed by Douglas
Anderson (the `panel-edp.c` maintainer).

### 2. CODE CHANGE ANALYSIS

The diff introduces exactly two additions:

**a) New `panel_delay` struct** (`delay_200_500_p2e200`):
```c
static const struct panel_delay delay_200_500_p2e200 = {
        .hpd_absent = 200,
        .unprepare = 500,
        .prepare_to_enable = 200,
};
```
This is a new timing combination: `hpd_absent=200`, `unprepare=500`,
`prepare_to_enable=200`. It follows the exact naming convention of
existing structs. There are already similar ones like
`delay_200_500_p2e80` (prepare_to_enable=80) and `delay_200_500_p2e100`
(prepare_to_enable=100). The existing `delay_200_500_e50_d50_p2e200`
also has `prepare_to_enable=200` but includes `enable=50` and
`disable=50` fields that this panel doesn't need.

**b) New `EDP_PANEL_ENTRY`**:
```c
EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200,
"NV140WUM-T08"),
```
This adds the panel's EDID product code (0x0c26) to the sorted table of
BOE panels, with the correct timing struct. The entry is placed in the
correct sorted order between 0x0c20 and 0x0c93.

### 3. CLASSIFICATION

This is squarely in the **"NEW DEVICE IDs"** exception category for
stable backporting. It adds a panel identification entry and associated
timing data to an existing, well-established driver (`panel-edp.c`). It
does **not** add a new feature, API, or behavior change. It simply
ensures that when the kernel encounters this specific panel's EDID, it
knows the correct power sequencing timings.

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed**: ~7 lines of pure `const` data additions
- **Files touched**: 1 (`drivers/gpu/drm/panel/panel-edp.c`)
- **Risk**: Essentially **zero**. Both additions are `const` data that
  only take effect when the kernel matches the exact EDID panel ID
  0x0c26 from a BOE vendor. No existing code paths are modified. No
  existing panel entries are changed. Systems without this panel are
  completely unaffected.
- **Subsystem maturity**: The `panel-edp.c` driver has been present
  since v5.16 (September 2021) and exists in all currently maintained
  stable trees (6.1.y, 6.6.y, 6.12.y).

### 5. USER IMPACT

- **Who is affected**: Owners of the Lenovo ThinkPad T14s gen 6
  (Snapdragon X1 Elite) laptops. This is a current, widely-available
  business laptop.
- **Without this fix**: The panel either won't be recognized (falling
  back to generic timing which may cause display flickering, blank
  screen on boot, or other initialization issues) or the display may not
  work correctly at all.
- **Severity**: Display not working properly on a shipping laptop model
  is a high-impact user-facing issue.

### 6. STABILITY INDICATORS

- **Author**: Hans de Goede — extremely well-known kernel developer,
  Qualcomm contributor, known for laptop hardware enablement
- **Reviewer**: Douglas Anderson — the maintainer of panel-edp.c, who
  also committed the patch
- **Pattern**: This is identical in structure to dozens of other panel
  additions that are routinely backported to stable (the git log shows
  20 similar commits just recently)

### 7. DEPENDENCY CHECK

- **No dependencies**: The commit is entirely self-contained. It adds
  new `const` data and references only existing infrastructure (`struct
  panel_delay`, `EDP_PANEL_ENTRY` macro).
- **Clean backport**: The patch should apply cleanly to any stable tree
  that has `panel-edp.c`, with at worst minor context adjustments for
  differing surrounding panel entries (which is trivially resolvable).

### Conclusion

This is a textbook example of a panel ID / device data addition to an
existing driver — one of the explicitly enumerated exceptions that
qualifies for stable backporting. It adds timing data for a display
panel used in a currently shipping Lenovo ThinkPad model. The change is:
- Purely `const` data (zero runtime risk to other systems)
- Self-contained (no dependencies)
- Written by a trusted author and reviewed by the subsystem maintainer
- Identical in pattern to hundreds of previously backported panel
  entries
- Fixes a real user-facing issue (display functionality on a current
  laptop)

**YES**

 drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 85dd3f4cb8e1c..679f4af5246d8 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1730,6 +1730,12 @@ static const struct panel_delay delay_200_500_p2e100 = {
 	.prepare_to_enable = 100,
 };
 
+static const struct panel_delay delay_200_500_p2e200 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_200_500_e50 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -1977,6 +1983,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
-- 
2.51.0

