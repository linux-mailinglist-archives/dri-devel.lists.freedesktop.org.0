Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0173B813
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 14:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A503310E12E;
	Fri, 23 Jun 2023 12:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D424910E12E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 12:49:53 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f86e1bdce5so748353e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687524591; x=1690116591; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EhlfjvXk50HY0dxxS/o40p/sBacIVTPIf3d4yaE8nRk=;
 b=cv1kJNtSxIFXCpvg1E8j4TAg5Wwsz8w8ZT0uk+BNv4h8FcIk4U0QOrNyVqzz09BiqZ
 e3uu2CCW9uLUbZIzcydiViU7GcqqsWsDwIzx/cjQGfIy0kpQJ2ZwaV4aEEZ4K4Ve4a5X
 jJQCNsxRTto/1P5YUXUJmRMd8qwD18t4NK9veNLuxEIxZKc3eKcf1SGZWetDaXG8cYyb
 C4H1XXcBXZIE926Vi50vlBlLhMCI/NA91O4g9V0a926sIWLX4SI/p8AM6aRT4sR2e9KX
 flEgspUWAkpkqH2jVf00h2MhTDtsDk8aq2ReQ98Jwo5gb1vU5iWnq0zw0tdvUHVCg6qn
 5pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687524591; x=1690116591;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EhlfjvXk50HY0dxxS/o40p/sBacIVTPIf3d4yaE8nRk=;
 b=MR388BVny/Odjx7JC/p6mG7o9ZhurVbilE833tFIfENjo7nTT2IXrchCXFkNwKwF3V
 RJNQQni0QRUDMcnZoduLTebxBulBa0qLfPy9inlt0Zpe+D+feeVC5bhTzP+tC84HqxON
 plYhX4S4JcBiJ9C4Su6HXehGgFpQssbi8DnKRydiF06H8zFuveYYzUcT6z5b//JXtyY2
 aXzSIfq1XZ2rFQCwdYPUAmvCqy9c6VWZvuFZ2MFptMnXcbybxuRzjwVAvBxSWgP9ebXB
 sDgMVwkiz67sQTvWvppTO5SLUAqn0kR5Nkzu44uMWzt6UgDLCVzbJ+o2yHlETZhFJgzc
 j0mQ==
X-Gm-Message-State: AC+VfDxmu5oR4KNwzImmVDpT9KVrrBZGGa32KqUMX1mIA43DXMDN43Fd
 HF0gRsBKLeK/isY2cXQS2zMtGHlcxmCtqRdNJX0=
X-Google-Smtp-Source: ACHHUZ5v+H4dOh7wk2wa/5G/ITOXbVtQpt1meXROCzcGDQTezN95zKQV28voSkTaaIZmBhSPFVQq/w==
X-Received: by 2002:a19:5004:0:b0:4f8:7503:2041 with SMTP id
 e4-20020a195004000000b004f875032041mr9171058lfb.37.1687524591350; 
 Fri, 23 Jun 2023 05:49:51 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a056000128200b003062c0ef959sm9550892wrx.69.2023.06.23.05.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 05:49:50 -0700 (PDT)
Message-ID: <6c71deca-112e-2ef6-9098-902bc4b92324@baylibre.com>
Date: Fri, 23 Jun 2023 14:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/3] MediaTek DRM: Clean up CMDQ support and ifdefs
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230623094931.117918-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/06/2023 11:49, AngeloGioacchino Del Regno wrote:
> This series changes MediaTek CMDQ support to use the mtk-cmdq-helper
> functions, removing duplicated cmdq setup code in mtk-drm and also
> removing all instances of `#if IS_REACHABLE(CONFIG_MTK_CMDQ)` while
> keeping compatibility with both CONFIG_MTK_CMDQ=n and =m/=y.
> 
> This applies on top of [1] and [2].
> 
> [1]:https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
> [2]:https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com

Hi Angelo,

Can you provide a public branch to test it please ?
I tried to apply the dependencies but still have an issue with the 3rd one:

https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com
OK

https://lore.kernel.org/lkml/20230524093412.92211-1-angelogioacchino.delregno@collabora.com
OK

https://lore.kernel.org/lkml/20230608084727.74403-1-angelogioacchino.delregno@collabora.com
KO

Thanks

-- 
Regards,
Alexandre
