Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJurNrTGe2m7IQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 21:44:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D712B453D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 21:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9CC10E8BD;
	Thu, 29 Jan 2026 20:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hf/NQ5R6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833A610E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 20:44:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 47E3843904;
 Thu, 29 Jan 2026 20:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7883C4CEF7;
 Thu, 29 Jan 2026 20:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769719472;
 bh=GdsVRlXM1k21xELKCI7V+gXC1aV8IjxKYFA9ELYBG0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hf/NQ5R6LhBdJyC4Tj+pWrF0EgpeZDK7GQ1YIe23OiJeRbPFOawP2hDi8e1uUB2B0
 tZqhuGu8mmp3Uw9UGD5rsQirNya+CFAiowoEf4WEDHhFMtSJY9rBE7maTlCwVHQJKN
 8K25/UjlnDU3w9wZD2F79qC+oj6W0Rw1JhD+mdcti23J6WwI/C4zlUG8RezLwSE7b+
 /aFVnIsSONqAx9Zt8Re91XjwxPXXLUiKwYlW0QbwxK/LWGfIC1jHnzSH+PrAfZLEpx
 hdNPDK3Nd1mGKjTAKVFfqCjpiYBzj1jtvhv7GO1IFzuk01o7EJ21dFrPfCy5K+dl5T
 NSnIMnCEcQXjg==
Date: Thu, 29 Jan 2026 12:44:30 -0800
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v6 1/9] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <aXvGrqEs7b2e8zy4@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-2-zhengxingda@iscas.ac.cn>
 <aXpwED5wSZbnIjae@x1>
 <20260128-smokeless-angular-cff7e16ff8dc@spud>
 <aXp2jfkpQVZ94rjU@x1> <20260129-riveter-mute-bd981d46d58f@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FwYy0f0XsLkZYND0"
Content-Disposition: inline
In-Reply-To: <20260129-riveter-mute-bd981d46d58f@spud>
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[iscas.ac.cn,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com,pengutronix.de,samsung.com,bootlin.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6D712B453D
X-Rspamd-Action: no action


--FwYy0f0XsLkZYND0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 04:50:59PM +0000, Conor Dooley wrote:
> On Wed, Jan 28, 2026 at 12:50:21PM -0800, Drew Fustini wrote:
>=20
> > Are you saying it is okay to leave the dts patches in thead-dt-for-next
> > even though that means next will have W=3D1 dtbs_check warning about
> > undocumented compatible?
>=20
>=20
> fwiw, I was chatting to Drew on IRC last night after this mail so didn't
> reply here.

Thanks for your guidance, Conor! I will wait for Thomas to confirm
regarding the yaml and driver patches before I create a pull request
for the 2 dts patches.

Drew

--FwYy0f0XsLkZYND0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaXvGZQAKCRDb7CzD2Six
DFrnAQDs/4vRK87uN9IOfqxG2KDOzqlXmIEHF9u+1nkktHTUqgEA/5WiVfJCKVCR
dEkdBRJBP1OexTklm9WUzCVeXs5pxA4=
=nJEw
-----END PGP SIGNATURE-----

--FwYy0f0XsLkZYND0--
