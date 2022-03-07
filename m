Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815174D0BB6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A796810E0F5;
	Mon,  7 Mar 2022 23:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F5010E0F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:09:26 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so19831754oos.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DEjj6mipEEYLP33vOJE2V/BDkDeTRAuZ0r17MrEk9aE=;
 b=k0E3HgsLB8sT2cnBhqh4t78QEAlI3a4eyg0dlAZBnw/kZ6+J7J30FmOlwLg6vQovSB
 pMhvRH4BLt/x7TnT9rxcRF4JWxl/s05v1H9oOIP7uTOuSPB5nk8/7TRguTLV+Jfm+tcO
 5ki7y5smoJOLLE2kdR3ElE92JMjA4MwAZb+GNgdm6Y0Q0Dfl1eY/pozS4oW7m4qc6VRC
 KiJdmmRUvA8nCxM3c0CYLZwaWCcdnWQOH9dXsm3/xgwj0fl4bb0R1dPN/YIJ82MKM28N
 f1XOEMQtE7jJfyMq7y1DtvlpwW4XWI2SWZflusudqGivf5VRdDHDDy3llxI3aqRRNNMZ
 QZhQ==
X-Gm-Message-State: AOAM532bn4rDbcpEJ8Z8U2grgIXd7/6lji08faqtBjrPxC0DF2LYLvDA
 CO0J3b9kRmIWMYS71GQctQ==
X-Google-Smtp-Source: ABdhPJyDVQwg3MsMXAkIeGiYt7mgMtzwhkpaixFw/cjv49b8I42KVzQxkNn5uMKaxpWqXbqHoOiGZQ==
X-Received: by 2002:a05:6870:70a5:b0:da:b3f:2b20 with SMTP id
 v37-20020a05687070a500b000da0b3f2b20mr753668oae.191.1646694566133; 
 Mon, 07 Mar 2022 15:09:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bq3-20020a05680823c300b002d4f8fe4881sm7328738oib.39.2022.03.07.15.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:09:25 -0800 (PST)
Received: (nullmailer pid 3432748 invoked by uid 1000);
 Mon, 07 Mar 2022 23:09:24 -0000
Date: Mon, 7 Mar 2022 17:09:24 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [RESEND V6 3/5] dt-bindings: display: mediatek: change to use
 enum for mutex
Message-ID: <YiaQpKN3JawgEl/A@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Mar 2022 14:57:23 +0800, Rex-BC Chen wrote:
> All single entry cases in mutex can be merged as a single enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
