Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97AA3E97C9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 20:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C546E106;
	Wed, 11 Aug 2021 18:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5C46E1A4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 18:40:29 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so11024921pji.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 11:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6XWZ7uipzmbT4b9s5UP3Dp3Et7I/DEvFdMWNyQg4EWo=;
 b=a3Pv/aGRZAxWkeLW3G6Zf06XlECOT+4SdYrzcIHW67/vM42fyujmBVxvwnaIq92sSH
 foPr0jNQVsoHqs2JIf1/9XyyZFmdOJCCD2Nyaq/hsuoaML4Jy88uazbfpQK8OqAgyufb
 /AHie/nPqxxXbPlrH0lg0V+RNwv8Il+KEw4c6DXMZti9mf83ySLgY66Sum0rdwcUo0g8
 WdlZrXukDtQZ7IFYRAOax4ZgXYb5Eu1Prj+7YqX8GNwm0acC5KUy5J7ulWbL+qpCDSpx
 NTDFBkatftGKkWkB45RBx3ICM/+Y9Ddp4kp6M1TtWu7j5dRr/6zvMpRmOKqlhkztuyVm
 Xqog==
X-Gm-Message-State: AOAM5305LsXfsRdoVLvdbZg5r70NmZSCRcCwJNWbNv4p1e90HD9uI9J2
 g2E1zCT9MFVbLKexi1viqw==
X-Google-Smtp-Source: ABdhPJydzGSNHHLbCABFjtI2hErQQ3Hvcs3ObcdrBQP2nvWLFn8lM3bPlQ55R/pujUDc+0x05iMkZw==
X-Received: by 2002:a05:6a00:150d:b029:3c8:e86e:79ec with SMTP id
 q13-20020a056a00150db02903c8e86e79ecmr182380pfu.62.1628707228843; 
 Wed, 11 Aug 2021 11:40:28 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id u21sm218257pfh.163.2021.08.11.11.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:40:27 -0700 (PDT)
Received: (nullmailer pid 66990 invoked by uid 1000);
 Wed, 11 Aug 2021 18:40:23 -0000
Date: Wed, 11 Aug 2021 12:40:23 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Olof Johansson <olof@lixom.net>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add an entry for
 SKOV A/S
Message-ID: <YRQZl94LsG9smzI0@robh.at.kernel.org>
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
 <20210804043439.11757-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804043439.11757-2-o.rempel@pengutronix.de>
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

On Wed, 04 Aug 2021 06:34:37 +0200, Oleksij Rempel wrote:
> Add "skov" entry for the SKOV A/S: https://www.skov.com/en/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
