Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id is3nDjkBqWkb0QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 05:06:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5158B20AB20
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 05:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5F610EAF2;
	Thu,  5 Mar 2026 04:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="My3YXpbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365D910EAF2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 04:06:13 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so54967225ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 20:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772683573; x=1773288373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hzKoIMit9qZ03VESDYjaexQZSnD/V7ffdmJAeddmBhw=;
 b=My3YXpbTWgIY8qHmCikZ3M0IevlFzfmCqbFA7cNj4YDl+Ta9eCD5mW5nGgZHbvhFxj
 s6vtfVkIYBwvB6g5ur36Kt9gxDWdBmEPkO3OX18bsBB314OfXNBkGHk5r9pieZqMz1iN
 C6OqT61vaif9GCErppCi07yHtDIFED02dCq8alTGxoP9J4GKycpGmWZbyz5bFdGH91H3
 XeHooKjJxMhNyHxWjwwV4t6pCNMde1e4QCysi+37cNUoCz9shVZCy+77KQqDKWAroh23
 KcO53ba3WSsYhxe86osSe+hBZLV+B7I/A7qIq1tkAqipdeoJJlNG1AqoFyeTC5yyDLDo
 tMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772683573; x=1773288373;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hzKoIMit9qZ03VESDYjaexQZSnD/V7ffdmJAeddmBhw=;
 b=PwzqLDjv7OsRLr7g+nqgxVcSv8eiGtUc5rpZmCtdMMogwz2GGwMHgZ3Dfqu5bBN/R1
 8/SSnpqsavPdVntt1DDEWmXhaAxdNkBBORN9atCVE3e9zTrSTZAZ54X9NNNXA0mMPNxA
 +aJImoY/f3e6shrMtZ/ppNXDIDg9ra5e5dRFLU5Q4nvUXSwY30KbJeg0nciuy7YyDL+M
 6yYODoa+oWN05P0IBZOCPefU4W+VGekeIinKgx/bBoYwGZ1NSgSO8ErUE3CCMMfbLMDr
 MCZ02ciLCmS+JotZzgDnsVw+UuNTf1C0sDBHb1X3hCyIYRxhhhzjmspjgYm+bT6uf9zP
 GLZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBSOEt2rkLlilzpJSgQ9EJicepTUgveRmPckwjhoGMM8diR/hNvh7ls4TbDgxsA1P0DcERsT/waQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztJ11PRMriALbOWel81FVUfDHcE76+1AkVcl2tOVRigIJ2od/Y
 OVAiFpYFbSAc8J4dpyO69Q2L5Ebh/IIWtdnKFzMtvVVQztPXM49Yz3K7
X-Gm-Gg: ATEYQzyKMHYIfhZGj2ixaX0GHAC9xeq0hrQk7D6DcH3hHW51Pypnzw8zLcLGMUPdZhv
 IhzOAgzWqw1yyJmbu0Hu6ORhHYebeXb32NvRw/1Cuaarl8XrcGJWxWSYwtDAoWKj5nneVzUvHID
 oVectTuMd+Y612XTHGPxfJWDfd+FXMAlRx1Vl9zX7ECA6/mNYpu0B7IT9YjiA0ggu4o/s3oSe1P
 KNx92ktZmJwqDCVvTZXNSLc+w+Lj5/yss1yqBJkS0JL78kYFjo7WSOgit7IJM05Fh9yA4JhtbuZ
 SJGSo2mmaKR2DU58DP60aUOmmJN79VHcAtmv9IIAD7AlVRWPe7Gmb8iurH7UtzMS+AhdxGu8RwE
 ZX2RzYV+SI3ZxRiSPeYfCsz6ZHxg7vZ1LO38y8utgzCNv+o7kHxveCpeaBYjw51UmoZkybDo/p2
 6DL3L8QgHizM/QMJRi1q6FxJFmAFdLI444EsTVqEiS2jtZEpIHdzgbGFkz47henw1eQB5TToE9o
 JppJ99GOWcSKBARnUHTLZberb9U74I7p/iLSMeodZDfQTTQTJR6aGoYBH1ONZ62IMyodyfGlC/g
 MIrS8JIOwYub
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id
 d9443c01a7336-2ae75c44e3amr7901535ad.24.1772683572458; 
 Wed, 04 Mar 2026 20:06:12 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:50f9:a2c6:c0a6:8352?
 ([2601:1c0:5780:9200:50f9:a2c6:c0a6:8352])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b257esm211227605ad.4.2026.03.04.20.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 20:06:12 -0800 (PST)
Message-ID: <5688d830-b8bc-4495-9b5b-0f6ee85df51a@gmail.com>
Date: Wed, 4 Mar 2026 20:06:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: novatek-nt36672a: Convert to
 mipi_dsi_*_multi() helpers
