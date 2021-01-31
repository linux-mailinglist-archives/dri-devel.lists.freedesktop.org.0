Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F122309D09
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 15:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCBC6E1E8;
	Sun, 31 Jan 2021 14:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065A46E1E8
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 14:44:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id m1so7717204wml.2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 06:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DXfQqwyMT8djgn+HE8Yw0fJW+eIkQAwimPIvtjFwnlA=;
 b=q6qTpnON2D2SGaRlElLDFCQs+ppVJhqGerPqnmMB94aFa2xLzcGtGSkHF2b2mehD2H
 vYagvRDSFpYn6CVBkcHJbq62aLeYjoaQ9LoUXC8jkTi8omnXiDlbEsWN9dqmK/Ux0aJB
 zAmZOPN3WKJiqiFD9ED748WvFvOIoiVf636tMY3c1Sn7n+/fpAieO+hfxUZQFx7dfN8T
 ZFGsJhDw1z6gfzbtVx8LYlqSJLYOAr1jnKatLeftMKqzzHm1RBM76yGPffXyuOHyPKFP
 pCb70NIb1cjAp0sJGIsf0PXk/96lUE5XT82mrdlUteb95zMe3M44KABZb1XrzeHGjPAp
 yatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DXfQqwyMT8djgn+HE8Yw0fJW+eIkQAwimPIvtjFwnlA=;
 b=dNH22PxaRxuU51DA+vvnhlRFYJp9DDUjltJsIl7XzBTe9U8/mA+lVtTwOuM3cXDxNk
 Wb7skBgU4CGb8GHCk4lZ2XHCMYb2ytqMcCMIHOMssOz+6so2eiapSnm7addD6/dhZ68T
 Wh2VF5kMJSuGC2S+uI/o1b+coKLNv2IDZHO5rz3n0VTD6CWc9GBXY8ZhzBv1qEMcgPQs
 4tZ/69o/QsRAWf1p4mMUvh0NTxwjZu3JzL/yqNcWKJKhRkQcQh5uWX1KugI3y9YXNgHj
 g+xTIASnrktTJ/2UsKl8oOn9ISKTf5PMBu1FJAnemTkxyj9r6nnafV5FI1VNMNvKns0Y
 12wg==
X-Gm-Message-State: AOAM531kRRNsSngwQUDBwAifPmKZBJWTPP1qoAHOYkN1AJ6fLnDfsw8h
 Bx88f5bBkW5L8WmoTIVQOUU=
X-Google-Smtp-Source: ABdhPJzqAu9c9z9bsCe/XKMEjx6Og4pCATMX5U3ZGLHc7+NnE+hcpBRM6dvNfW9fzlLz0aYh9g5uQQ==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr11163966wmq.59.1612104253679; 
 Sun, 31 Jan 2021 06:44:13 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id f7sm2645856wre.78.2021.01.31.06.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 06:44:13 -0800 (PST)
