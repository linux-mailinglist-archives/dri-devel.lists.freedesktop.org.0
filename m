Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE51234BA2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 21:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238466EB45;
	Fri, 31 Jul 2020 19:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9607C6EB45
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 19:34:53 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j8so20404680ioe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 12:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pVSgcL7GtE1GSUUFa5tR37IcCV79BC/hP7BlkQgtdcw=;
 b=ihkyNCNLlpki0GKxeFIL3yOSXvXtuT7vxMgYkEG2aXi+voIbtX3v0NGYgXtIKI+TgX
 /mohu4m+dqpMSBwpc6DM3djcNK57Pb03c97ubja4IhS0h/E86GvTav7WcteGceAv9Udp
 4QhJxD2D8HezWq6FBAtPsnR5jbAm6DU8etn6HEsV7aLmQUeuBV4ttRvgqfEXsMW3wq3Z
 aFHA3cscqqm1AjpZkxRQc//7sTM7sTQ7lrUwgz6TTfNr9s8FqE/4/WM3P5MAPxETAnPf
 DmXadXmQekLgzLXaZMu0zuw/QNOkWfeITXTqKyasJcoH35mwYADCGvkYTqQuaJ7YpOPW
 XVbw==
X-Gm-Message-State: AOAM533CiKq6HUBboSuJ80rze5eFPif1q556M937y0BnnowFZfBsmftk
 nBJE3ZoVj3sKd76m0tdfZg==
X-Google-Smtp-Source: ABdhPJzTwWzSWdu5Ht4AzCpdTYI+subwwHxjfOOZ5tXzv7Rcj1YJ3aVynSdu5Wr6nxEEdbMr4g7nbQ==
X-Received: by 2002:a05:6602:2fcf:: with SMTP id
 v15mr5083954iow.78.1596224092882; 
 Fri, 31 Jul 2020 12:34:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id f20sm5172514ilj.62.2020.07.31.12.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 12:34:51 -0700 (PDT)
Received: (nullmailer pid 641081 invoked by uid 1000);
 Fri, 31 Jul 2020 19:34:48 -0000
Date: Fri, 31 Jul 2020 13:34:48 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 5/5] dt-bindings: display: imx: add bindings for DCSS
Message-ID: <20200731193448.GA640642@bogus>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200731081836.3048-6-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731081836.3048-6-laurentiu.palcu@oss.nxp.com>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jul 2020 11:18:33 +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> Add bindings for iMX8MQ Display Controller Subsystem.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> ---
> Changes in v9:
>  * Include imx8mq-clock.h in the example so we can use clock names
>    instead of their values;
> 
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
