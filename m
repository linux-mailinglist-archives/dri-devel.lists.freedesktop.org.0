Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8576652B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EACB10E05C;
	Fri, 28 Jul 2023 07:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CEE10E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:22:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5222b917e0cso2427131a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690528929; x=1691133729;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LHDLdEESCjLfjZtmp5s10YbAT+aGJz2CpcqQwun1R0A=;
 b=ydMrkBv3UGAyLB3YqiDyqtrAeuLzqUngTBZgg7uyT6+sBO17SjL+yjB4oCJiRTMS4D
 zWFPeJV7sevWXc6L2CX9og3MWXhURwBJrU/RrY+wtuEnt+OMUs34Ni61fON79QCXvYZC
 +pGhZowtv+Eq3Mc0czMKOj0iK/nQAwgjldIE6iWNssgBlkIz8WollVODcsHJuuSRTbbY
 5bW53J8WVyf/8NRg5oLeHXUsKR6ixRQY5y1F34KUiroPY5XSP1IsiTbHSJAPbq1H1pKe
 CkoqYtJFYDr33WN/GUi9BDR0JtftHC9jJ1VnCtwBZJGawKXVU4GpH+yI8oWhvNE/rk2l
 zIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690528929; x=1691133729;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LHDLdEESCjLfjZtmp5s10YbAT+aGJz2CpcqQwun1R0A=;
 b=kkIJVYXRILvf4006mst0OK9YmjodPuXNIbOyn2njFIm491l7WH5wagA/ucihcEokbD
 0vKhOcKW3QDp/C+QKzgJtUnc+MRjhkZcTibBmIHpJufZJ0EP+SspnullcC+jk7osCYAD
 dG+4IlXpQyFCqqBcmXIttL//7Bf/x2uFvx2LxILfFEjsstzDjv8XOHHB8aeaE/Vu9L8p
 /dUp3ttYWGlrviUeXp+fEBZZOergj0Cow/YtuXMANbZNV9AVBGF7V+4ZyF6lVJLVfO8k
 pxfRlxKpW2tg3EPGLKPmmtY2Va8RC/D74cihY+Q32wejBYgFQ+H7T0djjorMfQCx5542
 mDew==
X-Gm-Message-State: ABy/qLYYCk6P/pMuVYtaI6SWq+DtR2jcKx7thlW1AvQhghWWnO4kPkdl
 M9B9GzB/UDYQcYc+hZPEiQgwRw==
X-Google-Smtp-Source: APBJJlEzqjGfgX2NmTh6Z8QsYYzU1kCY6wPXAwFGUh5MAwyOuaLmyon2kf2ATQApaA2l5lNXc1XfcA==
X-Received: by 2002:aa7:d5d0:0:b0:522:2ada:c207 with SMTP id
 d16-20020aa7d5d0000000b005222adac207mr1234455eds.34.1690528929619; 
 Fri, 28 Jul 2023 00:22:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 b8-20020aa7c908000000b0052255cbad8dsm1485151edt.94.2023.07.28.00.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 00:22:09 -0700 (PDT)
Message-ID: <42782c4e-1dab-d99c-4ca3-6e0ff12ffd19@linaro.org>
Date: Fri, 28 Jul 2023 09:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/14] dt-bindings: display: add st, stih418-vtg compatible
 for sti vtg
Content-Language: en-US
To: Alain Volmat <avolmat@me.com>, Alain Volmat <alain.volmat@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230727215141.53910-1-avolmat@me.com>
 <20230727215141.53910-3-avolmat@me.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727215141.53910-3-avolmat@me.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 23:51, Alain Volmat wrote:
> Add a new compatible in st,stih4xx.txt in order to support sti vtg on
> stih418 platforms.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

