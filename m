Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085E4AE670
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 03:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F9110E32B;
	Wed,  9 Feb 2022 02:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B9B10E195;
 Wed,  9 Feb 2022 02:23:06 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 b12-20020a9d754c000000b0059eb935359eso561829otl.8; 
 Tue, 08 Feb 2022 18:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tis6lVw2PLJGVs82tjcRt6cxHYbiIdScfbv50bSZkAA=;
 b=NCd/wiXTXWRl0v4cwZ1N21UMpgu0u6H1qrmjJf/c+4zp5t+DqQqmk6z/6UPhPwbkf2
 fXZ6v1epBorPJ4ZM7toT7GjrzmsK0luLS/ZN8yDAFU2HgInPXdTUA7V73rPpaNTaolLm
 0/dbNGUArpnK8EOPLZeFWl9+i2Z9dApoOQ3TwNLgzJ85AmdZXubMksnyu1J0YO8g14ho
 9kN8G9KLpYVQPYduWubHUT8rnLy2xzKvewhXNY0xy9HwdneiXzeI8M6cCVZ165SQEMGh
 TbfJOPCYhb09ArG6PA9Z4SMQhd8XDnwEv6Wptn7Y1kGTnyg4cNdNBizS2J+e0B0s6YdK
 tmgg==
X-Gm-Message-State: AOAM530ADUkaZEg/gFiXCRDmzuJVPOX3DuMd6TMAmdSKqya9JnFPR9Ih
 RbIcYFZLaZvDfA+ekeeLnw==
X-Google-Smtp-Source: ABdhPJx30puFBSvWskIek8ojwuP/YiGbti3XK4ncDay0tM5RF63NNRqcb2uE8oFCEln61PxVJogJ8g==
X-Received: by 2002:a05:6830:108f:: with SMTP id
 y15mr102448oto.185.1644373385594; 
 Tue, 08 Feb 2022 18:23:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l22sm6084220otj.44.2022.02.08.18.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 18:23:04 -0800 (PST)
Received: (nullmailer pid 3480838 invoked by uid 1000);
 Wed, 09 Feb 2022 02:23:03 -0000
Date: Tue, 8 Feb 2022 20:23:03 -0600
From: Rob Herring <robh@kernel.org>
To: Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 3/3] dt-bindings: display: msm: Add binding for msm8998 dpu
Message-ID: <YgMlh69HUntgxAew@robh.at.kernel.org>
References: <20220113145111.29984-1-jami.kettunen@somainline.org>
 <20220113145111.29984-4-jami.kettunen@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113145111.29984-4-jami.kettunen@somainline.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jan 2022 16:51:11 +0200, Jami Kettunen wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Add yaml binding for msm8998 dpu1 support.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Jami Kettunen <jami.kettunen@somainline.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 219 ++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
