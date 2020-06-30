Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87AF20FBD2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5402A89951;
	Tue, 30 Jun 2020 18:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B6889951
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:35:20 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFCC420724
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593542119;
 bh=gyfWpjnOJwwzGi1tgl/VLHZLp+8PSWYx42nMxv5kKvo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VreS75mCNztVC55O5WYtKQ3ty6sypfwjFtEvCpKGJF/P6+aSEBXzu2b1RZvZfzGpB
 fU3Crxvs7MtpRNg03J0qHtUpL7695T+IUbeYINW2k2LPMvnhMrjK404HPe1gY8RZrK
 tm1PctHJAhBK3iKVLx00O8lxXyMtdbS71s+sKX4c=
Received: by mail-ot1-f51.google.com with SMTP id n5so19261000otj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:35:19 -0700 (PDT)
X-Gm-Message-State: AOAM532pNxK9+IMyLYwcINiVEfFLGTMviSmrjTUjUuZ4X/whQj0g0n8y
 ERt9CzbRvAlCfE04vsBaoZ4qDt+SN+6DRSqwnA==
X-Google-Smtp-Source: ABdhPJyxGkRB5nAl2gD00aoXYNA+A7QZAkg3P0qe89BJ5GCB6sKgUEuOFJbEZFHSpYjGUE+sPWFRo4oj5kH9Y3fJIos=
X-Received: by 2002:a9d:3a36:: with SMTP id j51mr19503925otc.129.1593542118992; 
 Tue, 30 Jun 2020 11:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200520133932.30441-1-erwan.leray@st.com>
 <20200520133932.30441-2-erwan.leray@st.com>
 <20200627141801.GA1945477@kroah.com>
In-Reply-To: <20200627141801.GA1945477@kroah.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 30 Jun 2020 12:35:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+PFmeN_bFRD1M_E+1NOTsMowViG3CUWDWgy5=3kpC=xw@mail.gmail.com>
Message-ID: <CAL_Jsq+PFmeN_bFRD1M_E+1NOTsMowViG3CUWDWgy5=3kpC=xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com, linaro-mm-sig@lists.linaro.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Erwan Le Ray <erwan.leray@st.com>, Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 8:18 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 20, 2020 at 03:39:31PM +0200, Erwan Le Ray wrote:
> > Add support of generic DT binding for annoucing RTS/CTS lines. The initial
> > binding 'st,hw-flow-control' is not needed anymore since generic binding
> > is available, but is kept for backward compatibility.
> >
> > Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> >
> > diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > index 75b8521eb7cb..06d5f251ec88 100644
> > --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> > @@ -35,9 +35,11 @@ properties:
> >      description: label associated with this uart
> >
> >    st,hw-flow-ctrl:
> > -    description: enable hardware flow control
> > +    description: enable hardware flow control (deprecated)
> >      $ref: /schemas/types.yaml#/definitions/flag
> >
> > +  uart-has-rtscts: true
> > +
> >    dmas:
> >      minItems: 1
> >      maxItems: 2
> > --
> > 2.17.1
> >
>
> Did this get ignored by the DT maintainers?  :(

When it doesn't go to the DT list, you are playing roulette whether I
happen to see it. :(

Anyways,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
