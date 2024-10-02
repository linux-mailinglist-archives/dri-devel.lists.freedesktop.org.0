Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41C98DDBE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 16:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96ECA10E753;
	Wed,  2 Oct 2024 14:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VRN8fUcU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZUZYvw7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VRN8fUcU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZUZYvw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04E610E753
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 14:51:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A54D21998;
 Wed,  2 Oct 2024 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727880718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hswwSYWp6R+Ly+qyYXtkvRmfjgPVesLZWu39YZnYSLg=;
 b=VRN8fUcU+Y9qbMpBMvzOMJHFuPA4ieIAHvyXqlP+2Ra2p1TTzbQ51WZb/uKo+lt5aN4HXQ
 ZgKyBfdA2CVaKYXC08z4rtAEIpowcuKjiMuoE+DlmDaXd9y1goK4nsFM8L3vTZkP0muPAV
 4ucidFZlcUlP1dUcNdnoM4NcdE3LatE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727880718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hswwSYWp6R+Ly+qyYXtkvRmfjgPVesLZWu39YZnYSLg=;
 b=sZUZYvw7W/pXSI3+jqnuaGivRB164nRSO76/CqKeuRtfH3A6lhyt1Dacl+1rz2HWf9jacA
 9LqQKujZvklddpDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VRN8fUcU;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sZUZYvw7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727880718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hswwSYWp6R+Ly+qyYXtkvRmfjgPVesLZWu39YZnYSLg=;
 b=VRN8fUcU+Y9qbMpBMvzOMJHFuPA4ieIAHvyXqlP+2Ra2p1TTzbQ51WZb/uKo+lt5aN4HXQ
 ZgKyBfdA2CVaKYXC08z4rtAEIpowcuKjiMuoE+DlmDaXd9y1goK4nsFM8L3vTZkP0muPAV
 4ucidFZlcUlP1dUcNdnoM4NcdE3LatE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727880718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hswwSYWp6R+Ly+qyYXtkvRmfjgPVesLZWu39YZnYSLg=;
 b=sZUZYvw7W/pXSI3+jqnuaGivRB164nRSO76/CqKeuRtfH3A6lhyt1Dacl+1rz2HWf9jacA
 9LqQKujZvklddpDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2963213A6E;
 Wed,  2 Oct 2024 14:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qL3eCA5e/WalOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Oct 2024 14:51:58 +0000
Message-ID: <9b55ce32-a53d-4345-ad7e-de9e3dd74996@suse.de>
Date: Wed, 2 Oct 2024 16:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/31] accel/ivpu: Fixes for 6.12-rc1
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
 <6f18b890-2fa2-4c81-ab4e-2816d0ce98d9@linux.intel.com>
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
In-Reply-To: <6f18b890-2fa2-4c81-ab4e-2816d0ce98d9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4A54D21998
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FREEMAIL_CC(0.00)[gmail.com,quicinc.com];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

Am 02.10.24 um 15:26 schrieb Jacek Lawrynowicz:
> Applied to drm-misc-fixes

And removed from drm-misc-fixes.

The -misc-fixes branch is for fixing bugs that either regressed working 
code or to resolve serious bugs that affects upstream users. It is NOT a 
dumping ground for all kinds of things you want to get into upstream 
quickly. Your review process should have found these issues already.

Best regards
Thomas

