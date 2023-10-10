Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F247C4153
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1BA10E3E1;
	Tue, 10 Oct 2023 20:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B453210E3E1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 20:36:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32157c8e4c7so6039788f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696970177; x=1697574977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gLMEvVGbmf7BPPeQS/E70czWupdopX1y8XuMlLKDcXA=;
 b=Qkg/CjlTONawRgP5GR4TFiM1arnHZ0P9fCxAduNruOfzvnVlonFsS6EJbVndQJAFof
 6Hg+jWTdIa5MJBcUYCciXg16Os4lohj1APk9tr6nGVdVD84BXiLjBZJVTtlITUaLe5GA
 Gx8uX8/U8CA3j1SxqCAsNpXWi54cQloazZh0csZCEyt39zzhoNhwNwGusyF+RbOLNSdI
 iwY/ScM9sW7sDr9jenCR/scrBOQ0iVqRH+7nw8i5cBLJYpYniO+s6t32H/EyqGq3U8+3
 F36k80aMaWMyIUpfOVTUKpKt+EOQSp6XI4PrI3szYWpP0gdYjGZ97jbRgt+JWCBlAqhn
 2zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696970177; x=1697574977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gLMEvVGbmf7BPPeQS/E70czWupdopX1y8XuMlLKDcXA=;
 b=q6RZfctBn71+BywGMLmvyGAJywOo4fiWTsfrbu1arYZsRxTKD027z4Je1GuTfjZJkN
 Mn4RzTq3od+IdQzySSDd4oPaGY5dsSaf5knPBcrdBcyeV9rzP1Dau2QboEEgcuxwIC4J
 XVn0orECF16M09J90QRWlbFGK4lWOXlPhwfrKN3ONQVMcYh2AoAh2xUjhinUhQ0DlaA7
 pyRa+5Jr4PYgcwPMo26+fMQRDSFvJojFmpMDg+jzMOq28AP1tUa03kHIEPbcdBpbo2lF
 n/d/swY9M+i4Js0KIFtOMl5yKG9N82tJ0z/dXu3lIQlGdnzlrWWB0R05v1lq9ArThZWK
 a55w==
X-Gm-Message-State: AOJu0YwwuagJqXB3PO6yrNUVRYwJs0I873DEeFaRcZHPDObhV5A0fvzb
 XNRbG8NK6SJ6KE3L4cnjJ9tllg==
X-Google-Smtp-Source: AGHT+IFBEDz1+5oU3WpkeZaaKylWil5wrABkAGjh5kyudxu7O3xK7PKwwdxhynqlILWXgXMHuq5xwg==
X-Received: by 2002:adf:cc81:0:b0:321:5971:23a5 with SMTP id
 p1-20020adfcc81000000b00321597123a5mr16998528wrj.20.1696970177116; 
 Tue, 10 Oct 2023 13:36:17 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a5d538c000000b0032769103ae9sm13558025wrv.69.2023.10.10.13.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:36:16 -0700 (PDT)
Message-ID: <4ce2c3a6-6f66-4fe7-8616-a787a88dd250@linaro.org>
Date: Tue, 10 Oct 2023 21:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: display: document display panel
 occlusions
Content-Language: en-US
To: =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20231009-caleb-notch-example-v1-1-9e0a43ae233c@linaro.org>
 <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CW4UT45DZ5C6.3NIT2IFNSKD4O@andrad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Guido Gunther <agx@sigxcpu.org>, Hector Martin <marcan@marcan.st>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/10/2023 21:01, Piotr Masłowski wrote:
> Hi Caleb,
> 
> Thanks for posting this. I've been meaning to chime in on the discussion
> about notches and co. for months now, so this makes a perfect opportunity
> to finally do so.
> 
> On Mon Oct 9, 2023 at 7:32 PM CEST, Caleb Connolly wrote:
> 
>> Some folks have previously suggested that this information belongs in
>> userspace and not in devicetree. I would like to be clear that
>> devicetree is for describing hardware, and parts of a display which can
>> never actually be seen are very much properties of the underlying
>> hardware.
> 
> Yes, thank you! Seeing the kernel log (or Tuxes) partially hidden behind
> the notch (or the top-left rounded corner) is just so annoying, so DT is
> definitely the way to go here.


Exactly! Glad that others care about the _real_ issue here ;P

[...]
> 
> 
> So why am I writing all of this? Well, the problem I see is that any
> shape-based approach will likely suffer from both accuracy and
> complexity issues. Describing curves is hard and processing them is
> not something that should be included in e.g. whatever handles VTs.

My proposal here doesn't require processing curves or doing any
complicated calculations. If you know that the display has a 30px radius
on all corners, you can adjust the VT to not use the top 30px of the
screen and it will start exactly where the radius stops.

If you know that there is a (potentially very curvy) notch at the top of
the screen, you can just iterate over the arcs, add their radius to
their Y coordinate and take the maximum. This will always give you at
least the height of the notch (you'd probably want to check that their
angle is vaguely downward, but again this is trivial fast integer math).

[...]
> 
> However, there's a different approach that is both extremely simple and
> yet trivially correct – pixel masks!
> 
> Basically, instead of trying to describe what shape a cutout, notch or
> other feature has, we just say which pixels belong to it. In short, this:
> 
> - can be easily processed even by 'dumb' programs – for example, you can
>   derive minimal margins to 'letterbox' the screen

As above (and as mentioned in the patch) this is also trivial to derive
from the curves.
> - gathering the data is very straightforward – just light the relevant
>   pixels one-by-one and check if you see them
> - pixel-perfect accuracy is the default

I think it would be fairly straightforward to do this for curve data
too. You just bump the radius up/down until it looks right, or "good enough"
> 
> Of course this is not a perfect solution. Here are the drawback that I
> can see:
> 
> - low resolution screens mean low resolution data
> - 'smart' programs may or may not need a bit more logic than otherwise
> - sub-pixel accuracy is impossible or requires extending this scheme
>   - non-binary (fractional) weights
>   - partially-occluded pixels on a separate mask (so each feature would
>     have two adjacent masks – for its interior and for the border)
> 
> 
> As a futher improvement, besides looking at pixels we could think about
> subpixels instead. Still, this can easily be added later and likely even
> in a backwards-compatible manner.
> 
> An orthogonal issue is labeling all of those regions. I think we should
> start with fully obscured areas and maybe less readable ones like the
> waterfall edges. Still, different features should live on different
> masks – even if we don't attach meaningfull labels (like 'notch' or
> 'camera cutout') to them right away.
> 
> 
> What do you all think of that? I didn't see this approach considered in
> any of the earlier discussions, yet it seems so elegant to me. Am I
> missing something?

I think the unfortunate truth is that approximating notches and rounded
corners exclusively with regular arcs at the cost of pixel accuracy is
just such a no-brainer. Pixel masks would be pixel accurate, but there
is no benefit compared to a slightly underfit curve.

Any program which wanted to make use of the curve information would have
to run a whole curve fitting algorithm, whereas there simply aren't any
programs which need to know about display occlusions to a pixel-accurate
level. For padding a status bar you do a single trig equation, for
avoiding the notch in fullscreen you would query the DRM subsystem which
presumably would export the dimensions of a letterboxed "usable size".

To be clear though, I wouldn't mind being proven wrong on this, but I'm
yet to find some information which doesn't line up with this conclusion.
> 
> --
> Cheers,
> Piotr Masłowski

-- 
// Caleb (they/them)
