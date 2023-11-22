Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015FE7F4BFA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 17:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955BD10E1A0;
	Wed, 22 Nov 2023 16:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CD110E676
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 16:09:31 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so92962101fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700669370; x=1701274170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gLCWxiFA7VVYyF6ZRceYWPi2g1OSM3YQHP6IyA6ESAk=;
 b=fMan49hXhBsSt+tMxfW3pOKmu7QXzcrJOm+vgIeCLEXKBNjY7fXKQbz4/CP3OEdhqG
 AGVRuKx3Xw6y86yfwBAELuRCBVscnrTrvYgW+MLBiI/LBPHJhLUU/gXGrz7EPixGFFvR
 zDRMifEGUVv4CpcwBrCXiqB8KMVSvQmaqlDh4TgRelMobKfFDtCJexOG97NZYHlpTei8
 jDDWc0kbAASqSypTjVmEdA0vHCdgxRu9HS7iXnSXkSt65EmWiPrw87wuWIaQgUvWorvX
 euNWOCE72Imzc+7S6RDQzQKuxZvCf2phJPFehXA19A02kmo/fajJxqIKqLne4n5EN9yJ
 jrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700669370; x=1701274170;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gLCWxiFA7VVYyF6ZRceYWPi2g1OSM3YQHP6IyA6ESAk=;
 b=rtC2Ufu/4K8Un/jvv4Sh3c/d7qmQ9KsMZGuJZ4US56hpfgjAet17DQ0/5NPhr4Tm64
 Ktbs9vn+xv9D3foa6vsbd2IB1/ydY9pNj/gSgTdenVi8TyjnzgbNgIzz5FMshW8asEA9
 GDUQ2yWY1/VA31GoqpHsuoZB1/8nM1CU0UHnlsR22CeAV/iv2vklb+Vo23GNkupHG5QO
 CijJnSEi6PnKgDOLJAUI0+psushNt6Bi7blULjdoqshW6fD221om/lOclV6GMwOjguZn
 HbsSS0ioDblUxoqgCw0sFMHfahuzLVdWc+2c0C0Xha2M2nnfJINi0gFm6O3vj509OgP3
 Dvgw==
X-Gm-Message-State: AOJu0Yy1cT6fhlngLadegK960Zp8rTHd9NEmE3gmE7vm20IjMrQeor9V
 25pZPmwxwckfXPHEjPJqOOeU5Q==
X-Google-Smtp-Source: AGHT+IERsO0nW03FwqjG4/xdsmEc+txIkZDHtnrRfnMv3I/o25pWcNZV6M93k6oa7AovrtcZR5Fl2A==
X-Received: by 2002:a19:5519:0:b0:507:ba28:1bc5 with SMTP id
 n25-20020a195519000000b00507ba281bc5mr2003640lfe.3.1700669369885; 
 Wed, 22 Nov 2023 08:09:29 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 m10-20020a0565120a8a00b004fb9536bc99sm1882136lfu.169.2023.11.22.08.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 08:09:29 -0800 (PST)
Message-ID: <124fd3be-ac01-4c1e-b9d6-63429487cf1e@linaro.org>
Date: Wed, 22 Nov 2023 17:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a690: Fix reg values for a690
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231121162137.60488-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121162137.60488-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/21/23 17:21, Rob Clark wrote:
> From: Danylo Piliaiev <dpiliaiev@igalia.com>
> 
> KGSL doesn't support a690 so all reg values were the same as
> on a660. Now we know the values and they are different from the
> windows driver.
> 
> This fixes hangs on D3D12 games and some CTS tests.
> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Very interesting.. did you document how to get these on windows?

Konrad