To: Doug Anderson <dianders@chromium.org>
Cc: sumit.semwal@linaro.org, neil.armstrong@linaro.org,
 jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260303035508.8288-1-chintanlike@gmail.com>
 <CAD=FV=WH-vUJ5HtGRWyjeKS0e_c4qZ+7Y3m8bbTg8atQ8-QdwQ@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAD=FV=WH-vUJ5HtGRWyjeKS0e_c4qZ+7Y3m8bbTg8atQ8-QdwQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 5158B20AB20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


Hi Doug,

Thanks for the detailed review — this is very helpful.

Good catch on a few of these.

> 
> On Mon, Mar 2, 2026 at 7:55 PM Chintan Patel <chintanlike@gmail.com> wrote:
>>
>> -static int nt36672a_panel_power_off(struct drm_panel *panel)
>> +static void nt36672a_panel_power_off(struct drm_panel *panel)
>>   {
>>          struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
>> -       int ret = 0;
>>
>>          gpiod_set_value(pinfo->reset_gpio, 1);
>>
>> -       ret = regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies);
>> -       if (ret)
>> -               dev_err(panel->dev, "regulator_bulk_disable failed %d\n", ret);
>> -
>> -       return ret;
>> +       if (regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->supplies) < 0)
>> +               dev_err(panel->dev, "regulator_bulk_disable failed\n");
> 
> nit: IMO It would have been OK to keep the local "ret" variable here,
> but I won't insist. That would have allowed you to keep printing the
> error code, which is nice. It's OK to have "ret" as a local variable
> even if you aren't returning it...
> 

I’ll restore the local ret variable in nt36672a_panel_power_off() so we 
continue printing the regulator error code even though the function now 
returns void.


>>   }
>>
>>   static int nt36672a_panel_unprepare(struct drm_panel *panel)
>>   {
>>          struct nt36672a_panel *pinfo = to_nt36672a_panel(panel);
>> -       int ret;
>> +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = pinfo->link };
>>
>>          /* send off cmds */
>> -       ret = nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
>> -                                pinfo->desc->num_off_cmds);
>> +       nt36672a_send_cmds(&dsi_ctx, pinfo->desc->off_cmds,
>> +                          pinfo->desc->num_off_cmds);
>>
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "failed to send DCS off cmds: %d\n", ret);
>> -
>> -       ret = mipi_dsi_dcs_set_display_off(pinfo->link);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "set_display_off cmd failed ret = %d\n", ret);
> 
> Probably also need a `dsi_ctx.accum_err = 0;` here? Old code still
> sent the "display off" command even if nt36672a_send_cmds() returned
> an error I think?
> 

You’re right about needing to reset dsi_ctx.accum_err before calling 
mipi_dsi_dcs_set_display_off_multi(). The old code would still send the 
display-off command even if nt36672a_send_cmds() failed, so I’ll add the 
reset there to preserve the original behavior.

>> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>> +       /* Reset error to continue power-down even if display off failed */
>> +       dsi_ctx.accum_err = 0;
>>
>>          /* 120ms delay required here as per DCS spec */
>>          msleep(120);
>>
>> -       ret = mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "enter_sleep cmd failed ret = %d\n", ret);
>> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>>
>>          /* 0x3C = 60ms delay */
>> -       msleep(60);
>> +       mipi_dsi_msleep(&dsi_ctx, 60);
> 
> I think this one should still be a regular msleep(60), right? Prior
> code still did msleep(60) even if mipi_dsi_dcs_enter_sleep_mode()
> returned an error, so you probably still should too.
> 

Agreed on keeping the msleep(60) as a regular sleep. Since the old code 
always slept regardless of DSI errors, using mipi_dsi_msleep() there 
would subtly change the power-down timing semantics.
>> -       ret = nt36672a_panel_power_off(panel);
>> -       if (ret < 0)
>> -               dev_err(panel->dev, "power_off failed ret = %d\n", ret);
>> +       nt36672a_panel_power_off(panel);
>>
>> -       return ret;
>> +       return 0;
> 
> I didn't notice before, but I guess this is a minor change. Previously
> nt36672a_panel_unprepare() would ignore all errors (other than
> printing) except it would return the final error return from the
> regulator_bulk_disable() call. Now it will also ignore the error from
> the regulator_bulk_disable().
> 
> IMO this is fine, but since it's a slight change in functionality it
> could be noted in the commit message. Something like:
> 
> This patch is intended to functionally be a no-op, though there is one
> slight change. Previously a failure in regulator_bulk_disable() would
> have caused nt36672a_panel_unprepare() to return an error. Now it
> won't. No other errors in nt36672a_panel_unprepare() were propagated,
> so this makes things consistent.


I’ll also note in the commit message that nt36672a_panel_unprepare() no 
longer propagates the regulator error, since previously that was the 
only error returned and all others were ignored.

I’ll send a v3 shortly incorporating these adjustments.

Thanks again for the careful review.

-Chintan
