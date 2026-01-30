Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHSDDqUvfWnKQgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 23:24:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B6BF16E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 23:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E584410E1A2;
	Fri, 30 Jan 2026 22:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8910E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 22:24:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2AC8741523;
 Fri, 30 Jan 2026 22:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C294EC4CEF7;
 Fri, 30 Jan 2026 22:24:31 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
 id CC3181805A0; Fri, 30 Jan 2026 23:24:27 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com, 
 sre@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
 lgirdwood@gmail.com, broonie@kernel.org, 
 Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: jserv@ccns.ncku.edu.tw, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, 
 Yu-Chun Lin <eleanor.lin@realtek.com>
In-Reply-To: <20260113092602.3197681-1-visitorckw@gmail.com>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
Subject: Re: (subset) [PATCH v4 0/6] dt-bindings: goldfish: Convert to DT
 schema
Message-Id: <176981186782.331784.16669920696929509019.b4-ty@collabora.com>
Date: Fri, 30 Jan 2026 23:24:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:sre@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:visitorckw@gmail.com,m:jserv@ccns.ncku.edu.tw,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:eleanor.lin@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sebastian.reichel@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BE7B6BF16E
X-Rspamd-Action: no action


On Tue, 13 Jan 2026 09:25:56 +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish emulator platform bindings from text
> format to DT schema.
> 
> Most of these bindings are currently located in
> Documentation/devicetree/bindings/goldfish/. Move them to the
> appropriate subsystem directories (serial, input, power, sound, misc)
> to align with the kernel directory structure.
> 
> [...]

Applied, thanks!

[4/6] dt-bindings: power: supply: google,goldfish-battery: Convert to DT schema
      commit: 4c3f02f843999a590f4481791f59a2f9a7f34fe4

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

