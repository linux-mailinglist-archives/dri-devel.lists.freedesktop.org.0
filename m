Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBJRLpDKj2nMTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660513A6DD
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CA710E85C;
	Sat, 14 Feb 2026 01:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ngx3TUb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B5B10E85C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:06:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0672261330;
 Sat, 14 Feb 2026 01:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30FAC19425;
 Sat, 14 Feb 2026 01:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031179;
 bh=fsFvBqud3Tvk5e7OR8HtRWBc2tx6+MNclWALLq3iwLw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ngx3TUb7GpPfBnAjMctLd9eudS5iwLA4kOGo93Cf67eAxdzCBQC6F8kumnM7GgPoo
 tajBSVNhnEE/fjubEKnC/fUcsjLw8jT+P3qiowZ3zAji+gozjJmnwVpRscxpqoF3l3
 IHwcMuJQ5zh0vQkQb954WTyHLjE4UIlbQOHTRm9DOjgYbQgW1XasGpc/zDMFUrdI3v
 NisSeUsKhOvq10tbOb5Li4ZuCpo5npsMInMeXJyVlXfEB/ediv+q1kmfyl8XLI9bi1
 YDDCFnqW6wyd3hLspaHRJjVTPS8dL/VGm9goID+rSAa0wt+B412kpY9BcCA+PGKzyb
 IPYXfAmLVf1qQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Sasha Levin <sashal@kernel.org>,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.19-6.12] gpu/panel-edp: add AUO panel entry for
 B140HAN06.4
Date: Fri, 13 Feb 2026 19:59:32 -0500
Message-ID: <20260214010245.3671907-92-sashal@kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:alexey.klimov@linaro.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:dianders@chromium.org,m:sashal@kernel.org,m:neil.armstrong@linaro.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 3660513A6DD
X-Rspamd-Action: no action

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit 2976aeb0de77da599ad37691963efbdcb07435ce ]

Add an eDP panel entry for AUO B140HAN06.4 that is also used in
some variants of Lenovo Flex 5G with Qcom SC8180 SoC.

The raw edid of the panel is:

00 ff ff ff ff ff ff 00 06 af 3d 64 00 00 00 00
2b 1d 01 04 a5 1f 11 78 03 b8 1a a6 54 4a 9b 26
0e 52 55 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
3e 00 35 ae 10 00 00 18 10 2c 80 b8 70 38 24 40
10 10 3e 00 35 ae 10 00 00 18 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 48 41 4e 30 36 2e 34 20 0a 00 eb

I do not have access to the datasheet and but it is tested on above
mentioned laptop for a few weeks and seems to work just fine with
timing info of similar panels.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://patch.msgid.link/20251203074555.690613-1-alexey.klimov@linaro.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

This is the key section. Now I have a complete understanding. Let me
summarize the analysis.

## Detailed Analysis

### 1. Commit Message Analysis

The commit adds a new panel entry (`EDP_PANEL_ENTRY`) for AUO
B140HAN06.4 (panel ID `0x643d`) to the `panel-edp.c` driver's
`edp_panels[]` lookup table. The panel is used in the Lenovo Flex 5G
with a Qualcomm SC8180 SoC. The commit has been reviewed by Douglas
Anderson (the panel-edp subsystem maintainer), and the author confirms
it has been tested on real hardware for several weeks.

### 2. Code Change Analysis

The change is a **single line addition**:

```c
EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50,
"B140HAN06.4"),
```

This adds the panel ID `0x643d` to the sorted list of known AUO panels,
using the standard `delay_200_500_e50` delay timing (200ms HPD absent,
500ms unprepare, 50ms enable) -- a delay structure already heavily used
by dozens of other AUO panel entries. The entry is inserted in the
correct sorted position between `0x639c` and `0x723c`.

### 3. What happens WITHOUT this entry

Looking at lines 805-825 of `panel-edp.c`, when `find_edp_panel()` fails
to match a panel in the `edp_panels[]` table:

