Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282829C31E9
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 13:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DDC10E07A;
	Sun, 10 Nov 2024 12:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D7410E010;
 Sun, 10 Nov 2024 07:26:47 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XmPND60Wrz20ss7;
 Sun, 10 Nov 2024 15:25:32 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
 by mail.maildlp.com (Postfix) with ESMTPS id E7E0A1A016C;
 Sun, 10 Nov 2024 15:26:43 +0800 (CST)
Received: from [10.67.109.114] (10.67.109.114) by
 kwepemd200012.china.huawei.com (7.221.188.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sun, 10 Nov 2024 15:26:42 +0800
Content-Type: multipart/alternative;
 boundary="------------Ib49LDWcg2gVn3C6pNQcMH0z"
Message-ID: <7d7f7c2d-dfc0-4c93-a676-54d7390326b9@huawei.com>
Date: Sun, 10 Nov 2024 15:26:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amd/display: Fix Null Pointer Dereference Issues
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Dillon.Varone@amd.com>, <Alvin.Lee2@amd.com>,
 <nicholas.kazlauskas@amd.com>, <alex.hung@amd.com>,
 <aurabindo.pillai@amd.com>, <relja.vojvodic@amd.com>,
 <chiahsuan.chung@amd.com>, <wenjing.liu@amd.com>, <george.shen@amd.com>,
 <mwen@igalia.com>, <yi-lchen@amd.com>, <martin.leung@amd.com>,
 <srinivasan.shanmugam@amd.com>, <stylon.wang@amd.com>, <jun.lei@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
 <judy.chenhui@huawei.com>, <quzicheng@huawei.com>
References: <20241105140137.2465572-1-quzicheng@huawei.com>
From: Zicheng Qu <quzicheng@huawei.com>
In-Reply-To: <20241105140137.2465572-1-quzicheng@huawei.com>
X-Originating-IP: [10.67.109.114]
X-ClientProxiedBy: dggpeml500019.china.huawei.com (7.185.36.137) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-Mailman-Approved-At: Sun, 10 Nov 2024 12:20:45 +0000
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

--------------Ib49LDWcg2gVn3C6pNQcMH0z
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Gentle ping.

The patch link is: [PATCH 0/2] drm/amd/display: Fix Null Pointer 
Dereference Issues - Zicheng Qu (kernel.org) 
<https://lore.kernel.org/linux-kernel/20241105140137.2465572-1-quzicheng@huawei.com/>


Best regards,
Zicheng


On 2024/11/5 22:01, Zicheng Qu wrote:
> Hi all,
>
> I am submitting two patches to fix null pointer dereference issues in
> the AMD display driver.
>
> 1. Patch 1/2 (Fixes: 8e4ed3cf1642): Add null checks in
> dcn20_program_pipe() to prevent potential crashes when accessing
> plane_state.
>
> 2. Patch 2/2 (Fixes: 0baae6246307): Ensures pipe_ctx->plane_state is
> checked in hwss_setup_dpp() to improve function stability.
>
> Thanks for reviewing!
>
> Zicheng Qu (2):
>    drm/amd/display: Fix null check for pipe_ctx->plane_state in
>      dcn20_program_pipe
>    drm/amd/display: Fix null check for pipe_ctx->plane_state in
>      hwss_setup_dpp
>
>   drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c   | 3 +++
>   drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 6 +++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
>
--------------Ib49LDWcg2gVn3C6pNQcMH0z
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi,<br>
    <br>
    <p>Gentle ping.</p>
    <p>The patch link is: <a
href="https://lore.kernel.org/linux-kernel/20241105140137.2465572-1-quzicheng@huawei.com/">[PATCH
        0/2] drm/amd/display: Fix Null Pointer Dereference Issues -
        Zicheng Qu (kernel.org)</a></p>
    <br>
    Best regards,<br>
    Zicheng
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2024/11/5 22:01, Zicheng Qu wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241105140137.2465572-1-quzicheng@huawei.com">
      <pre wrap="" class="moz-quote-pre">Hi all,

I am submitting two patches to fix null pointer dereference issues in
the AMD display driver.

1. Patch 1/2 (Fixes: 8e4ed3cf1642): Add null checks in
dcn20_program_pipe() to prevent potential crashes when accessing
plane_state.

2. Patch 2/2 (Fixes: 0baae6246307): Ensures pipe_ctx-&gt;plane_state is
checked in hwss_setup_dpp() to improve function stability.

Thanks for reviewing!

Zicheng Qu (2):
  drm/amd/display: Fix null check for pipe_ctx-&gt;plane_state in
    dcn20_program_pipe
  drm/amd/display: Fix null check for pipe_ctx-&gt;plane_state in
    hwss_setup_dpp

 drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c   | 3 +++
 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------Ib49LDWcg2gVn3C6pNQcMH0z--
