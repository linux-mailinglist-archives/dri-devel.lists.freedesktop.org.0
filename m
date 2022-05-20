Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80852E6A2
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F41511B6E8;
	Fri, 20 May 2022 07:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D8311B6E8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 07:54:39 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t25so12953726lfg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DkuHinXI3lpMmDhaFWa7SWko/oLhe+xgW9Fvmx5frMg=;
 b=oQIeO77e5MgSp87vBncmyxBCcoNdnnimJ9e849ruUM/OlNEC4TtFyCQMc52XjTugxL
 Mpm3X4noT3dqQ3QrThtyXz3oRMvAXe741B1+TI5K+Kk6h3jzKgq31jYtKE12DrjsjdHM
 MNAPx4+IKSlrc0imUA9WQ0ycuaubtFRt3+yfOV/qB18pXTMeLTNioxQJGuZHbi79lgoO
 0jkEb+h3ePU32ZHE1f748Who9IBdX6ggASCvaqI/WAkHw4rK/vVYNqoiDV8k/PNSXySm
 4W+wsnAU6k7YnWazIxiXl06tT7IVgiTM8RSW2oFmt1DIoo6zeSnXtKDT9wPX1seAJVCc
 pgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DkuHinXI3lpMmDhaFWa7SWko/oLhe+xgW9Fvmx5frMg=;
 b=FAEYE95aITKtZqsGk4oDo1wvAmGGxtUBMwLzalKmtZ09BIV0vQMogYcje9nyIOrmSA
 diuehvknuM3QaZQfhqAxef/AxqK02wXTOW14f9n2d1nbcovhH7d/L7KeySPjFBwJ5dS8
 jUHJfnVuSvj2SrLwJeGODlxEzx+o8ctcGwOzd1eiH3E2LrLsDBTP8UZvf29avot6j0KC
 O9/AVOb2fX0nKf9peJpl+j/h0T0iw/beUVkvUbOS0KdkC280O7y88ucsOGxrDUkMV11V
 CdeFrp9GrhAMS64mJ/i/oMYQFM1nfQ/pwFLI8sKG8oRUDo/z4EpxEUl1dkK5kQ2EjKJ6
 BkVA==
X-Gm-Message-State: AOAM530SR9HzvbeeblHpVbo8X2zMnlFIBADi1ttDwUqq751ScClVtBsD
 1h2lOSwZb7qqnApwmnBUuZqjmk/tLiLdPbME
X-Google-Smtp-Source: ABdhPJwx9dWuIp8oYgAGP5r1AcEtYYPQ5RJYBals6FVrRICWBys5V20iJ9zuV2KCWvnUEUZ6OqbyYQ==
X-Received: by 2002:a05:6512:1192:b0:473:cd3b:5f7b with SMTP id
 g18-20020a056512119200b00473cd3b5f7bmr6129376lfr.391.1653033277469; 
 Fri, 20 May 2022 00:54:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 x7-20020ac24887000000b004742b9065c4sm559298lfc.230.2022.05.20.00.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 00:54:37 -0700 (PDT)
Message-ID: <34d2664a-f4a6-31f9-c6d7-043bb6e14c58@linaro.org>
Date: Fri, 20 May 2022 09:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RESEND 4/6 v2] dt-bindings: display: simple: add Geekworm MZP280
 Panel
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220519162935.1585-1-macroalpha82@gmail.com>
 <20220519162935.1585-5-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519162935.1585-5-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2022 18:29, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Geekworm MZP280 panel is a 480x640 (portrait) panel with a
> capacitive touch interface and a 40 pin header meant to interface
> directly with the Raspberry Pi. The screen is 2.8 inches diagonally,
> and there appear to be at least 4 distinct versions all with the same
> panel timings.
> 
> Timings were derived from drivers posted on the github located here:
> https://github.com/tianyoujian/MZDPI/tree/master/vga
> 
> Additional details about this panel family can be found here:
> https://wiki.geekworm.com/2.8_inch_Touch_Screen_for_Pi_zero
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
