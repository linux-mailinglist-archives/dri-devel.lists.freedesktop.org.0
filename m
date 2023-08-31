Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F11478F2F3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 20:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD5310E6B7;
	Thu, 31 Aug 2023 18:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD34210E6B6;
 Thu, 31 Aug 2023 18:56:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-401ef656465so3848915e9.1; 
 Thu, 31 Aug 2023 11:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693508165; x=1694112965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70+hbPdCGwbal0A00oV8Qd5IExBJqMtjUwdtyT1yesg=;
 b=HOcmgmdtaqiuCcLGyMw60yqCv+qylCLGypIBuf9XBPXM9Uf2TnP6WrcLUqjt7NHqWA
 sWZkb0dMftjYCukfQrKyFGrHoZu9EWjUmegeBKPpldy1q8qHtZztbgTRtJg42QuPN5Kk
 y+f7n7hZwYxtc9q2a0eSQb/Vg1HfuF6yvnah8MwrIU65VsBOZHIISY9uA9TLtcObksDO
 5Lv8PUGwOmzRWO43ToUKlGgaXJbClK4xPsKD00pZDlONE5itakfx+NNyeyjxWTYy+9DD
 KyfJAg/IJrX436gESQZP9IsnTgFkwbRTxbpjKKu98LPf7LqpLYlIUz4NOneDQe9aZbcX
 UUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693508165; x=1694112965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70+hbPdCGwbal0A00oV8Qd5IExBJqMtjUwdtyT1yesg=;
 b=HP0ISHX7mfU88mlCdD4ZxT2DgtPPP9EgG7F3HfbFss4d2RY6CR6WswYEt7j9q1KV2h
 C2PM9TRxUK7EnLXF41yaxioC+MULmypKLzhszQ5WeH2rmQmlnK1s/zUhXXCbkrSv1ffM
 V1g4BZV2/0jdaCsvinlYbYRPIhJqI6nntsO3jYhGbPBFQzRU+eGeFEuthUqDJhII2/46
 giYv/LD9zxdqWlgfmQycypcpaI+NJX3Lv3VCM1NOA39dSAcmLUjsF+zenUBysq5XUxHh
 /X+EEzVOiSeY6o7LlDPF4DXz8AE1bhgsLw4+X6ZIo9UZ021CqrKlhyfukB0RyPIjXPnI
 lmqQ==
X-Gm-Message-State: AOJu0Yxq4xmq6WbqOZ/riTiflMoY44ixUajbzPbCaudohcWGi/w1LsK2
 AtWsGc/9HeXX2HmFW7ER0n4eH8sQBdZK3sHzIKY=
X-Google-Smtp-Source: AGHT+IF9ZKWCgd8d7R7zW6WSPi4FSXNFrrb++2Kkp9AV6hYPajY6HNBp7SI8K1T9gYypIbwS+iblGsap0riFAFU/lik=
X-Received: by 2002:a05:600c:8505:b0:401:c717:ec68 with SMTP id
 gw5-20020a05600c850500b00401c717ec68mr140636wmb.3.1693508164875; Thu, 31 Aug
 2023 11:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230724012419.2317649-1-sashal@kernel.org>
 <20230724012419.2317649-13-sashal@kernel.org>
 <CAPaKu7RTgAMBLHbwtp4zgiBSDrTFtAj07k5qMzkuLQy2Zr+sZA@mail.gmail.com>
 <55fc4a28-1e17-44df-2069-a688828080e6@gmail.com>
 <2023083145-scoured-celery-2511@gregkh>
 <c657653e-24d8-5790-a91c-4c13bb9eaeb0@gmail.com>
 <2023083144-railroad-daybreak-7f41@gregkh>
In-Reply-To: <2023083144-railroad-daybreak-7f41@gregkh>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 31 Aug 2023 11:55:53 -0700
Message-ID: <CAPaKu7Q2vq5m6Av6L2LthnFy5w2XtjKUYF8Z2__0hVp0vj2L1A@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 7:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Aug 31, 2023 at 03:26:28PM +0200, Christian K=C3=B6nig wrote:
> > Am 31.08.23 um 12:56 schrieb Greg KH:
> > > On Thu, Aug 31, 2023 at 12:27:27PM +0200, Christian K=C3=B6nig wrote:
> > > > Am 30.08.23 um 20:53 schrieb Chia-I Wu:
> > > > > On Sun, Jul 23, 2023 at 6:24=E2=80=AFPM Sasha Levin <sashal@kerne=
l.org> wrote:
> > > > > > From: Lang Yu <Lang.Yu@amd.com>
> > > > > >
> > > > > > [ Upstream commit 187916e6ed9d0c3b3abc27429f7a5f8c936bd1f0 ]
> > > > > >
> > > > > > When using cpu to update page tables, vm update fences are unus=
ed.
> > > > > > Install stub fence into these fence pointers instead of NULL
> > > > > > to avoid NULL dereference when calling dma_fence_wait() on them=
.
> > > > > >
> > > > > > Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > > > ---
> > > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++--
> > > > > >    1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > We start getting this warning spew on chromeos
> > > > Yeah because the older kernels still kept track of the last VM fenc=
e in the
> > > > syncobj.
> > > >
> > > > This patch here should probably not have been back ported.
> > > >
> > > > Why was that done anyway? The upstream commit doesn't have a CC sta=
ble and
> > > > this is only a bug fix for a new feature not present on older kerne=
ls.
> > > It is part of the AUTOSEL process.
> >
> > Could we prevent patches from being backported by adding a Fixes: tag?
>
> Yes, that will show exactly where the patch should be backported to.
This is also AUTOSEL'ed to 5.15.  That might need a revert as well,
depending on when the amdgpu feature landed.


>
> thanks,
>
> greg k-h
