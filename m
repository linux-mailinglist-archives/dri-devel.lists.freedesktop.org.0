Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEA04F61FC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7994A10E2DF;
	Wed,  6 Apr 2022 14:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC22E10E2D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 14:44:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i27so4726297ejd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UNqM0LlACzUWebKPb32nAc46OxRJa6ogRvRpwiXpenY=;
 b=whpZ3f6EBitVqq0rstJxB66VMYokK6P1XsHnHCPNRzkc24btGAatngLwzN3FrEmk+X
 nXT4tCx7EzcaMXTxngfAU80wkPN1yAVsJZzSkSehSs2BXtRZcANCt6m93GX/BihIB+RY
 V7oYXx4CRRS7J6miGCAMWSNwRF8g+2l++6BEPLe7nzBKUOC+V2vfMI/s7CSmVp/9jdHg
 2/Olc5oty19Vow4Sg9OXhlXGsSwaVffLD3aYy1+qWIQMaUVmQfNqM4kQlZSdQ670kpqP
 vXJHa0sJFTiCf0/nKh9/Le5EEfDWZiiBQuOkp6OsMtfLFinyDWYCxFlQdT5cQN3FFnwh
 nmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UNqM0LlACzUWebKPb32nAc46OxRJa6ogRvRpwiXpenY=;
 b=G8K8SGW9JyJU4pmuKNaKyX6IWWJg7jiczrLN0cNovWublw92cfWs3jxvc7MLnOL7A1
 zfAxpQ1sODX/l5AwbBVKKNHtKC+zt2hO1Qx0tFjDEwMmYzuyvUQE2sHxJLmkcH6LoDFj
 16hXokyBPwjyVLONJdrQMdkGZ4qI+ME9ieLlnNhpA5DCP9yrOMo1ZErg5c8Up1QVnfeg
 2ZvfmdRm+5RCCdTralaTAFTl88elj7uaHF+6d4+gag9oEHeQngWropLeK5YgN8omqmgZ
 yUC/ezzsXdWR5T3G43T68XtmEvcsyVu2GW6rjuvpicMELImmUcj692ArMcewo1SQebOn
 z6JA==
X-Gm-Message-State: AOAM5308qxo6kPhdzkqF3yvvBQVezvDr+snPrmpon27kovsKMPuFGYCe
 cDLPDJpiGCeetk61euc8+Cu3vw==
X-Google-Smtp-Source: ABdhPJweVGzt2UYsW0wgC1QYNfzk/buFhSRGS7vEy/Lzgm2Wxo+7xzpzsQtReauuNt8ndDaCKGNT3A==
X-Received: by 2002:a17:907:3d93:b0:6e7:4d22:75c8 with SMTP id
 he19-20020a1709073d9300b006e74d2275c8mr8656814ejc.330.1649256258352; 
 Wed, 06 Apr 2022 07:44:18 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 h30-20020a056402095e00b00412b81dd96esm7858108edz.29.2022.04.06.07.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:44:17 -0700 (PDT)
Message-ID: <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
Date: Wed, 6 Apr 2022 16:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406094654.29722-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2022 11:46, Rex-BC Chen wrote:
> The driver data of MT8183 and MT8173 are different.
> The value of has_gamma for MT8173 is true while the value of MT8183 is
> false. Therefore, the compatible of disp_aal for MT8183 is not suitable
> for the compatible for MT8173.

Just because one feature is not supported, it does not mean they are
incompatible, which you claim in the patch below. Are you sure they are
really incompatible and MT8173 fallback cannot be used?


Best regards,
Krzysztof
