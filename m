Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9462057D40D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 21:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F99414A66F;
	Thu, 21 Jul 2022 19:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC44818A2DB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 19:23:29 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id 125so2113864iou.6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZsT13cbOfKaeqRu9m6sKUj9DOoQkNTpRxNMP6NsrGLg=;
 b=OVAQ6RgszDJdjQGOWLFBDHW/rXOE8KBrH3NUaGhp8tKC4w9en7SZEKqwsy/F7tkGh9
 kg7OG7slaKn1tMe85ZyDn8KsaidnAl6ujAy/WnuTT5cs5q3rXLiMAv8YAgpsegy0XplE
 3m6wRKNB2BSJCS3Q2xEYvFgEUrEwCPxbRNSTBvVapDPt3t5qMY8L2sYCAyCS0CK5jVRS
 a3QKoA7UBS6Wn7ON7n0lk7wESs4tQ9WG0LFzyXZbHJpOU4WOSh01UiYYJZZ9er77BAzu
 BA/rnF7O+XGGh51C7pY2q702qDQCD0CSmZ5ExR5oHk4jdqQpiPUfQAkYvgmQZi2OUneK
 iAvg==
X-Gm-Message-State: AJIora/DqRpd7sOUS6m7d6jH00WBnfZRkH066WVvIywEAH6k1pckmMBb
 96zZLzZ+yOq8kcX3vo5mQw==
X-Google-Smtp-Source: AGRyM1u2lQyLy8WDrnn4+uoHo6gZ+5lcVtU0qCLZ3gKuIWYEjUWbTUdsZTiD3FSSFapjMrVlA6B86A==
X-Received: by 2002:a05:6638:1694:b0:33f:8178:53c4 with SMTP id
 f20-20020a056638169400b0033f817853c4mr27614jat.7.1658431409184; 
 Thu, 21 Jul 2022 12:23:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 e42-20020a02212a000000b00339ceeec5edsm1125840jaa.12.2022.07.21.12.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 12:23:28 -0700 (PDT)
Received: (nullmailer pid 1782639 invoked by uid 1000);
 Thu, 21 Jul 2022 19:23:27 -0000
Date: Thu, 21 Jul 2022 13:23:27 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Densitron
Message-ID: <20220721192327.GA1771991-robh@kernel.org>
References: <20220721030327.210950-1-marex@denx.de>
 <YtjnFxA66V6bMePa@pendragon.ideasonboard.com>
 <0b4927f7-f1e4-60a8-1eaf-6d4cbc38daec@denx.de>
 <YtlHz1+zLR2oi7cK@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtlHz1+zLR2oi7cK@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 robert.foss@linaro.org, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 21, 2022 at 03:34:23PM +0300, Laurent Pinchart wrote:
> Hi Marek,
> 
> On Thu, Jul 21, 2022 at 02:24:57PM +0200, Marek Vasut wrote:
> > On 7/21/22 07:41, Laurent Pinchart wrote:
> > > On Thu, Jul 21, 2022 at 05:03:27AM +0200, Marek Vasut wrote:
> > >> Densitron is a manufacturer of LCD panels.
> > >> https://www.densitron.com
> > >>
> > >> Signed-off-by: Marek Vasut <marex@denx.de>
> > >> Cc: Guido Günther <agx@sigxcpu.org>
> > >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> > >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >> Cc: Linus Walleij <linus.walleij@linaro.org>
> > >> Cc: Rob Herring <robh+dt@kernel.org>
> > >> Cc: Sam Ravnborg <sam@ravnborg.org>
> > >> Cc: Thierry Reding <thierry.reding@gmail.com>
> > >> ---
> > >>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >>   1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > >> index 88859dd4040ee..6277240536b44 100644
> > >> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > >> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > >> @@ -312,6 +312,8 @@ patternProperties:
> > >>       description: Dell Inc.
> > >>     "^delta,.*":
> > >>       description: Delta Electronics, Inc.
> > >> +  "^densitron,.*":
> > > 
> > > How about "dsn", to follow the practice of using stock names as vendor
> > > prefixes ?
> > 
> > Is there any benefit to that ? All I can see is that it's making DTS 
> > less clear and more difficult to read. It is easy to map "densitron" to 
> > "densitron" when it is spelled out like so in the DT, but it sure isn't 
> > immediately obvious that "dsn" means "densitron" without extra look up. 
> > And even that extra look up of "dsn" does not return densitron, but some 
> > woodworking company and other totally unrelated results.
> 
> I don't know where that practice originates from, and if it's still the
> recommended naming scheme these days. All I know is that it was the
> recommended scheme at some point. I expect Rob will be able to tell
> which name is best.

The other practice is using the website name minus .com or whatever. I 
would stick with that here.

Rob
