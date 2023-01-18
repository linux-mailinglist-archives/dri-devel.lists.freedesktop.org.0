Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097B671006
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 02:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8168010E629;
	Wed, 18 Jan 2023 01:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33E710E629
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:30:23 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qx13so21318767ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZsCFqOrG564I8qOCCNQEkJcGVuvtlZxy5WMlNbN2xTQ=;
 b=J/iw0UUSt0Hxy+ZF7az331KZS8tNT51v8K0+HIEnf/j3/rgclEK3DeD5k631Ylnnh6
 IImUR2u+k689o7Vk1hKFLO6XUSmkaUJN917cvkwHXG+2h37tPUY9rZImOwfW6KFELLse
 pWQzIYSB5rCpLuwKIib3hGv6AtMXQfF8I97TlpgiHuZF9VNrCX5PVFH38j3LR5lHnSqT
 zVSEBikljdLZE0m7JTpJKuUkqohd4TzbaRPPBrRbFsXb2SFrfI9LzBNLG5Qyi14YnElU
 6iSkaVLDlviYqgys3zpTruqYl+snh9F3Ak/aBCCvS9qaFMyJHAb3dSq+NJx+kZAeR6G5
 hxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsCFqOrG564I8qOCCNQEkJcGVuvtlZxy5WMlNbN2xTQ=;
 b=i+xFJSBISVmpZ+xLmbrdLf0zMVVmWnP18MAJXMBD2nhNIx+Cg3VCvCo5086aafj07e
 3FtSbwEZW1k4GZmWm9Uztctwjb9qS9uHdrJ+OEkt5wgD8U4iTVjbAHGloQWRojPwDShM
 uaklsz2H6uiHBQeBBrReGkLTRdXFOOIoiexVTLsEAFOXGEx5fXQEZxBU/x3ahl7G6frK
 nFtDoixnPu+igbNrBnUxdzUtR3Qtzk6Ry/h2w51bgUVXgR/fTXCIRwrhh1E9fuA02o25
 UPCKvn8gEa9blgpH8td1+fu8q4wyLPkMeZAQ4LHGO4LSPxURNCC9IAF3+TluX0h2KKPC
 5RqQ==
X-Gm-Message-State: AFqh2krxGfBF35+Ut6IQJRvIMviDYBfJcI1rFTFyM6CULH4WMjxRrknV
 AprhPNZpCjTWW3YBjw2ttyfvWA==
X-Google-Smtp-Source: AMrXdXuNF0GjFG6ixd7G1diTN5Er9+WUrN8dZPYP7bvFYKP5CRCYSqQLOMmPTPLMSoGQT2lpuFXusg==
X-Received: by 2002:a17:906:fb16:b0:7c1:6d65:4718 with SMTP id
 lz22-20020a170906fb1600b007c16d654718mr5177733ejb.33.1674005422383; 
 Tue, 17 Jan 2023 17:30:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ky25-20020a170907779900b00877596d4eadsm110552ejc.101.2023.01.17.17.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:30:22 -0800 (PST)
Message-ID: <82ef3c2a-ef54-8c39-2266-7e3b203f92d1@linaro.org>
Date: Wed, 18 Jan 2023 03:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] drm/msm/dpu: Disallow unallocated resources to be
 returned
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20230109231556.344977-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109231556.344977-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2023 01:15, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks, until their allocation/assignment is being sanity-checked in
> "drm/msm/dpu: Reject topologies for which no DSC blocks are available")
> remain NULL but will still be returned out of
> dpu_rm_get_assigned_resources, where the caller expects to get an array
> containing num_blks valid pointers (but instead gets these NULLs).
> 
> To prevent this from happening, where null-pointer dereferences
> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> increase past NULL blocks and will print an error and break instead.
> After all, max_blks represents the static size of the maximum number of
> blocks whereas the actual amount varies per platform.
> 
> ^1: which can happen after a git rebase ended up moving additions to
> _dpu_cfg to a different struct which has the same patch context.
> 
> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> 
> Changes since v2:
> - Dropped all 7 other patches that were queued for -next;
> - Reworded error message to clarify that the requested resource should
>    have already been allocated, rather than sounding like
>    dpu_rm_get_assigned_resources is (re)allocating/(re)assigning
>    resources here;
> - This patch is now (implicitly!) based after "drm/msm/dpu: Reject
>    topologies for which no DSC blocks are available", which should make
>    it impossible to reach this condition, making it more of a safeguard
>    in case of future code changes and/or hidden issues: and is more
>    clearly conveyed in the patch message as well.
> 
> v2: https://lore.kernel.org/linux-arm-msm/20221221231943.1961117-5-marijn.suijten@somainline.org/
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

