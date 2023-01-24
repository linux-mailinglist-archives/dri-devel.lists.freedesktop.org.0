Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCCA678CC6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 01:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBBF10E5DB;
	Tue, 24 Jan 2023 00:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB0B10E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 00:25:33 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id hw16so34890148ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G7azV8mbSSeyt8Js7wrZLKa1+/kmK6Rap/sxLxmd4/A=;
 b=MkWtqvokT3y3OxZ9xWiSo8e8CaMEpuWhKSd90x1uxrxsRVvM94Q13TudItsW9KIIKD
 ux+TC2QE18m0trIlAg1bKY6PpOfjcNM0sQ2Tv9z0iLHqHi9oR19N03Qvt0YYOccXWhch
 SAhlcUG5u6HH5z1rRB6JRUJTGjoFEOmCyzbevc1HkiEjwgt90V+qZs9rMsZnzZKFlkeC
 lGbltLg/da0WaEG3+pLENKKmy5/efw9YSZYkthfodPgAUC+0+cRBXhslzmW/2Ew4hbdn
 1u6Ez3ShB6LbwhA//ujfl7QNPInyyR27V5vbt02A7eOlzfD4cqbQ8E0FNUZ3yd00WeaQ
 vEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7azV8mbSSeyt8Js7wrZLKa1+/kmK6Rap/sxLxmd4/A=;
 b=kJNSwrKhGjpa/JfVeveh7kSREDf3gCFDnFldhbofqpvsMx13v5gO3oSa1oTtayQiO5
 3slucPD/W5i88XNCR2j1Joh2ZtLWNqloxw15rFNr6j/tolCyrmZkMMsd02qsB9fCSa2C
 wteS2vf82p4m5UMmZ3BTOyIOMGCdt4gWhRcQZAcvBASxcIRtUAjAaT55yDtGfI8d8pcv
 +9Ns+CIYcsgsq20wlZspgkdEMm4POaaOY087zAChopUekV+CwU3svbRCHuW35JkIzDWP
 kdY0FF3tQnSWmPHZ3tLaGyyPgBwMQiFXpol3v0kKt0bun/ylAWFRO/uZtLpvsrpZNV6u
 L7mQ==
X-Gm-Message-State: AFqh2kqfjpJ6KcfF5SJ48jjJPWtW8iOoUQ6I0O6J9CT7pcRtkZ+PXgQe
 qfJRjw+YyrbpCtt0SOCdzpU1Ng==
X-Google-Smtp-Source: AMrXdXvqd+Xz7JSf8QaqqzpNWgp9gXJU43HvNP7Q6yFBMUglk50HyFf5597Xw5m1Y/bsfj02MAn1Pw==
X-Received: by 2002:a17:906:804e:b0:86b:6a54:36e0 with SMTP id
 x14-20020a170906804e00b0086b6a5436e0mr25610962ejw.36.1674519932202; 
 Mon, 23 Jan 2023 16:25:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a1709067e5000b007aee7ca1199sm142840ejr.10.2023.01.23.16.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:25:31 -0800 (PST)
Message-ID: <84079c60-984a-1939-850d-23869c9ce5df@linaro.org>
Date: Tue, 24 Jan 2023 02:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH Resend v11 12/15] drm/msm/disp/dpu: wait for extra vsync
 till timing engine status is disabled
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
 <1674138393-475-13-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674138393-475-13-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 16:26, Vinod Polimera wrote:
> There can be a race between timing gen disable and vblank irq. The
> wait post timing gen disable may return early but intf disable sequence
> might not be completed. Ensure that, intf status is disabled before
> we retire the function.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

-- 
With best wishes
Dmitry

