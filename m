Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283ED49E318
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 14:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06A310EE73;
	Thu, 27 Jan 2022 13:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82EE10EE73
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643288928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQyYdiBdtNH1VNsfeubJWuB78VJ2++qYCFEjN1L+z1o=;
 b=RBY/WGl/p4Wlt04YGnuViunWIbBTkKlZ/ed2ES74YRS83M2c2RIsnpACL0DLR2PYQGa+pe
 ckylMPdlk3sa4NFodv/YZ1qAkPvb1WJBRT5duFyHXYEJ198XRdd/jIic/5ZJ/29QjQDiMF
 NUJthfWwo1NCIYg0HHsQef2YVTM9eqw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-OjRIiCQYM4usgjVIuxatvw-1; Thu, 27 Jan 2022 08:08:46 -0500
X-MC-Unique: OjRIiCQYM4usgjVIuxatvw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so4177800wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 05:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UQyYdiBdtNH1VNsfeubJWuB78VJ2++qYCFEjN1L+z1o=;
 b=6yUDbC/ucir8SubgVrLcp7wnUyV+OMCJ5/6JNXtgmHL5nasEOjaI8aB3E3t6T/suXm
 NJIZYSIweaJ/0rv1guO7aIkORIE47RiK8o/EtlP4zOP/QLDcS9jNqddIJVxKM5g2O9Wy
 /LevUz1j2wmbqn2WrxH1kDv82fNBCoD8q8aW2N3NAi8m2mH4erSYGP6n4AfMHga+RMs1
 WTHvNSXWlVqrnTbdEfcgGXWus21fjahvuf2e7beh0OPpOJ6nQT7KuqFWXZnMEwkm/jtE
 2mMRRC3OlhEus/oU9qXkCxeU/CZ5uwV+D+8zC9VXo8dg/uiIoXBQhuYtSqXL4Xln9Tjh
 koew==
X-Gm-Message-State: AOAM53278OhaOljCXkNyJhJg75hBQ1ik+UzhkpEeOtz+KlzVre/XM6gL
 +xYMc1ElQgv5vm40T2b4toFnaAKtvYl1M2eZfzfkO2iElWc9DEiDV2fKisK130aIJc5tXNviEGT
 l39djkoIcjucJ7K9zFXQ4bpA8I/oF
X-Received: by 2002:a5d:4943:: with SMTP id r3mr3001764wrs.130.1643288925691; 
 Thu, 27 Jan 2022 05:08:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8QfFcL0XfIO8hOXFedQuXUsgq2JTBDc2xnb6vs395KWwqaCiCCi/yJzVGlZa/jOkdHUHQ0Q==
X-Received: by 2002:a5d:4943:: with SMTP id r3mr3001421wrs.130.1643288920603; 
 Thu, 27 Jan 2022 05:08:40 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id s9sm2100610wrr.84.2022.01.27.05.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 05:08:40 -0800 (PST)
Message-ID: <b54d8092-c7bc-93b3-c306-b77dd57db6ce@redhat.com>
Date: Thu, 27 Jan 2022 14:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
References: <20220127082058.434421-1-javierm@redhat.com>
 <c99a7784-7ac4-e305-1a06-dfb514a409ff@suse.de>
 <b305cb36-1a09-c990-a3e6-98d420c62e3a@redhat.com>
 <YfKCoOk2sxDzHVXv@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfKCoOk2sxDzHVXv@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/27/22 12:31, Daniel Vetter wrote:
> On Thu, Jan 27, 2022 at 11:50:30AM +0100, Javier Martinez Canillas wrote:

[snip]

>> Indeed. And we can add such section as a follow-up. Maybe referring to some
>> of the drivers in drivers/gpu/drm/tiny.
> 
> Do we have a talk anywhere for tiny?
>

I couldn't find one for tiny.
 
> Otherwise I think it'd be good to just add a paragraph about "hey tiny
> exists" and maybe link to fbdev helpers and simple pipe helpers to get
> people started with the right entry points for simple drivers.
>

Ok. I can add some sentences about drm/tiny and point out that the DRM
drivers there could be used as a good references for simple drivers.
 
> And make it clear that the above pile of links is more for general
> overview and if you don't yet know what exactly it is you need.
> 

Sure, I'll add that too.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