>
> On 9/30/2024 9:52 PM, Jacek Lawrynowicz wrote:
>> Most notable changes are coredump and tracing support.
>> The rest are stability fixes, some refactoring and typos.
>>
>> Changes in v2:
>> - Fix typos in FW API headers
>> - Split fw refactor commit into 2 commits and improved commit messages
>> - Fixed commit messages for state dump and power island commits
>> - Added limit and NULL termination for FW version string
>> - Documented sched_mode sysfs file
>>
>>
>> Andrzej Kacprowski (4):
>>    accel/ivpu: Update VPU FW API headers
>>    accel/ivpu: Allow reading dvfs_mode debugfs file
>>    accel/ivpu: Add test_mode bit to force turbo
>>    accel/ivpu: Fix reset_engine debugfs file logic
>>
>> Jacek Lawrynowicz (11):
>>    accel/ivpu: Rename ivpu_log_level to fw_log_level
>>    accel/ivpu: Refactor functions in ivpu_fw_log.c
>>    accel/ivpu: Fix fw log printing
>>    accel/ivpu: Limit FW version string length
>>    accel/ivpu: Stop using hardcoded DRIVER_DATE
>>    accel/ivpu: Add auto selection logic for job scheduler
>>    accel/ivpu: Remove invalid warnings
>>    accel/ivpu: Increase MS info buffer size
>>    accel/ivpu: Fix ivpu_jsm_dyndbg_control()
>>    accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
>>    accel/ivpu: Fix typos in ivpu_pm.c
>>
>> Jakub Pawlak (1):
>>    accel/ivpu: Add tracing for IPC/PM/JOB
>>
>> Karol Wachowski (12):
>>    accel/ivpu: Add coredump support
>>    accel/ivpu: Set 500 ns delay between power island TRICKLE and ENABLE
>>    accel/ivpu: Turn on autosuspend on Simics
>>    accel/ivpu: Add FW version debugfs entry
>>    accel/ivpu: Remove 1-tile power up Simics workaround
>>    accel/ivpu: Add one jiffy to bo_wait_ioctl timeout value
>>    accel/ivpu: Print JSM message result in case of error
>>    accel/ivpu: Remove skip of clock own resource ack on Simics
>>    accel/ivpu: Prevent recovery invocation during probe and resume
>>    accel/ivpu: Refactor failure diagnostics during boot
>>    accel/ivpu: Do not fail on cmdq if failed to allocate preemption
>>      buffers
>>    accel/ivpu: Use whole user and shave ranges for preemption buffers
>>
>> Tomasz Rusinowicz (3):
>>    accel/ivpu: Reset fw log on cold boot
>>    accel/ivpu: Add FW state dump on TDR
>>    accel/ivpu: Make DB_ID and JOB_ID allocations incremental
>>
>>   drivers/accel/ivpu/Kconfig             |   1 +
>>   drivers/accel/ivpu/Makefile            |   6 +-
>>   drivers/accel/ivpu/ivpu_coredump.c     |  39 ++++
>>   drivers/accel/ivpu/ivpu_coredump.h     |  25 ++
>>   drivers/accel/ivpu/ivpu_debugfs.c      |  86 +++----
>>   drivers/accel/ivpu/ivpu_drv.c          |  52 +++--
>>   drivers/accel/ivpu/ivpu_drv.h          |  13 +-
>>   drivers/accel/ivpu/ivpu_fw.c           |  26 ++-
>>   drivers/accel/ivpu/ivpu_fw.h           |   9 +-
>>   drivers/accel/ivpu/ivpu_fw_log.c       | 113 +++++----
>>   drivers/accel/ivpu/ivpu_fw_log.h       |  17 +-
>>   drivers/accel/ivpu/ivpu_gem.c          |   3 +
>>   drivers/accel/ivpu/ivpu_hw.c           |   5 +-
>>   drivers/accel/ivpu/ivpu_hw.h           |   1 -
>>   drivers/accel/ivpu/ivpu_hw_btrs.c      |   9 -
>>   drivers/accel/ivpu/ivpu_hw_ip.c        |   8 +-
>>   drivers/accel/ivpu/ivpu_ipc.c          |  45 ++--
>>   drivers/accel/ivpu/ivpu_ipc.h          |   9 +-
>>   drivers/accel/ivpu/ivpu_job.c          | 102 +++++----
>>   drivers/accel/ivpu/ivpu_jsm_msg.c      |  34 +--
>>   drivers/accel/ivpu/ivpu_jsm_msg.h      |   2 +
>>   drivers/accel/ivpu/ivpu_ms.c           |   2 +-
>>   drivers/accel/ivpu/ivpu_pm.c           |  24 +-
>>   drivers/accel/ivpu/ivpu_sysfs.c        |  24 ++
>>   drivers/accel/ivpu/ivpu_trace.h        |  73 ++++++
>>   drivers/accel/ivpu/ivpu_trace_points.c |   9 +
>>   drivers/accel/ivpu/vpu_boot_api.h      |  45 ++--
>>   drivers/accel/ivpu/vpu_jsm_api.h       | 303 +++++++++++++++++++++----
>>   include/uapi/drm/ivpu_accel.h          |   3 -
>>   29 files changed, 797 insertions(+), 291 deletions(-)
>>   create mode 100644 drivers/accel/ivpu/ivpu_coredump.c
>>   create mode 100644 drivers/accel/ivpu/ivpu_coredump.h
>>   create mode 100644 drivers/accel/ivpu/ivpu_trace.h
>>   create mode 100644 drivers/accel/ivpu/ivpu_trace_points.c
>>
>> --
>> 2.45.1

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

