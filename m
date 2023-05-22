Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239570B6FB
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 09:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C010E261;
	Mon, 22 May 2023 07:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963A010E261
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:49:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so5591063f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684741769; x=1687333769;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5MYj1bcG9yRM4Kro08Ux/QVFuw/U2ovsROmsZtQppTg=;
 b=hrPcG7Fd2sEYtgdQMuFNrG8NUbEJhETO1cCQLtQlCaBCyTmi015oLLhILUcJ3KRQP5
 DUImQYLMt3oKqSr5+8gCob8Hs7ivNTf7rQXFKed10yixRsFKhLrr46rH2oWJwLPCCV3X
 Bepw1FiaL4vQFfvtLvdlQ++Yc5f+uGMNn1IlyeZ20ECAKX+q6mPOUIC/c0QnfylqvsDL
 GyBH/H5Yvm5bTlXpigf1JewzUe0shWB86vMN8QaLHUq0Dp7DfaRQqNz0dXs5SRqPVLOV
 N8sd0P95iH5KHFyPek37TPKu9jUqK8GKEsgm9PavkgTd6ldZ3BCB2I+VaG0b/kCz9zrL
 pCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684741769; x=1687333769;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5MYj1bcG9yRM4Kro08Ux/QVFuw/U2ovsROmsZtQppTg=;
 b=Gh2L05EtKPOdXPp5jXtkMoY86aEe0pGKNKTjYJEqtriwfEbeYY/gAuK/0ZyxhtVyxz
 mg+IrBMjYHUaw5tFDdQb399SK8e14sluuNfMQ9YlP8jyOTyruS9/tpBaf7G8dIXcDeLm
 b7G0DhaX0t8K61qxOAi/QoEo5AwttT4He2I+yD+301DCCh60C/0xdqqBw57RmfWX5xz0
 hIO/qU7QSFomeEQW5G7c753UIxOqX4IiNkbR4PfuSrX2kBByd4PK3g2ptPkXsa/ZyFYj
 I4P2SLyiMWqhVvTb/6NJC1S85SlPKcrSP/Uor2lFBnZHpxAG5c8jzAATeOvCUXAkgtxX
 joJQ==
X-Gm-Message-State: AC+VfDwe7lxnGfVu8H2nawSkMBqClMeSXqHwTPshw7uY4oMej4sKWR9u
 XZVKdK86M1hA/5DMtHkHTLTe9g==
X-Google-Smtp-Source: ACHHUZ6AD8AM/J4dV0liAOjoy3n1lp/uwmyrUxqoH2whLg9jQIvnNk0uviyB8JKGgiwWbtDs2y5Snw==
X-Received: by 2002:adf:f28d:0:b0:307:82e3:70cd with SMTP id
 k13-20020adff28d000000b0030782e370cdmr7210887wro.14.1684741769436; 
 Mon, 22 May 2023 00:49:29 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o9-20020adfeac9000000b0030633152664sm6831911wrn.87.2023.05.22.00.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 00:49:28 -0700 (PDT)
Date: Mon, 22 May 2023 10:49:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: mhaimovski@habana.ai
Subject: [bug report] habanalabs: extend fatal messages to contain PCI info
Message-ID: <1697562a-40f5-4164-9300-a2be7cae5439@kili.mountain>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Moti Haimovski,

The patch 2a0a839b6a28: "habanalabs: extend fatal messages to contain
PCI info" from Dec 29, 2022, leads to the following Smatch static
checker warning:

	drivers/accel/habanalabs/common/device.c:2336 hl_device_init()
	warn: address of NULL pointer 'hdev->pdev'

drivers/accel/habanalabs/common/device.c
    2322 early_fini:
    2323         device_early_fini(hdev);
    2324 free_dev:
    2325         put_device(hdev->dev_ctrl);
    2326         put_device(hdev->dev);
    2327 out_disabled:
    2328         hdev->disabled = true;
    2329         if (expose_interfaces_on_err)
    2330                 cdev_sysfs_debugfs_add(hdev);
    2331         if (hdev->pdev)
                     ^^^^^^^^^^
NULL check.

    2332                 dev_err(&hdev->pdev->dev,
    2333                         "Failed to initialize hl%d. Device %s is NOT usable !\n",
    2334                         hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
    2335         else
--> 2336                 pr_err("Failed to initialize hl%d. Device %s is NOT usable !\n",
    2337                         hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
                                                          ^^^^^^^^^^^^^^^^^^
"hdev->pdev" is NULL here so this will crash.

    2338 
    2339         return rc;
    2340 }

regards,
dan carpenter
