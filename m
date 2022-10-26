Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46160E3DD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 16:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC3A10E4E9;
	Wed, 26 Oct 2022 14:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755DC10E293
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 14:57:05 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id a5so10696246qkl.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H6Eev9tNY1EscvH33xpILTCRgvvIkcCo5fp9pBkfKp8=;
 b=m5C802ytAi1yN6R+djCEaxTwKcotMupBTDIO274nqvY1eZdUdsqBOGHxfWnI8xbmHn
 fGx+40jhXY2iZIhtqvCBILEfdu1/AIeEJZ9g+DOjzRFxUwOZCQXFzGJbDWN6yb2lQjZC
 ATW9ABu1qGT8J6nB591VFxbFsPeQiWsYt+5WD8dK/aplCErYvYtoVNwEbIxzXxVhATGg
 lZ58Z1Wo22DHv08xmeCe1VJYMZ+T/p5IpjASEBeih4myp5O4mtgwZZAvyt1+mV+lfN4f
 7r2MP6uSLlpK8j9IpiiHr+2udJrY5F52fAvvd4JYMqTJE/CoW3XbOtKheMZfL0E/sslv
 dQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H6Eev9tNY1EscvH33xpILTCRgvvIkcCo5fp9pBkfKp8=;
 b=P0UIJAu5q+kIayaQQalHbrPFaRLdSn0Oyo2egDHtLXP7rHV1upGMuyfCVBS9Op+zG1
 QV+QGI/tDhdrGgrzy57lJIoGTx2goeYEQcw/0DUjoM7xy2J+8v3ZxnUqNknzkNimK1++
 /C2KKcCOo30lJ0S1+eMKWptmcpQaz+RH7objzWgbWryJAtqxS86eqKd+8UNuQZZ1pQKV
 irqact4i1GGpa2XBDcO4PCZ8xXMLhhd98NDoPSt6D7o2eRuJsFo/Z8/2lHGF15pi0Oz/
 ma4581CHCCakOVoLUa35QP2GEo50K859B2cGCi5LxzhBQnDdSdK6MvHL7GwQMNFyNkZk
 Y7Lw==
X-Gm-Message-State: ACrzQf1psosCkPnvpTbVru58hEWmAJo8/V5kZ+dDicoF0DgrAV5pxrL1
 qPlwNMVGal31pvTCuMQziudlcQ==
X-Google-Smtp-Source: AMsMyM6x/mkMzmJyWpbQqAZPzcgsywdXT8wCsrEckQU9qfFg2x7F6MjMaHwNDxr0UoDFRGeW1Tk1dw==
X-Received: by 2002:a05:620a:c12:b0:6ee:d3d0:fe20 with SMTP id
 l18-20020a05620a0c1200b006eed3d0fe20mr30450314qki.470.1666796224582; 
 Wed, 26 Oct 2022 07:57:04 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a05620a298b00b006bba46e5eeasm4233394qkp.37.2022.10.26.07.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 07:57:03 -0700 (PDT)
Message-ID: <ecd2a50a-5017-23bc-7da0-73a5f240e97a@linaro.org>
Date: Wed, 26 Oct 2022 10:57:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/4] dt-bindings: display: Add bindings for JDI
 LPM102A188A
Content-Language: en-US
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
References: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
 <20221025153746.101278-2-diogo.ivo@tecnico.ulisboa.pt>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025153746.101278-2-diogo.ivo@tecnico.ulisboa.pt>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/10/2022 11:37, Diogo Ivo wrote:
> The LPM102A188A is a 10.2" 2560x1800 IPS panel found in
> the Google Pixel C.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

