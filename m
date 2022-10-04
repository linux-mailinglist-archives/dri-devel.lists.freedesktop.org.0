Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB27C5F4BBE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B053D10E1C6;
	Tue,  4 Oct 2022 22:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9002310E1C9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664921827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ainQo1jpmboo4R+EhHECAmUqFpH7esI7tM787udSaoo=;
 b=XGk/TaIb3AtXmdKosG9xYYMU58oASrdTlsPFGc4rGX7Dl5YxLy5sy+Huvba0qvWAuAtuT0
 a/xrJew5bGulbv7cMKSmsD+nSRJ4mjF74qU6OcXrBTpwHdbO9cW2q/JNzMbzdfjWqQUuhP
 UmkaN8Y7A0BVMAcNntc4eQHI0OVMgd0=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-Gk0jkh9gOgG01p7Oa17Ieg-1; Tue, 04 Oct 2022 18:17:06 -0400
X-MC-Unique: Gk0jkh9gOgG01p7Oa17Ieg-1
Received: by mail-il1-f197.google.com with SMTP id
 g10-20020a056e021e0a00b002f9db676704so5396136ila.14
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ainQo1jpmboo4R+EhHECAmUqFpH7esI7tM787udSaoo=;
 b=ZYYGnhWihxftWsCxSHC06vDG2G7x/DSAWDHe5X45VgVeksN7WOWvPwzsxn5mp2tBnW
 Yj/p44Uj6hQtfy5RhsWWi+7xT3H7f6O2bSNeaUuI1BA9ObcChKQsHiSh+YJABs5zFvbo
 2drGFKmDcuK2O7bnouKRmi/+eFwR3p111gtmCXEQYqtXzyv9UgpGIUkD74jADFgVQcia
 BafeFH8D3cX6pABM9pz5fesYN2GbKxM1364C2+MlEf3DXG18rUgYctW0LeILPoEOF5kd
 Kj5F0MMfsAhp+CHHzU2TZhFDTXrjGe1E/ZRHCf9+sDVFhBTOfht29VyMEWTQaXzsB8W0
 bQEw==
X-Gm-Message-State: ACrzQf3KIXm9ZWNPsAgFGVa0Gvzb2O1xEiwDPPmgwZhRT2iTcmHrB0D6
 exANafkskiRo5yiqJTQaSzmW+FQ0Mqcgb16QdUN76MR02fJMNElcz/f3u6G8AuQEKIpjEb+m6Mc
 FylU5thnYv8LVHItpWhoFaJV/6DPm
X-Received: by 2002:a92:d843:0:b0:2f3:5f18:bbe7 with SMTP id
 h3-20020a92d843000000b002f35f18bbe7mr13192184ilq.108.1664921826116; 
 Tue, 04 Oct 2022 15:17:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YMyQG/02c/f7DODWxjMlYoeNA29oqF0/AVFUlTJqwmbwrFyaS3U3uX4pbzfHap/HSvU8/3A==
X-Received: by 2002:a92:d843:0:b0:2f3:5f18:bbe7 with SMTP id
 h3-20020a92d843000000b002f35f18bbe7mr13192171ilq.108.1664921825889; 
 Tue, 04 Oct 2022 15:17:05 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 a13-20020a027a0d000000b0034a6d12aa25sm5650895jac.4.2022.10.04.15.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:17:05 -0700 (PDT)
Message-ID: <be291a31-e1a7-2323-f031-750a690b2c07@redhat.com>
Date: Wed, 5 Oct 2022 00:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 09/16] drm/udl: Support DRM hot-unplugging
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-10-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Add drm_dev_enter() and drm_dev_exit() to the various modesetting
> functions that interact with the device. After hot-unplugging the
> device, these functions will return early. So far, the udl driver
> relied on USB interfaces to handle unplugging of the device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

