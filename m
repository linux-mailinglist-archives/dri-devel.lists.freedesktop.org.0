Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCB3D1038
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4D86E875;
	Wed, 21 Jul 2021 13:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5476E875
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:49:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4406461248
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626875384;
 bh=Fcd46JsRF5Xzokx8EbEQAOvgZr4ne1Di199XOOqGdXI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MlngOFVzPy6D4n/vJS8cjv7UbvZgk2BbOpnI5+S4srLE5uyBvjmuzvuK6bVFb3fFj
 19HPLZGZUuiHcV3pVbD+3M2mCNVMqiZ2hmQprUrNSSdqQ2+6HZZKs4XkkeMRjPgsCF
 j/6ZYtYhD/trRr673VMxc9e6EOc0rL1pUmfUtUijh5aOHbIGCnCQ8Nxi8CTPWlypNM
 uCXisRccE7jOfEPF/4SZTKVHS8JIOZ6Wsk0Zon74S97Bmb3BzdgmWrhehfUzALQmrN
 +an+o4ZhXnKawCDxTNtX0d6jgAw7c+hMbNWhkva58kZcDvUDKAJ5khJ/kid8yv0l2q
 VRaXfzTQnwJtw==
Received: by mail-ej1-f46.google.com with SMTP id nd37so3376399ejc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:49:44 -0700 (PDT)
X-Gm-Message-State: AOAM530/GPT/9kHun5QmJi2kXI3wXcsH7b3GZV5SJctGsjK5h8czlfbH
 THjyd81XSmf9K4I8dLoQiSE5lAG1WG79T64cjw==
X-Google-Smtp-Source: ABdhPJzh5cj++jO5fwUbg47UmcOOhxrwvB/MBLzILA/PNS+iWEyxrXcgOCfI8OpXmusl3DEp7otnJa9jAjW0ixfrR7g=
X-Received: by 2002:a17:906:5fc1:: with SMTP id
 k1mr37644013ejv.360.1626875382783; 
 Wed, 21 Jul 2021 06:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210720172025.363238-1-robh@kernel.org>
 <8343dfe9d1af1ad4ab806104b74a95819c765dea.camel@pengutronix.de>
In-Reply-To: <8343dfe9d1af1ad4ab806104b74a95819c765dea.camel@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jul 2021 07:49:30 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+XEbEJuoSiQ=PeL-34FkLqG-eYA86FvNK7K-uGbaTFwg@mail.gmail.com>
Message-ID: <CAL_Jsq+XEbEJuoSiQ=PeL-34FkLqG-eYA86FvNK7K-uGbaTFwg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Karol Gugala <kgugala@antmicro.com>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Mark Brown <broonie@kernel.org>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 2:33 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Rob,
>
> On Tue, 2021-07-20 at 11:20 -0600, Rob Herring wrote:
> > There's no reason to have "status" properties in examples. "okay" is the
> > default, and "disabled" turns off some schema checks ('required'
> > specifically).
>
> Is this documented somewhere? If not, should it be? (Maybe in writing-
> schema.rst -> Schema Contents -> examples?)

I don't think it is. I'm writing a schema for it which works for both
those that read documentation and those that don't.

Rob
