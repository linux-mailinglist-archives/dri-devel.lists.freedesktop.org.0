Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D615EA9E5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CE910E6D5;
	Mon, 26 Sep 2022 15:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B1D10E460;
 Mon, 26 Sep 2022 15:13:04 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-12803ac8113so9620289fac.8; 
 Mon, 26 Sep 2022 08:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=N5zD8itGsjXgN7u5GbMQZZht7UZJCrojZyw1yQR9ywk=;
 b=dNMD74uUaTQpoo6dFuiQEIEO6cFoBnNkNgf0muLfs8ZkeCX7Qd0F86I+hBam5JSC85
 upcondLnI6vy6v9WHsg7dkVO7iTE4E7cw2QK6WoI+DoiVrgQgOz3v5xgdix9+b1hZ7jq
 kNi6xX8kExhU1ECPsy+PQpTV+edPoX4pmVQOKquU2ovi1WHoTOv2e6UI+xj3BxoV43o9
 8X6YxRusZw1Xao+Kx0Wg9NwxRVuEix86gv8BCgpZdiIumuv60U2vqK9l+sZZ9LuDP8DD
 BkdIWY057LBAJrSqufsWrJKCucryXNiJO6kJMvmMycuuOg2AHRjBfs3yDXighI1cyRzS
 CcZQ==
X-Gm-Message-State: ACrzQf2XiOXqWKT1h3UVbidr2ZtsbKERohc+D8gUeizCF8YsHzo4qjn3
 4+rIQHfM2S/oyRnCX3SUpA==
X-Google-Smtp-Source: AMsMyM4o9ytcOGwlT69mDGuQ5FCedY8pZACfPmctgBWZL50ej+sPLaNEuq93Q1Vl05KIUqsS8B5VBw==
X-Received: by 2002:a05:6870:828f:b0:126:19ae:68d9 with SMTP id
 q15-20020a056870828f00b0012619ae68d9mr19095618oae.116.1664205183361; 
 Mon, 26 Sep 2022 08:13:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l25-20020a9d6a99000000b0063695ad0cbesm7961315otq.66.2022.09.26.08.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:13:02 -0700 (PDT)
Received: (nullmailer pid 1929738 invoked by uid 1000);
 Mon, 26 Sep 2022 15:13:02 -0000
Date: Mon, 26 Sep 2022 10:13:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Message-ID: <20220926151302.GA1880039-robh@kernel.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
 <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
 <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
 <6b242b44-b657-c7a6-63ca-465c7031376f@linaro.org>
 <20220922001429.zqfap3clprvlo6jo@builder.lan>
 <acd9ff20-a07b-05ab-6f4b-34e3e8b1cae8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd9ff20-a07b-05ab-6f4b-34e3e8b1cae8@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 05:37:39PM +0200, Krzysztof Kozlowski wrote:
> On 22/09/2022 02:14, Bjorn Andersson wrote:
> > On Tue, Sep 20, 2022 at 09:09:13AM +0200, Krzysztof Kozlowski wrote:
> >> On 19/09/2022 23:18, Bjorn Andersson wrote:
> >>> On Sat, Sep 17, 2022 at 06:03:27PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 16/09/2022 21:00, Bjorn Andersson wrote:
> >>>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>>>
> >>>>> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> >>>>> Qualcomm SDM845 and SC8280XP platforms.
> >>>>>
> >>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> >>>>
> >>>> No need for quicinc SoB (unless you also take ownership).
> >>>>
> >>>
> >>> It's my understanding that both needs to be there. Bjorn @ Linaro
> >>> authored the patch and the author must certify its origin, but as the
> >>> submitter I must certify its origin.
> >>
> >> It's the same person. There are no two Bjorns (unless there are :) ), so
> >> you certify with old email. SoB chain is coming from people, not email
> >> addresses.
> >>
> > 
> > IANAL, but I don't think it's the same person. I can't use my old
> > signature to certify the origin in a contribution today and I can't
> > claim authorship of something Linaro did.
> 
> Fine with me.
> 
> > 
> >> And it is not only my understanding of SoB chain.
> >> https://lore.kernel.org/all/YuKcBO5JatwRYQJ3@kroah.com/
> >>
> > 
> > Again, IANAL, but I think the situation is different given AMD and
> > Xilinx relationship.
> 
> Hm, I am not sure how it is different. We might know or we might know
> the change of ownership. Maybe the change of owner came with copyrights,
> maybe not (someone else bought them). I don't know, there can be many
> cases here. I interpret Greg's point there as in SoB statement - the
> person, not email address, certifies.

If Bjorn owned the copyright, then yeah, 1 email would be enough. But 
Linaro owned the copyright so it should be there.

Rob
