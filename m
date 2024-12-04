Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F89E3E9A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 16:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA08710E4DF;
	Wed,  4 Dec 2024 15:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="NRNvUt7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C6010E31F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1733327128; x=1733586328;
 bh=zsW3P2k6T49Ey7msdJFqq/bskLvtp3R1ODCsR+DajSk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=NRNvUt7HhECMIl8yQpiHpQJ56mc1E5xg0aO3r2yXYdr5NqWkSLwnoMxa98HmOpN7p
 kKV8D2fR0w+VLay45drsoikN9vp2ESNP4OKd5kjr+afHiAymDmWsW659qAPCtbUw5/
 Ja/uK1u8HfR39su4/jw01Pk+45uBLnmy0SrMdHqChjfoj4xc6H4QNcJIKdHS4/l/Gl
 N3v7Q1588l2b2T+3kzhxe9mRbeFrzOG96aMCmSpr+zbws6MNFeLu7J/PhP4V/5bPv1
 pcMb1fOO1igHx0oFyE8F+ulJFJMo0YKdW1m94SFB6tXUO5KS9K0HiRzsg7kVjszJOs
 Tggsc08QUktQw==
Date: Wed, 04 Dec 2024 15:45:21 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: skhan@linuxfoundation.org, Piotr Zalewski <pZ010001011111@proton.me>,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
In-Reply-To: <20241101185545.559090-3-pZ010001011111@proton.me>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 6afc641a1cddc26bcfae7f62410b05a81c0b4b8c
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

Hi all,

I just noticed that after coming out of suspend gamma LUT is lost and must
be rewritten by userspace.

So I guess it will be needed to save LUT to a buffer and rewrite it after
going out of suspend during modeset?

I checked the patch isn't yet in the "official" linux-next.

Regards, Piotr Zalewski
