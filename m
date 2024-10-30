Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C713C9B5994
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 02:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E97210E274;
	Wed, 30 Oct 2024 01:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wk5+Yl6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8325A10E274
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 01:49:21 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6e5cec98cceso51064087b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 18:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730252960; x=1730857760; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vQfV3QO9KjfChtLzJsZNfhkclfq5Ha2/eewFg3kibJg=;
 b=Wk5+Yl6KlvBz8IdcDOvMscGNLFpURfPRZ9hUuvT17x+V2dxvR+H/asxViqtq307Q3y
 p0E1NU7LUwctRorI4xHM5TTLl7wBfTg+qOdom33mH3wZWYPVZru63CGCdMNFudHThwtw
 5p3SnK693kfuTb+iddc5aNLh5r2duxPyEjcVn6KJI4RkLaKbUXBjz3epNmG360WjtJI5
 QTxO/aHfhyD2IGvX37Q1sIwKeYtQC9veheyhJ0tgR6IYwho7tGTb4CJb5UdfYjzt/71r
 CCXl3VVJITX7WQSJ9qdELxtwOqrwPxDcHH+VCF07go9tPoV1r9mcFDApU4DIqcSkTUn1
 VLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730252960; x=1730857760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vQfV3QO9KjfChtLzJsZNfhkclfq5Ha2/eewFg3kibJg=;
 b=E+pO1WBRuQl9CRViCuYv+yrw6Veoha0NY8Ft43cLtlrebpXG73bYQIU0qwLyS8Sosg
 VNpPkZK05dn+0g7n3NWTpxe0V9528tO3hjCLDvhjCb2YDSfsMBMxCVF6CZ/h51PcxhEc
 YisXWKcHXxNLTZ0PVqrr5SOurhTukdS7DJrlsMC9l5RLvbeE8rDHWp1PU/wxjHWPMPGs
 mXTaUqPM2S0eA3/gEDFGmKd0zRsP2HkbIuVYIAno3/ENU+o885LhTJuCx5n1BnhHLF4k
 BYN6615Rb3oy1ksWc2K/V9otEmRSI1PK+HrtDj6InYbxHdbGJdej/MW4Y5IhzRF4703e
 uq4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8DAYZ8+9gSMakcIDLWphTWx9uBSY0noXjNAjJS45ynVd7Pz0MTrMNRgOEd5XE4ysE8du1ztgLTec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjyvGKlAG/KDq89T/NwORKqj10g8UI4vX8O1kX631ChTfblw2g
 k4jWnUVN0YOGVqrIP+ukoTVCjBPi3enLiZf9iIzeZ8YuKuKAj8Fbk8yfr6WqaR2iqu03eDCtwnv
 irgm5ywM42qC49lbgGomQX62RJ0AKK/1h30RDcQ==
X-Google-Smtp-Source: AGHT+IFAd9OlkY1/IfgnYCIVx3fRmdHwRO/F3PUZW4uFE6vgj8FUomr2ncttaV4zBKegVHV0ggfRqOb9u7zb2JD2Bls=
X-Received: by 2002:a05:690c:87:b0:6db:b5b2:53c with SMTP id
 00721157ae682-6e9d8ab3cbcmr150957977b3.32.1730252960419; Tue, 29 Oct 2024
 18:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241022124148.1952761-1-shiyongbang@huawei.com>
 <20241022124148.1952761-2-shiyongbang@huawei.com>
 <wu2kwdqce7jovidzxhublmpgdhzq4uby65quo7ks44tfjhtgd2@qtfogva3exyg>
 <c418e93a-7305-4ca6-85c1-42bd458f4e7b@huawei.com>
In-Reply-To: <c418e93a-7305-4ca6-85c1-42bd458f4e7b@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Oct 2024 03:49:11 +0200
Message-ID: <CAA8EJppvnAcj5ESHe3t2QBvTGZTpiUUS3K+tJ+4_3Pkuijga0g@mail.gmail.com>
Subject: Re: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, 
 liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com, 
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Oct 2024 at 16:15, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
> > On Tue, Oct 22, 2024 at 08:41:45PM +0800, Yongbang Shi wrote:
> >> From: baihan li <libaihan@huawei.com>

> >> +}
> >> +
> >> +enum dpcd_revision {
> >> +    DPCD_REVISION_10 = 0x10,
> >> +    DPCD_REVISION_11,
> >> +    DPCD_REVISION_12,
> >> +    DPCD_REVISION_13,
> >> +    DPCD_REVISION_14,
> > Any reason for ignoring defines in drm_dp.h?
>
> Hi Dmitry,
> I tried it but still can't find it, if you know, can you tell me which macro I can use?

# define DP_DPCD_REV_10                     0x10
# define DP_DPCD_REV_11                     0x11
etc

> Thanks,
> Baihan


-- 
With best wishes
Dmitry
