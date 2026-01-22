Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHMmOMvTcWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 08:37:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85362932
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 08:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09D210E900;
	Thu, 22 Jan 2026 07:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="E+/jIas7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1870 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jan 2026 07:37:43 UTC
Received: from sender4-pp-e107.zoho.com (sender4-pp-e107.zoho.com
 [136.143.188.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C6310E911
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 07:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769067460; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IUEuA7iixpF8g6ihu8V8QGi6kaYgpTSlcHr9jxQn95IhlcvR+ybd1ACfxTbavWTBhlLI1Die9W8M0iY4Q+IbERFuXWDutDMBfW3FCM6TfzI+Odop3ALe/dvZzFg2uSP9go1XT8ondylOifQPWF8nMm++AR5J96/UnIz8IVqnNT4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769067460;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=27t/D+au2E5C7LW4H+D00miBeJuLJZVdStU+4BuYmh4=; 
 b=eaDyfkKxPxRVa7wKWqTtOcFUdn1p2i/yyyZhYw0prb8NP+UyuEK4KONMzasLMwN9v/1OA5hFPt0peSHh8Fbfibo7jLPuxjSP5vyHt1V2gM+IFXJ6sK2qhu91rWdZkdjsU9B5KT9vtexBp5GtB9trqzsbOYOjBbLQIuhkd21o3hg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769067460; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=27t/D+au2E5C7LW4H+D00miBeJuLJZVdStU+4BuYmh4=;
 b=E+/jIas7Qh4p+m3shDjLivdA1NgpOR9fsh0txKMDmdekAFcI/OsLfNSKNJskPDta
 k7B6xtQG4Afm0gWd8AAJoUsWnXXwJlRhzPv6alDhFVqTKj6nVam/WqxLR0XcMcnzhxS
 F799VRlpXCnjfuR7iVsxs8JzXKU4hFcN+UK1qlZERlcpEr3Wtk+xLeoPXxv5THrLD+P
 v9CqdepE/9dZSN1XK8n/vEVD4B3R+njPjvC7d2Y6we0QqOrlyjviXvf0j8y0O9zjdsd
 KMe3Yuk6xQT1w/7vkvGpOWmqexzOLTuTG2EIWyJLztnOq9ulCveKaGCrGEL20K8r/6Y
 mdY8291CkQ==
Received: by mx.zohomail.com with SMTPS id 176906745890729.598189028159595;
 Wed, 21 Jan 2026 23:37:38 -0800 (PST)
Message-ID: <bf129af81c999b9b0760036ed2755e0c3da3e9c1.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 15:37:28 +0800
In-Reply-To: <f49d5e01-1e01-4393-9ba3-2079006984ae@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
 <4afa6f3110790c701c5e24901e9e66560cf21ad0.camel@icenowy.me>
 <f49d5e01-1e01-4393-9ba3-2079006984ae@suse.de>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:gaohan@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FORGED_SENDER(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icenowy.me:mid,icenowy.me:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4F85362932
X-Rspamd-Action: no action

=E5=9C=A8 2026-01-22=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 08:31 +0100=EF=BC=
=8CThomas Zimmermann=E5=86=99=E9=81=93=EF=BC=9A
> Hi
>=20
> Am 22.01.26 um 08:06 schrieb Icenowy Zheng:
> > =E5=9C=A8 2026-01-21=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 13:56 +0100=EF=
=BC=8CThomas Zimmermann=E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (irqs)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_warn("Unknown Verisilicon DC interrupt 0x%x
> > > > fired!\n", irqs);
> > > I'd avoid pr_warn() here. This can fill your logs quickly.
> > Then is pr_warn_once() okay?
>=20
> Yeah, warn_once should be fine.
>=20
> >=20
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return IRQ_HANDLED;
> > > > +}
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Maybe consider returning IRQ_NONE if the (irq) tests succeeds.

Well, the IRQs are read from the device's register, and the read
operation automatically ACKs the IRQ, so it sounds more appropriate to
always return IRQ_HANDLED.

(Well maybe this function should be made return void, and returning
IRQ_HANDLED should be done in the caller of this function,
vs_dc_irq_handler() )

Thanks,
Icenowy
