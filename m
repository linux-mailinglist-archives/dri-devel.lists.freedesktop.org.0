Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1129E5E87
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 19:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABBF10E3C4;
	Thu,  5 Dec 2024 18:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="UUhEpFNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 97992 seconds by postgrey-1.36 at gabe;
 Thu, 05 Dec 2024 18:58:44 UTC
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F215810E3C4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=7vsekokjirfajj2zq3c5dsl7le.protonmail; t=1733425119; x=1733684319;
 bh=KvD8SgNhV2A1N+le02OtqO9UlfQzw4KsUU1VV8QANVs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=UUhEpFNLZt5XeV4AzqaMBNiVZKq6xP5gHx2JChMQpa+QmXs4gjffKYnMsu04AJ4oG
 2+3zTGCdIqSOO7bOBI8LEnl/4rjSuesuDsQLRi95ZrohgSNBnY+p0fh5rQKExxzC9O
 Wu77u5Yp26auxQ+EePdkuECYwPbMTse5VuWlvI5Xs0sVb8IQVw4h4n2XBcfFx9cSOJ
 oD50A/BFizsS3iZ/ENxCiUkGCvoGim54Rj4D+XStI9nRO9pIyQCUX0cq3hbXin5hTf
 DoKYNfhO3q4Z6p2gfF3CIx6v1BfKiA6F9mW8GgFCX11cJQT4QXFKd2DL2xv71lSlBE
 YrPWFzVc0rqPw==
Date: Thu, 05 Dec 2024 18:58:30 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, Daniel Stone <daniel@fooishbar.org>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re:Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <Kmf2VXiWF77w-brVyLRrswUV3O_7INOquqIpG31ctJB_c9wVFqCY8DeR8rot4jq6Cpz7VeHX7xDl7SXA2JBwXDggAsjKqn__sP9i-be8NI0=@proton.me>
In-Reply-To: <7877dddf.b3b8.19396e1df66.Coremail.andyshrk@163.com>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
 <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
 <12938960.VsHLxoZxqI@diego>
 <7877dddf.b3b8.19396e1df66.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 535e75224ca1d8abbcd2f8c5ed08abda699b6ea5
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

On Thursday, December 5th, 2024 at 1:53 PM, Andy Yan <andyshrk@163.com> wro=
te:


> I guess it returned because crtc_state->color_mgmt_changed is false when =
called from
>=20
> vop2_crtc_atomic_enable from s2r.
>=20

Hi Heiko and Andy,

Yes that was it. Moving the check out of *try_set_gamma
and checking it only in the atomic_flush fixed the issue.

Thanks Andy for pointing that out.

Regards, Piotr Zalewski
