Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22321FD8F9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 00:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E986E190;
	Wed, 17 Jun 2020 22:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD856E190
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:37:34 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l6so3967157ilo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZpqmM5b2vnIEZM+uoBwaGezs/bIVuA8qCIC5e2tj4Mk=;
 b=Z9MXtbc3EZJ/2Mu0olvucHu9sfuQCI2cZ48kASVFp/UiVLst0d7ZtY+kcw7A/JA8bM
 yELguJiSauN1i5ty0hzaHzXBFPpJ6CiVKmmTJ7NiPBjDZCsay1mgJXPL+yQNMwJnrZiC
 H6zwoOa8wc4gMEbZ570yZNONVd8bHqN7YqL1kFrLJluE5GWtLvI3nSwjGl3RL2/Ng25Z
 qEIhWHDR0Fh06XozBODpkWHGENrAlcpUGpReyRZAbSmKIQThpz4aHvS3ANWl2E1t4a6s
 Lp+uTwHZ8nAWDeIriHi3ogVHG3gCC9cO7AFLmCsa7qKNvUv2bMwQwW5lHnCawuAeN8ku
 cIzQ==
X-Gm-Message-State: AOAM532XLd1saaEPoRB2Mn9LwjfUffKZD63qOjRVY410vEsLJrqoQ0EW
 cP6EMjfPxrYz0mZXOIMH8w==
X-Google-Smtp-Source: ABdhPJyAq5HXFt/cfdAiAR+bnOeSiQTllpHYl1CjJVPEXer5Qdf+2qJhDdxmi+THg3z+2BKJ3Mb/mA==
X-Received: by 2002:a92:190:: with SMTP id 138mr1144486ilb.5.1592433454005;
 Wed, 17 Jun 2020 15:37:34 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id t5sm717751iov.53.2020.06.17.15.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:37:33 -0700 (PDT)
Received: (nullmailer pid 2965169 invoked by uid 1000);
 Wed, 17 Jun 2020 22:37:32 -0000
Date: Wed, 17 Jun 2020 16:37:32 -0600
From: Rob Herring <robh@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200617223732.GB2953201@bogus>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
 <20200611160817.GA6031@pendragon.ideasonboard.com>
 <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 11:38:07AM +0200, Ricardo Ca=F1uelo wrote:
> Hi Laurent,
> =

> Thanks for reviewing the patch
> =

> On Thu, 2020-06-11 at 19:08 +0300, Laurent Pinchart wrote:
> > Hi Ricardo,
> > =

> > Thank you for the patch.
> > =

> > On Thu, Jun 11, 2020 at 12:23:56PM +0200, Ricardo Ca=F1uelo wrote:
> > > Make the ports node optional, since there are some DTs that don't def=
ine
> > > any ports for ti,tfp410.
> > > =

> > > Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>
> > =

> > Shouldn't we fix those DTs instead ? What's the point of a TFP410
> > without ports in DT ?
> =

> This comes from the discussion in the previous version of this series.
> =

> In the DTs that don't define any ports (it's dove-sbc-a510.dts only, actu=
ally)
> it's not clear how to define the ports (I'm not familiar with this board).
> Initially I defined a set of empty ports just to comply with the binding
> requirements, but Rob suggested that we might as well declare them as opt=
ional,
> since having an empty port definition with no remote endpoints is no bett=
er than
> having no ports at all.

I did? Must have missed some context.

> I understand both opinions but I just don't know which is the best option=
 at
> this point.

Just leave the warning to be fixed.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
