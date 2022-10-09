Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B5D5F8D87
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2A910E53F;
	Sun,  9 Oct 2022 18:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D473610E53F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:54:50 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id j23so10986885lji.8
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HfHIwCu6ix9Kna+8PuTHr1cR5KLg2VwjNd612N/VBhk=;
 b=icnrUwOEYqqXpM7lGG58XUOx4f2Lfbh+szDyq/Oe6bhXj/POCjjfWnVv56wQN0iwsJ
 E6g1tPHS1qRwPYcYRhrBJ2Yxk1F+p+9FJK3NV/dtSPE05H37fPv7KlBx9pYr5hhzn2i7
 KHh1zgLVPLyORveVb5L0CmFIzIo/GE2OjHF96QOJRzKH7W2E2MgHYhghbtizM+z5Gw50
 Ivz/RRcDmG2BmoELfTXehCmSD6lD5ipKIPLIjVlHHPFpHhJ9b0aLqTwsX858zhDkixxx
 j7kk/FEInm/WizXGsyU3JE1SDukQxNXNxQRM5BGqUGwl3PQYuFBQnzwdoptCVfX40AaS
 R3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfHIwCu6ix9Kna+8PuTHr1cR5KLg2VwjNd612N/VBhk=;
 b=fzuuCs+1wAtG6TDpmdPdxzIfgGvFXmUeLI9g5I0PoDxtpY//2tu+lbHeb9la2tt6/u
 fafxkAAC4Hljgal0o66eTIiRyIdqxbv+zjd6mXDbQRQL0puxT5dl37xdvGI4lsCNiIVx
 kxGnzvUHpXgvrRMlq1oQKS3an8HlIjUiG8H8hQS0C3O05CXeexuJlsbdLt17qk8oD4BH
 gAQ9srcrAijdn3Wmce263g7ijXVgZnc0YKNyYrtJV8qAuHpvyWehll3oro7pRegP1w9n
 ib6DOoa6p9AKlztuw806ffA5tf3I229MsOztUHoZIlKz1FL+lEfZfH5k0mm7UGMaHf+F
 Asww==
X-Gm-Message-State: ACrzQf2dqkDmgGWMjQrgfmmNBfdTQ8rsHsdQbjs/xwyOfYe3YhiTkx2c
 Q2CMTGc4falDEKcQqzAu9/NKtw==
X-Google-Smtp-Source: AMsMyM6CRg4uBwxkS7rjTe5Yf0/rhGdcCtjAb5V9AqMemVPwKziC/xVhAt3f7dUbsd0ZGixqPW5KAQ==
X-Received: by 2002:a2e:9f51:0:b0:26c:3db9:3660 with SMTP id
 v17-20020a2e9f51000000b0026c3db93660mr5559612ljk.528.1665341689141; 
 Sun, 09 Oct 2022 11:54:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a19ee03000000b00494716e4f23sm1113741lfb.111.2022.10.09.11.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:54:48 -0700 (PDT)
Message-ID: <7b72e9bf-9736-59b7-7355-db6b1c643e85@linaro.org>
Date: Sun, 9 Oct 2022 21:54:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 04/10] drm/msm/dsi: Reuse earlier computed
 dsc->slice_chunk_size
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-5-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-5-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2022 21:48, Marijn Suijten wrote:
> dsi_populate_dsc_params() is called prior to dsi_update_dsc_timing() and
> already computes a value for slice_chunk_size, whose value doesn't need
> to be recomputed and re-set here.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

