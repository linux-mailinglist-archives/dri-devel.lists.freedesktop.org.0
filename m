Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA136E0AD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32246E064;
	Wed, 28 Apr 2021 21:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E11B6E064;
 Wed, 28 Apr 2021 21:05:37 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id e25so34440140oii.2;
 Wed, 28 Apr 2021 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o07/SUP4nzTl7XpZrZovn23mJDrYGsbElp62JCCkl+8=;
 b=oOwjNi4PRlBN6zzbtPBk9m482gM8fQiCuxCLR+vZ+CpzqMC6SM6KWezfy861ad91aP
 QFwHDA0agQwjx1DQ1vUOlu52yXic9kUbvDXEj/20G8qC2rdAOFVUdxB4jTB0udVp5sq+
 6m89LmpCoRUQJErCIY8TOOgxyLrUyqpcHCthR4mCEvclgGdOhdHyKVlV/S5OF8bV4J7A
 eJ6uE1++3hMXb7y3QwcebMZ9pZbQqm1B7VIEr8y6AcA7SxcksoexGYTVuXM0sd0JhF43
 EANnJdpiwcSB0NNOdAT2XXUwuugkX5iMAjpBubVJ1on/iZPcT/a6YCyI1rhUnLmI5avN
 VENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o07/SUP4nzTl7XpZrZovn23mJDrYGsbElp62JCCkl+8=;
 b=qNG/9Ixf9pBHEj2bs7RGQue6UxPc43TkwvVaoSBHcQCqQ4djOklKDmFEMpugOHzlXM
 Wy8fjsrb00vpplhDwGECg6kY58LvpqROMjcKyMdz905bX/1L6tv1dP3J+QFpt+6HPLaw
 T3XQlqdOBpsgUx5oQQJz8Kc1Qz4Q6HAMuxN8zZzy0HYiJRvaAOyhl1fOHss0diSdLHq7
 kk1eqKxawkKAOvMMA4i7z80zfAhfhdgprBEl13cDUJyYxx8vlO1mG2FWz/VYHZtjnd+i
 UfLRCgpqTF1U7r00wiolxXZnJV+aaLfwWHUOcIggq9GFR7ho1Vf/XA5CpEU0mwXtVR8P
 NYXQ==
X-Gm-Message-State: AOAM533HOF/9oEZmvSU5UZ5hAg5OaU/wYWSX5T5rwe9clQQkaD4pe99h
 fz70N9cZTBqAJX5C3eR4vDcZ3QOM46kGpsJxUOk=
X-Google-Smtp-Source: ABdhPJwDRHC7njHgsCqGzKsRnlmiqZnfbbVG4islV97MSBRa6zvDEeMKPddGJLm0QrK2IEHLWiubxCcpGi8sz0IBs+Q=
X-Received: by 2002:aca:4a4e:: with SMTP id x75mr13391186oia.123.1619643936647; 
 Wed, 28 Apr 2021 14:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <1619211404-5022-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1619211404-5022-1-git-send-email-jrdr.linux@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Apr 2021 17:05:25 -0400
Message-ID: <CADnq5_Nhc=SUfuL7ibNTiw677sAnm9Dva-sj0PUwBnO6JXfGuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove condition which is always set to
 True
To: Souptick Joarder <jrdr.linux@gmail.com>, Harry Wentland <hwentlan@amd.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Nirmoy Das <nirmoy.das@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, Dave Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Wayne Lin <Wayne.Lin@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Lipski,
 Mikita" <mikita.lipski@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 4:57 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> Kernel test robot throws below warning ->
>
> >> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:3015:53:
> >> warning: address of 'aconnector->mst_port->mst_mgr' will always
> >> evaluate to 'true' [-Wpointer-bool-conversion]
>                            if (!(aconnector->port &&
> &aconnector->mst_port->mst_mgr))
>                                                   ~~
> ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
>
> Remove the condition which is always set to True.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 9a13f47..8f7df11 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -3012,7 +3012,7 @@ static int trigger_hpd_mst_set(void *data, u64 val)
>                         if (!aconnector->dc_link)
>                                 continue;
>
> -                       if (!(aconnector->port && &aconnector->mst_port->mst_mgr))
> +                       if (!aconnector->port)

@Harry Wentland any idea what this is supposed to be checking for?

Alex


>                                 continue;
>
>                         link = aconnector->dc_link;
> --
> 1.9.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
