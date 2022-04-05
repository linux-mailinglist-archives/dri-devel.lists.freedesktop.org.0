Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C44F3301
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668B410E559;
	Tue,  5 Apr 2022 13:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D3710E559
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:05:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l9-20020a05600c4f0900b0038ccd1b8642so1501178wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5OoGrDH7nK9oFjsVTIEbOFtr4JmfdoVI2IyJ2wjIRyw=;
 b=bwrq0C1ajirhKSzPeBMF9M4xumTAECxTEkjAVIr9N/f/e13Ws70HiJje2vSD+LozFa
 WUKJttLtri9u8/VPFQ2yn2Kkj0BQy1trEq672pajS5zZ/h1OQ6nKRlGo0D03FrtkyN4H
 Y0bN8C0MwXLOOCzJf+mdEvBEreMuYHq2M+zd0TjqMEAcIwaUmgwUV6GfFt9qt+tzpHxQ
 9gUZLRS0Fk5mCX7CEFWx7sVga6DYaeYUQxz4S4fcCrhGOy+RdDXIbu6N9B5MQQguGj1m
 zKgbRV3tdh3m78Oo3Qi0QwtP8oq301EPtUHMoYxmcZ9W7sNBWZSEljuxnga2xR+tUrBU
 2DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5OoGrDH7nK9oFjsVTIEbOFtr4JmfdoVI2IyJ2wjIRyw=;
 b=ntpi1214BEj0Bkg7oj5TNgho/blsUlbTDMHCKMxtMincjIpgo+xD6I65C9WiYTnZ4B
 VZ98GpZQyZVAhBL+tsT3FJOrOc2ixT2RDacOts7wUdfci7X5DonfrWenBRfjdj1l9ST1
 ius6hS3HNPewKLEMlCkIT6nXIozdvKPzEidOX/1LRk7tq6BibjuFdpAkOG8OVe0ebBMT
 b7jlHKitCqcNibqzHUP3eDhtcnVc0yFLsz/H3sDthyz9V3Cym4ViOsV8iyKv96Slu1Dz
 h9kpDrV+WyzBZC98dOX+nL4Nxfujw8q7QQ5qcgXMczS4IplAJk1i1O/nPKIbEgW+LZIP
 AVbw==
X-Gm-Message-State: AOAM532ncYY8s5mp74Sf3O+mo9szx7g5Ql6pQqxYp8sCAiZuqN2/o5YI
 4J3Ufw1lLiA0RsJ8YI3svMo=
X-Google-Smtp-Source: ABdhPJwlDd/JO2QncqV+Qg7YsvFj5rwcuVsPA18gfL0PHrdH/061R20sU1lTWEubutb8Zv6bVjYCWg==
X-Received: by 2002:a05:600c:4e92:b0:38c:73e8:7dcd with SMTP id
 f18-20020a05600c4e9200b0038c73e87dcdmr3141891wmq.196.1649163948642; 
 Tue, 05 Apr 2022 06:05:48 -0700 (PDT)
Received: from debian (host-78-145-97-89.as13285.net. [78.145.97.89])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600c4e0800b0038c6c37efc3sm2099463wmq.12.2022.04.05.06.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 06:05:48 -0700 (PDT)
Date: Tue, 5 Apr 2022 14:05:46 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: fbdev: Fix unregistering of framebuffers without device
Message-ID: <Ykw+qlW+bjWcy4BR@debian>
References: <20220404194402.29974-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404194402.29974-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Guenter Roeck <linux@roeck-us.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, deller@gmx.de,
 Zheyu Ma <zheyuma97@gmail.com>, javierm@redhat.com,
 Matthew Wilcox <willy@infradead.org>, hdegoede@redhat.com,
 stable@vger.kernel.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 04, 2022 at 09:44:02PM +0200, Thomas Zimmermann wrote:
> OF framebuffers do not have an underlying device in the Linux
> device hierarchy. Do a regular unregister call instead of hot
> unplugging such a non-existing device. Fixes a NULL dereference.
> An example error message on ppc64le is shown below.
> 

<snip>

> 
> Tested with 5.17 on qemu ppc64le emulation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: stable@vger.kernel.org # v5.11+
> Cc: Helge Deller <deller@gmx.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zheyu Ma <zheyuma97@gmail.com>
> Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Link: https://lore.kernel.org/all/YkHXO6LGHAN0p1pq@debian/ # [1]
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---

Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

--
Regards
Sudip
