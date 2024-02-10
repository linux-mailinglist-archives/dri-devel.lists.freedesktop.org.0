Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42928506D7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 23:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B8810E7CC;
	Sat, 10 Feb 2024 22:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ozwKnS64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C05210E80A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 22:11:13 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc74897c01bso2025681276.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 14:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707603072; x=1708207872; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mN13Q1Ynkr1FhSTP7Ls2xJzRC/VEPpSD7Oksrz5dEso=;
 b=ozwKnS64S+x8B9Yt8OqGMMkhC191s1rrOd4+JwtF6ckkVrc+3qqYSBR6vXUW3dXaQd
 8zRvunxhq9y1DVxBoUU8TjGQwBdCHMqeqjT0ZewBuvlPOZylnUqj3bfYnPlMzhK9uPcF
 fJSpoq/kr1oajMKdJtzsnG/UHcXFKxUi8uRisoYPB+JzPF9PRmOj+SIgwsfA4tdocwch
 Ku+a5mgO6qIjtss4vcCrU5twBw5rP4GPw+bHzO+qY9Hp9jKlgs3sRxYzadFO8Cr8ZeCH
 HoIyAvEurEgCWIY2esrmTlFy93u5YjRaRfZSM5f4Y0T6L0fBDBT+9IcMw4rSAdkPbqwt
 TmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707603072; x=1708207872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mN13Q1Ynkr1FhSTP7Ls2xJzRC/VEPpSD7Oksrz5dEso=;
 b=xExonzbXzsr2HNOYKBgUmcnGE7gn1ynn60QfQyFILXPHh/mnZ4hjYvE2yjCXyaqOIs
 oTgdHzEd/YLyoisRdOCdSPHBPEfiH7J/Sch21CS8mtdG9GnypG0T2ZfKPlSUc9XCPMj3
 SBod+d7wDWX+rECGS10Uq8CEQiYXIFAZsY0aHT82JzRQGJLzigaGD8QoUiN6G8+S1woG
 fQ8n7QosQsLEHnQrC0pZEjbXteZbl+v+jF4G9qNTD6wyIoXVN+CME2z6fzOjMBmsY4lO
 OfL/ITvTRn4nNUz1Kroqg/cWhNI8qcppW3P8WX1x6cBlCJhnS1bgARxqjx2X/tBeUpFu
 sSOQ==
X-Gm-Message-State: AOJu0Yymm5PL7iXo6MbP9UrJxUTy76LsDVEtaZd+QKPwfW+PJsTfZZi+
 /FELSFV5BDB6Idifkgm/K2XzYDaDI1K7gNiYEZfLWCKRnorYx2vkibFlJrO4yrDnOvBa8F5v/cv
 y/cY/jwXvd2XKBCMBYNdzmuWXo2UoBnJjY+QCdA==
X-Google-Smtp-Source: AGHT+IHpK2Die0vgYTHSzxz8drNRMnn9+1bNzTrtYbLf0eiIdBlfuR9Q4GvrAghAnOa8AfmGg+NWSmQUoApZZPk0dbE=
X-Received: by 2002:a25:ef4b:0:b0:dc2:1f56:11e4 with SMTP id
 w11-20020a25ef4b000000b00dc21f5611e4mr2582230ybm.24.1707603072311; Sat, 10
 Feb 2024 14:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com>
 <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
 <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
In-Reply-To: <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Feb 2024 00:11:01 +0200
Message-ID: <CAA8EJpqE6BEvo1wwKMuSmR4a=VkGzRAuPk_Yw_imeYtTag+Hpg@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 23:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 2:16 AM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> DP controller can be setup to operate in either SDP update flush mode or
> >> peripheral flush mode based on the DP controller hardware version.
> >>
> >> Starting in DP v1.2, the hardware documents require the use of
> >> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
> >>
> >> In-line with this guidance, lets program the DP controller to use
> >> peripheral flush mode starting DP v1.2
> >>
> >> Changes in v2:
> >>          - Use the original dp_catalog_hw_revision() function to
> >>            correctly check the DP HW version
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
> >>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
> >>   4 files changed, 21 insertions(+)
> >>
>
> <Snip>
>
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> >> index 2983756c125cd..6ac66532b47a4 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >> @@ -102,6 +102,8 @@
> >>   #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
> >>   #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
> >>   #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> >> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
> >> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)
> >
> > Just one bit here, please.
> >
>
> hmm .... so the periph flush bits are 24:23 and we need a value of 3 to
> select peripheral flush which translates to 0x01800000.
>
> How do you suggest to break this up?

Then FIELD_PREP(something_mask, 3). Otherwise it is too easy to
consider it to be DP_MAINLINK_FLUSH_MODE_UPDATE_SDP | BIT(24)

>
> >>   #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
> >>
> >>   #define REG_DP_STATE_CTRL                      (0x00000004)
> >> --
> >> 2.39.2
> >>
> >
> >



-- 
With best wishes
Dmitry
