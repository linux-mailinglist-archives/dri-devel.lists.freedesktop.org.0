Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82F94BFE99
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547C210E614;
	Tue, 22 Feb 2022 16:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DBC10E614;
 Tue, 22 Feb 2022 16:31:32 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so18305839ooi.7; 
 Tue, 22 Feb 2022 08:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dtYXm2hT3lcm5wvRcUbNMDyXlIE45DADQhitf3Rlc88=;
 b=LLMAhUgwrk/DYdWw6wgJuwrPS/o2NfgI10xeypJfrum8mmbBBX7d3r55885xcA0GSs
 N/0qnhPz6EDwjfCDK9EZLNApIQzBOjUAMTbhqcUrBws8r9XcYI+ZsjrQ1ackTdFYnXca
 KSe0mNO3CmeSvS7ItohT2P9sU7Dj+jbiFaynHZLO0MRk1EWBfi4n3U+MDt0xN/KgkRbR
 PUNRwRCH7/I5NqRt3zdTxI5yt4hkikKqm97sSwd5jrXi84dTOOy6v7mgYho9MtQZxmcW
 QzXsp71CoMubPYHdfyu53sEstrFfcN6QNLP2z/JN+YpWcau4FD4aw1cQMev20HollGSz
 gEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dtYXm2hT3lcm5wvRcUbNMDyXlIE45DADQhitf3Rlc88=;
 b=niF73mo5rapulo52mzAtxVQDNOz02Kr6DMNsY7QHkBdHplAhAAmnSFy60P8G/CSmq2
 BQKclTXDKkIe0LCsuzF7/6FfV0Ym4eqcmMZes8xsqFB1OKgctTIVALLiQqmysdVZ1tie
 4N9WTpg1Mx8YOdA78x6cJHBDRyzYyKB+bkNUWb1Drpk5cj7kGkQxdsKdGl2LUfxNFSPB
 PNAHJY1pA7qFl1M8k+ChdWcI38ClWcqBXnxVoHKJ+7Ru7bFnhXKJzs+wH2tYfadGwQH0
 JDx7tjslPsHPa+M6sBV2wkh5eg0letLyMuMxDs3lCoiGk1WcPWNukmScFo//0vIaij8F
 UoSg==
X-Gm-Message-State: AOAM532rVYzpu10rebf6JSmqdHACCZAdq6WpiuUQoCkPTaE0bQyrr17H
 cLUIGXytYF1+Kvpq8PiZAUPgtm9EP/6bqGOxCEuCIA1L
X-Google-Smtp-Source: ABdhPJwfj6FZ41K/ClOtZcMS0gc0gQWKuRYKXqqfYle6jHWNbXIrWRxGaQ1cQvTxxQ6ZhiRII8f7GBeUIdvBRT/zdf8=
X-Received: by 2002:a05:6870:3e0d:b0:d3:fe6d:57c3 with SMTP id
 lk13-20020a0568703e0d00b000d3fe6d57c3mr2020968oab.225.1645547491928; Tue, 22
 Feb 2022 08:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-5-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-5-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:31:20 -0500
Message-ID: <CADnq5_NSMvOUuLo936pbs+J7ajMCn3zDV5knYQo5t1f94KYW-w@mail.gmail.com>
Subject: Re: [PATCH 04/10] drm/amd/display: Remove unused temp variable
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Magali Lemes <magalilemes00@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Feb 22, 2022 at 8:18 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Remove unused temp variable from the dmub_rb_flush_pending function by
> using arithmetic to remove the loop.
>
> The -Wunused-but-set-variable warning was pointed out by Clang with the
> following warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:2921:12: warnin=
g:
> variable 'temp' set but not used [-Wunused-but-set-variable]
>     uint64_t temp;
>              ^
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gp=
u/drm/amd/display/dmub/inc/dmub_cmd.h
> index fb01ff49e655..d3088836d4e4 100644
> --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> @@ -2918,11 +2918,8 @@ static inline void dmub_rb_flush_pending(const str=
uct dmub_rb *rb)
>         while (rptr !=3D wptr) {
>                 uint64_t volatile *data =3D (uint64_t volatile *)((uint8_=
t *)(rb->base_address) + rptr);
>                 //uint64_t volatile *p =3D (uint64_t volatile *)data;
> -               uint64_t temp;
> -               uint8_t i;
>
> -               for (i =3D 0; i < DMUB_RB_CMD_SIZE / sizeof(uint64_t); i+=
+)
> -                       temp =3D *data++;
> +               *data +=3D DMUB_RB_CMD_SIZE / sizeof(uint64_t);
>
>                 rptr +=3D DMUB_RB_CMD_SIZE;
>                 if (rptr >=3D rb->capacity)
> --
> 2.35.1
>
