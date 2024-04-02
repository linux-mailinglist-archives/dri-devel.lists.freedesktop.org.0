Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5E895E2B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 22:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16510FE2C;
	Tue,  2 Apr 2024 20:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8370D10FE2C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 20:59:15 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 143DF20288;
 Tue,  2 Apr 2024 22:59:13 +0200 (CEST)
Date: Tue, 2 Apr 2024 22:59:11 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v3 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Message-ID: <t3cx5qxiteer27vsvysizbrxkbamxgrcbn2oafisodjopwas5z@nxlasb4rlnml>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-1-144f17a11a56@linaro.org>
 <9fbb9058-ccfe-436d-b413-b3ba27e4e5f9@linaro.org>
 <CAA8EJprwWd=ZtwnpTm3cVP8RBEqxCcSGyBu-bHj=iV=+X2=FyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprwWd=ZtwnpTm3cVP8RBEqxCcSGyBu-bHj=iV=+X2=FyQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-04-02 10:23:22, Dmitry Baryshkov wrote:
> On Tue, 2 Apr 2024 at 09:31, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 02/04/2024 01:51, Dmitry Baryshkov wrote:
> > > From: Sumit Semwal <sumit.semwal@linaro.org>
> > >
> > > LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
> > > phones.
> > >
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > > [caleb: convert to yaml]
> > > Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> >
> > Tags missing.
> >
> > `b4 trailers -u`
> 
> Excuse me, I keep on forgetting it.

Does a similar thing exist for adding Cc: tags for all reviewers/replyers to an
earlier version, even if said reviewer didn't yet provide R-b/A-b or other tags?

I'd like to have the next revisions in my inbox as well after leaving
comments :)

Thanks! - Marijn
