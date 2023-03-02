Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CA6A7FFB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 11:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F84910E4B8;
	Thu,  2 Mar 2023 10:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768168952F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 10:30:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e13so4493144wro.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 02:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677753050;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HwOZUGKJ+t9xe2A8iPH5J+XMLtNu9Kocbw3QWISBg/Q=;
 b=rnUUn5sP1r2EjF/AbEZsiOH35KiPKcSVRw3zrhLUi/h8WCInyq69fZaYpbfyMcffpz
 ZSKqKfmeWal1hMaCy5AyFUeKaB+h3upCXVHiMEnd60uRBJ3ewsLz4lAB7cr9x8TjiFMo
 i8bnNrg5K+UtjIMty7JgeQrVdDhlRu3+GTYXkPslUXSr4gsJSXCjAz67lSJ/s+Q3k9hD
 PkEDe/4CBsipCFOlWGzRqinqu4F71vZUSgXjjkUvGe346mUeVKoBKfwoaE7RaOy8/O4K
 m/GgU876uW2RO3BqBZQLn0v9MxFspvNZJbSTYMcfXr6koV8G36p89HFLNuVzsbqh+goB
 VjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677753050;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwOZUGKJ+t9xe2A8iPH5J+XMLtNu9Kocbw3QWISBg/Q=;
 b=5yb1MeJWJVeBdtS1deT+p7iEvl6p95Gkj2HP3tls+K1Quq3t+ghgu1P23RqzObAsH3
 4gKOTKCBzQbwaQ7sfYJ7o5/fUtMJKy9N2Q+iD3uDD59YeVxC5jaztBEGK6AUpXKjzkug
 zfwlBeBYft7URtq6oDd2NhQK0kyW7fHn4wdMNeQRLuGywDJwmkcm/Nni5M41G/EOky2Q
 xMBs/ooyrngmoMEE33n23EtucbTCYA1W37Xp7M/22kB7pmzq+roBp4/6X55muVvWqsLd
 XaHb5KBnIzC8qkwXkvx8thqg306K5ozKlUPQJNWONcv28MYp7cbrAeFKlWaNLkkqRnYU
 rFbQ==
X-Gm-Message-State: AO0yUKUumpsB8gnZVvlRk9BvcdUQLOkrrWBxioq6z//YmMEk9cKX6dVn
 ROlPif1tMq1TpVjHFbvmQLoJxA==
X-Google-Smtp-Source: AK7set9kQJz6aP9As/ms2j7f0QJlW4EWyc4zj5sDWLQQCRQzwb0ak3Hc3kqXRa2Z8yAId/FNkIDm/g==
X-Received: by 2002:a5d:40ca:0:b0:2c7:4ec:8d79 with SMTP id
 b10-20020a5d40ca000000b002c704ec8d79mr6613894wrq.21.1677753049937; 
 Thu, 02 Mar 2023 02:30:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:217a:db24:fe27:6b35?
 ([2a01:e0a:982:cbb0:217a:db24:fe27:6b35])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a5d5149000000b002c54c92e125sm15031866wrt.46.2023.03.02.02.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:30:49 -0800 (PST)
Message-ID: <583403fa-c104-42ad-c628-cfcb8da5eb05@linaro.org>
Date: Thu, 2 Mar 2023 11:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as maintainer for DRM Panels
 drivers
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
 <167775297427.128880.7902941265688645008.b4-ty@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <167775297427.128880.7902941265688645008.b4-ty@linaro.org>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2023 11:29, Neil Armstrong wrote:
> Hi,
> 
> On Wed, 01 Mar 2023 10:47:35 +0100, Neil Armstrong wrote:
>> Add myself as co-maintainer for DRM Panel Drivers in order to help
>> reviewing and getting new panels drivers merged, and Remove Thierry
>> as he suggested since he wasn't active for a while.
>>
>> Thanks Thierry for all your work!
>>
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

It's a typo from b4, it was applied on drm-misc-next.
No idea why b4 uses drm-misc-next-fixes, the commit isn't in this branch...

Neil

> 
> [1/1] MAINTAINERS: Add myself as maintainer for DRM Panels drivers
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4ddeb90d602ac58bcf99924eb34d8b2f820ce11d
> 

