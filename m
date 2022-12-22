Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC065402F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 12:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AC210E106;
	Thu, 22 Dec 2022 11:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D9D10E106
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:54:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m29so2347240lfo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 03:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X9EoBcFcr53BTbI8NLGBFcA7SGUwn8mmf9pGDxbWrjw=;
 b=ltUUyIxFmAaCCU3K8fji72mezO1sOZfzxlQy1hicVdGCCFEpK1YliunaefhbfBcWdJ
 4+ihkXYqnYePmqVq5a5O4BJKutu1jqz2+zGv2jI4t6LoT4nLPvUNiOU0rz0B5i99WkkK
 bygT4FMTn1zt5VmzT26PbjddUvF6jVOKRmFh/KSPbto9V/jYeOPfO68U/MXO3Jq0wBq7
 oFo7kW96M4XGvpeusRqjKGwHThoFk8tUuhsXRK61mqJH3iAo3ttp1vQJ+DescoK4u1xN
 WFWuTYzoDlLxyMj24g9fM0eUzj8iX0EkpTM/BND8fb5hz4UCgSg4HS9001LVZoob0HqB
 CHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9EoBcFcr53BTbI8NLGBFcA7SGUwn8mmf9pGDxbWrjw=;
 b=h81XwbS9wsvKFUhwPWMWuFxb+6MG8chq0H3NjUpIGVvRXHQwni4mMDtH9/dMPrMXct
 bReNLbwwyQ8J060rlQkM5IYnA6l4C1mwkvig3cYmYgAHaoTah20Wu7WouGG2Mu1eBTMl
 f1YJtIcerJ7/HD4YEm7nq8vvJYOaulrlifQhq9opWzw1lIlPW78W2cb2gCiSrdhRb+dA
 QjvAv7X3z8UW7An1QMTCl+W1Zr54FWtfsP2yV7PHTOH+UhYSTUWkBI/Stk3VzqOK8mI5
 yUBsfu6ovR1ZXznlyCtxCKqSpc/VSoMso0c5B+0xXcm6Y7ajJ9gIlRu5gGi1W7Jir3jB
 YZNA==
X-Gm-Message-State: AFqh2kqeJHUvndt1+62PQpzgWPOyDWCmkXXAmyuJ51E0ZvY+GtJusg/Z
 S/68fTGU2VXEdimrENpzj1gYaA==
X-Google-Smtp-Source: AMrXdXuMEMS4ZAdZYRoxvWSmL5geV2FFazuPdHHRVejnluBwFSosVnViUal3BytGSYAMPvyirJ7lXw==
X-Received: by 2002:ac2:5e6a:0:b0:4b0:f376:225a with SMTP id
 a10-20020ac25e6a000000b004b0f376225amr1559959lfr.63.1671710063624; 
 Thu, 22 Dec 2022 03:54:23 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bq25-20020a056512151900b004b592043413sm50426lfb.12.2022.12.22.03.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:54:23 -0800 (PST)
Message-ID: <d4962a5c-7fa3-e5d7-51a8-7ae8fc54e053@linaro.org>
Date: Thu, 22 Dec 2022 12:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 07/21] dt-bindings: msm: dsi-controller-main: Fix clock
 declarations
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-8-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-8-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fix this by listing the clock descriptions against the clock names at a
> high level.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

I don't think this can be on its own. Clocks and clock-names go together
and your previous patch already changed from 6 to 3-9 entries. Splitting
these make them non-bisectable and confusing.

Best regards,
Krzysztof

