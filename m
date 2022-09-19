Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37335BC5CF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 11:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B0610E5E3;
	Mon, 19 Sep 2022 09:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4933710E5E3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:54:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l9so6640444lji.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=acfZNlSk6UDSUFER86iU5/oC+tWnJPYzNY85ToWvplI=;
 b=qfjkJOzXVYyBbWBcP7ScnhEr3K4rRvVk5rRFs1OF/IhXIcCx6uLOkHA2R32bWSNb52
 5caWhhw2LYFoBao51d6Yo0KY2AIBTSHg+QnKa7HxvTNoOshJ/tHBsHX38mjzLh0+H6Ee
 4fsyaEhlpXl1wpJC3pjQYWXzowXLs+gWWaVzVzDBYTxZ+nP41WOqMcEipwrL1zpuGxND
 p1m8qpVVRXkoNMN8xLi/+m7PY3PqdbA1YgMysj/KPnvPX5xxBZ9c2bxmGfWfnuNGf08t
 1n73JgcdGa+B9fnnGY1IKwJN1dgH675rZsofUMF2WwtMQ1f8K5lM9wlUgkjt0f1tKhrV
 6rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=acfZNlSk6UDSUFER86iU5/oC+tWnJPYzNY85ToWvplI=;
 b=FarSQMtkhuCwf+3DVhCFTwF5Z9MILIQptcQVUfhYUrSVxgz7g1bsj/LM3sJkn6yXM6
 O4U3rpePpQkZfyfYE8rv24rJPOrhNTHkYoYo4P78wUWFbucnkz4PsEqitan521EE9Whm
 pWbpz0XqgVW/XX9EtOSTiIJNcDz0vO0MHv0RoeIHYVCvf1d1LM2VNXezooVbUP/mI530
 owg2mbYHCqMroti/+2bmZA3MCzmnyfAW4RojdG0Fvi4svUSis5cRFrSboYgS5roiJFeW
 1z+5mr7C2h1tpcQvTi4pIHJgX1hUPKJyo6g7NztMLBGkOT+QgjgrhKMlxnFOnj7hX5pb
 bLDQ==
X-Gm-Message-State: ACrzQf2avF2hoJtcBRkwyt/BzynSrFJ2agZ+sPnupnxirjPAfIV7xv3o
 kFKw56fzdW1mHSqClo24ERo=
X-Google-Smtp-Source: AMsMyM5s1lURiFkaTiES2Do+Gp85hVbFMOUBWEtYF1ETax19T1vejZL/sH5OF3FW8EhMfG9KBBZ7oQ==
X-Received: by 2002:a2e:b893:0:b0:26c:22e0:716d with SMTP id
 r19-20020a2eb893000000b0026c22e0716dmr5260362ljp.48.1663581273645; 
 Mon, 19 Sep 2022 02:54:33 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.122.187])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a05651c106b00b0026c3e350682sm1347948ljm.14.2022.09.19.02.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 02:54:33 -0700 (PDT)
Message-ID: <7fe977b9-8e54-96cf-91da-49f0861ff945@gmail.com>
Date: Mon, 19 Sep 2022 12:54:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/3] Refactor MediaTek DP drivers
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
 <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 liangxu.xu@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chun-Kuang,

18.09.2022 06:17, Chun-Kuang Hu пишет:
> Hi, Dmitry:
> 
> My tree has no mtk-dp driver yet. Would you like to pick this series?
> 
> Regards,
> Chun-Kuang.
> 
> Bo-Chen Chen <rex-bc.chen@mediatek.com> 於 2022年9月16日 週五 晚上9:38寫道：
>>
>> For this series, we do some clean-up and fix a build warning.
>> This series is based on linux-next-20220915.
>>
>> Changes for v2:
>> 1. Update commit message in "drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()".
>> 2. Add fix tag for "drm/mediatek: dp: Fix warning in mtk_dp_video_mute()".

I changed commit message of the "Fix warning in mtk_dp_video_mute()"
patch to make it less noisy and applied all the patches to drm-misc-next.
