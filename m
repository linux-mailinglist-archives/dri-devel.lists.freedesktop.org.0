Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95F4AF9FE4
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 13:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC7510E0FD;
	Sat,  5 Jul 2025 11:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="lNGSAAFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106109.protonmail.ch (mail-106109.protonmail.ch
 [79.135.106.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7810E37B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=6jkn22ie5vbihk2u7c7sdltbsm.protonmail; t=1751716076; x=1751975276;
 bh=J8qcIEE70SB/9XoQJlUDk3lierzSpVmt7i94rUb6dyc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=lNGSAAFPU1MmzqoCV75zjasud+Ltau2kMAf0ucoEJNdAv3QWhms7yq51MwkJZnfcj
 7hBkRK9R2WmK4w1JG2u4mCWV7F9k3Johv2zake/jMsn5oYtbJKY8lmQiy9IJbp2J/G
 xOlTYR1VNDtEx6H98fhU3geuQyf2ZPTfRWulXUmkI3fd+48Y6wjDPGJy+u8h44sjso
 7SasVQfsjinPqv07yROXw41U3Bhu/9KzzLfynmoTM3onN2EpW3lqblXcAiz/biBgFo
 s7EulQJl0iETPIQ9c4k3QeplPvYXGNhyy+25uNWRNO2XhUFNjfR7baSU4Fn/DD2T5P
 S1h1rOoPQRC1g==
Date: Sat, 05 Jul 2025 11:47:47 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>
Subject: Re:[PATCH] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <zsSK9sOtcc1AH88pS645eND72d0SjKh2VXYA7waci9cnxW5rwIdm55a028FTHz8vZXJfScx_GJmiXXZBkLW_7EwQj518m3UYtauIIH0BnEw=@proton.me>
In-Reply-To: <9947ce4.7929.197d484ec6b.Coremail.andyshrk@163.com>
References: <20250628180914.1177177-2-pZ010001011111@proton.me>
 <9947ce4.7929.197d484ec6b.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 6d028a90de22091ad8d42a1328fbfe0732ace29e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

> Hello Piotr,
Hi Andy,

> > */
> > static const struct regmap_range vop2_nonvolatile_range[] =3D {
> > + regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE+255),
>=20
>=20
> Small nit: there should be spaces before and after the +
>=20
Hmm weird, checkpatch.pl didn't catch it. I will send v2.

Best regards, Piotr Zalewski
