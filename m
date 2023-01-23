Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C6C6782F2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6710E521;
	Mon, 23 Jan 2023 17:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A210E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 17:21:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11153366wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ffLiSQfKQOTXr72jcGGGBmSWihtc1ZeEOa5B14tjB7s=;
 b=rQMuWM1dGVx7mc6CQmJU5KE55lQWHwy/U4tgp/6uVzybnZrlR67XC/X7Iq7JjBYaIq
 nOUb6PDTWW1A331Jxt9SSoQ2K8ZwPm7FSQQ7QA2pHI0UkzIi57K5+FA8HiJrcuz1iIHy
 DrnonN45u+BB1bDUFra6ShjXFDCbjNMI7N2aRXtGNWq+dA6OV7uBZdRB7rmJFK7Hddcv
 ttM8ov9D6RImaPUaTh7O8wt4ESCEL2NOuDWvEddjYmNx8Nn/tavrnr5GUZteah2c0/td
 LvEu1Ba5dS0v+5SbWjFcP+kylvudpzZ7chgtSYtPCtDdDVKsxNalUp3TWzpc8CT8W6TM
 F92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ffLiSQfKQOTXr72jcGGGBmSWihtc1ZeEOa5B14tjB7s=;
 b=ZGSIctJDBqhhuIyQ4szOqt6B01XCjw/qwfxk0oIS9NxbAbPR2R6m/nbYcLwHg5oPck
 3RVb3JuP5OsFBnyvM520MpNDQm7HY2Loh/eb3HuD4t5y0S8MibtuCMFZglA5+I2wswjb
 qdQypIdHzz/lyhXxAcV/5XS0ZwNFRRiRLpmjNDBZQFLViRL4ehXs/cFX/oJ6m8htDwBf
 EJ0QdSDIqfljI541K3arfWiMmjeJRCzmLo0Up5SfkBCoQ+x0L8VjB53tKqV/erE4S1lK
 jdgp8nKIJca+poh0Kazm7rvOgiQyRILHf6DWHBbpP4juPBdzrEy/rCPkzdiKm9ibMGfA
 D7wA==
X-Gm-Message-State: AFqh2krRTLW5Y6VE7W5pCAAVMnwefzNriUZx2C3r1OTtruN5LpGJ8857
 RSwdoavj3VzAbSWLo65gngxU8w==
X-Google-Smtp-Source: AMrXdXu+fEKOd81dqF4WaKvYaFXLD2CSifWiZkiw86zrW9hyrTOlV6sa/x4vpMnHWiy6UMmZ0WDsfg==
X-Received: by 2002:a05:600c:4e14:b0:3c6:e63d:adaf with SMTP id
 b20-20020a05600c4e1400b003c6e63dadafmr23614657wmq.31.1674494476497; 
 Mon, 23 Jan 2023 09:21:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c028200b003cf6a55d8e8sm10886208wmk.7.2023.01.23.09.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 09:21:16 -0800 (PST)
Message-ID: <fc92b9a1-0ac7-8490-4514-241ae19ca1da@linaro.org>
Date: Mon, 23 Jan 2023 18:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: jadard, jd9365da-h3: Add
 Radxa Display 8HD
Content-Language: en-US
To: Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230123164018.403037-1-jagan@edgeble.ai>
 <20230123164018.403037-3-jagan@edgeble.ai>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123164018.403037-3-jagan@edgeble.ai>
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

On 23/01/2023 17:40, Jagan Teki wrote:
> Radxa Display 8HD is a family of DSI panels from Radxa that
> uses jd9365da-h3 IC.
> 
> Add compatible string for it.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

