Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B634465AEC9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 10:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC5410E16A;
	Mon,  2 Jan 2023 09:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C83D10E16A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 09:42:24 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q2so28616771ljp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xcvUq9UmyoEcHCIHRWfiFIf8dqA/idA+5+kkBDP3Jwc=;
 b=Enze+qE85rszC5l162+SsytKiZVRn651c+AptSbBqDeg5CshqP5D9I9DLhQLomlsQU
 aoWaxQ/Uv11McO77pbu15jV+qcjG4Most/S51gDs235PYfDMs/F1gHmF/0kjUb8mZtl7
 yROT4X7bKUc42ZAGuX/MRlZ9Us47NvpEc8KRLl/s1Dag3/VgRa0SnC+M9Lzr2xjqgoCg
 EGwe8Qu+93rEU+1hrm7AG5h6KxX45djw0vW46Zy5hFclNWHL2MoaMF4godTuiTbKcR5u
 4FUkEmM/9agUvzErz8wWtO1qmrOoZ8li66OIEY27EhvCk3UQbBEavCz6KbA+hYtdWWAT
 4nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xcvUq9UmyoEcHCIHRWfiFIf8dqA/idA+5+kkBDP3Jwc=;
 b=VttzrWWjKpKyZfdRzjQ//bfaw9pg7oG51YAUOWJZaFunbP5Kzjrk90HfJiL2oPHI/P
 aaCwGgNBx4BARGRDLX1S5VVFzkNn4ipLh1+l0z2ELYEuQ/u7Gua62R8qXtz6JnG6pRKe
 aMzrEJa6vWoKTM5f+KshjCgTavLcVQreZKXFg+ceCyWNp+ACQJLr59HLQnglH8XgR5Vq
 VpTdf+hFI4q/ayMmVgnfwZwO51AXwJ4WnDAE57t/SIrUmyso8/6AFiQD3bkU9jAPj+U/
 V0ntQaYe7KUUX6kNhSaBE7xN+eokg1SXzICMFIKC5aRpqDmKn3zYwEwMo8VavK9ma3ls
 m63Q==
X-Gm-Message-State: AFqh2kp0PWBZZ4ZfrmY/2y+2skg9dv1H1Lt7Mcr+bJct78zuWpqGzdTZ
 umkBHVSClKNbGJkxC2xv12Ihdg==
X-Google-Smtp-Source: AMrXdXvIOdKJ5XgKS4KvY6aM9o/FsDhmwNFMqN1FOzgDaixGx2p6xYkl2sb5r+OmNajN9s+2sMoAgw==
X-Received: by 2002:a2e:720f:0:b0:27a:991:4d11 with SMTP id
 n15-20020a2e720f000000b0027a09914d11mr9304108ljc.30.1672652542942; 
 Mon, 02 Jan 2023 01:42:22 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 z14-20020ac24f8e000000b004b55cebdbd7sm4433673lfs.120.2023.01.02.01.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 01:42:22 -0800 (PST)
Message-ID: <0de2354a-d140-364d-1a7c-380bb899c3e5@linaro.org>
Date: Mon, 2 Jan 2023 10:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-2-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229133205.981397-2-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/12/2022 14:31, Luca Ceresoli wrote:
> VIP is the parallel video capture component within the video input
> subsystem of Tegra20 (and other Tegra chips, apparently).
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

