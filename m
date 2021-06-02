Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC95397EA4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 04:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086896EB57;
	Wed,  2 Jun 2021 02:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252726EB57;
 Wed,  2 Jun 2021 02:15:31 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so1177040otl.3; 
 Tue, 01 Jun 2021 19:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B8W7mQck0zs774kTbT+4Y+xlf8nCc+MK9JC+2lYg3zE=;
 b=qHJOGBXsNCjbuu1M9YqCpqq1RfvnCzeoKXJHOi7f50s8kzMuGq/2TH1aeim4YfVPWE
 WuGlRuf+7W5KDX9ImbTKpto3udXjuRr1brQa2rEoWKqe4fpX5Cl47XFstY+mlkgZdS4s
 bh6toS4Yhu18tWEFxLZp1RvD93zT8ur7rz/CeN7MxoX2S7GBkEGf/hANVq+9XCbFzuNI
 W8FEDkf2LU3OaVDXOVQdNIM38qWX6blvgojVE3chWCwP/Y7nHpcCzJnE5/XWbpJmuPq6
 wOF6rQUXREd+WaJAoF7YNCtzdVSTZtoMkyJDcZ4/othzCAmBg8g5HRw4SuOSUYAaNg3X
 aQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8W7mQck0zs774kTbT+4Y+xlf8nCc+MK9JC+2lYg3zE=;
 b=G/cSCFs/A5eJgvvGr+08NumhthKHEnQpGo5daHeHmwb5iPrWsT9LxYHxW6fUJC/Xd/
 jWNagaqbVi7zZQKHjg2WTv243j5UrRUw1xlmUvCj8unk0FVyBX2RcBLTbH+KnNHLXcWD
 nR40n5uSIQ5+zYiM9yCQeQ4b7cgoGVuGr9+pdgilEVgAch8e2pGEcWINfuZ/gQsFrBWa
 K9yyQi1TImWYc74lO+Us1C/eWMhKPz+v9z6y5aYXWoWJWJroh1AW0bgho8iDXgwj/g+k
 QDbcEhUWGWfvjmlaB4xipUi8By9l0Jtt6RTGcHx8TAopJhKrHPmEnYHZ0B0sIdR5rYb6
 68bw==
X-Gm-Message-State: AOAM530VRi/fsOfZolz5HNIQWGhaffkcBLpYWc2XooYLiRSPTsKi9mU5
 rMr7AtBOoLbeodbqEpdxmyY2+cF9zQm5YYJ93h5wBP7p
X-Google-Smtp-Source: ABdhPJzYlfRlP9uhCedE+PX9MiStThS6tMzO/MIxFMIq/6cuN1r9zaxs1LVhr62SBosE9437BvCp3d9x1Sn39n1ihp4=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr24935473otl.132.1622600130512; 
 Tue, 01 Jun 2021 19:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210601142055.4132163-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210601142055.4132163-1-zhengyongjun3@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jun 2021 22:15:19 -0400
Message-ID: <CADnq5_PoERXyB7f08X9uxZ-jQj6jw2_PpXxj2YFGJM=Z+iBFPQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: Remove unneeded semicolon
To: Zheng Yongjun <zhengyongjun3@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jun 1, 2021 at 10:07 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Remove unneeded semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/aldebaran.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
> index 65b1dca4b02e..148f6c3343ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
> @@ -227,7 +227,7 @@ static int aldebaran_mode2_restore_ip(struct amdgpu_device *adev)
>                         break;
>                 default:
>                         break;
> -               };
> +               }
>         }
>
>         /* Reinit NBIF block */
> --
> 2.25.1
>
