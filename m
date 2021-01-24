Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBBC301F3F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 23:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009E989B27;
	Sun, 24 Jan 2021 22:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D32489B27
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 22:32:10 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id s2so8799581otp.5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 14:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m6wHg4CcRH88zHTgFz/tvg+1KvfQYJ5bN5Bm8kD7yRg=;
 b=mgrm+CeJoUg2mHpB9w9w/WEu3pXO/Gd682nWPz+LMCVG44F6NWPe4TjL1tIMqirJLY
 +entzgwsE1J9BxwWkc/odWUneEduolVUoCEq815YzlQht4hRi5a27wtmCKg76Ixyb6J7
 WR6haG/SXP+dE88Dj7KK9Ud9ElR3vNpBJh1SH3ZzH+ukNJxE/PnbetTI+P/52lbhkUX+
 MQXYs36PlimSbgap50YOac6EvdARukfQ5mBp6ZAPBXt5u8+CPCmxaWwJcGICE9jWinOo
 r2ifkqfuqD2BLaxInHh9WSeDfjIP+/uN1/bn9cxiCjsKOJoTTpQl/qxNO1x089Yx6PX5
 bvCQ==
X-Gm-Message-State: AOAM530Wndkgl9QtaGufw44eUYZU7BlyONM5YmIIiZX+e2Rm8qN+zRka
 9t0Lhy616sRAYOKTYhDasQ==
X-Google-Smtp-Source: ABdhPJz9WA7Y/UPNnKKLntkH/tFcind9g1csMhNYkPPBXbcW+heCsZ0Y6nK7bCtXl9o3899XN/yFzg==
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr2912287otn.247.1611527529363; 
 Sun, 24 Jan 2021 14:32:09 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a52sm3185158otc.46.2021.01.24.14.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 14:32:08 -0800 (PST)
Received: (nullmailer pid 2737276 invoked by uid 1000);
 Sun, 24 Jan 2021 22:32:06 -0000
Date: Sun, 24 Jan 2021 16:32:06 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPU
 binding
Message-ID: <20210124223206.GA2737091@robh.at.kernel.org>
References: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
 <1611213263-7245-2-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611213263-7245-2-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com,
 tzimmermann@suse.de, laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Jan 2021 15:14:18 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5->v6:
> * Use graph schema. So, drop Rob's R-b tag as review is needed.
> 
> v4->v5:
> * No change.
> 
> v3->v4:
> * Improve compatible property by using enum instead of oneOf+const. (Rob)
> * Add Rob's R-b tag.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * Fix yamllint warnings.
> * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as the
>   display controller subsystem spec does say that they exist.
> * Use new dt binding way to add clocks in the example.
> * Trivial tweaks for the example.
> 
>  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 387 +++++++++++++++++++++
>  1 file changed, 387 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
