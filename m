Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 738A255E55C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23AC10E771;
	Tue, 28 Jun 2022 14:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0AD10E771;
 Tue, 28 Jun 2022 14:36:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id d2so14468840ejy.1;
 Tue, 28 Jun 2022 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sciSoRCJP9tmgG43WFiyHgQnQbIDAWhG9JNH7sehjOg=;
 b=LNdkm2CNmCjn5xV828HqDI0l3owRABoKkDSiWA7l8+mfB2EnovxirwQ4PclXBHSjo5
 X1iYRhkmChyihhXYfaVsVWzPJxIrUBewxBVl+pDqChSu1zlYrP7TrOvI26CJGhTkdp3j
 ocoBkCLO262zGyz2hP9A9gO6AWXpyYNTiF2iiMRUkC0majwM62NZz0l+RrM8y4Wg57D8
 Ct5kwwDf49gYFOq4zRQbrsovY4fdKWn8bUGpvPMcgYUwfQeVdAo3IssTzXJ/y2msJ3Nb
 2KxDKWS3UxmAHGyCYrMf4BM/dTY6zGfFJEIm3xc0JvKfK6A+eX0u1JoVCVN36uht+15l
 TslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sciSoRCJP9tmgG43WFiyHgQnQbIDAWhG9JNH7sehjOg=;
 b=dq68ImAnt2cvI906XfB43jyrnUdR+PSiNnOKe03CCR8ARQUfxiHJkD5bLh6PMj9AY8
 026yXBgZZEwSG3TMMv3/dAZbVuHD3FGQfPPLPxxhNiQd2OHDxXYJVdrOSR1z7bSFOR+W
 eBwPrIO+aAVfM436xOB5nzDqbG4qv1jm3aNfhg9FLrb1lbCtbLBN68kbMtOvfNQi3lWS
 l9qk4tzY4rulrkyd44zd+DT8nEbqmmvgktJ9RDM1OcHiwzHedQaK3GdIigEq+B2hikb7
 wLHZnVfw4sWs6EbA7RwxXfeG0uSDgWakU1XxBzH9Howjb7bpyMAZtEZu+3EpiEATJ3qt
 yIlg==
X-Gm-Message-State: AJIora9cW9Soc6zPkXNowmFpGVFUdyjNILInqOP6ASxMHj08+/W40V6l
 CyjbFb4sfKV0o8xWxqR3N+PM1rJOL2Due+M7E2s=
X-Google-Smtp-Source: AGRyM1sfDVLE/mwWgB0QAtpx/HKLbEABP8/5Q/zeZSDF33rzwMvDpmwCLCKrNziaUCKnyksiRGhPYaXbhcB1kJ/6rZI=
X-Received: by 2002:a17:906:74c2:b0:722:e1e2:edea with SMTP id
 z2-20020a17090674c200b00722e1e2edeamr18426813ejl.658.1656427008994; Tue, 28
 Jun 2022 07:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org>
 <3a54b73b6cbd251d3d5a899b9cfe8b794be78146.1656409369.git.mchehab@kernel.org>
In-Reply-To: <3a54b73b6cbd251d3d5a899b9cfe8b794be78146.1656409369.git.mchehab@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jun 2022 10:36:37 -0400
Message-ID: <CADnq5_NEB_FRwXaQ4vYK4oTHGCTCXLLwwqsjNSWmesQYQ_Y5UA@mail.gmail.com>
Subject: Re: [PATCH 09/22] drm: amdgpu: amdgpu_dm: fix kernel-doc markups
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jude Shih <shenshih@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Shirish S <shirish.s@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jun 28, 2022 at 5:46 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> There are 4 undocumented fields at struct amdgpu_display_manager.
>
> Add documentation for them, fixing those warnings:
>
>         drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'dmub_outbox_params' not described in 'amdgpu_display_manager'
>         drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'num_of_edps' not described in 'amdgpu_display_manager'
>         drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'disable_hpd_irq' not described in 'amdgpu_display_manager'
>         drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'dmub_aux_transfer_done' not described in 'amdgpu_display_manager'
>         drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'delayed_hpd_wq' not described in 'amdgpu_display_manager'
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 547fc1547977..73755b304299 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -242,6 +242,13 @@ struct hpd_rx_irq_offload_work {
>   * @force_timing_sync: set via debugfs. When set, indicates that all connected
>   *                    displays will be forced to synchronize.
>   * @dmcub_trace_event_en: enable dmcub trace events
> + * @dmub_outbox_params: DMUB Outbox parameters
> + * @num_of_edps: number of backlight eDPs
> + * @disable_hpd_irq: disables all HPD and HPD RX interrupt handling in the
> + *                  driver when true
> + * @dmub_aux_transfer_done: struct completion used to indicate when DMUB
> + *                         transfers are done
> + * @delayed_hpd_wq: work queue used to delay DMUB HPD work
>   */
>  struct amdgpu_display_manager {
>
> --
> 2.36.1
>
