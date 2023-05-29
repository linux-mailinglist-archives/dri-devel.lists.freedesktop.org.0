Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C77E7151DF
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7A810E305;
	Mon, 29 May 2023 22:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D196310E305
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:33:44 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DCCD5202FB;
 Tue, 30 May 2023 00:33:40 +0200 (CEST)
Date: Tue, 30 May 2023 00:33:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RFC 08/10] drm/panel/samsung-sofef03: Add panel driver
 for Sony Xperia 5 II
Message-ID: <gytain3f3sjvz6q2rm7fv7jqn3til7leqxdvqx4zhlefylilbh@gpsdwmxtev3s>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-8-541c341d6bee@somainline.org>
 <4679c741-7877-ce79-4086-08ec4ee9e6bf@linaro.org>
 <cf5dea0f-5999-6ac4-4f04-9b397ca94fdb@linaro.org>
 <g2f7oeoo5dljqpl7mwguoh5c766obe7vfltc2vlhx4c2na5ymm@pr2p6l5vewq5>
 <80372e51-e72f-e70e-c205-8bd79ad57515@linaro.org>
 <3839853f-eca7-5ff2-db90-51c014baff06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3839853f-eca7-5ff2-db90-51c014baff06@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-30 01:22:54, Dmitry Baryshkov wrote:
> On 30/05/2023 00:29, Konrad Dybcio wrote:
> > 
> > 
> > On 29.05.2023 23:21, Marijn Suijten wrote:
> >> On 2023-05-22 11:08:12, Neil Armstrong wrote:
> >>> On 22/05/2023 03:23, Dmitry Baryshkov wrote:
> >>>> On 22/05/2023 00:23, Marijn Suijten wrote:
> >>>>> The SOFEF03-M Display-IC paired with an unknown panel in the Sony Xperia
> >>>>> 5 II always uses Display Stream Compression 1.1 and features a 60hz and
> >>>>> 120hz refresh-rate mode.
> >>>>>
> >>>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >>>>
> >>>> Konrad's S-o-b is also required then
> >>
> >> I am unsure what to include here, since Konrad originally "authored" the
> >> commit but I believe it was nothing more than a completely broken and
> >> unusable driver spit out by "The mdss panel generator".  This needed
> >> enough rewriting that I don't feel like giving it much credit ;)
> > Might have been. I won't be mad if you drop this!
> 
> I'd say, either add S-o-B, or drop C-D-B. The Co-developed-by should 
> always come with the Signed-of-by, otherwise one can not be sure that 
> the co-developer didn't copy-paste some super-proprietary stolen code.

That is effectively what the downstream command sequences are, with
their meaning removed :P

I'll drop it then, that makes most sense I think.

- Marijn
