Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352E4630B8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 11:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDDD6E491;
	Tue, 30 Nov 2021 10:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8309A6E491;
 Tue, 30 Nov 2021 10:09:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v11so43155214wrw.10;
 Tue, 30 Nov 2021 02:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ITFiSZ4BhHXas+EIceF8qBLSIBLMhZ12PvMJFVnP/ww=;
 b=KLr6GPITzampDZ2eyFMi9XdSsDnajFFBytWZy0ui8xT0NoTLgbUJivOUMAmAZPR7iO
 AIkvyq/ESA9VST6LFH4y1D+n1CTRcQfaFOAv4Px15Fi/G7gukdFUkcZIw0mK8KKQcRDP
 jTik919e4bNu6NVnxEve8ShUvJu1iNvFIHob2g5UXKC2noNysswHgUiR5MabL6jgprdq
 gPxDHcL7ADbL5u4t96h4AThskdjLvJxrEI/c+rKh9pzpEJRhwUf96aA0LGpoRjSvV6I7
 BXgfnQHwX4LtdzTSw400nlO4XmHMIXySBTRu5qMDGWi613BnMPdE+iB3nCFu+/hSkuNL
 df+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ITFiSZ4BhHXas+EIceF8qBLSIBLMhZ12PvMJFVnP/ww=;
 b=72E1EnC1a0smRqXLr1UwmXaWkVglw5VHkmiHpklXz4kjFihNJ/WnObQ5chtUyN79d7
 +elJ1k3/UXmE9JXoE818AWnEQdVhLCu5M9R3iRWdrk0+L8TIyTemOfRb/7h/EPASlOkg
 T2VmLj2CBXITae0Tr/4bizfpwIfLrTvYtc/sA6uCk8S5OKLNjoCIU1CZLEWTaNDm7QQ5
 zbjFoGKCEkf/yD3SEHcwo5Vnra2JGg3UxyhgxQfHf6CheSO5oDEpN2nVxa2gS6j0jzF1
 sSfXl4fLhKdPaAskAEkt9Of+U8FIdgj0ltM0hYyWXNWP7teeBsakscigNHZelZ6jG4qc
 1rDA==
X-Gm-Message-State: AOAM531w1sGDH3ZCGv/9NzbbqEGjyrKLQbGRWPobtG05s3gIWUfxOGbT
 bPiUDnVPzLoEuE27ChfoK8w=
X-Google-Smtp-Source: ABdhPJygGh6sjZwL1L17sv4OcCYTg7SUS3HjCnmZZceWcGMOiPpsmozq601UeIAVTQfaulnIhiclqg==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr39826713wrs.537.1638266985159; 
 Tue, 30 Nov 2021 02:09:45 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3?
 ([2a02:908:1252:fb60:fa20:e17b:e063:b6d3])
 by smtp.gmail.com with ESMTPSA id n32sm2310101wms.1.2021.11.30.02.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 02:09:44 -0800 (PST)
Subject: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
To: ydirson@free.fr, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bc6eb6c0-92f8-2bf9-c735-a8d8c7a427bd@gmail.com>
Date: Tue, 30 Nov 2021 11:09:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mark Yacoub <markyacoub@chromium.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Roman Li <roman.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Roman Gilg <subdiff@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 nicholas choi <nicholas.choi@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 29.11.21 um 21:48 schrieb ydirson@free.fr:
> Hi Rodrigo,
>
> That will really be helpful!
>
> I know drawing the line is a difficult problem (and can even make things
> harder when searching), but maybe it would make sense to keep generic
> acronyms not specific to amdgpu in a separate list.  I bet a number of
> them would be useful in the scope of other drm drivers (e.g. CRTC, DCC,
> MST), and some are not restricted to the drm subsystem at all (e.g. FEC,
> LUT), but still have value as not necessarily easy to look up.
>
> Maybe "DC glossary" should just be "Glossary", since quite some entries
> help to read adm/amdgpu/ too.  Which brings me to the result of my recent
> searches as suggested entries:
>
>   KIQ (Kernel Interface Queue), MQD (memory queue descriptor), HQD (hardware
>   queue descriptor), EOP (still no clue :)

End Of Pipe/Pipeline :)

This means that calculations are done, all caches are flushed and all 
memory is coherent again.

Usually related to an interrupt send or fence value written.

Christian.

>
> Maybe some more specific ones just to be spelled out in clear where they
> are used ?  KCQ (compute queue?), KGQ (gfx queue?)
>
> More suggestions inlined.
>
> Best regards,

