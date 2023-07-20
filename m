Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43E75B39E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F4110E168;
	Thu, 20 Jul 2023 15:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9A510E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:56:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3159da54e95so724893f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868609; x=1690473409; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZUaGgshK7tSiuDfJWDqXManELi0SbVivYa4vNiVvwLk=;
 b=2kcjbWMtu5jkuZoM1057ogV1hCQNF9qQlFv7o7laX7Ec0UwJLiOXiXvPAMcnw+Ooua
 f1cgN0aaXzZuZKlDjK9nH3dFJ3nsMOFHTGZdG+xtxCm/jVu+mHExxhO0vwlg8KwMNGA5
 rga8y6hyrnV66S+kdowSnLuBDzYK+sKIDNk+1AOgyluurTwkrK8ensBP3eO5b+Xkd7dO
 qskxwpKBNT+tyQuUjcRZxwXAgH8KOb3gWINGJZ3731hAPTPWJmsZfcJRqp0edDdL++Kz
 o8ArBZDyuXu64wFuQnJ4hbgsRUJu5y//L7oO99mpWNrPgBxKcfBVPX4u9BcsZHfFHR/x
 Ss5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689868609; x=1690473409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUaGgshK7tSiuDfJWDqXManELi0SbVivYa4vNiVvwLk=;
 b=JF4lllIjdt6Is7HTuuacKLCOlta4dfoCs1LovVqLAf7FqFvyGSDO4cVdr2CBwGWUqo
 8V7NIe5XNPwD47+b5d90NGRS9NyCnxMsoH41c2H94vGK4FLnUC20xSHO7JD67AeRj8WU
 1UuLZZH9NKlQPLPp6vGL2zpCJ4zjcc5uaUgMWNc3cBYznzfkC0hGysOsI7GRTxEg3uUd
 9atbICTkQmCLSU46yUlq5pZHD3A5mgOaxfcMlR/4J+YoqPS7ZFF3ttq/omqLRac6PoDM
 +YGKxdoK4aNZwSUfxza5Ek3YMA7k8x+Wr2BH9l9tu4cfduDlx21KGJo7Je3xlvbntSXx
 p4Ng==
X-Gm-Message-State: ABy/qLbELgUrTa8l5yjsSgkXLlkq9KDjtfio6QRjW6kHG3ppAWg3r0Gy
 B6twJuXmXAhmO3vgZe5XQYPGfQ==
X-Google-Smtp-Source: APBJJlGA2DkEn0lhUqKt4dNDb8D6rF5QRcat3WvydSedezoT3YXG+1Wl3ACqrb3xpAk1dprZGpXTQQ==
X-Received: by 2002:a5d:420f:0:b0:313:f61c:42b2 with SMTP id
 n15-20020a5d420f000000b00313f61c42b2mr2628545wrq.69.1689868609309; 
 Thu, 20 Jul 2023 08:56:49 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a5d5747000000b0031434936f0dsm1698149wrw.68.2023.07.20.08.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 08:56:48 -0700 (PDT)
Message-ID: <ef08ffa7-436a-5da2-ff46-5697cab6d299@baylibre.com>
Date: Thu, 20 Jul 2023 17:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 02/11] drm/mediatek: dp: Move AUX and panel poweron/off
 sequence to function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-3-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> Everytime we run bridge detection and/or EDID read we run a poweron
> and poweroff sequence for both the AUX and the panel; moreover, this
> is also done when enabling the bridge in the .atomic_enable() callback.
> 
> Move this power on/off sequence to a new mtk_dp_aux_panel_poweron()
> function as to commonize it.
> Note that, before this commit, in mtk_dp_bridge_atomic_enable() only
> the AUX was getting powered on but the panel was left powered off if
> the DP cable wasn't plugged in while now we unconditionally send a D0
> request and this is done for two reasons:
>   - First, whether this request fails or not, it takes the same time
>     and anyway the DP hardware won't produce any error (or, if it
>     does, it's ignorable because it won't block further commands)
>   - Second, training the link between a sleeping/standby/unpowered
>     display makes little sense.

-- 
Regards,
Alexandre
