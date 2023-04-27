Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990846F0634
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A4610EB4B;
	Thu, 27 Apr 2023 12:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9935B10EB4B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 12:52:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so1609431066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682599962; x=1685191962;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=S7zteozI39e1f65YN+KzAHLQjEDIyO2L33ga1+sRYY4=;
 b=mCesDhSP3FewVqDSHL8uW6t62XOJs7Mm2UPiEwaNG1BQ3A+BJTogaTNooGq+Zqq8yx
 hgg738DXifPkOF9OvN2YxMQVdewpRO40p3/GCuBuzjYtQ+T0WSPShrTgw9CUs4vtqsMU
 /HANP9ecdASW/o9MRN1AfTEOJnMDLgdqwW08273ZPjgN6/xnaWxSFu03QIjBhubQlcmJ
 F5+pOy5eKt/0ZFAHMIut0AB4i8l7FPJSw7dW/HuS/TKVWM9b2DAhTMGVlhP7pmK76SC5
 wg3rJWOnWaLxuQKaYgB+MUW3cd6DWvR8/TDII532wGIJERpWPA0SPX9eGDgkLslHvLCZ
 F7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682599962; x=1685191962;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S7zteozI39e1f65YN+KzAHLQjEDIyO2L33ga1+sRYY4=;
 b=IwNXAJChw9wCdFhSGu7Z6n5yrKHcv5Qc3vKoMk/2yRBK2249U+F/DZk/SSyKhDH/xf
 0H6Fs0uvYk+mT0dSKgpkPYRw8cWrrJf9irkea6luW7lmEjD1TZmharxmU+0b8n6H2YhV
 4mYR1lUWGyZ31YLqWa9HNMISkRKbXcC66RonmxlLZwmaHu2QBKKJAFVyyyJkD+prmlOH
 GVT14M4hxnGPg8z7M6wcJDZaErwi1QcQnO4vuharWKis8D4Me9BbyqFZBWcDXmGNwI5R
 KOD05nwDsUPWq4oAqfH8cDMnDGZnJGAtAp43kl8i1ua8Tv6rneMqVblt+lEa3UAitK3v
 VBuA==
X-Gm-Message-State: AC+VfDzCVBo69snQzNT1yN088FJJcrWji6QnZ4rkGP0lyPuA4lZTlySm
 oQYuk2Q7daxSabbtfn+6v8yNdQ==
X-Google-Smtp-Source: ACHHUZ7C2fjLjPXdjFbhPrME9i5Fnu4UpIc98ohf679GmbE5etDN0uDNhkWQgrKRKJuMzV1PFyNPAA==
X-Received: by 2002:a17:906:5d0b:b0:95e:d468:c35f with SMTP id
 g11-20020a1709065d0b00b0095ed468c35fmr1494912ejt.57.1682599961882; 
 Thu, 27 Apr 2023 05:52:41 -0700 (PDT)
Received: from [172.23.2.82] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a170906941a00b0094f01aa9567sm9525405ejx.20.2023.04.27.05.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:52:41 -0700 (PDT)
Message-ID: <3d76d332-f1a4-d363-fcdd-b7f08afdd55b@linaro.org>
Date: Thu, 27 Apr 2023 14:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: set variables meson_hdmi_*
 storage-class-specifier to static
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tom Rix <trix@redhat.com>
References: <20230423145300.3937831-1-trix@redhat.com>
 <CAFBinCDQRwaTNLeHD973gD-g9aHOwnu+G+U2di7Tz17LPT2DXg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCDQRwaTNLeHD973gD-g9aHOwnu+G+U2di7Tz17LPT2DXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/04/2023 23:36, Martin Blumenstingl wrote:
> On Sun, Apr 23, 2023 at 4:53 PM Tom Rix <trix@redhat.com> wrote:
>>
>> smatch has several simailar warnings to
> s/simailar/similar/
> 
>> drivers/gpu/drm/meson/meson_venc.c:189:28: warning: symbol
>>    'meson_hdmi_enci_mode_480i' was not declared. Should it be static?
>>
>> These variables are only used in their defining file so should be static
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> With above typo fixed (or with a comment from the maintainers that
> they can fix it while applying):
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks, fixed while applying.

Neil
