Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB08547D7EB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5F410E253;
	Wed, 22 Dec 2021 19:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E0E10E253
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:44:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r17so7015455wrc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCjrHpXu1Vo7I4rx8GmbmN8hEJq/k/PZV1K6n27kXVk=;
 b=bSSlZ3aH9FEGWUVzYQG9mKEMOxBNE7/T2bXPlBKZbxzhO9S2Z2J32F3JFPCuIQlfOo
 EzrW5Jny6H9NBAtnOPhBYd/fChsO41sQZTUqOwakHc82gQIbDAhx/X1HSxxosyTSelGe
 tmFMyNIS7xYEpcBviehq5HF+3xR13K2+oypvqo3B/VkYOSiakjCY3J+Ba6RwVJtEDnOP
 W6GbxzjxMNm/RoJl2lc19aPi4qEjgRrZi9sG+No47w/CiY+zYqMPsrFW929Q+EkH7KL5
 CC8H2VOEXZ5YSjeRIfPJOBAuArrMR28tvtDuuS/xzLUPnSLHNr9/A+/zvxu7LVAhQiPo
 glnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCjrHpXu1Vo7I4rx8GmbmN8hEJq/k/PZV1K6n27kXVk=;
 b=j+Atovd9eHMoJQfHZw5A4jvcEKFQFvy/y6c+TzOTmTgFAAQGz+LS2yaFHiyPhamy7B
 Uojt3sAQ/yF+Wb82DwQQ3QbwqegNKXTMmN/UYZ95bb/WkEHtKNI/twQ8R91YDtwkh/ql
 v/LeEgrrfKB8N/0RwU4VrrTiN8Fz1uKwxsThu8FDLGMNu/1rsFfXh1tpT0pbu9pCpHnc
 m4uVn9zdSQ2FS9VUo9atHxPExEa31ZkHtPEmwqGstNsC+AdqtU6ZmyWq30aH91eCb4wq
 /nrwbT8Ruew6lF7n/vEcL5SlCSXn4zHHxnTLr1vir0GyLrsGERnORoV+QuCciatq2Piy
 YR4A==
X-Gm-Message-State: AOAM530zv29MdBK7+RtyVSIb218uwxDgSz3VwytfzyY8vMNBH+v/XBGQ
 LRkb2Zpm8CJMDJRfiGwvwzN1leJKYU8=
X-Google-Smtp-Source: ABdhPJxSwX0RyZXV/YBXj2EFbWxkfPas2TAbhpbHVlzdZLmZZ8hRCF0UKBxVVneoMV+Rl/taQPV5XA==
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr1126955wrr.559.1640202269582; 
 Wed, 22 Dec 2021 11:44:29 -0800 (PST)
Received: from archbook.localnet ([217.151.114.10])
 by smtp.gmail.com with ESMTPSA id m12sm2991540wrp.49.2021.12.22.11.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 11:44:29 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/22] dt-bindings: display: rockchip: dw-hdmi: use "ref"
 as clock name
Date: Wed, 22 Dec 2021 20:44:22 +0100
Message-ID: <2487063.3NWx74C5WQ@archbook>
In-Reply-To: <8156864.jFcTpQmkuZ@diego>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <CAL_Jsq+jhaE7DWNu1=n9JX+oNp8XRW7mNi--8moDU6RYNyBgBw@mail.gmail.com>
 <8156864.jFcTpQmkuZ@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mittwoch, 22. Dezember 2021 20:39:58 CET Heiko St=FCbner wrote:
> Am Mittwoch, 22. Dezember 2021, 14:52:51 CET schrieb Rob Herring:
> > On Wed, Dec 22, 2021 at 6:47 AM Sascha Hauer <s.hauer@pengutronix.de> w=
rote:
> > >
> > > On Tue, Dec 21, 2021 at 10:31:23AM -0400, Rob Herring wrote:
> > > > On Mon, Dec 20, 2021 at 12:06:16PM +0100, Sascha Hauer wrote:
> > > > > "vpll" is a misnomer. A clock input to a device should be named a=
fter
> > > > > the usage in the device, not after the clock that drives it. On t=
he
> > > > > rk3568 the same clock is driven by the HPLL.
> > > > > To fix that, this patch renames the vpll clock to ref clock.
> > > >
> > > > The problem with this series is it breaks an old kernel with new dt=
=2E You
> > > > can partially mitigate that with stable kernel backport, but IMO ke=
eping
> > > > the old name is not a burden to maintain.
> > >
> > > As suggested I only removed vpll from the binding document, but not f=
rom
> > > the code. The code still handles the old binding as well.
> >=20
> > The problem is updating rk3399.dtsi. That change won't work with old
> > kernels because they won't look for 'ref'. Since you shouldn't change
> > it, the binding needs to cover both the old and new cases.
>=20
> is "newer dt with old kernel" really a case these days?
>=20
> I do understand the new kernel old dt case - for example with the
> dtb being provided by firmware.
>=20
> But which user would get the idea of updating only the devicetree
> while staying with an older kernel?
>=20

Side-by-side installations of LTS kernels with new kernels. LTS kernel
uses same DT as new kernel because distribution set it up this way.

Other scenario: user wants to modify their device tree. They download
the latest kernel sources from kernel.org because they can't use over-
lays and they don't want to fiddle with decompiled device trees.


