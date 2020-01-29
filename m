Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57214D156
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 20:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847536E435;
	Wed, 29 Jan 2020 19:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07B96E435
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 19:48:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EA28880477;
 Wed, 29 Jan 2020 20:48:49 +0100 (CET)
Date: Wed, 29 Jan 2020 20:48:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: add vendor prefix for OzzMaker and
 Waveshare Electronics
Message-ID: <20200129194848.GB29646@ravnborg.org>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=TELmJA4fAAAA:8
 a=V4Th9uXqAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=3u5PU5XXhnd4_xb3wXMA:9
 a=CjuIK1q_8ugA:10 a=OxZBpCp95H4A:10 a=7nPLErV8LTYA:10
 a=0n8ANzlPCKH_0m4f1BvC:22 a=NPz-sUGDo_RSEfLfxCKS:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=2u7P7y6wY8-ADUGXAArp:22
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
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kamlesh

On Mon, Jan 27, 2020 at 07:55:33PM +0530, Kamlesh Gurudasani wrote:
> Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
> Both are display manufacturers
> 
> [1] https://ozzmaker.com/about/
> [2] https://www.waveshare.com/contact_us
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ac4804d..dfb926d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -721,6 +721,8 @@ patternProperties:
>      description: OmniVision Technologies
>    "^oxsemi,.*":
>      description: Oxford Semiconductor, Ltd.
> +  "^ozzmaker,.*":
> +    description: OzzMaker
>    "^panasonic,.*":
>      description: Panasonic Corporation
>    "^parade,.*":
> @@ -1038,6 +1040,8 @@ patternProperties:
>      description: Vision Optical Technology Co., Ltd.
>    "^vxt,.*":
>      description: VXT Ltd
> +  "^waveshare,.*":
> +    description: Waveshare Electronics
>    "^wd,.*":
>      description: Western Digital Corp.
>    "^wetek,.*":
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
