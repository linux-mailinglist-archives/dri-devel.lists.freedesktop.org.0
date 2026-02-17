Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DpeOmwvlGnQAQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:05:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773E914A317
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096F310E497;
	Tue, 17 Feb 2026 08:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=goldelico.com header.i=@goldelico.com header.b="ospiU61I";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="kQ+nSb1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C037E10E497
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:59:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771318696; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=N5NKF5qAWVzJW+9JMfXCXbw2ItDwUYZWhfe7AU+TWofdBR4juLd4ArujgyYBtXMzNz
 UGOdeyRsoPTrWD0gqHdSAgdGQJ+5fiFogrgUBbrvOJFsD83wHCUEyDLTb19a39lrxSQC
 JFiE/pTxgQjKwxsAODL4rqv1U5+cGu4F1pZmrqxXPD2mPvlPup0SLI5umwi43HdEt0x5
 vF6APsjpehu525hHh7ylNtvhRcbEEQPQ7q4q0B9IzbWCZ/GLGxuWFKD60wGuukKuy8Aw
 p0sU02zt1ReA9lmmZgjzJdyPWoMnXvPVAHf8HnaZ6i4RujGP95+z64lQECQ+Kih01g/x
 pFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771318696;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=g3Lh3x5eN1+MwtWPxLGVQJB3/EkXY4ib2jrNj8kojNw=;
 b=QH+d/vpdbYmj9NK8PdjOhn+YiZ/9uEcQLREq0zZYXnfaWrGkFqEj2sAEWgs3QDMOuR
 zafahhwt3Xj/RIHUaagdkrSGzqx1wWNM7lO8cRt69uhu8TuCKMdRy1wtcT+9TRuhitYN
 OZMmxfLfmnVmlDdkQ/7OI8eqrbLgpZUt4PoOIou879y38ln8Vsa+bbgiyNeJB6oJS8bX
 VgKn7VB47Wb1bSYtgDpnths4v94RMLIeGjQEEb5v9K3KiDEgFh3qki26OSYdz9fZowxF
 uZ6DgvWj6n0biJHANTcxH1w4CGS0tJT5Y4ilI1NgUwfgbLAGuZLcD9qtx1tpqYDvahSz
 AEVg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771318696;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=g3Lh3x5eN1+MwtWPxLGVQJB3/EkXY4ib2jrNj8kojNw=;
 b=ospiU61IeMuOvrYdBQ8qog14QOBf7+miFN95tjWj/dkts49K4qfjMKxiEEf+o6ntWl
 5zaYbNCej2WNzNX7Z1nt5QxglEnFt5lkuqm5c0nIiPwzJ+qS2cDMLKINNHLKdNJ6pFM5
 dGOLaYWHGeUk4D18bna2dud8J4ipcC1dgONJ3bp4kUm1xKN/VgjEHTb/9768FjpdK6qv
 zJnTaNUER4yBEi3ujslmN0VW5bB2jO+1hAeALgtFeupTdwi/7U3on13Vd9siIjp3yo7F
 Xa56YbfhvYXJH99uZWECkWw30WNAzRVTBNF0b4jSgCtBY4eg4rykA7uV3ver6LUl61al
 zJZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771318696;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=g3Lh3x5eN1+MwtWPxLGVQJB3/EkXY4ib2jrNj8kojNw=;
 b=kQ+nSb1NwmDiy76JK9jHniF2lNp/mbBDQQr+pP4XCihUEW3zVMwDH/Hk/vqTzzYn+I
 6IdIOOrDd7FiYy16vcBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from smtpclient.apple by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
 with ESMTPSA id Q3a36b21H8wE9wS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 17 Feb 2026 09:58:14 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20260216161155.09fae580@kmaincent-XPS-13-7390>
Date: Tue, 17 Feb 2026 09:58:04 +0100
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-Id: <0EE0658D-56A7-480C-BF71-6B2EB81DC41C@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
 <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
 <20260212174718.7daccb70@kemnade.info>
 <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
 <20260212231907.6120a2e2@kemnade.info>
 <CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
 <20260216161155.09fae580@kmaincent-XPS-13-7390>
To: Kory Maincent <kory.maincent@bootlin.com>
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[goldelico.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:strato.com:reject}];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robertcnelson@gmail.com,m:andreas@kemnade.info,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hns@goldelico.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[goldelico.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kemnade.info,iki.fi,baylibre.com,kernel.org,atomide.com,armlinux.org.uk,bootlin.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,ti.com,linux.intel.com,suse.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 773E914A317
X-Rspamd-Action: no action

Hi Kory,

> Am 16.02.2026 um 16:11 schrieb Kory Maincent =
<kory.maincent@bootlin.com>:
>=20
>>>>>=20
>>>>>>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI)
>>>>>>> <kory.maincent@bootlin.com>:
>>>>>>>=20
>>>>>>> Allow overlays to be applied to any DTB. This adds around ~40% =
to the
>>>>>>> total size of the DTB files on average. =20
>=20
> Yes, I will move on to this solution for now to avoid too many =
complaints about
> the devicetree size increases.

I have done some experimentation with this patch (on top of v6.19 and =
our private defconfig)
but could not find any DTB size increase.

Does it require another patch or CONFIG change?

BR,
Nikolaus

