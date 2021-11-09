Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F944AE80
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902CB6E821;
	Tue,  9 Nov 2021 13:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE92B6E894
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 13:10:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso1864779wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 05:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yikNNkxBfiIm0DXQK6Pq8Bnr+dOWNFCgKzTBRecZmFI=;
 b=H0ncPwO7kQeSxAFrKUsVT6kfw25EIoiGJl9l1Wyr9qxT0tFQidE4baB/NRMICe0CWO
 /vcaS+oSDLy+U1qJFAPRJ52kLOWkHEIzNsOTWQQlNm5Um1VcwDKcVb15YqRJBzEqYFVz
 vRhyd0T1EXSWK7UAd5TM0lPFwG1bmdj4F1QVK5Bqszmu5mifh8bOP4UsR58lyz1WBkOK
 ryRiOhAgFKa7O6v6AJp1zaAfMfM50YMyn38o5bjyB7zMMkTYFmW2txFq7Pov2oCvUvxx
 aHWCzUqopYSTFhs5oeVo9Xwu8JLHT8mbcE5PPpK07ebtOm+hn+FXXg8ic/PEuA4KoV0S
 caLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yikNNkxBfiIm0DXQK6Pq8Bnr+dOWNFCgKzTBRecZmFI=;
 b=mHFfecpD5MARYL/tkMB1Iml8+Sh/g/fyJxOQY0lcPBG/tmaO1kFGHqZz66gls6eF6T
 s6oKlq9Tegm5YXe8tJ0hmXYZ12VwhNwldJTI/whVBdBZL3/QllSsBQwGG8pfABQys7IX
 Z/gAIrcq1D4whAcjD3H7ZUwxUBqzngPWrNVGZx8C7q98dGWAEJmUssPz1bfAtIOAgFu4
 WHLu4RBLVY06Ygo1H02/ulLmFtpiwzAH2j52uHSGJvalEomTRD6R7WZ/Pi3zSZLU6SO4
 IlBGX0gClMS9XUis4O1mX9UVKMUpG6wG0Lw3hPZHS78KWnIUkK4dPkP96gzYVZ41Jd6w
 sYDA==
X-Gm-Message-State: AOAM532hgE1buw/gTjbXCzl0xRZm/tAx1wJytHKO2oVjrZztyg5GJf7s
 KMnumLjxeg3SxSBJS9DscmhL8w==
X-Google-Smtp-Source: ABdhPJy+xB/zDOHk28KTlxwPff6bJqPBn4qkf9L1Y2Rmct5DtZGiq5O+wGyJl5iz/hBeViHd9SLqwQ==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr7102274wmk.152.1636463424142; 
 Tue, 09 Nov 2021 05:10:24 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d284:de3f:b3d6:f714?
 ([2001:861:44c0:66c0:d284:de3f:b3d6:f714])
 by smtp.gmail.com with ESMTPSA id m20sm2660981wmq.11.2021.11.09.05.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 05:10:23 -0800 (PST)
Subject: Re: [PATCH v6 1/9] drm/omap: add sanity plane state check
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-2-narmstrong@baylibre.com>
 <ea3d01fd-b723-b245-90cc-c5874f95122c@ideasonboard.com>
 <d4985027-e448-4220-a558-f1063dc9691f@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e9892eb7-33d6-bb27-b2a0-736e2c326388@baylibre.com>
Date: Tue, 9 Nov 2021 14:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d4985027-e448-4220-a558-f1063dc9691f@ideasonboard.com>
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
Cc: khilman@baylibre.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/10/2021 10:30, Tomi Valkeinen wrote:
> On 27/10/2021 11:29, Tomi Valkeinen wrote:
>> On 18/10/2021 17:28, Neil Armstrong wrote:
>>> Call drm_atomic_helper_check_plane_state() from the plane
>>> atomic_check() callback in order to add plane state sanity
>>> checking.
>>>
>>> It will permit filtering out totally bad scaling factors, even
>>> if the real check are done later in the atomic commit.
>>
>> I think there's more to it: the function sets plane_state->visible, which is used in later patches.
> 
> Maybe that could be mentioned in a comment. But otherwise:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks, I'll update the comment to mention this.

Neil

> 
>  Tomi

