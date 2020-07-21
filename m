Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB80227BF6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E876E53E;
	Tue, 21 Jul 2020 09:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8346E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:40:40 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED9C520771
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595324440;
 bh=1h+1GwE7hycFxjfYabzIepvpJdN7SRC2PKRbHoqdfyY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J4U7lTxP5CPf34ZMzQ0rqY8I+kAGHCPBLjtoorIK4vqedXL2mOGl+IRYh/N3kUIX5
 Sgjzv4hMOE/YeDvWBd52DX1VJ3VsWWlHBRD6L9SmEpZd8/BJ7d144OWbi07o7IXizh
 SnlqhWn1rTSyPQtwoCQRARIiz9qPuL88kLW/DbTk=
Received: by mail-lj1-f175.google.com with SMTP id e8so23373776ljb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:40:39 -0700 (PDT)
X-Gm-Message-State: AOAM5315xyoDmlEwU9HdLAm2Cyw2aB4TqK/qbMn9/H19360zJFuTf7d3
 hdyyC1ATv3i1a6QgR95RoMH/LTWdo5ok26dQ7Bg=
X-Google-Smtp-Source: ABdhPJztnP32RRtDsgpLBdJTMG2Xrxbs0KhILV9JrQ/K/yISWSE0z+EYbvdc+2v7/fcnB210sYBlWmctvBNrRhTMV8U=
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr12651424ljj.294.1595324438214; 
 Tue, 21 Jul 2020 02:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-2-wens@kernel.org>
 <20200721021026.GA3382460@bogus> <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
In-Reply-To: <20200721092333.yr3wwmrxwz5rvpam@gilmour.lan>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 21 Jul 2020 17:40:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v64=RozBti+ww1Pi56AcKu8RvCN1u7KhfQM8tXRUu4mnWQ@mail.gmail.com>
Message-ID: <CAGb2v64=RozBti+ww1Pi56AcKu8RvCN1u7KhfQM8tXRUu4mnWQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color
 property
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 5:23 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jul 20, 2020 at 08:10:26PM -0600, Rob Herring wrote:
> > On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> > > From: Chen-Yu Tsai <wens@csie.org>
> > >
> > > Some LCD panels do not support 24-bit true color, or 8bits per channel
> > > RGB. Many low end ones only support up to 6 bits per channel natively.
> >
> > This should be implied by the panel's compatible property.
>
> I'm not sure it should, or at least it's not sufficient. Some panels
> while 24 bits capable might only have the higher bits connected to save
> off a couple of pins per color, in which case we should probably
> describe that somehow.

The bus format stuff that was added then removed might be better suited
for what you have in mind. Right now that's put in the simple panel
driver, but it likely doesn't belong there, since the bus format is
also related to the hardware integration, signal routing as you mentioned,
and not just a property of the panel itself.

Nevertheless, what I'm looking for can be achieved using bus format
as well. Given that I have no datasheet for the panel in the device
I'm upstreaming, and only a vague part number to go with, describing
it as a bus format modifier rather than a property of the panel might
be safer.

So I'll just drop the two patches regarding bit depth for now.


ChenYu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
