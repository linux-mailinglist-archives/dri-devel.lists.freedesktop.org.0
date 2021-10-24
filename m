Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D2438BD2
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 22:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E22F89BF6;
	Sun, 24 Oct 2021 20:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EA789BF6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635107559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foPZLVboh7onbXg8RJt10aqr10vmq7ONgcIyRXku74s=;
 b=Wceumxf/KwSf6lmSOo3SEQ77BK7R/mKiIPld07Q2rilsKRTmimEutwZffCnHI0/UX2JrPo
 kvqK44960+K0F4zrcIIkVbUJzxlc/aMyNLxdy35S/tXer1UOzlUXIMlACAX6ItkNmZdIbk
 nzGh6/lIbznTQMIXBkIU/QGUnVY4RNw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-HOas7CWqMquofgUDvbc7aw-1; Sun, 24 Oct 2021 16:32:38 -0400
X-MC-Unique: HOas7CWqMquofgUDvbc7aw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so2414897wrb.14
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 13:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=foPZLVboh7onbXg8RJt10aqr10vmq7ONgcIyRXku74s=;
 b=gC0VQQdTYPkYi4AofFEBuLPJFfDPb8PEL0Hf/vp0SpJ47d1mvbbpcnmG2kNrr5OlbM
 5uguYct62ALSU7cBWhmukgG1Qb1V9WiVa0tuz6hHHpczBaAKzaWJ7Y3QAUoBgK3vcl38
 ToJu/RMfqBa+QnnlLyFyhSPRBMEnOuC02Skbmrt48o1DKZfgI08eJiM8fmnKoV2URkkC
 nVvl3dzXSxiBLT9RE+wTEyntqzl90qQYwiXgmP5EqWNFQtk68/pLv+Z66U6iP3kSTG/F
 zpdOBB+9CTpzHzSGt53+D3n+PD7knPn4kR4dhEqh/mMWmWhAEnyTZdgimlYQhPqODLTB
 8cvQ==
X-Gm-Message-State: AOAM533x4tAHOSn9r1IHR+TBJktFEegbgKTw+G6vHBQiQA8Ix4qYKLIP
 oZwke85ZY4DTsn4lCrHa7CdwpiTWlkBeUsw8Alq7hXjNvZT0amzMKBektR3Q/9ZAD6Mgj0tZCJL
 a81TGFNZtupNtwvcoHW0868f28Yke
X-Received: by 2002:a05:600c:a43:: with SMTP id
 c3mr43191915wmq.193.1635107557477; 
 Sun, 24 Oct 2021 13:32:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTb7WRG4PUnpVolCGCFaAjk037qGckuhGFDnVdfuykBRH4F+Vw25gbwIjHO7F2pE4LEgFYBA==
X-Received: by 2002:a05:600c:a43:: with SMTP id
 c3mr43191886wmq.193.1635107557159; 
 Sun, 24 Oct 2021 13:32:37 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id r39sm8142731wmp.2.2021.10.24.13.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 13:32:36 -0700 (PDT)
Message-ID: <c1d1f245-7bcf-16e5-c3f4-c13550843e02@redhat.com>
Date: Sun, 24 Oct 2021 22:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] drm/aperture: Add param to disable conflicting
 framebuffers removal
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20211022144040.3418284-1-javierm@redhat.com>
 <YXMNOfBS5iFenmx8@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YXMNOfBS5iFenmx8@intel.com>
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

Hello Ville,

On 10/22/21 21:12, Ville Syrjälä wrote:
> On Fri, Oct 22, 2021 at 04:40:40PM +0200, Javier Martinez Canillas wrote:
>> The simpledrm driver allows to use the frame buffer that was set-up by the
>> firmware. This gives early video output before the platform DRM driver is
>> probed and takes over.
>>
>> But it would be useful to have a way to disable this take over by the real
>> DRM drivers. For example, there may be bugs in the DRM drivers that could
>> cause the display output to not work correctly.
>>
>> For those cases, it would be good to keep the simpledrm driver instead and
>> at least get a working display as set-up by the firmware.
>>
>> Let's add a drm.remove_fb boolean kernel command line parameter, that when
>> set to false will prevent the conflicting framebuffers to being removed.
>>
>> Since the drivers call drm_aperture_remove_conflicting_framebuffers() very
>> early in their probe callback, this will cause the drivers' probe to fail.
> 
> Why is that better than just modprobe.blacklisting those drivers?
> 

Because would allow to deny list all native (as Thomas called it) DRM drivers
and only allow the simpledrm driver to be probed. This is useful for distros,
since could add a "Basic graphics mode" to the boot menu entries, that could
boot the kernel passing a "drm.disable_native_drivers=1" cmdline option.

That way, if there's any problem with a given DRM driver, the distro may be
installed and booted using the simpledrm driver and troubleshoot why a native
DRM driver is not working. Or try updating the kernel package, etc.

Currently what most distros do is to pass "nomodeset" in this mode. But now
that we have the simpledrm driver, would be nice to just use the frame buffer
set by the system firmware in those cases.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

