Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC116DF7A6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C206D10E2E5;
	Wed, 12 Apr 2023 13:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AE610E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:49:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id q5so6564279wmo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681307360; x=1683899360; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
 b=P+Olpx6A3/vNNZTdwI1G9eweBEoTH2LcwW2usLoVzpvOgrv5iZZ+KFMS27g/J/nfqZ
 reVa1Zx0lcjz6/7AlgdAny5ttEg1/A8/XSCvh2l7OO2rKzCVgRxHBPkkemKIOni+lCny
 1THlxhFeo2QlJMDkwR0f/NFAEgK1tfH/W+ftLtUkhnUkFrRnyqeBhWwbh6g6ZChXZS8s
 HI7sgOh5GakN3NTsu2jN1Z8PWH55G04Rj6Whp8gqyK4cGvTzgM+FgKSZT5UUCB/Ye6W7
 BWa3lO6jD0+wwjP/KXSgknZEQUIMW5tR2eS+YesJAdlkZt8k8+BlQiVYPZ8zhiccPFSJ
 vCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307360; x=1683899360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
 b=bAhICKoKWOW4FCyLrXGk2QkJYQ9YD3kB4WVYUtHI2LCDlBmFdpTbe2tEpWMs2uMDrB
 cLJnMyO4vsRjkVDDJRxOKEAaRNbu7AQWg2hTHkpNsglN0rVMFUbgE60xb/vQ7XaCD2BB
 KiW0+fguIJSbeSKmHozsal+122+HVRZ5gsAiDFK62mE3qi4alKv+9TEASHxLQQKaC9As
 RihP7I4PFdVDcCNyG1liP0coyqRmcNdjkwX093PJFlAG0Dl+If8DG0nLoU42Mt9Pn0fZ
 vjNYOaOun3PRvMZF+XdTYn2u5WXn5HtF5GsmpBz2nUNDFhsYN9QmAMFvtA6zVbQKitgL
 WxMg==
X-Gm-Message-State: AAQBX9djjDtoTLZPT+dwe+7cWdVIx9fLxwR1XJtYhNIWt7IulzfBYnpY
 5cUx2aVwdhp/7Hmbc27XfKyqMw==
X-Google-Smtp-Source: AKy350Z5xFXV56UaJrsLbPCn9vUe4kX4KLRpXMruYqeY/5IcZ7js+EzGemp3jS4cE2erPI4Z/lM59A==
X-Received: by 2002:a7b:c7d4:0:b0:3ef:68d5:9573 with SMTP id
 z20-20020a7bc7d4000000b003ef68d59573mr4733356wmk.19.1681307360680; 
 Wed, 12 Apr 2023 06:49:20 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a05600c379800b003edd1c44b57sm2451789wmr.27.2023.04.12.06.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:49:20 -0700 (PDT)
Message-ID: <de6bd3f0-5e54-7f03-f01a-4095aaf87dd7@baylibre.com>
Date: Wed, 12 Apr 2023 15:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next 2/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-2-yang.lee@linux.alibaba.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412064635.41315-2-yang.lee@linux.alibaba.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li<yang.lee@linux.alibaba.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

