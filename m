Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20352A474A5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 05:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B3010EA3A;
	Thu, 27 Feb 2025 04:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H073G/s0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B314B10EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5461f2ca386so416198e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631080; x=1741235880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HzmKzyqYbo3hawEWPEGsqia1eprcAJ4Ylg+Lj6WDtUQ=;
 b=H073G/s0ifQy7tsXgJ208ZELkUlMkxukeETEAp7XP9t77hBCHTLsGcRBviaiuTFtqq
 EVnfcGMrVNCTA8nio+dWONCA4jOpg84oIbQXUTcSNi3juPBIG0km9YzOwIAke1QyKttg
 9jKTbUH5sArQvgqLLgOfFLgk57XEWhVQGC+rGLqoaEWAq43XUkpr0ezkWD80fWOCVTdz
 uNLBUh/TpTC69ejkW+4qEl5IefNgq9EAvmNai4wsBQcnx2A8K2BLhN2sNqJnzaSH5PSQ
 V9wPBb+XgbCQ1Li3m+dQxkJW8lgIzKSEJean5/VntyJ5nZWvJmnPNyTX2nLNCi78fP4u
 rlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631080; x=1741235880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HzmKzyqYbo3hawEWPEGsqia1eprcAJ4Ylg+Lj6WDtUQ=;
 b=IlWmzBhtqbMMDq5Uev4583ZnUXee1cX5+bBcU1kxoGmvwvR3FMMD0YxiERLkzfJhnR
 Pp1xc19cU/aE/u7BZCJfITHwcLgk+7KUR9S8UeYnyWfdvHj4/43PLLPsLu/37GWtRDyW
 3mzRDDwACVAN3LgyGkCNWDtr24lDet75iWsKLkEAINNDDwd0KGm5ue52AnNXEG9W8I0z
 TSxYAIfUmc+pIwWiArWuslUZ8bxQdv4/Y8n9UtnnHOnjLg2L1gAomcUhnaDrnvwDi3jQ
 99J34LI3I8SZ7IDqc4h/slHK4ZBRLYrO/GzNdUqMgTfJNznJCyNNVWYaAikdKvMII+rN
 BTiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd8rcKJkq13aaoDPL7o/MWT666bcQjZpeQCF8bd9tJOG5GcB/rn9hJJWD7i1QMftKFpxgtvq1Wuso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygM7YcSVDwO1cHl2NLnQ4bhq6tMZeV0H9yWk7/T6AiS3Ip16Rc
 3QlH3rYN532MBaHj/cf8w3G8/pDKby4Su9+sZ5Spe0TJpQ4yW3+zEEpnLyaaMFE=
X-Gm-Gg: ASbGncsVMZOcb/t2RQDBiFpGzZBxwinkPJNKKJEX8Dox2c9NfMRT4TawTfVvgA9bnjX
 2aYSnYwGxQ9K0SCKfNrddH/gFKsdv6tg5KEULbxPce2zbDMF756saO0NSEB4BXb4+E6x3avw97g
 7uRjvWn42uzu4ApzIJ66dlTZ/eA1jK8uGaBmwKoIMQBOl2+rwz3Wq18rk6VnHw0RHSqa6+PVEbr
 YkKLKz9GeBLPlawjgbtFAoimYAeVGoNrhKN+6u+OR2hH5GSFeLdn9R2xCcPZPvHyLNKoUQw8f7t
 IA3vCLQs3g6Iuh+CH5+sHJf4US/ewnx7DlA9R47BBw==
X-Google-Smtp-Source: AGHT+IGJyfv5tGen846vyQRMebF2qwsXcYi2q7UIL/kDESpfQBWqyP/hiC9cUT0/ZbRg3Tu8CrhGDg==
X-Received: by 2002:a05:6512:10c4:b0:545:93b:30bf with SMTP id
 2adb3069b0e04-54839259932mr11279171e87.41.1740631080047; 
 Wed, 26 Feb 2025 20:38:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1)
 on small SoCs
Date: Thu, 27 Feb 2025 06:37:31 +0200
Message-Id: <174063096235.3733075.3774428548713459070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 22 Jan 2025 17:23:44 +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1) on small SoCs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b6090ffb30f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
