Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9C6783AB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6AE10E51E;
	Mon, 23 Jan 2023 17:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7516B10E51E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 17:53:41 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-15f83e0fc63so14803625fac.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HezRXXIQxXPtMIWpEGs9XWajQCD0kCzEdwMP0szra1Y=;
 b=MNSM1rgMzzUl1NFT/9O4KvO6c5plmzhuRz1FCEzEfS3vqBAJwIkfGCqeiGGdeOLJzd
 qoZXiL0qFBYN9ShmLvOYiiBzd5wMyub2xsZqgto11JmG4ScJsIUmNBBFTQDlL0kbn6+q
 Cu0g5CJmDhN0SG/ank4Y9s5cIMP9kx14l8XYQBZNwQz6txjXbSFHD7/dPAtKR/wtaykb
 z9arr0jzoXpg/FzRxm1PX+MvgqrYsAhX4NSl/QHEomjlG7O1ZDoC4/3Y91lb33wzs/n8
 oolZUQPGAlsZXyg9ESs7YB4x8J/KemuI2bG1sVVwHy+g/ybxoMjSl5fC84JWVsN87k1h
 tb/w==
X-Gm-Message-State: AFqh2krUdks6wg1Qc1rppFTzqTFP//JN504PM+quxdRjTbOT2BEoaxPn
 ddhYMWWgvbMh3lca/1EqAg==
X-Google-Smtp-Source: AMrXdXsdPNG8TH0x+2IAyk2abcc9M+PaIG7GDMdhZabCSwFyK7idZOfBF+6vwpZb+UKigpv5r9mK7g==
X-Received: by 2002:a05:6870:494b:b0:143:e045:7082 with SMTP id
 fl11-20020a056870494b00b00143e0457082mr12913559oab.58.1674496420250; 
 Mon, 23 Jan 2023 09:53:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bd36-20020a056808222400b00364ebf27363sm15742oib.0.2023.01.23.09.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 09:53:39 -0800 (PST)
Received: (nullmailer pid 2113958 invoked by uid 1000);
 Mon, 23 Jan 2023 17:53:39 -0000
Date: Mon, 23 Jan 2023 11:53:39 -0600
From: Rob Herring <robh@kernel.org>
To: Rayyan Ansari <rayyan@ansari.sh>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer:
 Document physical width and height properties
Message-ID: <20230123175339.GA2019900-robh@kernel.org>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
 <cdf32cb0-4529-6bbd-fdda-ae641d141ee5@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdf32cb0-4529-6bbd-fdda-ae641d141ee5@ansari.sh>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 22, 2023 at 05:25:38PM +0000, Rayyan Ansari wrote:
> On 22/01/2023 15:36, Rob Herring wrote:
> > On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
> > > 
> > 
> > Why do you need this change?
> > 
> > The 'simple-framebuffer' contains data on how the bootloader
> > configured the display. The bootloader doesn't configure the display
> > size, so this information doesn't belong here. The information should
> > already be in the panel node, so also no point in duplicating it here.
> > 
> > > Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> > > ---
> > >   .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> 
> Hi Rob,
> 
> There is the usecase that Hans has mentioned, but I have also mentioned
> another usecase previously.
> 
> Adding the width-mm and height-mm properties allows user interfaces such as
> Phosh (https://puri.sm/posts/phosh-overview/) to scale correctly to the
> screen. In my case, a panel node is not available and the aforementioned
> interface is in fact running on the SimpleDRM driver (which binds to the
> simple-framebuffer device).

Why is the panel node not available? Why not add it? Presumably it is 
not there because you aren't (yet) using the simple-panel driver (and 
others that would need). But presumably you will eventually as I'd 
imagine turning the screen off and back on might be a desired feature.

So why add a temporary DT property that's tied to your *current* kernel? 
The DT should not be tightly coupled to the kernel.

Rob
