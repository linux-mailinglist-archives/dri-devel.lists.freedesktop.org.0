Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCD77AC444
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7594010E0A6;
	Sat, 23 Sep 2023 18:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADB110E07A
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:03:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99de884ad25so484626166b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695492227; x=1696097027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xze0269DJpz1msfiE6vhhaaDti5lnwQMTzvMi8h07ck=;
 b=bybmSyU0z/B+dT3AXwtrOgk1kveNllAakUx9SV94sVfsmqaXxWdbcRu/lPNXJo9SiM
 QeAF/po8opxtMiT34JgsJV5DESZ/j1s1S9HQXc9r9D3zJhaG87amO71SB40Ih/h+LQTJ
 zbDnYsKDjKE1epsQxfYTz1Zp4la6IvflGpRx6Hq/2iWncRC0y0QBC9wBPNhMLGQdLWTh
 SLZO0f0WPCaSluha5dqPP+V9geWDtpiR+m+vm6SS6s8b8G+MmnyVah9x+y2UPvzhyDNb
 mhI/XNtaF9qIPkRD2ATCsG6PmSFY25T2A4QhTsXfpIMDb5MZMt9Sw3tLuCqic9uLyi7/
 S6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695492227; x=1696097027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xze0269DJpz1msfiE6vhhaaDti5lnwQMTzvMi8h07ck=;
 b=TkcN09vTgUr/j5B3munnxEEymUMJ8rQHUguv+EQ+NNN4HhAxW5ot6rhQZ6oqFpmgKc
 JfbdK6KM0/sq8imJI9u4RIEFvaXfEQmIU8kKCF2mKhEikySYRNT+WVdUUIxASOeFSNar
 BHQQ+MtVo3BWpDnDkFz/jKrXqfZonbT4aYa4OqI2xm3pcXuoib7xENfhlIolP4j18moZ
 hnkLgnr1otaLbKLmMUuSiR6/wiPCfWlhNcN0A02QI0x1niXUushCNDFwosuumTmxq2gP
 YIqZ3X6w+Pk23rHTTQLpWD/9Iah6/YI708XXRnJ8Nr+ntdDPx/UfRMpaONGBBZYLtizq
 hPiQ==
X-Gm-Message-State: AOJu0YxN1feAQQe++S792Oe8Z4AZTjUFFNtuSdUnWVGAjxrfCPE8lv/Q
 nBvMM6ti5Uc72YjIim6whU8wfA==
X-Google-Smtp-Source: AGHT+IFIyimj0pgZ7ge+avAiCLM3XDnvT7w8KKsHu4Up7SRj6VF0hmPmN9BzVV/4AJRLlC92qYiVLw==
X-Received: by 2002:a17:907:7897:b0:9a5:ac56:3b63 with SMTP id
 ku23-20020a170907789700b009a5ac563b63mr2138758ejc.63.1695492226723; 
 Sat, 23 Sep 2023 11:03:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 gs10-20020a170906f18a00b009ae40563b7csm4129447ejb.21.2023.09.23.11.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 11:03:46 -0700 (PDT)
Message-ID: <5d528036-e506-7b95-69bb-7748b26d2aa8@linaro.org>
Date: Sat, 23 Sep 2023 20:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 07/15] mailbox: mediatek: Add loop pkt flag and irq
 handling for loop command
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-8-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-8-jason-jh.lin@mediatek.com>
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
> CMDQ client can use a loop flag for the CMDQ packet to make current
> command buffer jumps to the beginning when GCE executes to the end
> of commands buffer.
> 
> GCE irq occurs when GCE executes to the end of command instruction.
> If the CMDQ packet is a loopping command, GCE irq handler can not
> delete the CMDQ task and disable the GCE thread.
> 
> Add cmdq_mbox_stop to support thread disable

How or where do you add it? I do not see it in this patch. Your patchset
looks randomly organized.

Best regards,
Krzysztof

