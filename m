Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55CB67967D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 12:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DE610E663;
	Tue, 24 Jan 2023 11:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE11110E077
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 11:20:46 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 10C6C419BC;
 Tue, 24 Jan 2023 12:20:45 +0100 (CET)
Date: Tue, 24 Jan 2023 12:20:43 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Message-ID: <20230124112043.4pzhbc3thgorjr2g@SoMainline.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
 <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
 <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
 <1d371e40-0639-16f8-abef-afcd05e72e22@linaro.org>
 <20230111223553.e3xrxmdys5zxxleh@SoMainline.org>
 <20230112215015.GA259261-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112215015.GA259261-robh@kernel.org>
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

On 2023-01-12 15:50:15, Rob Herring wrote:
> On Wed, Jan 11, 2023 at 11:35:53PM +0100, Marijn Suijten wrote:
> > On 2023-01-12 00:31:33, Dmitry Baryshkov wrote:
> > > On 12/01/2023 00:29, Marijn Suijten wrote:
> > > > On 2023-01-10 06:40:27, Dmitry Baryshkov wrote:
> > > >> On 09/01/2023 09:49, Marijn Suijten wrote:
> > > >>> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
> > > > <snip>
> > > >>>> +    description: |
> > > >>>
> > > >>> Should multiline descriptions be treated as a oneline string with `>`?
> 
> Depends if you want to keep paragraphs. Generally, we use '|' or 
> nothing. If just a colon (or ???), then I think you want '>'.

But doesn't that also affect how lines within paragraphs are flowed?
Arguably it's only GitHub that doesn't "ignore" manual single newlines,
the Markdown (and maybe also RST?) spec AFAIK state that multiline
blocks will be turned into a single paragraph (automatically reflowing
to width).

> I get tired of saying to drop unnecessary '|' in reviews. It would be 
> nice to analyze the text to check what's needed automatically.

And that's just one of the many things...

> > > >> Ack, I'm fine with either of them, let's use the >
> > > >>
> > > >>>
> > > >>>> +      Contains the list of output ports from DPU device. These ports
> > > >>>> +      connect to interfaces that are external to the DPU hardware,
> > > >>>> +      such as DSI, DP etc. MDP5 devices support up to 4 ports::
> > > >>>
> > > >>> How do these double colons render?  Is this intentional?
> > > >>
> > > >> double colons is an escape for a single colon if I remember correcly.
> > > > 
> > > > I thought no escaping was necessary here, especially since this is
> > > > already a value - it is a multiline string.
> > > 
> > > I was mostly following examples, grep :: through the dt-bindings.
> > 
> > Saw that, maybe these "freeform" description strings are intended to be
> > RST to support more elaborate rendering if/when that happens?
> 
> No, though some experiments have been done in that regard. It seemed to 
> work.

Hmm, the question is what format description blocks should adhere to,
and if a double colon here makes sense and/or is required?

> > > >> BTW: how to render the DT schema?
> > > > 
> > > > I'm not sure if there's currently any rendering tool to view these docs
> > > > in a "friendly" manner, e.g. an html page, or whether they're only used
> > > > as specifications for DT validation.
> > > 
> > > Probably there will be one at some point. It might make good addition to 
> > > devicetree.org.
> > 
> > Would be super cool to have some "interactive" / properly
> > rendered/colored docs up there for DT :)
> 
> One of the original goals was to transform the DT spec to schema docs 
> and then generate the spec from the schemas.
> 
> There's tools that do json-schema to docs already. They may just work. I 
> haven't looked at them though as that's not really my itch and I simply 
> don't have time. Maybe if we stop reviewing schemas for a while.

Sure, as above we shoudn't have to render anything now nor any time
soon, but it would be helpful to know what kind of format to adhere to
in description blocks.

- Marijn
