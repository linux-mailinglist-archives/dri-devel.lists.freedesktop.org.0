Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8035FB1DF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D5A10E134;
	Tue, 11 Oct 2022 11:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3BD10E134
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:56:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id b2so30831557eja.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+17O6DhIX/vWRk2x7hhAAkHrzk7j2OP6V8DD2TTVYgU=;
 b=bI1ZRN/YY6O5x4wKoe2BKCm5OW2zhxbFa2efYIbEMh8bKGECX9BQZWMIrVZPw/DllM
 HXCRbPUUJt39DKHo8K1VvU99BLRi0MWmzGOA8na7LOdV904eVwwbtxiAK9oG8xEQOFi6
 hYApCO6Rkc/eANU8EvL+eG72RgTgQAtxYkzk9HSyJmfivTBZdquhlcr0/q9iqjP7VpMN
 +AmvdOL9K9stGqOvcwUrKRbfy69yLbb+ne52FpUWsoxrOHE48LyH2NDWm+XssEXyA+s2
 iWmoLg1utNMo10gS3b3oTIms5sonOi3pBquTd8XksksW2jfEu5mS2sWpNRTBzhOmaZZg
 Jwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+17O6DhIX/vWRk2x7hhAAkHrzk7j2OP6V8DD2TTVYgU=;
 b=d2mC5c8Zkx0BBelnsSMBUpPLXL2MTRtgxeQ+L4bUUMSlmyKJrPo3QjG1o0k0nZXNf/
 L5UBMlVLGhh4khKiEJr8EYkjymJvLhsUOKU7CjKp500gpoelk/nXUNAsefRGcBp4oYRi
 ohBxSmDanngd4tEsfc/D6JYyHdM4LkaCy8KWc+XOLDwcx0PVxnobXAfinkZRN+IEYsr1
 /MZ7N1DlecYBLpVdumtfB7B74jGIW4eLRMhQVNXS+7xtMy80LG9MNts7YKiQRSSJgHAb
 JVFKTwWlRtLqH3aqVyXUr3DjgU2NYZx8FImfPt5Gscc/QViLPCaLXhSpXAJGHA9/BFMT
 /hQw==
X-Gm-Message-State: ACrzQf1VTs9AoseMu75tHrkmveSm0auwcL9NwWZLSX3hNkLWwIYY8MVJ
 uYKg7SL/YBXHkxi/rz2Mt0rFz8iV8jY=
X-Google-Smtp-Source: AMsMyM7LHFJ1GqTHUG0pkUPKkcrZEw9Aik7n0+lNLXpwb6hgMR0tOSSyULD2IVozQKdcN9GWXSVngw==
X-Received: by 2002:a17:906:478d:b0:78d:ec4d:e2e0 with SMTP id
 cw13-20020a170906478d00b0078dec4de2e0mr83539ejc.34.1665489366766; 
 Tue, 11 Oct 2022 04:56:06 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eacfe.dip0.t-ipconnect.de.
 [91.14.172.254]) by smtp.gmail.com with ESMTPSA id
 xf13-20020a17090731cd00b0073d71792c8dsm6688370ejb.180.2022.10.11.04.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:56:06 -0700 (PDT)
Message-ID: <7f14fd6b-475c-0b75-4faf-b777ebc42b02@gmail.com>
Date: Tue, 11 Oct 2022 13:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Render only DRM devices
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <LDyPQX1u8PCwIfQuy1sQStoURXxBW-sM2cRZGiIJdf50YWWpG5HnlgD04FEfx88xnGtm0ZrvjF0XX4PF2qsXNYpdsUdmCswiuCO23-K2vaI=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <LDyPQX1u8PCwIfQuy1sQStoURXxBW-sM2cRZGiIJdf50YWWpG5HnlgD04FEfx88xnGtm0ZrvjF0XX4PF2qsXNYpdsUdmCswiuCO23-K2vaI=@emersion.fr>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.10.22 um 13:37 schrieb Simon Ser:
> On Tuesday, October 11th, 2022 at 13:04, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> we already have quite a bunch of devices which are essentially render
>> only and don't expose any connectors or more general display functionality.
>>
>> Just recently I ran into a case where an older X/DDX combination
>> caused problems for such a device so I looked a bit into the
>> possibility to allow drivers to disable the primary node and only
>> expose the render node.
>>
>> It turned out that this effectively hides the device from X, but
>> OpenGL and Vulkan can still use it perfectly fine.
>>
>> The only crux is that this is checked so early in the initialization
>> that drivers don't have an opportunity to update their
>> dev->driver_features. So we will always need a separate drm_driver
>> structure for render only devices.
> Typically render-only devices still expose a primary node, but don't
> expose any KMS resources on it. See drmIsKMS() in libdrm.
>
> Primary nodes could still be used by older user-space for rendering with
> legacy DRM authentication.

Yeah, and that's exactly what we try to avoid :)

Cheers,
Christian.
