Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9C3766DC9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E774C10E6E6;
	Fri, 28 Jul 2023 13:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3BD10E6E6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:01:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso23050435e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549304; x=1691154104; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jb3oJuceNFsIyuY2+c/BQpFgMtKHX3DFUwV7BlO22rQ=;
 b=xKFkf3KeKsEZ7MlGQXbss31BqYAtexCwGSFhibddZbapf6TQJRPQdZl0EH1lvY8NxG
 G8kOfa2vdunheArARTB+wyRiRVC2fGqyz0FffoadHHyxTaAUpzsygZMHFMjd8eWKXoii
 HR6AOfvCvDIlcYo4izDNPHLqsDqoaQ6eNwCGUH8D09oZvPzRrDyh8DmpVtcWbAMpFG7P
 x0Ok1ystdOp8Gb5sHGgdKjlO3biCA3lqMj/r2wWdTNiNBMMRgvvZpfKsrtQuffCcyfc+
 3Kvwy2AKNxM6rudl5W3pIDJ8o6I2Suw6M3aHKEFvJvBfTbOQoYTm9cY0mHDYlc6hLP8g
 Q2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549304; x=1691154104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jb3oJuceNFsIyuY2+c/BQpFgMtKHX3DFUwV7BlO22rQ=;
 b=O7NQCkF2z4Vt/T5/GLOIctsFzfaVNKBXJvduzMdA3jEDro1NApIkPgFlNUxjcDbyLO
 WKTGmedkyiLQ0Dr8ccyN+yZgQNOqN8dI7kV8qlCp0AFg8h380aUY9w6OGJ2KuKl9LFyd
 //RRLpLf8eeBes4Umk+qLR6aXVxOCPDkFsKpX+GMJT58SuBpvDYX8Hd4BiJh3uVR7QMt
 sJlFlwYqedKdmmSSZn3nZa4v09tEc/vORePZUKcQLezkilVZzwuJUj41N0YFQsFu/f86
 SCMA7gJpwzYSmDr75NqrB2MkUWjsyzEl2N1TbcS/fX3B0IzsOMVlRlueJwMzXenyM92u
 4IyQ==
X-Gm-Message-State: ABy/qLYD5T00XdQRG2opTwQhd2wI8yfdf3i77UnAiUSQ9+mPMwbXU2E5
 sc4QVyGaTomNXOznAghC5vinEA==
X-Google-Smtp-Source: APBJJlGKWeFPOrR4SRapsGW6B0B45Wr3r3nXWLAfqntpnpIaERf19EDZd2fNRukT2WrEz3kObz6QYw==
X-Received: by 2002:a1c:f202:0:b0:3fb:a0fc:1ba1 with SMTP id
 s2-20020a1cf202000000b003fba0fc1ba1mr1846649wmc.35.1690549304029; 
 Fri, 28 Jul 2023 06:01:44 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a7bc848000000b003fb40ec9475sm4180321wml.11.2023.07.28.06.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:01:43 -0700 (PDT)
Message-ID: <ec9983bd-b9be-b672-8c26-d887f608de4c@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 08/11] drm/mediatek: gamma: Support multi-bank
 gamma LUT
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-9-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-9-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Newer Gamma IP have got multiple LUT banks: support specifying the
> size of the LUT banks and handle bank-switching before programming
> the LUT in mtk_gamma_set_common() in preparation for adding support
> for MT8195 and newer SoCs.

-- 
Regards,
Alexandre
