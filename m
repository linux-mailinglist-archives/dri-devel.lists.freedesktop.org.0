Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DF6C29F2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 06:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4997710E031;
	Tue, 21 Mar 2023 05:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195910E031
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 05:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=+NQR2cPC+9ftHy9bkc6ojFpRutVyCr2wlZ//xE3JKzU=; b=UKGzuF1+vvffxv8tV1c7SOUMNf
 N6gOBaXUq1Z2WBP6vYfwQm1sD+G9eXycB7QfSXba+4a5C/bDlK2bkVo0Ab4iohEGRbrSqPYKF812K
 MjQDv+BjpwO9UY4upzyh4tjIBtEbERfxbkYgung/jovgyz5RAAJpMzTzdDI+34lS43r94T5xHZHeK
 xm3UhfHFtSaXyeP0C7TP+yngL6HKFHKRjUhgRMA6tbhrYhW9B4QYy1XQFvRa8J9k1QocnOVB/NLjT
 kUGAkcHhlHckdcckTA5Z78MynD3gb8FYWcJT2DCpXhPR4Whx1gqGJkqC5nMB3JVzkNsSDefta1ZMK
 TrCi2dcw==;
Received: from [2601:1c2:980:9ec0::21b4]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1peUhc-00BHNo-39; Tue, 21 Mar 2023 05:38:33 +0000
Message-ID: <c85681c6-6fcf-33ed-210f-661e539f78d8@infradead.org>
Date: Mon, 20 Mar 2023 22:38:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Build regressions/improvements in v6.3-rc3 (drm/msm/)
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320082146.4117022-1-geert@linux-m68k.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230320082146.4117022-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 3/20/23 01:21, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.3-rc3[1] compared to v6.2[2].
> 
> Summarized:
>   - build errors: +9/-14
>   - build warnings: +4/-1447
> 
> JFYI, when comparing v6.3-rc3[1] to v6.3-rc2[3], the summaries are:
>   - build errors: +0/-1
>   - build warnings: +0/-0
> 
> Happy fixing! ;-)
> 
> Thanks to the linux-next team for providing the build service.
> 
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e8d018dd0257f744ca50a729e3d042cf2ec9da65/ (all 152 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/c9c3395d5e3dcc6daee66c6908354d47bf98cb0c/ (all 152 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/eeac8ede17557680855031c6f305ece2378af326/ (all 152 configs)
> 
> 
> *** ERRORS ***
> 
> 9 error regressions:

>   + /kisskb/src/drivers/gpu/drm/msm/msm_mdss.c: error: case label does not reduce to an integer constant:  => 300:2, 299:2, 296:2


Are these due to the sign bit being set after a shift?
It looks that way since it is only reported for such values.

From the reports on the build server, it only happens when building with gcc5.
I don't have the ability to build with gcc5 or I would test it.

@Rob and other drm/msm people, what do you think about this?
(or is this already fixed somewhere but not yet in linux-next?)

Thanks.

-----
diff -- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -19,9 +19,9 @@
  */
 #define MAX_BLOCKS    12
 
-#define DPU_HW_VER(MAJOR, MINOR, STEP) (((MAJOR & 0xF) << 28)    |\
-		((MINOR & 0xFFF) << 16)  |\
-		(STEP & 0xFFFF))
+#define DPU_HW_VER(MAJOR, MINOR, STEP) ((((__u32)MAJOR & 0xF) << 28)    |\
+		(((__u32)MINOR & 0xFFF) << 16)  |\
+		((__u32)STEP & 0xFFFF))
 
 #define DPU_HW_MAJOR(rev)		((rev) >> 28)
 #define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
