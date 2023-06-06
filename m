Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C927246DC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AF610E368;
	Tue,  6 Jun 2023 14:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EF110E368
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:53:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51640b9ed95so7023295a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686063178; x=1688655178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u5ad6JXLk8Vr2MVJ4NS6+T1cVzx+vCj7pnVSCbPfkOQ=;
 b=w+/EaiSGG1gFHNOiK9N2KDXlNnMC/7ygzTOAFYXzJoq6d6IuqJV01LInWdbFFzhsVd
 aPS751MS7FLPmqE+QA/UjYyw8zRO8qECpMzpIj+HJQHYJqtP9LuUFRKZXySIeNMqrb97
 OtcJW4B7h/WpsdWp/uYHiVlfSY9MnsNNojtByOoncanNksT06f1mKGDAU37eSpllzsay
 LBj810VVvlxAJ6yppAN6fWyYTbpD/tt2zL0HRerGNPYiPsRrLBfiksdTk3yo+tGEUvuy
 RtUZHnlIUXNq5zxnvwAt849PLAC1zdnij5T0Tgsr2QPdXyCE+tEN39Dtj8/aon6i8Rlg
 kRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686063178; x=1688655178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u5ad6JXLk8Vr2MVJ4NS6+T1cVzx+vCj7pnVSCbPfkOQ=;
 b=kQkWtZ6Bx3nR0eJclISr+PAdDQP+lGgV8E4lLG0eYeIwrcqlFehSfg9twlk9BznRxw
 0goJ8Bkpq22tNC45COKORvylrhzu3A/Ne0Gu9gDHdxSrWevdAPTgkjxi3uxckAocXf/b
 QqcS0hbDleaIS/pSHsRHTKfJY/icbeGJ7SPaXKmuVGb7n9PLcNRnlYe9DZ6xzxXsC8nR
 H2vBKdS6huBwxkjDA+u6zZMAtHY+o6mBfC+GBLNiiiiy/L1XFRPkXOX8tPwXaYF8uNy1
 nsuqwLTIS4wNbn5GP/nmx7n9CefAs9NThyDUENH9DjKHd53oNy6jCbbKqE9jPlMj1uvM
 oQLw==
X-Gm-Message-State: AC+VfDyP25fVyHbpb9P53qnkUGHhv66v6AB5T4sMxNG3dXZg442TUuj4
 WWv5YD6a9AeIQCTKlMGVpOg47Q==
X-Google-Smtp-Source: ACHHUZ6H9SD5QM7GvGVtTOd3pnoU68t2Wz9JRqAqNViSKuX/OUaFmQEOy6IamN5jjA+DEumYdeotwg==
X-Received: by 2002:aa7:da43:0:b0:514:9d2f:10be with SMTP id
 w3-20020aa7da43000000b005149d2f10bemr2050200eds.18.1686063178502; 
 Tue, 06 Jun 2023 07:52:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa7c682000000b00514b3a2008esm5136125edq.2.2023.06.06.07.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:52:57 -0700 (PDT)
Message-ID: <10fa8759-a1c5-6592-e0be-98574fb635c3@linaro.org>
Date: Tue, 6 Jun 2023 16:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/3] drm/panel-fannal-c3003: Add fannal c3004 DSI panel
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <20230605153539.497602-1-pavacic.p@gmail.com>
 <20230605153539.497602-4-pavacic.p@gmail.com>
 <4bb22e77-b3f0-be07-5e8a-442c3aa3fd48@linaro.org>
 <CAO9szn05edU_HZHVnREMZcwm6TbBa4psABoqSqLWghFc=KbV7w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAO9szn05edU_HZHVnREMZcwm6TbBa4psABoqSqLWghFc=KbV7w@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 09:36, Paulo Pavacic wrote:
>>> +
>>> +     if (IS_ERR(panel_data->reset)) {
>>> +             ret = PTR_ERR(panel_data->reset);
>>> +             dev_err(dev,
>>> +                     "error: probe: get reset GPIO: (%d) Check the fdt\n",
>>> +                     ret);
>>
>> return dev_err_probe
>>
>>> +             return ret;
>>> +     }
>>> +
>>> +     mipi_dsi_set_drvdata(dsi, panel_data);
>>> +
>>> +     dsi->format = MIPI_DSI_FMT_RGB888;
>>> +     dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
>>> +                       MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_HSE |
>>> +                       MIPI_DSI_MODE_NO_EOT_PACKET |
>>> +                       MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO;
>>> +     dsi->lanes = 2;
>>> +
>>> +     gpiod_set_value_cansleep(panel_data->reset, 1);
>>
>> So you leave the panel in reset state?
> yes

Then why do you initialize GPIO to bring it out of reset and them
immediately put into reset back? Just keep it in reset.

Best regards,
Krzysztof

