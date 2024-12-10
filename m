Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72489EB380
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECF110E8F1;
	Tue, 10 Dec 2024 14:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="apGYPtk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123E210E8F1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vm/SMvu/8EpKkDOC/meueBC9lfWEJCHJn3wNu3oS+nU=; b=apGYPtk9B8cEHvRnlKnZRfyPlB
 UjU0n9BxnezEUSJl9xr/rIS3CAWGyApMVmPm35fTQfK9Lg1qjH1CqrI3pEIUsgAH3IAqgLHXpIi+5
 1Rn2C4tjKDlVc/d7X34Zq4zZ6HCNJYmUb07z1nntcDroUOFxB3djTFTLeug2S0rRYOYXLX1VKG3d7
 wnlxrVKNe5R4q/9/UANNYjy5aP2n7mEi9uoUgwPSQFTqN5FNCUlgEBz+0dey58QWAUnSOtLtS+W6w
 sowpUyWKnenxm2NVdRvHK4tS7iOstRm1QAWChyc+OKiUkXA6I87nkF1VdHmwPKgZxU/V0Fy5rB84E
 //ZQ2gsg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tL1Lk-0006dG-TS; Tue, 10 Dec 2024 15:36:32 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Yan <andyshrk@163.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>,
 Diederik de Haas <didi.debian@cknow.org>, andy.yan@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org,
 robh@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
Date: Tue, 10 Dec 2024 15:36:31 +0100
Message-ID: <3104907.xgJ6IN8ObU@diego>
In-Reply-To: <78e7b8e.b5ee.193b09ce46d.Coremail.andyshrk@163.com>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <jl5obi7rd4h6ywozeqruxq2vx62sx5yf4wwpksrq3prdleps2k@d3zbr5ttquvn>
 <78e7b8e.b5ee.193b09ce46d.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Hi Andy,

Am Dienstag, 10. Dezember 2024, 13:48:12 CET schrieb Andy Yan:
> =E5=9C=A8 2024-12-10 20:32:03=EF=BC=8C"Dmitry Baryshkov" <dmitry.baryshko=
v@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >On Tue, Dec 10, 2024 at 09:54:09AM +0800, Andy Yan wrote:
> >> =E5=9C=A8 2024-12-10 09:45:11=EF=BC=8C"Dmitry Baryshkov" <dmitry.barys=
hkov@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >> >On Tue, 10 Dec 2024 at 03:22, Andy Yan <andyshrk@163.com> wrote:
> >> >> =E5=9C=A8 2024-12-10 09:01:38=EF=BC=8C"Dmitry Baryshkov" <dmitry.ba=
ryshkov@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >> >> >On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> >> >> >> At 2024-12-10 07:12:26, "Heiko St=C3=BCbner" <heiko@sntech.de> w=
rote:
> >> >> >> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de H=
aas:
> >> >> >> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> >> >> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> >> >> >This really sounds like something is wrong on the vop side.
> >> >> >> >The interrupt is part of the vop, the divisable by 4 things lik=
ely too.
> >> >> >>
> >> >> >> This is a hardware limitation on vop side:
> >> >> >> The horizontal resolution must be 4 pixel aligned.
> >> >> >
> >> >> >Then mode_valid() and atomic_check() must reject modes that don't =
fit.
> >> >>
> >> >> We round down to 4 pixel aligned in mode_fixup in our bsp kernel,
> >> >
> >> >What is meant by the "bsp kernel" here? I don't see it being present
> >>=20
> >> bsp kernel means downstream vendor kernel.
> >>=20
> >> >in the mainline kernel. So, if the mode is unsupported, it should be
> >>=20
> >> Will it be acceptable to add this round down in the mainline mode_fixu=
p?
> >
> >I think so.
>=20
> Then I can write a patch for it.

thanks a lot for looking into that :-)


Heiko


