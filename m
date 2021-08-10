Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9FC3E5619
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 10:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87EB89BF1;
	Tue, 10 Aug 2021 08:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC45D89BF1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:58:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso1396465wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DZGtTjtzuONYDWQ02eZzQw+Y6sEYh4NUv+medlIAmQg=;
 b=egqehrq7CkJ97r5UIn8xQu8mS1JgYuuTIE88Yr6sIQfBuwd2f3cHYoXKMX5k8AeOXT
 zcUZLaJ8nM2QHotO5d3amELtbpr5YHHBnRivUmGei8ob2B0yF/kE17hSgB2+UeCPt6bs
 /XBwAilgaoeOgcZS/M1mzAMCszKBTxDuu7jvE5qEuROo0PihhQjFwWlKxFcDxcAkBClU
 KgEZC/o1yeHBeQM70+arvJSHFwDSSWfSN9IeCCFzfSo5s+/YISjacxmz6WTxzGtZVAa/
 ULKKC+SUT3ZMYXSc2AErLxggUjsNYlYgQ4kQoukWF3kc35qWCOX0ClymcFvgI76KgaXI
 hCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DZGtTjtzuONYDWQ02eZzQw+Y6sEYh4NUv+medlIAmQg=;
 b=kG3ToOFeDZh+Kf1foU/ZFYgBdSvK4ZSydkcPltdWtrUeHZWL61hgwOTppYim+a5Vwo
 WRMOR6qJB80KbH84X/i4QYhpU295Tk+HcHxQ2xXeJ8fSIKahg+LJYkq+wpa8odQ91ZbR
 uNV+0d09Dcs4VviqguF7Nc/QpE9nYO2AUTD2bc7WSrclpuKx1OeKED1yim02nDVQBeLF
 2USy6A+NOJu/izK6oPDCCqviTte3j7FPzb+W1tz9Qbx7ueFO+hlxMi5vBSm6t9/tOUMQ
 d+nuK8WG//Bb01IkGqefmcetpOFl3hWQveqWpFh2YtSouxSj819g/IE7XyTN/IPbsKjm
 at2w==
X-Gm-Message-State: AOAM530Kj8qRFsTHQqEU7FutOGz6OhXd4NL3larspuwNqv6fLTpkADnR
 Hf/c3okVEyPSI++sNzgHMqE=
X-Google-Smtp-Source: ABdhPJzPEKr39AcsB3Lagut2U7pslSZe1FaUFeq/Uoj2qWkA8L7OvGIH6bMmf40+xCTrTTMonQ/omQ==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr15181735wmz.93.1628585934443;
 Tue, 10 Aug 2021 01:58:54 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id o17sm22127178wrw.17.2021.08.10.01.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:58:54 -0700 (PDT)
Subject: Re: Aw: [PATCH v8, 2/2] soc: mediatek: mmsys: Add mt8192 mmsys
 routing table
To: Frank Wunderlich <frank-w@public-files.de>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
 <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
 <trinity-a5eeacb8-1625-4111-b613-19ee1609b902-1628062221917@3c-app-gmx-bap67>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a09da534-274d-3eaf-6c4d-eb2a4817626b@gmail.com>
Date: Tue, 10 Aug 2021 10:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <trinity-a5eeacb8-1625-4111-b613-19ee1609b902-1628062221917@3c-app-gmx-bap67>
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



On 04/08/2021 09:30, Frank Wunderlich wrote:
> Hi
> 
> can you please test if your device still work after applying this
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210729070549.5514-1-linux@fw-web.de/
> 
> and
> 
> duplicate value constants in your routes?
> 
> e.g. changing
> 
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
> 
> to
> 
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
> +		MT8192_OVL0_MOUT_EN_DISP_RDMA0
> 
> regards Frank
> 

I did a fixup for that in v5.15-tmp/soc

Yongqiang, please test if this is working on the SoC.

Regards,
Matthias
