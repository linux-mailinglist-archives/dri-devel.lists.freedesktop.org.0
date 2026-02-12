Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NX9Az4Gjmlf+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 17:56:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A612FB8D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 17:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CDB10E785;
	Thu, 12 Feb 2026 16:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=goldelico.com header.i=@goldelico.com header.b="Q+SGIMNJ";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="dLzVYS5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3807 seconds by postgrey-1.36 at gabe;
 Thu, 12 Feb 2026 16:56:25 UTC
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430E810E772
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 16:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770915367; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=poCROlE1R2t+M26nxG1K274+nRYYyfGaASX8bvQ+zYvGlMsEMj0hvUuGNMjmoFyrxm
 bpDSmrE+NK2r91Uw+Um78FYnUaw6pp2xuhaHLIgIwn3odZ1MCaSkIOKLK7Uiav+RjeDb
 83o9wI0kFjAfo3yVUG9hAnS0LzyWJuORJ8ri23zo8DiU0EYm9nvH06IQDB8s5Mq/o4p+
 T1k12EjLlE4uwtPEa83yYW8MhgCsVHD/75mv92o5i9iLVuNBJkrIlPVlYVkuUJLA9qVe
 Y9W4hcaKpT7xwLqMIXb37mRcym7YvGk5F7JzfO6rUja3f6Zsl2jWZNKgaDb9XGufsV2w
 Vc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1770915367;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=0yygrALMAexS1ThG2pkH1/33OpHfYKVBFq93Wki2PeE=;
 b=GmvKvR335RvOhJgii9GAqusO/RhcYfYwllNWmD2yGW4M2tIvsYy3JtCpo+hYezasUU
 z3nsuHppkKelmYc3vE2NVubIUT4MHCsaoczvnTMPYrJFvuty1xQfEqkYDMaL22Qkd73C
 kzk2iYrBTkWOxZd7MPBWYwMClsZMGioHufr/bESKYzvu/wKReY9k+fbk3H5PeGTZ5P/S
 16nIRDQKy+lR88s7WwZUD8kaWmrB7FRl0WSi362tqDDZrtWNH774J4gCSO49UFwTUgWO
 5wdKBZPYpIAxd9yazjyGl8wRf1awHSTiF8V2G4V3NvtKBjV3RJTHf7FSfR9VeZ6wTpjA
 vMJQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1770915367;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=0yygrALMAexS1ThG2pkH1/33OpHfYKVBFq93Wki2PeE=;
 b=Q+SGIMNJxYOwdPT2X7Ms+1pAua7HzFP1bBGtwGwmkPaQBgLC9EaTnM225LZNBNvEYB
 C7VhpwqgMsfj6eVz+prFYc8BF/3HVLVxWQ3KmopF03wkU7/t1zukslJ8QW8r9olovbKN
 9m2KNOoxU9GchM/6XlndjZe7HICOf8NTZS2XDLYCvwyDKDD/wqFnXTKd4DS8uAL1UYWm
 /Rs4LanrBmuM/IUz5v9UyXMhDyz6caqXczO/aHj1fQnPncZtQXib5jLxKqQ5nhdUwaxc
 O6yYHedjB26xGlPKgejaaoXn2fI+TWr2EL15A5R9BplcWJgkUqk73h7l92xrXLkYUgJl
 SVlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1770915367;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=0yygrALMAexS1ThG2pkH1/33OpHfYKVBFq93Wki2PeE=;
 b=dLzVYS5OhKK1EI1lcwu2KJP1oH/9uvPkIz/pupltRiH6NHQNMRybkt4pN3f7nBCPCQ
 SpkVZgHbSRFfLXTByXBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
 with ESMTPSA id Q3a36b21CGu3RSn
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 12 Feb 2026 17:56:03 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20260212174718.7daccb70@kemnade.info>
Date: Thu, 12 Feb 2026 17:55:43 +0100
Cc: "Kory Maincent (TI)" <kory.maincent@bootlin.com>,
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
Message-Id: <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
 <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
 <20260212174718.7daccb70@kemnade.info>
To: Andreas Kemnade <andreas@kemnade.info>
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:strato.com:reject}];
	R_DKIM_REJECT(1.00)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kory.maincent@bootlin.com,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:andreas@kemnade.info,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hns@goldelico.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[goldelico.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,goldelico.com:mid,goldelico.com:email,kemnade.info:email]
X-Rspamd-Queue-Id: 690A612FB8D
X-Rspamd-Action: no action



> Am 12.02.2026 um 17:47 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Thu, 12 Feb 2026 16:49:43 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) =
<kory.maincent@bootlin.com>:
>>>=20
>>> Allow overlays to be applied to any DTB. This adds around ~40% to =
the
>>> total size of the DTB files on average. =20
>>=20
>> Is this unconditionally enabled or can it be turned off by some =
CONFIG? We have
>> our own defconfig so I would not worry if if is enabled in =
omap2plus_defconfig
>> and disabled in ours.
>>=20
>> We have several devices where the boot loader can't handle overlays =
(never touch
>> a working boot-loader :) So this seems to only contribute to build =
and load time
>> without benefit.
>>=20
> As long as you do not add overlays, the bootloader does not care. I =
would
> like to simply carry around the 1-bit mmc overlay for one broken =
board.
> That would help me. So I think there is a benefit but nobody forces
> you to use it.

Well, it does not force to use the really good feature, but it forces to =
add
~40% more file size and some more compile time, if I understand it =
correctly.

This makes me think that it should be an option to turn it off =
completely (and
not just ignore it by the boot loader).

BR,
Nikolaus

