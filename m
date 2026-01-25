Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIq+FsSkdmnnTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 00:18:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEE0831F8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 00:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7612910E139;
	Sun, 25 Jan 2026 23:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="srvNykPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4AD10E139
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 23:18:23 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dznf26l1pz9tgl;
 Mon, 26 Jan 2026 00:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1769383099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/asOs9DyQ5THRpDLADk+Y2I0OVr6O6ljdNzMDKMqo4=;
 b=srvNykPFoMbdNkm95JsqCubOCcArIDiK11P92dDAugrfofyLVpxqcubR11bb9blGgbeMFs
 i/9DQg4I3K2zQ55MfVpw/t+tA4zykrLpgreokrW3Umrnj1IEvMhvHDS8z8gnHP2xiDL2ZN
 DPvyYhusuj1yj2mfBxSwG+NksqdkK448uH0bgTW0jBR4SEynmDP9amI/96OC/GEb4PKJC2
 xfS95RmIEfcsiUq4fG9p4ukv/v7ajRSu29SxgelLDYUcoHIR95URZhQ0jSi8pUUGXr/Rr0
 NoiMVRSmTckRoGCjjhfdXwtD1s8k7Z1nqpD9A/c8z0y6RXkKS0dsfsatFr5s6g==
Message-ID: <9efa9daa-6584-44b3-8055-bc160e46d8a5@mailbox.org>
Date: Sun, 25 Jan 2026 21:24:42 +0100
MIME-Version: 1.0
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org>
 <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: m7z9jqcet3zwhy5m8ud1ex4tencrz7fd
X-MBO-RS-ID: 280231b825f43649aaa
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:ulf.hansson@linaro.org,m:rafael@kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 8CEE0831F8
X-Rspamd-Action: no action

On 1/22/26 4:35 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> Can you please test this change and see if it fixes the problem ?
>>
>> The barrier should guarantee that the domain is settled and no more
>> callbacks are still running.
> 
> Thank you, that indeed fixes the issue!
> 
> However, I am not so sure this barrier belongs in the .detach_dev()
> callback.  The documentation for almost all dev_pm_domain_{at,de}tach*()
> functions states:
> 
>       * Callers must ensure proper synchronization of this function with power
>       * management callbacks.

Isn't cpg_mssr_detach_dev() the caller in this case ?

> However, I couldn't find any user that calls pm_runtime_barrier() first.
> 
> In case of multiple PM domains, it is even more complicated, as
> dev_pm_domain_attach_list() (and pvr_power_domains_init(), which is
> basically an open-coded variant of the former) creates a list of virtual
> devices, which all need synchronization.  For the devres-enabled version
> (devm_pm_domain_attach_list()), the caller cannot take care of calling
> pm_runtime_barrier() anyway, so it has to be handled by the PM core?

I am also a bit surprised the PM core does not handle it.

>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
>> @@ -24,6 +24,7 @@
>>    #include <linux/platform_device.h>
>>    #include <linux/pm_clock.h>
>>    #include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>>    #include <linux/psci.h>
>>    #include <linux/reset-controller.h>
>>    #include <linux/slab.h>
>> @@ -656,8 +657,10 @@ int cpg_mssr_attach_dev(struct generic_pm_domain
>> *unused, struct device *dev)
>>
>>    void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct
>> device *dev)
>>    {
>> -       if (!pm_clk_no_clocks(dev))
>> +       if (!pm_clk_no_clocks(dev)) {
>> +               pm_runtime_barrier(dev);
>>                  pm_clk_destroy(dev);
>> +       }
>>    }
>>
>>    static void cpg_mssr_genpd_remove(void *data)

-- 
Best regards,
Marek Vasut
