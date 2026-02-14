Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NneNLDKj2nMTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6BA13A73A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9895910E860;
	Sat, 14 Feb 2026 01:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nY+Kx0cA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C0710E85F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:06:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C60460054;
 Sat, 14 Feb 2026 01:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F85C16AAE;
 Sat, 14 Feb 2026 01:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031210;
 bh=IDD3DAK4VPVwQIYH1EtoSuTGGiyhKcoUDZYGTxl0HnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nY+Kx0cAx5e582wKL2b05L8UU2Ia1JqXBRmNt7QhPNvV0DJP3mFSBmbKD/DlHhomh
 RmaZEKX9ZUUFCurvvOqCmGCkhiRJ+lzUiS+iwvElw9vZgIUDnCbY0B8BsEvDo4pMTs
 C1bQdFfGAH3iZfTosNs9GVSsKej/44oUrUGIOJBqXV2SxnKX39G23+45lia6YRjb7B
 Xln6kNDIKo+G8mzx7P7goAbBq62T2Nfu7kiqchXRAwPQjTE0OWuPicYu+BuKPn7rid
 YrFfNZEuohsJNMMHkCZXeDEPtihKsshmbtCQE0P7qGueV94Hyd0NpaKSM/eu7UQGjl
 nxnKQRpWEuidg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, Sasha Levin <sashal@kernel.org>,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.19] drm/panel-edp: Add CSW MNE007QB3-1
Date: Fri, 13 Feb 2026 19:59:44 -0500
Message-ID: <20260214010245.3671907-104-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:yelangyan@huaqin.corp-partner.google.com,m:dianders@chromium.org,m:sashal@kernel.org,m:neil.armstrong@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,chromium.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6A6BA13A73A
X-Rspamd-Action: no action

From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>

[ Upstream commit b1ea3babb67dcb8b0881c2ab49dfba88b1445856 ]

Add support for the CSW MNE007QB3-1, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 0e 77 7c 14 00 00 00 00
00 23 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
36 00 2d bc 10 00 00 18 2b 30 80 a0 70 b0 23 40
30 20 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28
3c 4a 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 42 33 2d 31 0a 20 01 5b

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
00 3d 8a 54 cd a4 99 66 62 0f 02 45 54 40 5e 40
5e 00 44 12 78 2e 00 06 00 44 40 5e 40 5e 81 00
20 74 1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c
00 00 00 00 8d 00 e3 05 04 00 e6 06 01 00 60 60
ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 68 90

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://patch.msgid.link/20251127121601.1608379-1-yelangyan@huaqin.corp-partner.google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

All the analysis is complete. Here is my detailed assessment:

---

## Analysis: drm/panel-edp: Add CSW MNE007QB3-1

### 1. Commit Message Analysis

The commit adds support for a new revision of the CSW MNE007QB3-1 eDP
panel. The EDID data is included for reference. The panel name
"MNE007QB3-1" already exists in the driver with product ID 0x146e (added
in commit 490b30fbaca2a), but this adds a *new variant* of the same
panel identified by product ID 0x147c with different timing
requirements. The author is from Huaqin (a major Chromebook ODM), and
the commit was reviewed/applied by Douglas Anderson (the `panel-edp`
subsystem maintainer).

### 2. Code Change Analysis

The change is a **single line addition**:

```c
EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100,
"MNE007QB3-1"),
```

This adds a new entry to the `edp_panels[]` table, which is a static
lookup table mapping EDID panel IDs to timing delay parameters. The new
entry:
- Vendor: CSW ('C', 'S', 'W')
- Product ID: 0x147c (distinct from the existing 0x146e)
- Delay: `delay_200_500_e50_d100` (hpd_absent=200ms, unprepare=500ms,
  enable=50ms, disable=100ms)
- Name: "MNE007QB3-1"

The delay structure `delay_200_500_e50_d100` already exists in the
source (line 1839-1844) and is used by other panels (MNB601LS1-4,
TL140VDMS03-01). No new code, structures, or functionality is added.

### 3. Classification: New Device ID

This falls squarely into the **"New Device IDs"** exception category for
stable backports. The `panel-edp.c` driver is a well-established driver
that uses a table-driven approach to match eDP panels by their EDID
identifiers and apply the correct power sequencing timings. Adding a new
entry to this table is functionally equivalent to adding a new PCI/USB
device ID to an existing driver.

Without this entry, a device using this specific panel revision (EDID
product ID 0x147c) would not have proper power sequencing timings. This
can result in:
- Display initialization failures
- Screen flickering or artifacts
- Panel damage from incorrect power sequencing
- The panel being treated as unknown and potentially not working at all

### 4. Scope and Risk Assessment

- **Lines changed**: 1 (one line added)
- **Files touched**: 1 (`drivers/gpu/drm/panel/panel-edp.c`)
- **Complexity**: Trivially low
- **Risk of regression**: Effectively zero. The new entry is a static
  table addition matched only by a specific panel ID (0x147c). It cannot
  affect any existing panel or any other code path. The delay structure
  it references already exists and is used by other panels.
- **Dependencies**: None. The `EDP_PANEL_ENTRY` macro and
  `delay_200_500_e50_d100` structure exist in all recent stable kernels
  that have the panel-edp driver.

### 5. User Impact

This panel is used in Chromebooks (the commit comes from Huaqin, a
Chromebook manufacturer, with the `corp-partner.google.com` email
address). Chromebooks frequently use stable/LTS kernels (especially
ChromeOS). Without this backport, Chromebooks using this specific panel
revision would have display issues. This is a **real hardware
enablement** issue for production devices.

### 6. Stability Indicators

- Applied by Douglas Anderson (`dianders@chromium.org`), the well-known
  panel-edp maintainer
- The pattern is identical to dozens of other panel additions that are
  routinely backported
- The referenced delay structure has been in the kernel for a long time
- Zero risk of runtime regression

### 7. Dependency Check

No dependencies. The commit is completely self-contained. The
`delay_200_500_e50_d100` structure and the `EDP_PANEL_ENTRY` macro exist
in all stable kernels that have this driver.

### Conclusion

This is a textbook example of a stable-appropriate device ID addition.
It is a single-line, zero-risk table entry that enables a specific
hardware panel variant used in production Chromebook devices. The driver
already exists in stable, the delay structure already exists, and the
change cannot affect any other hardware. It meets all stable kernel
criteria: obviously correct, fixes a real issue (hardware not working),
small and contained, no new features.

**YES**

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad7..023fbbb10eb4f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2033,6 +2033,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE007QS5-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE007QB2-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100, "MNE007QB3-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1519, &delay_200_500_e80_d50, "MNF601BS1-3"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
-- 
2.51.0

