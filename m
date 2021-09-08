Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350584035AE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 09:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530896E153;
	Wed,  8 Sep 2021 07:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59096E153
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631087355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBWF7Bq/L/Ej1/9V4d7HClJnA65F+vUsYrTX8BsBqO8=;
 b=PfNaYNRIiP8vih1PAT3mbkPSv9Fi70j1ENmvniVmFOfcAkf6qI//h75llBhBVtGi38/ePH
 Bc0X0SW3ERbyjI27WAT8agkqyeZRqR307oeRN/qxghPn7MwQOAsmnh6GC5TNNjPASVztio
 1o/pfPudBypFmDv1D2LthdfGojVgQZU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-sOaavTiBOHeUnA7bRCyLWA-1; Wed, 08 Sep 2021 03:49:15 -0400
X-MC-Unique: sOaavTiBOHeUnA7bRCyLWA-1
Received: by mail-ej1-f69.google.com with SMTP id
 x6-20020a170906710600b005c980192a39so592772ejj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 00:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fBWF7Bq/L/Ej1/9V4d7HClJnA65F+vUsYrTX8BsBqO8=;
 b=LH3IHmHbVp2QmfMaRJEZuidNEM5qneh0xfOCowIPUrnbFNOCFuiZ7n6LLZj8uZgrP5
 E0n+vUn7WI93BdmlJQKH96wuHW8LctMRktImv/0f/7MMznBrG3EIuyPSLUF6Z3TOeX8w
 vODNMYaQsd6hJZ/qEFbGVibI2bze0ZIV1KrjosvRcNor8B7nJdQwidoKFU1KKOQ5B34M
 +6sBjIi0Zr1fAYn+WvGnObTT8fCNqsGWRBH0EJ4fIa4Vq8n6cy1SLkq8AWK9m/M2b7qj
 PQ4qOXzz7+eNGCiTih3zb+fTspLmr8l+MRnOTKhDGlzJsIyxxpd+yuoGOQIS8kWL68ig
 Tu5Q==
X-Gm-Message-State: AOAM5307XTBY9W734sHUXiHzKFWz4fFbQXpzcxodeyes4eGt+ICcAcB2
 zUvTpCKRCmSh3lsHHVYQhBJ73GlV/775wNf05kwNDMtrG3dM47mn0XRdCxK9wiU9jH9vV7c2gSx
 qCyBV0NeBTFWw0dStAFLvGD0ua88GmBYwTqRNRH19Lw3QXjilTV3L/VxoCs5fmZkMYCsKFhqFvy
 BpzEtg
X-Received: by 2002:a50:954c:: with SMTP id v12mr2463171eda.313.1631087353352; 
 Wed, 08 Sep 2021 00:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq+wOdUDhFSnr4KwMefL5TenykRzI8E3ZHenk9x1IYTvJWQ3brZ6OeaFXY/61UQrlbIBUGzw==
X-Received: by 2002:a50:954c:: with SMTP id v12mr2463146eda.313.1631087353029; 
 Wed, 08 Sep 2021 00:49:13 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id v13sm563209ejx.72.2021.09.08.00.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 00:49:12 -0700 (PDT)
Subject: Re: Handling DRM master transitions cooperatively
To: Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Dennis Filder <d.filder@web.de>, dri-devel@lists.freedesktop.org
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7d4b4fd7-d8b3-99bd-42c4-c91bb05798bf@redhat.com>
Date: Wed, 8 Sep 2021 09:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908103603.44a533bb@eldfell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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

Hi,

On 9/8/21 9:36 AM, Pekka Paalanen wrote:
> On Tue, 7 Sep 2021 14:42:56 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi,
>>
>> On 9/7/21 12:07 PM, Pekka Paalanen wrote:
>>> On Fri, 3 Sep 2021 21:08:21 +0200
>>> Dennis Filder <d.filder@web.de> wrote:
>>>   
>>>> Hans de Goede asked me to take a topic from a private discussion here.
>>>> I must also preface that I'm not a graphics person and my knowledge of
>>>> DRI/DRM is cursory at best.
>>>>
>>>> I initiated the conversation with de Goede after learning that the X
>>>> server now supports being started with an open DRM file descriptor
>>>> (this was added for Keith Packard's xlease project).  I wondered if
>>>> that could be used to smoothen the Plymouth->X transition somehow and
>>>> asked de Goede if there were any such plans.  He denied, but mentioned
>>>> that a new ioctl is in the works to prevent the kernel from wiping the
>>>> contents of a frame buffer after a device is closed, and that this
>>>> would help to keep transitions smooth.  
>>>
>>> Hi,
>>>
>>> I believe the kernel is not wiping anything on device close. If
>>> something in the KMS state is wiped, it originates in userspace:
>>>
>>> - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
>>>   output off, you need to be careful to "leak" your FB if you want a
>>>   smooth hand-over)  
>>
>> The "kernel is not wiping anything on device close" is not true,
>> when closing /dev/dri/card# any remaining FBs from the app closing
>> it will be dealt with as if they were RmFB-ed, causing the screen
>> to show what I call "the fallback fb", at least with the i915 driver.
> 
> No, that's not what should happen AFAIK.

I'm pretty sure that that is what is happening though.

But hopefully someone else can either confirm or deny this :)

> True, all FBs that are not referenced by active CRTCs or planes will
> get freed, since their refcount drops to zero, but those CRTCs and
> planes that are active will remain active and therefore keep their
> reference to the respective FBs and so the FBs remain until replaced or
> turned off explicitly (by e.g. fbcon if you switch to that rather than
> another userspace KMS client). I believe that is the whole reason why
> e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
> would not have anything to scrape.
> 
> danvet, what is the DRM core intention?
> 
> Or am I confused because display servers do not tend to close the DRM
> device fd on switch-out but Plymouth does (too early)?
> 
> If so, why can't Plymouth keep the device open longer and quit only
> when the hand-off is complete? Not quitting too early would be a
> prerequisite for any explicit hand-off protocol as well.

plymouth is actually keeping the device open longer for exactly this
reason, the following happens:

1. plmouth starts
2. gdm starts and tells plymouth to "deactivate" which will stop it from
making drm ioctls and drop its drm master rights, while keeping the fb around
3. gdm waits for the greeter process to tell it that it has successfully
taken over the screen
4. gdm tells plymouth to quit

And something similar is happening on gdm greeter -> gnome user session
handover.

But we need the new ioctl at least on shutdown / reboot to avoid the
"fallback fb" (typically the EFI/BIOS setup fb which i915 inherited at boot)
showing for a brief moment when plymouth quits at shutdown / reboot and
there is nothing to hand-over the fb to in that case.

And the new ioctl would also make the above handover a lot simpler.

And we currently also have a flicker when going from user-session to
gdm on logout or from gdm/user-session to plymout on shutdown/reboot.

Basically we have quite a few transitions and currently only the
boot + login path is smooth and the rest needs more work, which either
requires a standardized handover method (instead of the current
hardcoded plymouth -> gdm stuff), or just allowing the FB to sit
around until the next drm-client installs its FB, which would be
much more KISS, so that has my preference.

And this KISS method will also work with transitions to a new
console-owner process which is not aware of any handover protocols,
as long as the old process uses the ioctl the transition will be
smooth. So e.g. gdm -> i3 on Xorg session will be smooth (1)

Regards,

Hans


1) I think this actually already is smooth because in this case gdm
just sleeps for 5 seconds before killing the greeter I believe, but
with the ioctl we could remove this hack


