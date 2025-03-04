Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF57A4D928
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E31210E551;
	Tue,  4 Mar 2025 09:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NyQHqIu1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EF710E556
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:49:02 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e60b75f8723so2758964276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 01:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741081741; x=1741686541; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xAFeC7v0K/Wf/c7Ozud0jqrvhCdvL6NyonulbYWM8i4=;
 b=NyQHqIu11HqoooyNxFyEsDYR0vu3WTXEUu1KmtQOQluX1fCKEv2iqGiuc4MsGK1d6L
 uIYoQnvGDH9aYrr5WqfvePZS/aSWbDV9NXyks+KLIRM01uCTQ3DhswAwHzlRsQdmWQZn
 neEUQA0L928OJ26NuHvMQwfapiRh0qbDaWywhNtRxnZhRiiuXMdxN47sJ8IQTC/m6d0K
 Vw/QAs+cPXAbYTUEs8VCkClTMuzfAeSz8InHgFiV+lduULu4R79YPagulKepeSmhtu60
 mpeuRMUuinLw5++N9m60Va/HpCd4h+jz3CSADaqbNC6fkr8oVjF6sLVPdPagUTz+d0jl
 +nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741081741; x=1741686541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAFeC7v0K/Wf/c7Ozud0jqrvhCdvL6NyonulbYWM8i4=;
 b=TiNJqPPIc9Z7hDyqdtINrVLq63dXFAU6Zc7pybvnJEXMzq7aab7DirMYcHY0zgmo1i
 7UpdmOqG74aaT5mYMv81gNGhiu5ldrUotcXx1M6JSs/guM5ZAjMvOqkRSBmjrbQEB8oa
 SxlQ6cI0g4WccKLXcrTSaYkJmhE7hZopk3Ro5rXv8ISSjV3VtA9yqyvvzWIFWovkKBaO
 K+otFQwo7VDtSdWC7wXa4tbFAfhqbZkfMln/jy/pn8cLof9RZkcPmZd0l3hIHrlpmnuE
 c8PV+hOOy0OFTxFVTA9SpYi6FUhWJLq/9vO2nhCcP9oGjEOxyIP9q4tEg4tZUqt9ZnOj
 k3Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZfMl1lEq5is28dIZAoeISWdGa4u+liQ6MHyrMyLBpd36q5vhbURhATQsLSDTFhNNm7FBpQED70Dc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaNFXuY8RsSBMrULS7UdQywndhtx+oDbB7373QYBKsB8VLIlfm
 Z3BsChf5KicJTepu2xhDkmJM00RTTMA2fnVvuEzkU2yg8VrbR+YSwpec8JQP6G8iK/HFCimBmUK
 a9wRk8aDKFartRGxQAjOKGOfiIF4yoqYUp5douw==
X-Gm-Gg: ASbGnctlQVr0ar2k6e0oJphsiKeO4QZh6NU5ba6f3YIXn2kSrI+0n1vkaxr+6eQMnCK
 TiyR9vXYWYreNrx4yZNBxBtiPAamt28h1/q6g9PCSxfg+H+33OvI4efbLwzCKVatAVcb9gEJn5R
 UoL1NijIz4ltvvfXryV0FcFXBR
X-Google-Smtp-Source: AGHT+IH/3wcPaD28Oev/VK7lwAdhAYZD7JpdPaR8LyOphfZ0NEOtUEyEWzQ0aF4wOq/ViWPq3UF+ppzxkbbdoIKe3xM=
X-Received: by 2002:a05:6902:1502:b0:e5d:c798:146f with SMTP id
 3f1490d57ef6-e60b2e91f9dmr19189965276.2.1741081741421; Tue, 04 Mar 2025
 01:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-9-quic_amakhija@quicinc.com>
 <tfd27qk543dt4sqcawogoszsjax3cqxmi6mcy3qd2mwzauedpf@l6xmy5okswrd>
 <5293f723-2a27-4d2a-8939-059226d460c3@quicinc.com>
In-Reply-To: <5293f723-2a27-4d2a-8939-059226d460c3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Mar 2025 10:48:50 +0100
X-Gm-Features: AQ5f1JruB_dwDjDw-42xWSBYe86aTlm19wISZt5Y85qlOfGWNvQ3_K00_1IWvio
Message-ID: <CAA8EJpoTQ5cg-rM=A3C8-VKbd973vMEKDbrkNFpbB9soCgewzQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sa8775p-ride: enable Display
 serial interface
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, 
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
 quic_jesszhan@quicinc.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Mar 2025 at 10:45, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>
> On 2/25/2025 11:25 PM, Dmitry Baryshkov wrote:
> > On Tue, Feb 25, 2025 at 05:48:21PM +0530, Ayushi Makhija wrote:
> >> Enable both DSI to DP bridge ports on SA8775P Ride plaftrom.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 66 +++++++++++++++++++++-
> >>  1 file changed, 64 insertions(+), 2 deletions(-)
> >
> > Please squash into the previous patch. It doesn't make a lot of sense separately.
> >
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> index 151f66512303..02d8a9c2c909 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >> @@ -128,6 +128,30 @@ dp1_connector_in: endpoint {
> >>                      };
> >>              };
> >>      };
> >> +
> >> +    dsi0-connector {
> >
> > dpN-connector. It is not DSI.
>
> Hi Dmitry, Konrad
>
> Thanks, for the review.
>
> I will change dsi0-connector -> dp2-connector and dsi1-connector -> dp3-connector respectively.

Why? It's then dp-dsi0-connector. I think the board has DP2 and DP3
(please correct me if I'm wrong). How would you name those if you use
those indices for DSI connectors?

>
> >
> >> +            compatible = "dp-connector";
> >> +            label = "DSI0";
> >
> > Is it an actual label on it?
>
> The label for DSI to DP bridge ports itself on the device is DSI0 and DSI1 respectively.

Ack


-- 
With best wishes
Dmitry
