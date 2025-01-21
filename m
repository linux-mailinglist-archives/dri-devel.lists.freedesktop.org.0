Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3415A17EC2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 14:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D672010E5A6;
	Tue, 21 Jan 2025 13:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sSSvpDaI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FcOZimeR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSSvpDaI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FcOZimeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EC410E586
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 13:21:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5471211DD;
 Tue, 21 Jan 2025 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737465671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+sJyxu73Eczus6dKaUCw8+4wcc6C45+DbJZXOC/TtLY=;
 b=sSSvpDaIYMRra6bkUr3+KUJThtxENFk7SrT1853Bt+sONI6iNWqtoNTgAJuLMQIY7BrpnK
 912nb56XB/g4RYxRn3zSkUojMiziUzVS+8eY5j7g7T1/iTKpNluj58UqVU1FimHlXBgqxS
 +TIvtP+SkRIN2CAAlh1yXeg65WOpDMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737465671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+sJyxu73Eczus6dKaUCw8+4wcc6C45+DbJZXOC/TtLY=;
 b=FcOZimeRVS8inlZLmtEUiqliJW3Oa3YRgLApWSeDUpKlnXO6zJiUXMxKZ90tdi8/21cdp8
 ZIBbm3JCgVVOoBAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sSSvpDaI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FcOZimeR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737465671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+sJyxu73Eczus6dKaUCw8+4wcc6C45+DbJZXOC/TtLY=;
 b=sSSvpDaIYMRra6bkUr3+KUJThtxENFk7SrT1853Bt+sONI6iNWqtoNTgAJuLMQIY7BrpnK
 912nb56XB/g4RYxRn3zSkUojMiziUzVS+8eY5j7g7T1/iTKpNluj58UqVU1FimHlXBgqxS
 +TIvtP+SkRIN2CAAlh1yXeg65WOpDMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737465671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+sJyxu73Eczus6dKaUCw8+4wcc6C45+DbJZXOC/TtLY=;
 b=FcOZimeRVS8inlZLmtEUiqliJW3Oa3YRgLApWSeDUpKlnXO6zJiUXMxKZ90tdi8/21cdp8
 ZIBbm3JCgVVOoBAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A45911387C;
 Tue, 21 Jan 2025 13:21:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +Z9nJkefj2fzPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Jan 2025 13:21:11 +0000
Message-ID: <5eb6100f-5930-4281-94f9-9ec0dc943569@suse.de>
Date: Tue, 21 Jan 2025 14:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/ast: Only warn about unsupported TX chips on Gen4
 and later
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-9-tzimmermann@suse.de>
 <51d2c199-e7ea-4078-acb9-8ab3ce9bc4dc@redhat.com>
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
In-Reply-To: <51d2c199-e7ea-4078-acb9-8ab3ce9bc4dc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C5471211DD
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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


Am 20.01.25 um 11:37 schrieb Jocelyn Falempe:
> On 17/01/2025 11:29, Thomas Zimmermann wrote:
>> Only Gen4 and later read the installed TX chip from the SoC. So only
>> warn on those generations about unsupported chips.
>
> Thanks, it looks good to me.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Thanks for reviewing. I'll merge the series by the end of the week if 
nothing else comes in.

Best regards
Thomas

>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_main.c | 40 +++++++++++++++++++---------------
>>   1 file changed, 22 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_main.c 
>> b/drivers/gpu/drm/ast/ast_main.c
>> index b0d1b99ed532b..ba69280b33e78 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -78,21 +78,6 @@ static void ast_detect_tx_chip(struct ast_device 
>> *ast, bool need_post)
>>       struct drm_device *dev = &ast->base;
>>       u8 vgacra3, vgacrd1;
>>   -    /*
>> -     * Several of the listed TX chips are not explicitly supported
>> -     * by the ast driver. If these exist in real-world devices, they
>> -     * are most likely reported as VGA or SIL164 outputs. We warn here
>> -     * to get bug reports for these devices. If none come in for some
>> -     * time, we can begin to fail device probing on these values.
>> -     */
>> -    vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 
>> AST_IO_VGACRD1_TX_TYPE_MASK);
>> -    drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ITE66121_VBIOS,
>> -         "ITE IT66121 detected, 0x%x, Gen%lu\n", vgacrd1, 
>> AST_GEN(ast));
>> -    drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_CH7003_VBIOS,
>> -         "Chrontel CH7003 detected, 0x%x, Gen%lu\n", vgacrd1, 
>> AST_GEN(ast));
>> -    drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ANX9807_VBIOS,
>> -         "Analogix ANX9807 detected, 0x%x, Gen%lu\n", vgacrd1, 
>> AST_GEN(ast));
>> -
>>       /* Check 3rd Tx option (digital output afaik) */
>>       ast->tx_chip = AST_TX_NONE;
>>   @@ -116,9 +101,9 @@ static void ast_detect_tx_chip(struct 
>> ast_device *ast, bool need_post)
>>            * the SOC scratch register #1 bits 11:8 (interestingly marked
>>            * as "reserved" in the spec)
>>            */
>> -        jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
>> -                          AST_IO_VGACRD1_TX_TYPE_MASK);
>> -        switch (jreg) {
>> +        vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
>> +                         AST_IO_VGACRD1_TX_TYPE_MASK);
>> +        switch (vgacrd1) {
>>           /*
>>            * GEN4 to GEN6
>>            */
>> @@ -144,6 +129,25 @@ static void ast_detect_tx_chip(struct ast_device 
>> *ast, bool need_post)
>>           case AST_IO_VGACRD1_TX_ASTDP:
>>               ast->tx_chip = AST_TX_ASTDP;
>>               break;
>> +        /*
>> +         * Several of the listed TX chips are not explicitly supported
>> +         * by the ast driver. If these exist in real-world devices, 
>> they
>> +         * are most likely reported as VGA or SIL164 outputs. We 
>> warn here
>> +         * to get bug reports for these devices. If none come in for 
>> some
>> +         * time, we can begin to fail device probing on these values.
>> +         */
>> +        case AST_IO_VGACRD1_TX_ITE66121_VBIOS:
>> +            drm_warn(dev, "ITE IT66121 detected, 0x%x, Gen%lu\n",
>> +                 vgacrd1, AST_GEN(ast));
>> +            break;
>> +        case AST_IO_VGACRD1_TX_CH7003_VBIOS:
>> +            drm_warn(dev, "Chrontel CH7003 detected, 0x%x, Gen%lu\n",
>> +                 vgacrd1, AST_GEN(ast));
>> +            break;
>> +        case AST_IO_VGACRD1_TX_ANX9807_VBIOS:
>> +            drm_warn(dev, "Analogix ANX9807 detected, 0x%x, Gen%lu\n",
>> +                 vgacrd1, AST_GEN(ast));
>> +            break;
>>           }
>>       }
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

