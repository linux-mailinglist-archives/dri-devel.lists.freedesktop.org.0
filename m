Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA759DF51
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 14:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B4610EEDD;
	Tue, 23 Aug 2022 12:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B5B10EA2D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 12:34:54 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x25so13353116ljm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=LKZ/vD9wmefmxQhO5lusEK9ST+HwNC5+PjaBESEeuys=;
 b=PNuO0zhUMklVqPdf6qtK0nfdumM0D/Hwz68Et5tlv2nG5/gv32viakxB828FJTpumU
 Aae/Z+CSJylb7YeQo5ZpvXQLQBvTL5ZPweD7ZtbTxAwnasS5Mjj8P1Z3SY0UI8zJkw6E
 alks5XAmeD2iTCBoE+pPEEV74Rs4QYHRof2L+p43UKmz1BjeU4zLhfgW3mbRp3khtQhN
 y7P1p799H1Gew4TPx3MUn/Kpx1RKjY1Nj8yfVOi35Zx7TxglHceo+qf52K6WbRm1eNuY
 o9FQw7e/FUccFk62vxZdki1FO9wlC6zf35I9uEhvfKpCfvJWuyzrkbB3pzdBve80yQSq
 Kbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=LKZ/vD9wmefmxQhO5lusEK9ST+HwNC5+PjaBESEeuys=;
 b=VyRYAYWVjB5vm10li8eJMIK1o8um9HN29Ig4yyeuxVxOYi/3YYEzoHmjIfs+0Apv0o
 IfzV7U5eiWP4//Q4M33YUe7LtI+lS26cvxYwdt9S6UuKPvRjRFUZHs43cAKdLQ86SBaH
 /bq6yqpuFO3GmWJqNC4Q1Av45F3fwVZ0XNTqNuyA4KJOdJXUt87+rZAMc6FydQp60gMp
 w25c38DRJfuJYxUCkn4+acgAbuED7dQCzQvYfX+qAUG7C/shgLJT79XU1hxfms7d1zBZ
 jw0Nj3pd97Zb49uGHOBb+vEGNS6iZpXtS/Nv2F0s4GBpe0zj09MXJ/J3DR6K11W7+Fiw
 U5Vw==
X-Gm-Message-State: ACgBeo2UxOrhi00dPv0S/kJxtMkYJ7nX6R4ATK1VPQVeLmYO6UdUbKry
 /kBC0lpW/3Pt0nrxoSmLSmueZQ==
X-Google-Smtp-Source: AA6agR4JmXTLU+9iQlgcfuYvL+JDv7qCLq/Y3gaBjTKTmiOhXuKPPQ+hEuE+Fzp0Ch1sp1ZHonydVg==
X-Received: by 2002:a05:651c:905:b0:25e:67a8:4dd0 with SMTP id
 e5-20020a05651c090500b0025e67a84dd0mr7700929ljq.232.1661258092397; 
 Tue, 23 Aug 2022 05:34:52 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a19670a000000b0048a9e899693sm2492704lfc.16.2022.08.23.05.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 05:34:49 -0700 (PDT)
Message-ID: <577fc85b-3bdc-35a1-c54b-fbc37774b34b@linaro.org>
Date: Tue, 23 Aug 2022 15:34:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/exynos: fix repeated words in comments
Content-Language: en-US
To: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch
References: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2022 15:21, Jilin Yuan wrote:
>  Delete the redundant word 'next'.
> 

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists.

Best regards,
Krzysztof
