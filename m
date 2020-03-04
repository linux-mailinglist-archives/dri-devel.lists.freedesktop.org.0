Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270917A0E2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15A56EB46;
	Thu,  5 Mar 2020 08:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FDB6E051
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 13:17:49 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id r6so1265251qtt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 05:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b54xELoCHyNU6eb/NGXOcFtCdij4K7BK521IqDmErpM=;
 b=GIjvlaQjT+9kuOLbexyGjorOzhqZzxNFtnlrYHBQQJnbavzHcWFWQQxYNnpMOhecZR
 uwSYDfxgnKS77jvHQi/BZ1cT4PSR/LY9pcu555lHfbxN5ScVPwtR40SokIcYUhYWYXNK
 odEkUkp9eJFlZcOwrS5ZZ+v/Whj0P9nh7VGRoVYn6Op7bhXrU2o6TclVRWVALQeXMNOr
 /La2G+R7DERcDHxwfcRiRL9Gs5l3ignOxPvZ17mj5XLwV2FrWCIfyBr+NhEp3bDJgOLx
 /LkEcqYZqrQiGQL0h45upMplhmDQYqM4aaxKdiDNJbLhnn0vR2yb+J9B3NMll4cTEcdy
 z/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b54xELoCHyNU6eb/NGXOcFtCdij4K7BK521IqDmErpM=;
 b=GjZy0FGJNN8uFReDqUgxWOJbujMMmN95opMOV/P6JIgJ/0aPiyOr7Tbhnm5vDrYZwh
 O+Yhom0K6HjUY6ntJ8iZRttK4MM7GmlipR6P1YIdIrL0Xer3PO6NX2wZnN48yzQ7H4C7
 Tq5GRxFDT6VZUn3qrtzBCH2qIzyy6zAkL/R1MQ8G9R5edqzVT4Z1xVmn6Anr/NANPiCs
 XYCkoI9iH/58vsb6HIhFhQF4uMGLbaOBgthpflgTFkI8wCcVWllwaJUqs3vKpXaPbTj2
 J+xbmOvIcvIGD/yxfKyfgIUbeXq3zhAzRtKJfO/2kfBFIZBM8x5ejRdrpBjydr0I29X6
 SxIg==
X-Gm-Message-State: ANhLgQ1s/ovJnyDc6MDEjK6lz9AMhHSuYJTJN4yRh3RPvkLzEq+zOCwb
 guJGRb6pOiTAueZpL4zOyizv4g==
X-Google-Smtp-Source: ADFU+vuUuZq0UW5AS53nq4QlHNFLLnrfqoVHJibGcqeKPfeL7YHqt8FZ/OLw2/lUICTa9W/DVxxTHQ==
X-Received: by 2002:ac8:5510:: with SMTP id j16mr2336864qtq.262.1583327868275; 
 Wed, 04 Mar 2020 05:17:48 -0800 (PST)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id p14sm14603109qtk.50.2020.03.04.05.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 05:17:47 -0800 (PST)
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
To: Linus Walleij <linus.walleij@linaro.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
 <CACRpkdapumGw5Fp+YaiWkB8uh6me9s2s-Bx_-RqmoqBADJFvEg@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <c86a5447-999b-9814-0cb3-9c4f65abbf25@marek.ca>
Date: Wed, 4 Mar 2020 08:16:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdapumGw5Fp+YaiWkB8uh6me9s2s-Bx_-RqmoqBADJFvEg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm DSI driver does predate the addition of those fields and doesn't 
use them at all.

Seems like it would be a bit of a hack too, since the frequency we want 
to use is not the "real limits of the hardware"..

On 3/4/20 4:10 AM, Linus Walleij wrote:
> On Mon, Mar 2, 2020 at 9:49 PM Jonathan Marek <jonathan@marek.ca> wrote:
> 
>> This is a command mode panel and the the msm/mdp5 driver uses the
>> vrefresh field for the actual refresh rate, while the dotclock field is
>> used for the DSI clocks. The dotclock needed to be a bit higher than
>> necessary otherwise the panel would not work.
> 
> I don't know if this predates the support for defining DSI clocks
> but for what we have in the kernel right now this is wrong.
> 
> struct mipi_dsi_device contains:
> 
>   * @hs_rate: maximum lane frequency for high speed mode in hertz, this should
>   * be set to the real limits of the hardware, zero is only accepted for
>   * legacy drivers
>   * @lp_rate: maximum lane frequency for low power mode in hertz, this should
>   * be set to the real limits of the hardware, zero is only accepted for
>   * legacy drivers
> 
> The MDP driver should use these frequencies for a DSI command
> mode panel, and the panel driver should define them.
> 
> These two clocks are/can be/should be completely orthogonal to
> the dotclock/pixelclock inside the panel, which is likely driven from
> its own crystal directly from the panel-internal framebuffer.
> 
> Yours,
> Linus Walleij
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
