Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DE375DDE
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 02:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F33A6E12D;
	Fri,  7 May 2021 00:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1576E120;
 Fri,  7 May 2021 00:19:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d11so7361141wrw.8;
 Thu, 06 May 2021 17:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Ly8LRPF0H1aWdKEb+5WRQF77SY7lze0cxVlaDbFegM=;
 b=Vifuxsq8ikahBtP4UaxvPzuwVbrtZJO8ayF/h1nNURzvnZdT8RPR598yvD2VRY86DC
 2dIgcOeWx45v5fLlZFs3uEqbpxUX2BWPvhu1YtNokLX3Cuov1UBRAHZxlN04hg3sY6nl
 0gFrYDP8GjGLvQ4CfaAiebk3uugXlJbho7TmenFZqi9pElZKW0Qr15ybfTpFsHb5eu70
 devYrpJDnGEXZzRW9HaJCaHSnfJuAYdhfGqwikoIBScINq5f4M7e7LxIvw7ViEpm67s4
 rlrOSNGVoH+Zvq23nUWnjHCRZsOM1MeYbAvJO4lo/zI2sm1tC1v37TQIFvcJBmANzYW2
 nR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Ly8LRPF0H1aWdKEb+5WRQF77SY7lze0cxVlaDbFegM=;
 b=ne27r1QEKTA0g4sftvPSHoElvT0jnG279xwE2XIhWloYZtj5LVO62OIxRL+5GgGPNZ
 yiBiGeYvnfGKedigKHgqRvj4bTMUpG3dkpDDXqu6TA+fq9g/ehU+1NEzE0mO739nEvfc
 aE2eIeI04pHKeTn9W9hrYvzomEVqyXP/0tmWHNfHjSijLDcXReWnL9tbnRhhY5VTSP5F
 NppeCkZH9odotmvqp/RwGaO0wT/MbZ3TULlpjHRgx2GRjyc57sWRnjgnhetDGcD+Y/i9
 k8sixc8ybU+Gv0/CarEgNX9xGsPINkJ0HXjEEzl2pqfAwz31m+7OyxHL3i+6m+KwDkCg
 rjuw==
X-Gm-Message-State: AOAM5313Crksae+EU9UvtxrRK8O4XoZdO5nY4jyMCR0xMscEvDCsnoF2
 qMZfw66DTo8N3vnQVDOhnpI37KT2Tyn4ZOkqcmE=
X-Google-Smtp-Source: ABdhPJwApwq00cS0zUI9fX5pkWZKlLTrCmBiM6HCuq5FMtpKcHyw3B+qomvmNznEzUh2vYSRLKLwyBvpWhWLWX4hTgg=
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr8260301wri.327.1620346791614; 
 Thu, 06 May 2021 17:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
In-Reply-To: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 6 May 2021 17:23:32 -0700
Message-ID: <CAF6AEGvJEThHFvMt34fAnOVhHkHxwtDyC8=g3CFEd16A4p8W8g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] check sink_count before update is_connected status
To: Kuogee Hsieh <khsieh@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, aravindh@codeaurora.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 4:38 PM Kuogee Hsieh <khsieh@codeaurora.org> wrote:
>
> 1) check sink_count before update is_connected status
> 2) initialize audio_comp when audio starts
> 3) check main link status before start aux read
> 4) dp_link_parse_sink_count() return immediately if aux read failed
>
> Kuogee Hsieh (4):
>   drm/msm/dp: check sink_count before update is_connected status
>   drm/msm/dp: initialize audio_comp when audio starts
>   drm/msm/dp: check main link status before start aux read
>   drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read
>     failed

I've picked up these two in msm-next for an upcoming -fixes pull req:

  drm/msm/dp: initialize audio_comp when audio starts
  drm/msm/dp: check sink_count before update is_connected status

BR,
-R


>
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  1 +
>  drivers/gpu/drm/msm/dp/dp_aux.c     |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_link.c    | 20 ++++++++++++++-----
>  5 files changed, 48 insertions(+), 17 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
