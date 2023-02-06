Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82068C216
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 16:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DA510E0BC;
	Mon,  6 Feb 2023 15:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29E10E0BC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 15:46:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C7BDB81255
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 15:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3591DC433AA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675698392;
 bh=joRqx9Li9igfnC0oG6IHKkgO3cLoL5bazL6HXykW/Yk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JKn8eNaNJ4rikGY741Uy2+0jJ1t1CJnAt8eg4J/uwsGU91pzRtO8LzlwrMivN/3gp
 NceZa7of2rRpKnlzWWzal3WG40MtjMiIMZbaaoryIEx5QnsmTtPNSjX1udoaGNzRgT
 G+0+/6/mSUKlYDeinY+kmlCkoNaAKjbzQ/q6lmdGksIlr79l0R/s2IlClC45wK/H/E
 fJpyE8hsh7Nvh7Mo7QpuruZlyTxIR5J+/Sc4WgFdeTJJXmiyjrjIITLKZjrsHzdSZd
 FEGytUJ0kxZNmw6G78c7gyEYYv0ewaiHvm/ZsVrn0EfCLdlY3P0oMyVb9DDjyQy+q2
 tg7Sjb+4UeVag==
Received: by mail-vs1-f47.google.com with SMTP id j7so13056816vsl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 07:46:32 -0800 (PST)
X-Gm-Message-State: AO0yUKUX2tzqdbWmTlzmVw72dTwEyG7XCh5Vld39lp7Parm3rJyC4I6Y
 lWQ5IUxSH1yvecDD+jju0lelaaxD65NQmgym+w==
X-Google-Smtp-Source: AK7set8Tk9obdWMlC2bGawE53EVM/Oy5EZ7J8YanM63uhthmowerxVZw/LM6nc9a1zR0V1hhJv6Nifwjl9aigUei0n0=
X-Received: by 2002:a67:cc1d:0:b0:3f3:5ce0:85ab with SMTP id
 q29-20020a67cc1d000000b003f35ce085abmr38443vsl.26.1675698390984; Mon, 06 Feb
 2023 07:46:30 -0800 (PST)
MIME-Version: 1.0
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <20230203182119.GA615242-robh@kernel.org>
 <87f5097d-1cd0-e09f-e759-8592a9165ea6@gmail.com>
 <5647788.DvuYhMxLoT@diego>
In-Reply-To: <5647788.DvuYhMxLoT@diego>
From: Rob Herring <robh@kernel.org>
Date: Mon, 6 Feb 2023 09:46:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJJcRx0XAJmsS6Q-AmNGDd+bWPVgW1yLBq6o2kmxiEFAg@mail.gmail.com>
Message-ID: <CAL_JsqJJcRx0XAJmsS6Q-AmNGDd+bWPVgW1yLBq6o2kmxiEFAg@mail.gmail.com>
Subject: Re: [PATCH v6 01/17] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 5, 2023 at 8:12 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi,
>
> Am Freitag, 3. Februar 2023, 20:02:54 CET schrieb Johan Jonker:
> >
> > On 2/3/23 19:21, Rob Herring wrote:
> > > On Thu, Dec 22, 2022 at 03:22:14PM +0100, Johan Jonker wrote:
> > >> Convert rockchip-lvds.txt to YAML.
> > >>
> > >> Changed:
> > >>   Add power-domains property.
> > >>   Requirements between PX30 and RK3288
> > >>
> > >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > >> Reviewed-by: Rob Herring <robh@kernel.org>
> > >> ---
> > >>
> > >> Changed V3:
> > >>   Filename matching compatible style
> > >>   Drop "Regulator phandle for "
> > >>   Specify properties and requirements per SoC
> > >>   Sort order and restyle
> > >>
> > >> Changed V2:
> > >>   Fix title
> > >> ---
> > >>  .../display/rockchip/rockchip,lvds.yaml       | 170 +++++++++++++++=
+++
> > >>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
> > >>  2 files changed, 170 insertions(+), 92 deletions(-)
> > >>  create mode 100644 Documentation/devicetree/bindings/display/rockch=
ip/rockchip,lvds.yaml
> > >>  delete mode 100644 Documentation/devicetree/bindings/display/rockch=
ip/rockchip-lvds.txt
> > >
> >
> > > What's the plan for these patches? Don't see them in linux-next still=
.
> > > Do you want me to take patches 1-8?
> >
> > Hi,
> >
> > The display patches normally go through the DRM git.
> > Patch 2 must merge with grf.yaml.
> > Heiko has merged now 3 PHY related patches to grf.yaml first.
> >
> > [PATCH v6 02/17] dt-bindings: soc: rockchip: grf: add rockchip,lvds.yam=
l
> >
> > See current
> > https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/log/?h=3Dfor-next&qt=3Dgrep&q=3Djonker
> >
> > Not sure what Heiko's plans are.
> > Patch 2 replaces  only a description text and some accolades removal, s=
o not "too" important.
> >
> > I urgent then you could merge without conflict:
> > 1, 3-8
>
> So I've applied patches 1-7 to the drm-tree now.

That would have been good a month ago. Now these won't land til 6.4.
:( For that reason, if it is after the drm-misc cutoff, I prefer to
take DT bindings via my tree.

> For the GRF-patch, I've dropped the quotes changes, as they are somewhat
> unrelated to the lvds inclusion and so prevented any conflicts when apply=
ing
> the rest to the DRM tree.

Only 1 hunk needed to be dropped to avoid the conflict (which also
dropped quotes). If all the quote changes were dropped, please send
another patch for that.

> @Rob, if you could pick the fusb302 patch (number8), that would be great

Will do.

Rob
