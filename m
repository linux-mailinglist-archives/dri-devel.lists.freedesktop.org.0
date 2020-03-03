Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC84177832
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4FE6E8CE;
	Tue,  3 Mar 2020 14:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3F06E8CE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:05:25 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id c1so1665851oiy.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 06:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0jbQGA6dYjSwP62J+F4COay7zaK+oh5Bs7zMzSTsHDA=;
 b=jTLXzPyrP60JclwropKp+JrhKdra4e7+HTthQIApooOtL91ONLd/wMOmaZ3HR/AA2Z
 ln/VUoH3SbXbGWupO5coAkO6naTNehWuBqgFtAo10b+Qtd/8DFgsMh55/Sa8Y7UMw47E
 rrQaKoZCK7VfJ3ZAiibq2cLHJsKrqjsIYYDuORSi9ClqFlQXIxJKJz7T8/vukmicvMZB
 K4EzGnEfDHTBpidMtd4U29NzjTXtceoYT8/DIR51Ha0eeT0gFZA10TF3k+IGVZtM7gcq
 PWS26DOemQ8MgUTstoPO8R0VBwX+XmFQDHqkHT4JRkTuz+veu4gQcHey8OakELuiH2NP
 P2iw==
X-Gm-Message-State: ANhLgQ3fatz8R2ff9DOJEwvgvBlqtfL3pQfwOVt5FMuV0ceHNK4ceQOi
 B4wctKMMm8aNzT/8SVAJqA==
X-Google-Smtp-Source: ADFU+vttXS1Py6bbTK9e5rZkoBNj2Je8lemdxTIY/n2cP/smJ3TW98j1PCb9hPEhtc/qkXNAeDeYJg==
X-Received: by 2002:aca:be56:: with SMTP id o83mr2583399oif.25.1583244324891; 
 Tue, 03 Mar 2020 06:05:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n19sm7672257oig.57.2020.03.03.06.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 06:05:23 -0800 (PST)
Received: (nullmailer pid 20776 invoked by uid 1000);
 Tue, 03 Mar 2020 14:05:22 -0000
Date: Tue, 3 Mar 2020 08:05:22 -0600
From: Rob Herring <robh@kernel.org>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Subject: Re: [PATCH v4 01/13] dt-binding: gce: add gce header file for mt6779
Message-ID: <20200303140522.GA20576@bogus>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-2-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583233125-7827-2-git-send-email-dennis-yc.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Mar 2020 18:58:33 +0800, Dennis YC Hsieh wrote:
> Add documentation for the mt6779 gce.
> 
> Add gce header file defined the gce hardware event,
> subsys number and constant for mt6779.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
>  2 files changed, 227 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/gce/mt6779-gce.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