Subject: Re: [PATCH v2, 1/3] dt-binding: gce: add gce header file for mt8192
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1608770889-9403-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608770889-9403-2-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6c60faa0-5472-45ad-2eb5-7a1a93e246d4@gmail.com>
Date: Sun, 31 Jan 2021 15:44:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1608770889-9403-2-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/12/2020 01:48, Yongqiang Niu wrote:
> Add documentation for the mt8192 gce.
> 
> Add gce header file defined the gce hardware event,
> subsys number and constant for mt8192.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |   7 +-
>  include/dt-bindings/gce/mt8192-gce.h               | 419 +++++++++++++++++++++
>  2 files changed, 423 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/gce/mt8192-gce.h
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> index cf48cd8..f48ae45 100644
> --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> @@ -9,8 +9,8 @@ CMDQ driver uses mailbox framework for communication. Please refer to
>  mailbox.txt for generic information about mailbox device-tree bindings.
>  
>  Required properties:
> -- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce" or
> -  "mediatek,mt6779-gce".
> +- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce",
> +  "mediatek,mt8192-gce" or "mediatek,mt6779-gce".
>  - reg: Address range of the GCE unit
>  - interrupts: The interrupt signal from the GCE block
>  - clock: Clocks according to the common clock binding
> @@ -36,7 +36,8 @@ Optional properties for a client device:
>    size: the total size of register address that GCE can access.
>  
>  Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
> -'dt-binding/gce/mt8183-gce.h' or 'dt-bindings/gce/mt6779-gce.h'. Such as
> +'dt-binding/gce/mt8183-gce.h', 'dt-binding/gce/mt8192-gce.h' or
> +'dt-bindings/gce/mt6779-gce.h'. Such as
>  sub-system ids, thread priority, event ids.
>  
>  Example:
> diff --git a/include/dt-bindings/gce/mt8192-gce.h b/include/dt-bindings/gce/mt8192-gce.h
> new file mode 100644
> index 0000000..0627544
> --- /dev/null
> +++ b/include/dt-bindings/gce/mt8192-gce.h
> @@ -0,0 +1,419 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Yongqiang Niu <yongqiang.niu@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_GCE_MT8192_H
> +#define _DT_BINDINGS_GCE_MT8192_H
> +
> +/* assign timeout 0 also means default */
> +#define CMDQ_NO_TIMEOUT		0xffffffff
> +#define CMDQ_TIMEOUT_DEFAULT	1000
> +
> +/* GCE thread priority */
> +#define CMDQ_THR_PRIO_LOWEST	0
> +#define CMDQ_THR_PRIO_1		1
> +#define CMDQ_THR_PRIO_2		2
> +#define CMDQ_THR_PRIO_3		3
> +#define CMDQ_THR_PRIO_4		4
> +#define CMDQ_THR_PRIO_5		5
> +#define CMDQ_THR_PRIO_6		6
> +#define CMDQ_THR_PRIO_HIGHEST	7
> +
> +/* CPR count in 32bit register */
> +#define GCE_CPR_COUNT		1312
> +
> +/* GCE subsys table */
> +#define SUBSYS_1300XXXX		0
> +#define SUBSYS_1400XXXX		1
> +#define SUBSYS_1401XXXX		2
> +#define SUBSYS_1402XXXX		3
> +#define SUBSYS_1502XXXX		4
> +#define SUBSYS_1880XXXX		5
> +#define SUBSYS_1881XXXX		6
> +#define SUBSYS_1882XXXX		7
> +#define SUBSYS_1883XXXX		8
> +#define SUBSYS_1884XXXX		9
> +#define SUBSYS_1000XXXX		10
> +#define SUBSYS_1001XXXX		11
> +#define SUBSYS_1002XXXX		12
> +#define SUBSYS_1003XXXX		13
> +#define SUBSYS_1004XXXX		14
> +#define SUBSYS_1005XXXX		15
> +#define SUBSYS_1020XXXX		16
> +#define SUBSYS_1028XXXX		17
> +#define SUBSYS_1700XXXX		18
> +#define SUBSYS_1701XXXX		19
> +#define SUBSYS_1702XXXX		20
> +#define SUBSYS_1703XXXX		21
> +#define SUBSYS_1800XXXX		22
> +#define SUBSYS_1801XXXX		23
> +#define SUBSYS_1802XXXX		24
> +#define SUBSYS_1804XXXX		25
> +#define SUBSYS_1805XXXX		26
> +#define SUBSYS_1808XXXX		27
> +#define SUBSYS_180aXXXX		28
> +#define SUBSYS_180bXXXX		29
> +#define SUBSYS_NO_SUPPORT	99

How will we you SUBSYS_NO_SUPPORT?

> +
> +/* GCE General Purpose Register (GPR) support
> + * Leave note for scenario usage here
> + */
> +/* GCE: write mask */
> +#define GCE_GPR_R00		0x00

What are these defines for?

Regards,
Matthias

> +#define GCE_GPR_R01		0x01
> +/* MDP: P1: JPEG dest */
> +#define GCE_GPR_R02		0x02
> +#define GCE_GPR_R03		0x03
> +/* MDP: PQ color */
> +#define GCE_GPR_R04		0x04
> +/* MDP: 2D sharpness */
> +#define GCE_GPR_R05		0x05
> +/* DISP: poll esd */
> +#define GCE_GPR_R06		0x06
> +#define GCE_GPR_R07		0x07
> +/* MDP: P4: 2D sharpness dst */
> +#define GCE_GPR_R08		0x08
> +#define GCE_GPR_R09		0x09
> +/* VCU: poll with timeout for GPR timer */
> +#define GCE_GPR_R10		0x0A
> +#define GCE_GPR_R11		0x0B
> +/* CMDQ: debug */
> +#define GCE_GPR_R12		0x0C
> +#define GCE_GPR_R13		0x0D
> +/* CMDQ: P7: debug */
> +#define GCE_GPR_R14		0x0E
> +#define GCE_GPR_R15		0x0F
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
