Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AFC583E80
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBDC2B65A;
	Thu, 28 Jul 2022 12:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0E995F0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:17:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id w16so1316804ljh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vTHkf3PkQuEgWJCGVwet40bcBQOgfr43zzOgeagd0v0=;
 b=DrB888e8pgeDAoMhrEqBNUb66SA6IcaJUsXBFF5IlGsk2uCCbZekR1kwgl3aEJ26bc
 1jNfUJm4fIzr8GBhbQcg2hRDsO2Y2tL3avvUyMynyGj610ogrHFX2ygpX8G408ESIfbB
 KxIfBvfxPNvSDWH3LMIVnqvHC+Xzl45CXdtvtN+47GmWkNbUXVYTufPdCTUvNI4jMmbc
 4V/bkz5hJu5XwxkgENOnMxmt9jNR558hunrovhY1W8Dr+JXrhi0bPajNHa77QPAPnhCW
 fjeaWrZ6iNC8gwKOGfCdhldVm8vmQJ3GKrBYXu9+UkMnrtL64h6qxMSPb7SXmhZy3gSh
 7TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vTHkf3PkQuEgWJCGVwet40bcBQOgfr43zzOgeagd0v0=;
 b=lIG6Vm2OGtQtx3VZ37wWaZvuKlmRp3i55SdmYteBRg9dqol15gyamq69pFB+21inT6
 pembFnq3exR7pWBmeBMsQA8JFo3oalRrE6/SqYeb/YxMzZQNdQ7qOIMIzZT6nvF8dDSg
 0gLJ8GEyV+oM/+pfAV0BEElN1dqJCpxhTBRzJbkxlsH3xskIZ5goRha448qGe3UK2LoE
 Cu3kR88qyg0+z2T9ZHavWGeI/mO7X24oyeMG4ANTnn5jkRn2FKhHy2WvtEO9Nr8w1OG3
 /Qu2jIHqYgXik3rHJQ3gIveogsdEKyy4tfE5RWvSeC5rwBSBasneqT/wqoRJ2RZhFfq5
 81vw==
X-Gm-Message-State: AJIora+h3H/X1tXmBwE1LoqB5Xcs2rZIoOPRYJDy8FRFJuColb4afVPI
 rebDDhuktZ9jp2scksWUC9P7PA==
X-Google-Smtp-Source: AGRyM1vNyLPheoEf3KZBupmIsZAAYI+VF8waTXPJlh0mdoKFxZ1zqu+EszKS24/oZeb1UEHCkEQOTg==
X-Received: by 2002:a2e:a315:0:b0:25e:2e8f:f5c5 with SMTP id
 l21-20020a2ea315000000b0025e2e8ff5c5mr597979lje.145.1659010650856; 
 Thu, 28 Jul 2022 05:17:30 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 v22-20020a056512349600b004795d64f37dsm176194lfr.105.2022.07.28.05.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 05:17:30 -0700 (PDT)
Message-ID: <1685ecd6-cfe7-c2f1-add5-6bfff055fa06@linaro.org>
Date: Thu, 28 Jul 2022 14:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 2/2] drm: panel: Add novatek nt35596s panel driver
Content-Language: en-US
To: Molly Sophia <mollysophia379@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220728023555.8952-1-mollysophia379@gmail.com>
 <20220728023555.8952-3-mollysophia379@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728023555.8952-3-mollysophia379@gmail.com>
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2022 04:35, Molly Sophia wrote:
> Novatek NT35596s is a generic DSI IC that drives command and video mode
> panels. Add the driver for it. Currently add support for the LCD panel
> from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.
> 
> Changes in v4:
> - No change.
> 
> Changes in v3:
> - Embed the support into existing driver (panel-novatek-nt36672a), as
>   these two IC are similar with different initialization commands.
> 

This does not go to commit msg (---).

Best regards,
Krzysztof
