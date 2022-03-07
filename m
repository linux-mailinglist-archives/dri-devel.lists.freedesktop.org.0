Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6C4D0BA6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D89B8991D;
	Mon,  7 Mar 2022 23:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E977710E0F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:04:07 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so14162508oti.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4E9eRweUplMzQvU1VSUF8PEGvHk+pON6U7CEEhUI86Y=;
 b=rp/RXRcZnbwdpcE2+gWz1rkeTCmV3YAf8uQ6RsNJrGg2CYEDvK+J1tMEcjZHY5Xyh3
 KnOLLXuf4+yQJ4Db+i0e0SYH3ERvWb4ax3mC3dGRAsVVMA3mjS8Frwp9H3zzOUcBmMQj
 HngdIGsyf41j6ecHAgyGnRCFz3qiPBz18l0xSYpflJt1vvCRfQoXwfvJlo528R7WLU2r
 ud2/MvmpCQ4SasMrBGb+3ethkreFIHtlrQ5RrRNMW1Z9M3fElbFlggBQ08ZVxTg92CKY
 2CJL91+ss8h5RCAjbPdfi64BgWK9TxajopFdpw3OF0Gl0r21OAjY0ZiIhzeW98qYFl+v
 zm1g==
X-Gm-Message-State: AOAM533fsw5ZQfo1ca0YJ85ZC5BkNgDG+WcgTNEg0XlPLj7r5kFPCcfe
 qxvqkLH43xd4vaq8/BfIqw==
X-Google-Smtp-Source: ABdhPJwnRiwH1OmVRJThFCgiwfgEMg7WN043TMcx7tqaSeEny0pEoEWRHNdff7N7BXb71XSzJp4iNg==
X-Received: by 2002:a9d:462:0:b0:5af:9183:44bd with SMTP id
 89-20020a9d0462000000b005af918344bdmr7033688otc.21.1646694247151; 
 Mon, 07 Mar 2022 15:04:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q62-20020a4a3341000000b00320f8a179d0sm1480227ooq.30.2022.03.07.15.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:04:06 -0800 (PST)
Received: (nullmailer pid 3424006 invoked by uid 1000);
 Mon, 07 Mar 2022 23:04:04 -0000
Date: Mon, 7 Mar 2022 17:04:04 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [RESEND V6 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Message-ID: <YiaPZGzf5F542nZb@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-2-rex-bc.chen@mediatek.com>
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
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 yongqiang.niu@mediatek.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Mar 2022 14:57:21 +0800, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
