Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86D63EDFF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6055C10E115;
	Thu,  1 Dec 2022 10:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47C710E129
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:37:33 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id d3so1403238ljl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 02:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CIit3J5M4bcdITVWI6ie/I3FGXLXgR6m6GwfusmdrJE=;
 b=oRuEXXERKZYYDV9WimFhxi+n+W16yYt2dtOc7P5QG08IRUKnts1REggwWcSWA2K7GS
 CFWqZfYbNsg/vcgWQQ6gDHeVl1xTmW6BEWAWnS5pbY+gqcMzZsnq8L7hVPgEOrI+27Hw
 SPbvb6eW8+fT07BwkeFkFtubmtV5KF3Jvsky2iUBjMnzlpMQycRNe3Ezvx7xJEAcUhNG
 +Lgp1rl1ekNfciXbfK+C+cv2ofczu6yn0K8XW9aEDCNpWEGEK8awHimGAY5/lhZxjwwj
 5mTVf+6Jg1X0Nm1Krh54WT05EljJ43fEtjcKBJ7mDa00Sxbyc6tQuE766VVTCZjfEOXZ
 igYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIit3J5M4bcdITVWI6ie/I3FGXLXgR6m6GwfusmdrJE=;
 b=r2wMj7HdOg4AykqDp7m9v7mpPJo1tett+bRQyq5Lb57IhsFQZQRKzPWUdCgNP5xsnw
 rzVpwEscnlEIDpjWeRXr58qjq6OxOdSrgvWnYMl/pQxzrdnq034TyOBnZpNqnBdnvMgx
 PR01VVal7hzHYocUWJBfgUG7p4bneaeuUYlLVH/1Y+Y3IEKH4CFJcqryzG3S6F7Bv/3h
 6E7R+TdT8AE6WZulBHThMiCob/+Dg4sg+DbLFAUOFUBi6CWfqAD+vZEGYMIjiDaHkd+G
 twZO3Zd2GfwxsuE1d/v5F07J/ep1ZvH93P4H/V2D3IUyrGRgb51lJfUuySojCQWuT+66
 y4oQ==
X-Gm-Message-State: ANoB5pl5TFNCTDvQzZWgbpf4JmxrroQYTHhJIIEU3SP1xINip7bJWyfO
 529EP0AZKZAnULg3dWksw2M5jA==
X-Google-Smtp-Source: AA0mqf7ynKkshYTZoTQ3GRH//Z1ZR04OWdvwe5TEjKbt7pYwLviofbMpiBkGttO94vlLg2DiroAsTg==
X-Received: by 2002:a2e:940f:0:b0:277:5df:9728 with SMTP id
 i15-20020a2e940f000000b0027705df9728mr14128145ljh.337.1669891050977; 
 Thu, 01 Dec 2022 02:37:30 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a056512203500b004ab98cd5644sm601503lfs.182.2022.12.01.02.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 02:37:30 -0800 (PST)
Message-ID: <dfd2d1b5-4d1b-2381-ad11-5ea9e6654a55@linaro.org>
Date: Thu, 1 Dec 2022 11:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/12] dt-bindings: display: msm: Rename mdss node name
 in example
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-2-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130200950.144618-2-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2022 21:09, Adam Skladowski wrote:
> Follow other YAMLs and replace mdss name into display-subystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

