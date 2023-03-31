Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C76D1CE3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60B10F14A;
	Fri, 31 Mar 2023 09:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8CE10F14A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:47:50 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q16so28117918lfe.10
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680256070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8+FVjc7Vr5u63Aky+QFc4CNm5/6VJEJaY0PE/oQ5V5Y=;
 b=ezQU1fwlthlnLkzOKfjJOlU8Vs5/eSnmr9Kp1S6uvV/QCN0zH9rfO/hE5raTnlebbz
 b25EcCa/+TCWFoGRjP+iRjdvnpbdE9nd+x5F6YWd2m/CK4a5+LdFtF9MbsNpgKQUgKSD
 2nW5MmV09cZ4wU5rIWYaP3uQJ/euxqQJ4ZTlsNxlPb7YVK6M0ip6KC6uApjtvLRrwAaH
 twUNIusSdJ929h36uDlk6TNck720rAkxa/pPqy1a+ATahXn7qOiVG20zFoiOJCSUgnU3
 twvqifPVC5JGcCdTqV1GjyLLQYer1PLjPvbgENYNu//RXfB5JnFrfzTwlBrbwN+dWYI0
 x9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680256070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8+FVjc7Vr5u63Aky+QFc4CNm5/6VJEJaY0PE/oQ5V5Y=;
 b=J9STgnQweKqxcval6YmeLfTklc3bfI0ZnxQ0EwUjRgFlyAxZsOInbCheQXzjtv0zQP
 5ftVO+BVqYypRQDJ5XoXCZl1zfqCIzE/MoVW3k7yuM1+KMNbnGLYBW8sd22gVfCEefpH
 /5JSz32zH6bzeW8RuuBL51r3ryp5zLmqPRa8M8rc0X03OwYmRvSrhHEyhabnGaqB81ax
 auyYLR3zMSvj5uWYgogRr5LtZKAlYh6pzT/QsPTvfo5ktx85+03vJciGKpIVEumjm4r2
 D81v2wU8ehXQF5XFROxia6GsdqAmtZbfOXNQW7glFUE8/fkZO60QdpFTy/rRSQGa7GeD
 eNHA==
X-Gm-Message-State: AAQBX9e4FuzBnaKiylmFreVY4KhxDQEEhliXDjVNQoXjLa2fmPsFQpT+
 c8FfUZ+xpQFz0NwKyglDy/56Yg==
X-Google-Smtp-Source: AKy350Yfe7vvDbdX5/m31I+n1dQH9YM3t6uIDyBc+99lpi+x0QXmahT38KoUxCALt0/tRmw5I5ybGw==
X-Received: by 2002:a19:ad46:0:b0:4eb:1527:e29d with SMTP id
 s6-20020a19ad46000000b004eb1527e29dmr3764702lfd.52.1680256070447; 
 Fri, 31 Mar 2023 02:47:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m14-20020a19520e000000b004cb1de3f487sm310397lfb.104.2023.03.31.02.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 02:47:50 -0700 (PDT)
Message-ID: <08c18374-5d1a-7407-07d3-151bc5ce2511@linaro.org>
Date: Fri, 31 Mar 2023 11:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: maxim,max98371: Convert to DT schema
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Morishita?= <andremorishita@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331020527.482991-1-andremorishita@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331020527.482991-1-andremorishita@gmail.com>
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
Cc: mairacanal@riseup.net, daniel.baluta@nxp.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 04:05, André Morishita wrote:
> Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.
> 
> Signed-off-by: André Morishita <andremorishita@gmail.com>

Ahh, and missing ASoC subject prefix.

(which you can get for example with `git log --oneline --
DIRECTORY_OR_FILE` on the directory your patch is touching).



Best regards,
Krzysztof

