Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A607492B95
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 17:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A055B10E274;
	Tue, 18 Jan 2022 16:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F053D10E274
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642524776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57UeJIyCQ/BDj/COuS3CVRCbZSCVXcKCTRhafINANo8=;
 b=ENEHYdIIA84rhoOZYL8EKSVkLSyFllHJYjtkWmLMVJHz3D5E8J/aLx1/5abzDO2+LFPWHW
 n5vpa5MbkcYcMF7FrmknZgGQKz7vEigzrskk0xv1KmzfA3g+x97//7LKrt2KgIQkfbw/HP
 t7/MTZok1bVmf59t+gid67koNjzCvOM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-MQ5VC1JOMz2qo5VwxhnINA-1; Tue, 18 Jan 2022 11:52:55 -0500
X-MC-Unique: MQ5VC1JOMz2qo5VwxhnINA-1
Received: by mail-wm1-f72.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso2468936wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=57UeJIyCQ/BDj/COuS3CVRCbZSCVXcKCTRhafINANo8=;
 b=ZvGL81r5forvrNBL0kEPGtc9zOpFTtFXI6+ay3DAtwJPT1lmXaNRbHDJDV8S70vQFi
 DayZx8pws4oGClm1C59xG61yTHl5kQNgg1hTXBCQreQMyyXbXb4HuX2RJ7hCqFtSlqUB
 EbGz1ItdxgmhTuYJ7Qd0lfFEqxECnJRULx0MjcLMCJTPaSaC/exSF/oIMbh/+y/Dj8Zi
 +vMOHh1zty0WCTGab28YCrOfcW1WOpAsRr/muuey6ip4sNqj8UeBPyNtK9rzxWRm8TPV
 erxr25LSL+/n/URCTBqkrkJETg+6Zjc32+VyRyFByyllNE9PBjCX3b7hIZSyGFcRAzVg
 lE5A==
X-Gm-Message-State: AOAM5332TzuoVVrhrY4qazKX4eFvo7lkQfm0eUYhxWucMFofrTbXOH4t
 hEcoUWc3WSZHb5ROyEVhqb4UxSjQ9Iz66e+4kWYBe2I1r9xjoxCnmA/n1J2VRmFPbemP+sZuJYK
 D89lp9vy9yjYZWKNOW90kzyNRpr1n
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr7449080wri.116.1642524773825; 
 Tue, 18 Jan 2022 08:52:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx014IG/6FqhtQmGurvHP5rgHl9Rpw4h4+WbLNL1mI+oSsy9h75ZaDFCiA2yklzpF0bOpXHVg==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr7449059wri.116.1642524773560; 
 Tue, 18 Jan 2022 08:52:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:cb60:a1c5:8a09:190d?
 ([2a01:e0a:c:37e0:cb60:a1c5:8a09:190d])
 by smtp.gmail.com with ESMTPSA id v3sm17450939wri.4.2022.01.18.08.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 08:52:53 -0800 (PST)
Message-ID: <fd5773a1-d780-4155-16fb-1c8f7fb73999@redhat.com>
Date: Tue, 18 Jan 2022 17:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] mgag200 fix memmapsl configuration in GCTL6 register
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20220114094754.522401-1-jfalempe@redhat.com>
 <20220114094754.522401-2-jfalempe@redhat.com>
 <b6526036-fcfb-734a-b45f-9ceec8aa656f@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <b6526036-fcfb-734a-b45f-9ceec8aa656f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: michel@daenzer.net, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2022 17:38, Javier Martinez Canillas wrote:
> Hello Jocelyn,
> 
> On 1/14/22 10:47, Jocelyn Falempe wrote:

> 
> My worry is if this could cause other issues so I would only do this change
> if (is_kdump_kernel()), to make it as non intrusive as possible. And also
> add a verbose comment about why this is needed.

This change must be done in the "first" kernel, so that when kdump 
starts, it doesn't hang the machine by writing to the VGA interface, in 
the early boot code.

To make this change less intrusive, we can do it only on problematic 
hardware (G200_SE rev 42), but Thomas said it was probably not needed.

> 
> If you make those changes, feel free to add:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Best regards,

