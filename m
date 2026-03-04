Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGWjGt7mp2mDlgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:01:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF991FC19E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D2610E95C;
	Wed,  4 Mar 2026 08:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sEfJKaEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04110E95C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 08:01:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB282C40FBD;
 Wed,  4 Mar 2026 08:01:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 98F0D5FF5C;
 Wed,  4 Mar 2026 08:01:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B9B810369414; Wed,  4 Mar 2026 09:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772611287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EUWq5kpBIjsc0+kAM5GMY0X+W2LCngNN6LmjmMbSbKA=;
 b=sEfJKaEN0ReR/PcKLCvhIin7UaqONdSGTccrky3vrUuXx1S+uI3hVV8kw1lhdbSmiSvb8n
 7eAZy5FGo8RTXiMTycVYB/O1IZ8HyFZ1fObyINHKAAWCZ75WNY3XpD2zS67JfzKUDbZByd
 oeoX/SbQUvv6tn36HHgjOecMSgQIovWqIQdQlhi0XhBVD6NAfnSOLP/qN123etXDHZjk9g
 wEAquxlveb/dWrboNrT0UrC+g2a1yKDbzDyqyhuG13xuPh3gH8+YSpMJckD8hJMEURWaZ2
 HfVM8VIjyEtyz2QdB5MyPEmPuEzk04gZVU0SFxBd5QqDEgue9bnuJmZB+o8DqA==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 09:01:20 +0100
Message-Id: <DGTU9887GHPO.2FUQ3QITRG7F8@bootlin.com>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <shawnguo@kernel.org>,
 <laurent.pinchart+renesas@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Hugo
 Villeneuve" <hvilleneuve@dimonoff.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Hugo Villeneuve" <hugo@hugovil.com>, "Frank Li" <Frank.li@nxp.com>
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card support
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-9-hugo@hugovil.com>
 <aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
 <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
In-Reply-To: <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Queue-Id: CDF991FC19E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,pengutronix.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:hugo@hugovil.com,m:Frank.li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[antonin.godard@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonin.godard@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Action: no action

Hi,

On Mon Mar 2, 2026 at 10:15 PM CET, Hugo Villeneuve wrote:
> Hi Frank,
>
> On Mon, 2 Mar 2026 15:54:43 -0500
> Frank Li <Frank.li@nxp.com> wrote:
>
>> On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
>> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>> >
>> > Move SD support to a separate include, since it cannot be used at the
>>=20
>> s/include/dtsi/
>
> Ok. I will also change it in all the other commit messages.
>
> =20
>> > same time as the Wifi/BT module.
>>=20
>> what's relation ship between wifi/bt? you just move sd related part to a
>> dtsi file.
>
> As stated in commit message, the SD card interface cannot be used if
> the Wifi/BT module is in use.
>
> Sd card is not mandatory, for example on our board we do not have it,
> so we need to have it disabled.

My two cents: if SDCard and WiFi/Bt support are the only mutually exclusive
features for this SoM, then how about the following organization:

Three SoM dtsi files:

imx6ul-var-som-common.dtsi

  imx6ul-var-som-wifi-bt.dtsi:
    #include "imx6ul-var-som-common.dtsi"

  imx6ul-var-som-sd.dtsi:
    #include "imx6ul-var-som-common.dtsi"

A common concerto dtsi file:

  imx6ul-var-som-concerto-common.dtsi

Separate concerto dts files:

  imx6ul-var-som-concerto-wifi-bt.dts:
    #include "imx6ul-var-som-wifi-bt.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

  imx6ul-var-som-concerto-sd.dts
    #include "imx6ul-var-som-sd.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

And possibly the following one to avoid breaking compatibility:

  imx6ul-var-som-concerto.dts
    #include "imx6ul-var-som-sd.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

In any case, the imx6ul-var-som-concerto-common.dtsi should be full-feature=
d
(and thus avoid the imx6ull-var-som-concerto-full.dts file from patch 09/14=
), if
that's possible?

But I don't know if this follows common practices, and if this is possible,=
 but
I think it's clearer as a user to know if the DTS I will use will support
WiFi/BT _or_ support SDCard by looking at its name.

Of course this is based on the assumption that those two features are the o=
nly
mutually exclusive ones.

What do you think?

Antonin
