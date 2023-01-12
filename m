Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75F668616
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 22:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8D610E92D;
	Thu, 12 Jan 2023 21:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C6B10E92C;
 Thu, 12 Jan 2023 21:50:23 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1442977d77dso20394676fac.6; 
 Thu, 12 Jan 2023 13:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pt9a9FTky98yU2jJUKa3hat4M8RZa/qGbkgw4+4ead0=;
 b=SuVjDOInABzilkxylfCUsapBSgyO2mGx5Emj7TPqXRLFTmYIvnEARRPZGyk5ia8wKU
 WVmxqFkUFVWtJbAuVL/3ARLthq/sGOeS8NfflbABonn2yLOJ/YP7vh5pwHUkANDlGZPC
 OLq9L5QMsNIcQjKJ1sYX+OrNDOW+pf5q6ODum1wzhzSPsEk3c2L6Qv0w0lu7FpW5Qx/i
 d79BAAKMzm3aWLMgN/Kq/TE5rVlGIXWJmJhe9c1tCyMZFARYvuQoUS9tEYVEuX63TCs6
 JFoMT5CAaFdOOhO51nh2xmMjqszTq0org+sHvDSKzOCMKOQx1fn4aiSFWL36NVuVFAnt
 vDFQ==
X-Gm-Message-State: AFqh2kpHm4/aMfsEs31PlJUVmXaSuRSIlaqlbWon3Q3Rw7OE7E5Zawn/
 VB7ZL2UAbhmnmqlJeHYK4Q==
X-Google-Smtp-Source: AMrXdXtdTgojCFd9LO4w7xqLSVo9gQEqcuSIu/CV1U6mGVhTBvnN93Y5zJ4abtPbRJrgfYBsHwhIoA==
X-Received: by 2002:a05:6870:bd46:b0:14f:7db1:68b2 with SMTP id
 og6-20020a056870bd4600b0014f7db168b2mr30725597oab.59.1673560222230; 
 Thu, 12 Jan 2023 13:50:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r10-20020a05687032ca00b0014ff15936casm9482066oac.40.2023.01.12.13.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 13:50:16 -0800 (PST)
Received: (nullmailer pid 281268 invoked by uid 1000);
 Thu, 12 Jan 2023 21:50:15 -0000
Date: Thu, 12 Jan 2023 15:50:15 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Message-ID: <20230112215015.GA259261-robh@kernel.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
 <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
 <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
 <1d371e40-0639-16f8-abef-afcd05e72e22@linaro.org>
 <20230111223553.e3xrxmdys5zxxleh@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111223553.e3xrxmdys5zxxleh@SoMainline.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 11:35:53PM +0100, Marijn Suijten wrote:
> On 2023-01-12 00:31:33, Dmitry Baryshkov wrote:
> > On 12/01/2023 00:29, Marijn Suijten wrote:
> > > On 2023-01-10 06:40:27, Dmitry Baryshkov wrote:
> > >> On 09/01/2023 09:49, Marijn Suijten wrote:
> > >>> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
> > > <snip>
> > >>>> +    description: |
> > >>>
> > >>> Should multiline descriptions be treated as a oneline string with `>`?

Depends if you want to keep paragraphs. Generally, we use '|' or 
nothing. If just a colon (or ???), then I think you want '>'.

I get tired of saying to drop unnecessary '|' in reviews. It would be 
nice to analyze the text to check what's needed automatically.


> > >> Ack, I'm fine with either of them, let's use the >
> > >>
> > >>>
> > >>>> +      Contains the list of output ports from DPU device. These ports
> > >>>> +      connect to interfaces that are external to the DPU hardware,
> > >>>> +      such as DSI, DP etc. MDP5 devices support up to 4 ports::
> > >>>
> > >>> How do these double colons render?  Is this intentional?
> > >>
> > >> double colons is an escape for a single colon if I remember correcly.
> > > 
> > > I thought no escaping was necessary here, especially since this is
> > > already a value - it is a multiline string.
> > 
> > I was mostly following examples, grep :: through the dt-bindings.
> 
> Saw that, maybe these "freeform" description strings are intended to be
> RST to support more elaborate rendering if/when that happens?

No, though some experiments have been done in that regard. It seemed to 
work.

> > >> BTW: how to render the DT schema?
> > > 
> > > I'm not sure if there's currently any rendering tool to view these docs
> > > in a "friendly" manner, e.g. an html page, or whether they're only used
> > > as specifications for DT validation.
> > 
> > Probably there will be one at some point. It might make good addition to 
> > devicetree.org.
> 
> Would be super cool to have some "interactive" / properly
> rendered/colored docs up there for DT :)

One of the original goals was to transform the DT spec to schema docs 
and then generate the spec from the schemas.

There's tools that do json-schema to docs already. They may just work. I 
haven't looked at them though as that's not really my itch and I simply 
don't have time. Maybe if we stop reviewing schemas for a while.

Rob
