Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006E50BFC4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCD410E3F3;
	Fri, 22 Apr 2022 18:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8610E3F3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=43yGbpLRS8jsRRS3GIzeflk7R/ljcAqAXPy1IW9Yx8k=;
 b=NLhf28yDiPg9caWdkXyvLoDkhEQslSksaIx12UIajAx92cJcZPhgCtkAYFCeJfcysmfWfDEEBRYnJ
 90iJ/nSw0UCOMXt2jcpt8sP1D2V2sHy5Z5QYUwriqyWso5cnqUMUfvFKucqcJMWXpEx/2DGKmt/tHk
 Ifda3xh6XombEEHF1qJuCjNN9p5dcT0x88DnzSlK9v6bMrKkxDBagGHXtrRCB+9owwWxOjzExcob2J
 9RRfMKfQ8z1knlBu4Te615GgFXkYMD4QTbprEhgwz1snzPtUqH1MtLB0NSDxnZtf8FQDgVXXGnrUz7
 qnQKoG0OF+b8hgaSb5xOnVwNHYmCbiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=43yGbpLRS8jsRRS3GIzeflk7R/ljcAqAXPy1IW9Yx8k=;
 b=bTHPTNeSs2L9lnRJh1yFPQ+KqKe2nuvSUNtk8CRFSpRA4cCRIHl4zbD7hzCszS5RgqzDjn0pTNCs1
 q5FYECkBg==
X-HalOne-Cookie: 3a39bb7a6cb29e5fc279994f315d74b0460e907b
X-HalOne-ID: 46ac5ff7-c268-11ec-8225-d0431ea8bb10
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 46ac5ff7-c268-11ec-8225-d0431ea8bb10;
 Fri, 22 Apr 2022 18:16:06 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:16:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add DataImage
 FG040346DSSWBG04 compatible string
Message-ID: <YmLw5LrYYE06M7N4@ravnborg.org>
References: <20220422102242.18959-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422102242.18959-1-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 12:22:41PM +0200, Marek Vasut wrote:
> Add DataImage FG040346DSSWBG04 4.3" 480x272 TFT LCD 24bit DPI panel
> compatible string.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> V2: Add AB from Thomas
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 1eb9dd4f8f58..cfe7bb9f89de 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -105,6 +105,8 @@ properties:
>        - chunghwa,claa101wb01
>          # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
>        - chunghwa,claa101wb03
> +        # DataImage, Inc. 4.3" WQVGA (480x272) TFT LCD panel with 24-bit parallel interface.
> +      - dataimage,fg040346dsswbg04
>          # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
>        - dataimage,scf0700c48ggu18
>          # DLC Display Co. DLC1010GIG 10.1" WXGA TFT LCD Panel
> -- 
> 2.35.1
