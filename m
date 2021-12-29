Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0AD481039
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 06:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A94E10E2D7;
	Wed, 29 Dec 2021 05:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D3C10E2D7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 05:56:41 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 2so17639978pgb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 21:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yw8/kl2LGfHC+BRmnmcCo9TSrmmH3aT+nAaekBOiO84=;
 b=Jz2/jPkRYhFOljG62i4B7CbqP2s+5rpiUExqAr3THdm7ApWZCW3quUvQUc6TCbjvXz
 ZS14n6yc5QX7S5//GZczK8jcqzKPY5Zyj+klFtCJZ1s/5NB/NociQFp/J76l+mH64w6j
 vnrH+eOPmptJxsrYRNqWFoE4Edo4GPZq0MjWE/VuxP0VhL/nseetd/yZlI6GiXECgGuY
 VNRFeWWXwryJXwVTH2juslXxwWQn+tPh92CK6Y6p1Rji40oy52SzTwEXxgITl+fvCkjm
 yDjpc50piI01C8nsF6lTsHaNgygcBX82iTuGLucZYsVz+AFNhcyUPnhKP67hEITG4wrG
 TiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yw8/kl2LGfHC+BRmnmcCo9TSrmmH3aT+nAaekBOiO84=;
 b=u9m/g6g25ak4jK1unOYAkV1AqQrG90I3ysGQXA+efRe91vXM86jbCkYLNylD4y0PrM
 j7YVHULhZa/HF7iMxk/8jC8cOrHvMqZycE8S2Q8o4A3VjGAyEsg1P0hbmTz9BJMTGYPU
 5uylOLZOy9ln6jgLRaRzp5doDDcefYjIs4pLNFNOgHytdqEbJK9vGBSj8LXug5fibFIX
 /nLTfbPDnoB1Xx+lwSsrdywmrF5HVUxSmclNFHAp80ZotTcH4l/+4aS2ufKNx/DVJ7s9
 KvngN6UyKdOSt7kCu++9+Xm2EkaSZ+0SAihkNrTFiixDsTSaW3Y2Lttx4l6lZ3bALgtC
 8tDQ==
X-Gm-Message-State: AOAM5320XRX74O7AbxF+mAoDV6vJ61gEJuP9d7czSdtFEhO9LdmAdywU
 BArD3hXSUGf4OnrwSqRxqpLVQA==
X-Google-Smtp-Source: ABdhPJzWVI7pbJHuImaGNh5XJMu92kFHsTAwgUYOuJm6wAZ5cXRl312R6S9VJqBw5q/POmfLp7/urg==
X-Received: by 2002:a63:ab08:: with SMTP id p8mr17578168pgf.617.1640757400456; 
 Tue, 28 Dec 2021 21:56:40 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id cx5sm20766657pjb.22.2021.12.28.21.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:56:40 -0800 (PST)
Date: Wed, 29 Dec 2021 13:56:35 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 04/12] media: mtk-vcodec: Read max resolution from
 dec_capability
Message-ID: <Ycv4k+xHupjrualp@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-5-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-5-yunfei.dong@mediatek.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 28, 2021 at 05:41:38PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Just realized this on reviewing the 4th patch of the series.  Please fix it to prevent from showing the line in next version series.

> Supported max resolution for different platforms are not the same: 2K
> or 4K, getting it according to dec_capability.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
