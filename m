Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197074F1D6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF6010E3AF;
	Tue, 11 Jul 2023 14:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B110E10E091
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:00 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b70bfc8db5so77615051fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085319; x=1691677319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIVN6C53juP0Q5iDUT1F1HeifUyBCNpXBYhLUGADz7A=;
 b=F2KzE1D9nWBzFgZ6+NFkRYupZLL5otNkqPs5j74tUMqGFtIH/k6+yxbz3wsFhHgEma
 UQOyUHR7EBb2QRfNeZY9n0/dYZXteFQ5jyBuou0afKMNm9jxtPAzTTXd94dolct3VKAE
 lQ+L1XYD9v4zr4K009AUW/5tNT978pAwwexQH4Y7Rxx2OluCPLu0NUfeORF//HxYhVIZ
 gYnF03fI1nfRck5C2qZ7MAOTTjs5SXcFvC9iTi3ayiSKU5pPavZHgHPoKfE2vNQRhJ5U
 eICAIEnmrI1lyHGmYp6yq1tLnBscBgNxRz4KM0hceuKH8WR64Qj/b5baDRaM5petQucG
 HBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085319; x=1691677319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIVN6C53juP0Q5iDUT1F1HeifUyBCNpXBYhLUGADz7A=;
 b=SPFdY/ktadA7NjiH4Zkg8emRSI4xEtEIlC1vfaOdR44eFhnkXQ93amCpoKcp1Fk9ot
 tlZ7YmbIc60XanydUmlU4/Pvydtoj4brgYIUWL+KkSxMuNMBABUyQf8+kTaMtsYoF9Xh
 PrpIENQA7VM1w2znA3DZUB0W3T+39i1pmd6z7Pl+i4AUYcc+I1YfJg1eJ0XzH6AL2Yso
 gBwEDWy/eM/9nyrTVsKQZ6ErOomC7DXoZYOrKSBeT8j4LojzXdFjqaJiKHFKxJP/MdtJ
 Q6qDoHVNZNkAnbq2BgvN5pOelUN8pmYEBWmEJlxyx1rt8WeYXTQ3MFkbp3DXva8VvEMh
 r/lQ==
X-Gm-Message-State: ABy/qLYMQ/uQKHGQRpBjAfsK5StQwJbDNCCjsjxg8UGSXNPyV0WqbgqT
 mTViH1g9GiblPTfbPkR68WEGSQ==
X-Google-Smtp-Source: APBJJlEnEc2yw26sZg7r3jOg61IenC2emKJQYboIRLUpgluHvcSybr2bOGCJPNanGdpVVqAUd96rxQ==
X-Received: by 2002:a2e:a170:0:b0:2b6:e958:d03 with SMTP id
 u16-20020a2ea170000000b002b6e9580d03mr12795430ljl.30.1689085319029; 
 Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:21:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 0/2] DSIPHY RPM
Date: Tue, 11 Jul 2023 17:21:48 +0300
Message-Id: <168908465045.1869384.1893558597710112842.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 20 Jun 2023 13:43:19 +0200, Konrad Dybcio wrote:
> Some recent SoCs use power rails that we model as GENPDs to power the
> DSIPHY. This series attempts to make such configurations suspendable.
> 
> Tested on SM6375.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a402e0e61b75
[2/2] drm/msm/dsi: Enable runtime PM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4e905c2acc9d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
