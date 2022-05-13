Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C40525D58
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 10:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1BE10E10B;
	Fri, 13 May 2022 08:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF70510E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 08:30:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id n10so14822109ejk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rIdMXWo1r64Y4/FoS4X9RpN/HRh3/syFTT7xnGA6T5c=;
 b=kYn9THiEvjgdOi0srB9gv0TQcb1JT6AXp6rZ7l1PrnDHo9qkMGlSwm7w8VteNAoqP2
 I1hQw5r+p9CvNNrd+cbvslCXTbQhhWoY+/b8VMs8SRlRmlPGmUtUZxPH/BAnN8ZShquT
 i+Deg6SKr82BxkgfXu7yGOXRtCVnE/butUAWCAXyDy/QP2xl+DFxPiGqGeAYrLU5kZxK
 2OD5B8XN2qmudqjk/H1QcleJQzIZ2ZsA/l9eEx+gFhXAyFSjDIG/6ZZLj411OxtRbG5x
 86y43GfWeayMPZbFTNXzs9A4ag06Z9uxI5N7+mSk4coGdp5Kv7xQiHljskPrXxntCpQU
 7YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rIdMXWo1r64Y4/FoS4X9RpN/HRh3/syFTT7xnGA6T5c=;
 b=HfiwzSV2jnSJzhYJb9FbG4YExvxhCyWHLt4Nv5OWczud3Q5E6TeXbSiQ/ADHc6xhEp
 Dr5ODVmkjPBkEvPK1a5PVDSpI0rp/g4Qi+0HkOE/19/3tsFxxX85pTi9ZNNySPKjYrTv
 a4EGQH7L8FnO+xw6+KSgoTa8FxnrtXrumTaofK+AqyK46Zpb8vwc471u1wBS/1NsxUsf
 aD04gmgtBH4VmtiN0J39DgualmWwl7JttndoZe7vpaUqraMlv8Tfku2o4QGSHZ+UOdB5
 MJVNEncWGzlbbq8w1DjHrKnsxp2sM3U6jcK80yGTaEN8JASmYuBnA5irmgddLylaI1V1
 ZB/g==
X-Gm-Message-State: AOAM533hBQ9EHKi+6svS9Yrc7b9GYMHPIsJRGZ5DgFZ1mxi7INqYl1ey
 tMzKLNcOBaUe/pPGsAmKW04/Zg==
X-Google-Smtp-Source: ABdhPJyJ2MbVQT4SxCH65r033Zpdd9f9AOE/v8ahHMI//oxZ3uzkmD0d6awASJrIeLl4rZ47+JH2TQ==
X-Received: by 2002:a17:907:2da7:b0:6f4:801c:6c3d with SMTP id
 gt39-20020a1709072da700b006f4801c6c3dmr3119325ejc.310.1652430640281; 
 Fri, 13 May 2022 01:30:40 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 f19-20020a50a6d3000000b0042617ba6392sm655223edc.28.2022.05.13.01.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:30:39 -0700 (PDT)
Message-ID: <c4278f18-359a-d658-7b42-0a701dd15270@linaro.org>
Date: Fri, 13 May 2022 10:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512080523.25082-2-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2022 10:05, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
