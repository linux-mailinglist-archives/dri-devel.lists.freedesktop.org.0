Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0DAFA469
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 12:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAC310E038;
	Sun,  6 Jul 2025 10:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="KIEVgAER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981D10E038
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=jy3swzlwwvekrdzd7oepny45be.protonmail; t=1751797263; x=1752056463;
 bh=TRpeYUjYOCK7fAy5xC95Yl5UuQXVTR4cjv4XrdE76eg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=KIEVgAERnbR2vz9eE5jB3dxeBTNNIHZIFZuYheCWsRkuwVmh6orUQ2oIDGbxY2teV
 C6hUUvSulbrg0mGhZEtOY8KGarvqrxhixl90ZEpaUoUcc26D4RuFxISHlorG2Oazjl
 1STE3Wd5Ned1iAXjCXtzE54aMTm1PT3WLx0cD38cXhWoKK4VfRycJl3gMuF4YRvrLh
 +Qu+oR6B3hK/9ldP9iozGDrDnsIdzVBb5maqhfu/zDdJ1djRy0B8SvfhhgrMDw36yb
 ToqPTNSLg3vyx1WQWev9x1Y62uUI8op4fG1H589h8nxQ6ZPXHhXPyt6BW+0/PiB/de
 brfhvlFt380gg==
Date: Sun, 06 Jul 2025 10:20:56 +0000
To: Diederik de Haas <didi.debian@cknow.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
In-Reply-To: <DB4W0GOQZ8MZ.MA7QXHJWCTK2@cknow.org>
References: <20250706083629.140332-2-pZ010001011111@proton.me>
 <DB4W0GOQZ8MZ.MA7QXHJWCTK2@cknow.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: fd5f69f618c951cf7280e90a0113a2616a1050d8
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

> Hi Piotr,
Hi Diederik=20

> With a new version of a patch, you're supposed to add the tags you
> received for previous versions, like my Tested-by tag [1].
>=20
> (unless the new version has changed so much you feel they should not be
> carried over; you then need to explicitly describe that and why you
> dropped them)
=20
Forgot... Should i send it as PATCH v2 RESEND?

Best regards, Piotr Zalewski
