Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D515542539A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 15:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BE76F46E;
	Thu,  7 Oct 2021 13:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9F76F46D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633611713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARhL598TB2m+TX0EI9Ao+MzjmMSRgdGPOREMZbTcPE8=;
 b=V1Bfe73c63OD/ZnrPvxPqbcuvM7324/xYj9Q/81/p4lEcwuXxUqyl5Ab6V29mIYcBOvEYb
 gKWLMT/9fNGSnYeDJl6waf9UwpyYiKD9F54KN+LWHDy5pPsyw0O98eQL5Huktjio9hpTHN
 9d9zl7kjqbBDIQsufkMouEQ9Xho7KcE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-aWC8JKPXNFGVJTEZYtQ7Xw-1; Thu, 07 Oct 2021 09:01:50 -0400
X-MC-Unique: aWC8JKPXNFGVJTEZYtQ7Xw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so4624408wrt.23
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ARhL598TB2m+TX0EI9Ao+MzjmMSRgdGPOREMZbTcPE8=;
 b=INO/iTW4BuJkwJrB9Q7CtZtnVaNO2Cd0R3yZqnQWffSoQIDMNeRiZPkoyeOTT4xN/a
 7gB/861U757LXYjkl/9+dNExfQ6VN6g2V9IhWstWAEVKHo2MmW6qY1+imw6JNJM7PZ5P
 pkArovlzkzCqZ2KrG4fIaFot3aKZWPrz1Q5IhMVmjhV1nqUdrHd/GgGO0MaV1Arz5wJM
 Mx28nT95DYYjthD2Q2H0jkrTBSYRykw997E/WbonU4QSCcTY6kufWggK3n8HIJbwWOrl
 Nkgh8CaDusMRyuwkpyFS9mh/GxT6dPms8YcB4auhNEokFYbjIc4MTG5ESWHQM8CUyriX
 g7LA==
X-Gm-Message-State: AOAM530oJ84bWOxmILwnZPiYFc8ba7I9BRp+RfWBwnBzbQ+n4helXZEL
 IXqv0DzHx6Zoy7ryNWW1ww2U70CPmqFsSrp5SLW1pHYdckpQwKNNzJJ1R9wpQ15kt0MlwnV81V1
 RG7xBol2wRYt3fzS2KZYoxNWTbJwY
X-Received: by 2002:a1c:790e:: with SMTP id l14mr3229286wme.99.1633611708499; 
 Thu, 07 Oct 2021 06:01:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXlRBY7taxAQbZGMBqlAHc6poQUcD9zUp0wzsvJ0bJpC6/k22124IC5QYnqoHbzRteaQG46w==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr3229256wme.99.1633611708288; 
 Thu, 07 Oct 2021 06:01:48 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m4sm9193730wml.28.2021.10.07.06.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:01:47 -0700 (PDT)
Message-ID: <4d93315b-d370-c178-7c68-3dce1c95b42f@redhat.com>
Date: Thu, 7 Oct 2021 15:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Intel-gfx] [bisected] suspend broken by DRM fbdev name change on
 i915 IVB
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Johannes Stezenbach <js@sig21.net>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <YV6hBl5ybMxm5Dln@sig21.net> <YV7qVorGtO5NHKkC@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YV7qVorGtO5NHKkC@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 10/7/21 14:38, Ville Syrjälä wrote:

[snip]

>>
>> So the ABI change in /proc/fb causes the pm-utils scripts to
>> skip the --quirk-no-chvt and apply other quirks,
>> /var/log/pm-suspend.log says:
> 
> Nasty. This pm-utils quirk stuff really has no business existing IMO,
> and so I recommend nuking pm-utils from your system as soon as possible.
> Back when I still had it on my machines (due to some silly dependency
> I think), I just created empty override files in /etc/pm/ to permanently
> disable all the quirks.
> 
> But as long people might be using it I guess we need some kind of
> revert/fix to put the "drmfb" back into the name. Javier?
> 

Yes, the change was just cosmetic because we had confusing names such as
"simpledrmdrmfb". When it was proposed, the agreement was that /proc/fb
shouldn't be considered an ABI but now we found that people are using it.

So I agree that would be better to revert this patch. Johannes, will you
post a revert or do you want me to do it ?

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

