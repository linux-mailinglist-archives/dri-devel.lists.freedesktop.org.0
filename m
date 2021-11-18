Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313BA4565F3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 23:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDBC6E832;
	Thu, 18 Nov 2021 22:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC736E832
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 22:56:42 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so13701670otg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 14:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YwMDztY7RxIGH6gxXPQx1kOqP9q46dX/pl5U8pnCx3o=;
 b=RJwhtkQFURTw+nS8+h0oYsmGSU4wqZsg3dGECzoNQMiuMNFF9KXCaWLFIG9Hu6gLey
 3aba+cmK4yUzhrG8+fbMpkNE3gTyNDWjKsREP0X7BgAe98QGc9zrIcg1kxgycil0j90G
 MhYF7+mY2gAU2mdnycfWo+DeFkxxUYKjU1iEuFeqEF1lBtShC60bhI2ZZXaZD2l4akiB
 zaeR5Xn0Nv3eSFGs9spQEJxnQZ+SrszAsAKYt9TyLA75u3fe8ruxWCDxVoKjQsSzMiGH
 bMNRzTSeGj6mhAmE415ePp5JpU6nDi7QytZDlk+7cD6bK/8MTMZLJ1q0Kd+RnVwaDZxN
 I7zw==
X-Gm-Message-State: AOAM533wT2MPUtqr2JEN56LQt7CW35py2/3t5Rsqww4d9OgWW+SBrJJr
 0VGpKj+3ZYbmUMvp9jpL+A==
X-Google-Smtp-Source: ABdhPJym6jQaeHFtftQAsARFwYeUKeHviN4RWRHj5ag4OkkoJe+MVPYZRs4UtZhFYrjoyFlH6b57wg==
X-Received: by 2002:a9d:5c2:: with SMTP id 60mr727516otd.104.1637276201930;
 Thu, 18 Nov 2021 14:56:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d6sm227483otb.4.2021.11.18.14.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:56:41 -0800 (PST)
Received: (nullmailer pid 1917917 invoked by uid 1000);
 Thu, 18 Nov 2021 22:56:38 -0000
Date: Thu, 18 Nov 2021 16:56:38 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Message-ID: <YZbaJr1o0BiUZZ+9@robh.at.kernel.org>
References: <20211116143503.385807-1-maxime@cerno.tech>
 <20211116143503.385807-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116143503.385807-2-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 03:35:03PM +0100, Maxime Ripard wrote:
> Following the previous patch, let's introduce a generic panel-lvds
> binding that documents the panels that don't have any particular
> constraint documented.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/panel-lvds.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
