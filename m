Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E18346D25
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 23:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678796E1A4;
	Tue, 23 Mar 2021 22:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2493D6E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 22:33:34 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id c17so19666886ilj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GhZf/2qAH49jtPj0KjvHuxl514fTGF2Hh0sAaac8WcE=;
 b=doI0QVYX5Ipw6XudAT8BriUMpmXFkJHPdNjWHYLSHZuGxch40gtzRg0+za8WwDtabF
 JUPVVdvErV4cpm6mRBArOFF7+888Bw6v9Nl5PqES+LRN7Yz98YKJ/+lfXKfR5VwlpCv4
 jikfl6it2rcfNKWDHxct8tcwiHth/vWuj3sMvf7a4DtMwnsFM0H8QDcil7mfQNcI6lLR
 +az19EKpd5Bh0Ur+x+8clwYfVANvlbEUXr7T4FIuvLF+yn+aqxna9oaQWRHmxZkeUoGu
 2ZlfgR7JgmuNeLLTOnZh2McXC2rDhWUG660zseF662gV7Kz+jLBVQpJZn4gBK9ze6/ce
 gbAw==
X-Gm-Message-State: AOAM533khkKSQ9ohW89DAMvGQdsMuSbcEpDL/FyKYNMpSlqgZ/HlDsD1
 /snuNkp4MH0YBsfI3jidzg==
X-Google-Smtp-Source: ABdhPJyVZfRKp/SOD+KhYi2Vs4tfmHLlCtfIT4JSPJohRlIUVQpOmdAhgbsj0jDsSZgjmkB2COXUSQ==
X-Received: by 2002:a92:d80f:: with SMTP id y15mr358713ilm.96.1616538813476;
 Tue, 23 Mar 2021 15:33:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id i3sm105260ilu.67.2021.03.23.15.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:33:32 -0700 (PDT)
Received: (nullmailer pid 1467787 invoked by uid 1000);
 Tue, 23 Mar 2021 22:33:29 -0000
Date: Tue, 23 Mar 2021 16:33:29 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v6 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
Message-ID: <20210323223329.GA1467753@robh.at.kernel.org>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-8-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615952569-4711-8-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, airlied@linux.ie,
 lee.jones@linaro.org, dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Mar 2021 11:42:42 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5->v6:
> * Drop 'select' schema. (Rob)
> 
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
