Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CF2883C1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FF16EC6B;
	Fri,  9 Oct 2020 07:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760B96EC6A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:38:43 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id b26so6148682pff.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vfN7S83tf1CPH9vIQuREBvcpiIqcuqeLdaONElX5HII=;
 b=p9MGQ1o0NTrtTVnD7fs6sEh33IvnPvr1DW5qln2UHc1ENM81Bo4qUoX7QUDKrpJO56
 31j9I6APhLnrYNPebZSXqk+o6ZbUrLSlcPQwO3wd9MSeu2zYwGw12slzGG9VrhBPZ87o
 fWCA6RgUmXpH0pAgJhaf3X8FH5WuP6/owDZZAytmdMRQKi1eGtbn4WMzvFaBQGxmlKVC
 O/u3qpHwRMOIU0vVrVKaThJqOY5D5+S+HEbvKNrF5A/72dRGGcPyW7x9+GVwKy0Y4lOt
 /E6fsBHNw7kq/uJATJKm9T9PCoZC32+uoZ3odI+7AzukBrMg52SMZymJoamTVffuWzCR
 eZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vfN7S83tf1CPH9vIQuREBvcpiIqcuqeLdaONElX5HII=;
 b=RjEDFRMNX2zSuseflwKURS2cIXe4r6JDwfQPZXYkYAvvEyJCrKoSQ9SUPbPA2xyzN/
 1Kv8CwqckY8QHPjNFqQ0EObe/ahRjCiaUeeAgnwx+ji4HaD+iZcXxNcB+wyzyuWuPtiP
 +EYwoZox8hwccL4a0f3KUJqyzszNOZVcyOn1FdfwzdLvSCk6amPx/d5ycZ/NUvDzZM23
 jLEIelC/0Dm5iGFQYQ2cvpugDUFE+a8d03qLki642C/BCj4rdEp1g+CKVEqP6KM5GPpv
 UKZYMf/6dcJXl2761ATdop1DNmKD4wLr9PAHPNroT90xp47yV9nKRL4sPMWz/AASoV0S
 6mlQ==
X-Gm-Message-State: AOAM533I5STHfNuP6qXxc9f3+bbo43ZMHn5qUGcCL59vsceEooqiZroo
 2wO/RZBnC7Kw5WIt1XPGnycZVRRAKg8l8Q==
X-Google-Smtp-Source: ABdhPJzZ2fFUldW7MQrHVwcNv1nKtMqh1n7Ccd/gtcCTePinlb/7QzY4UyvF/pX2MpOTHXRfncDCig==
X-Received: by 2002:a17:90a:4309:: with SMTP id
 q9mr3276395pjg.226.1602229122494; 
 Fri, 09 Oct 2020 00:38:42 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.136.194])
 by smtp.gmail.com with ESMTPSA id f17sm9468183pfq.141.2020.10.09.00.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 00:38:41 -0700 (PDT)
Subject: Re:
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com
References: <20201008181606.460499-1-sandy.8925@gmail.com>
 <c11f3758-9b41-412a-85b1-258d47c776c6@suse.de>
 <7227878e-28f7-a008-4bd5-fa7f64d371da@suse.de>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Message-ID: <24ac81e5-d163-0fb6-2d94-1da7c1a87974@gmail.com>
Date: Fri, 9 Oct 2020 13:08:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7227878e-28f7-a008-4bd5-fa7f64d371da@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/20 12:44 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.10.20 um 08:47 schrieb Thomas Zimmermann:
>> NACK for the entire lack of any form of commit description.
> 
> Please see the documentation at [1] on how to describe the changes and
> getting your patches merged.

Yes, I tried to use git send-email to send patches this time, and it resulted in this disaster. I'll stick to sending them through Thunderbird.

> 
> Best regards
> Thomas
> 
> [1]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
