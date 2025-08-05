Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65676B1B9A6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9D510E231;
	Tue,  5 Aug 2025 17:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V0Ad0LEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3AE10E231;
 Tue,  5 Aug 2025 17:55:35 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-5393aa55adbso1293138e0c.0; 
 Tue, 05 Aug 2025 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754416534; x=1755021334; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tVq221nALtjhFP05t0bLvvBx0QkNkCxD0XEfFCrLV/s=;
 b=V0Ad0LEOu9EDFdsHQcvSWDX1xkF9lXSFdruEYduPnIGisFdybG5sENTQMXtRB+IBmS
 ZQ8GLCsIxWQqByuqTShVas4n3BBc2a30YWG7Pcj/9NqcsNBqs9Jtouhugnh+RhpinVOb
 KspB6FvwSObCRAxqHc06ujkatCmGteycyV0Rldx8N2PxfI2HVqeJarr/Zu8j4Bs+GuoC
 b4tO2FacEurFKNRZ9rDbPFV3awa43VYVuY5RHq2shjIojvnwELsjtopthteq1JsyjxBy
 mCcJGMTbfLF040NHL8wNxRCaJyM3XrC+1xh+uo92Shq3Za/VyBcWLoXwC8CMaCbkmsdK
 PBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754416534; x=1755021334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tVq221nALtjhFP05t0bLvvBx0QkNkCxD0XEfFCrLV/s=;
 b=sW2cODyLr5PkG/oO7y9q2CZhQg6lPlyPEdxz6BYj1tyExfa4Y90DLZMY4/zhhUD25g
 DYkME+NtFeXmYEQ0PtVX0wa4vY9A01I6AfV7yxQCmxmu9KHHOLxJIdpCGSKrimWc3KtO
 tAo3RphUMbW52O4IzBQDc0sXUyTyJJmCPJQ3/u/GZYs9K9+49oL/Ag7n4T73ZeNpjIQC
 ay7bbbE0irI8/S4RWfb8Gg/thsujgnKlUryJQuTYCA1CMjcZ7rm+Gwe6Dd0JVP/aC61o
 5IJQepYjRuovrG1aKUCCbSiVU4dd/ZC4BrvXuUgZ9bq1Q+rdaAZ8TilmmFunEu78qs73
 8UXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7HMNn6hnHkfxzt21UrgKdhFCZgHY/TFVgZNavNlyeT0OjQG3CS1NJy0jEhi7e9huIT2TVWMHscVFYmgv3bVxqNg==@lists.freedesktop.org,
 AJvYcCWvSMu9Ms/gvWp4PIkzJED/3ydNBGODGkfMkMTFOT/szVoFf7fkMp/BFXsjoMCZdo++/UeK0QW6hBPb@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0TZwLUqk9l7DozzMgbLbHKYg4Jop2epJGGM9syIltpd2Rz6LA
 Trl/d02zy3OAt4yxNf3dWRAR9uzwE0tKZZhqe4iU29Y/qtl5Hv6dOBTu4oYti7c7uq3zFhTu2j0
 9aI1ZAO5xjTHYF8QC3afUFTmKiH6JHAo=
X-Gm-Gg: ASbGnctALUhuKrTgKmX7yrg26g2rfjmlOEDT4ns1tOOE6SqX+g2xVKp4w+TT6bYHpvO
 zyS/T/fKii1PN2wcmp31y+Sy+2qNLE1B7tpfVckh1dHMMQXrMLM+hAywNXJc7hWpGl3xScJ1UIY
 NGgNZtdJbV1X7V7inuuVBfkpz2P+hY1GEi8DEN6JtFeIisvsyjaQ3BAtKBN/95ySXTLzROiCWZn
 k+s
X-Google-Smtp-Source: AGHT+IFq6h/thbNDD3MHQkdADFfHevpJOOgu6mE5Zb6UBKpSwxsw99sC3noj69jn6Ud4dU4nJziGqxM7qfPCA/wD4w4=
X-Received: by 2002:a05:6102:54a1:b0:4fa:37cc:2877 with SMTP id
 ada2fe7eead31-4fdbecde2bfmr6727430137.0.1754416534094; Tue, 05 Aug 2025
 10:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250804212902.22554-1-rampxxxx@gmail.com>
 <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
 <CABPJ0vgz6gib5LdKY1O6uhPq7Tk5GN2X_dcGBwtx3b=TRQUw-Q@mail.gmail.com>
 <DBUNH9S9HCXH.SIOBPAT3U91N@brighamcampbell.com>
In-Reply-To: <DBUNH9S9HCXH.SIOBPAT3U91N@brighamcampbell.com>
From: Giant Sand Fans <rampxxxx@gmail.com>
Date: Tue, 5 Aug 2025 19:55:22 +0200
X-Gm-Features: Ac12FXzIPlcfkrae5_ZD700aFaYyz_be01IYT0UOwDsK_87Zy6B94T_fGsVQH-4
Message-ID: <CABPJ0vgOMQk8aBUvtR5FhXzUJ1itF_mvXYiTw9gG8+0=5ipkyQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Add directive to format code in comment
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
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

On Tue, 5 Aug 2025 at 18:55, Brigham Campbell <me@brighamcampbell.com> wrote:
>
> On Tue Aug 5, 2025 at 5:53 AM MDT, Giant Sand Fans wrote:
> > On Tue, 5 Aug 2025 at 12:49, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >> Fixes tag?
> >    Sorry, what do you mean?
>
> Dmitry is looking for a tag in the body of your patch (much like your
> "Signed-off-by" tag) which describes the commit which introduced the bad
> behavior[1]. In this case, it looks like this block was introduced with
> the incorrect kerneldoc code block formatting by commit 471920ce25d5, so
> the correct Fixes tag would look like the following:

oh, thank you .

>
> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")

Yes, this is it.


>
> [1]: https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes



>
> Cheers,
> Brigham
