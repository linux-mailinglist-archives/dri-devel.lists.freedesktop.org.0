Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B3332F2B6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C286E288;
	Fri,  5 Mar 2021 18:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBDD6EBFF;
 Fri,  5 Mar 2021 18:36:00 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id w3so2717980oti.8;
 Fri, 05 Mar 2021 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ov2Ty9Jb6QsriK8+bSn7UGp92CXVSd8s3dKNA/YGByM=;
 b=FEIB07sKgIB6pNFXSaohr2gQW8avxTQUntOULApdNkgbd+Ai01qcSjGioPm54JbPRr
 7f058sKm+gcT+ugGsorEJ0zqgPKY6giQ1w0XpfhPwGIV1N+3k5LdzWZZXjj1y1ILiVzV
 NFqBEAnNcurZih0+vhn39JfiQ5ikxV7I+UO6IQNxqe2aZGSxYbaje6BIP036nlwu1uTC
 TEv8ib8TheBO3RB68SaBTV7Ayh4x+EnzJ1Q1fyCt6rzcucE1cJBSl1asmWUcbd0fJvih
 uH6RZePFrj2glSnyVgzyYgmJ5E7Tp5nuprDZqEaPNXwJ7WXY0ZJNy+Ie+TkoqtIpijE7
 hngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ov2Ty9Jb6QsriK8+bSn7UGp92CXVSd8s3dKNA/YGByM=;
 b=hCPgk/eLG5tSAAbuPAU0U8wBG5YamvyVRp+KaM7D6kxMkDn/oXWpwG4u6Dbg+FQt2R
 CIYaMzaaI7yUn63OLRAkKt5nfVPHAeNCmB/alst1Y6kSaV+7E2O/H8Up++c0OlZom14M
 n3DpDHtcaFL6wyBzXfDAVB4BJvkQnkGbfQ3Z36/FMdKuFtTEX/MBJRPmFewfED1s5t6D
 couyGfvqa1oxzdkjOLJc4nTgeGWarEUSJZfO96xHpXBnY6+jZ9V8ok2CW19ttA/Gf1zj
 AWxymZhlq4Pn4c6RKaGwlYV7p4jt5UUIdBiE5FUrI2nvIag2s9RCrvvpbMv4n7Z3YFFF
 W84Q==
X-Gm-Message-State: AOAM531o0ulhXDMBP6EWLmnCjTYlwqK31aSVeTl97io4LMlhmdnNEo1y
 ufY0AT4y6KPAoNqLbhaxo+i4BGdUMsqpO8Op4To=
X-Google-Smtp-Source: ABdhPJxFf6nv2FH82CK1HXBYD8T5HDnBWPh/i/e6LCm06m+gPtmqee8/OuGxHYrCcBw8WC0v4zeFycmPwzLSzjgIdpI=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr9528500ott.132.1614969360161; 
 Fri, 05 Mar 2021 10:36:00 -0800 (PST)
MIME-Version: 1.0
References: <1614844895-85184-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1614844895-85184-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Mar 2021 13:35:48 -0500
Message-ID: <CADnq5_MhR+Hhg9C4PvEAushxr_gpNqyQzwa-6R1mcYTpA96wtw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: Remove unnecessary conversion to bool
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Mar 4, 2021 at 3:02 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:956:52-57: WARNING:
> conversion to bool not needed here.
>
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8311:16-21: WARNING:
> conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3e1fd1e..0e6b7415 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -953,7 +953,7 @@ static void event_mall_stutter(struct work_struct *work)
>
>
>         dc_allow_idle_optimizations(
> -               dm->dc, dm->active_vblank_irq_count == 0 ? true : false);
> +               dm->dc, dm->active_vblank_irq_count == 0);
>
>         DRM_DEBUG_DRIVER("Allow idle optimizations (MALL): %d\n", dm->active_vblank_irq_count == 0);
>
> @@ -8307,8 +8307,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>                         hdcp_update_display(
>                                 adev->dm.hdcp_workqueue, aconnector->dc_link->link_index, aconnector,
>                                 new_con_state->hdcp_content_type,
> -                               new_con_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED ? true
> -                                                                                                        : false);
> +                               new_con_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED);
>         }
>  #endif
>
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
