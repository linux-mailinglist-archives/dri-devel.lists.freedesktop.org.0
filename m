Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CDD56226E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFA510FE73;
	Thu, 30 Jun 2022 19:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548F811A534
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:00:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id g26so40761046ejb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5F6t8Oak8C6GS4yU7b7+HZc9W80825eLPQomvUc1GA4=;
 b=dyrnhxUVpeKETcOXlp8V2F+2d3STsBAJgY1uvPBzCsaCmAUn6hh/Vv8szNUBeaTgP8
 EBVGfbPAYX9Q10WsbXXt/HLckIE//XCkxvOGJ/ZfwFTxP06HUO/3+/dsts3cqlgnEMCS
 vwdRNHg4JBKQnPCU4xnOAkFM7YnZb/qx24b1AmCsNoyj8nGJbVRb1s8opdArso5ltr70
 pNXIvHONzd2+T4WsAvmrQD/CKG2MR9b6zrMzrtmmWUfyfcM+KokEXt99udexRw3pKuqu
 8AlL7t7stpk0X8p0PiCRPKqmWI5ceLwKQjPmA68k73R1haJHag0mTKlk3ZyVuLDCpVbW
 wv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5F6t8Oak8C6GS4yU7b7+HZc9W80825eLPQomvUc1GA4=;
 b=2VDhbOFCCk5pdy5f2kMYEI1QE0k0yWyjkAdHf4J8pIFNQLzlFFjad9IXq8aBVOja3y
 vUNZEY8jKV9KFzrkXweHrVnlnsFDRVee04dJI5IMkMeWQRAKXPlMkVjUaAWyrABvviQm
 DMkHNSojtsMFZ85KBztTDg4YgO4Ovr2uXMiEGnuzhlQyXak772udKzOk/SU17ZD6OITk
 ALsjb4KznLIcnork5FY0s7dHLo10YwJUeFl1dvneSUPBHfVCP2TIl/YLpmtsi9QZDRNW
 xwZDw/VmAWLbl4N0EcwmtzCwfmqDRsyifnBvD6Az/k0WTuFxiCcAgxM8+NysSw4kTJSF
 Ma6Q==
X-Gm-Message-State: AJIora+nHaP/5p6Ixl3Gxn1XriujyH2eeV4gOz1KTiYYrF54nU8qE06a
 EwSrGhDVA9Yw1arKMFlnyBlL8w==
X-Google-Smtp-Source: AGRyM1vb3jf+SbscLT5vNMXLJwsUmIX3G8k1DzkfPrK2EjrWsu9bAjYRrXkbwMHvCqRLoIe2i5R3eg==
X-Received: by 2002:a17:907:60cc:b0:722:e564:eb11 with SMTP id
 hv12-20020a17090760cc00b00722e564eb11mr10179551ejc.736.1656615611667; 
 Thu, 30 Jun 2022 12:00:11 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 h1-20020a1709063c0100b006feec47dae9sm9389030ejg.157.2022.06.30.12.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:00:11 -0700 (PDT)
Message-ID: <02b93cc4-44f0-ba93-aefc-086d9373b6b8@linaro.org>
Date: Thu, 30 Jun 2022 21:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: msm: dsi: Fix operating-points-v2
 constraint
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> The existing msm8916.dtsi does not depend on nor require operating points.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
