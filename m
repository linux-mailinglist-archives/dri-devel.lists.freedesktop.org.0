Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPMqGDvsrmmSKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA623C0E1
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994AB10E567;
	Mon,  9 Mar 2026 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="g/tDVQqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch
 [185.70.43.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB2E10E492
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1773042086; x=1773301286;
 bh=xtsdoxG+gmYllPIx0WMX5AEoHPsIlHt7t21P4WSaqK8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=g/tDVQqSjZlv50Xg5hI15QyiDt3GRjoHSu/gDiNvG3wQP/1hAxokE+/ochkX5ox7Q
 l1bkVPAzQ1UatykLfspQS2XW9FVSN/m1PYAL+LehtXqxK4K33uXa/O0X8AaXBtk89W
 obixgjDNtK4Q0onCI5ssnGhfxNAiuzPtN43CgsjdqzI5Y7O/5VFVJbpvHFy7GJLXTh
 jSfz+aubX3drmS/E5DafcG99HddnFgU2dd9rm62oPJdBGvD+zZm6J8rCBV622iZ1V/
 vSy1xN6+wxpXsWD8tOXNd5gBK7jCW+J8xP2C1xqSqbTJfouKCbGQOxDRwh5QIDTIfo
 pka+1MlQ0xCfA==
Date: Mon, 09 Mar 2026 07:41:21 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Document Tianma
 TA066VVHM03
Message-ID: <PU91d8ChpHqZx-aqR57qt-3XBGBOl_oCbF0SSI_q3uGK9UXUUWplDdDD4m_OGbpXn3Ayx0DCy0wHYe5-nuZeZc-Xy_77mvHl17KrTJcPt-w=@pm.me>
In-Reply-To: <20260309-idealistic-dingo-from-venus-c443af@quoll>
References: <20260308-tianma-ta066vvhm03-v2-0-5f2344685133@pm.me>
 <20260308-tianma-ta066vvhm03-v2-1-5f2344685133@pm.me>
 <20260309-idealistic-dingo-from-venus-c443af@quoll>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 316d367de7bd5c6353c5dc6ff07091c2e8d9d69e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Mar 2026 15:50:13 +0000
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
X-Rspamd-Queue-Id: BBFA623C0E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Monday, March 9th, 2026 at 3:35 AM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>=20
> BTW, all of your patches have mismatched From and SoB cases. It passes
> the checks but I do not see reason why different case should be used.
> Especially that it is manual process to achieve that - none of the
> standard ways of using git produce such result, because SoB is added
> automatically based on From name. Unless your mail server is changing
> these, but that's also odd.
>=20
> This should be fixed in all of your patches, IMO.

I did notice that, looked into it briefly the other day and it appears to b=
e Protonmail Bridge that is doing it, I always use "akoskovich@pm.me", but =
Protonmail seems to be sending out as "AKoskovich@pm.me".

It also made some linux-media CI checks fail :(

Would you suggest I change my git identity to use uppercase here and then r=
esend all patches?

>=20
> Best regards,
> Krzysztof
>=20

Thanks,
Alex
