Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D2F4FD0D7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 08:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA2C10FCAB;
	Tue, 12 Apr 2022 06:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEAB10FC9C;
 Tue, 12 Apr 2022 06:52:13 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aef95.dynamic.kabel-deutschland.de
 [95.90.239.149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 83B6261EA1929;
 Tue, 12 Apr 2022 08:52:11 +0200 (CEST)
Message-ID: <42d34e82-3c15-c33a-5cd4-a0d2436e44d2@molgen.mpg.de>
Date: Tue, 12 Apr 2022 08:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: AMD Display Core (DC) patches (was: [PATCH 13/16] drm/amd/display:
 Revert FEC check in validation)
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>
References: <20220325225402.469841-1-alex.hung@amd.com>
 <20220325225402.469841-14-alex.hung@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220325225402.469841-14-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: stylon.wang@amd.com, wayne.lin@amd.com, Sunpeng.Li@amd.com,
 Bhawanpreet.Lakha@amd.com, qingqing.zhuo@amd.com,
 Martin Leung <Martin.Leung@amd.com>, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, amd-gfx@lists.freedesktop.org, solomon.chiu@amd.com,
 Aurabindo.Pillai@amd.com, Greg KH <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, George Shen <George.Shen@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Cc: +dri-devel@lists.freedesktop.org, +Daniel Vetter, +Alexander 
Deucher, +Greg KH]


Dear Alex,


I am a little confused and upset about how Display Core patches are 
handled in the Linux kernel.


Am 25.03.22 um 23:53 schrieb Alex Hung:
> From: Martin Leung <Martin.Leung@amd.com>

git puts a line “This reverts commit …” into the commit message, when 
something is reverted. Why isn’t this here? Right now, commit 
7d56a154e22f, reverted here, is proposed for the stable series. I guess, 
because these indicators and meta data are missing.

> why and how:
> causes failure on install on certain machines

Why are such kind of commit messages accepted? What does “failure on 
install” even mean? Why can’t the machine configuration be documented so 
it can be reproduced, when necessary.

No less confusing, the date you posted it on amd-gfx is from March 25th, 
2022, but the author date of the commit in agd5f/amd-staging-drm-next is 
`Fri Mar 18 11:12:36 2022 -0400`. Why is the patch missing the Date 
field then?

> Reviewed-by: George Shen <George.Shen@amd.com>
> Acked-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Martin Leung <Martin.Leung@amd.com>

Shouldn’t the Signed-off-by line by the author go first?

You committed this on `Mon Mar 28 08:26:48 2022 -0600`, while you posted 
the patch on amd-gfx on Friday. How should *proper* review happen over 
the weekend?

> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index f2ad8f58e69c..c436db416708 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -1496,10 +1496,6 @@ bool dc_validate_boot_timing(const struct dc *dc,
>   	if (!link->link_enc->funcs->is_dig_enabled(link->link_enc))
>   		return false;
>   
> -	/* Check for FEC status*/
> -	if (link->link_enc->funcs->fec_is_active(link->link_enc))
> -		return false;
> -
>   	enc_inst = link->link_enc->funcs->get_dig_frontend(link->link_enc);
>   
>   	if (enc_inst == ENGINE_ID_UNKNOWN)

The patch reverted here, also lacked proper review, had a to-be desired 
commit message, did not follow the Linux kernel coding style (missing 
space before the comment terminator), so should not have been committed 
in the first place.

Seeing how many people are in the Cc list, I would have hoped, that 
somebody noticed and commented. The current state also makes it really 
hard for non-AMD employees to get the necessary information to do proper 
reviews as the needed documentation and information is non-public. So 
good/excellent commit messages are a must. I think to remember, you 
replied to me once, that Display Core patches are shared also with the 
Microsoft Windows driver, restricting the workflow options. But I think 
the issues I mentioned are unrelated. I know graphics hardware is very 
complex, but if quality of the commits and review would be improved, 
hopefully it saves time for everyone in the end, as less bugs are 
introduced.

Could AMD team please address these issues as soon as possible?


Kind regards,

Paul
