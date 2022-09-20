Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C25BE4E6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 13:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E1610E4DB;
	Tue, 20 Sep 2022 11:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D4810E4DB;
 Tue, 20 Sep 2022 11:47:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so883397wmb.0; 
 Tue, 20 Sep 2022 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=Uzqu4x3ReJl2swGfEJj67Pd2unDJ3Dv2X7PfUeAMFlU=;
 b=CmXkA8qIbaFNouX5UDIP2EtzvEpNmgRhb/8rznaJhGMNUuwBOFHghs3gJQS4uomnZr
 YDcqkjuEvJ4vCka5cONnCHVRV6iQInH+8o7Zq6VeC/3C8HUmiQ31Tc1D7RqHoZMY0+gl
 DpJVgqTY9VSsYXVMFHySjCx4npqW7qGsRD7k6vyHOfIxIklfFsHo9utUqClMbHOH7nzv
 xKq4OLNK7WWtv23lHrNAz+KZYWDVjodkcEtoVo4NkPp0a/0giowcL+JsMfRSnh9PfBq2
 GPBjK8DY/TfnAMRV+kChdRhMBeamsBENpwI9RfDCDpHENBnE3x1TJgyEn6gEeFu9Vrxg
 wbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Uzqu4x3ReJl2swGfEJj67Pd2unDJ3Dv2X7PfUeAMFlU=;
 b=SoEE8D9QRmRLQrje6dkPAADZg7NnwWMyeYA0sIpSNSSuY7jo9KPu0yVEEhfO79htIY
 ZbfOdpCBJ87QUVyI/eOF+Jlk2rc+3Mm+frBjZ8F/XRd8nBRonnzmxf32srrGs69uT2+v
 h1AjMXjIZr9p5oPmcxG8LHCRDKgQbuL0uGcS48Av9WO2m1LA/0mx4vxSxK0RGhvULK39
 OCBSKJttNLfI0DrCseRAuXdF93iZYiU+WVBkJ9Qsxtp4Q/LOnrj4L/STaLzR73WJr6Dy
 XYhb/GYKtmPTy4lDSDkyo10DJFTQEevKGUJqCHALhv9xrbMQbDfc5d4kgd+M4RhFTfKT
 Z5NA==
X-Gm-Message-State: ACrzQf2og3DG0PNRL0gYraT7fhTvuBTxMtOiTMSf+BK4zCeKV9/E+es6
 Me49urA3wYM3x+9ZQMAAao4=
X-Google-Smtp-Source: AMsMyM4aBYcaHzJkBzdvhpxsTIJL1CmLJ4dHjh82nS5T2kmR/xQCQfB8ki9IGbZoXjIWTpnN0yGzMA==
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr2085385wmb.174.1663674472131; 
 Tue, 20 Sep 2022 04:47:52 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a05600c4e1400b003b33de17577sm2254667wmq.13.2022.09.20.04.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 04:47:51 -0700 (PDT)
Date: Tue, 20 Sep 2022 12:47:49 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: build failure of next-20220920 due to c2b08e7a6d27 ("drm/amdgpu:
 move entity selection and job init earlier during CS")
Message-ID: <YymoZR0jHR7seGyU@debian>
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
Cc: Philip Yang <Philip.Yang@amd.com>, llvm@lists.linux.dev,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-next@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The builds of arm64 allmodconfig with clang failed to build next-20220920
with the error:

drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
                r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
                ^
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1171:7: note: initialize the variable 'r' to silence this warning
        int r;
             ^
              = 0
1 error generated.


git bisect pointed to c2b08e7a6d27 ("drm/amdgpu: move entity selection and job init earlier during CS")

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
