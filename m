Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B08106C5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 01:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA7110E6B5;
	Wed, 13 Dec 2023 00:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8910E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 00:37:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bffb64178so7465661e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 16:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427861; x=1703032661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsqmSxmu0xJgdSY1TmM313rSjq49izbWLOeg9C+GMN4=;
 b=e03JJtF2bXQK6mjUJQoh+CZe3zS4qaWSqePe4t7od3fbPJKjqChKn7tqCA486b5uBY
 VXJ77ND2lKiTxsQqRdC64Bi12ocAaMgI9GV0lt/XZoZYIIQ0A4dZ9z56vtFNcBRV62Bl
 HJshbB4nFWLCxKWquQC+qdgVf0RMgHoRXvLQfkXlxhsljvsz8vA3wfUL6sGhiv/iiAq4
 D+i6S+cY4hBiDxBe2KEKcj29bftPlBSpViBczq0wChKsIZ6QA/bzwZU6sjioqOjF/4wQ
 H/9Cv43IxE6JSejQBauLlkcgih7z7S3pXLdM3OjasFqxnb9my4RL7XbCdKLseXtDAWNg
 Mkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427861; x=1703032661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vsqmSxmu0xJgdSY1TmM313rSjq49izbWLOeg9C+GMN4=;
 b=fsxaMerD4/BIJH4DVvoA+Qd20lnjDvkCtsMPC6KXd3htPfFFk9vbRhksX0Qlaucxm3
 5tYAIT628DXBet645Vvfwxz6mN12moGzziGpNb7PdV7wJOSr/PhglUDwa35PcQl/xFCq
 VRpNoQg4wmJFXDPMdFItUIPs3zBLbAgVp5KeG0u7cr+rL7STwEr5uA6RXFGnxj8OA/LO
 PteaIaSzlCZgUbb0Gs/efSKob0+MT8mmeksjnog4oO8p2rmTwyzq+nHxso5RVaFm4rfE
 J6P3oNbnarws09vOSW73gzEhBL4Esrj1EPakNFnpdBJC4E6qSEAHO9aVbdKv3MUFIvQT
 Wq3Q==
X-Gm-Message-State: AOJu0YzivzyyZ2LPzl9SL6CweoQUNM5O1s3T1LGPoAZOZTMyUp5VjUrY
 palHiGbDawXy2Uq9IfiQYnhvIA==
X-Google-Smtp-Source: AGHT+IGnxZfmXwGRxl0TGv4YBCCiJhChbbN5+q6TcfpOdUL8OsGUwXj9gV6A/J74IBYf4XGclhNPBQ==
X-Received: by 2002:ac2:4219:0:b0:50b:f305:7802 with SMTP id
 y25-20020ac24219000000b0050bf3057802mr2753351lfh.129.1702427860287; 
 Tue, 12 Dec 2023 16:37:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:37:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Subject: Re: [PATCH v4 0/1] Stabilize use of vblank_refcount
Date: Wed, 13 Dec 2023 02:37:33 +0200
Message-Id: <170242755503.12964.15556030852951255362.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212231101.9240-1-quic_parellan@quicinc.com>
References: <20231212231101.9240-1-quic_parellan@quicinc.com>
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
Cc: quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, steev@kali.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 12 Dec 2023 15:10:57 -0800, Paloma Arellano wrote:
> There is currently a race condition occuring when accessing
> vblank_refcount. Therefore, vblank irq timeouts may occur.
> 
> Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.
> 
> Changes from prior versions:
>    v4: - Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
>          parameter of dpu_encoder_phys.
>        - Switch from atomic refcnt to a simple int counter as mutex has
>          now been added
>    v3: - Mistakenly did not change wording of patch #2 in last version.
>          It is done now.
>    v2: - Slightly changed wording of patch #2 commit message
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Add mutex lock in control vblank irq
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b9dc09b4e534

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
