Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF236EA3E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456726E44E;
	Thu, 29 Apr 2021 12:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17642.qiye.163.com (mail-m17642.qiye.163.com
 [59.111.176.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EE66E44E;
 Thu, 29 Apr 2021 12:23:17 +0000 (UTC)
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m17642.qiye.163.com (Hmail) with ESMTP id 20772220127;
 Thu, 29 Apr 2021 20:23:15 +0800 (CST)
Message-ID: <AN*ARACWDmq3kx33Z4tCR4oU.3.1619698995121.Hmail.wanjiabing@vivo.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgZHVwbGljYXRlIGluY2x1ZGUgb2YgaHVicC5o?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <20210429120504.sjruq5a3w2hdtusy@outlook.office365.com>
MIME-Version: 1.0
Received: from wanjiabing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 29 Apr 2021 20:23:15 +0800 (GMT+08:00)
From: Jiabing Wan <wanjiabing@vivo.com>
Date: Thu, 29 Apr 2021 20:23:15 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGR5PTVZPHhgZGk4dGUIdT0NVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1ISUhNSk5MTUJPN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6NVE6KTo4LD8WCkgQA0hIIU8POClPFC5VSFVKTUpCTUJDQkJOT0NMVTMWGhIXVQwaFRESGhkS
 FRw7DRINFFUYFBZFWVdZEgtZQVlITVVKTklVSk9OVUpDSVlXWQgBWUFPTE5KNwY+
X-HM-Tid: 0a791d954fcad998kuws20772220127
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org,
 Chiawen Huang <chiawen.huang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, kael_w@yeah.net,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 
>Nice catch!
>
>Are you using any tool to identify this problem?

Yes, I have a robot including many detecting scripts :)

>Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
>On 04/29, Wan Jiabing wrote:
>> In commit 482812d56698e ("drm/amd/display: Set max TTU on
>> DPG enable"), "hubp.h" was added which caused the duplicate include.
>> To be on the safe side, remove the later duplicate include.
>> 
>> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>> ---
>>  drivers/gpu/drm/amd/display/dc/core/dc.c | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
>> index 8f0a13807d05..dcaa6b1e16af 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
>> @@ -58,7 +58,6 @@
>>  #include "dc_link_ddc.h"
>>  #include "dm_helpers.h"
>>  #include "mem_input.h"
>> -#include "hubp.h"
>>  
>>  #include "dc_link_dp.h"
>>  #include "dc_dmub_srv.h"
>> -- 
>> 2.25.1
>> 
>
>-- 
>Rodrigo Siqueira
>https://siqueira.tech

Yours,
Wan Jiabing

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
