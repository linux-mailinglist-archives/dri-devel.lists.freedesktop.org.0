Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0ED1CF9DA
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 17:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDC66E92F;
	Tue, 12 May 2020 15:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A996E92C;
 Tue, 12 May 2020 15:54:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h17so7190372wrc.8;
 Tue, 12 May 2020 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gqLRxvMmqILCLzIsTlGbC4llYBLLqdGwC3gVHSsdlAY=;
 b=kF0koygmMuIGjj/ZPdBj0uzF19MXcgBj3NFB/K0c1X0zozm2G9b8a/620FkVENe5Jw
 wfq2YI4/bZ/ySAHJD/+/N9NMRwQr69kUPqCbDZcve4+EDUEWgJKBVvg7fIefJAmKH5J+
 ukG1otkwBPWU+OoNIqly2M64c24lDYPKnjCWI0oXkkxpARLxPJelhRg7troyC3CK+zoV
 zlaOjsVLaZbReKQZTMxS2liKh97B3aF8FesfHC2Fkz9fkGkQb1BusyHEWdavQSO1G2G1
 aB9ry4Yb8C5BXiw10VKfrgiL6FTxUXzTnaO0PdiTRhgSPv3DounNF4th5lfe4ZAsRPhe
 m1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqLRxvMmqILCLzIsTlGbC4llYBLLqdGwC3gVHSsdlAY=;
 b=nhj2anyV9hBCPB7VOAxZweO5VFZxjD3pnuMg8gYfqCdauTz5Vg6pBO9hOtGks0/JKI
 gri6hFbPbwBxk6HwN5iiI43KBaW33i47HyMfkiqAYYLPnlcNEhGayf2yqN/FPO9DNLKj
 K8a8VdI/qkAAaiZZLb28kg6jN9G5pYsFev82tV84o1j3s4jZ1acnTSvQsMh5VKRZkC1L
 6EPrtuedRKcjN5LGsbXxiivWKXvKqMqkVzRbnfzGrpF6YqRK32iP/3A/2I+21/P3oJCN
 tWlNnO9tcaofwk8kW01doDln3t+Y8OFkwKqEz3GDqqyxo173B+vEXiN1xAb8YHxrQyro
 k65w==
X-Gm-Message-State: AGi0Pub6IKzI1ZOnFcIxS/fikD0bazUTvXPs6kSFzv8cI6tWeyNq9eVR
 464vfmlM0sMuqkTO4mjBUyaIqy9h3r/rPAd+/vs=
X-Google-Smtp-Source: APiQypKOU/Rd8sG8437lj8j+RkUwRZ/eidY0aY3ImsSTCM9cZAif57CmdDRBPlSXBebCYX8Hj7ohdNcq9ejB8BZfCRQ=
X-Received: by 2002:adf:fa91:: with SMTP id h17mr25463264wrr.111.1589298841655; 
 Tue, 12 May 2020 08:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200512124806.195856-1-colin.king@canonical.com>
In-Reply-To: <20200512124806.195856-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 11:53:50 -0400
Message-ID: <CADnq5_PPLtqWPtE9LTEz3j333EyqSQ1Y-0p_7YR=cLAEmu7Now@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: remove redundant assignment to variable
 ret
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 8:48 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initializeed with a value that is never read
> and it is being updated later with a new value. The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 90610b4f2c75..e9e59bc68c9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -441,7 +441,7 @@ int amdgpu_xgmi_set_pstate(struct amdgpu_device *adev, int pstate)
>
>  int amdgpu_xgmi_update_topology(struct amdgpu_hive_info *hive, struct amdgpu_device *adev)
>  {
> -       int ret = -EINVAL;
> +       int ret;
>
>         /* Each psp need to set the latest topology */
>         ret = psp_xgmi_set_topology_info(&adev->psp,
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
