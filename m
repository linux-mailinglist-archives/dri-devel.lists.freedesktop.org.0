Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998B67A4F1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D0610E707;
	Tue, 24 Jan 2023 21:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED33A10E721
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:25:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B229FC79D2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:14:30 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2917120003;
 Tue, 24 Jan 2023 21:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1674594865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLO6IC4VLOlTEyFjq+sy4xgqFEeyoTwAMmJNZzryGtw=;
 b=hHhy4kx7JrvVZA7Y931aeVeOn2yw7yaXASKNTPcZubHgXvRlHc2ZxV9s4aou1ozqXqJjlE
 4VmrG7rkATwQfp17mAr8BWTYB6wAddayfw5Evn2DlsuGvG0s/LEpCvrivDsaFzefknZHRo
 INIpXikmJvV0kBMAytwxAWQZpY0kODjRxKVSVVjoxye8N6830sGDXm0xfbycxmuD/flqTb
 cyZHaD0nxKGBqS7Tks5ctbySaUwE/OASzleG9ZUeKhqV4tTCk6sQpHyRKKQq3T7Yv5EEB3
 nKLIU/BRp/yBV8fUjJ4IyYka/n6kWVAea2dDJyrhceCZg2NUcwLJHfoZPcp8Sw==
Date: Tue, 24 Jan 2023 22:14:21 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v3 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Message-ID: <20230124221421.2d45a532@booty>
In-Reply-To: <cdc91bc4-aa76-f824-36c9-d2995c17fb18@collabora.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-3-luca.ceresoli@bootlin.com>
 <cdc91bc4-aa76-f824-36c9-d2995c17fb18@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Tue, 24 Jan 2023 20:02:39 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 12/29/22 16:31, Luca Ceresoli wrote:
> > +        vip {
> > +            compatible = "nvidia,tegra20-vip";
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            channel@0 {
> > +                reg = <0>;
> > +                ports {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +                    port@0 {
> > +                        reg = <0>;
> > +                        vi_vip_in: endpoint {
> > +                            remote-endpoint = <&mt9v111_out>;
> > +                        };
> > +                    };
> > +                    port@1 {
> > +                        reg = <1>;
> > +                        vi_vip_out: endpoint {
> > +                            remote-endpoint = <&vi_in>;
> > +                        };
> > +                    };
> > +                };
> > +            };  
> 
> In the changelog you said that the channel@0 node is removed

Thanks, you are right, this is a leftover. I must have forgotten about
updating the example. :-\

It will be fixed in v4 obviously, I was waiting before sending it in
case of any feedback on the other patches.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
