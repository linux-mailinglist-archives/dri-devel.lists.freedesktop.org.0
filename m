Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5306525D59
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 10:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C6E10E348;
	Fri, 13 May 2022 08:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD35210E348
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 08:31:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id k27so9090968edk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YYULx/OnPBkCECxsG7VLLrURpygBJH5ZkPirFud1SVE=;
 b=lOSafNyROulnVy8THJdx8OKlyBp0zwQHyJxgAmnLmuvlJPXUQF6yKlQzqJX+YkhqTz
 9dMeIkz0Gesa4LD/jWqEOyP4/iV/i/i+RqImeVsg8fPLrANSOZUP/8ZI0G1fI0TXuQQh
 fyOS37pzxILCdPITgn9x4MZ51yIY/pQQJN4EB21dwewt7QPRrdwQjF6h49xNK7Rhz/by
 cqXV4Amnd7jgGV4KKE87OsU26ETTVDJOXwQV9FhCQl/mted086Lzk6kV29AKolgRiAlJ
 zFeOIO3gEec5+ZuyTb+eNAjU+MY/V8YGM42itBGARoxVYbSdgRvH53x7TQGKuO2Wqrrl
 0H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YYULx/OnPBkCECxsG7VLLrURpygBJH5ZkPirFud1SVE=;
 b=IlXytb1JJBSngX7C8TrUvn+0wn0WRJQTvk1ImlRAgK+v0HpsgBm0SZzpeKNPWRQvAE
 kAH9p05hxbPTOdKxTFFgpFuWbG95Zt78TA0ldye98IyHOAduOKFYwN7qjtFVs4sVsTjq
 4S5wRq1IoBRgrxAzWqlK4W63zK7jvJLGaWLt5YhQgn+z3UfwFiobYpaevXbbRumZn58m
 PosMlxDQeUSQYxSyu/QGNFDdYX+1VJ3469OJ/dxD3VMUTW/JEs433jivqIaeGmuBxwT8
 Ew08RuiV3ns/iA8ryoHgekaSRmcUuZpR8QRBMMmYCCFc0hxnGAaB8f+7p3FtOjEpyR2v
 icPA==
X-Gm-Message-State: AOAM533umm11yM1gvEfBBf9Ajnwt3p5O3TNjiHDvsbu/KRliuGb0J+zo
 Qi+YVcGGOKV31H0uGnf06RAwVw==
X-Google-Smtp-Source: ABdhPJzd8GPaDVoXg/OxBKEu0HQy+3pM0sNyGWfsDQVQO0Bh3xsbSY7T3pykqwPP6VZN+RlPSF0mBQ==
X-Received: by 2002:aa7:c6c3:0:b0:425:b13b:94f with SMTP id
 b3-20020aa7c6c3000000b00425b13b094fmr38756205eds.313.1652430660375; 
 Fri, 13 May 2022 01:31:00 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l13-20020aa7d94d000000b00425d6c76494sm675174eds.1.2022.05.13.01.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:30:59 -0700 (PDT)
Message-ID: <e2895c7e-0a1f-b81b-25b3-0653c7e863d4@linaro.org>
Date: Fri, 13 May 2022 10:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/3] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
 <20220512080523.25082-3-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512080523.25082-3-rex-bc.chen@mediatek.com>
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
> Add vdosys1 reset control bit for MT8195 platform.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
