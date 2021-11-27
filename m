Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FCB45FEBA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 14:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B626E0DF;
	Sat, 27 Nov 2021 13:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1BF6E0DF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638018405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VQ4eFuFA88Z/vyM544qWCqrvAwEDFB665w5oCGPY18=;
 b=H9IWm8y9VskBE94uXG/2mxj9TucOJ9n6jCieb5HQfmXHxsi07PBePBIiJ/rmfp0Xkbn9cU
 RxHoJxVKS3mPQZinUlIbCLO38mnXJE7aPPg/oMG5bI44VraFtkJIr683OlRaKyAsuceOIW
 /vVAItGCrnbiberDSpUjKiU/Jq7oCLs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-o-OPDiXZO4mTueXW2lXfNw-1; Sat, 27 Nov 2021 08:06:41 -0500
X-MC-Unique: o-OPDiXZO4mTueXW2lXfNw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so6996146wms.6
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 05:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6VQ4eFuFA88Z/vyM544qWCqrvAwEDFB665w5oCGPY18=;
 b=xMeIjogAUeY8V0CeJejZiWrEnqoucQZJHt/9qWXMgiDLhFjhg4P990kbysPPK+6x3P
 P40LRsIxLDU7OXtd0f72D10JtJnrKFF9pHXxrw9h+YStLE5ALxXgfEKs2jhRYB9lXsjb
 5I+udmkwvMeB/YSyhJGGxeZImn0BOpujeryq2wfmYtHFwdmKLk/cLWQuvOHNbWYF/sCp
 hGytcz8qRDcUUp3243ATyDR2YSEJvB4ItPtD48xTXs8sfBIHFLZDhVDDAw4GrSF0v8nT
 pRwb8PHCjcJUx8uCailoN3apVFhixriFyEgmSivyXNsG/tyhvrZMfdFN4l+oUzzrojTN
 rS4A==
X-Gm-Message-State: AOAM533wdXpFS3O+Lek+TBjKYf03WU9177wjNQ1PCHb3ALowez7giEkw
 AZlHeHT2OhL8Ws7+qRgkJbZa6e49kAau77M1WRcFJldVigtJDX3gLxatWkW64kuEh2FwkkqJIMY
 TeS6Io/qlQ9O1CPSHq5j8VG2/oLjG
X-Received: by 2002:adf:e286:: with SMTP id v6mr20452411wri.565.1638018400474; 
 Sat, 27 Nov 2021 05:06:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw73lHUswf1TQ0qSgyrPkATonCL8J2Id2gCMmnoQOXqgBtWVc7cWocX3/6BaLRJF7ZHFuQ1vA==
X-Received: by 2002:adf:e286:: with SMTP id v6mr20452384wri.565.1638018400256; 
 Sat, 27 Nov 2021 05:06:40 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id 138sm14206473wma.17.2021.11.27.05.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Nov 2021 05:06:39 -0800 (PST)
Message-ID: <8bc41099-9063-94d0-1a5a-a06c265497e4@redhat.com>
Date: Sat, 27 Nov 2021 14:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
To: linux-kernel@vger.kernel.org
References: <20211112133230.1595307-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211112133230.1595307-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/21 14:32, Javier Martinez Canillas wrote:
> There is a lot of historical baggage on this parameter. It is defined in
> the vgacon driver as nomodeset, but its set function is called text_mode()
> and the value queried with a function named vgacon_text_force().
> 
> All this implies that it's about forcing text mode for VGA, yet it is not
> used in neither vgacon nor other console driver. The only users for these
> are DRM drivers, that check for the vgacon_text_force() return value to
> determine whether the driver should be loaded or not.
> 
> That makes it quite confusing to read the code, because the variables and
> function names don't reflect what they actually do and also are not in the
> same subsystem as the drivers that make use of them.
> 
> This patch-set attempts to cleanup the code by moving the nomodseset param
> to the DRM subsystem and do some renaming to make their intention clearer.
> 

I have pushed these patches to the drm-misc-next branch.

Thanks a lot everyone for the help with this series!

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

