Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7BD9A0540
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EBD10E6D7;
	Wed, 16 Oct 2024 09:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="dTwXUxgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51B010E6D7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:20:53 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1729070451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ASnhTiI9Zj4VlqH3e6Vrg804fSxhSb+KIGUHBuAcIbI=;
 b=dTwXUxgwWOSp/7cSq8f+Q9BrSVJvBcZpuWiRO/C0MuMXqKEy65LUdMFhyugjkPuiaKQX+J
 XjcYVNA0Y2k03FXkPsghIoowCYUlgBDrEoW4XEybvokiVsAyLuVorWOxlD7DHgIii2hniw
 CDLA70L/+bDiZRl/Kc/vXFA5BHJ3ZMNeccgsSOae5TJhiwckMViYuMGOaR7C9NI4RUIQ5Y
 Ufy0KDNdklLmEWtzDW3b9g/PTcscWmYM25j4SQR720pEorD03PNfCcxsCTtzMlc6A1j7Xe
 RfEUbXtSqypKLmD1EW8n6id4Q4C+7a/TNvnUNyZYAY/4umYI49rl3u8DB5c3cQ==
Content-Type: multipart/signed;
 boundary=39b5e2c23b7ab15aaaaca0434076be4b6e0bbab25d73def0f3a97a2bb909;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 16 Oct 2024 11:20:39 +0200
Message-Id: <D4X4BE9PTJ1Q.2TDYBLWRFYMYA@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Piotr Zalewski" <pZ010001011111@proton.me>, "Andy Yan" <andyshrk@163.com>
Cc: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <skhan@linuxfoundation.org>, "Daniel Stone" <daniel@fooishbar.org>, "Dragan
 Simic" <dsimic@manjaro.org>
Subject: Re: [PATCH v5] rockchip/drm: vop2: add support for gamma LUT
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
 <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
 <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
 <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
 <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
 <QvjHFQ4xeCu-8Isrm_jtNRWLowVNFzC8qnHJ6LUGI2iFTTJoEK8fBrXjG9LUrn5Wt9fJ9F04ukEf-koifwCR0uH9nr0AelyiWI85KASNkOQ=@proton.me>
In-Reply-To: <QvjHFQ4xeCu-8Isrm_jtNRWLowVNFzC8qnHJ6LUGI2iFTTJoEK8fBrXjG9LUrn5Wt9fJ9F04ukEf-koifwCR0uH9nr0AelyiWI85KASNkOQ=@proton.me>
X-Migadu-Flow: FLOW_OUT
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

--39b5e2c23b7ab15aaaaca0434076be4b6e0bbab25d73def0f3a97a2bb909
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 16, 2024 at 11:16 AM CEST, Piotr Zalewski wrote:
> I will rework it to[1] and test it. (Have to check if hdmi out on pt2 wor=
ks).

Last time I tried it, hdmi out did work.

--39b5e2c23b7ab15aaaaca0434076be4b6e0bbab25d73def0f3a97a2bb909
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZw+FbAAKCRDXblvOeH7b
bjJ/AP9HFSyCMdeIZVb5Xx2YLeCvCLYIdCd+0plBVEZMy44IyQEA7w7WGs8+Eh2X
6nE2wlGoI5H/WUG0o0By0qK9bgse/gs=
=BmBs
-----END PGP SIGNATURE-----

--39b5e2c23b7ab15aaaaca0434076be4b6e0bbab25d73def0f3a97a2bb909--
