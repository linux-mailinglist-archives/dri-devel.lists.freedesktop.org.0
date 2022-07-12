Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B485721E9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 19:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981F118A180;
	Tue, 12 Jul 2022 17:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D5B18A157
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 17:45:55 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id l24so8559896ion.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 10:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EeA/Q4dpzXnIdEu9s3UYVlS9gYTtGYBnZ7WQ/eoGAPk=;
 b=ZyGM7lCzJOu2ycFjuZHzmHwtyUn/AX/p5Z41KRtuW4sLu4lpWyqEwf6YuvxTOqSnMm
 kyEzekbHPVTgMyLavb/A08n70vD4PwoZ0nsdGX0gWW0mdQujw/XGTNR+GFUffHI5SxM3
 IAHi/62JELmBAmkJPpOrfIsAPqO6AHWK9mjgLdPrbfAJFfMpsiKXpw0n8so1H66vnOVf
 aT/5IZyUc+R+WwXzZOATHYWX8oZ0SKsoqvxDfwbHxzjes11YpNSwzdxKjk7EfMOkJnxL
 9DcZNk6+v6mFXad4CgmBt9wuw41kemneQJ7MFXNJv/IXVlOU+2PFUnacr0P4U9qxKBXS
 emNg==
X-Gm-Message-State: AJIora/l38lLKrpDSppCrez0RadIDyMnojrEpfUQ84IIMcasn+l6gOcM
 b0KzqUQWB9tpQlA2Gas0kw==
X-Google-Smtp-Source: AGRyM1uOsNLXCW82QVYju7l6Xv2Jo7ce6JDXo6vc89kZT8WdBgtZT0+8I+FmmdzRidS+JO3TPYW5FQ==
X-Received: by 2002:a05:6638:2404:b0:33f:7105:ed23 with SMTP id
 z4-20020a056638240400b0033f7105ed23mr2456174jat.50.1657647954774; 
 Tue, 12 Jul 2022 10:45:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a022209000000b0033f7d500749sm171977jao.128.2022.07.12.10.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 10:45:54 -0700 (PDT)
Received: (nullmailer pid 2083290 invoked by uid 1000);
 Tue, 12 Jul 2022 17:45:51 -0000
Date: Tue, 12 Jul 2022 11:45:51 -0600
From: Rob Herring <robh@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
Message-ID: <20220712174551.GG1823936-robh@kernel.org>
References: <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
 <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
 <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
 <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
 <CACeCKadtmGZ5iuTHdMms6ZHGn-Uv=MbcdtqmUzqCb=5WHuPj2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadtmGZ5iuTHdMms6ZHGn-Uv=MbcdtqmUzqCb=5WHuPj2Q@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 10:10:32AM -0700, Prashant Malani wrote:
> (CC+ Bjorn)
> 
> On Wed, Jun 29, 2022 at 4:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-29 15:55:10)
> > > On Wed, Jun 29, 2022 at 2:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > My understanding is there are 4 DP lanes on it6505 and two lanes are
> > > > connected to one usb-c-connector and the other two lanes are connected
> > > > to a different usb-c-connector. The IT6505 driver will send DP out on
> > > > the associated two DP lanes depending on which usb-c-connector has DP
> > > > pins assigned by the typec manager.
> > [...]
> > >
> > > We can adopt this binding, but from what I gathered in this thread, that
> > > shouldn't be done, because IT6505 isn't meant to be aware of Type-C
> > > connections at all.
> >
> > How will the driver know which usb-c-connector to route DP to without
> > making the binding aware of typec connections?
> 
> I agree with you; I'm saying my interpretation of the comments of this
> thread are that it's not the intended usage of the it6505 part, so the driver
> shouldn't be updated to support that.

That's not the right interpretation. There should not be some Type-C 
specific child mux/switch node because the device has no such h/w within 
it. Assuming all the possibilities Stephen outlined are valid, it's 
clear this lane selection has nothing to do with Type-C. It does have an 
output port for its DP output already and using that to describe the 
connection to DP connector(s) and/or Type-C connector(s) should be 
handled.

Whether the driver is type-C aware is a separate question from the 
binding. I would think the driver just needs to be told (or it can ask) 
which endpoint should be active and it just enables output on the
corresponding lanes for that endpoint. I'm not sure if all DP bridge 
chips have the same flexibility on their output lanes, but I would 
assume many do and we don't want to be duplicating the same code to 
handle that in every bridge driver.

Rob
