Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5095C2C0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 03:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39AD10E13D;
	Fri, 23 Aug 2024 01:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA0F10E13D;
 Fri, 23 Aug 2024 01:18:31 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wqhyh0PdNzyQxW;
 Fri, 23 Aug 2024 09:18:04 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 6DC13180106;
 Fri, 23 Aug 2024 09:18:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 23 Aug 2024 09:18:27 +0800
Message-ID: <8de17606-7fa5-ea3b-301b-9cb4eeee0c33@huawei.com>
Date: Fri, 23 Aug 2024 09:18:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v2 RESEND] drm/amd/display: Remove unused
 dcn35_fpga_funcs
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
CC: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <nicholas.kazlauskas@amd.com>, <Charlene.Liu@amd.com>,
 <chiahsuan.chung@amd.com>, <hamza.mahfooz@amd.com>, <sungjoon.kim@amd.com>,
 <syed.hassan@amd.com>, <roman.li@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240822015819.3356282-1-ruanjinjie@huawei.com>
 <CADnq5_Pm9GHaFWLUniQ608CNMPMSBpNdh2JW9-AcKyEM18KE9Q@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CADnq5_Pm9GHaFWLUniQ608CNMPMSBpNdh2JW9-AcKyEM18KE9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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



On 2024/8/23 2:01, Alex Deucher wrote:
> On Thu, Aug 22, 2024 at 5:20 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> dcn35_fpga_funcs is not used anywhere, remove it.
> 
> This will lead to warnings about unused functions.  The fpga specific
> functions should be removed as well.  I'd suggest compile testing your
> changes first to catch these types of warnings.

Thank you!, I noticed these warnings later and it is too late, I'll send
out a new version today.

> 
> Alex
> 
> 
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v2:
>> - Remove it instead of making it static.
>> ---
>>  .../gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
>> index e2d906327e2e..15977c2d256d 100644
>> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
>> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
>> @@ -1068,13 +1068,6 @@ static struct clk_mgr_funcs dcn35_funcs = {
>>         .is_ips_supported = dcn35_is_ips_supported,
>>  };
>>
>> -struct clk_mgr_funcs dcn35_fpga_funcs = {
>> -       .get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
>> -       .update_clocks = dcn35_update_clocks_fpga,
>> -       .init_clocks = dcn35_init_clocks_fpga,
>> -       .get_dtb_ref_clk_frequency = dcn31_get_dtb_ref_freq_khz,
>> -};
>> -
>>  void dcn35_clk_mgr_construct(
>>                 struct dc_context *ctx,
>>                 struct clk_mgr_dcn35 *clk_mgr,
>> --
>> 2.34.1
>>
