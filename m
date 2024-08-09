Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC994CF8B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 13:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E4210E8D7;
	Fri,  9 Aug 2024 11:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="j8xEG4in";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sFifRrco";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j8xEG4in";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sFifRrco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D29B10E8D7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 11:51:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 806EC1FF51;
 Fri,  9 Aug 2024 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723204284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GNHIaRtDmmZIZgbm8EvjFeGOWqiM3FgvyCOxwrtw2Cc=;
 b=j8xEG4inW8G9+Odd8GlRZO/o1b0iDw1ZAYZ7rQtD07bpoj0qZfZ9ktgtb8oG6w8xcYCWQp
 5Bw3dSiEzZnns5paiEBqSKEJpTUfKaPxFvIf6nZkFBkB8SVX+eNGx0bvdq/86puiusB9N5
 Vix7F4PESgWHQXzLaF3qiBYykCmlCJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723204284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GNHIaRtDmmZIZgbm8EvjFeGOWqiM3FgvyCOxwrtw2Cc=;
 b=sFifRrcokeq6nwkwS1Yv8UNR1Au6wr2selT2wmJl4FytxQDGpGP1jeLyV/Km1+Kh6J2JO1
 rJaXm+qr2j7p0nAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723204284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GNHIaRtDmmZIZgbm8EvjFeGOWqiM3FgvyCOxwrtw2Cc=;
 b=j8xEG4inW8G9+Odd8GlRZO/o1b0iDw1ZAYZ7rQtD07bpoj0qZfZ9ktgtb8oG6w8xcYCWQp
 5Bw3dSiEzZnns5paiEBqSKEJpTUfKaPxFvIf6nZkFBkB8SVX+eNGx0bvdq/86puiusB9N5
 Vix7F4PESgWHQXzLaF3qiBYykCmlCJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723204284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GNHIaRtDmmZIZgbm8EvjFeGOWqiM3FgvyCOxwrtw2Cc=;
 b=sFifRrcokeq6nwkwS1Yv8UNR1Au6wr2selT2wmJl4FytxQDGpGP1jeLyV/Km1+Kh6J2JO1
 rJaXm+qr2j7p0nAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4337813A7D;
 Fri,  9 Aug 2024 11:51:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dOLRDrwCtmahYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Aug 2024 11:51:24 +0000
Message-ID: <0524b8f2-0bee-49c5-9326-f8dba18b221f@suse.de>
Date: Fri, 9 Aug 2024 13:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/ast: dp501: Use struct drm_edid and helpers
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240806125601.78650-1-tzimmermann@suse.de>
 <20240806125601.78650-6-tzimmermann@suse.de>
 <99d85d28-75bd-4042-9036-f4b111405ca4@redhat.com>
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
In-Reply-To: <99d85d28-75bd-4042-9036-f4b111405ca4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Am 09.08.24 um 13:36 schrieb Jocelyn Falempe:
>
>
> On 06/08/2024 14:52, Thomas Zimmermann wrote:
>> Convert DP501 support to struct drm_edid and its helpers. Simplifies
>> and modernizes the EDID handling.
>>
>> The driver reads 4 bytes at once, but the overall read length is now
>> variable. Therefore update the EDID read loop to never return more than
>> the requested bytes.
>
> Thanks for this patch.
> I don't have a hardware to test, but I think it may break the EDID 
> reading.

Unfortunately, I don't have the hardware either and I've not even found 
something that would use this code.

