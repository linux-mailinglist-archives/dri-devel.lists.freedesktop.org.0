Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D258DAAA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 17:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A74D9DE3;
	Tue,  9 Aug 2022 15:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09105D9D72
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 15:01:18 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id q124so9779324iod.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=7Z8Gt1kvQ2qMgFvYLX9L5Os/pwoMppPUG/zH/675HiM=;
 b=JFvhVPx7UTePPnr+5h1qdd0uExGBu1XIZzljf2CKVBl944uYdakgNuSexevzfQy5xJ
 pNz9YMZnA30DuJFGQEHP/5+VG8/mRg2MVDcqJDNEBT/JvoOQVNQu76BOBQ/+Fc/7eLuk
 Utx62Z/6+5qeo2PG8U9Qhz4jMTyvANXy631UFqQpb7ATf0v2YmMmgJc22Su5HUAiKiac
 2Yf6fIOZlmCqWhBaLDy7QFztAJNpd+QTQPyFDnQMJGUx4UT6YWuobE2sT2V6LqVhblAf
 djdEHwmyc7jf9U560o0FCAEQ81/OxM67CD3iWQaqR8pYoKGjchIAve2CwolU58DMo9hJ
 Hggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=7Z8Gt1kvQ2qMgFvYLX9L5Os/pwoMppPUG/zH/675HiM=;
 b=EWyM4sSvlE/326nKmLA8nz6i/nOs9L1hkYpjbNWPCSeZOTHewxfOXqMVHsGDIwDLC6
 AmZYrrGm0JEUzEjDDVawfB36z1aT3u96f+pCX61RkPOEskMcv6ZbK3xO1AWsSf+YwEX7
 pQeR4WYhfW2zDxNr3Tq2xppjXt8NM8lYCgDsuNkz03b/5/HN+p4o8eLHOyim90SkaGQa
 r6joNsUuavz+HhXXasQN/ewuR4d5AeaS2ESqmGmtCD7fTJJNgNRv5EW2h/jPca28tu9p
 KGaQXZow1uC9w0mkaHUo7wE7RqmeCWwPQYHhfFs3abfi9T4MLBnr/8Nrqr4Rb5ev5g0q
 +nFA==
X-Gm-Message-State: ACgBeo3yDxrlmTkbXKPhdH6QhCcWbZmmwhPyZbzGb7bgR2GJ045UZ4P7
 CxaD6AeqOs3mksduTalGEdlRTfMBQrMMVSGKd4oMysj7qRw=
X-Google-Smtp-Source: AA6agR4bp8FvYijrSbc8+bax4hs4cQGMD11ArEow4B4n9Lwp7iHI0dQimsqmJe2io4dmXXYOVXju9V2XDuz49nxUEK4=
X-Received: by 2002:a05:6638:1353:b0:342:9bfb:7382 with SMTP id
 u19-20020a056638135300b003429bfb7382mr10587461jad.129.1660057277054; Tue, 09
 Aug 2022 08:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 9 Aug 2022 08:01:04 -0700
Message-ID: <CAF6AEGusyJAt88A18hFBz-S6An2pVpNoQP0NDk7e0tKw7inAyg@mail.gmail.com>
Subject: Re: DMA-buf and uncached system memory
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 12:58 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi guys,
>
> we are currently working an Freesync and direct scan out from system
> memory on AMD APUs in A+A laptops.
>
> On problem we stumbled over is that our display hardware needs to scan
> out from uncached system memory and we currently don't have a way to
> communicate that through DMA-buf.
>
> For our specific use case at hand we are going to implement something
> driver specific, but the question is should we have something more
> generic for this?

I'm a bit late to this party (and sorry, I didn't read the entire
thread), but it occurs to me that dmabuf mmap_info[1] would also get
you what you need, ie. display importing dma-buf could check whether
the exporter is mapping cached or not, and reject the import if
needed?

[1] https://patchwork.freedesktop.org/patch/496069/?series=3D106847&rev=3D2

> After all the system memory access pattern is a PCIe extension and as
> such something generic.
>
> Regards,
> Christian.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
