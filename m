Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38254CB16
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 16:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6882A10FD5F;
	Wed, 15 Jun 2022 14:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F61110FD5D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 14:19:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a29so19190626lfk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=A9RmSO/OHnan4DfbcCHEVVY9M4r3MnYRFQBaUW6bNWA=;
 b=MNuMF3PuaRY/+6YKpSGtGwP/4IuvRcZKjZOwztV73IB8RG1NWUXPWaU2BFUwCr5ux6
 nBrrd+8xchQCtImhgEfLaO4XTIbMV5XSVMTLk6ED6SSBDT0nTF4DGaiqTC5iP57OnHyd
 UnMT+znTe8UDArIKd/v8jCrb2b01rK/7rRWt77ff2CTsrz/hjzgoF/Q79oG63L1TXG8b
 ODyf6yIpWkuPxejCxOUmlcetemEUmOZJ/PHWn0J42S4FAhLHKTsGRd/YiVUb0Kd/SYd7
 u2l+ZoFA8i/WTSrXUIWOCnXlVFg0Im6YEETIIqQZfPzvhp+69RfGTUlaHICOsYkfT2DP
 jaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=A9RmSO/OHnan4DfbcCHEVVY9M4r3MnYRFQBaUW6bNWA=;
 b=RT5TUROO0WapmXGQDENvGoIE/IQP1xbEz9XLI5xT9/sb9CmXh6aNV9lpybbSo+UtHG
 wp9iTD1p6t+hycFqnJArDJu8p2pn60McKazz1IYOcGl4R9BPJM6xLVX01qV9Tu5/gctb
 Y1vV4awYrRG+ONQnRs8udtLdT1jn6IX/+mA/jBd5GiuvmkM17QdzllWGZZczQNAtTr7H
 ntneX41a/lSd9BSmhlicYtHVNt3hX+sRxxwboAHg3m1QIp5kgmtdeYCL0hDXF/aZd/iq
 4hxte5t9WZAfdqH/SXdDgGV2AI94zgmIGyiPqnp6XNaNi1KvFOLpQBFPQ4/KydTfmLpY
 5SMw==
X-Gm-Message-State: AJIora82pgM2C95esJWkP8ZbADWv4onZgWn0GW28cED3ZIlraclQHn5K
 ih7cY4rj9ig2+2zz2ha1FK57eX4MDPlMNcrW
X-Google-Smtp-Source: AGRyM1ugCc/2OaezlkOsaaKljgQlyk2WvF+Ik7GaQdltNSp7JiRkOQRFbTxT/C1eeTM0SUyJMfAG8w==
X-Received: by 2002:ac2:58d6:0:b0:479:5b9:74a with SMTP id
 u22-20020ac258d6000000b0047905b9074amr6019118lfo.551.1655302783810; 
 Wed, 15 Jun 2022 07:19:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v5-20020ac258e5000000b0047255d210fcsm1818418lfo.43.2022.06.15.07.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 07:19:43 -0700 (PDT)
Message-ID: <5dbc0159-cb33-db5b-20cc-05f3027af15e@linaro.org>
Date: Wed, 15 Jun 2022 17:19:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Please add another drm/msm tree to the linux-next
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
Cc: linux-next@vger.kernel.org, freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

I would appreciate if you could add

https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

to the linux-next tree.

This tree is a part of drm/msm maintenance structure. As a co-maintainer 
I collect and test display patches, while Rob concenctrates on GPU part 
of the driver. Later during the release cycle these patchesare pulled by 
Rob Clark directly into msm-next.

During last cycle Rob suggested adding this tree to the linux-next 
effort, so that the patches receive better integration testing during 
the Linux development cycle.

Thanks!

-- 
With best wishes
Dmitry
