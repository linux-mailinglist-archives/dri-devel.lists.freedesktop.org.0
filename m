Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6531EEDB1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 00:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782A86E5C8;
	Thu,  4 Jun 2020 22:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D7F6E5C8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 22:24:06 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id z2so7707243ilq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 15:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9twZbcOiLW0yLQJYmRVs4qavY+XNMKpL9WdtifUyAH0=;
 b=o9/7+wiiuc/yLXt9kXRXWVAjNpkrJkXBfNCJyW8AFzmIxx+EUlWz8nOn6h3YKxLNhp
 Loka/oeXRMxCYoqdabo+l/HdE//LlOisIYe7B/xBjVn6GnfP7ykfZXGysURwFrsmZyTm
 WBjKZlGUdDkrYHPVEQ43fbVTDDQOvnXNwODipT01Py6KszHAeLSq6G/KBOfXrVQiNJbQ
 wxmkoLPJkmtHBPD23hS8QrSpny5oQSyo7rD2aMlJVS5kSNNqGwUHDeK6eNeWuBJBKmlz
 zWY3Rs7cc54s+Lh0SwxtrbDfgcb9UKhIJTMyMrVqR30N/GQmkfRmoWed3nDuAf64e0Ek
 up9w==
X-Gm-Message-State: AOAM530iuM+tHe5dnL/FONhk73vbUHYDOeYQlt1tL9Mf0TGulsUV/a2n
 ZuL7LJpe8zpqVg86Oc52sA==
X-Google-Smtp-Source: ABdhPJw4Iafe1pMJfz84rEJOIVETUZQAgI9tRhEJzB4YXRVgrQvOWSYePNiqSlZkykkFuA1ew6Sl1w==
X-Received: by 2002:a92:b001:: with SMTP id x1mr5480753ilh.18.1591309445557;
 Thu, 04 Jun 2020 15:24:05 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id p5sm2004317ilg.88.2020.06.04.15.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 15:24:04 -0700 (PDT)
Received: (nullmailer pid 4153174 invoked by uid 1000);
 Thu, 04 Jun 2020 22:24:02 -0000
Date: Thu, 4 Jun 2020 16:24:02 -0600
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v12 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <20200604222402.GA4153046@bogus>
References: <cover.1591253353.git.xji@analogixsemi.com>
 <eb82c52574bf41b5edad488e14c27cabad39b922.1591253353.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb82c52574bf41b5edad488e14c27cabad39b922.1591253353.git.xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nicolas Boichat <drinkcat@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 04 Jun 2020 15:56:36 +0800, Xin Ji wrote:
> anx7625: MIPI to DP transmitter DT schema
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml  | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
