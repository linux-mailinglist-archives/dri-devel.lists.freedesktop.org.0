Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCCA639790
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 19:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4724810E06A;
	Sat, 26 Nov 2022 18:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FE110E121
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 18:08:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g12so10928433wrs.10
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=14HxlRV+SCHhU12Rhd+agDyzR52gxT5y8aPZsUnVBcQ=;
 b=JSUOpnXVUL/GtjGB+U5r8O3XJS4oO27vbjQDsLdJ/FGIJwOWh64sgz7OetrwgWMst1
 KrwUMvbwqF2PHIhNvMwFnwMJwvCh5oCq9NeTbMC0koYwiyCcUMUfFWMoNBgWQWIi2JbK
 KclHHIy1Bl2rI4igM/+Z0pkMB2rCxdjNgOr/NllrCeUSiSA+YGceRa5Z76k6Buc4lU5u
 y5iNQcvrw2ImTH9iCOLtAwOCuuuWrS2+AYNeNdF3amFmXCsGGX0GM01XcoyI6loLInRP
 uVsBJMKKeKn2nDwhkRwsy/Ba4ft5IAxbKs8jRxMXRKnmlbHVpo0zW8c/PPvtVotGuUlC
 U8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=14HxlRV+SCHhU12Rhd+agDyzR52gxT5y8aPZsUnVBcQ=;
 b=EYyWcWGjaXW8ghWKkzVt/khj6FOL7QIgyNbxOeTggnXqplX4z32/W+o4QQISJDSx+G
 zG7BIYAhViXAQmH+LIo54GvaloaGYCuViYGpTt8je10YBRh7UJ1pSZ6eWdTJGpMS7BBS
 bnkpYwuzvkKLATKCV41IYxrS60PvWHwDIMw446rmyz6+jfodbJogqNEjWtY9s4JXLbgf
 N7E26NK/+zMgN8TlKibvOQhVTdRnT0UJXz2YmJFbFiKHp/1wfEE01yhKK7ywD+1uags2
 /OLiJpb26gtP4jtKoz81Xfws/ICjraWX69SKjv4/y695evTlxzarjJvttn0Xd5aQGZpJ
 sfrg==
X-Gm-Message-State: ANoB5pnb6L3FUvdUHLaOZCCxrcpAGaMAK6QQpJ4Zwy8S0ngYeAhrPD/2
 nQNgf2IVYZaJWIh170EdE3MwxQ==
X-Google-Smtp-Source: AA0mqf46lNLHAVNwE5GbJ272Q83inWMEqFqLSYa4pDcNM0EpPB/YRth9LRxuNf6zHFVz4J8/8Pl5fQ==
X-Received: by 2002:a05:6000:886:b0:241:b933:34a1 with SMTP id
 ca6-20020a056000088600b00241b93334a1mr17565403wrb.550.1669486137356; 
 Sat, 26 Nov 2022 10:08:57 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d668b000000b00241bc4880fesm6383609wru.111.2022.11.26.10.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:08:56 -0800 (PST)
Message-ID: <26f9ff51-b6ee-5d2b-fc8b-93f7778d99a4@linaro.org>
Date: Sat, 26 Nov 2022 18:08:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 03/18] dt-bindings: msm: dsi-controller-main: Rename
 qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-4-bryan.odonoghue@linaro.org>
 <4fd1500d-e3ca-45fd-1cc8-81783697b809@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4fd1500d-e3ca-45fd-1cc8-81783697b809@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/11/2022 14:36, Krzysztof Kozlowski wrote:
> That's a bit surprising. Did we discuss it? It breaks the ABI, so I
> doubt (driver/bindings were already upstreamed).
> 
> Best regards,
> Krzysztof

We did discuss it but, apparently didn't grep it.

I'll drop this
