Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A27AC441
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0195210E072;
	Sat, 23 Sep 2023 18:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B6610E072
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:02:52 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso204614066b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492170; x=1696096970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fyFVeqB6utZDh9GVjHOfgFse9+GghiI4681cEKbsRig=;
 b=A/X7hb4H42FlqTy4jrsdSg0O7F+EynimUA3/thKYAJke+APzl8zPQlCL53r1dGRPOu
 SCjhIrYPIds0z58YXXITOwoMv05Eli5D76+WQefRGRjQYKlcV2aU2BrUC09aRQpHp2pY
 ior2aKxmdsS0doJKBqWapId15ErxcNgswnAr+6fdHufxCOlUjzSYwJqQ6qB93ir9fnU1
 7UFSeGVJ/0S2JHdhC42XkxI3Va6WOgwWK934RlN+OH/duy1ByuazAdwO5taQ0ukrour+
 bKEYzNoUXX35JQeaoVHdnXD9kvoFEHvWv71uoW06mCu0vnZrqQ08DY034Ib3jQCdIlJW
 STfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492170; x=1696096970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fyFVeqB6utZDh9GVjHOfgFse9+GghiI4681cEKbsRig=;
 b=XzVmJA/poERh7kiSdWnbdOa5wZC5n10GG80RRiRT3pyh7MvURkGhrX6yZmd16sLgjh
 3/XSyyEyAIJvLgBY1z4x26M2HwBU0o+q1soQBYXnlXGayj2GveJLuW9iW+SLT6PLOI/W
 7Tcks+JaubQVUIT2e0VH2u04IskRTfruzIsLUKb4nN3a/afhPkk0qw10cXkJStnseT21
 kCc4rKnvuKvefMFmaRvSs7VbO6ON+9v/diV8M27nYDGGTaH8QfvVFCuqKv4uxIVrQbF5
 MPMuf+PR3AsXQt5BoVGWmU5FYA+PKLO2M8a1Ac6pmpBD14s6iqXRkEpYBJfkFSh/DORz
 +URg==
X-Gm-Message-State: AOJu0YwUyMqjrqHNVD44zVsZokgf2sL1MvdTHnUj14BbdUe8JXa/Tji9
 wH/2xyEjYT6pgZGpm029wI6B1w==
X-Google-Smtp-Source: AGHT+IEzoIT0eyHgVB5pvxp9pVgGOLU17x+cfcW4hEsmequbeIVUUbsvdCtIG8lzr/pdPnUj/8VHlw==
X-Received: by 2002:a17:907:7888:b0:9b2:6c31:c500 with SMTP id
 ku8-20020a170907788800b009b26c31c500mr1764699ejc.35.1695492170664; 
 Sat, 23 Sep 2023 11:02:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170906080500b0099b76c3041csm4131586ejd.7.2023.09.23.11.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:02:50 -0700 (PDT)
Message-ID: <95f61cb0-f0a9-111c-1541-88d51c3e5748@linaro.org>
Date: Sat, 23 Sep 2023 20:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 06/15] mailbox: mediatek: Add cmdq_mbox_stop to disable
 GCE thread
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-7-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-7-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> Add cmdq_mbox_stop to disable GCE thread.
> 
> To support the error handling or the stop flow of the GCE loopping
> thread, lopping thread user can call cmdq_mbox_stop to disable the
> GCE HW thread.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 6 ++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4d62b07c1411..8bd39fecbf00 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -469,6 +469,12 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>  	spin_unlock_irqrestore(&thread->chan->lock, flags);
>  }
>  
> +void cmdq_mbox_stop(struct mbox_chan *chan)
> +{
> +	cmdq_mbox_shutdown(chan);
> +}
> +EXPORT_SYMBOL(cmdq_mbox_stop);

1. EXPORT_SYMBOL_GPL
2. Missing kernel doc (full doc)



Best regards,
Krzysztof

