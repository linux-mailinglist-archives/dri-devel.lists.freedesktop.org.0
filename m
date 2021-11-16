Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B757452DE7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC9A6EE77;
	Tue, 16 Nov 2021 09:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62B6EE77
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:24:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so1777702pjj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=owaydA/9dfzXygkoQ9b5wC+OlGrAMOC9LEkh/lAzv5I=;
 b=QMKycX4ZEQaoqQ026VxDUHwe+VqargI4Q56Ls7vof5Ssrt3G/nOSh2dyyoY6Cw02WF
 iFzhEy4rRt7z1+q0UupwntE3f0SNtv/+2FFKLmpIe9QX6rPKknymUxkADWNvKQ7UfQoc
 1I+c/UYXvuoyS+f9aI27LrnNpGTn7VKPJ8jKnYU2ns2Bw6y6Flc8J9w3nG/EkE/0nBxQ
 1+dMPFwBSyZHN3e+ZgOKTxa/qv2dqzO5wdeh7W8mVlHoAVUajMA1qeQ5HmOsWq9+NqOU
 iYO/LWu6lF15XzeRug5Q37kFz1sFMP942j6nzvnuqZqElH7Gy8dqO6Rusxak5WLORwOX
 nZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=owaydA/9dfzXygkoQ9b5wC+OlGrAMOC9LEkh/lAzv5I=;
 b=RaH3l46hbp5apvt5oXqxMPJjx1YPUWdz6Xk78VNbKTdYQDP/FC+zS5bYaQd+3LGVkc
 w16x7WW5N5Nrxj5ZXzN+zG5ucM65Bj/ba0gLOoI6jisUK96T+Rae5LzLkyLwJRIcTxJc
 HnGV3Lu7ay+Ai7SEZtktKm0HZo0vzwea0XEzy0UvPWAxJSiy50F1zHTSCFnQ4uX5Fqhk
 sJgVieVQG18bD4HHHb4Y6w5FryjvolvRc10xc7gw4ImHyvDeE7uRY0jGnZmwS0kXV5dm
 14LroIvY0fO2TUOnsSBwVJIg2DpUBxalYdagB1TKKcEZlYVZ9eTiyS7GfXyDklInvyW4
 NjVg==
X-Gm-Message-State: AOAM531JVYrk2Qcu4eb1mbT1SvtfsSLfGwYMlGk6wLi/pd6yX2Cz/GUZ
 qb1jZru1nFDApQfYluUPq744YA==
X-Google-Smtp-Source: ABdhPJw4Q0VPOvcNLCMaHO78tfO9Z0o0vrEmI1ogL6v9qranzZOGcmxPrHs+6HbKgj/geyrRdmBzNA==
X-Received: by 2002:a17:90a:9907:: with SMTP id
 b7mr71543402pjp.137.1637054646807; 
 Tue, 16 Nov 2021 01:24:06 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:f590:685a:7893:90be])
 by smtp.gmail.com with ESMTPSA id d2sm12436413pfu.203.2021.11.16.01.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 01:24:06 -0800 (PST)
Date: Tue, 16 Nov 2021 17:24:01 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v10, 11/19] media: mtk-vcodec: Generalize power and clock
 on/off interfaces
Message-ID: <YZN4se+Ihm2H20GG@google.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
 <20211111041500.17363-12-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111041500.17363-12-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 12:14:52PM +0800, Yunfei Dong wrote:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
[...]
> +void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int hw_idx)
>  {
[...]
> +
> +	if (dev->subdev_dev[hw_idx])
> +		return dev->subdev_dev[hw_idx];
> +
> +	node = dev->subdev_node[hw_idx];
> +	if (!node) {
> +		mtk_v4l2_err("Get lat node fail:%d", hw_idx);
> +		return NULL;
> +	}
> +
> +	hw_pdev = of_find_device_by_node(node);
> +	of_node_put(node);

Raised the question in [v10,06/19] media: mtk-vcodec: Manage multi hardware information[1], is the reference count borrowed from mtk_vcodec_subdev_device_check?  If so, it needs comments for documentation.

[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20211111041500.17363-7-yunfei.dong@mediatek.com/
