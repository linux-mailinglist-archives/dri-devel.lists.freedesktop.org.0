Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D514600B6
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 18:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDB86E0CC;
	Sat, 27 Nov 2021 17:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE116E0CC
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 17:51:32 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so12010259pjc.4
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 09:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=kgldQlbq3QggWdFdGjJrXmsq1ijjrIOnJyDBMjGuSuI=;
 b=Un2TsasqS5BPC5cduFwI3EH8L4wROJf44Qhz71GClIvr/scN376Sj2sIXBUYXIlEKs
 ZwmQLnoeJ/LfkoaXBHv2wizfmo/Y2BAX5CgSULpypw+UTA3IshMiF4k+aZi0CpIQCOTg
 10FbFrzZA1GPMVsLeGmQfWyyafptAtQPCghlVVCgMu7mX0MR3ZEkl47CjIaTi3Q9ym1Q
 KXzey4hjDiXg2JtNgQWhGAheK7CJS6drV8w2cmZi3hx4Rze46ITDG7+JOpIVaT+8KXky
 xEn50RK9IqDf0BsJDzHLW5Dhih2poQOFRHo4Hm++pAtu1s3Gh4MWCIsIAAiwNNvsH0Y9
 Lh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kgldQlbq3QggWdFdGjJrXmsq1ijjrIOnJyDBMjGuSuI=;
 b=G3U4uk6DGJKamVs4JqjEbVj5d7LUqcDj8X+edq7VbjsOkhPR0eGepFy5AXrXQFcDBf
 f1dSC9KMbthq2iID7QHk7ROKn9Xm/VTGW5lo4PR/HQWy9+EKG8tqNT63Qwiuuugp0EMW
 e7H+V103ZWp8NjeQ/2SwlAW86dOjEfRHWDnOvL8dVOqogLDzt3rCS4picm8yooqV2S7R
 6KsulEyyJujgn7Ip42gxUDSAdqTgF2VTM9cUJmn7XshDEjCRSnEFnAa4EQxxuljXzwKO
 vVad2Ul4l43/e19iONWQEFoWR9EKT8sR+Rm9h9kyzFxrO0VkJcvFngOnGp0U7t9C822l
 FMTA==
X-Gm-Message-State: AOAM5327TL+GxNpC3gWD/3iYJ6GqpUV3Ilk3ag/NSOxjUr4YaiY+3NZU
 dyzG4aYjyy8ZHsz1eLfLUBJ6kmkde102xH4eR3ZFBhbEoqA=
X-Google-Smtp-Source: ABdhPJw/zGTPg49PRtq3n03ZcwoPdqzqlWZ1xk7Vk0KIXBVirJ2iugqJ93SPdPE860M1tHKAwzznVRXab6Xy8lXQzws=
X-Received: by 2002:a17:902:d395:b0:141:a913:1920 with SMTP id
 e21-20020a170902d39500b00141a9131920mr46485396pld.81.1638035492113; Sat, 27
 Nov 2021 09:51:32 -0800 (PST)
MIME-Version: 1.0
From: Chris Rankin <rankincj@gmail.com>
Date: Sat, 27 Nov 2021 17:51:19 +0000
Message-ID: <CAK2bqV+AvhJnPXofTL3xm2GmC22hfSaN6TKu5Y0dtnmnXgiciA@mail.gmail.com>
Subject: AMDGPU - What is correct combination of kernel CONFIG options?
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I am trying to compile a Linux 5.15 kernel with the amdgpu driver for
a Radeon RX 6600. For reference, Fedora's 5.15.4-201.fc35.x86_64
kernel appears to work for me and be stable, and so I am confident
that my hardware is OK, even if my motherboard is quite old (PCIE 2.0,
I believe). However, I am struggling to configure a stable amdgpu
driver for a 5.15.x kernel of my own, and suspect that I have missed
at least one significant CONFIG setting.

My amdgpu module has all the same module dependencies as the Fedora
kernel, and my kernel boots as far as the GNOME login screen, but then
the GNOME desktop fails to appear and my dmesg log fills with messages
about failing to start the parser.

My .config file currently includes:

CONFIG_DRM_AMDGPU=m
CONFIG_DRM_AMDGPU_CIK=y
CONFIG_DRM_AMDGPU_USERPTR=y

CONFIG_DRM_AMD_DC=y
CONFIG_DRM_AMD_DC_DCN=y
CONFIG_DRM_AMD_DC_HDCP=y
CONFIG_DRM_AMD_SECURE_DISPLAY=y
CONFIG_HSA_AMD=y
CONFIG_HSA_AMD_SVM=y

CONFIG_DRM_AMD_ACP=y

and I have also added:

CONFIG_AMD_IOMMU=y
CONFIG_AMD_IOMMU_V2=m

Are there any other (say) CONFIG_AMD_xxx options I need which I have
missed please? My motherboard has an Intel CPU and so I have not
included AMD config options by default.

Thanks,
Chris

P.S. AFAIK I shouldn't need AMDGPU_CIK for my RX 6600, but have kept
it so that I can still swap back to an older card if necessary.
