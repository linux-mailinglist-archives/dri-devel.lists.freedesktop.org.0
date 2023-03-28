Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CBA6CCD88
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E85C10EA17;
	Tue, 28 Mar 2023 22:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4CE10E9FF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:13 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id y35so11666011ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FuPPDUcJgL64Qc5i5ibOoN0goVd5i3l12v70KzNl8U=;
 b=er9het2Lu4y4h8jUA4KPhi0YDGkuCCcp2GmD3MdT8HVcWJTIVxdr7UlIdTACH61Ms+
 RSxESLG9/b9PLw/pzOpPELFxkyTFv2MzXlNCFuU0Z3QM7wmM4pSZpwUc4LoUYClTZgB9
 wB2f+ZS/BwHX/Owhm5Jkt7v6PB0BuU964yZjXkhbBhUbtbohKnFJaflwj/9ZzqbSrlLS
 aiTu9RYLMGBx6iNJqkjGIzWK5hFxDwPREmNyrFwr3mOFikjB85JJa4k6ycsqvV2LqDCl
 FbblMCeUOAgBChGbVT22EmRBQjWX/6E+/K+yNv/ts/clcsAb+phi6pALbxjSoROljg9l
 wTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6FuPPDUcJgL64Qc5i5ibOoN0goVd5i3l12v70KzNl8U=;
 b=U4Pjmk6cYXp9KnIXMugxFSO5xaNy3JRrsH4hDx6VOz0swuuNTdWwjZ6sKCmKTw5hNQ
 iZN8gF2DGHHFUgwLLUxuQvMGD5++nZ6CMr6vGECyOM0ELokKfSOIZLn6tOuMYGlKQdn6
 c8CXBqvPy6v1ZIvUP2QDSklKZrZUI+Ep5TvDyujuZ4v2zu2UFOAyY2l9C0vC81CHlgkg
 7DK2v7p0oHAIHEL7uZz/0LUH08h6T7Un6va6Tm/bSvB9Jb46fgC3G9PJHuwn/jCsXoDv
 ws63CWgOLbv7NgG2Hw71m/+CIp+YwSwgH0sogBRMD/QJgXKIkzQiyl4VjmG2gYhx9yn+
 qkIQ==
X-Gm-Message-State: AAQBX9cCm2gn0cRNcwI8jE/OXHZYkMKZrkOFvf4CSYr5Ah+IDImJh8VK
 k70xyl/LB6nh8rk6xaFOo/aJX+eRgIcQ14fUKgs=
X-Google-Smtp-Source: AKy350bPbKumo1VlMVHKf/kmOLkRz2OCf8CsDeedL/ZbAs0BUINpS0/8mtGotRdWh1mAdIyWrEZadw==
X-Received: by 2002:a2e:780e:0:b0:299:a55a:f66f with SMTP id
 t14-20020a2e780e000000b00299a55af66fmr5572861ljc.22.1680043093150; 
 Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH v3 0/4] Move TE setup to prepare_for_kickoff()
Date: Wed, 29 Mar 2023 01:37:59 +0300
Message-Id: <168004255457.1060915.6291843271360187892.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230213194819.608-1-quic_jesszhan@quicinc.com>
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
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


On Mon, 13 Feb 2023 11:48:15 -0800, Jessica Zhang wrote:
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
