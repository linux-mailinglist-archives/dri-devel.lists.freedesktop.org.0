Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF472217CE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 00:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53D76EB73;
	Wed, 15 Jul 2020 22:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3880C6EB73
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594852373;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRbbb6VsF72TuG3Q+P4+9Vi5iW/jJmh79aKgAp5Z+8A=;
 b=YJNVhWY80miek2meiGKD8rbA4q4R7Ox+M81JDWjr4dSMOPKQlgXiQxCEg9iVl9UFKKBKAu
 rFPNXla+iN8O5BO6ZDTTWGU4oUQ5fJT+ob9Wf+ix7C4YrkXfOO2XoDVckoGH/hFdCQq6T5
 owdLCVrxt4sFvbNV3vph31VOiSp0W70=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-I8Q5f2obMyGJ20QDGJ5yug-1; Wed, 15 Jul 2020 18:32:38 -0400
X-MC-Unique: I8Q5f2obMyGJ20QDGJ5yug-1
Received: by mail-qt1-f197.google.com with SMTP id r25so2443240qtj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 15:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=cRbbb6VsF72TuG3Q+P4+9Vi5iW/jJmh79aKgAp5Z+8A=;
 b=OyYFcnFQjf9zVvf4dXlXkn7reYDNGwsUEGva8jFSHhtuTLVSAMbHFYRhywnsWjhvxE
 THXyXzKCP4/oBvjP/HScfz8N0ZlW9U9OTMLd/F9sJh25BqUmRfOT17zjZIwVjUYkv20F
 qWVbuPoxp+zS8zb31ArtRK4XMCzSUievpjHnHc43J3xf0088suXFSTTxqeB+ZQ+85j3Y
 aoWB5Mb0fv9gcekxKpX9mIFn92oOz2Y142FQaSDtt6r7DXcAknnLrkDwW5r8mP1IddFb
 MUuWi6gCvhDPaC5/+sR8Qv+zK0C6OQheiJ0efeVLKnewKW5JmSghb2FBoRQBaMl+HeQ7
 KIZQ==
X-Gm-Message-State: AOAM530Dvjdoh0W1blmAQwxCdAtk3cOBThjnkdHkjZOBLO/0iWhrMSrQ
 oHrCgs9VLsfYcjIqph9RnCM1j80nxwSa8wne6UbB8Jz1Iw01VkrAX4bJEVm1H2VCcxkqRkW9aNG
 eVr2jdhS09C6KCD+zpisevewsdrQo
X-Received: by 2002:ac8:170a:: with SMTP id w10mr2257613qtj.392.1594852357073; 
 Wed, 15 Jul 2020 15:32:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxovRtIT37N+Dr3RXhTA5P5mXkxqwnp0tmNsHjFQ4uBJAdYxP61h/NV4vz5wVIUzZ9hee+eEA==
X-Received: by 2002:ac8:170a:: with SMTP id w10mr2257598qtj.392.1594852356812; 
 Wed, 15 Jul 2020 15:32:36 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id w4sm5226471qtc.5.2020.07.15.15.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 15:32:35 -0700 (PDT)
Message-ID: <ab503ddbd9103cc6652a243b79292ce73dc9f720.camel@redhat.com>
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, 
 airlied@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com,
 krzk@kernel.org,  john.p.donnelly@Oracle.com, rong.a.chen@intel.com,
 kraxel@redhat.com,  eich@suse.com, tiwai@suse.de
Date: Wed, 15 Jul 2020 18:32:34 -0400
In-Reply-To: <20200715145902.13122-1-tzimmermann@suse.de>
References: <20200715145902.13122-1-tzimmermann@suse.de>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Will try to look over this tomorrow, jfyi

On Wed, 2020-07-15 at 16:58 +0200, Thomas Zimmermann wrote:
> This patchset puts device initialization in the correct order and
> adds support for G200 Desktop chips (PCI ids 0x520 and 0x521).
> 
> The first 7 patches prepare the driver. Desktop chips would probably
> work without them, but since we're at it we can also do it right.
> 
> Patch 1 enables cached page mappings GEM buffers. SHMEM supports
> this well now and the MGA device does not access the buffer memory
> directly. So now corrupt display output is to be expected.
> 
> Patches 2 to 6 fix the initialization of device registers. Several
> fundamental registers were only done late during device initialization.
> This was probably not a problem in practice, as the VGA BIOS does the
> setup iduring POST anyway. These patches move the code to the beginning
> of the device initialization. If we ever have to POST a MGA device from
> the driver, the corect order of operations counts.
> 
> G200SEs store a unique id in the device structure. Patch 7 moves the
> value to model-specific data area. This will be helpful for patch 8.
> 
> Patch 8 adds support for desktop chips' PCI ids. all the memory and
> modesetting code continues to work as before. The PLL setup code gets
> an additional helper for the new HW. PCI and DAC regsiters get a few
> new default values. Most significantly, the driver parses the VGA BIOS
> for clock settings. It's all separate from the server code, so no
> regressions are to be expected.
> 
> The new HW support is based on an earlier patch the was posted in July
> 2017. [1]
> 
> Tested on G200EW and G200 AGP hardware by running the fbdev console,
> Weston and Gnome on Xorg.
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2017-July/147647.html
> 
> Thomas Zimmermann (8):
>   drm/mgag200: Enable caching for SHMEM pages
>   drm/mgag200: Move register initialization into helper function
>   drm/mgag200: Initialize PCI registers early during device setup
>   drm/mgag200: Enable MGA mode during device register initialization
>   drm/mgag200: Set MISC memory flags in mm init code
>   drm/mgag200: Clear <page> field during MM init
>   drm/mgag200: Move G200SE's unique id into model-specific data
>   drm/mgag200: Add support for G200 desktop cards
> 
>  MAINTAINERS                            |   2 +-
>  drivers/gpu/drm/mgag200/Kconfig        |  12 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c  | 213 +++++++++++++++++++++++--
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 ++-
>  drivers/gpu/drm/mgag200/mgag200_mm.c   |   8 +
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 153 +++++++++++-------
>  drivers/gpu/drm/mgag200/mgag200_reg.h  |   4 +
>  7 files changed, 328 insertions(+), 83 deletions(-)
> 
> --
> 2.27.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
