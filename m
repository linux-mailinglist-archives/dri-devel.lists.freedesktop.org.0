Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F71FF9E6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 19:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305DA6EB95;
	Thu, 18 Jun 2020 17:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E786EB95
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 17:06:59 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id p5so6514051ile.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 10:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ifwduw78OWeOcpzj0vaqe6BciVp2voLLjsFlxgZqSlI=;
 b=if2lUzRdVaLP+QvKx44l7C2UDm3U0F6EBzN5lIYW1ZaxS6uDFwDUewlXAGz+8CXiKW
 UH+Eu70XY7zv1siWyK9rv2u2/IqLk4Uk95NqZJ1i9sHtX5w9e4AheoX2P1p50vaslAsF
 L+w+49/Hl30FwEVYSUVDota4KN5mi83NoW5natWi/PVXc3zuMAF0MBzyYZEeDd+1BwBZ
 rXDGgIJWYTxs72EU290kBpttU3gbMt9mha8KWRpfsHP4xEXN2Rg8djthBdHhxdVsnQHH
 MD+9ytcbj58VwxPpccI3tRkJLcthsivbW3fQMXTuopHEkpErE4mFEsBWulIzYRRsAxnx
 Wk0A==
X-Gm-Message-State: AOAM5329Hl9CU0Mnr04mIjEG1iimdzY0Hpl/2j4Tjz+6u1wmA4nrwLGN
 JS8lRCngfzmmCoFA+qOSZA==
X-Google-Smtp-Source: ABdhPJw81b3DAZIj3aCC5G7vPDZFbqJcRdJgtLBQ9xQ+fmU3vdQcz/N22q4w5tMZcBkmXm4va6tTMA==
X-Received: by 2002:a92:35dd:: with SMTP id c90mr5272835ilf.103.1592500019001; 
 Thu, 18 Jun 2020 10:06:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x18sm1732593ilq.46.2020.06.18.10.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 10:06:58 -0700 (PDT)
Received: (nullmailer pid 539747 invoked by uid 1000);
 Thu, 18 Jun 2020 17:06:56 -0000
Date: Thu, 18 Jun 2020 11:06:56 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 14/29] dt: Fix broken references to renamed docs
Message-ID: <20200618170656.GA539608@bogus>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <6866c0d6d10ce36bb151c2d3752a20eb5122c532.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6866c0d6d10ce36bb151c2d3752a20eb5122c532.1592203542.git.mchehab+huawei@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andy Gross <agross@kernel.org>, linux-spi@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Jun 2020 08:46:53 +0200, Mauro Carvalho Chehab wrote:
> Some files got renamed. Those were all fixed automatically by
> 
> 	./scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt   | 2 +-
>  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 4 ++--
>  Documentation/devicetree/bindings/display/imx/ldb.txt         | 4 ++--
>  Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt  | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
