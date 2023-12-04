Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A5803919
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 16:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9482E10E354;
	Mon,  4 Dec 2023 15:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239D310E369
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 15:45:13 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2866b15b013so282317a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 07:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nelint-com.20230601.gappssmtp.com; s=20230601; t=1701704713; x=1702309513;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pAA3dbB2Q293fTvKRTP6SR/ROA+KQlKlDu4J8BQ8Tpc=;
 b=r4IrQiDhhtyxGaWSwr5MjxT7mMDDcd6Lt70R1x/bdzVJOKVSJlcdiVuQksY9IKai3L
 eh4bNV69tNCNbPrJ/sHzI83C1JeA/30be6uTVc/gSncmi8XR/R+MhG5+E35XvFGXF651
 aqQnitbZMKFV63t/oDWyiBYTK0uQuFXqNJf8oCn6jxafl8wvcnn1EWtQ+KU8OvKe6aGZ
 F9GEiaFK+6wwv7rFyso5vJf2gnvw2UCozeSuh/Pn4Aeg3Vi77OriQ66md+DIc1Dsf0lc
 Zx+HYCvQ1cgd3jv8v7WvcooySmBTZK0YjdKf9CbYcBFOQ0WePSkUj/ZHYTAHpUhmvPIB
 ty5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701704713; x=1702309513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pAA3dbB2Q293fTvKRTP6SR/ROA+KQlKlDu4J8BQ8Tpc=;
 b=DFTybmiPkzkC8TidSyqmUSFaOjwdfAponaZJX2ry71JSCZgnrCkX9qDPDmaDdT3KAz
 M5hcMX2K62kAd+gNLR9gbfl0iP7cQlHFcpbokUDtlY8eqiqaY/+NpSrW2vESjSG+6oBf
 j2rUFsrRXg5HldI6dnSeCtOYaV+t66kGBvn3GLdusxkoHz98WdcqOwyDOejb6x/1ODAo
 wb0KpP+SCTFsXTj5TLWSNIj4znCI6qMpHrncPW6fC9EQZUGiDxmQuB4BGkEt15gYlJOe
 sjtYVALBnJqOHajMdTuhyxtuC99XzRciSefRN7N3dE9aSRD9BlOoJ3bvKoS6DNdA9hcs
 xatQ==
X-Gm-Message-State: AOJu0YyWSTlMrLaEUgKJ+4b4T08WPpM3XiKshCRwRF69c9L7MMceKh/3
 KL289MhiduPWRpZ3PCS02QTva5Me6RCCDrfgBnA=
X-Google-Smtp-Source: AGHT+IFNMThsklYQfT+MTUVkpGAL4fJN+5iwmB8sCJTfimJZvJICW4ngsNIZx3AGa5YaQWXwrf+veQ==
X-Received: by 2002:a17:90b:23d1:b0:286:9caa:610a with SMTP id
 md17-20020a17090b23d100b002869caa610amr3933990pjb.2.1701704712584; 
 Mon, 04 Dec 2023 07:45:12 -0800 (PST)
Received: from ?IPV6:2600:8800:1715:bc00:1360:20c9:3153:a178?
 ([2600:8800:1715:bc00:1360:20c9:3153:a178])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a17090b078c00b00285545ac9d2sm7934128pjz.47.2023.12.04.07.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 07:45:11 -0800 (PST)
Message-ID: <6ad20834-cc8a-4336-a129-011e1db085e8@nelint.com>
Date: Mon, 4 Dec 2023 08:45:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fbcon on one of multiple displays
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <96343bd1-2c61-47da-965f-26bc385ad268@nelint.com>
 <8734wixonl.fsf@minerva.mail-host-address-is-not-set>
 <1e756f21-10dd-401e-b327-7d629cceff2f@nelint.com>
 <CADnq5_MKof2n5_Le4dH+5UAGi77p4UmWk6HSG-p=QMdpxKw80g@mail.gmail.com>
From: Eric Nelson <eric@nelint.com>
In-Reply-To: <CADnq5_MKof2n5_Le4dH+5UAGi77p4UmWk6HSG-p=QMdpxKw80g@mail.gmail.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 12/4/23 07:40, Alex Deucher wrote:
> On Mon, Dec 4, 2023 at 8:52 AM Eric Nelson <eric@nelint.com> wrote:
>>
>> Thanks Javier,
>>
>> On 12/4/23 03:11, Javier Martinez Canillas wrote:
>>> Eric Nelson <eric@nelint.com> writes:
>>>
>>> Hello Eric,
>>>
>>>> Hi all,
>>>>
>>>> Is there a way to configure a framebuffer console on a specific display
>>>> on a machine with multiple displays?
>>>>
>>>
>>> Have you looked at https://www.kernel.org/doc/Documentation/fb/fbcon.txt ?
>>>
>>> There is a sysfb interface to bind / unbind fbdev devices to fbcon's VT
>>> (/sys/class/vtconsole/vtcon1/bind) and also kernel command line parameter
>>> to choose which fbdev driver is mapped to which VT console (fbcon=map:n).
>>>
>>
>> I have seen this, but it's not clear how we can use this. In our case,
>> we have a single driver for two displays.
>>
>> I hope to get a device on my desk this week to test it out.
> 
> Are you referring to two devices that just both happen to use the same
> driver, or multiple displays driving by a single device?  For the
> latter, drm drivers at least only expose a single "display" via the
> fbcon emulation.
> 
> Alex

A little of both.

There are multiple displays through a single driver, but the fbcon 
emulation is only creating a single framebuffer device.

What we're aiming for is pretty simple. We just want to get a splash 
screen (fb logo) to display on one of them and haven't found the right path.
