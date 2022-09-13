Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78905B6DDE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DE110E6F6;
	Tue, 13 Sep 2022 13:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B609710E6F5;
 Tue, 13 Sep 2022 13:01:36 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eab59db71so31822212fac.11; 
 Tue, 13 Sep 2022 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Egq3TEXftTCJHVvcDfROaTHHjIMkOHhmY4MYJgUqpWQ=;
 b=IkYoOc4wWT22pJ9fC+4oRYo0mk+0Jkg6ujt7YjIOFF1VBj7HNkFGvXg2n19hopxdH1
 ioQg9GrPo1NMvYUVtbvmYyF9uDwDFCkxzZHiaXDuGszuvGbwCpPu/blKETycs3jTEjY3
 NZu1aPRoNYlrkJ0E48Kglav5q3KbstekWQtfjLv5JL4F1a1Y93yMsy7fXYoH0umdQv+R
 +CP2Biq3F6XRW3mog4/A1qA1bcd96tQuwWJM0laeT+s9BjSeGLVozIAQZbm/ifctH7H0
 fJ31YaMEpT+XuFsJQM4TkVYZy0dzT+5+RKn1Ia/Oa+cIoecUP3MsurqMRNbLAgwKQl+7
 0q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Egq3TEXftTCJHVvcDfROaTHHjIMkOHhmY4MYJgUqpWQ=;
 b=FEAaPv23ucNQR3LzULm2GpryPZFFhUVFxFElAf4xVUy0xbPzzdz0dE89JZ6iilDM31
 KKonHA3uTdMNygtHnBlLzM/cUrtIUC3MSW82gRX7qgouio6dZzSaT9Cz5ps4M5w/alce
 5UKofKnCd6XPSjsVsBQWJkKspQgmPD75el0VC1ZJounc0qXSxg1zae2c8h2Eq7IlJm/x
 mmDBWOYLqYHttsOQEPhqvEU3VRZxmAmEy7JN7BrMgn5BTpi3Scg3YNJkvFIyAA81M/1p
 rMioDUvs1sBjOCEd86YXi8kJOla1lGRw3mvXzLKdu4LEs9QmF/5a78mKvf0z0zn4ueC0
 nrCQ==
X-Gm-Message-State: ACgBeo3mWNHrX7VAihRAgQcHlrMcB6EJAXYmDBhnWLL3+uXpBy+pO5EW
 15beJnRkVFJvh8CTO4hEBCTXocJUf8Pn6r2DPl4=
X-Google-Smtp-Source: AA6agR4FjusHCwayFdOlxCIojR/3f7ct8RZVroGn3bNBezA+eIWEwxbO0vSF7MMqn8xxiXfkohKS+WVlyhevJEMQg3g=
X-Received: by 2002:a05:6870:738d:b0:125:1b5:420f with SMTP id
 z13-20020a056870738d00b0012501b5420fmr1711917oam.96.1663074094492; Tue, 13
 Sep 2022 06:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220913083805.22549-1-jiapeng.chong@linux.alibaba.com>
 <20220913083805.22549-5-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220913083805.22549-5-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Sep 2022 09:01:23 -0400
Message-ID: <CADnq5_OGB6jVp34oWRxRHJneK-+UZo-oRm=ydO2Rtv3=ekHgdA@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amd/display: Remove the unused function
 copy_stream_update_to_stream()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Tue, Sep 13, 2022 at 4:39 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The function copy_stream_update_to_stream() is defined in the notif.c
> file, but not called elsewhere, so delete this unused function.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2852:6: warning: no pr=
evious prototype for =E2=80=98dc_reset_state=E2=80=99.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D2113
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/a=
md/display/dc/core/dc.c
> index 9860bf38c547..2ee0b5a2ce62 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2849,16 +2849,6 @@ static void copy_stream_update_to_stream(struct dc=
 *dc,
>         }
>  }
>
> -void dc_reset_state(struct dc *dc, struct dc_state *context)
> -{
> -       dc_resource_state_destruct(context);
> -
> -       /* clear the structure, but don't reset the reference count */
> -       memset(context, 0, offsetof(struct dc_state, refcount));
> -
> -       init_state(dc, context);
> -}
> -
>  static bool update_planes_and_stream_state(struct dc *dc,
>                 struct dc_surface_update *srf_updates, int surface_count,
>                 struct dc_stream_state *stream,
> --
> 2.20.1.7.g153144c
>
