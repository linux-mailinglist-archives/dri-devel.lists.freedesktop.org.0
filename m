Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D0A752760
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 17:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DE310E702;
	Thu, 13 Jul 2023 15:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5FC10E6FC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 15:37:07 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a3efee1d44so673466b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689262627; x=1691854627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=we2PYWjlXrhf7YA5e50pSB3r3uKJBwJBvyfkN3HQeHI=;
 b=jMNUKRnZu8Z9jSGLeckxay0T8TRTDjnZxzKefYi0imrqcnKVB3IhTK7zFuCr2uuEQ5
 jenRNsz1alc0k8aXcyY5Bs/btNLljJNoOVT84Gr0oPeMxSxh/HTFIsI9c/GeN8Cyx4UH
 vo3GFRDjiAt+ugCCt6dgTQ+Vcx4nuppHQlE8g7YPimWWFAlirtPvc05aRFKH45c6/sBv
 kQ3lyF7vt7epH7iWyFw7yRaNWH3jjwc+shRQXCjrYOBv/go4w6DuzpNGbygMFwSsByhW
 8oqvBhZdd8hv+S1z/PpM9UyxfF696BM/EhBJjdyoZ9Nxy2CaIH4vHoMwupbf8Llq1/HL
 79YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689262627; x=1691854627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=we2PYWjlXrhf7YA5e50pSB3r3uKJBwJBvyfkN3HQeHI=;
 b=WjwM54/AiH2oNK/yi9caI3wx0J9507CA5jV/5Oye9AMNv/doZSpSXd5k3gmY7tpAAL
 1tPB3kN92s8WaKQRNyqTFZBxvvV/1k7WCMMT2tkb61SqE+Bv5pDkSeZhOLZckveQE/zX
 1F2eetoFksRzIRDwk+w3b0vWyKqDyi7DECYFYoRAPQ5x9vDCqAJHPpKrLJFIdOiNviUJ
 DrJ66/ZIbPYUkSAGIlGW5yGd07gvmSvhr6HTx0+cMjKLhhfC3OdGyYwIMQm21s7ClIoA
 8DVX/WNCZTKi2sfa3SdFlgeYMvQbWNtRI1C8TBQYznBXxyQE5ahqlrYpPHPI2TeOQieQ
 kwXw==
X-Gm-Message-State: ABy/qLa0DHidN3KYj1xWFpMqQGm0CvdIf2p96TB53mc5oArb9p+St3Vr
 HRJd6toy6KRnanPu7/x7aeYbPnbUj8RjZSTlQNspng==
X-Google-Smtp-Source: APBJJlFupxhatozrXXQGBsLkH0UoI4gbrCdVoIWQ8DB4C6TFi0/i/sIdPC2//Y8yr4CidadlI0nBRPG6IdE52wzL9qk=
X-Received: by 2002:a05:6808:200f:b0:3a4:189b:53a9 with SMTP id
 q15-20020a056808200f00b003a4189b53a9mr2381742oiw.33.1689262626794; Thu, 13
 Jul 2023 08:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130215.666924-1-amit.pundir@linaro.org>
 <c3ea2043-5d02-3a6f-ecb7-fb90d989bc6f@linaro.org>
In-Reply-To: <c3ea2043-5d02-3a6f-ecb7-fb90d989bc6f@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 13 Jul 2023 21:06:30 +0530
Message-ID: <CAMi1Hd1Z230Vmb1aDS4ns29y6q1c8ZmhWGHArBGJQDq6KSLoQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: qcom,sdm845-mdss: add
 memory-region property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>,
 dt <devicetree@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 at 19:46, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/07/2023 15:02, Amit Pundir wrote:
> > Add and document the reserved memory region property
> > in the qcom,sdm845-mdss schema.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>
> Please keep consistent versioning, so this is new patch in v4.

ACK.

>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > index 6ecb00920d7f..3ea1dbd7e317 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> > @@ -39,6 +39,11 @@ properties:
> >    interconnect-names:
> >      maxItems: 2
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description:
> > +      Phandle to a node describing a reserved memory region.
>
> Your description says nothing new. It's entirely redundant/obvious.
> Instead please describe what reserved memory is expected to be here.

On it. I'll update in v5. Thanks.

Regards,
Amit Pundir

>
>
> Best regards,
> Krzysztof
>
