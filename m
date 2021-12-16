Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE04774EE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A3610FD94;
	Thu, 16 Dec 2021 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6E610FD94
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:48:14 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id cf39so38003008lfb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NoO8FVrwsHi1Mh0Zg2ta+Np2h4ZjffVGdlQs0RE3Haw=;
 b=aIbDGNQZZuWOLffbUk92cThH8Z9En5uMm2x6FMw8nN+cX0TTek7FqCENcPKe24qUua
 fvZ3lTEpHSKFOO4Ehq1w+hyGJ1wqOHOxZgLP889/5tXniKCp1paqYtdFUkP6xlyMhuVx
 hojHg9wj0eVTxgkeDkEz3f75FfNAnv9wB2Un+0BqXNC7dEsLv0y06t5oFEUsl+/OOijP
 nHP9Z0jA1Fa9MXLxISxYa3N6i6eofbOR4DPk9gcKbDUxg6IFb26uS89nkzE5GyYuD3CS
 QSLHhwa3BHaEtKXl5e/J3a4yI2a1w7QRQW6WylicYF1d2U1xOJiPDR1vs8bJwmCZ9Q+w
 JYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NoO8FVrwsHi1Mh0Zg2ta+Np2h4ZjffVGdlQs0RE3Haw=;
 b=xVJwY7AJFAOpFs1fJcYl6joLz6gQCPfdtS8vW6FgR4cqN0dL6J7iA+xCy3B6Om19/1
 gsDnC3QEDgIwO8dxcwrz9JCrr0vdxg6ar6QHcxNaiUDHJBSFwKM857As2oaQOaDFZMzH
 hvrtOjOj6FGpG8QKdXtE1RrnBqi/tFrU4zFSyCJygwTN9jRZY59WDlJb1V7L+IGux2xL
 TYQAFOgjJxCMrE5sPQYDERlHM4KsjWpEmQlIh0x3sACkspbEUsAl5t+HKekDwo6zgWPi
 4Sn/OqtfC5v2TicTsOrs8ZZHz1111lbwgimINRpDceTNfB/Z40001uHi8jsFHh23KJxt
 NHlQ==
X-Gm-Message-State: AOAM533pwrlR3Jtb3/t780dtrkVdkGQhcCebaFu9Muutq0FAoaMViAPq
 zarrnxpX/qFvLlQLrf8Bo9Y=
X-Google-Smtp-Source: ABdhPJyYbLHPIgy9eUTLiAVWNRZ0kJPZjcDvnuIO+nB+f0bfKUgMwSaaaHxY+CrbSxuS/tFGLNeQIw==
X-Received: by 2002:a05:6512:130e:: with SMTP id
 x14mr15391321lfu.366.1639666092696; 
 Thu, 16 Dec 2021 06:48:12 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id v6sm908353lfo.19.2021.12.16.06.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:48:12 -0800 (PST)
Subject: Re: [PATCH v3] dt-bindings: display: tegra: Convert to json-schema
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20211216142012.1479213-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c935b4d2-984b-e08f-6125-0ce390519b45@gmail.com>
Date: Thu, 16 Dec 2021 17:48:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216142012.1479213-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

16.12.2021 17:20, Thierry Reding пишет:
> +  resets:
> +    description: Must contain an entry for each entry in reset-names. See
> +      ../reset/reset.txt for details.
> +
> +  reset-names:
> +    items:
> +      - const: host1x

Could you please add the optional memory controller reset to all
bindings or are you going to do it later on?

https://patchwork.ozlabs.org/project/linux-tegra/patch/20211130232347.950-8-digetx@gmail.com/

Ideally, you should add the MC reset to each binding, so we won't ever
have to add them once again later on.
