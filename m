Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAHdGOI2cGl9XAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 03:16:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BA4F9CF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 03:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4210E679;
	Wed, 21 Jan 2026 02:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BtVSp1nA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BFC10E679
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 02:15:57 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso2230883a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 18:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768961757; x=1769566557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rBYj61sXNcZXb9zsbWXDZntUfG6O/Hy5NDGW/6P4u40=;
 b=BtVSp1nA89FpEVGuCdtJB2X/nDUYvaTKRpb9bqC1dfqKhC0QMdPg3kzZKf9KAlXZBH
 FcXNYPyHvf8vg+eqRcO/+HlqUZHNq3Gzq1HtM9Dm7ZuAgYOMqVRKUFwNX5uEDnf7PVTs
 +Bvaq/AOpwQvTGhvQPyHWUiCKwlOR9yhLECKI+VoTCTrJrwO481QqX6rhzdup6bLXOcT
 PzfGibeuZpyTk49UiSuhU8wF81fOFZtX9b5LRlAs+UhTVvvXdOEaRuRiOoqNlPJN+vs5
 s6tjRaRY2rK/t0wGiGZ7jjhQUOOX6cOfhh+DGGjq87KDliXVoJQ5Guxd+gR/b4fLDhbw
 0zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768961757; x=1769566557;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rBYj61sXNcZXb9zsbWXDZntUfG6O/Hy5NDGW/6P4u40=;
 b=lcQCtIviNLH4BBmZ+QIQCWx5fzHBMM/1Bb92KZT+GqE0zWpCi0YQkvbVyapFuxGwk3
 lRlYd/XjqTTilcDqSyTHjvJuq3X5wDijh3CYDS2abUDGHTtrYwqsFFBsL1gEUwUyi3WM
 w/XfbCJew05PYm1VBGRyj+NILwGQIvXS+gdhCpOKSazWwKvkJ4OvSZh3xtlqThYD2FL5
 cQSPfYgKHKpZNW9UnszStR+kXd6HpyUdd2xIE5TADpkp99TiAD75KQfWFnVYW84UR21W
 SLjp98nr7HHP124JFxRiraa6nFvZxx/Yd3620mSHn5261SwBmTMuw0WoT7k9yb1itWRz
 szXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF994DC7SWVGPHL3BF6shVBqdq2MuqfN0w0Q04LIjEKTyWyxHR8WnlxjMkhDW8Jw6mb3SumjEvRMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQz4oDuYMEPcx3GiBLmnbgDtJT45Xhi0QFSCLJRBQhF+t9OsIq
 ENZI6NGqm05XfvH1K2yyHQ/A+NW1m/q1viQQKv3M+jxws0O7y4IV476c
X-Gm-Gg: AZuq6aLvjvWPUH2bsH5m/KIxEjt+lQwhI1T7I1+Dk39tB9Hm925hjnEANA+I/y+Hptw
 iwukbe1FdOwgbv/h++APEoZPfQ+IdZgwNBpQroRHT74KfqGHrZAhanxqHsNGN9Kptzreh732f8b
 NXxePqwM31lTpXR+pLwds8r5S/Ng6KtotOgeSYPre6fQxzEzfend85WeUb31HG4647prbv2CSUi
 pOR48HiZPebE0sXzKK7ewpWDKB+qt7l30xeJ/dblMzMEu2FTxy9ANuSKcWBjts/hlV8uL94K1bp
 9au19iHf6Yh5vJ7VB/WQ0sThZg5FHKqA8DlxiHhpIhOi9Xg49iP0eH8UYW6ZTJXCXBUzX7ej5RD
 /m9TtH9VSRx4XNQWfdyET51kyqOZf1iV5Efu6RSc4sAKQzQ2kuhSl0VKLodLi0RKfFu94bQhV3K
 SFEy0LjmziKmP5rUFFUVp7bXaVJF8IPuekyMxFOjPK7FhMmz6dH/tqX+Tzr3ECRy0y+d+UQGw=
X-Received: by 2002:a17:902:d48c:b0:2a0:823f:4da6 with SMTP id
 d9443c01a7336-2a7177da66dmr148370945ad.50.1768961757159; 
 Tue, 20 Jan 2026 18:15:57 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:cb0f:63ad:26a0:511b?
 ([2601:1c0:5780:9200:cb0f:63ad:26a0:511b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190ce4dfsm134107205ad.29.2026.01.20.18.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 18:15:56 -0800 (PST)
Message-ID: <aefd4942-41de-4e27-9777-aafff7b01aab@gmail.com>
Date: Tue, 20 Jan 2026 18:15:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] staging: fbtft: Make framebuffer registration
 message debug-only
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20260117042931.6088-1-chintanlike@gmail.com>
 <20260117042931.6088-2-chintanlike@gmail.com>
 <aW3gCgB1YAsjuOZ7@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aW3gCgB1YAsjuOZ7@smile.fi.intel.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-omap@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:andy@kernel.org,m:deller@gmx.de,m:gregkh@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.freedesktop.org,suse.de,kernel.org,gmx.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: E34BA4F9CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/18/26 23:40, Andy Shevchenko wrote:
> On Fri, Jan 16, 2026 at 08:29:31PM -0800, Chintan Patel wrote:
>> The framebuffer registration message is informational only and not
>> useful during normal operation. Convert it to debug-level logging to
>> keep the driver quiet when working correctly.
> 
> Suggested-by: Greg ...?

Ahh.. thanks for pointing it out! Will send v8.

> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

