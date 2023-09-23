Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC47AC406
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 19:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B8910E034;
	Sat, 23 Sep 2023 17:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06D1892D2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 17:36:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-405417465aaso24519205e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695490613; x=1696095413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dn6phUldCWNuUnLwZIK8/YMmtjChSj8cWy1kooP65ek=;
 b=uBaKkWG8/KQf7E6ol7WgBFs42Huu2M5C0a++xpC5P3JdtePZaw+ZH3lGB08A9CZU2I
 F1jSj+JN+SNTXSvf3j+9fCBuV9wIvBCKQ47Cetlg9djeRDmI+7sg2GaveolNnBJZniyE
 15GFDP3HvrpQDj8I9tLYud9wchFzn3hUVaJOYK8jUKjJJEDiH942vLoDEwJUZ8uoq+eR
 h05zhKVndHLTvq6gU31pYxb6VKVcT7oYlsIrTPrrbScmnL7502Ej/ZZPHvZtDlebAUBO
 USa2AaTVOavjC0p1gJQ47S1sKxDFr3qixfbFNRtd/JZmDSbz4cXM6AXyZozeh7jOSgap
 Ni6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695490613; x=1696095413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dn6phUldCWNuUnLwZIK8/YMmtjChSj8cWy1kooP65ek=;
 b=kHACBbIWC/yRTEdz22DzwoYDM8ReGIH+h9HoMKMSiohuqyHqM4F5Vttb+jxAktDmu5
 D2spfjxTO5/hVdELYgq2WtvWggy5dD+5xMU2bMPOr7Yg67dv0UzX40dn1xaRgHP1NKj5
 E85DPrN/ZNmCPNKYG9hAoIfyjf5kG1C0tIQNRcgWS/wCQESlEVd6y/lzmU4we1QeYd1U
 KS9abk7Eh3KjLShXyccf7kMEx8ZHQ4mAGJ4khLlB3gXw6EHkfRWt0GXLr+0GaYJ6qRly
 JL3NFE3h4L0b9Qtt+NQyLpJZ4nyFHylRDg/jyE7aMnyhlM7r4p/ou6iVKBdxCUhjKVLy
 fqTA==
X-Gm-Message-State: AOJu0YwfmYm9Db6n4RBOGUYIluIxhpMo4l4vZRcOiTDUYtCyWw/SDFL3
 xGgCedz1iu9DnIBCcilkgJHRWA==
X-Google-Smtp-Source: AGHT+IEvo9mHZh26ly7OkIqoP9oOmRajb274z0zwHS+GCNlpI9LxxNC0Imkzhh9QWjYIELh+B5vy3A==
X-Received: by 2002:a05:600c:2101:b0:401:2ee0:754a with SMTP id
 u1-20020a05600c210100b004012ee0754amr2397634wml.13.1695490612950; 
 Sat, 23 Sep 2023 10:36:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a7bc40c000000b003fc04d13242sm10682300wmi.0.2023.09.23.10.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Sep 2023 10:36:52 -0700 (PDT)
Message-ID: <4f15a450-4344-ed5a-0504-9a2f0a9daa0d@linaro.org>
Date: Sat, 23 Sep 2023 19:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 00/16] introduce more MDP3 components in MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
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
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2023 09:21, Moudy Ho wrote:
> Changes since v5:
> - Rebase on v6.6-rc2.
> - Dependent dtsi files:
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=786511
> - Depends on:
>   Message ID = 20230911074233.31556-5-shawn.sung@mediatek.com
> - Split out common propertis for RDMA.
> - Split each component into independent patches.

And ignored previously given feedback. That's not the way you should
work with upstream community. It feels like a waste of my time and it is
not fair that Mediatek is doing it :(

Best regards,
Krzysztof

