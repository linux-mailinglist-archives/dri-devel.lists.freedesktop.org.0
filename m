Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5E611DE1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 01:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884BF10E8F8;
	Fri, 28 Oct 2022 23:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2809610E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 23:01:16 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id l28so4434929qtv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 16:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dKeoXNkMblk+UJFgSyQMrIXcs65OuOPqsIyg05xgoc4=;
 b=J14OvWSVlYMidiIMvUfrjz/Gfm6zXOTXuqwkydg3DmWshWIXV4y+v0MJYnsROY58sl
 ViOY1HqBT/oU4wyElCrT8GdpjLpFaKvn77z1ykoiR3dg99f+Ao+dGzslk1uxXX9UuThm
 WTcA3CYueJZPLLawlNfUqJ65fe8Ru2+7HCNVfZZruVTPPBa4ayeISuJsx7u0sND9rlhZ
 gF1WZQMfpU1EwbxkGUhVdUXhKoRNazAkF2GhQtHzYhBXRzcdzlUCx8cNttaF5qniN5Qw
 dkxIUNjklS23ROsnqH34ME6viYFkoG3IFA8Wmtc+1SKBeI3yT5qiIUQ+Ngnsraz+dKgs
 OSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dKeoXNkMblk+UJFgSyQMrIXcs65OuOPqsIyg05xgoc4=;
 b=EPjNcIfPfS2B1P8iUwv6A2dyn5ozadgsZl5/1LiYdrBovfuky2ML+TB7p+hpFhuinH
 btbLaQLg07uL5bgOnGw1BQ2haR9q0KVs3aG+/9l7UJU8aCciYgW/6jiAY0ECmAcvv/9Z
 nxfSzgL+L/l2MLHESC7GrV/a+RJuC9wZwHoL0/SZR7N8ZjocELGjiLlSuqGdRo9i3X4M
 iGMPmn6PV/17TpdDtZgZWpvBkq17Xx964OzA482x6bd92Keii1tPpk4G28orhrh27pXW
 F5Dk2QC2xhL1wxZkc6HVzJYWZhuuEKx1NF/SkxlZ5n9W8YBpCZlmS8lHbXbYyh7zJTCI
 tpuQ==
X-Gm-Message-State: ACrzQf0Lw1NagAGRb/man0PSWdroZItCgoD9qaetZ6+8/ZFzW0cgx4pO
 lwjNz8oxnVJ0PXdeF5Jgq4QsPQ==
X-Google-Smtp-Source: AMsMyM4xYoVLGNGIK42j4plye/z0wBSy3M69oR1eDpu4le86TgsHckHbwfyvbRm2m9MCDWMd4lHFyA==
X-Received: by 2002:a05:622a:188a:b0:39c:eb39:e7d0 with SMTP id
 v10-20020a05622a188a00b0039ceb39e7d0mr1699406qtc.182.1666998075165; 
 Fri, 28 Oct 2022 16:01:15 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05620a254800b006cfc1d827cbsm3952412qko.9.2022.10.28.16.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 16:01:14 -0700 (PDT)
Message-ID: <762efc62-cad6-609b-c82d-01a4290e5948@linaro.org>
Date: Fri, 28 Oct 2022 19:01:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH V4 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221028205009.15105-1-macroalpha82@gmail.com>
 <20221028205009.15105-3-macroalpha82@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028205009.15105-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/10/2022 16:50, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the NewVision NV3051D panel bindings.
> Note that for the two expected consumers of this panel binding
> the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> is used because the hardware itself is known as "anbernic,rg353p".
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Didn't you got here tag?

Best regards,
Krzysztof

