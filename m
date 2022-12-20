Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493CE6522DB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 15:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D571010E3AC;
	Tue, 20 Dec 2022 14:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0D310E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 14:37:43 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id n6so6937279ljj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2JsFMcOeZFGUsQ+r4v0+OvzrOSs0ewhDSvbujmdrSKk=;
 b=xtcWee16pQLUIWd3eL2BtuEY2t+lK2nRm2dmSSdY3AOyXWYfxWXBgmZI/uAyklkVRw
 9RPcJpLVpN98w8nClGy17G+UIq2EqVEPpi1iYiIQWyrX/RvlxMhIySb9j8Y9W5nr4ABf
 oloVD5mhEBNdZ1Cx50ZpzfzcgC40e21cxut4a/z7txR3HaGRhPzejbiALzcfwVGD3FdB
 pyNVBEpzAx/xydEGRKI+hT7/hxmkzw9EKhq7FmNlcDhp6Nur/ejBSVx5ZpZLoC+3sLnx
 vPhG4w0lLqaYN8bmZ6ToBV4+j7o2JmQMkTCdLKFjsyjSD/7NUGi7tFyD48cHFhuVgOeb
 1lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2JsFMcOeZFGUsQ+r4v0+OvzrOSs0ewhDSvbujmdrSKk=;
 b=tXQv6oERzeAiuqezwxguOYGPbZyQLfOIJYPfImA1+G/1UA1esNYFCacnkAvNgOFDpN
 7kjluc9tlJzNk1XSupay47V8/2K7ToqGqivlWpRqrA5D8tEit/Gi8plsWE0Jxingkc0Y
 vE6EqEEUf3Kvq3OrUZqDPBkxg5wGhmgO6n6djxXdm/m4bPpWksrDM3hMU9dVbNPA5Mse
 /YmYQkxQ625WS8isEPxr3N8qCOFXjHtegOKKTx21FhB971UlWV/C0UzR8GW/aCrh433N
 oNRGCkoxA7GHGU1AkdlgVPW5cEe6x3n3Hx29LavStALXMeLRRm4QYDOdNPDnSWHiWLGZ
 QQJw==
X-Gm-Message-State: ANoB5pndxI+4KmrDNPSx/oJxamfVLmvccJOwNcrJu8pKbsE7TWJLahXz
 0eiU2PulOjABqGTMjltVPSb+sg==
X-Google-Smtp-Source: AA0mqf5+u3M0eVUcPdEEsjPO8NFMgWK3ojUVLEipPYJCQv91qQuGT+OP10lOuJ6l1e37JpvHPFAicQ==
X-Received: by 2002:a05:651c:12c4:b0:277:44e:4992 with SMTP id
 4-20020a05651c12c400b00277044e4992mr11303457lje.26.1671547062129; 
 Tue, 20 Dec 2022 06:37:42 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a2eb52e000000b0026dcb07122csm1044666ljm.117.2022.12.20.06.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:37:41 -0800 (PST)
Message-ID: <842f65e2-ee8f-140f-ac0b-cb5898fc36be@linaro.org>
Date: Tue, 20 Dec 2022 15:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Content-Language: en-US
To: Christophe Branchereau <cbranchereau@gmail.com>,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221220120108.481554-1-cbranchereau@gmail.com>
 <20221220120108.481554-3-cbranchereau@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220120108.481554-3-cbranchereau@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/12/2022 13:01, Christophe Branchereau wrote:
> From: Paul Cercueil <paul@crapouillou.net>
> 
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Drop my review, code is not correct anymore and you did not test it
before sending.


Best regards,
Krzysztof

