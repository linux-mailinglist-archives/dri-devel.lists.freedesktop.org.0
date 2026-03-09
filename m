Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDJEEULsrmmSKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168FE23C115
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B830510E565;
	Mon,  9 Mar 2026 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="RKCV4XbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 93325 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2026 07:59:15 UTC
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch
 [79.135.106.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35F10E492
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1773043153; x=1773302353;
 bh=us2Sxut54o3bbCLDzOPRYoYiohqpnDpL5+Y7dE37BrI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RKCV4XbUp8+kiDsCNoMPtYjj7xI9ctQf812F6alJ1CB2JR5hVMb4cf7hLapcKQrM3
 DiMdKATvG1MEhacz44lHWH/XaMQlIHDQaEqBV5lLJRQ1p/PFuLEmVJ8BMzxdG44+bU
 AOTP35zATJAyeOkAZ2oBuN0bhwkXRKCvcyL3GMFi5O/LrC5qXOZordlabaqwKJBw4d
 AM8znJbkiFxGHcV+w7DGtHPxyTb9awlIgNwHCHElDdCTpBaPTVUFkkJbMFnDwtmbg4
 xOreBMDFiad2+n7yZ6Ooinhcoe5uT0Po4cEm1tsn97y7Js2gfIQf1SXMl1jddNeP6q
 4y3apa09tPNUA==
Date: Mon, 09 Mar 2026 07:59:07 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
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
Message-ID: <jEmQOGXayNvDVOS6CwoOrw57iIPZ9a5tQLZHo7g7Zq78lD5hZVg85dKDzzboPtKt9BNSjiHptAhLEpEI1s2rrpTSc_qP-LneoLxZhfxZ814=@pm.me>
In-Reply-To: <2d1d5c7c-61b1-4f5a-b039-02ceb2a02c1a@kernel.org>
References: <20260308-tianma-ta066vvhm03-v2-0-5f2344685133@pm.me>
 <20260308-tianma-ta066vvhm03-v2-1-5f2344685133@pm.me>
 <20260309-idealistic-dingo-from-venus-c443af@quoll>
 <PU91d8ChpHqZx-aqR57qt-3XBGBOl_oCbF0SSI_q3uGK9UXUUWplDdDD4m_OGbpXn3Ayx0DCy0wHYe5-nuZeZc-Xy_77mvHl17KrTJcPt-w=@pm.me>
 <2d1d5c7c-61b1-4f5a-b039-02ceb2a02c1a@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6efb296065016972a1a62ed9500271d657904941
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
X-Rspamd-Queue-Id: 168FE23C115
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
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[akoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,dri-devel-bounces@lists.freedesktop.org];
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





On Monday, March 9th, 2026 at 3:54 AM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> On 09/03/2026 08:41, Alexander Koskovich wrote:
> > On Monday, March 9th, 2026 at 3:35 AM, Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> BTW, all of your patches have mismatched From and SoB cases. It passes
> >> the checks but I do not see reason why different case should be used.
> >> Especially that it is manual process to achieve that - none of the
> >> standard ways of using git produce such result, because SoB is added
> >> automatically based on From name. Unless your mail server is changing
> >> these, but that's also odd.
> >>
> >> This should be fixed in all of your patches, IMO.
> >
> > I did notice that, looked into it briefly the other day and it appears =
to be Protonmail Bridge that is doing it, I always use "akoskovich@pm.me", =
but Protonmail seems to be sending out as "AKoskovich@pm.me".
> >
> > It also made some linux-media CI checks fail :(
> >
> > Would you suggest I change my git identity to use uppercase here and th=
en resend all patches?
> >
>=20
> Just change it in Proton settings to lowercase. Or don't use Proton for
> kernel development - in the past it was causing a lot of troubles, so
> here we have another reason - mangling silently with headers.

Thanks, I see in Proton's settings that I can just change the case. Done, w=
ill resubmit changes in a bit.

On the header mangling thing, I think I've already seen that. I noticed tha=
t when I send via git send-email, it strips out the "In-Reply-To" from the =
headers leading to the threading getting lost.

Will try to look into getting a different email provider for Linux contribu=
tions set up at some point.

> Best regards,
> Krzysztof
>=20

Thanks,
Alex
