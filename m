Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF94522D10
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 09:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E5210EBD7;
	Wed, 11 May 2022 07:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C3210EBD7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 07:21:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id g6so2234833ejw.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RXqalM416ApPrla/4DErz/ii+vIxKRe2oyKQomPkyMU=;
 b=weKbfzvbT5aLuUAztiVaLWv9yObZ4ovS1g0mJE8aTbCrP+3IqUzozCgtA/QxA8liBW
 xlSkA3NAx45i+qKkSJyNGEIM8KOU+jFeBkHHlhAgMVfq/+TLcFlAfJm7dNrr6GFk7bG0
 kopTrFWc0gM92nLNI340RBiRcX1j5oofa6vOdJFFnie2Cp0DErgv++KsgG6PoI7vQ+a+
 McjpZqGE8bfJilA5FZ7akhW2HlHFiQxJaBl6rt3iWNUHE9h27q34eX69Bktzx/mDZO/u
 o/kJY1T+JpaXqfyD2HgBcDyomJlXPrGER93rAJdfCyph8ENxOnQV+GYcMU33YM+lGve9
 LyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RXqalM416ApPrla/4DErz/ii+vIxKRe2oyKQomPkyMU=;
 b=bXC27zJC0aBzQbudS4s4KIlWhrKVMQ/gYlPRtnIxi8wJ7tRgFnoPHybm4+oXXPQ4XJ
 RetAayXb33Kb0HaBLh7zHsMcWMYmp+5VdUTdyre8tcLyJNXOQTuPUywdXc1SE4m0/ohB
 Ybr8PowVij629Q1lgA6330i01r1uKFEvihF8EJmE9dkMbl9YC7cvnM7MA/Q4+ffIRg47
 F2Wx0KugppKiVqmmPWup/fbRS6q5tpjUb5ZUiqdU3/AXhgcjvD1rHuZRGvemjFJ6QbEm
 6QVwsS2iDAwX9BJyYQWIUtJcupIfV5Ym82LTGmq+hFZLOPKhpbNMAHdwT2adPsXTytJj
 GJlQ==
X-Gm-Message-State: AOAM533Pel1TnKpGqfDCi416dDy8l//AZ823PtJSeYCIMo3E/ZIP9MZV
 ZcRnuQJbIyazxFN4PdXOM6ozBw==
X-Google-Smtp-Source: ABdhPJxcrj0KplZqqraMGc5jXewWMW7uSDQbjHFyf6/MFSIOrKtW7ZaBrpHpJK+X1+Ie2x65n6aXqA==
X-Received: by 2002:a17:907:1c82:b0:6f4:d2ee:2f8e with SMTP id
 nb2-20020a1709071c8200b006f4d2ee2f8emr23589094ejc.714.1652253705131; 
 Wed, 11 May 2022 00:21:45 -0700 (PDT)
Received: from [192.168.0.253] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006f52dbc192bsm633470ejy.37.2022.05.11.00.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 00:21:44 -0700 (PDT)
Message-ID: <b6ebc33b-dd42-fe01-27be-c0d312548f8f@linaro.org>
Date: Wed, 11 May 2022 09:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
 <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
 <CAGXv+5EHFjqiVQbXgcJWCo+TmaTU_z4e0g85beMLCNjyx5qJcw@mail.gmail.com>
 <0686125d-4984-5dcd-32ca-4eeece09d7c3@linaro.org>
 <4d2b1c2c4ab27ba96d59b9a0e3adcdab311ec897.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4d2b1c2c4ab27ba96d59b9a0e3adcdab311ec897.camel@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2022 04:26, Rex-BC Chen wrote:
> Hello Krzysztof and Chen-Yu,
> 
> Nancy thinks our IP is more like rdma.
> Blitter may be somthing for reading memory and writing to another
> memory, but we don't have the function of writing memory.
> If we use rdma, is it ok?

Sure.


Best regards,
Krzysztof