1. **`WARN_ON(!panel->detected_panel)` fires** (line 814) -- this
   produces a **kernel WARNING stack trace** in dmesg every time the
   system boots with this panel. This is a user-visible issue.
2. **Conservative timings are used** (line 818):
   `panel_edp_set_conservative_timings()` sets a 2000ms unprepare delay
   and 200ms enable delay (lines 753-754) instead of the optimal
   500ms/50ms. This makes panel operations **significantly slower** for
   users.
3. **`detected_panel` is set to `ERR_PTR(-EINVAL)`** (line 756), which
   may affect other downstream behaviors.

So without this entry, users with a Lenovo Flex 5G see a WARN_ON kernel
splat on every boot and get suboptimal display performance.

### 4. Historical Context

The B140HAN06.4 panel was originally added to `panel-simple.c` in commit
`93ea7aa8dfc0c` (v5.15-era). During the split to `panel-edp.c` in commit
`5f04e7ce392db` (v5.16-rc1), it was moved. However, it was then
**removed** in commit `51e1fb144f17c` ("drm/panel-edp: drop several
legacy panels", merged in v6.11-rc1) because the legacy compatible
string approach was dropped in favor of the generic "edp-panel" device
on the AUX bus. After that removal, the panel no longer had an entry in
the `edp_panels[]` ID table, meaning the AUX bus approach can't find it
by panel ID. This new commit restores support through the modern
mechanism.

### 5. Classification: Device ID / Hardware Quirk Addition

This is a textbook **device ID addition** to an existing driver -- one
of the explicitly allowed exception categories for stable backports. The
`edp_panels[]` table is directly analogous to PCI ID tables or USB ID
tables. The commit:

- Adds a single panel ID to an existing, well-established table
- Uses existing delay parameters (`delay_200_500_e50`) -- no new code
- Follows the exact same pattern as ~192 other entries in the table
- The driver (`panel-edp.c`) already exists in stable trees (since
  v5.16)

### 6. Risk Assessment

- **Risk: Essentially zero.** This is a one-line addition to a data
  table. It cannot affect any other panel or any other code path. It
  only activates when a panel with the exact matching EDID
  vendor/product ID is detected.
- **Scope:** Single line, single file, data-only change.
- **Dependencies:** None. The `delay_200_500_e50` structure and
  `EDP_PANEL_ENTRY` macro exist in all stable trees that have `panel-
  edp.c`.

### 7. User Impact

- **Who:** Users of the Lenovo Flex 5G laptop (Qualcomm SC8180 SoC
  platform). This is a real, commercially available product.
- **Without fix:** Kernel WARNING on every boot + slower panel
  operations due to conservative timings.
- **With fix:** Clean boot, optimal panel timing, proper panel
  identification.

### 8. Backport Considerations

- For stable trees **v6.11.y and later**: The legacy `panel-simple.c`
  entry was removed in v6.11-rc1, so the panel-edp entry is essential.
- For stable trees **v5.16.y to v6.10.y**: The panel was supported
  through the legacy `panel-simple.c` compatible string, so the AUX bus
  lookup wasn't needed. Whether this entry is needed depends on whether
  the DT uses the legacy compatible or the generic `edp-panel` approach.
- The commit should apply cleanly to v6.11+ stable trees (the table
  structure is the same).

### 9. Stability Indicators

- **Reviewed-by: Douglas Anderson** -- the panel-edp subsystem
  maintainer
- Tested on real hardware for weeks
- Standard, well-understood change pattern

### Conclusion

This is a clear-cut device ID addition to an existing driver's panel
identification table. It fixes a real user-visible issue (WARN_ON kernel
splat on boot + degraded panel timings) for users of a specific laptop
model. The change is a single line of data, uses existing
infrastructure, carries essentially zero regression risk, and has been
reviewed by the subsystem maintainer. It fits perfectly into the "new
device IDs to existing drivers" exception category for stable backports.

**YES**

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 023fbbb10eb4f..2c35970377431 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1904,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140HAN06.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.51.0

