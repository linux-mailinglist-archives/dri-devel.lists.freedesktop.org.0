Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F1197BE1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 14:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1F689BF3;
	Mon, 30 Mar 2020 12:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DC089BF3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 12:33:00 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id n13so8224580ilm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxbhURdqeY4tQY1TIF/XtnZiMO5t6ORH3FDOf86VjrM=;
 b=kLtvWnDD+PVnqLf0EKVUTgodcUI/vDh/Jr9+BGujcM8e+jZxRSMy2g+Q+oOo8we85/
 faAgDxecXONAnLA6Ka7bpVUj9jKMMbBKt0CxHAsP2EzGOKPMpwz0YBw1BtHQM6+51XQO
 DvkhyuQdRiAabUh0ceErLSExDebMPp9a/y6KKVIBd4Ke2cQOZhittXjIinY8ACFptFyC
 eLVSlQg6kgdbLJZOCwOw91AnfcKc024yttEA9aK550aXHuxcHaQp5S1fAWoDvzj6lxqr
 qBr/OVUYV+wRjL7gWfyZOAJrzg10eT6XSFhooYj79PvcEGanu0Ncv/klW6dDPiewaCoo
 fwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxbhURdqeY4tQY1TIF/XtnZiMO5t6ORH3FDOf86VjrM=;
 b=Q9YveOYe9zxM2JCUV5I8qOmxfxGIcPvTMcLhntdujG+DhNi4glEMWCEb2H2mM8Tckx
 j00uN7oHF/by3x3fVHivk9N/RJD0g1GyKrWEK8qlfpkFXkXXJfXX5k6DCdbLDrBx7E31
 W6Ks8Qjgt2CjICDx45gYnubF9zQbV3KnubxDRLEPuhxh+XSptlpYRyKpsLvN2IgHBCcE
 EuDwj8jVS6yYClA81kPUny7Mn9Gd6vWLvIrV8UBKo/0GiVvBm5hObFI5UMylW8UzAw//
 dkfW15XamPEpkRnlBnq2ipKGjyxhgZSXozwi8gEt5LmN25bJno7yZRWzEuQTatT9v3ly
 V+jQ==
X-Gm-Message-State: ANhLgQ1gtRYEGwH0QsybOPzeBS0+a69WqOmF8vHVo/Gxyn3/hWxgBDIM
 unsYR54D+c1chqxmOMABt78C70eaXaElYWjQVbU=
X-Google-Smtp-Source: ADFU+vvVDdO6PE5/W/xY8RMb/+IIw3P2f/dN4OSoiJyI34MLt27MsmlTiBxW0aYiFCCJMEmGWrNdhhnBZHIdY4tgANw=
X-Received: by 2002:a92:9e99:: with SMTP id s25mr10656271ilk.306.1585571580232; 
 Mon, 30 Mar 2020 05:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
 <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
 <cd773011-969b-28df-7488-9fddae420d81@samsung.com>
 <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
In-Reply-To: <bba81019-d585-d950-ecd0-c0bf36a2f58d@samsung.com>
From: Shane Francis <bigbeeshane@gmail.com>
Date: Mon, 30 Mar 2020 13:32:49 +0100
Message-ID: <CABnpCuDuvrJYQKSbdci=N-pqH5V11R3-Kwi_d2cDSrWSASxCsw@mail.gmail.com>
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 9:18 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Today I've noticed that this patch went to final v5.6 without even a day
> of testing in linux-next, so v5.6 is broken on Exynos and probably a few
> other ARM archs, which rely on the drm_prime_sg_to_page_addr_arrays
> function.
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
