Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B306365962
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 14:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3989B42;
	Tue, 20 Apr 2021 12:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA0189B42
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:58:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7F2F613CD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618923509;
 bh=99lo4qWbGVchdHKfpjjskiYnwE4yEy5FKLw4Af2QoTY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RUEWNT2PyeNkdlvSJo+acObbtrRfEiqgQ1Ee0G+X38ArnLck1tCi5FSCq2rfCgS7C
 uDLjo8e2I6Wepze6WBvSBu1itzRv4WL8tNhOlo71yztcw7qENhawp9yWm3uiXYFa7t
 2k87vF2TCUh7WrlS63hBbvXmCEcZi3VwV9jUBZmsrec/d4/90FmJgPWsEOG3pg24TO
 ITS1Ut3vJEL+H4aSwIzWh8r36U75FUYbP0uikMHxqpeJCtFy21Vb73QlT3nNWZjXYf
 3vcy3tEuz2dLDxKUUC/TZ6B/31JUabcNsWoLF5Vt0fhNjz1SwGfqquHzF1a+Cbz8jo
 5up3KsbI05NLg==
Received: by mail-ej1-f51.google.com with SMTP id l4so58083562ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 05:58:29 -0700 (PDT)
X-Gm-Message-State: AOAM5317JuV4pQv3XxZH5iHccOJcLAH4QX2pcv3S19w2uZEBb/L68N0i
 ED9fOWaL+BYi7PDS7GN5TKrAqMc1udLy5iw8xA==
X-Google-Smtp-Source: ABdhPJw7wi8fw9oOO7qnDlntNFZJyzsrZFVwINbXEnj2d321/UyqKkStdDq602PvgaUm3VtOxj3OOyejbMRwi5kf5vU=
X-Received: by 2002:a17:907:367:: with SMTP id
 rs7mr28084034ejb.468.1618923508307; 
 Tue, 20 Apr 2021 05:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <20210205175543.GA3363048@robh.at.kernel.org>
 <CANMq1KAshVgWPp=4KpjkwfAD=N4ZOw0xBCZHkfGob-TY0RCGew@mail.gmail.com>
In-Reply-To: <CANMq1KAshVgWPp=4KpjkwfAD=N4ZOw0xBCZHkfGob-TY0RCGew@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Apr 2021 07:58:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKSSfuy0b9x70rd2u7Af=FDRY8S39PW8y+fS-Q4pevVig@mail.gmail.com>
Message-ID: <CAL_JsqKSSfuy0b9x70rd2u7Af=FDRY8S39PW8y+fS-Q4pevVig@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
To: Nicolas Boichat <drinkcat@chromium.org>
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 9:02 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Sat, Feb 6, 2021 at 1:55 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, 26 Jan 2021 09:17:56 +0800, Nicolas Boichat wrote:
> > > Define a compatible string for the Mali Bifrost GPU found in
> > > Mediatek's MT8183 SoCs.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > ---
> > >
> > > Changes in v11:
> > >  - binding: power-domain-names not power-domainS-names
> > >
> > > Changes in v10:
> > >  - Fix the binding to make sure sram-supply property can be provided.
> > >
> > > Changes in v9: None
> > > Changes in v8: None
> > > Changes in v7: None
> > > Changes in v6:
> > >  - Rebased, actually tested with recent mesa driver.
> > >
> > > Changes in v5:
> > >  - Rename "2d" power domain to "core2"
> > >
> > > Changes in v4:
> > >  - Add power-domain-names description
> > >    (kept Alyssa's reviewed-by as the change is minor)
> > >
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
>
> There were changes in v11, I thought you'd want to review again?

Looked like a minor change from the changelog, so it would have been
appropriate to keep. However, I see another issue.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
