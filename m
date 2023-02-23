Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE116A0111
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 03:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2953510E4AD;
	Thu, 23 Feb 2023 02:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32510E207
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:10:14 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-536bf92b55cso154252187b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 18:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lFMUOoT9K3sV7smyMsQz++3wD9NZYfAOVbqH2hbiHvw=;
 b=NLiX6/4oMH+SP7OZC5H5dkuhYcqk9qtytdK8dpBWBW4NG9sbrJ8niFrUx5cx8SpArt
 2Gf8P6Z+SoOtRcI2MnO0WOv8wdbjFTrl+0HFTP1Gj5+oq7tUncVG6Gr4Iy+Z78IXGg/e
 mQw+Hg22nU2XYHZKBl2yo33jUAg9d1aVpCv8mwpSAB5+NPqOIqzW8/dg0OJNKMtdcsQQ
 gw+Xig4Qd38XQjL20jB7BfTZU8h/ghCmivlJYa/IQrVzHmg3rsPHXilPWjC6PTGlzrDT
 UmvIE7Cksnzci6YyvWhl8ABuTIUSFR/Bq+7gdcq3jDSRKWfgUJbr5+xo0sjjh8M9hlAP
 YhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lFMUOoT9K3sV7smyMsQz++3wD9NZYfAOVbqH2hbiHvw=;
 b=gjhfsJSfZQJDDsbviOiTB8cJzOd3zYVsxEimGSKRQQJ5YwwXgDoCT9HSl3hokpHiMb
 nOpl+J26bjKVvxrwP+dKosSnsGJGdtOBcU/c0Qpp7TFO7oIlDT9uyHhibTmbI+33SY5n
 iojRGf2Vn9JV/BE82oaRL8U01lYayMRVy9i1eQJwT4dtYo0iMFuXIOhIQBV8MEIyc6Qp
 Ur395OiTvKGUPHhk2f/7B5XTzHtwub3PqSQKsiEahpfga02sa9qbqAEf4YslkZPzo79j
 /9ENdqB01hs6WJaS57D5bHKuq6bvQLuACRqtYDXIanGUw5eaidrTHwgpMp2zpGtYvuMF
 6Tjg==
X-Gm-Message-State: AO0yUKV17sr6zLGY3STL9z5S2srXA2CRRa7DI/PxQXNj5O9t8Xjk1I47
 CPod8bripXYyp6WU9Tkq5f00Ia02MMXXzXQYJ8eFDw==
X-Google-Smtp-Source: AK7set/MR6o1EBljJIfausK4TNfCevYS3wfBHGHm1ASRwt2JVCu4Tl6+7XqTiq/FidNJsl2qK9Axd3xTeY6e3XCB5qI=
X-Received: by 2002:a81:ad28:0:b0:536:55e5:2eaa with SMTP id
 l40-20020a81ad28000000b0053655e52eaamr1508552ywh.3.1677118213425; Wed, 22 Feb
 2023 18:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
 <20230223-topic-opp-v2-6-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-6-24ed24cd7358@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 04:10:02 +0200
Message-ID: <CAA8EJposxNgyCh+LUstVvBO3Pf3119mmwb6CijN8Ss6TWw5+-A@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/msm/adreno: Enable optional icc voting from
 OPP tables
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 03:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
> handle bus voting as part of power level setting.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
