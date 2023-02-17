Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B75B69B382
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F164810E456;
	Fri, 17 Feb 2023 20:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707E210F0A5;
 Fri, 17 Feb 2023 20:08:26 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-171873034c3so2412410fac.12; 
 Fri, 17 Feb 2023 12:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xtVHaFcLaV3UoWU9Nhrzhuzu3cPVZ3Sq7osbDb6HaUs=;
 b=IPET/YQD1zt2dKuCNYeXspwZF2Mdwqbqvp6ACWfPk25cSLErwYndHB+GX2X0Qla1hX
 fBbp89RuZ0GV0uVotYv1TQCYpQuqcn7P7/jVvVFmD6sMI2Cab3XOQsljDpuTu+LfzR6x
 DzFrUJpWtPQu60hlPmIW8yjt/aMA/SU0TaoM/j45BPzTRMc4AIX5QyWmjcF6cwo4JUzt
 ktwN2AIMDhrMhJsSKbI+dJ2brt/v6jyOciKjWkJA6LIEb3rNnKbiTSLWe9MRMyAMvnQO
 1WWK3nYYo/D8SKzSMRnY16XWUjwBI0XB1vlLr3q59+T8B4C7crvQr4ZEZ33HMm+7d+Cg
 KxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtVHaFcLaV3UoWU9Nhrzhuzu3cPVZ3Sq7osbDb6HaUs=;
 b=XCLDiymwCRJDT9zNfoyAc22MpyWUptBuHdgs7QMRwZBOn4Zb9d1FeNzREfCufyl5Y4
 5Kif1cHE+OP+M3gfBD2Yuq4MbDfJS/CtSFkaNZau5pA6NzF4pMAkoQQWoBewV33zNnC1
 O48ceojDZgdTrIrvLtuh6O3QNNfERH1WEeoLrm7Vt4ldmQf7NKfov3lIBuyC3xbH9+2e
 AtrB0aScTc+Uq+kDBz6msEkOTLwsSDk5XePPnkUxePtloPcMsHCznxdkh7rME3K38Y0j
 u8sRCFO6cPymyuJazKu8VnxvQ+FpK+xW4inZvc0qTQxINjAxv74OdOZXcZhrEzP54SF/
 no3A==
X-Gm-Message-State: AO0yUKWXpG79fJJxJ/rxah1Jh+FbGQD7+npZBbLzeAUFyv7AKpeuIxse
 ckWgogaMXul3NsqV+c4ozaCHfQndPrAsKOsdyK4=
X-Google-Smtp-Source: AK7set/i5lu6BZPRg5UK2Qdn96F60bY6LFITBSPWXluDBI6/WklEXoQKB5+25LAr9DM+nIdzVW6lL6rAX4Dpd/7oD0o=
X-Received: by 2002:a05:6870:e88d:b0:16e:91ef:75a0 with SMTP id
 q13-20020a056870e88d00b0016e91ef75a0mr370672oan.138.1676664505561; Fri, 17
 Feb 2023 12:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20230217074449.14594-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230217074449.14594-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Feb 2023 15:08:14 -0500
Message-ID: <CADnq5_MX-fdkqseNuP+Ej6WZ5-FmowWosY-nb2kwEhqxMP-PoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Modify mismatched function name
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Feb 17, 2023 at 2:46 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1199: warning: expecting prototype for dc_link_detect_connection_type(). Prototype was for link_detect_connection_type() instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4103
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 38216c789d77..5394d8a6087a 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1189,7 +1189,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>  }
>
>  /**
> - * dc_link_detect_connection_type() - Determine if there is a sink connected
> + * link_detect_connection_type() - Determine if there is a sink connected
>   *
>   * @type: Returned connection type
>   * Does not detect downstream devices, such as MST sinks
> --
> 2.20.1.7.g153144c
>
