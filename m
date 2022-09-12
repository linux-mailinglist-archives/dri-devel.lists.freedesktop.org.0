Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658855B6235
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 22:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7DE10E2A9;
	Mon, 12 Sep 2022 20:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009E810E2A9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 20:31:21 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so6675928oti.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 13:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=6A3CWEMAFPkwUp+B5fXnYASflBbpzoqE0pypp9nRf24=;
 b=xXS+YB3e3TaqFfJYzAYy9TeOK6eB4sZrVTQDgLcEJ0694lD7IQaIHQKOQdm2BUhv2j
 ZCVVLq7KuXoxYT8Yl3JouyVFCyir23lJHdMz35/a6JnKJK6XIiTHrp0ndrLrMk8b4ZPR
 W98zYcSrhl+LTEe6X85tY0NSh+2TGvfq8tj58VfhPlImxJoFZJYva+KXWt6fcUJmbfPV
 VyiwtNsYIc+RUZ1HMbqhIYxSpRRX0n43Vo8Qi8cuhoC7BTLSaFsWobP9j59Svvu+oMrD
 bBVvMVQp+tOYqRdCMN6AVgr87L0nC9Utz5aKATneHwLFclaYWnyRui6p+ke+5WmNq6P5
 2hrw==
X-Gm-Message-State: ACgBeo2KuABWUMLOMtmO5bC/SFUnp01yLWjO/UxSpWsjsmhv9X6nWTNa
 fctgNHfRqy0WzSYo//ZjHw==
X-Google-Smtp-Source: AA6agR41y4ZEWvWRxBL1Wfr2qArgX3oQFk30/7wuiEwQu0d00nU0yB/xzhB66U8l7MAC3QkOYkZ8FA==
X-Received: by 2002:a9d:7442:0:b0:655:df84:5bd3 with SMTP id
 p2-20020a9d7442000000b00655df845bd3mr3021379otk.155.1663014681070; 
 Mon, 12 Sep 2022 13:31:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k6-20020a056870818600b0010d7242b623sm6113334oae.21.2022.09.12.13.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 13:31:20 -0700 (PDT)
Received: (nullmailer pid 1783124 invoked by uid 1000);
 Mon, 12 Sep 2022 20:31:20 -0000
Date: Mon, 12 Sep 2022 15:31:20 -0500
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 2/3] dt-bindings: Add Host1x context stream IDs on Tegra234
Message-ID: <20220912203120.GA1783078-robh@kernel.org>
References: <20220907083844.2486805-1-cyndis@kapsi.fi>
 <20220907083844.2486805-3-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907083844.2486805-3-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Sep 2022 11:38:43 +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add defines for stream IDs used for Host1x context isolation
> on Tegra234. The same stream IDs are used for both NISO0 and
> NISO1 SMMUs since Host1x's stream ID protection tables don't
> make a distinction between the two.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  include/dt-bindings/memory/tegra234-mc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
