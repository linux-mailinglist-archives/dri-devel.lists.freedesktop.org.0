Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE9977B89
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AF210E18A;
	Fri, 13 Sep 2024 08:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eCf0k6dv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Lmia52J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eCf0k6dv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Lmia52J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB0E10E18A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:47:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3BBA1F7C6;
 Fri, 13 Sep 2024 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726217276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+eeq5KOtZbzLuPrbo8KKadkmCbqn0FcNp68J/oYlI70=;
 b=eCf0k6dv6CZSUp8eOq8AENd4ilTP+N5Yxf9oJRLLiZ96/iPnG+k3sZioq5AjjeSXKoV7Gy
 YDEcoFXhULEBElhwyMjOHc3tan7EXEMwgyJZ3E5Buyztd/y4/wEU/wlbAwkEM8hTLwPCMz
 aQuxl3h1yZr81W9bTdR2V59rHUk4DLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726217276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+eeq5KOtZbzLuPrbo8KKadkmCbqn0FcNp68J/oYlI70=;
 b=4Lmia52J4ql3oOrNj5skmluc8CJUTNu1gTV+HK+6f2gggpLYYaBcEELEv25Q34LDS8/O2Y
 LwsrTtHdMaIh9sAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726217276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+eeq5KOtZbzLuPrbo8KKadkmCbqn0FcNp68J/oYlI70=;
 b=eCf0k6dv6CZSUp8eOq8AENd4ilTP+N5Yxf9oJRLLiZ96/iPnG+k3sZioq5AjjeSXKoV7Gy
 YDEcoFXhULEBElhwyMjOHc3tan7EXEMwgyJZ3E5Buyztd/y4/wEU/wlbAwkEM8hTLwPCMz
 aQuxl3h1yZr81W9bTdR2V59rHUk4DLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726217276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+eeq5KOtZbzLuPrbo8KKadkmCbqn0FcNp68J/oYlI70=;
 b=4Lmia52J4ql3oOrNj5skmluc8CJUTNu1gTV+HK+6f2gggpLYYaBcEELEv25Q34LDS8/O2Y
 LwsrTtHdMaIh9sAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8793E13999;
 Fri, 13 Sep 2024 08:47:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5W+qHzz842aBRQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Sep 2024 08:47:56 +0000
Message-ID: <99f62716-6217-4285-a086-598da23a998e@suse.de>
Date: Fri, 13 Sep 2024 10:47:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/ast: dp501: Avoid upcasting to struct ast_device
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240911115347.899148-1-tzimmermann@suse.de>
 <20240911115347.899148-7-tzimmermann@suse.de>
 <c673e697-c20c-492f-8a58-fac01a5ec896@redhat.com>
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
In-Reply-To: <c673e697-c20c-492f-8a58-fac01a5ec896@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
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

Am 12.09.24 um 15:48 schrieb Jocelyn Falempe:
[...]
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -110,7 +110,7 @@ static void ast_detect_tx_chip(struct ast_device 
>> *ast, bool need_post)
>>               ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, 
>> GFP_KERNEL);
>>               if (ast->dp501_fw_addr) {
>>                   /* backup firmware */
>> -                if (ast_backup_fw(dev, ast->dp501_fw_addr, 32*1024)) {
>> +                if (ast_backup_fw(ast, ast->dp501_fw_addr, 32*1024)) {
>
> Maybe we can remove the fw_addr parameter of ast_backup_fw(), it's the 
> only call to this function.

I don't mind, but it belongs in a separate patchset. After doing 
something about the odd TX chips that we talked about, I intent to 
rework the TX- and GPU-POST code.

Best regards
Thomas

>
>>                       drmm_kfree(dev, ast->dp501_fw_addr);
>>                       ast->dp501_fw_addr = NULL;
>>                   }
>> diff --git a/drivers/gpu/drm/ast/ast_post.c 
>> b/drivers/gpu/drm/ast/ast_post.c
>> index 902bf8114b6e..324778c72d23 100644
>> --- a/drivers/gpu/drm/ast/ast_post.c
>> +++ b/drivers/gpu/drm/ast/ast_post.c
>> @@ -360,7 +360,7 @@ void ast_post_gpu(struct drm_device *dev)
>>           else
>>               ast_init_dram_reg(dev);
>>   -        ast_init_3rdtx(dev);
>> +        ast_init_3rdtx(ast);
>>       } else {
>>           if (ast->tx_chip == AST_TX_SIL164)
>>               ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 
>> 0x80);    /* Enable DVO */
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

