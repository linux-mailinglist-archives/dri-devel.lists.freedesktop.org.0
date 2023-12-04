Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E748803546
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB60D10E1B0;
	Mon,  4 Dec 2023 13:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A012810E1B0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:45:33 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-286838371faso349090a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nelint-com.20230601.gappssmtp.com; s=20230601; t=1701697520; x=1702302320;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0HlUwovwRTKmcRALEPQNkpQqS/ZuN547tTKPjTV83fg=;
 b=KSonWKSOHjCeEqCnKKRVbZTilFISlRehWLGtQkq1moG16Ysjusd55he2OlZY3hI5Kk
 eYmxZxLY8316Tbscpj2sDQrC+asEVUKgIzLuOO/PE0yGWcnFmJOyBq3XpIZ5keuIHoSb
 UkdO+jyFy74R9jE2QbWcql/SnOlsly6aKY3eG6ws9+tfxkUClCPSl2jQQYe/VPofw5xF
 qAmhLCZ876n9OCXzZbG1OhXlwqz7m1VI8Ng4zfIXOewLmd66GOL9tx4cctaEYtNejWiZ
 LOgtD1gpQpf752irU/VZTRlcAJ31Bv9cFTvaw57daIuJlCqk5PpPP8dRT4FZboMAOKmY
 c2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701697520; x=1702302320;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0HlUwovwRTKmcRALEPQNkpQqS/ZuN547tTKPjTV83fg=;
 b=L3BTRMYptuI750kJABm77Q35RnS8IPbQDuQjfjSvwzpVYFIlZ48frsBvYZ83kCvSLa
 nJ+J03yA8JeJhVt1uEePTEkACrV5dS6JuEXiIai2B8WH/3oHfZHVP2LOSMEpXwnxFkg7
 J2g3Pzp4/7v4u1qWVz+HqQrEG7Y3Zi2NsL+5LlNMCEQB7iy+A3YnhXS5OjYSTP73meKb
 NU5Z8E7EWjOW/FYZtdVMAGfoZ3voxufspa8hcVmHw/5yE9LrAJpjiLq2fJAxK0Gfxuym
 Duj9/waFsfm32kpIp0Xt+qQyYDAYOzu/y6/MapVkCv4yU3tfKtazYKtQxI2MDCshk2MO
 iqrg==
X-Gm-Message-State: AOJu0Yz3oaTcW8/Y+CuQpI8KBjZr/xWT822A6bfyz3m9WL9Qv4LWUVcm
 6jx+x12lIkIEkQ7/wdiu+bYhHStq9GtK85QmKsc=
X-Google-Smtp-Source: AGHT+IGuLWBWSo2LPH6inO+xQuIMleuXnf1VZ+zJq0DP6t57XzK04IXXZRiMMIx2zni0Pp9JIg0jMQ==
X-Received: by 2002:a17:90b:1985:b0:286:4815:f727 with SMTP id
 mv5-20020a17090b198500b002864815f727mr11322503pjb.3.1701697520023; 
 Mon, 04 Dec 2023 05:45:20 -0800 (PST)
Received: from ?IPV6:2600:8800:1715:bc00:1360:20c9:3153:a178?
 ([2600:8800:1715:bc00:1360:20c9:3153:a178])
 by smtp.gmail.com with ESMTPSA id
 nk3-20020a17090b194300b00286a53e70c6sm2197081pjb.43.2023.12.04.05.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 05:45:19 -0800 (PST)
Message-ID: <1e756f21-10dd-401e-b327-7d629cceff2f@nelint.com>
Date: Mon, 4 Dec 2023 06:45:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fbcon on one of multiple displays
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <96343bd1-2c61-47da-965f-26bc385ad268@nelint.com>
 <8734wixonl.fsf@minerva.mail-host-address-is-not-set>
From: Eric Nelson <eric@nelint.com>
In-Reply-To: <8734wixonl.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Javier,

On 12/4/23 03:11, Javier Martinez Canillas wrote:
> Eric Nelson <eric@nelint.com> writes:
> 
> Hello Eric,
> 
>> Hi all,
>>
>> Is there a way to configure a framebuffer console on a specific display
>> on a machine with multiple displays?
>>
> 
> Have you looked at https://www.kernel.org/doc/Documentation/fb/fbcon.txt ?
> 
> There is a sysfb interface to bind / unbind fbdev devices to fbcon's VT
> (/sys/class/vtconsole/vtcon1/bind) and also kernel command line parameter
> to choose which fbdev driver is mapped to which VT console (fbcon=map:n).
> 

I have seen this, but it's not clear how we can use this. In our case, 
we have a single driver for two displays.

I hope to get a device on my desk this week to test it out.
