Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38125A5F18
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2E98916D;
	Tue, 30 Aug 2022 09:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8152E8916D;
 Tue, 30 Aug 2022 09:18:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so9563110wmk.3; 
 Tue, 30 Aug 2022 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=AGaSWYBJDgKfuNXBk/rMpd9HzYqxQJNCfvux8aOnciU=;
 b=OkWDZIa6FOObDPg4K064OvXgsu/npv0Y459BFnvrGpjZtayryIOXm//bV7VtE+O6Ku
 Z6wd2miesiJN/ppW2YMSP9cBRqmBKexlGpHQAjEv+y2Eu6lkXXKdYMdSo3EKWztpsW5n
 LDeMJBGtmITWQY6Ini2sc9A4VU7633IBYInTPbSFNVnazdFOhBgmWg49tISF8q2xXT3L
 zZhoSBvCa4634fkQJ++bWj41wbFXDwaxLDCo1mbSHQSoFPQTMB9SDOth0gHv/HUV/AWQ
 VsZZGRgDrYBEB/ip4uuvUBsJkrOnk9bvsp/Dtd8p6BMdIvup4DP62ymW9/8+WGIDGIxX
 zRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=AGaSWYBJDgKfuNXBk/rMpd9HzYqxQJNCfvux8aOnciU=;
 b=ydck+xP8FlsUJrxlEGa/t/3VTZwhSjatoMPKAFuZwgXjcdpEMFoD7ZTIIP/+a0f6C5
 K6Rgxie3dwcalLaNYckY7SrYeTIK0efpjIxii/Q/Ff39t/jpK5X7pdFkXpfv7K8F9AcZ
 roJY3lVwYGXKCCP7AvjhJh/VFl5SaIl0daPdBxmB8tptR+4nhnfDH4bDn9DIckT0mStg
 m1zgpVcpysACxxiRGKljmCm6t/iOUAZITkkW++Ck+qaldIDCU//X0Q5tMo/VmRKlcH5L
 lkoLu51chxoO7CTTJ0HjgXqFv4/7flRwgISYZKdV8mPJoTxA7mZK6V7OA7w9zmjvEyrj
 Wtnw==
X-Gm-Message-State: ACgBeo10pKe8VB2JgVDhc8ux//GcdbdHfH6UL0qokFbz898rIKekMbiF
 ZWo4VOJWxogGaP14mmJFLg4=
X-Google-Smtp-Source: AA6agR5QPnPnzmdDQ8z8WSYvFsJyyoFZG9CQ43BYjg2K03qhgWNqHPOigcjYhoX/TqbT6IEa4NyRmQ==
X-Received: by 2002:a05:600c:1f05:b0:3a5:c789:1d9c with SMTP id
 bd5-20020a05600c1f0500b003a5c7891d9cmr9138971wmb.26.1661851125988; 
 Tue, 30 Aug 2022 02:18:45 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a5d548f000000b0020e6ce4dabdsm9040737wrv.103.2022.08.30.02.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 02:18:45 -0700 (PDT)
Date: Tue, 30 Aug 2022 10:18:43 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: build failure of next-20220830 due to 5f8cdece42ff ("drm/msm/dsi:
 switch to DRM_PANEL_BRIDGE")
Message-ID: <Yw3V8yJgAnPD8o6P@debian>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linux-next@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The builds of arm64 allmodconfig with clang have failed to build
next-20220830 with the error:

drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
        of_node_put(device_node);
                    ^~~~~~~~~~~
drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
        struct device_node *endpoint, *device_node;
                                                  ^
                                                   = NULL

git bisect pointed to 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
