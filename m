Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E3tDorQnmnwXQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:35:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B608195D50
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93710E229;
	Wed, 25 Feb 2026 10:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i4JJu0Vn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3542F10E229
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:35:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B7A360054;
 Wed, 25 Feb 2026 10:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7637FC116D0;
 Wed, 25 Feb 2026 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772015748;
 bh=4IouABsVBxnfCet02z/uE5QExr/gbSjQyTo+g71W+7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i4JJu0Vn1g+5avdyufhVS0ygPNk0JNQnu5g/ey3flhyc0lu2OaRtL2VVxkLXDTAie
 +1xNAtF1tuC7qT6eFfLmWfCI7GouNBAJXSyROqxGo+fahNXHkG9jKzsciws8lYv6Xj
 teUqjnj3nt/kz9N2gxvINGoYw+Wlm2N3NR4t6UQ8zZvpvnq8WbjBy57QIkKlQivlK2
 puBcSRL6JWCwAoKhFfOj853edTcGtnRTeq3ljzIoIKy+bomaXt/vAsSprhsmwGkfjT
 vcX95gYff3sh6znL+3pWkFXDYN4Mqysay7FsqYOrZp18gASvIeAPfohz1NP9RfOQtY
 +RqWClvqUlEfQ==
Date: Wed, 25 Feb 2026 11:35:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Tony <syyang@lontium.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 prahlad.valluru@oss.qualcomm.com, Prahlad Valluru <vvalluru@qti.qualcomm.com>, 
 =?utf-8?B?5pyx5pmT5piO?= <xmzhu@lontium.corp-partner.google.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: bridge: lt8713sx: Add bindings
Message-ID: <20260225-agile-godlike-orangutan-07abad@quoll>
References: <20260224-lt8713sx-bridge-driver-v4-0-b5603f5458d8@oss.qualcomm.com>
 <20260224-lt8713sx-bridge-driver-v4-1-b5603f5458d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260224-lt8713sx-bridge-driver-v4-1-b5603f5458d8@oss.qualcomm.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:vishnu.saini@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:syyang@lontium.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prahlad.valluru@oss.qualcomm.com,m:vvalluru@qti.qualcomm.com,m:xmzhu@lontium.corp-partner.google.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lontium.com,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com,lontium.corp-partner.google.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url,qualcomm.com:email,lontium.com:email]
X-Rspamd-Queue-Id: 9B608195D50
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:25:35PM +0530, Vishnu Saini wrote:
> Add bindings for lt8713sx.
>=20
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Cc: =E6=9C=B1=E6=99=93=E6=98=8E <xmzhu@lontium.corp-partner.google.com>

Please use latin transliteration/translation, if possible.

> ---
>  .../bindings/display/bridge/lontium,lt8713sx.yaml  | 113 +++++++++++++++=
++++++
>  1 file changed, 113 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8=
713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt871=
3sx.yaml
> new file mode 100644
> index 000000000000..29a773154b39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.y=
aml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt8713sx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT8713SX Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0/DP++ bridge=
-hub
> +
> +maintainers:
> +  - Tony <syyang@lontium.com>

Is Tony full legal name, transliterated to Latin alphabet?

Also Tony, please kindly ack this change.

You already received such question at v3 :/

Also not sure why I am spending my time SECOND time on it. Read very
carefully all the rules:

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/sub=
mitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

