Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76F6A6669
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 04:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6132510E0C4;
	Wed,  1 Mar 2023 03:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E72410E0C4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 03:21:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j11so227126lfg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 19:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tnkIfcOj9UUowRdMsG+mzaeiNEjduadTcoKQ2pmIVLo=;
 b=puIGq/gTBfW1Oh7F22B1UErkiWmp6tUYTzYW3EAYlK7cPWCpO/9iC9s9qBybpthYWs
 ByG758HNwOM9SIHlbA8dGkrMZwNARtTNfWhO43tcyECmiNy1SZd1Q2rqNA+SH3zP5MFV
 CI3VVbPp2VQMeNkWxI2bKESeOC53lh4NfJ/0lnkjRy0nI8JkUFykvY8Ju5xg2rG9G2YN
 ntmSCTOvkCtgAQuEndu5qwfXDb0USPzSPpVfgQJj/lhJL/xYPPJKR5ru3wknNrCJATXd
 iNP7/z4Rq4fSfG3rsYPbMaokfr293G2lwzLyjkHiBxkBQxKZm5RR0vgYISBb4p3txHyW
 gJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tnkIfcOj9UUowRdMsG+mzaeiNEjduadTcoKQ2pmIVLo=;
 b=Cd/LH8FPbxK0CY8Bs/4vj3dGFSBP7y3Kc47Oqx6ArIp+YNQAwEZnwWb62dqjplTRX5
 mWgnloZ9ot5dOyB0BDQYbWZJb8QAut7F9haLFCgTkrPpSxT2NMhULXXkC5/4LA3oPSrn
 ZTpaJvkaiNaInOiycyA/z3NVupyruAPnoyr0DwHQFFJdDBpCwalEARZjz/nK8gDMUipu
 McocQcyHxcpgp96VxlNY8HA/GZC35GkWN4kowOubB7PcBkTrQozRdSolvrT1lXEGgs9B
 xN7Uu4IKFqb9RmFeC9MuNjuzXIQ+hwF/IDySCUeHVxiqiEHGexCkfLpnaJSh3cfRuBoy
 TNCw==
X-Gm-Message-State: AO0yUKVKqerwePWVCdlUUsVHQh3l0RAADylZBs4F6OhpeGzE6Uf9l2GS
 Q1RaSbxOD8yzExCa2v+u+9kxAQ==
X-Google-Smtp-Source: AK7set8zuq+rYK+aoj/9FhA+X5WzH3P9J4TAkzfAazBr/p0EpDzOQN+/LF4ckgteLQu3N+DgCBPafg==
X-Received: by 2002:ac2:52a3:0:b0:4de:48a9:d622 with SMTP id
 r3-20020ac252a3000000b004de48a9d622mr1181947lfm.63.1677640902709; 
 Tue, 28 Feb 2023 19:21:42 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac241c1000000b004dd7ddc696esm1549454lfi.293.2023.02.28.19.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 19:21:41 -0800 (PST)
Message-ID: <f8f05dbe-c47e-5a0c-bd93-c844fc5cde4c@linaro.org>
Date: Wed, 1 Mar 2023 05:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230221184256.1436-2-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/02/2023 20:42, Jessica Zhang wrote:
> Currently, DPU will enable TE during prepare_commit(). However, this
> will cause a crash and reboot to sahara when trying to read/write to
> register in get_autorefresh_config(), because the core clock rates
> aren't set at that time.
> 
> This used to work because phys_enc->hw_pp is only initialized in mode
> set [1], so the first prepare_commit() will return before any register
> read/write as hw_pp would be NULL.
> 
> However, when we try to implement support for INTF TE, we will run into
> the clock issue described above as hw_intf will *not* be NULL on the
> first prepare_commit(). This is because the initialization of
> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
> 
> To avoid this issue, let's enable TE during prepare_for_kickoff()
> instead as the core clock rates are guaranteed to be set then.
> 
> Depends on: "Implement tearcheck support on INTF block" [3]
> 
> Changes in V3:
> - Added function prototypes
> - Reordered function definitions to make change more legible
> - Removed prepare_commit() function from dpu_encoder_phys_cmd
> 
> Changes in V4:
> - Reworded commit message to be more specific
> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> [3] https://patchwork.freedesktop.org/series/112332/
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

