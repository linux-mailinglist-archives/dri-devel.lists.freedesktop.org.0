Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F216786DB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 20:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765E010E20C;
	Mon, 23 Jan 2023 19:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0233110E1FE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 19:52:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l8so9910154wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 11:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cQX8FwU+yVyIM1d9Uh0Lst/mt6UcJzmO021Nym1UxnA=;
 b=ndt+GQNySxm/oUPdDgcBDGpBaXA6sEFTWvXfPn2zN3xHC+wSqahOLUwkox3RC0Io/D
 GEHChfLks00fimEso1HDtUgb0vqstJpQDRSDl+63dJZAWRQzIDFABJY+s3BO0KXEOZbq
 ZHqIG47LsdceYAZMI3q+BCDWMfCLLjlGeWS1z6U1MyH6biZr7K7rTvi8cb829KAyW4RN
 nHmnE1KTEabV4jpkKNz43yXJqc4n3ct0QUZ7emfB7zySi96dbLz1cuwA89v7vGix/Tjv
 OENH/nNeiv5rbAOMnOJz+PLs3udQvMjoiapBAfqkUSNxkm+E0Cz9OquG+8Cvj2S5Nihj
 bhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cQX8FwU+yVyIM1d9Uh0Lst/mt6UcJzmO021Nym1UxnA=;
 b=U4V696RpaORTMY9s95P1lZ1/BvWnTs5hDhl471UygDQFWzQtqgcWAKZmJxPYRdtRK5
 DgvJuE/Vbo48FuPhFFv5xTdbfAoDQERveGtk7TI8ZGn/B9VgeS/NXHsiI+J+ANOwtHti
 VKKNi+zUaYm8ZxBibh6wdzuhmcYGdG52NSSHOq0M6Qj7LAzjoVZcRopeCF45+KFO0++K
 YGuqxuJIRKWjSgDEJgCTmw37w60ksX8qgRkO/x0pbAJdOOq9ioTsB3RSvWBr41fB5LXw
 N2mBqqr1gnupm3e1zRilU6FyQ/tevyhy/uo9c+hRtwF1xPSK3JV0I2e1uuT0i/bNwQMO
 OqxA==
X-Gm-Message-State: AFqh2kqA1bybj9ZMg+FpgHsFbuFkCa8CZbFj5uNLl6RoQOMmiRwwGe2s
 R+QYKr2BsqlzWXpZ3mkgDSekmw==
X-Google-Smtp-Source: AMrXdXum5LAGZhQDQK3EgOw1hthCew16D2WYtoCt54zBxa6vJ1/ajLs+PC242LJlsimre21+AwMWCw==
X-Received: by 2002:a05:600c:3412:b0:3da:f678:1d47 with SMTP id
 y18-20020a05600c341200b003daf6781d47mr25044946wmp.14.1674503571547; 
 Mon, 23 Jan 2023 11:52:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c2ca900b003d237d60318sm129148wmc.2.2023.01.23.11.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 11:52:51 -0800 (PST)
Message-ID: <71fc64ea-81f2-3609-e4f9-741c177d31d2@linaro.org>
Date: Mon, 23 Jan 2023 20:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: jadard,jd9365da-h3:
 Add Radxa Display 10HD
Content-Language: en-US
To: Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230123183312.436573-1-jagan@edgeble.ai>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123183312.436573-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 19:33, Jagan Teki wrote:
> Radxa Display 10HD is a family of DSI panels from Radxa that
> uses jd9365da-h3 IC.
> 
> Add compatible string for it.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

