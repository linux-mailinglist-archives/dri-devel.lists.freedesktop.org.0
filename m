Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GE8MtA3qWlk3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:59:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D520D0B9
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863DA10E21E;
	Thu,  5 Mar 2026 07:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inGPyAKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4B310E21F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 07:59:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-439aeed8a5bso4791857f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 23:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772697546; x=1773302346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=up1Dq1xg6gmNuKxcZqGmFJ9w/LNCPKzJ4m3SQCOPg0U=;
 b=inGPyAKP5xxRdV1I9NHGRIr9zbgxx1ooUmYHx9Bl+wEWG2BmMvMEJmnTKwJ1yjJKI0
 Gi4bsOP5gLxjmZ2gvFcAHL/nTEcBo4NUyJgJ/6CLPsSFTJdZoGIJXM0z8pTMegRO/1zO
 QP4y+rpO7W/gdfu2q+SsSnH48wBKkDHIFcBjWQlruiYlotV200Y6HhSh38dgCuE614xO
 95i4bFlzRXQEwVaYUqcezy4bsr4mIu4tqwQdHDuMKqxH3Y+nB0puDC/VU/A2X4pRFkum
 zk9e7Ff0COm34b6ZBQZjdNE8PJD4Hy+Cx89ObyvVb1zMbQ4pJlUEZgD56z3Qq6Qkf86q
 OhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772697546; x=1773302346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=up1Dq1xg6gmNuKxcZqGmFJ9w/LNCPKzJ4m3SQCOPg0U=;
 b=WaTYTBLKj8/E4PBOXvbSZ/N6HFbk0PIxWc43iZMLx1Ok8zGRWykQUydKsYy92eWiXk
 vrMDlAgLIbgGePybhn3ouP1StrnEFA7ReyO0yCQNu7RJHuvqHCEZ1jg99rbynimGAqyb
 rwjPTFNWdLnZq7DX+wZClPpnfPH4b3pqf+ua0lhguCwFJoENJLGTrtH4FRw6pFpF97M9
 qGacRuLJocW9hid7Q1753xAr52YArAgefqNEFU3B2SnQjsJlepthckt6EqTcKmCX31LN
 5K/LBRL+KhKLLppodW4ujVwE38erWlvS0JFPq6Y2jV1UB1GWaL5AQhJxRdMN47kYop/m
 TY0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBD+LaEtL/1/hzM/oK9GF7qOxiEMKlBi/B0oQvJANVkQ71R8snsUjOM5KW1iq2kfTOqVHEkZdW5yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaLInfiewKstL+PrmmlD7oo+a6AzENn0XgnI2bmS7bsEbHgdJh
 ais8Wd1TfVjw3Ktdvt1BY3gG42FG1K/ZptVwFexQpWuQR5a+i49ESxlp
X-Gm-Gg: ATEYQzzg568L3A239GNOFfLgd7Ia25CNWxydw4wzYdEfW269PtsFRx//feNsBnRgb2z
 Ki43K6s34rHfv7+YFgj3Aclpk9OnSMuAAqVerlF4aOfJiygU2+kwRtN6BFLEp23EDX/QhixTFvO
 rcBSla94/GaQ9ZblbLB8i1iZ1uXQw7LfffHUnNUTfG9Wxp/QvdzA+AupwfubQwGcti88sD4riKV
 8nOy71dGP6eiknG0kPlcU7ezamlV4fhSbrwC9JHlQ5zaW1wrhAsWsCVgk0RFcMJd8rYGCITGXlA
 vTf/ErLZlYO7NnBWBg33kIrAaOz5t+w1SCDMEsd8kSw2NzC5JGzmqnahZtyxbb28yBRBeVybs3w
 Xz6Iz2EZ2x3TDG2t+EG+bicg6OHoyCxmQ7tF24U8lWyWeaaYiT+BO9N1j2Sgi8z3qDW7radQXPw
 CZ4exSrQ==
X-Received: by 2002:a05:6000:2c0c:b0:439:905e:1236 with SMTP id
 ffacd0b85a97d-439c7f99afamr9065426f8f.2.1772697546064; 
 Wed, 04 Mar 2026 23:59:06 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b0549600sm34180087f8f.35.2026.03.04.23.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 23:59:05 -0800 (PST)
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/lnl+/tc: Fix false disconnect of active DP-alt TC
 port during long HPD pulse
Date: Thu,  5 Mar 2026 15:58:57 +0800
Message-ID: <20260305075857.40077-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 7A9D520D0B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_SENDER(0.00)[acelan.kao@canonical.com,dri-devel-bounces@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.969];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On platforms using XELPDP+ (Lunar Lake and later), tc_phy_hpd_live_status()
reads the PICAINTERRUPT_ISR register to determine DP-alt live status. The
XELPDP_DP_ALT_HOTPLUG_MASK bit in this register reflects the live HPD signal,
which deasserts (goes low) during a long HPD pulse from the sink.

When an LTTPR dongle (e.g. HP Type-C to HDMI, 03f0:8a4a) fires a long HPD
pulse after link training, intel_tc_port_connected() reads PICAINTERRUPT_ISR
and returns false even though the PHY is still owned and the link is active.
Since intel_tc_port_handles_hpd_glitches() returns true for TC dp-alt ports,
the 4ms glitch-filter retry loop in intel_digital_port_connected_locked() is
bypassed immediately, giving no protection against this transient deassertion.

The AUX abort logic then fires (-ENXIO), the hotplug handler marks DP-1 as
disconnected, and the compositor responds by disabling eDP-1, causing the
internal display to disappear.

Fix this by trusting the PHY ownership register
(XELPDP_PORT_BUF_CTL1 & XELPDP_TC_PHY_OWNERSHIP) over the transient HPD
live status in intel_tc_port_connected() when the port has an active link
(link_refcount > 0). The ownership register is stable and does not toggle
during HPD pulses.

The TC cold power domain is guaranteed to be held when link_refcount > 0,
as __intel_tc_port_lock() already asserts and verifies this via tc_phy_is_owned()
before we reach intel_tc_port_connected().

Without this fix, triggering mirror mode via hotkey on HP ZBook with HP Type-C
to HDMI dongle (03f0:8a4a) causes:

  [drm:intel_dp_hpd_pulse] got hpd irq on [ENCODER:270:DDI TC1/PHY TC1] - long
  [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (disconnected -> tbt-alt)
  [drm:intel_dp_hpd_pulse] got hpd irq on [ENCODER:270:DDI TC1/PHY TC1] - long
  [drm:intel_hotplug_detect_connector] [CONNECTOR:271:DP-1] status updated from connected to disconnected

With this fix, the port correctly stays in DP-alt mode:

  [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (dp-alt -> disconnected)
  [drm:intel_tc_port_update_mode] Port D/TC#1: TC port mode reset (disconnected -> dp-alt)

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index bd12148e42f70..0967cfc75f522 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1732,6 +1732,11 @@ bool intel_tc_port_connected(struct intel_encoder *encoder)
 	if (tc->mode != TC_PORT_DISCONNECTED)
 		mask = BIT(tc->mode);
 
+	if (tc->link_refcount > 0 &&
+	    tc->mode == TC_PORT_DP_ALT &&
+	    tc_phy_is_owned(tc))
+		return true;
+
 	return tc_phy_hpd_live_status(tc) & mask;
 }
 
-- 
2.51.0

