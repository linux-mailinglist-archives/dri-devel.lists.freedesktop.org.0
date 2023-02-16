Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72951699DC2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD7510E367;
	Thu, 16 Feb 2023 20:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0323610E367
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RwVo/ALcWIpGinZ1s9D75KZF+KPdKYR8FBxJdE2XfKk=;
 b=sU3kJzbeVFnT7Bi/tJrQIZDCfHjs/ACWr5eOtR1wuHwVP4vg9mBPCrz+oUxO7UwYCuoz9wOqDgOzP
 E6eE5ywF2lp0nPjZKvnYZFAXURdhz6fMIvBRYtlevw+PO6CnFsv6B8ANF12DV1LctdFYw7bzednVLD
 BvNQAuo5/CSMVApVVXe+cliHYTgbS74e1d1QLmkSNayCeOwadx0IDoq+7paIiPeoFv1GuvxUGbXOoa
 zZhEJ+tdZ0gZ1KP2lFeuLvuUL3TKzsqwhXFO/CSj/H1HKwq7dteUjWcRnMYTPUO7GXIW5iIv2+4EFS
 gAQx7AygFqPhHbJ/4CoAE4QmLB4+9mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RwVo/ALcWIpGinZ1s9D75KZF+KPdKYR8FBxJdE2XfKk=;
 b=pBKQRnGVJo45A/dO+VtmP6xrEVE31OJL10zrQFlkfQE9ivyYcu+FsRzv0R+goBoVAeyZSlTqwHmMw
 +fDu3VHAQ==
X-HalOne-ID: 0b10656d-ae39-11ed-be47-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 0b10656d-ae39-11ed-be47-ede074c87fad;
 Thu, 16 Feb 2023 20:32:35 +0000 (UTC)
Date: Thu, 16 Feb 2023 21:32:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 2/2] gpu/drm/panel: Add Sony TD4353 JDI panel driver
Message-ID: <Y+6S4o4nfG+XqAsF@ravnborg.org>
References: <20230119163201.580858-1-konrad.dybcio@linaro.org>
 <20230119163201.580858-2-konrad.dybcio@linaro.org>
 <725a5727-fdde-e3ae-a448-2679c5c4c7f4@linaro.org>
 <CAKMK7uFpc3Kg=Ym6ee_JTZo-0h2ig7Twtf2uwE7oV-1c6YRP=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFpc3Kg=Ym6ee_JTZo-0h2ig7Twtf2uwE7oV-1c6YRP=Q@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, krzysztof.kozlowski@linaro.org,
 agross@kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 01:32:22PM +0100, Daniel Vetter wrote:
> On Thu, 16 Feb 2023 at 12:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >
> >
> >
> > On 19.01.2023 17:32, Konrad Dybcio wrote:
> > > From: Konrad Dybcio <konrad.dybcio@somainline.org>
> > >
> > > Add support for the Sony TD4353 JDI 2160x1080 display panel used in
> > > some Sony Xperia XZ2 and XZ2 Compact smartphones. Due to the specifics
> > > of smartphone manufacturing, it is impossible to retrieve a better name
> > > for this panel.
> > >
> > > This revision adds support for the default 60 Hz configuration, however
> > > there could possibly be some room for expansion, as the display panels
> > > used on Sony devices have historically been capable of >2x refresh rate
> > > overclocking.
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > Are there any outstanding issues with this driver, or perhaps I did
> > not CC some important list? It has gotten very little activity ever
> > since its initial submission around Sept'22..
> 
> Sam is usually picking up panel drivers these days, but maybe we need
> a bit more help in this area?
Time for Linux has been low for more than two years now.
Some life factors such as buying an older house and new responsibilities
at my $daytime job.
I may resurface and do something consistent one day, but consider me
unreliable. Sorry!

	Sam
