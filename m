Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E94F7AA6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D8B10E4BB;
	Thu,  7 Apr 2022 08:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3EF10E4BB;
 Thu,  7 Apr 2022 08:59:51 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b24so5571247edu.10;
 Thu, 07 Apr 2022 01:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mLaoaPEpHffRvRTEifG5GvlOmzNyIxhDlxnSe+A6QV4=;
 b=KQk/koXUWDrAcboJIVgBLjpc0QYpwsZ3DIM0o9klQbRZJsaCO34oSRRIrMfgKpDF2S
 ZWlmRIjETP+JDut3v3QRzL8jT9+95eE0DSNyl9zuhuEg+sll8Kxs9lYCDYtdCa6el3rG
 s1ixTXOTAUz1BuJTIjnhQmP0Rx/9kp3PkPyv5fltrv3I8RRz3KJjgWGO2gc0fMdXX/0k
 sQecUP+jtN5lgcsURh88wjQmR2OH+MxbMnFH/8BoORqJ52TeAOkUeYIQsdh+yDPl2GkZ
 Ap2EmIMb6bVMJU5e8hd5z42cKS7/4faWcDaSH3sLsSlUJn/DoACF7GrKHj44pgRXUFa3
 lHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mLaoaPEpHffRvRTEifG5GvlOmzNyIxhDlxnSe+A6QV4=;
 b=zg6BmDcXNAHs2BYe248tYQPiuUlGOwMfzy83JhY25fhxcfmfSBH/fNmyYbrIEZlO7k
 TqyXztBYdZ8djzNkkLmwfO7eJTEnOlNqQPhJMlJYSDlM+EeSXZXo9wvmy1Q4RhOpDO/A
 vAJuuqpvjwTQkJRnkBjn1eSKsRt9CwqW7h/wwp2tz7R2kF1erH/uFQMPc1a34dre+y/f
 yVTmpAd6w2hyBQnRYtkbezxMvlYBZbobfyQndiom7i9nn/V/U3J9YXL3aR0jjLrrWDoe
 wD4ABgAMcpiuEr+tD2cGuPwFW2Fk4DrvFtX4HffubpBfA/1vIghhDUESSIpoQxdUpomS
 ujTA==
X-Gm-Message-State: AOAM530Nz5JauyOF4qlXZZX+dI9cmewiJejyIvO3hnxJYrZ35sXl6N+U
 vFtSIhmJuBfwbOAETRZaZTE=
X-Google-Smtp-Source: ABdhPJzeETI+aibm16Fz7XHOsM+emhYvd4jn7+9bFUhsY3UvzT3cfJuShTcwU9S3v1mIXnpgHhIOGA==
X-Received: by 2002:aa7:d287:0:b0:41d:79:73ca with SMTP id
 w7-20020aa7d287000000b0041d007973camr3673930edq.142.1649321989621; 
 Thu, 07 Apr 2022 01:59:49 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:59:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: DMA-resv usage
Date: Thu,  7 Apr 2022 10:59:31 +0200
Message-Id: <20220407085946.744568-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi Daniel,

only patch #2 had some significant changes. The rest ist pretty much the
same except for the dropped exynos change and the added cleanup for the
seqlock.

Thanks,
Christian.