>
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_dp501.c | 92 ++++++++++++++++++++-------------
>>   1 file changed, 55 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c 
>> b/drivers/gpu/drm/ast/ast_dp501.c
>> index 478efa226170..1c5a4902d4c2 100644
>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
>> @@ -318,32 +318,63 @@ static bool ast_dp501_is_connected(struct 
>> ast_device *ast)
>>       return true;
>>   }
>>   -static bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>> +static int ast_dp512_read_edid_block(void *data, u8 *buf, unsigned 
>> int block, size_t len)
>>   {
>> -    struct ast_device *ast = to_ast_device(dev);
>> -    u32 i, boot_address, offset, data;
>> -    u32 *pEDIDidx;
>> +    struct ast_device *ast = data;
>> +    u32 i, boot_address, offset, ediddata;
>>   -    if (!ast_dp501_is_connected(ast))
>> -        return false;
>> +    if (block > (512 / EDID_LENGTH))
>> +        return -EIO;
>> +
>> +    offset = AST_DP501_EDID_DATA + block * EDID_LENGTH;
>>         if (ast->config_mode == ast_use_p2a) {
>>           boot_address = get_fw_base(ast);
>>   -        /* Read EDID */
>> -        offset = AST_DP501_EDID_DATA;
>> -        for (i = 0; i < 128; i += 4) {
>> -            data = ast_mindwm(ast, boot_address + offset + i);
>> -            pEDIDidx = (u32 *)(ediddata + i);
>> -            *pEDIDidx = data;
>> +        for (i = 0; i < len; i += 4) {

Here, i need to round up len to a multiple of 4.

>> +            ediddata = ast_mindwm(ast, boot_address + offset + i);
>
> I think "i" is always a multiple of 4, so the switch case is broken, 
> and will always go to case 0, so reading only 1 byte every 4 bytes ?

Right, what I want is ((len - i) % 4),  so that i get the remaining 
bytes to read.

Best regards
Thomas

>
>> +
>> +            switch (i % 4) {
>> +            case 3:
>> +                *buf = (ediddata >> 24) & 0xff;
>> +                ++buf;
>> +                fallthrough;
>> +            case 2:
>> +                *buf = (ediddata >> 16) & 0xff;
>> +                ++buf;
>> +                fallthrough;
>> +            case 1:
>> +                *buf = (ediddata >> 8) & 0xff;
>> +                ++buf;
>> +                fallthrough;
>> +            case 0:
>> +                *buf = (ediddata) & 0xff;
>> +                ++buf;
>> +                break;
>> +            }
>>           }
>>       } else {
>> -        /* Read EDID */
>> -        offset = AST_DP501_EDID_DATA;
>> -        for (i = 0; i < 128; i += 4) {
>> -            data = readl(ast->dp501_fw_buf + offset + i);
>> -            pEDIDidx = (u32 *)(ediddata + i);
>> -            *pEDIDidx = data;
>> +        for (i = 0; i < len; i += 4) {
>> +            ediddata = readl(ast->dp501_fw_buf + offset + i);
>> +
>> +            switch (i % 4) {
>> +            case 3:
>> +                *buf = (ediddata >> 24) & 0xff;
>> +                ++buf;
>> +                fallthrough;
>> +            case 2:
>> +                *buf = (ediddata >> 16) & 0xff;
>> +                ++buf;
>> +                fallthrough;
>> +            case 1:
>> +                *buf = (ediddata >> 8) & 0xff;
>> +                ++buf;
>> +                fallthrough;
>> +            case 0:
>> +                *buf = (ediddata) & 0xff;
>> +                ++buf;
>> +                break;
>> +            }
>>           }
>>       }
>>   @@ -511,29 +542,16 @@ static const struct drm_encoder_helper_funcs 
>> ast_dp501_encoder_helper_funcs = {
>>     static int ast_dp501_connector_helper_get_modes(struct 
>> drm_connector *connector)
>>   {
>> -    void *edid;
>> -    bool succ;
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +    const struct drm_edid *drm_edid;
>>       int count;
>>   -    edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
>> -    if (!edid)
>> -        goto err_drm_connector_update_edid_property;
>> -
>> -    succ = ast_dp501_read_edid(connector->dev, edid);
>> -    if (!succ)
>> -        goto err_kfree;
>> -
>> -    drm_connector_update_edid_property(connector, edid);
>> -    count = drm_add_edid_modes(connector, edid);
>> -    kfree(edid);
>> +    drm_edid = drm_edid_read_custom(connector, 
>> ast_dp512_read_edid_block, ast);
>> +    drm_edid_connector_update(connector, drm_edid);
>> +    count = drm_edid_connector_add_modes(connector);
>> +    drm_edid_free(drm_edid);
>>         return count;
>> -
>> -err_kfree:
>> -    kfree(edid);
>> -err_drm_connector_update_edid_property:
>> -    drm_connector_update_edid_property(connector, NULL);
>> -    return 0;
>>   }
>>     static int ast_dp501_connector_helper_detect_ctx(struct 
>> drm_connector *connector,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

