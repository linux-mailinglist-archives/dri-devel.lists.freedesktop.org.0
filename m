Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPTeEHWalGkoFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:42:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A338214E5C6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA60910E51B;
	Tue, 17 Feb 2026 16:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WAiOH3fT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAD310E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771346544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXDYTsHwjwJvObFGcfp9MPdG+tXQvOJID36L2G2Cul0=;
 b=WAiOH3fTHEiC3c8oVf83nYnMsi4CTVWfMZdl/CgbeXDYo8dnWPOPCif+WLtUu+qMS8HkzE
 e5ok3SUrJxqTIol6NkR08rcqhsq7MOTXpv7wdK/JGwrtC3fTTDzMhTvOSguep6+lrGg/h8
 7VzfvvEH7xLr8Kygn8v20I/9h8t40/c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-qrd5crIlPwWrK_tDmH2Ong-1; Tue, 17 Feb 2026 11:42:22 -0500
X-MC-Unique: qrd5crIlPwWrK_tDmH2Ong-1
X-Mimecast-MFC-AGG-ID: qrd5crIlPwWrK_tDmH2Ong_1771346542
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-435ab9ed85dso3206952f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771346541; x=1771951341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXDYTsHwjwJvObFGcfp9MPdG+tXQvOJID36L2G2Cul0=;
 b=Sn4HO04MrX+3OqegyE9NJ9U0JrzssQwbY8BUDSRQllCFv9UFsr1XOIGTDmniZtB6eN
 bROfriE4CnBvpgFnd/Ee1xbvBpiVdyit8j1dULL9u4DWjxdYuExusKatC61xZGEbj8vD
 oz9nHezzwsw9e1Zp3eZACLkYIuXTartfpKDXs2sCniMk3KHFeFSbPZABSxx8Rr+zruDp
 2iggnHhNtx2grTvWmsHbOooCT4M9PpevPZf5RKcgh6BJlT7uqLBkZ8EiXxhUqtUoKZyi
 Rmgp5LWW4uyChJzJGqm7nnc6wunrrsi7j+obeig2F7udsepmFg7pqvg1+7o4F1BsFn6F
 QMlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh6ZdTOJxWSGyNqUyWe6qtnYhGdCKsXSjPI6acNruoa0iuceglHvsiUYl9eecwY2oWUNqTi+lu0dc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaJkbRTsYYF+EcHYdLvUTYktRZDbSn6t9y4+DBJVBs1zE5N/tA
 C8oAVEEvuMNLgepf9DOxvau+scMM6PqpcuSQBGE28+3ivSqRDwRmPcLjmd3Hegv4d/gHwFxw4NA
 kS/UYrzvDrnByp6SuWbyQR5g4qTkM0FxLOHRRDrOJTP++my2Pu9wReIRSJ6sUlE0jwvcDFQ==
X-Gm-Gg: AZuq6aIG4e0Ewg7munWRPlGDz25Eqn46LzVqjVb4a2Kw6wVj2p8tYx4H3sX/6SNqLuP
 qrvtOK9zPLAK3HGjsDS/+4vrqHkgB008lmZfpGmxwAwGKWtDEM+MVLSMDr9J27TuIeOTqffE6zp
 G1QBAj8U7YZxV4lJ2axDHSQE9590D7/EmSwum/5UlTWfXl4TJGJL51lKUVaYP0Ubry4nY21SFcR
 dIifkJMRXdKIIyxNEH9nZ0xIPrl+pT03jgr209DWRss0bB52qsBJRZHyF3aEFZgOdM5kv68JRom
 yVBJd85Ahz/Eq3ePC5em7GPhy5T3NAEXGDOpxILU7TEiQ+rpYer2iOF7XFJdEfaYNsX549qludE
 lwgc20XFDvL3Ji38kG/B0hOYG0rK8xBBO4pRYIXef6e7KRbBqMpgJVZhVSe+uOQ==
X-Received: by 2002:a05:6000:2689:b0:436:23a2:5e32 with SMTP id
 ffacd0b85a97d-4379dba719emr21054345f8f.48.1771346541525; 
 Tue, 17 Feb 2026 08:42:21 -0800 (PST)
X-Received: by 2002:a05:6000:2689:b0:436:23a2:5e32 with SMTP id
 ffacd0b85a97d-4379dba719emr21054298f8f.48.1771346541019; 
 Tue, 17 Feb 2026 08:42:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1b4sm33694698f8f.14.2026.02.17.08.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 08:42:20 -0800 (PST)
Message-ID: <1ba9d64c-d364-4645-b788-ad911fd5e5e0@redhat.com>
Date: Tue, 17 Feb 2026 17:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: depends on PRINTK
To: Michael Kelley <mhklinux@outlook.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20260212100615.989957-1-jfalempe@redhat.com>
 <SN6PR02MB4157FEE172013AA2A03A5809D461A@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <SN6PR02MB4157FEE172013AA2A03A5809D461A@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ip47TxfAvZLXUkK0IcoCHpRIbu8gDLqg0m5aE4NQtgs_1771346542
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mhklinux@outlook.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,outlook.com:email]
X-Rspamd-Queue-Id: A338214E5C6
X-Rspamd-Action: no action

On 13/02/2026 21:23, Michael Kelley wrote:
> From: Jocelyn Falempe <jfalempe@redhat.com> Sent: Thursday, February 12, 2026 2:06 AM
>>
>> drm_panic uses kmsg_dump_register() to register its panic handler, so
>> it won't work if CONFIG_PRINTK is not enabled.
>> Let's not pretend it could work without PRINTK, and depends
>> explicitely on it.
> 
> s/explicitely/explicitly/

Thanks, I just pushed it to drm-misc-next, with the typo fixed.

Best regards,

-- 

Jocelyn
> 
>>
>> Suggested-by: Michael Kelley <mhklinux@outlook.com>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 758f2eb3d588..0d0657dd1b41 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -55,7 +55,7 @@ config DRM_DRAW
>>
>>   config DRM_PANIC
>>   	bool "Display a user-friendly message when a kernel panic occurs"
>> -	depends on DRM
>> +	depends on DRM && PRINTK
>>   	select FONT_SUPPORT
>>   	select DRM_DRAW
>>   	help
>>
>> base-commit: df4dc947c46bb9f80038f52c6e38cb2d40c10e50
>> --
>> 2.52.0
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> 

