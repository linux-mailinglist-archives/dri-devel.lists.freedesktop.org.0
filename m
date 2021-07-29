Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C143DAEE1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 00:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3506EC66;
	Thu, 29 Jul 2021 22:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDB36EE78
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 22:30:05 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id y200so9100393iof.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nxHho6RZxjUuYURjfVw+2b6ILg8EjvBd3YtWTTGJ9Is=;
 b=RjrBVmX5vhoW0Hx46xOp6KieDMl+3LmaC88z9e1ohdB3/t/Al5ScW2p5kbYwB3Dg+L
 3LGznZHKWFcqk4UPclHYGE86vdg2/BimrilayYsBt/3oj85dkm/kLipfku20UAj+LIxN
 H9kM8aBBhYFq83F7eoqH24gAYxcUTWFysCaomuE4EB/s7r+6zfTrg5L4YqvJN1gAUlOF
 00+SsiRn60MAgYeMKSwnu3ab2viJ9RrlPwWX6Kl2OV8eQBg6Xyul/3V61BRiDoTXEww4
 njlVOaPYiQ9yPZ3m3UEzqyA1OuLHaOgVbEMKbAKktgvgmkF8lt5+j7Rbt1MCVblrJK6+
 uG5w==
X-Gm-Message-State: AOAM531+Jt/0aAlmRWZQxdDfLxWNA0H5hCxh2Ju/+29fd6Ubv2cljBFo
 fba1NYLzoWz5WyApFGehXA==
X-Google-Smtp-Source: ABdhPJx3FAFP9axGNQ3Quk45L4+xPnWPLhYc926b4evgK46BUcmGvFDnG8jsDH5SjroGIGATVhBwbQ==
X-Received: by 2002:a02:6f1c:: with SMTP id x28mr6371373jab.95.1627597804911; 
 Thu, 29 Jul 2021 15:30:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id y14sm2335867ilv.76.2021.07.29.15.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 15:30:04 -0700 (PDT)
Received: (nullmailer pid 1020064 invoked by uid 1000);
 Thu, 29 Jul 2021 22:30:02 -0000
Date: Thu, 29 Jul 2021 16:30:02 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Message-ID: <YQMr6slu/Nvt6UYr@robh.at.kernel.org>
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
 <CACRpkdaaQeuVqJbczHndsgmmMv0NycwRDdzFTDwM=BJnc7SseQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaaQeuVqJbczHndsgmmMv0NycwRDdzFTDwM=BJnc7SseQ@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 09:51:40AM +0200, Linus Walleij wrote:
> On Sun, Jul 25, 2021 at 4:04 PM Alexey Minnekhanov
> <alexeymin@postmarketos.org> wrote:
> 
> > The Samsung S6E3FA2 AMOLED cmd LCD panel is used on Samsung Galaxy
> > S5 (klte) phone.
> >
> > Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> 
> Grr gmail put this in my spam folder, sorry for confused mails.
> 
> With Sam's comments addressed:

What comments? Sam's mails seem to have problems getting to the lists.

Rob
