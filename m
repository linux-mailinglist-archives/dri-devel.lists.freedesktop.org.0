Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984A83D65FA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051356E8E8;
	Mon, 26 Jul 2021 17:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477AD6E7FA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:52:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id x90so3001363ede.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AaM4y6RazzXQuuDdTjSTqLkohIWqL53KdsjSdPJ6ZEw=;
 b=Lw/vHgj9KqqEqMBanNNBEybP3JIerZKOywu554T1F+xh9vZ0mJ9fg3/X9DtffhykYB
 yK0r5GEiAexjzFuBkWLKZ1+TRPJOtuEROPKWVNEfmUxEruoBO6sntrYu/CYYqr0bT7mj
 e+ZUcVA1A1GAdx+vKk5Uwib3HAhwgdWXzeXLTtuGqr4aHyktEnSeB8z+c4pif2I8zr8Z
 PxLhFxsFp85u1QZWtqmFJq3Ioi998EPCLptYNcDHfVER6fLAhwLdkaalOSwngDAolD6G
 bKa8gd4k5HelKtde6ClkB4xK0PM6IltG/Cz/tOk0rFT1cJVDZd9gJPhu4GOjAK2UWzrO
 x6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AaM4y6RazzXQuuDdTjSTqLkohIWqL53KdsjSdPJ6ZEw=;
 b=o2ZX0+5b0xOxCUiAJ6EPnuZpSPUAKXt0a89hEm+YQYgQYXQKuF+xTH5P1Xh+PcxxJ4
 +7lLCJdi0a42RzorLOlB+O8RcR+6d7gojM99BH/geGKvbfU6XmE1qgM+GjP+IO1ETbeF
 PtN2lAs6/mIIKSFZIV+aYzNkvrklRb1iJwXnEQQcrUB3VAnlaNpjHpmzH55bKrEYAxEZ
 KzND6ww6iBL0goTBN+OypbLI/Iq+yLb+Ts3wxkNNkLwYtNz9DJM1mmiMf6M1XjvMHljo
 Dz+LSIp6SOMt2SQ+z5u7xwPqmE++ueNpMtLdE1td3sPsTZpNUXs5LMf+peqf2LqSV9o8
 chqg==
X-Gm-Message-State: AOAM532E/tadb5wY8Vc987dMcf4dfZuf2W1pmS+LOPaPdZCEtsvZ5FdG
 MVn0OLwJrUo6jCILShYEM8I=
X-Google-Smtp-Source: ABdhPJyUguAOT5xjjXwhLROhPMHfGYnOQD7SmS2eI9s9NajEmanndl6z0ouP7oTXtWSNBHoGExXmkw==
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr20244649edc.116.1627285944910; 
 Mon, 26 Jul 2021 00:52:24 -0700 (PDT)
Received: from [192.168.74.110] (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id f5sm13826511ejj.45.2021.07.26.00.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 00:52:24 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/panel: Add panel for Samsung Galaxy S5
To: Linus Walleij <linus.walleij@linaro.org>
References: <20210201165307.51443-1-iskren.chernev@gmail.com>
 <20210201165307.51443-2-iskren.chernev@gmail.com>
 <CACRpkdai5+vDj0C053qfPkdM-FCC-74HDCVF4=SPtUb7LE=Srw@mail.gmail.com>
From: Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <9e5d9c5b-8276-6e75-45e5-2296afa90c02@gmail.com>
Date: Mon, 26 Jul 2021 10:52:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdai5+vDj0C053qfPkdM-FCC-74HDCVF4=SPtUb7LE=Srw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 26 Jul 2021 17:47:34 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/26/21 10:34 AM, Linus Walleij wrote:
> Hi Iskren,
> 
> thanks for your patch!

Thanks a lot for reviewing this. Alexey wrote a new version of the patch [1]
that was recently reviewed by Sam, and it also includes support for brightness
and another panel found on the S5. My patch is pretty much untouched out of the
panel driver generator, so we can definitely improve the generated code based
on your comments.

[1] https://lists.freedesktop.org/archives/dri-devel/2021-July/316804.html

I guess Alexey will submit a new version with the two panels split, and he
might incorporate your suggestions (as his code comes from the generator as
well).

Regards,
Iskren
