Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023517E661
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 19:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A93D6E198;
	Mon,  9 Mar 2020 18:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5956E0CC;
 Mon,  9 Mar 2020 18:07:01 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j14so10517695otq.3;
 Mon, 09 Mar 2020 11:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+8twmAkYC8gLumwmIlw3+TNjk4YZIpc4Yf4Svt7khAE=;
 b=PIYzmECT1ltubFpAFDyRXMA8iWCFx7I4+88MSNTP8UXfAJ16pnB1QDBF7smzl0AbzG
 tIBnIsb1NRUwS7MP0IE8MGW0QxqrMcxdEjIfogXOs80+9A9iMQlUFDHKzdFVbu+BCpO6
 JO02SuEVvUwnCbYQp6kgB36BE3zb77hlBqjYkxdxZlXygUdfuQKgF2KCQ+EkS681EVlS
 z+1YZquaTykAZl09bgdHT6/IHY+eEdAWmm5VVpDfTrZRfpZxVVAIgpYOFNCPrhYx5gzG
 /ApaANeL/qqCBdF+eTBvTrb90EuTBkOmT/Bla1mTtxPWLQJKA1kb4YSeHiXpZPJADwFZ
 91RA==
X-Gm-Message-State: ANhLgQ3aEPBKan9Koqcnba2zQFmXqgNhoz56gKDWCxr1777LWLOHqKKt
 KMWut6B0w3UiNWgkY2y1Ow==
X-Google-Smtp-Source: ADFU+vs3IQ3wz+qJ/67vqIo0mD/X0qf+y/Hptx7ec/9FGLi0njnEexI24zE2V0heF26J/Ax0sA1e+g==
X-Received: by 2002:a9d:5f7:: with SMTP id 110mr8301002otd.73.1583777220691;
 Mon, 09 Mar 2020 11:07:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t193sm3355321oif.34.2020.03.09.11.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 11:06:59 -0700 (PDT)
Received: (nullmailer pid 18575 invoked by uid 1000);
 Mon, 09 Mar 2020 18:06:58 -0000
Date: Mon, 9 Mar 2020 13:06:58 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [v1] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Message-ID: <20200309180658.GA15631@bogus>
References: <1583494560-25336-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583494560-25336-1-git-send-email-mkrishn@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  6 Mar 2020 17:06:00 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem(MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 269 +++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 265 +++++++++++++++
>  .../bindings/display/msm/dsi-sc7180.yaml           | 369 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-sdm845.yaml           | 369 +++++++++++++++++++++
>  4 files changed, 1272 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-sdm845.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dts:17:10: fatal error: dt-bindings/clock/qcom,dispcc-sc7180.h: No such file or directory
 #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1250230
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
