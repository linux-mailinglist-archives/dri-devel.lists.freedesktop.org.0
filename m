Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24179A05592
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C180C10E258;
	Wed,  8 Jan 2025 08:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ojv7lYUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8426B10E258
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:41:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso118859055e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 00:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736325650; x=1736930450; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qZflv7hC/dMN1o9/f4uf1WJRqTaV07BbMGiNBHEGYKI=;
 b=ojv7lYUGD7QJxjMIX5ldYrMvbuKKr+h70eDgeX4aqKb2tsbAY9iLxGkFHDPFxJXYZ4
 7ZYAjQcO4Jn/Eu/H0ZufaUwWEzOAsLuOyhOtvZTAgwB2eFqFm+MC53bu38o57naBk9Gl
 waYXuJyI2HhgU0OCqhPAv93H1C4AxHryu8br5JH26CRpDb13B30hrk9ipLHfoSphxone
 avSfEsVwcc7HUPjF5zEkyPkYF/nd4Du27HHPeAwmGJfe7IGZSU2/dpQ5dbCmW3cFdJN/
 8kJjTuAhjv+sgLFFTm8BvR9t5OiVSSg2c6J1GMVZacd6r2uc7tLcxzLebNf8gHTnRHn6
 MYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736325650; x=1736930450;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZflv7hC/dMN1o9/f4uf1WJRqTaV07BbMGiNBHEGYKI=;
 b=lhSBjg2Sh7WQC2pPUkLALT6KCZiwPOtiGbdWRWxLlc5KKiXDArQxa8JEusYtMmWZXX
 9YtWsdPD2e8J/ygm94nOosRjk6qlCtphDcYhVqdxQrdfYiywzQZ/UuWnfm8m4KmJGmuo
 10kMsKNFgYNdal2Bx8QF9mU5n6psah7bgQRPbQamDO+ODOfWxI15PIeavjCtu2lomsXr
 nff+ZZNmd6j5/Xkswaz2KnAmh3JJl6ZF/k+j5/RUqK+gvBItY/kMCN7p00nLeiSz60U0
 1i2sZqBBm/URcBDgPYoGzs1Bg/OA8h0rYk+3u8+1d1+E3pmPWPkVommzgtj8LWqupAoA
 NqyA==
X-Gm-Message-State: AOJu0Yy5F5BElkisMAXVAro0BpAdi5fEMv67pitO4RUqaZLvoQw3hI4a
 t/0k54wq4cmMfG5AEmdKlfuyUvn962pn4+Hu8Uz8qi+p5e7ENNKswcElnvKiXtH7zknXnPWtmpC
 a
X-Gm-Gg: ASbGnctnop65XP1QNvA6E+LMlDVWM00PSBhFxZEBhKYg2zSATuFuHCGQ/0PRS2gUeVU
 nKZdd+MQEiWK6zalj/CcXWoKWaBL1EpK4EDdPIN89EHU3VvDxrYcPm+1eydJ0vfFxkQjj1KO9XL
 7qXcWtqm8j0l0uVc4iFAQn2nCeJ9myb1tVfVSORuyLTMb/RGq+J0BHEG5LD/M52WVByK9ulJZzw
 AJ9zEF5wResqAGu+MNDi1CarDktZKFx9bYyEJg40rbBHa/qBV/un4kxhw+ZSg==
X-Google-Smtp-Source: AGHT+IHwJ+t8N6D9ivEzLxjaimxya3o+bF+bmOALoRJXPmBBCkObe1p9ZLU/34QKn3qpJ1dj+DAp6w==
X-Received: by 2002:a05:600c:3ba4:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-436e26f4af7mr9364375e9.28.1736325650054; 
 Wed, 08 Jan 2025 00:40:50 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da753dsm13152715e9.7.2025.01.08.00.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:40:49 -0800 (PST)
Date: Wed, 8 Jan 2025 11:40:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] accel/amdxdna: Enhance power management settings
Message-ID: <202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Lizhi Hou,

Commit f4d7b8a6bc8c ("accel/amdxdna: Enhance power management
settings") from Dec 13, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/accel/amdxdna/aie2_smu.c:68 npu1_set_dpm()
	error: uninitialized symbol 'freq'.

drivers/accel/amdxdna/aie2_smu.c
    57 int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
    58 {
    59         u32 freq;
    60         int ret;
    61 
    62         ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
    63                             ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
    64         if (ret) {
    65                 XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
    66                          ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);

return ret; ?

    67         }
--> 68         ndev->npuclk_freq = freq;
    69 
    70         ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HCLK_FREQ,
    71                             ndev->priv->dpm_clk_tbl[dpm_level].hclk, &freq);
    72         if (ret) {
    73                 XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
    74                          ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);

Here too?

    75         }
    76         ndev->hclk_freq = freq;
    77         ndev->dpm_level = dpm_level;
    78 
    79         XDNA_DBG(ndev->xdna, "MP-NPU clock %d, H clock %d\n",
    80                  ndev->npuclk_freq, ndev->hclk_freq);
    81 
    82         return 0;
    83 }

regards,
dan carpenter
