Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNIPAHkSlGk1/wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:02:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7014917E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEC410E44C;
	Tue, 17 Feb 2026 07:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="WBqlUmvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1108D10E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:02:11 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1771311728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zUH05RbcDKrVZ3mWgOuCihrh/dQqabKb93Ry9N9l9zE=;
 b=WBqlUmvEwcOPdTptiljG115H5shcWrOGqTNsqS+JxenTvJ4gE5SvT9hjWO1UxqenYJnyth
 SOKKSKCTz1CkMQf74jithI/tH3BNtcziv1bcQ1YK81Q8HWto9h26X/qlJhaccRqnFuy8jd
 j625sJXOBKVpZcYtS5GpbkLJZGezR4EMH0Owd0PH9SYDb7wNPS1WBxoBGz9KBUJnMJGTpP
 ic7DRARekBq5m/eAwmCx6wpNDq/SzVxgT1an+0OaL3XS5Sc1814MQsg73sHRo5vgrmyIIb
 49tZeYh+V9ndP9ORXbiCT+9rC6nZkv+sxYoFZ8GkIqGTCC78vwQGH7fyY+ASnw==
From: Val Packett <val@packett.cool>
To: 
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: [PATCH 0/4] Add support for hx83102-based Holitech HTF065H045 panel
Date: Tue, 17 Feb 2026 04:00:08 -0300
Message-ID: <20260217070121.190108-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: 4FE7014917E
X-Rspamd-Action: no action

This 720x1600 panel is found in several Motorola/Lenovo smartphones.
It will be used in the device tree for the Moto G9 Play (sm6115-motorola-guamp).
Fully tested on it, including brightness adjustment.

The initialization sequence is based on leaked documentation found online :)
as the sequence included in downstream Android DTS was near-empty (I think it
relies on the bootloader to do the bulk of the initialization).
That documentation is also the source for the exact model number (as it's the
same vendor, same controller IC, same resolution, and made for Motorola).

Thanks,
~val

Val Packett (4):
  dt-bindings: vendor-prefixes: Add Holitech
  dt-bindings: display: panel: Add compatible for Holitech HTF065H045
  drm/panel: himax-hx83102: Add support for Holitech HTF065H045
  drm/panel: himax-hx83102: Add support for DSI DCS backlight control

 .../bindings/display/panel/himax,hx83102.yaml |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 151 ++++++++++++++++++
 3 files changed, 155 insertions(+)

-- 
2.52.0

