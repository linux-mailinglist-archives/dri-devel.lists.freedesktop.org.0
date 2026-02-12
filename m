Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM3eCwenjWkK5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:10:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C59E12C48B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C1D10E71B;
	Thu, 12 Feb 2026 10:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B4meOMMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCCD10E71B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770891008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGtZzlI0afIe1oXYIL6I39556RNwafluFe5WLDNAu60=;
 b=B4meOMMogHDMQ3JF3v8q3H0ekHBaMR6hYcMbpBz0n7Mr0YVhJ2Q0yMC29dd9dU/XXRC4m3
 +XgtQo29C8g3a3ZH8/n7CmK9dZjPxyN1xICjZ10VGT+Ao4xlIhxoImHAg2sd+45lNxpQ81
 tqBcOpGxuAqlzHM9uKp94I+b2M0T46o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-vGOYTxxeMLeLx5mxc00P6A-1; Thu, 12 Feb 2026 05:10:07 -0500
X-MC-Unique: vGOYTxxeMLeLx5mxc00P6A-1
X-Mimecast-MFC-AGG-ID: vGOYTxxeMLeLx5mxc00P6A_1770891006
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48057c39931so76110515e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 02:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770891006; x=1771495806;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGtZzlI0afIe1oXYIL6I39556RNwafluFe5WLDNAu60=;
 b=wEjj+liUc6B8FIp+jLbeFB9T/50D3B2/Yzm2nr2w/sX/7KI7YcQLVwfqo5EL4Pj9yL
 5OP2DAgE1i28BONpny/3VOYh4VyLG0Ior1fBI/zDyI0goLvBCJs6QBuED0ItsTvkJEeH
 J6GYRp6AW82x7jesuM08LqZK4GcmnP9MllJAA5h8WwxuHa9wnuGPTzanE1uvqLC/XgFq
 KDhXL/oaECVcLd29k+danQ9XZbTivtqxpnUFRlo5XnI8lGw6Zkv6RmhDu+/9WTqeKUf8
 OUyNX7Zo8fZNsbVGilUUGjNoOitHv7Pa9lfdypNBL1AjMGs2iDzgNvXAleF4SBMDamqY
 mQtg==
X-Gm-Message-State: AOJu0YyLYeLNWl8gpqBmtToFGR2xL11huX4gCN33AUl6P2nj4RbUs4bm
 stXvGRN+ET/uRJZ4gPYjOub/++dqDqtWdR6kqB7QpMZux+qNvHcQ9LZBNxQ3h2pfg2/ttfG3Wwn
 fxbEqkuarkKRV0W2rfJOKPGd6cCPojDT3+62alPVLk3GRWEtyxT8oszA/ChKEvne8Mbgk9Q==
X-Gm-Gg: AZuq6aLnGcJcVv3QzYKjqq1RUpEZ4PXr5WgU0OzupLu6iUrR8e73naqxtKnm+m4i3ee
 FMX0+F1k/a5wZvGgVU/NIXc3E9WdUXY1zt9Avoc0BMesxVCnb0FNeYZ4ejCP79YGknz84+vaGpq
 QcpkuAfFMXGhsIv7FmPTvcs+ldwvvhHmh7RyiRKAqKKAzy09aXtB4flTiuCeRYndgI3yXzH1W3w
 +BMCTpECzVTAbwD6vYeV1gVUdm+y1taUQ+R4/ryFsgwZPlir7K84KL+eLnU491v3fle7yy2EkQA
 OR4i8NvLOs+ku3D4HLeRAZ+b8ZwvZJwT1YyDzmGSkGyyt27r5DfKYRrZ4T8GL06OyKYe0qaKndV
 hQjHJ/Ge7cbTSrPbD+QWUEb2rGBxQsUJcwe4mCHmh4wgC93u6KwrwV1j4UXkJdQ==
X-Received: by 2002:a05:6000:4024:b0:436:1b1:6cbb with SMTP id
 ffacd0b85a97d-4378aa01106mr3209836f8f.7.1770891005921; 
 Thu, 12 Feb 2026 02:10:05 -0800 (PST)
X-Received: by 2002:a05:6000:4024:b0:436:1b1:6cbb with SMTP id
 ffacd0b85a97d-4378aa01106mr3209788f8f.7.1770891005389; 
 Thu, 12 Feb 2026 02:10:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d325f7sm11303724f8f.8.2026.02.12.02.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 02:10:04 -0800 (PST)
Message-ID: <7c6933fc-663d-4bf6-8594-c14c4be83c98@redhat.com>
Date: Thu, 12 Feb 2026 11:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/hyperv: During panic do VMBus unload after frame
 buffer is flushed
From: Jocelyn Falempe <jfalempe@redhat.com>
To: mhklkml@zohomail.com, mhklinux@outlook.com, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, ryasuoka@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, stable@vger.kernel.org
References: <20260209070201.1492-1-mhklinux@outlook.com>
 <20260209070201.1492-2-mhklinux@outlook.com>
 <a5372b72-8dc0-4f2d-ad5c-086f3e75ee81@redhat.com>
 <002601dc9baa$517d8b40$f478a1c0$@zohomail.com>
 <e9d35c78-1c4b-4a9c-8cf0-9531e972279f@redhat.com>
In-Reply-To: <e9d35c78-1c4b-4a9c-8cf0-9531e972279f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4s8XjEC7_oOyk6_1cio5bcRdhVgsnCBL76O5ZV86pV8_1770891006
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhklkml@zohomail.com,m:mhklinux@outlook.com,m:drawat.floss@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ryasuoka@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:stable@vger.kernel.org,m:drawatfloss@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[zohomail.com,outlook.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,microsoft.com,redhat.com];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,zohomail.com:email,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: 8C59E12C48B
X-Rspamd-Action: no action

On 12/02/2026 10:49, Jocelyn Falempe wrote:
> On 12/02/2026 00:01, mhklkml@zohomail.com wrote:
>> From: Jocelyn Falempe <jfalempe@redhat.com> Sent: Wednesday, February 
>> 11, 2026 1:54 PM
>>
>> But for this patch, the issue is that drm_panic() never gets called if 
>> CONFIG_PRINTK
>> isn't set. In that case, kmsg_dump_register() is a stub that returns 
>> an error.  So
>> drm_panic_register() never registers the callback to drm_panic(). And if
>> drm_panic() isn't going to run, responsibility for doing the VMBus unload
>> must remain with the VMBus code. It's hard to actually test this case 
>> because
>> of depending on printk() for debugging output, so double-check my
>> thinking.
> 
> Ok you're right. I changed from 
> atomic_notifier_chain_register(&panic_notifier_list, ...) to 
> kmsg_dump_register() in the v10 of drm_panic.
> 
> So I should either make DRM_PANIC depends on PRINTK, or call 
> atomic_notifier_chain_register() if PRINTK is not defined.
> 
> As I think kernel without PRINTK are uncommon, I'll probably do the 
> first solution.
> 

FYI, I just sent the corresponding change:

https://patchwork.freedesktop.org/series/161544/

Best regards,

--

Jocelyn

