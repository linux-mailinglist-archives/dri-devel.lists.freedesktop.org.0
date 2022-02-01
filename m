Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2634A68C7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 00:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA79B89F75;
	Tue,  1 Feb 2022 23:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72789F75
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 23:49:05 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id b186so30410151oif.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 15:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jo2m2mDixIShQQUxCkK1P+1sHxGPYJ+EgazaMUeqSAM=;
 b=2233oMU06r3Wl5dqMeTjSqXRo9kY/W2YjV6fpjSpe5OltHgNnKfFIkb+O+isfvpQp4
 QeNqraMf+eWuy2EuQCB7scDAaek1FE/wHpP+VL0zZr786r78ZR9g00wMH1HMj0wCoExZ
 2kvUYJLNTJIwH9B/7tpWMDOZGQiikjMBJRW2i15CqBIdcGHfXk8YGy8pxsbIKBO0xlI6
 kRrx9XihdxVhDqQGdvJXW9e4VS4zPfMuTQJlESMwJQN4HuCVyQQVaSDmZDKmoiq9S5A8
 yj+Y6oHWv3yZfOS52/h5C0Y+WPUxxR9Vt7BfkK0Mo6AHgxf1ndI2V3LCLsk9CBc+tYuJ
 dWOQ==
X-Gm-Message-State: AOAM533O0UD601T6VLmcNjl/lnXYwkB69gHrEUfa29u8Kk4hFRC0vczm
 GnT84VBQu2gJNngIUmj2jw==
X-Google-Smtp-Source: ABdhPJz7iZxzXNX7wyNhOMdRzRTkrf4cKGMZQJfj7fb0fteyV/W1kMAx9bEDfj3D6o//zA58hAxZ2A==
X-Received: by 2002:a05:6808:180f:: with SMTP id
 bh15mr3030078oib.233.1643759344332; 
 Tue, 01 Feb 2022 15:49:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j3sm13191444oig.37.2022.02.01.15.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:49:03 -0800 (PST)
Received: (nullmailer pid 996340 invoked by uid 1000);
 Tue, 01 Feb 2022 23:49:01 -0000
Date: Tue, 1 Feb 2022 17:49:01 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v12 3/9] dt-bindings: display: Add ingenic, jz4780-dw-hdmi
 DT Schema
Message-ID: <YfnG7SnlQyzU3H5l@robh.at.kernel.org>
References: <cover.1643632014.git.hns@goldelico.com>
 <2386420a975e0a6c17393828af776991f3d17c01.1643632014.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2386420a975e0a6c17393828af776991f3d17c01.1643632014.git.hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 13:26:49 +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
