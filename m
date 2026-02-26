Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON1CJcUloGkDfwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:51:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20AB1A4951
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10D210E8C9;
	Thu, 26 Feb 2026 10:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YGmER0kq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3512510E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772103104;
 bh=IkJdKD7faa2UuFj9IHFkVko8rvI1zt0tw5f/fUIjArE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YGmER0kqMduk83TZ1QAJY/NXqU+hh+kbXJhqkRW/mnZQAmjrBJ04xrH+5wLktOZbt
 eWm3qnQ5dmtSOdUwgdfefUxO4RmYV9TX21epX4xPPkdk2Lgr/P+p4kQa8zUgCsCgkn
 gcnWJjcPor7ZwVQrW8hzhNsiAWHU393WOLc9khrZq8U23qDIy7xhVgDjxv818Lii3A
 RMcoG2qoUYaaw2us5sXxd9HbLvBxqwbfMdVhpV49o3H8OqaEiyAmwn2c6a7VdT+TsX
 Q8yDzOZu6Tatl/9AHh5YLDLEUCtFj9SG2tNFsMaxyORcgfvjCOW++RyaP64BMYQxmT
 uR5EeNVeMuZSA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2276E17E03E5;
 Thu, 26 Feb 2026 11:51:44 +0100 (CET)
Message-ID: <67acc82d-e145-4f98-88b2-d30cc73f73a0@collabora.com>
Date: Thu, 26 Feb 2026 11:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 Nicolas Prado <nfraprado@collabora.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>
Cc: "wiagn233@outlook.com" <wiagn233@outlook.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
 <20260206110901.660cf712@eldfell>
 <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
 <3efaa7ec40c68f0d463da00c3a57474a40d4fdae.camel@mediatek.com>
 <2e241629-2526-41c5-92fd-a0a0ec3ffc4e@collabora.com>
Content-Language: en-US
In-Reply-To: <2e241629-2526-41c5-92fd-a0a0ec3ffc4e@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ck.hu@mediatek.com,m:pekka.paalanen@collabora.com,m:nfraprado@collabora.com,m:harry.wentland@amd.com,m:wiagn233@outlook.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:mripard@kernel.org,m:daniels@collabora.com,m:linux-mediatek@lists.infradead.org,m:maarten.lankhorst@linux.intel.com,m:linux-kernel@vger.kernel.org,m:chunkuang.hu@kernel.org,m:kernel@collabora.com,m:ariel.dalessandro@collabora.com,m:p.zabel@pengutronix.de,m:xaver.hugl@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:airlied@gmail.com,m:matthias.bgg@gmail.com,m:xaverhugl@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,suse.de,ffwll.ch,kernel.org,collabora.com,lists.infradead.org,linux.intel.com,lists.freedesktop.org,vger.kernel.org,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:url,collabora.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F20AB1A4951
X-Rspamd-Action: no action

Il 26/02/26 11:26, AngeloGioacchino Del Regno ha scritto:
> Il 26/02/26 07:24, CK Hu (胡俊光) ha scritto:
>> On Fri, 2026-02-06 at 08:28 -0500, Nícolas F. R. A. Prado wrote:
>>> On Fri, 2026-02-06 at 11:09 +0200, Pekka Paalanen wrote:
>>>> On Fri, 2 Jan 2026 13:40:21 -0500
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>
>>>>> On 2026-01-01 07:37, Shengyu Qu wrote:
>>>>>>
>>>>>>
>>>>>> 在 2025/12/30 02:53, Shengyu Qu 写道:
>>>>>>>
>>>>>>>
>>>>>>> 在 2025/12/24 3:44, NÃ colas F. R. A. Prado 写道:
>>>>
>>>>>>>> Given the lack of support for writeback connectors on the
>>>>>>>> MediaTek KMS driver, combined with limited hardware
>>>>>>>> documentation, I haven't been able to verify the correctness
>>>>>>>> of
>>>>>>>> each curve, only that they were visually sane (gamma curves
>>>>>>>> made
>>>>>>>> the image on the display brighter, while inverse gamma made
>>>>>>>> it
>>>>>>>> darker).
>>>>>>>
>>>>>>> Hmmm I don't think this is acceptable. sRGB/scRGB has two
>>>>>>> transfer
>>>>>>> functions mentioned in original specification[1]. To keep color
>>>>>>> accuracy, we need someone from mediatek confirm whether this is
>>>>>>> piece- wise or pure power 2.2 transfer function, this is
>>>>>>> already
>>>>>>> done in original amdgpu color pipeline series, sRGB means
>>>>>>> piece-wise while also dedicated power 2.2 function exists.
>>>>>
>>>>> Not sure what you mean with this not being acceptable. This is
>>>>> about
>>>>> enabling HW support for this functionality. Not every HW has
>>>>> writeback for testing. At some point you'll have to trust the
>>>>> driver
>>>>> devs if you're going to use functionality of the driver. We're not
>>>>> always going to get everything perfect, but if that's really such a
>>>>> worry you can always use shaders to do precisely what you want.
>>>>>
>>>>
>>>> Hi Harry,
>>>>
>>>> yes, but I understood that in this case, the hardware documentation
>>>> available is so vague that it's impossible to say what it will
>>>> actually
>>>> do. There are no formulas given or referenced in the documentation,
>>>> are
>>>> there, Nícolas?
>>>
>>> No formulas at all, the only documentation I had available for the
>>> curves was the register definition, which simply lists the possible
>>> values: SCRGB, BT709, BT2020, HLG.
>>
>> Hi, Nicolas:
>>
>> In [1], it shows OVL could output data to WDMA which could write data into DRAM.
>> Its control is similar to RDMA. RDMA read data from DRAM and WDMA write data into 
>> DRAM.
>> Do you have interest to implement WDMA?
> 
> I wrote a WDMA driver a long ago, but I couldn't get it to work (though, I admit I
> didn't try hard to actually get it working).... if you want to take a look to check
> if anything obvious is missing, the driver is here:
> 
> https://gitlab.collabora.com/mediatek/aiot/linux/-/blob/mediatek-dev/drivers/gpu/ 
> drm/mediatek/mtk_disp_wdma.c?ref_type=heads
> 
> The driver I wrote was supposed to work on MT8781 Helio G99 (for a personal project

Eh, sorry for the double email, I was meaning MT6789 Helio G99 - just to be
extremely clear, though that wasn't much important (given that the WDMA IP is
anyway practically the same between the two..).

> as in upstreaming of the Xiaomi Poco M5 smartphone) and on MT8195 as a PoC.
> I did test both platforms and this driver didn't work on both... not sure if that
> was because I misconfigured the MMSYS routing (on both) or if there's any actual
> issue with the driver I wrote.
> 
> Again, didn't invest much time on this, anyway, so some obvious issue might be
> present.
> 
> Cheers,
> Angelo
> 
>> This is just a suggestion.
>> I could accept we believe what document say first and wait for someone to verify it.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
>> drivers/soc/mediatek/mt8195-mmsys.h?h=v7.0-rc1#n8
>>
>> Regards,
>> CK
>>
>>>
>>
> 
> 

