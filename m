Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F956CCD93
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9B110E9E9;
	Tue, 28 Mar 2023 22:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E900B10E9F9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:12 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e21so14180614ljn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhz6CmqWnomqbGREKgcW3MDgJ3S9r1BJwI9wzCLxIww=;
 b=GhkC8RyxaD7gAVRkE/mUr17glvcMiNhfCk5PwEc9ZiEUKAUL4etNlDPXc+ygWQRIK4
 UOmex8fBErR67SI8j8edBFwcLwqtp/KJps5KhfuWx1SBbnHa2XECP4PvbZEQ/LgzCwMd
 zYIPwqSfJFLSkfFdVcjQMPI5PhRyiqitpATE6H3ZCF6sABVsQRj56ChWleXJa79yjqyP
 L0tuQ8ysJg8sl5cixAWCG9ymzZgsjlC8BQP/8lHJsghQUiZrP6x7aTZfQx+Q3pKoOJt1
 0Jrjy5O1prLtHiRpTH0vR6k0MgMi0WwA0y26pdCyexXKVPVNHPC4R6rq9BuPPVnptcOm
 D3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhz6CmqWnomqbGREKgcW3MDgJ3S9r1BJwI9wzCLxIww=;
 b=EY4cnVY+vC5S8RONDkMZ4sJGmqI8vnyNARct7IFh9XcGxeZ/yuebV3lkQJ/YZts4x1
 mDvONTtpGfQPFAQj/dDppI+OFqqZhZu7jVEJIjnQMnEHP6egl9gmaZ02BoFMXF1duGAI
 T+T4oZM0Jy2fmvYyxZiP/3+Wofi9Te67SL8tzNvcID1F40MKSrO1f1CjU1Pa3Mbkbwqs
 +5fVIzHi29PmJdGLYdjw0FNlRqk3LMEUXBpooJcJC0arW4hI7fANzILvbDFkYZ4RBaf4
 8gDLStDZKbf78HVKW6pWFRCrDaAa2EViJDn2B0geOY8uIiJRoL4cBPY1ysepuWVivPpR
 Cg+g==
X-Gm-Message-State: AAQBX9csrKuR01zRhuAfGSBNAbZt8vKdl5L5hqGy6vufZrSPoFw443Ui
 4aXogAr9cnAdpugb5pZ7SUc9LA==
X-Google-Smtp-Source: AKy350aXisM/hjSHdt9x5liSV084a5gxN2IJLBSsLRBtalk89B5eAjSKjM+kjTpP6J5Md14PmlJ4SA==
X-Received: by 2002:a2e:a3d0:0:b0:2a1:d8e:a2b4 with SMTP id
 w16-20020a2ea3d0000000b002a10d8ea2b4mr5276225lje.17.1680043092480; 
 Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 0/4] Move TE setup to prepare_for_kickoff()
Date: Wed, 29 Mar 2023 01:37:58 +0300
Message-Id: <168004255469.1060915.7643490068999732459.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 21 Feb 2023 10:42:52 -0800, Jessica Zhang wrote:
> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
> functions in both MDP4 and DPU drivers.
> 
> Changes in V2:
> - Added changes to remove empty prepare_commit() functions
> 
> Changes in V3:
> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>   clarity
> - Fixed spelling mistakes and wording issues
> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dd7904e0f824
[2/4] drm/msm: Check for NULL before calling prepare_commit()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63c3df12d13a
[3/4] drm/msm/dpu: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4d83f101233
[4/4] drm/msm/mdp4: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/191604898585

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
