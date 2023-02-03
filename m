Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0206890DD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 08:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C060A10E0BD;
	Fri,  3 Feb 2023 07:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87C110E0BD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 07:29:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id q8so3158521wmo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 23:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XPCAamLDW14ZRUba5aApMHxDyPGWoL0BG7d7nfVVdVI=;
 b=nibuXOj4XhsASSAT6iW7FumPVbV6S78B3v4QBVcq2CVqh2t5ra/J5D+BbE5wWvFkbD
 BCfVeNDXek9dO3Avey5gmi/cANE7IOTeV4yiz8x9Fv8DoVJT4dZzsLC207GZby6adlwJ
 R2/ADMZAGyRGGXX3lkOwn00+Wvc1+qqYSn6KgnA7C+IfEmFO8bTMS+G24QkVaC/e5990
 gWGMLTBxK6ItS74LbAGsRdIvXf5y98YVZ8l9fhg3j3C9SP3aALyRJeJB8EuteBNkD/+k
 rPSJraslpD/0Yl8VyerdmnfU2E+Ka8O0joKGSIg9mS/JWjTsgyP5U6rLiQux5Fps3cIR
 APLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPCAamLDW14ZRUba5aApMHxDyPGWoL0BG7d7nfVVdVI=;
 b=nz0vt/0+f+TjTK2q61Un7hIyD4lBcMV0dRZrE6t0GI2Da0nH3DsXcMEKSSdSBcYwnX
 uC5wc6VSj4sZNeVBaTlIfYCAtMMEwUfXUl0KREqNT+79HAOVH9pDNfZzRoZQJWoNxpK4
 LFpxaghXTOYWGj8e6Bhfr6bZdihwjgTEE2wpf3pmXvej5PZQCXjgZH3KqV4egtKMkUGv
 bskJxrjttlTn2ya26rstOTvGhXIktPIJw3XBIMm0oKLQ836TQ30XMtzhJrR4Zgj1IRt8
 grM1Ts0+lecgumCdXrgKSo7tB5MBWVeNS2AQnYLn15VswCp/QgMEiQJv514OTMPkOp0A
 O/Dg==
X-Gm-Message-State: AO0yUKVcL/61sP1NfdGM0BxEqAufrhBAAfo1C5oTVFm1+2tOTSwwjmXm
 NKQ/D15vnh41rQEJbW49sT0=
X-Google-Smtp-Source: AK7set9+6X74jJU5dqFQiTDNGdAJCRuzikYVWJWZv+rzJ/GLhz3i5aVaUM2cM1+615NfXK+JUmVonQ==
X-Received: by 2002:a05:600c:1d05:b0:3dc:58db:7c2 with SMTP id
 l5-20020a05600c1d0500b003dc58db07c2mr9397412wms.8.1675409384042; 
 Thu, 02 Feb 2023 23:29:44 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a5d6d8a000000b002bfb5bda59asm1356600wrs.25.2023.02.02.23.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:29:43 -0800 (PST)
Message-ID: <fe8743be-4a37-84cd-747f-e33901a23eb3@gmail.com>
Date: Fri, 3 Feb 2023 08:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org>
 <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
 <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
 <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
 <CAHC42Rff5Xj_5bJNVozAYnG+ujjZ+R1DjDfWZn4GvsyQV+do_Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAHC42Rff5Xj_5bJNVozAYnG+ujjZ+R1DjDfWZn4GvsyQV+do_Q@mail.gmail.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02/02/2023 21:41, Justin Green wrote:
>> Yes, I had a comment on the naming in that patch. Never the less, I think if we
>> don't need to "overwrite" the value, we should use just one struct for the
>> values instead of copying them to the different .c files and give them SoC
>> specific names.
> I don't have a very strong opinion about this, and in fact that is how
> v1 of the patch worked, but Chun-Kuang specifically suggested moving
> that struct into the .c files a few versions back. I think it makes
> sense if we expect additional skew between the different components
> and what pixel formats they support.

Ok, if Chun-Kuang asked to do it this way, then I won't object. In the end he is 
the maintainer of the driver.

Regards,
Matthias
