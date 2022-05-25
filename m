Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7A533449
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 02:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1514110FBB2;
	Wed, 25 May 2022 00:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB2410FBB2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 00:27:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id w14so33443900lfl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 17:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZFNyhH2PA3ljDR5ctK4z4sd4lSPZnlCyP4REV9FrmG0=;
 b=atWef+0vCmx2JhZX3or/VLDUlzqQvaVadsgA7a2K6VVGhaF69s+puWkmzOaeg0+asP
 O1vbjspHUOIG2pAXNJuiSX+WrGw+bHTpwC9A+ov/SfFm1yYp1mh4oO5HU/qudPE+DYxp
 3+5zkA3cv6irqzWRwOaCYJJqZGcBnVKB4JMCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZFNyhH2PA3ljDR5ctK4z4sd4lSPZnlCyP4REV9FrmG0=;
 b=EhWxktoSr6l4hl8mNM9LjDot3B75qON+6KTmnnwgM223zMyq1PJbj7P3tRWt4c0irs
 a6xbeiXiJf0wiFK/pKNZTJ+MpDkSvHiKiMpw8E7T216K/iSCKbCHdPvEW8YQcG5RMuBS
 5Bin8JxlNfO+wuGpDxlv1S9xcy2WTQia2+7GlolPCtje+0igyU/XroJyr5aHUagH2dWb
 5+7qqmpV23TAv+BWeQHhGKe2HCD1tX5cv4OLP+vZGF3htT++dCn0S88e1rTBJynmFWGz
 5SvY3PzMLvoAF0BqvtleG0Mo/1K8GBRbLLS8GvgDuavB5rY73MSLq4AXKeL1De9rklCq
 OrAQ==
X-Gm-Message-State: AOAM531PDYa+WcMJAqE4qXqVbAKHUa2WKR8kmtnLJbUPEaNnFHmZXtz9
 ScwEMS3wzNlRQiWudMbz0TMuXcv4Mf6Sb7kXkWU=
X-Google-Smtp-Source: ABdhPJxkODU4mn39fo9EPu+Wj0OPZeXmbYpkTB6/9lnhev7v88+6RClkIRVGJc2vapm/wgeoY4ddLQ==
X-Received: by 2002:a05:6512:3b88:b0:478:5a4e:8c90 with SMTP id
 g8-20020a0565123b8800b004785a4e8c90mr15155534lfv.43.1653438461698; 
 Tue, 24 May 2022 17:27:41 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 u10-20020a2e844a000000b0024f3d1daebesm2794968ljh.70.2022.05.24.17.27.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 17:27:41 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 27so17801496ljw.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 17:27:41 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr15834745wry.513.1653438047238; Tue, 24
 May 2022 17:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com>
 <1653082028-10211-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-4-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 May 2022 17:20:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vc2zSTHTdneE4yCypg2SO_0xVsEx69BuArDAF3nzSfWA@mail.gmail.com>
Message-ID: <CAD=FV=Vc2zSTHTdneE4yCypg2SO_0xVsEx69BuArDAF3nzSfWA@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] drm/msm/dp: delete vdda regulator related
 functions from eDP/DP controller
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 20, 2022 at 2:27 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> @@ -101,11 +101,6 @@ struct dp_reg_entry {
>         int disable_load;
>  };
>
> -struct dp_regulator_cfg {
> -       int num;
> -       struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];

You forgot to delete the #define of DP_DEV_REGULATOR_MAX earlier in this file.

Other than that, this looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
