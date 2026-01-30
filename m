Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLHSKsq+fGlVOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:23:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B9BB8C4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E1C10E256;
	Fri, 30 Jan 2026 14:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AsHVhYPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDDA10E256
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769782980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NysZYs1wcrqLDG0t5h0GSF4MeXnnFrjLy628r+9XtI=;
 b=AsHVhYPwj/CoWR/6XTdL0AJyvGCbmBOuD7ER3uMtlM6yo18Ezmo71Afi4jSpAXs+fmo85D
 DsvX0KnAKoK0nbuf7d3pe/mSYiVX87y2kU+iZ3ZlxzfpztFou/WhtOAYaI9KtcOZGPYs2U
 neIPv70Gl34qbRB0BjCK3g6xme53iFs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-SBmPuiDXM1ao1sAa4fPVZg-1; Fri, 30 Jan 2026 09:22:57 -0500
X-MC-Unique: SBmPuiDXM1ao1sAa4fPVZg-1
X-Mimecast-MFC-AGG-ID: SBmPuiDXM1ao1sAa4fPVZg_1769782976
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4801d21c280so17088315e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769782976; x=1770387776;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5NysZYs1wcrqLDG0t5h0GSF4MeXnnFrjLy628r+9XtI=;
 b=Pf89qeknYHO7QjLlfYAfaHJSjT5cSkF66Pe3vJ9h20TGRMu/gY2iqX2AsUEXoAi+Q9
 vUxX4z3IsZHmfQo97wK8iT2GeujXRCS3mUPVwnl+JvWhKTJ9AFrONUfU2WX+/+IGhrl5
 7ijuiyBatbeDPPyi2oIhq0jQde7El09UFjRKXtEUvDOeKvElZ8HYqEpcnKVkPtFg1DFj
 HkVUzOtS3JFayPcla9NIRzimBxt1f7EkYvJehjDJXyxFpUgL+XtQy1ApILtO3u+evIxQ
 PDFpe3Y5j/wyNIIXW4tsEqe5XBlPsqp5brxAYw+Z+gzEbew2/OlJ2HpeUipMwESm7hlb
 7dFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK1i0Fv8MbeZR20zIQ+CVU4RuJsvKidvlEiyfaW2ZxbzEG6Zp0+He4vGzvdzH7HKXYWnxdPxN8kmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVT0ZhUKnkx0WT6N3y/r1nkzdN224Y2gt+eFhD+AsqN8m6CbEj
 BtruciKByw1nK+DqHZrRuPNTiOpt4wfA1+cfYZBDMzixagwnvG4SLy6EGdazs0zaG27c71xwpmO
 /3pVLM00w+mCoDox9FzOrdvnNLOmhY/rktX5OFjX1cfkIS8MRsUjREzBNXetLGQeOM6dnlg==
X-Gm-Gg: AZuq6aJouad5x4m/M4X5CEsDyPV61JW0L7PQFYys3BzShr/ThMvPzPe0ZBU31D0Rs09
 JV2oqDKlCq5HUcFsJ49QywY/F1TpHid6SpAlnVP0sgES3F8ft7jhSxgJETqKMINLRmVbJLsrnIG
 KtOe1w9TJ1t0hbGNA55SyzLDsbKi34HF3BNNrQokqp0EUxOPRWESPpGunR4MrIoaaz35dEIyMzU
 rxkirWEZg8EOSahLiKPAv1F8Y5s4tWA8yHTf5KfERY0LV1huKs+crUE1oM68jE5e6xysc1cNLf9
 eoAk6InocNoKkWHukcLZcTrm+AG+aN8Thp1NUl6/eXU4FS6v9bQGZ+o50fU79YGULlOtPxo/gCD
 yAw1t/pQh/0DcA//TaPTgwVArdRlLewtJX13oBjEv+obOyP0DXg==
X-Received: by 2002:a05:600c:3e15:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-482db48c76dmr38136285e9.18.1769782976049; 
 Fri, 30 Jan 2026 06:22:56 -0800 (PST)
X-Received: by 2002:a05:600c:3e15:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-482db48c76dmr38135955e9.18.1769782975646; 
 Fri, 30 Jan 2026 06:22:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf4asm23441310f8f.28.2026.01.30.06.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jan 2026 06:22:54 -0800 (PST)
Message-ID: <85edc1c4-1985-48d0-9ece-50a5c70e1752@redhat.com>
Date: Fri, 30 Jan 2026 15:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jacob Keller <jacob.e.keller@intel.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
 <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
 <88f33e4e-5d0e-4520-a399-5be2901a3281@intel.com>
 <27af79a8-ee84-4845-a737-82d3883536e7@redhat.com>
 <8d238204-b0f6-48a7-9afc-480097c32a23@suse.de>
 <770785c9-266b-4ebb-a0a1-f5e615e45855@redhat.com>
 <4272ae94-902e-40dc-86ce-62b642fa9656@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4272ae94-902e-40dc-86ce-62b642fa9656@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QbftwVMRpvx7KAw_KC2TbSbgEpv2cfCadwxkDJ6uXdw_1769782976
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:jacob.e.keller@intel.com,m:airlied@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[60hz:email]
X-Rspamd-Queue-Id: D28B9BB8C4
X-Rspamd-Action: no action

