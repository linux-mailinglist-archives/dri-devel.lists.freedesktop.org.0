Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F157D35AD3A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 14:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0A46E507;
	Sat, 10 Apr 2021 12:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BA46E507
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 12:21:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f6so8165235wrv.12
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j1DeY1I2aLclFr3MrMe936qBKfvRMzQn/up+0QGkwrw=;
 b=N9ph+I8koHgubaoJUVsrzMI9F+xy20Q0HyC0VsAzI8aj7DuR/gzYj++RtPW1GX5jg1
 Ij3+foOPGPavDGrWnUL5bnMW2plKmCB7PWfGUUJWGODY86E6PQyb3p7Uu57SfrLyXbV5
 VWVMr4n8xszs2ntdvQKOOD91enu4XP5qXGMe+SHBCUSFUKnnFAQ96mQkQCoYMfLDefMY
 bDnTlgVnqrFqr9fCCcS9jlCshqlOkaTSgmMVohhRmyVCT/G4dzjid2egG2l9vOhAOOC7
 5aBvSq+vtAH4QyT9nNXYR03M7qE3d1ZwKY3GWM1pSGcgx9jugHR6ngWGmeCKq/bu09n9
 epcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j1DeY1I2aLclFr3MrMe936qBKfvRMzQn/up+0QGkwrw=;
 b=DC6t5SGeb6xoiEqLQg6HMXIqNU0+JKJXmu0CGc/TLufFyq7s2bm2TpNxIJLpwLr94P
 A8gxxUGJdPQsaKe4J4VKlvxVR+/x2g2d4x5ftQJ3824lu3JdOxQCb8X3w/fESEFOOFmd
 yLDAjP93jHUS8gdcfbdtzQR+939Vf9XlJPlcUylV3xrkvoUMmHByjDRHIC0QogEAr081
 xyv9CWOkXft3W2oPFD119khMqwprmiEeLtshOWKzJqy7YUD6VgtOdurJ+MlpPItSTET6
 LJUxyE2wWZUKHcXkeeURyRj7Xmd5fDM8H3vZpTwjQEd4uTmp8twRtsDtR5rTPvQOeADi
 LNfg==
X-Gm-Message-State: AOAM5324NyBnnK7+P3YqslZRhndiXm/6tRiPz3KNlOnHn6j7cpFKHrT/
 0ulbG4YZFaThMfz5B0xuRBA=
X-Google-Smtp-Source: ABdhPJxwAnfjpX5VHN0cpskiynTWQKGuEmZPl489MrhRiqG+zYd8AE/VdyZlw/fkKjJOdJGmChQtWA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr22027021wrd.47.1618057303744; 
 Sat, 10 Apr 2021 05:21:43 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o14sm8023476wrc.3.2021.04.10.05.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 05:21:43 -0700 (PDT)
Date: Sat, 10 Apr 2021 09:21:34 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH V4 0/2] Add virtual hardware module
Message-ID: <20210410122134.7dlbadm5blkm32zg@smtp.gmail.com>
References: <cover.1617602076.git.sylphrenadin@gmail.com>
 <20210407101258.72261c5d@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407101258.72261c5d@eldfell>
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
Cc: hamohammed.sa@gmail.com, Sumera Priyadarsini <sylphrenadin@gmail.com>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07, Pekka Paalanen wrote:
> On Mon, 5 Apr 2021 11:41:50 +0530
> Sumera Priyadarsini <sylphrenadin@gmail.com> wrote:
> 
> > This patchset adds support for emulating virtual hardware with VKMS.
> > The virtual hardware mode can be enabled by using the following command
> > while loading the module:
> >         sudo modprobe vkms enable_virtual_hw=1
> 
> Hi,
> 
> every time I see this cover letter subject, I start wondering "what is
> this virtual hardware module, yet another one?" and then I read the
> cover letter and realise it is about adding an option to VKMS.
> 
> The next time you revise this series, could you perhaps clarify the
> subject?
+1
> 
> The idea of having a mode where VKMS behaves like a virtual hardware
> driver is good, IMO. I do think "vblank-less mode" describes it better
> though, because I would assume things like USB display drivers to work
> like this too, and VKMS is already a virtual driver anyway.
> 
> To clarify, as a userspace programmer what I would expect "vblank-less
> mode" to be is that the DRM driver completes pageflips and modesets at
> arbitrary times, perhaps always immediately or perhaps with a variable
> delay that depends on how much processing is needed for the update.
> Also vblank events do not fire and vblank counters do not advance. Is
> this correct?
> 
yes. And I think this description should be clear in both the cover
letter and also the commit message of the patch that add the module
option to vkms.
> 
> Thanks,
> pq
> 
> > 
> > The first patch is prep work for adding virtual_hw mode and refactors
> > the plane composition in vkms by adding a helper function vkms_composer_common()
> > which can be used for both vblank mode and virtual mode.
> > 
> > The second patch adds virtual hardware support as a module option. It
> > adds new atomic helper functions for the virtual mode
> > and modifies the existing atomic helpers for usage by the vblank mode
> > This gives us two sets of drm_crtc_helper_funcs struct for both modes,
> > making the code flow cleaner and easier to debug.
> > 
> > This patchset has been tested with the igt tests- kms_writeback, kms_atomic,
> > kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
> > subtests related to crc reads and skips tests that rely on vertical
> > blanking. This patchset must be tested after incorporating the
> > igt-tests patch: https://lists.freedesktop.org/archives/igt-dev/2021-February/029355.html

Sumera,

Thanks for your patches.

In addition to Pekka's comments, consider what I comment in each patch
of the series for a next version.

Best regards,

Melissa
> > 
> > Sumera Priyadarsini (2):
> >   drm/vkms: Refactor vkms_composer_worker() to prep for virtual_hw mode
> >   drm/vkms: Add support for virtual hardware mode
> > 
> >  drivers/gpu/drm/vkms/vkms_composer.c | 88 +++++++++++++++++-----------
> >  drivers/gpu/drm/vkms/vkms_crtc.c     | 51 +++++++++++-----
> >  drivers/gpu/drm/vkms/vkms_drv.c      | 18 ++++--
> >  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
> >  4 files changed, 109 insertions(+), 52 deletions(-)
> > 
> 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
