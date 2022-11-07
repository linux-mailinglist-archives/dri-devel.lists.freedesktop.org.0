Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77961FF50
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 21:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326DB10E40C;
	Mon,  7 Nov 2022 20:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F3410E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 20:14:17 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so13989060fac.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 12:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTyYkKmk0ZFg6NKvx4h4V1/U52aTfp/VeufT5wgxfcc=;
 b=2orYMecd101HnAw2BleP0d4bHS1jeOYYfO2ZCRbXN5z7z33UF+0HbaYbzlgf3yxgEl
 k1iVFjnP5iCt8j6dUhEOxnwHQyJNJ9hmuhYG1fwAym5EeRwwzyorUc+zWX3bSqoNf7mj
 jxydhzuhwRdq05vqkSoWQExFxB1nhb1O7ICjg2FaPAWAqQ0TjinDNZbAcSHKDxZ3CNgX
 ammt3JUSsFzWp6gzd7+wR8Y8T59xqgJ4STc+0k0NHQm0Jri7WgC97WQm6BQiE9eAQTOH
 IGylGLoNLU7v3Xby8em25n6BBMzKR6TC5P7t24wWancF8FntACnBabbWfgNzIFa/9pX5
 wmeQ==
X-Gm-Message-State: ACrzQf2mQx99s8frl3Luh1df0M8oRwCv4+jkvqicQtz3TUZpPMb2RgBL
 bHBPjYFovoTojYgDDkX0eA==
X-Google-Smtp-Source: AMsMyM6l8LCWIiDxDxh5d5EhXJYIhBoM5GfAns5QmBWc/1EDDKO5IT5GRvoB+Q7S+gfwtSLmjmGiWA==
X-Received: by 2002:a05:6870:590:b0:13d:755e:10df with SMTP id
 m16-20020a056870059000b0013d755e10dfmr17202267oap.236.1667852056923; 
 Mon, 07 Nov 2022 12:14:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x10-20020a056830114a00b0066c45517c8fsm3296237otq.52.2022.11.07.12.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 12:14:16 -0800 (PST)
Received: (nullmailer pid 1570941 invoked by uid 1000);
 Mon, 07 Nov 2022 20:14:17 -0000
Date: Mon, 7 Nov 2022 14:14:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [v2 02/10] dts-bingings: display: bridge: Add MHDP HDMI bindings
 for i.MX8MQ
Message-ID: <20221107201417.GA1568945-robh@kernel.org>
References: <cover.1667463263.git.Sandor.yu@nxp.com>
 <0e1f631c22207c6af41ea512be85213b3953b44f.1667463263.git.Sandor.yu@nxp.com>
 <d5fb79bc-c05c-8de1-e8a4-9e19cc5c8e1a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5fb79bc-c05c-8de1-e8a4-9e19cc5c8e1a@linaro.org>
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
Cc: andrzej.hajda@intel.com, penguin-kernel@i-love.sakura.ne.jp,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, jani.nikula@intel.com, s.hauer@pengutronix.de,
 maxime@cerno.tech, linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, tzimmermann@suse.de,
 shawnguo@kernel.org, p.yadav@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 04, 2022 at 09:42:03AM -0400, Krzysztof Kozlowski wrote:
> On 04/11/2022 02:44, Sandor Yu wrote:
> > Add bindings for i.MX8MQ MHDP HDMI.
> 
> Typo in subject - bindings.

And 'dts'. It's 'dt-bindings: display: ...' Same for the rest of the 
series.

> 
> Also in the subject - drop redundant second word "bindings".
> 
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> >  .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
