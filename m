Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B3565B26
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC35510EA08;
	Mon,  4 Jul 2022 16:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F235F10E04F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 07:47:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 488705C00AB;
 Sun,  3 Jul 2022 03:47:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 03 Jul 2022 03:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1656834433; x=
 1656920833; bh=q7xFVKw+pnU3N3bfvFQJh/csLKrqR85Ga+dbzzZjpME=; b=L
 lYykUMBxJdu+JS8YR7oH0sHFa0UkkjmrdKpqvxJkjC8WULkTkQQ6+br16PqK+NfU
 QyJttfgiFQKw2Ad6fWfdSk07FJMa7jYk8nbcy+PhehEK+CBuGdRbfJWyWudzPvXp
 +TsI+7md4313vilF2a8pzBdybpfikTRouhiX5sUcRwpHNvoIvP43UnuTBrRw+RgL
 SPayP4IqSDMBgDxrKr4UjM2iuTgPxU0/w5S031LCp7jf5m0F9FP7Kbxmdlaje6Tb
 KNsDrqI21mSdwa+Vz1MdmitwPnfMHv97pPHThn0xaqPYPgKevH0LYY6gGMPzwWZw
 IWowGICuVo+BZbksOkt8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656834433; x=
 1656920833; bh=q7xFVKw+pnU3N3bfvFQJh/csLKrqR85Ga+dbzzZjpME=; b=E
 DhJPakOO7QVrK1CUNeynJ8tJCCQkLlTngXzj0/yAVxJlFU4P7yKdtn5yCKLf879r
 sO+CqyVmWAI44xdiYd+3lm+zDTSK60TA0sKMxC+ydbT7J0aKG3wKC9z76gNyl1YD
 31SK/FDdcxS3C4BYLm8JKkXsQdyHXnyO+1rf0Xh4ywsJ3of0AyWJVLi3WOeznS3q
 jrWgNQKpZJqdyjxJSQUSy957lVYYAO5IVUtSc1r1ZBVBQeXL17iHoWX/HWp7tVdn
 kWAulaBvACr/trVBgZ3LsfqTeN14+Dp57JYEOh99GHjSgSK4DasXZkAu/3AdhX7K
 CZ+MLkEFKAUgqU5nbWWLg==
X-ME-Sender: <xms:gUnBYg_06Lyq13esrxJJPENR6z4b0eJ_JTZ8nZ-sgWuTUYhlPbfD2w>
 <xme:gUnBYouAPwI3m88LQ8Dxgj1xzUJpuyRJgAp15u7sZYpMWA0tVfkY0QgDAVHBBHjTx
 5DqAAoOcp51nbUVEA>
X-ME-Received: <xmr:gUnBYmD1CgROOraYXWO-NjLQsB7C6JQkY_O_mnAIkW7D5l9XZWfLfN7Dcq6h23h_1zIPe7ASkhPxXcIboGrNaq_hqJB7P7W62NnKvCjrHeNjuP7UFK-dqmTiYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehiedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgr
 mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
 cuggftrfgrthhtvghrnhepleetjeffvdegheektdekveeuueetffetffehudefueejvddu
 feduteeiieejveelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhl
 lhgrnhgurdhorhhg
X-ME-Proxy: <xmx:gUnBYgcmgkpr4XjDtr68U7-BRDBuR-hTWnf_H9qt7CdX4u6O60CnVQ>
 <xmx:gUnBYlM_TASXSf1UiDq2OMm-B9uQK_2bN6bco2SVcYtrhMrMyoYQcQ>
 <xmx:gUnBYqkkxjDe6oHFvT8d4d1VAM-X18pSaqSXXSZ_jjVmYFRbyAAn0g>
 <xmx:gUnBYpnY5suVGWTcyGT2HQayO0ocLQgQ7Fl6Tj3imOK_IiSidB4qqg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Jul 2022 03:47:12 -0400 (EDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add binding for
 RenewWorldOutReach R16-Vista-E board
To: Suniel Mahesh <sunil@amarulasolutions.com>, Chen-Yu Tsai <wens@csie.org>, 
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20220615093900.344726-1-sunil@amarulasolutions.com>
 <20220615093900.344726-2-sunil@amarulasolutions.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e65211d3-110b-3f25-57b7-6f65c45cf9ea@sholland.org>
Date: Sun, 3 Jul 2022 02:47:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220615093900.344726-2-sunil@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/15/22 4:38 AM, Suniel Mahesh wrote:
> Add a binding for the RenewWorldOutReach R16-Vista-E board based on
> allwinner R16.
> 
> Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>

The primary author of the commit (the From:) should be the first signer, unless
you are using Co-developed-by:. See the examples here:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> ---
> Changes for v2:
> - Add missing compatible string
> - insert missing signatures of contributors
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 95278a6a9a8e..52b8c9aba6f3 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -787,6 +787,12 @@ properties:
>            - const: allwinner,r7-tv-dongle
>            - const: allwinner,sun5i-a10s
>  
> +      - description: RenewWorldOutreach R16-Vista-E
> +        items:
> +          - const: renewworldoutreach,r16-vista-e

This vendor prefix should be documented.

Regards,
Samuel

> +          - const: allwinner,sun8i-r16
> +          - const: allwinner,sun8i-a33
> +
>        - description: RerVision H3-DVK
>          items:
>            - const: rervision,h3-dvk
> 

