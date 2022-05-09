Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB375200C2
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 17:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82B310F24F;
	Mon,  9 May 2022 15:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F2710F24F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 15:10:57 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i27so27418311ejd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qr74HOJv1dWaxpDlnYGdw2F/l/T+Ar/qqrsqMuO/Ky0=;
 b=X2Adlak7nvlUwPKTDNlNHWhP64tY6g7sILuVrWEJV74blSWh2kpC8mRpGA6ELEcOVI
 eZNkOPyLAo1RRAGMODuqtt+skdEjES7WWqR4Ss8fZ41fNfdQ5mj/mhidehQpo1+sosNp
 IiozqbZPT5e8Dl5ksdgZOU0cPI25acJhN1vgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qr74HOJv1dWaxpDlnYGdw2F/l/T+Ar/qqrsqMuO/Ky0=;
 b=5E2gcH78rqaJYAz5LcvKf4r5LlkcI2BH6iNLMwFfPaphriy8oOorct2t1EJMVxVDkZ
 xeIy2lwOjdtsMjRerym7KcygsSN+yqPAc1QUzdN/CIrpJfG2ZDd/4kwjpRWZCuZdo3cO
 pTcwkGtKIWjRj/XaJoxdpSxCMuyK20BDG5P1py/LV/ofS2N4tdzjv1r8DtSuX5EBN2VN
 RG4Ociz2R/5Nfhv95O4JpXf3KMfsFI9w5o8J93rX0iRjWVhGuAx6EhVLUnC2g9r5IzOo
 g8ZqGxpsL/mmbs6kx5I1WjaTA7Cwog021MBCMhAQw3Bsn4pSHoCTL03aD/K4Tfv7g7w1
 n4hw==
X-Gm-Message-State: AOAM532U8pqdnvDmQoUbuCJ2dLw+On0HMph/Ic0TlHuXhaPjhW5tuITj
 mX1xV4L114Y2NxXgzDaVJ4POYw==
X-Google-Smtp-Source: ABdhPJyNsgeHqIPPrqgx5RqF2w6zI+6mpc05Yn6BlIWXtix5t6h6HBPOh3RfP1vNfWSy5EQLrLze/g==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr14929408ejn.437.1652109055614; 
 Mon, 09 May 2022 08:10:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a50d6c5000000b0042617ba63b6sm6329763edj.64.2022.05.09.08.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 08:10:54 -0700 (PDT)
Date: Mon, 9 May 2022 17:10:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Shargo <jshargo@chromium.org>
Subject: Re: [RFC PATCH 0/1] drm/vkms: ConfigFS support
Message-ID: <Ynku/J0KuplmKJ23@phenom.ffwll.local>
References: <20220506001822.890772-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506001822.890772-1-jshargo@chromium.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 12:18:20AM +0000, Jim Shargo wrote:
> Hi!
> 
> I wanted to send this patch out early to get some feedback on the layout
> of the code and new ConfigFS directory. I intend to follow this up with
> a more complete patch set that uses this to, for instance, add more
> connectors and toggle feature support.
> 
> A few questions I had as someone new to kernel dev:
> 
> 1. Would you prefer laying out all the objects right now or add them
> as-needed? IMO it’s nice to lay things out now to make future work that
> much easier.
> 
> 2. Is the layout of /config/vkms/<type>s/<id>/<attributes> OK? If VKMS
> would eventually want to support installing multiple devices, we could
> do something like /config/vkms/card<N>/<type>s/<id>/<attributes>.
> 
> 3. Should I split out the documention into a separate change?
> 
> 4. Any other style / design thoughts?
> 
> Thanks! I am excited to be reaching out and contributing.

So the overall idea here is that a lot of these things cannot be changed
once the vkms_device instance is created, due to how drm works. This is
why struct vmks_config has been extracted. The rough flow would be:

1. you create a new directory in the vkms configfs directory when creating
a new instance. This then gets populated with all the properties from
vkms_config

2. user sets these properts through configfs

3. There is a special property called "registered" or similar, which
starts out as 0/false. When set to 1/true the vkms_device will be
registered with the vkms_config that's been prepared. After that point
further changes to vkms_config are not allowed anymore at all (this might
change later on for connector hotplug, which really is the only thing a
drm_device can change at runtime).

4. removal of the vkms_device could perhaps be done simply be deleting the
entire directory? I think that would be a nice clean interface.

So in other words, basing the configfs interface on drm objects doesn't
work, because once the drm objects exist you cannot change the
configuration anymore.

Cheers, Daniel
> 
> 
> Jim Shargo (1):
>   drm/vkms: Add basic support for ConfigFS to VKMS
> 
>  Documentation/gpu/vkms.rst           |  23 +++++
>  drivers/gpu/drm/Kconfig              |   1 +
>  drivers/gpu/drm/vkms/Makefile        |   1 +
>  drivers/gpu/drm/vkms/vkms_configfs.c | 129 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c      |  10 +++
>  drivers/gpu/drm/vkms/vkms_drv.h      |  25 ++++++
>  drivers/gpu/drm/vkms/vkms_output.c   |   2 +
>  drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>  8 files changed, 193 insertions(+)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> 
> -- 
> 2.36.0.512.ge40c2bad7a-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
