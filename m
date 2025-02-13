Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BABA34A45
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C279C10EB35;
	Thu, 13 Feb 2025 16:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="l6Z/ft7e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ffRAqjCY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oIopPTUD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E47Prmjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826B910EB35;
 Thu, 13 Feb 2025 16:41:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C8F0211C7;
 Thu, 13 Feb 2025 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739464885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JWl+r+gUIvCo808V0kOVypR+dgn1MwvqairpO3uzW58=;
 b=l6Z/ft7e08IocG1jYu1gpPtE2wVhq+JgGh+mMLeSbjwjsT1L2s7ds2uYMWtXNH7x2GVV/F
 gHUNUjqIt1zOzmtf0rsMANqa9xogrfKfZUNfUt4cWU5C8+HrDkDAD37JPLwKmanRlsnE+P
 y5u23Y/SgpnHVsM1TmuDRaxUUc+V8EU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739464885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JWl+r+gUIvCo808V0kOVypR+dgn1MwvqairpO3uzW58=;
 b=ffRAqjCYzQ+N+Pb4VWACGjgiY1fYrCDq2AkfMMd+lGb2GhdT+ioy/IoKn9puyb9DVjPC48
 hUjXUh5TbLAm7GAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oIopPTUD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=E47Prmjd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739464884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JWl+r+gUIvCo808V0kOVypR+dgn1MwvqairpO3uzW58=;
 b=oIopPTUDzsLSC6IrjZEpMOb2RF/C8j4JlC7YKKSeulTacPLzSsgbUEoI+7qdP0mL9frXMB
 4rDtiWFNU1qmNbkGPZukClgclv2n4tlMRuvdqwElnDLi8mlKcn/9ajrdd4NuQT61MBs1m1
 TQz9bod2iqLqU6Y8erfiOlZLjaZL/cs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739464884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JWl+r+gUIvCo808V0kOVypR+dgn1MwvqairpO3uzW58=;
 b=E47PrmjdvW5/CI9jBoewBioit0o3Di7Sx9+ME+eNaCjNTwmQmr2WG1+bGCeH8djUza79pP
 RTsoORXneHxOQ+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBBA4137DB;
 Thu, 13 Feb 2025 16:41:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TQ6ELLMgrmfqGAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 16:41:23 +0000
Message-ID: <b8004a16-6130-4232-91fd-85d62c2b84ec@suse.de>
Date: Thu, 13 Feb 2025 17:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Print GMU core firmware version at boot
To: Abel Vesa <abel.vesa@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
 <20241219-topic-gmu_fw_ver-v1-2-d403a70052d8@oss.qualcomm.com>
 <Z64fUjIfFzs4R8Im@linaro.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <Z64fUjIfFzs4R8Im@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2C8F0211C7
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.988]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,poorly.run,quicinc.com,linaro.org,ffwll.ch,somainline.org,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, qualcomm.com:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi

Am 13.02.25 um 17:35 schrieb Abel Vesa:
> On 24-12-19 23:36:56, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Log the version for informational purposes, such as for keeping track
>> of possible GMU fw-related failures in crash / CI logs.
>>
>> Intentionally not implemented on the if (gmu->legacy) codepath, as
>> these registers seem not to be used on there.
>>
>> Downstream additionally warns if the firmware version is too old for
>> a given GPU, but we already pair the binary to a given GPU, so let's
>> not go there at the moment.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 14db7376c712d19446b38152e480bd5a1e0a5198..a7ea2b2af1dc3816906236df929df36e37d8f606 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -729,6 +729,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>>   	const struct firmware *fw_image = adreno_gpu->fw[ADRENO_FW_GMU];
>>   	const struct block_header *blk;
>>   	u32 reg_offset;
>> +	u32 ver;
>>   
>>   	u32 itcm_base = 0x00000000;
>>   	u32 dtcm_base = 0x00040000;
>> @@ -775,6 +776,12 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>>   		}
>>   	}
>>   
>> +	ver = gmu_read(gmu, REG_A6XX_GMU_CORE_FW_VERSION);
>> +	DRM_INFO("Loaded GMU firmware v%u.%u.%u\n",
>> +		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
>> +		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
>> +		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
> I get the following spam:
>
> [  109.928924] [drm] Loaded GMU firmware v3.1.10
> [  110.301295] [drm] Loaded GMU firmware v3.1.10
> [  110.472620] [drm] Loaded GMU firmware v3.1.10
> [  111.164303] [drm] Loaded GMU firmware v3.1.10
> [  111.864830] [drm] Loaded GMU firmware v3.1.10
> ...
>
> Stacktrace shows this being called from runtime resume:
>
> [   19.380390] Call trace:
> [   19.380391]  show_stack+0x18/0x24 (C)
> [   19.380399]  dump_stack_lvl+0x40/0x84
> [   19.380403]  dump_stack+0x18/0x24
> [   19.380405]  a6xx_gmu_resume+0x450/0xc44 [msm]
> [   19.380426]  a6xx_gmu_pm_resume+0x34/0x220 [msm]
> [   19.380437]  adreno_runtime_resume+0x28/0x34 [msm]
> [   19.380446]  pm_generic_runtime_resume+0x28/0x3c
> [   19.380451]  __rpm_callback+0x84/0x390
> [   19.380453]  rpm_resume+0x3d0/0x5c0
> [   19.380455]  __pm_runtime_resume+0x4c/0x94
> [   19.380457]  adreno_get_param+0xdc/0x274 [msm]
> [   19.380466]  msm_ioctl_get_param+0x5c/0x68 [msm]
> [   19.380475]  drm_ioctl_kernel+0xd4/0x10c [drm]
> [   19.380491]  drm_ioctl+0x26c/0x40c [drm]
> [   19.380499]  __arm64_sys_ioctl+0x90/0xcc
> [   19.380503]  invoke_syscall+0x40/0xf8
> [   19.380505]  el0_svc_common+0xac/0xdc
> [   19.380506]  do_el0_svc+0x1c/0x28
> [   19.380508]  el0_svc+0x34/0x7c
> [   19.380512]  el0t_64_sync_handler+0x84/0x108
> [   19.380513]  el0t_64_sync+0x198/0x19c
>
> So maybe DRM_INFO_ONCE instead ?

drm_dbg() seems appropriate. Most of the time, firmware versions are not 
interesting.

Best regards
Thomas

>
>> +
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.47.1
>>
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

