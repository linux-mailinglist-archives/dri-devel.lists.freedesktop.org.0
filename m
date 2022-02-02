Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3066F4A6D23
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CAC10FAB8;
	Wed,  2 Feb 2022 08:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730AD10FAB7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643791565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+t98WKUfmAfPmDThATdXX8CTJNH50fOldGy238DTDyQ=;
 b=IJSKlgjLlk0t3JkyAJDPQ2r+xsJ45q0E22jopbQP+pmzu+ey5h4MyYpvnbGW+GQwwT6mZh
 0tgxYDArIKDs20VmMVQRn1AEqen6IivkEfAX9amkBut0SkKLs3uvRFHHXQgyQFybCRrvl6
 vnD90EOE4+0/mE/BPsl2fz6J/y1nfhU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-EAdIRm3-PvWSwrVrmAbrvA-1; Wed, 02 Feb 2022 03:46:04 -0500
X-MC-Unique: EAdIRm3-PvWSwrVrmAbrvA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso6643180wrg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 00:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+t98WKUfmAfPmDThATdXX8CTJNH50fOldGy238DTDyQ=;
 b=qAn6J/KusatF6LZ6Afc5kiGrgRrEw17x6sJ9rBzNNGwd4uJBd9NcNx95f0omkqpM5+
 rYHcfPX9nSKZ1rdCCLvEmP9kwjCeyOiHPHudxE9JmagpNz0XNhvjtmUyK9O1yWNiCpzV
 njj41dd4kMBciHK+2cpkYH9VSgPaMEsdOqTMTTAiuhlnfETAJql0iMFrnEMZIDpMaQgC
 36fXjrISzX3ojQfUsjLpbQAoRxWajg6KJ37GPOBRlYFDkOhQEY6J7qNXddC3Z9KVzrgs
 7yl5as788rYT8koAr7BDiobI2/FQ7nA8Ap0xHjQJYVl4xY0OIWeJEBLuUqOp/VZEknzj
 FdPw==
X-Gm-Message-State: AOAM530+QCAe5KPhrM7MGR8ApY3G/iEF/0l87UUBTzm74tb6woZM0qln
 s5+0QZh45xykJn2036ljFQZFEkWAJ06sNNaL7gNNA3BtrzCQR+/BGpVMD+xcSbtnBpT8yzAIq8U
 pjaufO2uuhtl6RM9emCvXLk1FeOqo
X-Received: by 2002:a1c:ed12:: with SMTP id l18mr5135958wmh.93.1643791563287; 
 Wed, 02 Feb 2022 00:46:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOc8cdyaslolsIIxQodJLho1aNIKNdP+8hs8Kq/JhdZJPYGQq4WH3NEN3pv9foMaQLLMG8PQ==
X-Received: by 2002:a1c:ed12:: with SMTP id l18mr5135948wmh.93.1643791563135; 
 Wed, 02 Feb 2022 00:46:03 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y14sm18994810wrd.91.2022.02.02.00.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 00:46:02 -0800 (PST)
Message-ID: <570d4384-b838-2bf6-1ff5-f8956ba7cee5@redhat.com>
Date: Wed, 2 Feb 2022 09:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
To: Simon Ser <contact@emersion.fr>, Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
 <YfmeztkVXwZzAwYe@ravnborg.org>
 <0yOiGD-56rTdV--oDietLeMO46Z8iFNnCNVVRg3Yh9D13AghGCYm5aP67SoswHY7Ye3vc3UEKzgtI02-F6vJ4b5xGLlE5yg6n2HznaWzYvg=@emersion.fr>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <0yOiGD-56rTdV--oDietLeMO46Z8iFNnCNVVRg3Yh9D13AghGCYm5aP67SoswHY7Ye3vc3UEKzgtI02-F6vJ4b5xGLlE5yg6n2HznaWzYvg=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 23:29, Simon Ser wrote:
> On Tuesday, February 1st, 2022 at 21:57, Sam Ravnborg <sam@ravnborg.org> wrote:
> 
>> As I wrote in another part of this thread(s) - typing the patch is easy.
>> But I do not understand the userspace implications so I need someone
>> else to say go.
> 
> User-space shouldn't really use the connector for anything except making it
> easier for the user to understand where to plug the display cable. I think a
> generic "panel" connector type makes sense.
> 

I'll drop this patch from the series. I didn't have all the context and thought
that was an opportunity to add an I2C type, since there was a SPI type already.

But seems to be more controversial than I expected and shouldn't really matter
for a tiny driver like this. I will just go ahead and use the Unknown type.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

