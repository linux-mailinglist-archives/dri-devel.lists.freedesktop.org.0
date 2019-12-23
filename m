Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C9129A70
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 20:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578B389F6D;
	Mon, 23 Dec 2019 19:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E3289F6D;
 Mon, 23 Dec 2019 19:40:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so17775297wrw.8;
 Mon, 23 Dec 2019 11:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIy+v0O7E5aqXUcLLvpcyjJVw818fR+OmS83X4egGfY=;
 b=GrgPwegr/oAyHPQpe/1lFrgk0Dq3MP7gKrdAnQDjt6qEo/iPwRGARVXIxSPwIKuufF
 O9sNqA+4KWkzTnsRjBB2VOyNykfwGRsLUklE96n7AwllCuAl5cyRsk7QCdVATkmPm464
 4+Bf9WMlrAclU0+f1spTe2o6xsateuqo/lGNHVXuWDBkJPe+tWi/nvxTwuYwOCnG/s8T
 fTFmkeIqlbJDAVCvhkPGDdDNOQMFSInNloed1uqe+USY7WDFNZdAmpbBHb7GE4jGaXri
 h2HwQQX64SrRk6SIQz0xSt6kz4x3KzcIePnu9EoT3LHm/1bygnP4yVugDHu/nV62yzNA
 5uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIy+v0O7E5aqXUcLLvpcyjJVw818fR+OmS83X4egGfY=;
 b=EWBMX+BI0pktEZuHu0tYJnQcOzcHK/5Td2OrEFzS0xUfn7kh0lgUKvmMv+hEI/kRJH
 hOT9do1tpE4sM3DfR8UbCXxvnJFvDiTbMHEziBHn2oEyFSAGzM5db/Kt2/BBHckxdgz+
 +5hWNYGlomgT2L1kWvpFFLSYUp8ccA7USwhlwgYBWhOdlfdkB+jDPHbPyCDq4Wv3dM6W
 gmsyq4WGU5vSfMFjM8ru/RRbdyVpmG9f/S+1VaB7TzKbeNvEp6dYB27fbNG8AKZG8dwF
 zS+/QfXN92RHL3EitWa0aq+vMLe9BNCegLlilzUvSlggJtDdDTWIidqB0h4oTK+OIeez
 hdsA==
X-Gm-Message-State: APjAAAXjf2ndPf00E4hUEh1Er7ZmKyH+J1ESH51vexauX2zadmshdMLv
 2ZhX5LSZKA1ux/MVGhReH4GL84UlqyH7wIA4JZo/OQ==
X-Google-Smtp-Source: APXvYqwkB2Rlnt4UpTEn/gzg1Q5xQsZgB1OiPs9/s33sANp+enSfnv7DhmPmYxnhn8csxoMN1ng1lyAS8NXFKLBzJ/g=
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr31994134wrn.50.1577130048814; 
 Mon, 23 Dec 2019 11:40:48 -0800 (PST)
MIME-Version: 1.0
References: <1577093152-10855-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577093152-10855-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Dec 2019 14:40:36 -0500
Message-ID: <CADnq5_MoDrqBKPdxYQY=ehoGekkaDr6vbLn896o77gvWk-C5gA@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/radeon: use true,false for bool variable
To: zhengbin <zhengbin13@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 23, 2019 at 10:26 AM zhengbin <zhengbin13@huawei.com> wrote:
>
> zhengbin (7):
>   drm/radeon: use true,false for bool variable in r100.c
>   drm/radeon: use true,false for bool variable in si.c
>   drm/radeon: use true,false for bool variable in r600.c
>   drm/radeon: use true,false for bool variable in evergreen.c
>   drm/radeon: use true,false for bool variable in rv770.c
>   drm/radeon: use true,false for bool variable in cik.c
>   drm/radeon: use true,false for bool variable in ni.c
>

Applied.  Thanks!

Alex


>  drivers/gpu/drm/radeon/cik.c       | 4 ++--
>  drivers/gpu/drm/radeon/evergreen.c | 2 +-
>  drivers/gpu/drm/radeon/ni.c        | 4 ++--
>  drivers/gpu/drm/radeon/r100.c      | 8 ++++----
>  drivers/gpu/drm/radeon/r600.c      | 2 +-
>  drivers/gpu/drm/radeon/rv770.c     | 2 +-
>  drivers/gpu/drm/radeon/si.c        | 4 ++--
>  7 files changed, 13 insertions(+), 13 deletions(-)
>
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
