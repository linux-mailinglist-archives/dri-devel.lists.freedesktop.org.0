Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30506737F0E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06410E42B;
	Wed, 21 Jun 2023 09:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C5510E42B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:36:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51878f8e541so6755817a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687340184; x=1689932184; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6elu26YtJfohzcS72Xjup0fvXIh+C0cjlp4750l45E=;
 b=0jJIXDRE/dKzNejhP+OjYi3MzC5xg50Bl+mytGFvV2hHFM9edrgynGWJX9XgPFrye2
 ir2Up9TlMiZYfpRmkFVvyf3lgGenvMkpRAcTIDTHUXCFtAl6KFjQwPrS8Jv13m68e+4s
 SgOv1A0sRPqc8qe/stnqTEn786oINj0AXqPnf941/AH2ReV/T6yCgVbuRAj/0snLjDWF
 Lyd2+J/TbbTVgSl60noS6q7ZuI7U7pSYv/biLUIJWj2mxjmAxkQ24B8BQeJRwQEfB6Ce
 zgB5JwmCEVOb74jk6nhkgKkuymsCxfr9a/3jMc2Kb7ugeFDiOL9y2Zt2hSIdE+R8r+oE
 W30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687340184; x=1689932184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6elu26YtJfohzcS72Xjup0fvXIh+C0cjlp4750l45E=;
 b=XxxShUDbGfTeBzUa9LkRZMMrO+Qnu4LVYKCyNr7VbAu/ZggackU6/LHNDnhXGrPEIe
 kpn+GHVlCjY/JKRK2OiH/j9QbReVQuUGk/uGFVvUgUAN5vCWZH8xE3p75K9alpAbmm9A
 AgbuOACyQ9je+9zhtH3RLeJ/LsuoGJWxXwO3fC1aVfAL1MLMWyxYHY6XH45zJEqbaBDG
 SgrZnYfT3Ebz6LWvkVvZ1YnBSR9qkrJCMfnIlTK3/7v8FUDgq0lBLwjFwVjRsRuRbCdk
 Zcu50CPj+yneK6s35IJyGJnr0Vx5jPd/36pw7Q2cQ+Bl99A0O1gvPJJCNL9To7Q43c3q
 WOeg==
X-Gm-Message-State: AC+VfDyA5di2PWEzDjMbtGy8Ey7LitRYWERk1yAOISC0rrPXd0QFqPAo
 J7d34z4MRcUtMH+U324KyIvjyQ==
X-Google-Smtp-Source: ACHHUZ5/2qNwBEnLurkUDa66kVeGNaGFVf728nFX+LisHTCTh8RsynfWNIKoix7OvUyk36H+bVvTAA==
X-Received: by 2002:a05:6402:692:b0:51a:3334:f87f with SMTP id
 f18-20020a056402069200b0051a3334f87fmr9232463edy.37.1687340184246; 
 Wed, 21 Jun 2023 02:36:24 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a50fa91000000b00514b3dd8638sm2335019edr.67.2023.06.21.02.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 02:36:23 -0700 (PDT)
Message-ID: <dca88551-5fa0-c259-32d8-673f1e81944a@baylibre.com>
Date: Wed, 21 Jun 2023 11:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] drm/mediatek: Use devm variant for
 pm_runtime_enable() when possible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
 <20230608101209.126499-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608101209.126499-4-angelogioacchino.delregno@collabora.com>
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
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 12:12, AngeloGioacchino Del Regno wrote:
> Simplify the error path of return functions and drop the call to
> pm_runtime_disable() in remove functions by switching to
> devm_pm_runtime_enable() where possible.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

