Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF721058F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8630894E7;
	Wed,  1 Jul 2020 07:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B63F894E7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:57:24 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b25so22220116ljp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nppZMn8IG/x/P34XDI8YF5pOl6MlI1Bm1JmwS3tV0yQ=;
 b=Boox+tm54fOiXje1cmofks27n2hoUJw88n9u/2LWX5hJdcJ+OF6k+EH1ahpVpH8hD8
 l5NVq0SCnbe9lZJKWbXYwV1+hx5foXPSbl+aGuuohkWDtvx/BBuXQCl0R4EjQTV6wc9X
 p8XWJfALmcucOvoVjiFK11m16U6t1ufvjBduiF7jscXrRUoZIudTB/qWHlp6W9zW+FoI
 xdu4Qyz+5aA/KGWScXwb5p6egeUCBrN4vjO/fXESjcXc/qfL7BlefEF3OjoBxSOhUTxa
 2nFIbgsbQ4BLOMaB0/SGGT2dg6V/mJjNziOhlFNNjYJN+QJI6Ohu7sov9dBq8cOem4PP
 cBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nppZMn8IG/x/P34XDI8YF5pOl6MlI1Bm1JmwS3tV0yQ=;
 b=pCfM+DNFFJNpglafYwoP0i2TJorewFh07YFCObx0D+sa8pHMGHkbo8q2ssm28e9gvk
 zh0ipTWcMcxRh1nSJafR4tK7HVk7Wm4wvSBNZMPLe/WcsCTyAFK912v6tyQWr+regAQ4
 bBFDEuIifAZkfrDLwLKd3qin6CvHi2Jp17cvXD4D5HQ+veFF+TCUVk9EEim8WmO91a0d
 TJ4cJ9xPvtAq3h2h7Se8p2jCqJiecJ09yQkVuUlcSL0ZWP6YaybdBooulCF01dYhYWy0
 +RF4YGVjgZr6wPJmyxefImvXGQguuTrLOABDhtpHknzdjGeWuI2gyHsySRl1q9futOz0
 Zizw==
X-Gm-Message-State: AOAM533natdXkzYFkDLVs8XzKITILKeJ8vZ4frJjdXRWddzjvb6/eU05
 NaoBiJ2TZh+OlQubuKguyaonPA==
X-Google-Smtp-Source: ABdhPJwBA7EZ9ifbC0OQDRGW5amYBrScua4tcV+VnmhMNzDwOw4Z+So/IRbP3OCKrea7bo9EmvuzpQ==
X-Received: by 2002:a2e:9b89:: with SMTP id z9mr12333738lji.163.1593590242821; 
 Wed, 01 Jul 2020 00:57:22 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id c14sm1534598ljj.112.2020.07.01.00.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 00:57:22 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id F3D64101196; Wed,  1 Jul 2020 10:57:19 +0300 (+03)
Date: Wed, 1 Jul 2020 10:57:19 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: James Jones <jajones@nvidia.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200701075719.p7h5zypdtlhqxtgv@box>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 09:40:19PM -0700, James Jones wrote:
> This implies something is trying to use one of the old
> DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifiers with DRM-KMS without
> first checking whether it is supported by the kernel.  I had tried to force
> an Xorg+Mesa stack without my userspace patches to hit this error when
> testing, but must have missed some permutation.  If the stalled Mesa patches
> go in, this would stop happening of course, but those were held up for a
> long time in review, and are now waiting on me to make some modifications.
> 
> Are you using the modesetting driver in X? If so, with glamor I presume?

Yes and yes. I attached Xorg.log.

> What version of Mesa?

20.0.8

> Any distro patches?

I don't see any. It's Gentoo.

> Any non-default xorg.conf options that would affect modesetting, your X
> driver if it isn't modesetting, or glamour?

Modesetting without anything tricky.

-- 
 Kirill A. Shutemov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