On 30/01/2026 15:03, Thomas Zimmermann wrote:
> Hi,
> 
> I don't understand this.
> 
> Am 30.01.26 um 14:27 schrieb Jocelyn Falempe:
>> Hi,
>>
>> To take some measurement, I've put this instead of step 3a of 
>> mgag200_bmc_stop_scanout()
>>
>> for (i = 0; i < 100000; i++) {
>>     WREG8(DAC_INDEX, MGA1064_SPAREREG);
>>     tmp = RREG8(DAC_DATA);
>>     pr_info("MGA Sparereg %02x\n", tmp);
>>     udelay(10);
>> }
>> return;
> 
> What do you actually measure? The loop in 3a is supposed to end as soon 
> as bit 0x1 signals that the hsync is active.
> 
> Are you sure that the pr_info() doesn't interfere with the loop? This is 
> a tight loop to catch the bit when it flips. Putting that pr_info() 
> there in the loop can take plenty of time.

I just read continuously the SPAREREG register, just after step 2.

So I take 100000 measurement, every 10us, which should take 1s, but take 
1,2s in practice, probably due to pr_info(), and reading MGA register, 
but that's not relevant.

> 
> 
> 
>>
>> It's called at boot at
>> [   45.110616] MGA STOP SCANOUT
>> [   45.110631] MGA Sparereg 84
>> it oscillates between 80, 81, 82, 83, 84 for ~4310us
>> [   45.114941] MGA Sparereg 81
>> then stays at 81 for ~227ms
>> [   45.342492] MGA Sparereg 81
>> [   45.342504] MGA Sparereg 80
>> and stays at 80 for 1136ms, until the end of the loop.
>> [   46.356152] MGA Sparereg 80
>>
>> Then it's called a few time when my display go blank and each time a 
>> different behavior is seen
>>
>> [  729.448040] MGA STOP SCANOUT
>> [  729.448055] MGA Sparereg 80
>> it oscillates between 80, 81, 82, 83, 84 for ~39258us
>> [  729.487313] MGA Sparereg 81
>> then stays at 81 for ~230ms
>> [  729.717349] MGA Sparereg 81
>> [  729.717363] MGA Sparereg 80
>> then back to 80
>>
>> This one is strange, it stays at 0x81 for 1191ms
>> [  838.307042] MGA STOP SCANOUT
>> [  838.307055] MGA Sparereg 81
>> [  839.498450] MGA Sparereg 81
>>
>> And the last one, this time it stays at 0x80 for 1235ms
>>
>> [ 4318.439032] MGA STOP SCANOUT
>> [ 4318.439047] MGA Sparereg 80
>> [ 4319.674140] MGA Sparereg 80
>>
>> So my conclusion, is that the bit 2 is almost never seen when polling 
>> at 10us, so there is no chance to see it if polling at 1000us like 
>> it's done by the driver. So the step 3b won't work at all on my setup.
> 
> 
> 
>>
>> But even the bit 1 can stay set or unset for more than 1s, so it looks 
>> very unreliable to rely on it, at least on this hardware.
> 
> Did you connect to the BMC virtual display while performing the test?

I didn't configure the remote interface on this machine. But this code 
is still run and should work in this case.

> 
> 
>>
>> I feel like doing a msleep(300) is probably the best bet.
>> If you still trust the hardware, maybe it should wait for ~100us, then 
>> check the bit 1 and wait until it goes back to 0.
> 
> Here's an example calculation: with 1920x1080@60Hz, there are 1125 lines 
> overall. So
> 
>    (1,000,000 usec/sec / 60 Hz) / 1125 lines ~= 14.8 usec / line.
> 
> There are 2200 pixels on each scanline. So
> 
>    (1 - (1920 pixels / 2200 pixels) ) * 14.8 usec / line ~= 1.88 usec
> 
> This is roughly the time that the CRTC spends in each scanline's blank 
> area and likely the upper bound for the duration of a single polling 
> with that display mode. Otherwise, we might miss the blank.
> 
> Honestly, I'd just take the proposed patch as it is and not bother any 
> further. I think this is the correct fix unless we can figure out the 
> exact meaning of these bits and the BMC.

I'm fine with that too. At least on my machine, this waits for a random 
amount of time, and that looks to work.
> 
> If anything, we could try to reduce the polling time to 1 usec and 
> reduce the number of iterations to 50. This would give us 3 scanlines to 
> catch the bit.
> 
> 
> Best regards
> Thomas
> 
> 
>>
>> You can find below the raw dmesg (I just removed the lines where the 
>> value is equal to the previous and next line, to make it smaller).
>>
> 

