Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A379D22163C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 22:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5D6EC18;
	Wed, 15 Jul 2020 20:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8316D6EC17
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 20:30:36 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id y2so3694569ioy.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 13:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yYUQrUg8P+/Z2qQaRZUnCH8LNzb7PJi2wPNt7qBjrAk=;
 b=GmHJu6lspfB+6MVX+cpjXl3y/zD2kY8fxuMD0SGwLLyv/GaoDJ1hyTUNY+vO9dN9TV
 jI1xb5M+hltkfZ1JKs/IhDFbXrwqyPiBU8C8CQe1rgI8OX/FD0cUNFrCglTbX3kgvKrl
 FlcpxypbsXv0a0IxP3gjoz+RsPKns6PUuUH0mLGC85IzNap6MpiTagPZKUxYoMoeOwFQ
 WXmJEWa1FsUK/XbGzEl4TAt4T4UydkxcHiQ2YPjd+0v3BtXPJ/lzCjoJ0IjD7f0EbJia
 vVn8EvN58J+BGea+l9DEqKQmvpMQqWNOXgsZxeTBlqVcY9nAIcXActadepW+rTu07wph
 pUWg==
X-Gm-Message-State: AOAM533ABwolerAWgcdrGGtvUYulU3v9a7DYA1fOHdE9usuP8YDCR0YH
 JElbQAnY8BbioYUlu0dLXTH6mFHXmQ==
X-Google-Smtp-Source: ABdhPJy/Dkdfg1gv5bU+wnbD/kvGdXdWEHoc1q9BvuFWtmaNw+uFMhXfRK/BiwT7u5MnV+3YpU7dbQ==
X-Received: by 2002:a05:6602:1581:: with SMTP id
 e1mr1165025iow.44.1594845035932; 
 Wed, 15 Jul 2020 13:30:35 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id o7sm1692424ioo.4.2020.07.15.13.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 13:30:35 -0700 (PDT)
Received: (nullmailer pid 767349 invoked by uid 1000);
 Wed, 15 Jul 2020 20:30:34 -0000
Date: Wed, 15 Jul 2020 14:30:34 -0600
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Message-ID: <20200715203034.GA767277@bogus>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-2-sebastian.reichel@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Jun 2020 00:33:12 +0200, Sebastian Reichel wrote:
> Convert panel-dsi-cm bindings to YAML and add
> missing properties while at it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/display/panel/panel-dsi-cm.txt   |  29 -----
>  .../bindings/display/panel/panel-dsi-cm.yaml  | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
