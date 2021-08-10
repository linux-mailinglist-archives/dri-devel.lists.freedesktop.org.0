Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE63E55C5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4597D89C85;
	Tue, 10 Aug 2021 08:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B8D89BFD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:46:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q10so1919904wro.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OB6UtG4zFPtQqAnDfNSTJxFcLRUWyCnisk7BYFNOzqE=;
 b=MerkW78o00SexssjoYMursF3joCceU4hD/5+wHLYpy7d/PfUX8ryPbMCCupegOkeHB
 HGd71w077wojxCfKiNmEuEbmFnSB4py22cDyeGkMMiRuAG0g/cRNUrlzUUqYAnpzHMfJ
 6DmexI6xrZ+TyEwj9kq8PKP25/kJSuE4uaeB4dzTinACNPKTXLziqiAmQnyPji0U4bCn
 X1BYBwXyEdBkbSYHqnW9AEx6ILBMH5lAJdWPocfstxodvSdKy1MVghgpAB91WXrRjZzF
 zdLbFsJC7Z/Vi+nMWAhOcM5D5r1vLwdIXHCbMvMri7Bvy6F0FUaWLXnTaoLD7IkMJSqs
 xuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OB6UtG4zFPtQqAnDfNSTJxFcLRUWyCnisk7BYFNOzqE=;
 b=SpN8RqVkjjVjwvWF4DmUwN/gl+M7bFKrRf9UQzfawg27aLz2eI7DdsVfppfY4/VC+i
 rOiQqeCeDR4Ca/iFQ8ytbp4BAv2uhvEDEiPM/KNYCXCf4U8IqG/QIv41ejBNWTx7+pD7
 +gmvueTj7+q5H6gg0YPGeofGej4RLNAFtDVLrUFwpso6rwAyE0RnjgGrOQvajiJiS0D2
 C01T/o/NwQCqFouywa0Tnov+hXIZL243FKCbxhSSc4Z+vCExDGUMha7TmArhd/AiEF2Q
 KbzWO86Vm9e8PIg6sAuTFflacl+Up2fh3X9xyIRilN7G5d+/kSFrGCBq/Uyv9oprGzo/
 rVYQ==
X-Gm-Message-State: AOAM531WhI8pux3mB5rrwp5M8H4oXqagKaQNo4KvifJD887FOo1WgnM9
 2n5Xt1uMMfd4hmBbNoS+XzM=
X-Google-Smtp-Source: ABdhPJz97nyY/SNStvhPEdEAKxnpS8lnpteyvnRLKrJfZ8hjlqRCL9wOivECar5o2rREqAcCv2P3eg==
X-Received: by 2002:adf:80e8:: with SMTP id 95mr29812738wrl.388.1628585181037; 
 Tue, 10 Aug 2021 01:46:21 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id j6sm7920180wms.44.2021.08.10.01.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:46:20 -0700 (PDT)
Subject: Re: [PATCH v8, 0/2] soc: mediatek: mmsys: add mt8192 mmsys support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e4afa712-9936-15fc-ad43-576948758f6c@gmail.com>
Date: Tue, 10 Aug 2021 10:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02/08/2021 10:59, Yongqiang Niu wrote:
> base v5.14-rc1
> 
> Yongqiang Niu (2):
>   soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
>   soc: mediatek: mmsys: Add mt8192 mmsys routing table
> 

Series queued in v5.15-tmp/soc

Thanks

>  drivers/soc/mediatek/mt8192-mmsys.h    | 67 ++++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 11 ++++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  3 ++
>  3 files changed, 81 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
> 
