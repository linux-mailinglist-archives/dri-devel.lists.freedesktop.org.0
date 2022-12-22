Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F536546AB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 20:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2325710E0CD;
	Thu, 22 Dec 2022 19:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAB810E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 19:33:27 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id r11so2752579oie.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYZuAOCMovMvktU5KUPbfgtaY37Eb8Oc8FmMFnt3Lvc=;
 b=3Konbm3COlpuwJyqDT5Qdpb4FDjNwtLNjw4ngSwMHX6fdsnrzT+7kyUQKXXDejuQeR
 /r2/XJi8cVA5663dEvGogvWTT95TYpwqHIwgbXBXTY42TIBkec3dGOQfho3crlSMTnkR
 ztvbL2534bRyBts//rtX+6SrwH0ZAy4QhcAZRmlcqCaYMVFTUm5abubzb8bfnG8F3kg/
 0EZFCsBu+2LugZIFsQ4r7r/iEP0tJh6M7XN3af15V8oL75rjp/YoxXSzcWlh6Lywg2yc
 6AW84Ubq8t1Cx3pYVrhdydjHXXhDOY8qIxgrq/jrh4/rF2s5q33L1H4KIZrT2IDo6IEl
 KTBA==
X-Gm-Message-State: AFqh2kr+exuX6m8Ub7DrprZg1TF7hQ1Tlmzr9wZrar2IcR4t+7PpkIZI
 5Y2QjLoDc9uoxqf2OzEkbQ==
X-Google-Smtp-Source: AMrXdXv/kgIlpx844AJKnleHRaPETuExD06FHseWyuKu9K1+X9Ay09uxx4A14i873JeeiGCBmoHlhA==
X-Received: by 2002:a05:6808:190e:b0:35c:b79:8cf8 with SMTP id
 bf14-20020a056808190e00b0035c0b798cf8mr3875792oib.6.1671737606641; 
 Thu, 22 Dec 2022 11:33:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n67-20020acabd46000000b0035b451d80afsm651127oif.58.2022.12.22.11.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 11:33:26 -0800 (PST)
Received: (nullmailer pid 1948183 invoked by uid 1000);
 Thu, 22 Dec 2022 19:33:25 -0000
Date: Thu, 22 Dec 2022 13:33:25 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 03/17] dt-bindings: display: dsi-controller: move
 clock-master property
Message-ID: <167173760428.1948132.16098364997799838917.robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <1c3b18ad-350f-e862-de98-a775e11e132c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c3b18ad-350f-e862-de98-a775e11e132c@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 22 Dec 2022 15:24:51 +0100, Johan Jonker wrote:
> The clock-master property is used for the controller and not in the panel,
> so move it there.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../bindings/display/dsi-controller.yaml       | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
