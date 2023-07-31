Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35731769735
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6310E2A6;
	Mon, 31 Jul 2023 13:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45A610E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:09:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99c1d03e124so88880966b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690808958; x=1691413758;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FfMuxXi5TvQls5fruvhXx6XFvK+TXODXow4SAYLJGyY=;
 b=YIIFAwIAU89YqdlY5xoXlgtiPTk8CtcKCOl4cnjSq1qVkKNLBjqIdW4ydAnhqTaBFo
 F4t/Te49WdORIENXOMZDtoqNyM+ulsFDkW5btWkCkwwDmUy2GpbJ3t/GgFJWhgUWJ5jH
 1dcPhVgYazqOxASD8ReqJZFR1PEs92yWspK8t0lPzO0oTIEh6vda7zCj20MePrkQFmoH
 MqORnsj1aKLecUIYMcNgNcNuR0fLKvupdtWed0U2gysGAAH53xsgKlZlVgPH64vMhMru
 rqAfSSKFg+51TV9MJC5B6X+M8mA6dSBqTd6oTTTzwFyRlRv0GaJFAg9bfTVUM+riOaFS
 vm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690808958; x=1691413758;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FfMuxXi5TvQls5fruvhXx6XFvK+TXODXow4SAYLJGyY=;
 b=CZGCDfTWTnSuzp5fVCzZPXDeZROuuVF23ARTGxalsFVrd2d7bMtQAaaexT14KjVI8/
 RVcgz1ufLjwZn968xOKA7NtDcWmDjOZQd11puaF2mwJaJ8qoWrXwCmk67TnrPk1vhskF
 OoMyVoEENKrJuiErMbzK/me2Q0SC1ZbwtqEvOoUbAJhz6sb4lBDh5O7ca7wV+7+tesuG
 MqyLsrpfFfj0ub5RELcG2+uV6ykNsSyZy6TgHmPGAyIQCjIw2Btvocin7hqvPhQ/4K1E
 F6JEEpZcdJMKTWzZvJfC7JkQUw47CUD+ddpA+3GrIYFJvL+rq9g+ws00j/9sh+9Y0DK/
 ndhw==
X-Gm-Message-State: ABy/qLaI1XIWrpdhM9ZOj0L2mgJZeEOWS4bJWawGStZUOFZg50WFedqG
 RWcCjsd2hF2sG9KZqpwYjWNDCA==
X-Google-Smtp-Source: APBJJlFVb9Kpp3kpY6QmBy9WgGIv7M6Ad8CkhSl3Nur0WbmyqeK07KblydLr57EhN5CFADUyfv+srg==
X-Received: by 2002:a17:906:2c6:b0:99b:499c:ddb6 with SMTP id
 6-20020a17090602c600b0099b499cddb6mr6630736ejk.68.1690808958179; 
 Mon, 31 Jul 2023 06:09:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a1709065ad700b009893b06e9e3sm6211722ejs.225.2023.07.31.06.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:09:17 -0700 (PDT)
Message-ID: <467bcd2c-19c6-f7c3-44e7-d0c4f8d460f4@linaro.org>
Date: Mon, 31 Jul 2023 15:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH -next] drm/exynos: remove redundant of_match_ptr
Content-Language: en-US
To: Zhu Wang <wangzhu9@huawei.com>, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com,
 daniel@ffwll.ch, alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, arnd@arndb.de
References: <20230731123336.55152-1-wangzhu9@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731123336.55152-1-wangzhu9@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/07/2023 14:33, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.
> 
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

