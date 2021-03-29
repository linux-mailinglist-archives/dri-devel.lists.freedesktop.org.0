Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3461F34D24C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 16:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CD76E433;
	Mon, 29 Mar 2021 14:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA466E433
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 14:24:04 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so12424207oto.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 07:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7cbBvFM0u5OOnkRup8d3vCsO5p4xHsXrVbhJ/10pY0w=;
 b=ky5KI6zKM5lXHctZglL8+f18qv/Zw4e8aa9kQQ7rKPIqf+WvdaWNMrOm+NGo2FmT9w
 KccXOSMNNM8JhdK5U83Cuccy/G6mKjfD6rUPzcyAjpx02ycRPv5PDcjz+iCTmMazpX9m
 a2k0BfdqdfQZcm2CCY0ZpJeQtg0ucWN3oIvgnDRSSgTiPIeWmymtW2CYmGt6Fmvb/6tO
 OCs8ZoPexzgRKhX8pAt3/eVRcKvcCUTC1nbWUeWoJDnZUQG99q7Kh/FoFSxsS5rCyPcT
 CcfNPapMWG8vO9Wx/Ipz9Tcg1LGTrdW9Fmlr0BM+187IOtgfAV4K5K0B4lOwGjuZydzk
 xqTw==
X-Gm-Message-State: AOAM5314zcz5vGXC8r/OHZ6lhfvVg6wuLxmgNJRr5LOOpk3aQm3WrhkC
 x1c8meR0O5bRyHGVpFu48Q==
X-Google-Smtp-Source: ABdhPJyf+sxdZg6l+rP9zu3h8+b7BWR69/FryoT+K89LgslfDxApt6g8N/GPYaZYTup2PKBl9h9+jQ==
X-Received: by 2002:a05:6830:12d5:: with SMTP id
 a21mr22715211otq.34.1617027844013; 
 Mon, 29 Mar 2021 07:24:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r2sm4368294otk.55.2021.03.29.07.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 07:24:02 -0700 (PDT)
Received: (nullmailer pid 2512548 invoked by uid 1000);
 Mon, 29 Mar 2021 14:24:00 -0000
Date: Mon, 29 Mar 2021 09:24:00 -0500
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v9 3/6] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Message-ID: <20210329142400.GA2512413@robh.at.kernel.org>
References: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
 <1616997446-8783-4-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616997446-8783-4-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, robh+dt@kernel.org, linux-imx@nxp.com, tzimmermann@suse.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Mar 2021 13:57:23 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8->v9:
> * Reference 'interrupts-extended' schema instead of 'interrupts' to require
>   an additional interrupt(r_rtram_stall) because the reference manual does
>   mention it, though the driver doesn't get/use it for now.
>   Reference 'interrupt-names' schema to define the two interrupt names -
>   'dpr_wrap' and 'r_rtram_stall'.
> * Drop Rob's R-b tag, as review is needed.
> 
> v7->v8:
> * No change.
> 
> v6->v7:
> * No change.
> 
> v5->v6:
> * No change.
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
> * Use new dt binding way to add clocks in the example.
> 
>  .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
