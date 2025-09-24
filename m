Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D4FB97D64
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 02:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C82C10E20B;
	Wed, 24 Sep 2025 00:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="FdVIk0rY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bG2VJAV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A9F10E20B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 00:00:12 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cWcRZ3x0cz9tR0;
 Wed, 24 Sep 2025 02:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758672010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdYUfagvLgd2vTkThIiY4JCAklD0s0yT54J4U1FJWwI=;
 b=FdVIk0rYD/3EXDNFqboaiPu/thhidHBLmZZkqv8b8pxBXpi3Yj7/Tu6Q86TbPrJipE9tjk
 dDnodBpNm+d/dRj948g2XqvzD6ufM4Zv8VCUxIToMGTPKZxyqBcsigdOJ782BQOmd2ETwM
 r9nHAAZfIu+eDZkWz7MgN3MAZFKt9HucyluVyAS/UNIo6Nrc3PN0TfsRUvWhkMEvoY5Ewx
 2/J5c54IrsQSt5EqKZF+yi3m+XGY/URffE8cTWEGksSLO6sBnZTGsmadWIzVeA9qA3Nqla
 5x1fNNHHM1LqwvABUr+BR1al3IlLrodWWl4RWzw+5Eadl0PsXeRv2cnFZi+8SA==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bG2VJAV9;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <f693baee-93a6-4734-875e-1c3689094c66@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758672008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdYUfagvLgd2vTkThIiY4JCAklD0s0yT54J4U1FJWwI=;
 b=bG2VJAV91D5iXjZDl+40TRmoJM7FldzOp28JdMY8vIHn4X1Tlg8kACAQ1w8RWcm7eXsGXU
 fJCBIQOxMOUUbjFU+2yMw8c2g5/x/dQnCxeF5n17C/C65XfYU63L07eihGmmWnZrXV73wi
 xsEJcSjuvQ02a1YviJCAofKH95C3Qe0QazaoBhrQjaaRCEUA3g5g0vMfnGl2kOS38BatpJ
 MPXxxEWfHhrlCUpzR5CzBZqiZ+OLD4G/pwy948Zx9+9CAhhTX0c5ha7wbj2wlB9WfbsiKG
 zQR+K86H/tkQaafjN/TOchK6slUsqOdnMVdd3ubj6zAxZo+K9VFK7blmJKbclw==
Date: Wed, 24 Sep 2025 02:00:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 3/9] drm/rcar-du: dsi: Clean up VCLKSET register macros
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>
 <20250923114954.GE20765@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250923114954.GE20765@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: f974b079862f78ade86
X-MBO-RS-META: 8534srm7jy9i5ictr1d4wjs8ajq93teg
X-Rspamd-Queue-Id: 4cWcRZ3x0cz9tR0
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

On 9/23/25 1:49 PM, Laurent Pinchart wrote:

Hello Laurent,

[...]

>> +#define VCLKSET_BPP_MASK		(3 << 2)
>> +#define VCLKSET_BPP_16			0
>> +#define VCLKSET_BPP_18			1
>> +#define VCLKSET_BPP_18L			2
>> +#define VCLKSET_BPP_24			3
> 
> If you'd rather get rid of the shifts, why not
> 
> #define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
> #define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
> #define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
> #define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
> 
> without touching the users ? Personally I'd keep the shifts though.
I'll opt for the former option then . It fits with the GENMASK() macros.
