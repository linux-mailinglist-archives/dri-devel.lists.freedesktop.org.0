Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8473A48199A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 06:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2920E10E2D0;
	Thu, 30 Dec 2021 05:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F0E10E2CF;
 Thu, 30 Dec 2021 05:24:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j6so93739487edw.12;
 Wed, 29 Dec 2021 21:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TRgYzTqIcjTzXeZXK/ria11F24MgAieM4h1sn0O8Io0=;
 b=lb4GP57XHc7hki/NAm4dE+RTGb58GBFRjy+aEZZUjxqsQmxwXc02Gc6+beCDhp8nP+
 /mcQha6QGXNWPuLoE5q58p5BZFlvkp+yzO7YC/+37tuYYY20Wdo/Xp+URC/tuEkNg+pw
 NDtpfLvsAyQ9jun933Is1hSABWcxPmJ4No3SyyZ+iy6AxC83VPu30G8p4QfGef3jBrub
 y6SS3J31optPCF2DRBS0MW8LkJ7+WrPf750UCGXJgZ24WpA/j159XDlC+aYgJ+GB2MVh
 NTPexwicui+j4aFFodSjtX/vfGX8NdR1IIl/jZu1UxMjWMRYIzyWx+nONg/GESkNfLAt
 S6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRgYzTqIcjTzXeZXK/ria11F24MgAieM4h1sn0O8Io0=;
 b=xjFLpJDVErZGeXiVr6MORG6pREhuP4R0qp0TGLYOJPmjF/5tn8Hfs2HLgC4Brx+UVl
 qxPLhsA0MS0SuqeLKGFx5TcDIgFkQFldjbHOtYDUbzxWdkQzsh3GnhmYWifIekJsz2qI
 UAfTr210EkWaJofoGyEVEG2mCqKiV7Hnnk6LKbIX0/L2dqFPlj9kaobXhOESBRUl29X7
 cJbqjhvLgVufNZAVCEzHIuosmb9snxXLPacsHZK1IEsYpBvyLsCibv8MReIevlOnEkjt
 46I9wvrC2AHYT67f19soSuxnv8SyxTYrzr8Anvg1TcZ2u9OXatwBnTPIgQzWdjM5Vs8I
 Yxbw==
X-Gm-Message-State: AOAM533IhsyUU56p/scZyuf3Gg9v5nYPXSgTrut272ObmFDvusJS+hZ1
 l4ldX4kyw3pvtMmT5v26Jvv3q2Gro1Y1pBVS8IVAlgdTwwc=
X-Google-Smtp-Source: ABdhPJxDlUUVrmLqP6hYEYkotwYmo+0dDQ8TixLURPce6QSywYMpBI7kGKd8Wamwzg5PdILRPPWCe1oRruvxOH2oVYU=
X-Received: by 2002:aa7:d55a:: with SMTP id u26mr28629562edr.265.1640841869279; 
 Wed, 29 Dec 2021 21:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20211229164631.5722-1-alexander.deucher@amd.com>
In-Reply-To: <20211229164631.5722-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 30 Dec 2021 15:24:18 +1000
Message-ID: <CAPM=9tz-o5KiowmzbtrNB31PU4YEEde3vBqta9LbeVXtWR0j7A@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.17
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

dim: 3be2709660dc ("drm/amdgpu: Call amdgpu_device_unmap_mmio() if
device is unplugged to prevent crash in GPU initialization failure"):
committer Signed-off-by missing.

is missing your sob as you committed it. Please fix it up.

Thanks,
Dave.
