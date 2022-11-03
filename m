Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6290617E8C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD0710E5F9;
	Thu,  3 Nov 2022 13:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3DD10E5F6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:57:47 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id l15so1238664qtv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ivkl6noHgtHxnX4HkMC2J/JKiOsQACja2BSXGG6Zr60=;
 b=NKgDYXtDWPA0b4HED1ao/6boMXAV3OGZXjeZrS/VcwcYD/TBlPD2cZUzmHVd4KXGMr
 Zl3MlJubi7RpgMRPsZgfnAtqs4hw6A+zB6lVMtco/R4+6G6BQmCYg6bk9Pwl+FhizR8N
 LMkHSdQraUw72Q3OeHb0ck8HXtjdxA5yaJ6pSdARUR+wCnJ2h+PR9RpJthz8+1DaTriY
 UG9NL6vE3sG+dh8rJvwg6xLXznrtp1gHaVO4en3lIzlzQZLhIvlttj2uZNghySmkC3bK
 58/+e1cA12+NGJJ2dypxoA+iHOPvAW53biZeXiGJrAZTreqzH26oHXuJ4olcRwDJ+a6O
 j0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ivkl6noHgtHxnX4HkMC2J/JKiOsQACja2BSXGG6Zr60=;
 b=0GUAP4Skietbl7pu2AXDdhl6lBsxTtVYHe0CIcCBqIcOQRuxh+wbKEhaFxayKycIiy
 bsAOPvW27hiQiPG7nnhG8Qtuw+xXHHgCgsACS0lVeSIfU4gPJxzd9WpzpFWIEJXrKL14
 lt8ZTLl+Q/v5KAtXkyQpEfIN648gTpp03WzGnh9KJi/fBD0Hy8ujtx0Si+9VLB2bRftF
 PgZV7njBGBeVmSE51K7qToh2NAuMibZwgrnjBdOELKbfVE0wMgpD38muDlSwWZ1DuRql
 v/wNOz209P3vib9IxTxz6TGqrxjjtYjIOdE0xfG8XgU29NMLcIfEjHn4fDjQQtbf5ogG
 IgnA==
X-Gm-Message-State: ACrzQf3s9s0yhWpnU8BmAcUmO8tzRNSPkX/7+T2XM836Jdy2Nnom+AVM
 vYVXyMC0mmOgb5ipRzhv72deHg==
X-Google-Smtp-Source: AMsMyM5PekZTVYkWuW+S4tREDd0YGuQ6PJTYu6qu6hX1kmnSyXtTOdVPhIHfXXJ16H0Am0bA/S2Xpg==
X-Received: by 2002:a05:622a:3d0:b0:39a:5634:eee2 with SMTP id
 k16-20020a05622a03d000b0039a5634eee2mr24806810qtx.660.1667483867178; 
 Thu, 03 Nov 2022 06:57:47 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 i19-20020ac860d3000000b003a5612c3f28sm54720qtm.56.2022.11.03.06.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 06:57:46 -0700 (PDT)
Message-ID: <6f6163f4-95ee-61d8-3442-88d1f2cfedbe@linaro.org>
Date: Thu, 3 Nov 2022 09:57:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/8] dt-bindings: display/msm: add sm8350 and sm8450
 DSI PHYs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102231309.583587-3-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2022 19:13, Dmitry Baryshkov wrote:
> SM8350 and SM8450 platforms use the same driver and same bindings as the
> existing 7nm DSI PHYs. Add corresponding compatibility strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

