Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2B6C9C59
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC7710E281;
	Mon, 27 Mar 2023 07:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8F110E281
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:38:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so4514330wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902717;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bdQygMFSojhHb9UzbfT0qfrW0CvIqYBKB4dBbixr0z0=;
 b=RAroFrR01Ww0lG+ExefIhmrjcnwgID6UKNSOmMxf7UwU5EMjZkj++Usuz99rkqjoeb
 xeTSiWVzh5lUNo30rwi2Fewo82ErgX2B3g2isj4zC3ZLAvSPZmtJlBsxJp4rcUjQF9wA
 PYCPDlkk3Dj9GRTDeopubjVWJlQxC9v2zfxMj1u7ebjSqJaVcJJgJaC7U1UjLsTW/jxW
 Jatj9wGvQQwdQsifl6izeD/2QgKFhh+y5xTjP6sD+cXvIFXonTD6G+Wgqr4H4/cZ4ZqC
 zv5QIb0sznIOzRVZ1Dvz/UTlCMtFkFRm5OLDyQJb+hwDIHWpH/l0bz4pSnYERBTZC4XZ
 zdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902717;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdQygMFSojhHb9UzbfT0qfrW0CvIqYBKB4dBbixr0z0=;
 b=ApB6aHv+88eDy69BEg05F/l8BTz8q5XukbXgzzKOv6az6mdx+ljndCIdc0C2bWUdI+
 68Rj+GhzG5vSTbtJBotZrPv6genGhcOLovH8pTES9tom3+a6+kaEc6frXjbJC3QZrs2E
 VDpx7oV9kTWJHKzXRiBJWmm6iT1+ay5EiVp5HX2kxg15iP5pk1lIGtK9emqnzVQfmeD8
 9SAH9B6uS8jaf5wGmNzfSKflJesB2BAiPY2B8lrW36T4r/X9wfDkksw/R3bS/zNQUzzn
 3gIN2QfYJWinUMsJg2cB7Z8tVtYq/rIDyJ/bKqNi3RIITwcwboF8aSBw1p537jI50DJc
 qBzg==
X-Gm-Message-State: AO0yUKXXKcrTCly4FKwJYRvHTtvYtD5HfMGLYUq1Lo+J/HWfErFiV9vL
 NI9TwuhvuhCKcQRH04yy9+RGWA==
X-Google-Smtp-Source: AK7set+sqDKP0WhKZcIorES5GqH/LBErNInWZwXQtaQi4praEw2pzSfhRkQfrtcDapc68yHrppL9tA==
X-Received: by 2002:a05:600c:2312:b0:3ee:b3bf:5f7c with SMTP id
 18-20020a05600c231200b003eeb3bf5f7cmr8585069wmo.23.1679902717268; 
 Mon, 27 Mar 2023 00:38:37 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a1c750f000000b003ee1acdb036sm12738246wmc.17.2023.03.27.00.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:38:36 -0700 (PDT)
Message-ID: <0d9b75ed-5bfe-4389-f4c9-3b990191f3fc@linaro.org>
Date: Mon, 27 Mar 2023 09:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/6] dt-bindings: display: boe,tv101wum-nl6: document
 rotation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>,
 Harigovindan P <harigovi@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
 <20230326155425.91181-6-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326155425.91181-6-krzysztof.kozlowski@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/03/2023 17:54, Krzysztof Kozlowski wrote:
> Allow 'rotation' property (coming from panel-common.yaml) already used
> in DTS:
> 
>    sc7180-trogdor-quackingstick-r0.dtb: panel@0: 'rotation' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml      | 1 +
>   1 file changed, 1 insertion(+)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
