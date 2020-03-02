Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A216017669F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23336E12C;
	Mon,  2 Mar 2020 22:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E354B6E12C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:13:28 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id j5so936558otn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uGARtVGb5GQcRJdnLbZgGSdPsUcgBwNPE/vctX/sjkM=;
 b=beWwb0MVk1VecWnimOZf8RR6EDXavltqmztUuKcOUVF2S+/+r+y5BmdGO+slMWpbbr
 Z9QhqUh9zGonAQlJqDlLF5hw3qBSsUWm0Vwjbyb0w57RDj1GafQ06uDBLIPTGa5YkxNz
 RGJpgulIJZZVX2oJm4nEw4AHVa15lMmNBFOBC9dLwLpoU6thocS+mOGDbFWheFNghNBj
 fwLL8XEGqghqq2r6NKo0QBFch11C5EYl2JU+5Ruo2N7ME+nKz4IwTt8YK5Ie5k6H2Gyf
 /sL/BFDNOdKvWQW95wzwBt7UhHCF+piFMiA1Eh09JJo168oGZIfP+g5KIK1FY8C9lwsL
 f4SQ==
X-Gm-Message-State: ANhLgQ2183FrBpP9ytRioPXZLSQL8mk2bKoyLITl5pWUJQ2MO65Sb5Ki
 64j+Yvof9bH3l4+JFdOAvg==
X-Google-Smtp-Source: ADFU+vsW/Ftc+zw0bkyoQI7ygt1in3IUwH41Y0ReqXzak1w+/RwutHp8ko7jGUtVL4RV0SiqGHVaZg==
X-Received: by 2002:a9d:21b4:: with SMTP id s49mr998093otb.294.1583187208115; 
 Mon, 02 Mar 2020 14:13:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p65sm6809911oif.47.2020.03.02.14.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:13:27 -0800 (PST)
Received: (nullmailer pid 24401 invoked by uid 1000);
 Mon, 02 Mar 2020 22:13:26 -0000
Date: Mon, 2 Mar 2020 16:13:26 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2 1/4] dt-binds: display: mediatek: add property to
 control mipi tx drive current
Message-ID: <20200302221326.GA17941@bogus>
References: <20200225114730.124939-1-jitao.shi@mediatek.com>
 <20200225114730.124939-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225114730.124939-2-jitao.shi@mediatek.com>
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 07:47:27PM +0800, Jitao Shi wrote:
> Add a property to control mipi tx drive current:
> "mipitx-current-drive"

'dt-bindings: display: ...' for the subject prefix.

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index a19a6cc375ed..780201ddcd5c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -33,6 +33,9 @@ Required properties:
>  - #clock-cells: must be <0>;
>  - #phy-cells: must be <0>.
>  
> +Optional properties:
> +- mipitx-current-drive: adjust driving current, should be 1 ~ 0xF

Perhaps should be a common property and use the existing 
'drive-strength-microamp'.

> +
>  Example:
>  
>  mipi_tx0: mipi-dphy@10215000 {
> @@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
>  	clock-output-names = "mipi_tx0_pll";
>  	#clock-cells = <0>;
>  	#phy-cells = <0>;
> +	mipitx-current-drive = <0x8>;
>  };
>  
>  dsi0: dsi@1401b000 {
> -- 
> 2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
