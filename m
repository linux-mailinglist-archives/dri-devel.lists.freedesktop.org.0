Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8123E2FFE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 21:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8D6EC27;
	Fri,  6 Aug 2021 19:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DF46EC1C;
 Fri,  6 Aug 2021 19:58:27 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 f20-20020a9d6c140000b02904bb9756274cso10199951otq.6; 
 Fri, 06 Aug 2021 12:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=44uVScQ9Gw/XAJ45c0vruto85d4GkUi4W4Jmj+tsVH8=;
 b=UlGtN2N+/E7iiZYxJKvzovkSO19giQwJd+k/KHky2IbaJkpv1Uak4W1uJn6H8BFiiU
 G+xiGSKGeR+7ThNnHhDMmpUIROTHWo5oXjIWRUmY1IlldNyqs4V6G/GWO3ysIoNqa/wh
 vZAarLxtlCu5ja19o3NIDmGyWxIf19NLbIbmwNmasbzJMDcsvWFSFYCy2+ClNx8Ih4Ok
 UNa5v/n7S/SzlZ9icFqH6a/jd+XiAssHlSLipwEbvxLmhNu2dvEgmGmd3HVhMjzgP6kz
 zIcc9/unMPkbQvBMHMGRoAJ9tPRVbr85crNJUdz8tSqqO9veN61s/GoH2EoQWrkESm3B
 0E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44uVScQ9Gw/XAJ45c0vruto85d4GkUi4W4Jmj+tsVH8=;
 b=fWQHIgyAc+1S9ZKlTzKpzK2hDfRhmyU/obButwU0x9DQFPsqg3UYiRaveG5Dq/2ZYc
 +DGDmOxaEuzmCAKU2PlhD80VLTMAxMQzSgeSUX7wxz5Xk2J8Y9JgyNlsg25bCLghyL9R
 iPNJKCcK/thg4OGkfWnwEnPAtLyfBQz/SdSfXHbQBuj4NTmqBTsoUATJzYRlxj3PTmDF
 JD/axjNeEzAIGC3z/ar6up3LoDvsEA4VNKHlTZhLS8htjHqTOHi8wwtdm76C485TtK4/
 YuzhDTjAzkuiDPkkH1TJC4mTCpN2H8Mu/S+S6B6vinptAGsIlituZzF3rRjCMvcLO/bm
 qJsA==
X-Gm-Message-State: AOAM530JKgEeNnQEpvLrnQ8Dan3m3dQy1xmH75xrAC3pcO+VM2gVFEss
 HxbWwMvNz/IKVqsSPc7j8+QBL+DXW0ZyTHRqLw8=
X-Google-Smtp-Source: ABdhPJzE0kiTi3tio0eqHLhmqmarjNSaTtD71nxdFJt5HsgC+bAt6RW84ZuEyZFn6YnA0ktX645N1rir1CpUrop9OAI=
X-Received: by 2002:a9d:5a15:: with SMTP id v21mr7881368oth.132.1628279906863; 
 Fri, 06 Aug 2021 12:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210806111615.11803-1-colin.king@canonical.com>
In-Reply-To: <20210806111615.11803-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Aug 2021 15:58:15 -0400
Message-ID: <CADnq5_Nh57mfc+aXCGxy9+V2DFCEH0wO0Lcj1B9Qk93otY_t3w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove redundant initialization of
 variable eng_id
To: Colin King <colin.king@canonical.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jun Lei <Jun.Lei@amd.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Aug 6, 2021 at 7:16 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable eng_id is being initialized with a value that is never
> read, it is being re-assigned on the next statment. The assignment
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> index 1a89d565c92e..de80a9ea4cfa 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> @@ -305,7 +305,7 @@ struct link_encoder *link_enc_cfg_get_next_avail_link_enc(
>         const struct dc_state *state)
>  {
>         struct link_encoder *link_enc = NULL;
> -       enum engine_id eng_id = ENGINE_ID_UNKNOWN;
> +       enum engine_id eng_id;
>
>         eng_id = find_first_avail_link_enc(dc->ctx, state);
>         if (eng_id != ENGINE_ID_UNKNOWN)
> --
> 2.31.1
>
