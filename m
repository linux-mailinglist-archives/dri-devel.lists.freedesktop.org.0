Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971856D4D62
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F4110E4FD;
	Mon,  3 Apr 2023 16:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD30310E50F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:18:20 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bi9so38766429lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680538698;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+mXE+LsKS7w58ofo+TThv1QNk3ptIYcwRlDn4y/JXOw=;
 b=Ab2s2zc6kt+PUJGEdq78Ow/02BEc/9oD9n2Xl7cIqVo7a1xrDEwrCt67kiZYk97GsC
 F+/Y0juFg0xv0FMkANyGrYwv5v/UuA49IyqNwWAgn2LvqtNpRst1REMOmNsw7l0V9e2n
 pGSTiC+7OMRkRksOL4vyuNQHFc4BgTPGFfJKm9AsPtao/aoUhIb4/0Wo21o47wvI+Npt
 QySnsfTAsMd0X0Mx86OZfuccSzsDvg0/6Jnb5QDXzc3Bp0G7DAJUUQ8Sy4l2aZ6hGG8I
 sfeCzoa+rl8VkSrdRVRSidBvKKBnGfchDe5DK3hmgOsuORkD52v+pJvT7tIcSfltzrnn
 pzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680538698;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+mXE+LsKS7w58ofo+TThv1QNk3ptIYcwRlDn4y/JXOw=;
 b=OvTThJp0h6mr7Gdu9tsewUT1vPhzKnHqP9ttxl7BFklqcgBLMjhlOWbHWZyku/qliH
 LY4Vn4ex139QMWMgp9ydd7aidhONBp31jQxMlPOTSatyfu/pRtstfoBKzLr8XaaN59k+
 ZJGM+gulNMZtzCw2BFrkM88ft0ZAUhqGjedSYZ09d1N+aJpFA/xD6gvBplT8Kll6han4
 hjwU9xdRmkxSV47j5UFCON0Wo+Ze1lcBgQHf60KdCAgDT6SE4vdoLyaFuEjObdTZI9yg
 Af5H1CiE7zXpAKvSSnKlc3LGMNZlSHrl1lCarFVAgiPFd00aEfvmxp/DDkCjLMkIGiJy
 ObnA==
X-Gm-Message-State: AAQBX9dPjGmZhd3ul4mRATyR5beSsYO4J615jxeZA94eDTrFE2+vMDCm
 Zz1h5i8g1JKY+A+ij2cgzkJ+Cg==
X-Google-Smtp-Source: AKy350bvNo7tfrCyjtYJUYqPuZYVN4n4KKpm6N6lDY1dyQfZedAAVlr9435poDXIfEBaCxiLIx6OhA==
X-Received: by 2002:a05:6512:951:b0:4e9:609f:256d with SMTP id
 u17-20020a056512095100b004e9609f256dmr9317327lft.13.1680538698581; 
 Mon, 03 Apr 2023 09:18:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u23-20020ac24c37000000b004d291dcee7fsm1842094lfq.55.2023.04.03.09.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:18:18 -0700 (PDT)
Message-ID: <3b41077b-3482-db89-de31-c41cf6429216@linaro.org>
Date: Mon, 3 Apr 2023 19:18:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while in self
 refresh mode
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
In-Reply-To: <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 17:45, Dmitry Baryshkov wrote:
> On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>>
>> While in virtual terminal mode with PSR enabled, there will be
>> no atomic commits triggered without dirty_fb being set. This
>> will create a notion of no screen update. Allow atomic commit
>> when dirty_fb ioctl is issued, so that it can trigger a PSR exit
>> and shows update on the screen.
> 
> Will this impact non-VT workloads? If I remember correctly, we added
> dirty_fb handling to prevent the framework from limiting the page
> flips to vblank events (in DSI video mode).

Actually, this is kind of stupid. If we care about the workload of this 
pipe, then it is being updated, which means it is not in SR mode, 
self_refresh_active = false.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>
>> Reported-by: Bjorn Andersson <andersson@kernel.org>
>> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index ab636da..96f645e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1158,6 +1158,9 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>>          struct drm_crtc *crtc = cstate->crtc;
>>          struct drm_encoder *encoder;
>>
>> +       if (cstate->self_refresh_active)
>> +               return true;
>> +
>>          drm_for_each_encoder_mask (encoder, crtc->dev, cstate->encoder_mask) {
>>                  if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
>>                          return true;
>> --
>> 2.7.4
>>
> 
> 

-- 
With best wishes
Dmitry

