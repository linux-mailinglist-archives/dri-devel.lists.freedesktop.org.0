Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C973E514358
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 09:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32BC10FD85;
	Fri, 29 Apr 2022 07:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8B10FD85
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651217890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sn4pMYCmP9rxbFuOxBBTfXkTBUlRDnMPeAj96w8G82w=;
 b=UxaOw2jMBJhweksb1UB+8YmYNaWhDLxXGWSkSnWzjSl/M4IJ3j+ix4L3XzoYqsCtbyDEDg
 uV/rIYuRhfY+144lADvQoag6anumnkzAbQJGWCYPfHPEH+7VCf9fM4NPpDilubRvZjMDid
 wwf+J9iawzPX8v66V6YYWxK+5GNxR/w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-jwsDdr_pMLuxDQY_0dh2Aw-1; Fri, 29 Apr 2022 03:38:04 -0400
X-MC-Unique: jwsDdr_pMLuxDQY_0dh2Aw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d28-20020adf9b9c000000b0020ad4a50e14so2754544wrc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 00:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sn4pMYCmP9rxbFuOxBBTfXkTBUlRDnMPeAj96w8G82w=;
 b=vuggvhVe99gfyjl428M+QVBrHkBmL0rMopvn7cXt+jEtIaK7bvRZ8ZanewR3t+FexE
 aHuvu2oSNCk0IWcs5SSdkUkJyLlv2QRfmEnkeLKHsul8U+V+s8/6sEK6pyZGjCcEHQ11
 HWda6ijliTW0BNqw7isS4qmMFsyqrQptk59d2Yicq5brzRHHyvvlAPRF6kHpXmq64HPD
 r9TqnnATF02cE7sjenuAOk2MofvRwNnHsEiMprXG9cS4wKtBjsN8Aiy2SdkDK0ZxsvXp
 u9Ppj00e+FiVx4++prrT+58Qm+TiuGQ68QdM71ys0+K10OxUYovfVdnyy6Nq7+sSitKC
 mubw==
X-Gm-Message-State: AOAM530ESojPlI45Thhc80zn27RljotYeVC7/EjDrUszxbbBrGQsJgyr
 +kDMgc/CwHr8AeRdTjp4FUp+q/HIRSGQQKujvxkReeINttLq3PyzEq1YuWMidLbXrMkxqzTRDlo
 TeAF1KAIGxJbZzqw5ROJAEwA7LWB1
X-Received: by 2002:a5d:6d81:0:b0:20c:4c82:7239 with SMTP id
 l1-20020a5d6d81000000b0020c4c827239mr472037wrs.254.1651217883273; 
 Fri, 29 Apr 2022 00:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyit0aCIjTyFDElOW1X8rM+bZwRMXA3FEqwxP6W9A3I3zSFPQgJfGjftv7TUU0fTJmPW3u3w==
X-Received: by 2002:a5d:6d81:0:b0:20c:4c82:7239 with SMTP id
 l1-20020a5d6d81000000b0020c4c827239mr472018wrs.254.1651217883025; 
 Fri, 29 Apr 2022 00:38:03 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce354sm2046162wrc.76.2022.04.29.00.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 00:38:02 -0700 (PDT)
Message-ID: <4265064b-9250-c05e-6d54-cf97c7f1cf4e@redhat.com>
Date: Fri, 29 Apr 2022 09:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 4/5] fbdev: Rename pagelist to pagereflist for deferred
 I/O
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com
References: <20220426120359.17437-1-tzimmermann@suse.de>
 <20220426120359.17437-5-tzimmermann@suse.de>
 <ac24d81e-f6c5-0763-909a-c15d223f1ea9@redhat.com>
 <91f562b5-1b8e-1445-b6b5-5aeb6cd7668a@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <91f562b5-1b8e-1445-b6b5-5aeb6cd7668a@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 09:27, Thomas Zimmermann wrote:
> Hi
> 
> Am 29.04.22 um 09:21 schrieb Javier Martinez Canillas:
>> Hello Thomas,
>>
>> On 4/26/22 14:03, Thomas Zimmermann wrote:
>>> Rename various instances of pagelist to pagereflist. The list now
>>> stores pageref structures, so the new name is more appropriate.
>>>
>>> In their write-back helpers, several fbdev drivers refer to the
>>> pageref list in struct fb_deferred_io instead of using the one
>>> supplied as argument to the function. Convert them over to the
>>> supplied one. It's the same instance, so no change of behavior
>>> occurs.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
>>
>> I thougt the convention was to have Suggested-by before your S-o-B.
> 
> I always thought that the convention was that the authors S-o-B goes 
> first. But 'git log' indeed indicates otherwise. I will change this 
> before merging the patch.
> 

The way I understand it, is that besides other things it indicates a
chronological order of events. So the S-o-B will go first, followed
by any Reviewed-by, Acked-by, etc gathered.

But if someone suggests a change to you, that means the suggestion
happened before you wrote the patch and is expected to go first.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

