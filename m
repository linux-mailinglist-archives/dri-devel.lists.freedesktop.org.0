Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B/XGoT5jWnz9wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 17:02:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C412F2F1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 17:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D5910E768;
	Thu, 12 Feb 2026 15:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=goldelico.com header.i=@goldelico.com header.b="kql0YCEN";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="vmZv9KJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 343 seconds by postgrey-1.36 at gabe;
 Thu, 12 Feb 2026 15:55:57 UTC
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036F910E768
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 15:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770911396; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=MJuNzbw+KGVIkKLyIu7zA0IPd2dbYRhZA/u4N8qRGspt7RLRcvxbP2CIMOfhw7FUkc
 kpSno87c4Uqs5XJs9JcsjGsXgC/aP67dLD1bGE1sbdy9iNpcxsCYN1teSrpPxEz/s06p
 7ksPQlGN9KaNU/OQIQ7JQMRqMxblUu5tdaqjIsWVkU53QSPgHoucolGrhHSxyM8gGB6S
 4jD8P1aLex4jMmKwMtPr4RN1Hw1Y9jS8yry8mlaUXLSX+WOSD11kVw7rnE2MSJbCyQWq
 cUhSPMAvZNI/gqNoe3IepyDTI1YPFiTDyQzCrBdVOsQqKmDLrfsHqRxYFz6DgEpBHVpd
 AyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1770911396;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=MJCNIdsXgOqoDULdSr1unLlWeh32HgM31dUI13xFAEA=;
 b=NpCZvS5RjsPvlUIgBVzpNMK8eXMDy26FJaCgZvk+gVW9ppc0XvizdzT5hmf50bDe0u
 gBcRT8H7peb76eg5l2yKcI11kfhbLGOA+AKzwZZ9RzQZk+32Kj+vdxAeaty+O6RL8evs
 YxF6+3ms/VCKaf/sJxroe9wZhprJJ58gBWOFrP+RGGThin3YXyDlWIB5zEx18lPHHLDX
 Dt0HBbF1jY3vshFzY3UBP6hqeSRknxAZj758OYb5ghk0In1gVZM3af4jZsLcbAd63dkK
 khtd79xIaXm+v2hjBx76jh5uNJlcZQ8uPQdk+zgVfF7es0u6PLnD6bwjSoi+zDmmfnz7
 5fGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1770911396;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=MJCNIdsXgOqoDULdSr1unLlWeh32HgM31dUI13xFAEA=;
 b=kql0YCEN2/Lix3x+4eNp7G3f0ERH3oxYKxK1s2gy4XVcmORuS93yFNxe8QppBI0dJi
 Korkh7NOilUYSJDLpcQ7+hmm3miGIqWQFoFzVFwSe3GT5rEHgBO44rCiO+xkqCGDXjnZ
 uYbxaS9ml/fmLRdN9KpCy2cLIfj9RBHG1UdColLG/gdGku2MixAHtj3tVKskN9pvvph1
 rZSXppRH36g/Fg/3ho/Z5NRApMGvJxTzwty0FSMxd6jsusETX3h0LBGfHmMOrl9bZ/9y
 K+7IjWGe6yTszGQ6VqCuvj0agDlNBTztYvi2dHUEMFK+2jruecEkH2UW06d3pEGPd+LE
 wAzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1770911396;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=MJCNIdsXgOqoDULdSr1unLlWeh32HgM31dUI13xFAEA=;
 b=vmZv9KJC5D/I/e97tUyq+SF7Oz3aJFr0vo5Fy1RA0UAURJXUr9YBtlmtTb2GWcjsiz
 EeJVRmMJUewIU4/NrODg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
 with ESMTPSA id Q3a36b21CFnsQZJ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 12 Feb 2026 16:49:54 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
Date: Thu, 12 Feb 2026 16:49:43 +0100
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
To: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[goldelico.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:strato.com:reject}];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[bootlin.com:query timed out];
	FORGED_SENDER(0.00)[hns@goldelico.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[goldelico.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email,goldelico.com:mid]
X-Rspamd-Queue-Id: E08C412F2F1
X-Rspamd-Action: no action



> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) =
<kory.maincent@bootlin.com>:
>=20
> Allow overlays to be applied to any DTB. This adds around ~40% to the
> total size of the DTB files on average.

Is this unconditionally enabled or can it be turned off by some CONFIG? =
We have
our own defconfig so I would not worry if if is enabled in =
omap2plus_defconfig
and disabled in ours.

We have several devices where the boot loader can't handle overlays =
(never touch
a working boot-loader :) So this seems to only contribute to build and =
load time
without benefit.

BR,
Nikolaus=
