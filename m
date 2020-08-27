Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D309525456E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 14:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8169D6E184;
	Thu, 27 Aug 2020 12:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824366E184
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 12:54:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id x9so5016184wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 05:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a5lpHFvSWQoGrjybaXmlV69Axq+442tGTTEhKXzXB/M=;
 b=FGT1CbGRN8nWIZimQQJFHaFlgGbXUWXcohmF6aYnzTMEIdoXLV8ASHcjH/rftf8dPu
 05h7ynqky+tK0sVnESIUNMOkwDJXKaIKOOjfk8ZzK2aS6ItFzfPK1RiS8Sgq9gCPkksa
 s87z1TYPj+YUb/w6uaLEL+ETfgmlzhXCU10ucGJlzNXsBINUdbYoCrfyflOTHYw+cbz4
 RAdiDof8rxMnyZ5hwply2FrDERb1PY3A2wl1RdJOsOW1zwqi8pXPitwO0zzOFjipVey5
 oUPQnIgnx+nqlo3zwpUr7dRtVO/mC+2RV5+VHT1jDZZ+PWuU7gSvtmMNjL2CWO/kpKhp
 IGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5lpHFvSWQoGrjybaXmlV69Axq+442tGTTEhKXzXB/M=;
 b=Iy5RGOAR3q4rQad1FQjRps020UV24v4+cecOufxH7ZaRd8/VcptW4qshQhjS9ayFU4
 d6bynTuDKx5StG5ooM/zvitxbgekbzY6CtNw/UBSdutWmSJ0cbuFmgxPPGIQqi6ydjGg
 XzespsfAIke2noElNIxSSES9Gc3zFTg1Tv5bzxzbHf/XAF4uqERXq2RQ2IZBeksCBbUa
 yR1WFuCQffaiWuqB7ewD1K3PzAcCVkqcpQIhwKNg7a8Dmx+LtUYPivrCmHtXvgqNMh+3
 MZSjekJWJ8of+/DhGJcDZ/1S24l0P+qI8wz3RegRV8+/XyDYHS4iaWpgk+/C8IIUMFtu
 +uvw==
X-Gm-Message-State: AOAM53021f6ln9Z4UbS7cFkLAngk3yWNA6epJZG7kx02rsH1bC/Ww+kF
 oKwB3ug2pfRkGmiH67LqyLM=
X-Google-Smtp-Source: ABdhPJwqZV7pk1FvOSkguIjKJvFkFK+Tun3miq523wTMnXd9BGquVzYW29lvsrXbzl2PtJrmqLojuA==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr3074513wmc.100.1598532878977; 
 Thu, 27 Aug 2020 05:54:38 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id m11sm5436719wrn.11.2020.08.27.05.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 05:54:38 -0700 (PDT)
Subject: Re: Aw: [PATCH 00/18] Convert arch/arm to use iommu-dma
To: Frank Wunderlich <frank-w@public-files.de>,
 Robin Murphy <robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d54f5d47-63aa-d07e-3875-6acce69073f3@gmail.com>
Date: Thu, 27 Aug 2020 14:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 agross@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 yong.wu@mediatek.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 t-kristo@ti.com, kyungmin.park@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/08/2020 14:31, Frank Wunderlich wrote:
> Tested full series on bananapi r2 (mt7623/mt2701, 5.9-rc1 + hdmi-patches), works so far fbcon+x without issues
> 
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> 

Thanks for testing.

Robin this is especially relevant for:
[PATCH 09/18] iommu/mediatek-v1: Add IOMMU_DOMAIN_DMA support

Regards,
Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
