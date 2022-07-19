Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DF0579550
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C35B113A03;
	Tue, 19 Jul 2022 08:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A9011B8CC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:36:08 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id w17so16546977ljh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Ih2Fy5cmAbEG8aUeZ5+zEsRAma5SiCd0h+PRnEnInBQ=;
 b=x98MUCTYJFJ9Z26jtehRzVhXFT+bVTlVx7ka32+gC4lXF/vFCQFBbQqSJ1cvCpCcR6
 dnTj87s1W25Bl/RSlTWhxMAFk/DWZMDUPJHGEgRozZwWQa1Gzxay7b5NeYjnbvHCQiC6
 f/hmvGA6c0feZCV4UeLRoLeNZ0YdsA72rOR4DiKYbVK+CJG3llNXhfqI9FjwKH+ci33Q
 OvDMcRDL41Y8/ZZBB97qbHz2wReWnGpxo+15X+3IhTHfj4K4J+Z7bC3k0M2GthbRMe2Y
 /iZLhgmG/xGrDMamO41V85rE2pRJrUAe9lt9EVsNXc/gydePXGVZQnkaHhci5HOxvPtO
 RAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ih2Fy5cmAbEG8aUeZ5+zEsRAma5SiCd0h+PRnEnInBQ=;
 b=ZxTIX1+bGMRJ8m6eGhPnp+s2Yiha+cPyExBjuFVitCNwzErPJWL6Y89DSUNQkDlDhS
 ncn6rVsE8d4lwyUFpzrIB7hwV7oN2DdYt/JITq5USPMzbDoJ7H1zIj9gH5k2ouM/VDd6
 mdc5e0mCqMMqz8oWd2JQLOmtEpTSSxTRnGlBJ/o+M/KzO7DjKngYiCbJ3ZS5m98CRcxj
 t5E8yAX8XcJwYy9dp+oJ9NyZCMjf28AYbQIGVRaKsM9cl0PU1SZwKBAmPfM+PkhN7I67
 Ri2reWZFuXw+q3EF2R1SKIHuSj+JxpuHxN5QrcBX0tmnKphzDzjIvX82DpBVgqfBB4Cx
 Aogw==
X-Gm-Message-State: AJIora96UR9qiSaYPRS9klkzt3mScoQfvsB72cDZx2uA4ALe54JWlqDy
 vC/Qk1baARlMxi4DCZjMrx/1ag==
X-Google-Smtp-Source: AGRyM1vV+5j0ZPlFEmdIh9COqsj7+E+TRr0bBKPc2QSCAnmyySjYW/ahXyifHPU75ZwOUj6O4xi1og==
X-Received: by 2002:a2e:8004:0:b0:25d:80c0:1e93 with SMTP id
 j4-20020a2e8004000000b0025d80c01e93mr14006416ljg.210.1658219767106; 
 Tue, 19 Jul 2022 01:36:07 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no.
 [89.162.31.138]) by smtp.gmail.com with ESMTPSA id
 i28-20020a2ea37c000000b002557c48cc4csm2534638ljn.95.2022.07.19.01.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:36:06 -0700 (PDT)
Message-ID: <472e5d12-9faf-4a8f-1cfe-49f5d0449560@linaro.org>
Date: Tue, 19 Jul 2022 10:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: arm: qcom: add
 google,blueline
Content-Language: en-US
To: Caleb Connolly <caleb@connolly.tech>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-2-caleb@connolly.tech>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718213051.1475108-2-caleb@connolly.tech>
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

On 18/07/2022 23:30, Caleb Connolly wrote:
> Document the bindings for the Pixel 3
> 
> Based on https://lore.kernel.org/all/20220521164550.91115-7-krzysztof.kozlowski@linaro.org/

Thanks for mention dependency. However this should not go to the final
commit, thus please put such references after '---' marker.

With that change:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---

Best regards,
Krzysztof
