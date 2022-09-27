Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2465EC18D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DD310E8EE;
	Tue, 27 Sep 2022 11:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3B910E8EE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664278574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+PgvmRpoUZFCpfRCz+QVT2wprw6tx66g26X33Z5GRNU=;
 b=WIkEnoSA56kvzC0H99/v3oBqe+j+HqB0lamsNbOsgEQ3KkdDdwDDqSpDCRLnNGmtKHEL78
 h2M/7EPTqdXwgtXyMqEhAThns4wrc4vwRDvT8QR7jEc5eZ64SekIlELeWUABOO6G9kWM6z
 nnyUgfKQXIix4hkZsv5jKmgwtftGQAE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-AXdEMoq4MWWiae4smZdw0w-1; Tue, 27 Sep 2022 07:36:13 -0400
X-MC-Unique: AXdEMoq4MWWiae4smZdw0w-1
Received: by mail-wm1-f72.google.com with SMTP id
 i132-20020a1c3b8a000000b003b339a8556eso5421487wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 04:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+PgvmRpoUZFCpfRCz+QVT2wprw6tx66g26X33Z5GRNU=;
 b=zG5vmVrb9qZAgfq0zLZ6VDaNSkMAiEaBE8QxjGXHvd+P72X0s58CLCa8k1f8j71j9o
 zDlsHrGgGX6/PKq3FhG7JKV2LM49hCgcQJuvrK2Lky1GxtyHlzvBJRyzsdMfw4o/QWiH
 0R5pcm1mp5sJiOs0NowoLUB6XEqJz+P6VHDEb9TeY30oQTlYxtc2pyDIxgog73tYb0iy
 EuQr71ms2qvDm2N3p2MxKF9T4QXOywtiOzZ8tcrVsgV8hYhpoTYEeNk/N32vyWKOAAaN
 jX5wzo03/tJg7mUdKe9mhJ8gtKWFghW3uDdjHBbPLdPsNvmK+hEMgBzREhpQ7Vg+zp6Z
 jOoQ==
X-Gm-Message-State: ACrzQf2gJeeSFK2Zx7gWQZ5NH99UsmJho6qx6cSA4l6+ut5xTHH8lHqD
 5BTIXjBJLKBFHDrCfAiZvZutRrUxN54Cml1fAZaJyG48t4nFRHmoBPBPAC4s35LeaOrTfCusUic
 lrSCQaZ7R0ks0ZxJTICYGb2s+FBgo
X-Received: by 2002:adf:e383:0:b0:228:9a53:612b with SMTP id
 e3-20020adfe383000000b002289a53612bmr17117925wrm.651.1664278572135; 
 Tue, 27 Sep 2022 04:36:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM70Hw2qjdhcHs66zqzPuMKkQaLuieUwQ2TF2TX5gRN1X87+80U+3UuAk612MI5hIGS37EpjOw==
X-Received: by 2002:adf:e383:0:b0:228:9a53:612b with SMTP id
 e3-20020adfe383000000b002289a53612bmr17117897wrm.651.1664278571763; 
 Tue, 27 Sep 2022 04:36:11 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d63c3000000b00228da396f9dsm1597543wrw.84.2022.09.27.04.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 04:36:11 -0700 (PDT)
Message-ID: <fed13d05-999a-8c31-78d6-cd5efbe2a64e@redhat.com>
Date: Tue, 27 Sep 2022 13:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ssd130x: Use drm_atomic_get_new_plane_state()
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220923083447.1679780-1-javierm@redhat.com>
 <8a974e5a-949a-5eb8-4f01-64e6114dafa7@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8a974e5a-949a-5eb8-4f01-64e6114dafa7@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/22 09:24, Thomas Zimmermann wrote:
> 
> 
> Am 23.09.22 um 10:34 schrieb Javier Martinez Canillas:
>> The struct drm_plane .state shouldn't be accessed directly but instead the
>> drm_atomic_get_new_plane_state() helper function should be used.
>>
>> This is based on a similar patch from Thomas Zimmermann for the simpledrm
>> driver. No functional changes.
>>
>> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

