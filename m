Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP5RB3pscGkVXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 07:04:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8651D9E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 07:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C9F10E6BA;
	Wed, 21 Jan 2026 06:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="EDJQPYX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A25710E6D5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 06:04:36 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c2a9a9b43b1so3999122a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1768975476; x=1769580276; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zir/Yvt/q2Fa+4Rx3LSfNYyBmPMgYkH8Fc8/IPJBS14=;
 b=EDJQPYX1u/kxJnnHX0DbgY6/prHlYHGVvXnbs008Z28IwHHN/EgaeEvnWOLH0TKWJ9
 TCjXyrxC2YxrlS+3GaYh3LiJ8u3ELPjXHpIJIMHJm5d3XG3nQPRzLmwnWuz/u1BjZ8hM
 u/QjN+9BAILHvK+Pwuwgm9i4mbKa1FZa0zoClO60cYwdHanIwhdmYfkwe+wpbrsbKi3r
 1B86B+BNdrBq/t/WSih0fjHCpQkxXWty1vRbURGPRYFykYL4DAy1e0Pw52+/YdvAs+5K
 FtBpqw0TPbAdaWVscaz1Gy1P3hAzLOeAmfVi7fcEgWg6yRNSRQGxXhy3ghRSWRojpUCr
 GPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768975476; x=1769580276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zir/Yvt/q2Fa+4Rx3LSfNYyBmPMgYkH8Fc8/IPJBS14=;
 b=IOmQ5wALBFUsvnUXJ2NT15BRzETKPuKxeQTaVDIbXUex0DB+6RqceGJKqELdHzpv2K
 cSWbTqqTu+IVQpGHff/LX/xPs9/ZKjmD+F5ZxNKGkeh5+hKdK4AKwNcz5UI4bSVWZZQJ
 McpaHOWCV8+nHuwug2U5D5WzBsMDQaIlXyuazIfHFEhRRSZDE60gYudHTjHdvOL+S53V
 4MdDt3g5VJqva3LPP60KUenUBtsY52CZQ6joIO3WQmHNzWB3mZOgurCsRc/5wD9jsyor
 Xuk0JLedbIulzucfXyXQ0FA6NiGtsXng4kvcbQEFNNUiSEka6HjcpSVTzO1dhR07YPW4
 XAIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5xrhz1XQuKaulMehB8bAYyuWsTAkro1eLTMdcQlyG8du4qipQXSRoysXLskKsEXx7O+mw2aQeeKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLY8/o7wD9fozy0+Rf+G2tBTvHZEErAkVNk8ZwonloMXrf4yqi
 Rhwx6cQ30YkOtjnxPa8OyVvCXR765Qkv6R38Yby+kBy2NOcpo6MYljGSRdrU1j1Wv0s=
X-Gm-Gg: AZuq6aLktMpM2n8xnEEXHBcKQ00g4uzru+s/5aZql1WdlFQ1E82QUEnlEHI2FNPPbII
 UlYTXe5hMEKHmdqejHV1tGHMaZKZBjcDsbn5Fm43a10iQWvQx4BuMxndBNllCQeB9cSPsnDMIgo
 0rQwwznu36qaZWwUgF0ojPN33N+t403GcBW8aXWxSzuIUoriaJFhcdMtx6Wk9RJl60Mv7lWnOGe
 ZuCbW3/74mTA1MZum9EzMsAGtxgini6y4RxV+j0hL9gyZyq/YpSRyYTG+s1u5ZEzl46vbAPZi7a
 ErMMrdbgSJmINVldj4iUAR6+t4ls0yQSCJsyBFijRyVN5pXcx3Z9zde8EuR+eX925yRtV4/CubR
 mb3/NlsQmB1NM7j3q56xpsyJGN0q0FxHyvgZIT2Az34zDcEOxTvEXBTCyQohRZLHicih+XinSi9
 lk6N1BtL+vpEnKSqkN9P4fpz3QuTjm+y6etkC1afBxTtMML8jTj3UEOk5vF7yWEJlqZbIjhOYXw
 5UTDSSngPb0rSjevoT0SCvS
X-Received: by 2002:a17:90b:4984:b0:32b:623d:ee91 with SMTP id
 98e67ed59e1d1-3527327443fmr12710327a91.27.1768975476399; 
 Tue, 20 Jan 2026 22:04:36 -0800 (PST)
Received: from terryhsiao-Latitude-5490.. (61-219-175-100.hinet-ip.hinet.net.
 [61.219.175.100]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3527310210fsm7074628a91.9.2026.01.20.22.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 22:04:35 -0800 (PST)
From: "terry_hsiao@compal.corp-partner.google.com"
 <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 "terry_hsiao@compal.corp-partner.google.com"
 <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v2] drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)
Date: Wed, 21 Jan 2026 14:04:28 +0800
Message-Id: <20260121060428.5602-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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
X-Spamd-Result: default: False [3.69 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	FROM_DN_EQ_ADDR(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[compal-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:terry_hsiao@compal.corp-partner.google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,compal.corp-partner.google.com];
	DKIM_TRACE(0.00)[compal-corp-partner-google-com.20230601.gappssmtp.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[terry_hsiao@compal.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[terry_hsiao@compal.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US]
X-Rspamd-Queue-Id: 78A8651D9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the AUO - B116XAT04.1 (HW: 1A) panel.
This panel is used on MT8186 Chromebooks

The raw EDID:
00 ff ff ff ff ff ff 00 06 af ba 89 00 00 00 00
0c 23 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 21

Signed-off-by: terry_hsiao@compal.corp-partner.google.com <terry_hsiao@compal.corp-partner.google.com>
---
Changes from v1 to v2
- Added missing Signed-off-by tag
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 679f4af5246d..108569490ed5 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x89ba, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e50, "B140UAN08.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
-- 
2.34.1

