Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030307C451A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 00:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F1E10E3FC;
	Tue, 10 Oct 2023 22:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10357 seconds by postgrey-1.36 at gabe;
 Tue, 10 Oct 2023 22:54:19 UTC
Received: from mail.maslowski.xyz (unknown
 [IPv6:2001:19f0:5:5b98:5400:3ff:fe59:951d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5A310E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 22:54:17 +0000 (UTC)
Received: from localhost (ett70.neoplus.adsl.tpnet.pl [83.20.165.70])
 by mail.maslowski.xyz (Postfix) with ESMTPSA id 2EE077DC10;
 Tue, 10 Oct 2023 22:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
 s=mail; t=1696978445;
 bh=6cDLMOXL3mLA/poB5kEyvB24vzjoALF7gR0tMFcgS9Y=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=bQ2jGm/OUyitIsIreJ+nwUemlNEtaGng3FNv+Ul8slocoDLrhArgJlFXDdrbftffG
 hlh30WcFC0yoVIWBBgQo+OGHzmuQ5bK16dZFMVyb3B4HZfuEtt4QdC11fD20m2E+R6
 86As2hLylh7m2MVJaQTTVMVmlxN3h1/27g4C+4wTd4lcLl4gkyhPozWVpyFWKOzcFn
 m1vIBN0egWzVCp4Ym3YVMizjMlqEgepaxH+n3mRfPxAopdXcbcQr8gMjGDlEE8kG6Z
 S+ahEMO4bO4LA9euNchEsU7HsCZ/fputbYgJzWG/apMQ0xryb0/SAM9nVqwYxM30zO
 NvMuIcekMSz4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Oct 2023 00:53:57 +0200
Subject: Re: [PATCH RFC] dt-bindings: display: document display panel
 occlusions
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
To: "Caleb Connolly" <caleb.connolly@linaro.org>
Message-Id: <CW54GWXGYWEA.ER1Z3DVG83M0@andrad>
X-Mailer: aerc 0.15.2
References: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
 <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
 <4ce2c3a6-6f66-4fe7-8616-a787a88dd250@linaro.org>
In-Reply-To: <4ce2c3a6-6f66-4fe7-8616-a787a88dd250@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Robert
 Mader <robert.mader@posteo.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Guido Gunther <agx@sigxcpu.org>,
 Hector Martin <marcan@marcan.st>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 asahi@lists.linux.dev, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue Oct 10, 2023 at 10:36 PM CEST, Caleb Connolly wrote:

>> So why am I writing all of this? Well, the problem I see is that any
>> shape-based approach will likely suffer from both accuracy and
>> complexity issues. Describing curves is hard and processing them is
>> not something that should be included in e.g. whatever handles VTs.
>
> My proposal here doesn't require processing curves or doing any
> complicated calculations. If you know that the display has a 30px radius
> on all corners, you can adjust the VT to not use the top 30px of the
> screen and it will start exactly where the radius stops.

Just a nitpick, but on a round smartwatch this approach will give you
a $width =C3=97 0px famebuffer ;D

>
> If you know that there is a (potentially very curvy) notch at the top of
> the screen, you can just iterate over the arcs, add their radius to
> their Y coordinate and take the maximum. This will always give you at
> least the height of the notch (you'd probably want to check that their
> angle is vaguely downward, but again this is trivial fast integer math).

Yeah, I was talking about curves in general. Your proposal is on the
low-complexity side thankfully.


>> - gathering the data is very straightforward =E2=80=93 just light the re=
levant
>>   pixels one-by-one and check if you see them
>> - pixel-perfect accuracy is the default
>
> I think it would be fairly straightforward to do this for curve data
> too. You just bump the radius up/down until it looks right, or "good enou=
gh"

Well, different people will have different standards and what might be
good enough for some will annoy others. I'm not saying that we need to
be perfect at all cost, but if there's a relatively easy way to cut down
on inconsistency, it might be worth taking.

Additionally, having a very clear-cut quality indicator could remove a
whole class of bikeshedding options. (speaking of the devil xD)


The problem I have with curves is, the more 'correct' you make them, the
more convoluted they become. Like take for example the corners. Rounded
corners are circular right? But what if someone makes them 'squircular'?
Well, they are usually quite small anyway so maybe it will work out.

But then what about a smartwatch with big, squircle-shaped display? Bam,
now you need to complicate how corners are handled.

But also: are rounded coners typically circular? Just now I've thrown a
OnePlus 6 (thank you so much for the great mainline support btw!) onto a
flatbed scanner. While a circle fits decently well there it's not really
a perfect fit, so maybe they went with a different curve after all.

That being said, imperfection isn't my main issue with curves. It's all
the non-discreteness they bring to the table. As in, you now need to care
about approximations, rounding, imprecise measurements and so on.


> I think the unfortunate truth is that approximating notches and rounded
> corners exclusively with regular arcs at the cost of pixel accuracy is
> just such a no-brainer. Pixel masks would be pixel accurate, but there
> is no benefit compared to a slightly underfit curve.

Frankly, I don't see any significant cost here. It's very easy to gather
and rather easy to process.

Let me think about it=E2=80=A6 The most common operations I see people actu=
ally
doing with this data would be:

* letterboxing =E2=80=93 easy with both curves and masks
* ensuring padding | margins for icons on the screen =E2=80=93 with curves =
you
  can use a formula, but won't it be easier to just count pixels anyway?
* routing a spline along the border =E2=80=93 like if you want to have some
  periodic pattern drawn there, it's probably a bit easier to do with
  curves
* drawing something at a constant distance from the border =E2=80=93 with c=
urves
  you can again use exact formulas. But isn't that an overkill really?
  I'd think most people will go for something like a morphological
  dilation instead

>
> Any program which wanted to make use of the curve information would have
> to run a whole curve fitting algorithm, whereas there simply aren't any
> programs which need to know about display occlusions to a pixel-accurate
> level. For padding a status bar you do a single trig equation, for
> avoiding the notch in fullscreen you would query the DRM subsystem which
> presumably would export the dimensions of a letterboxed "usable size".

What could the curve information be needed for though?
The more I think about it, the less value I see in it really. Like, if
you're adjusting the screen contents, pixels _are_ the smallest unit you
need to concern yourself with. The only thing that comes up to my mind
is if you were to animate the cutout shape somewhere else, zoomed in.
And thats already a quite contrived scenario.

Is there actually any use case that instead of ending up with pixels
either way, would be better served by a (possibly inaccurate) curve?
(future me here: that spline-along-the-border from earlier I guess)

--
Cheers,
Piotr Mas=C5=82owski
