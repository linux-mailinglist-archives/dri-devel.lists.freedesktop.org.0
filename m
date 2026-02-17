Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEgJMZ1SlGlFCgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:35:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645614B74D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF7710E237;
	Tue, 17 Feb 2026 11:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LcJMDKIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629F310E237
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 11:35:54 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso4861926f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 03:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771328153; x=1771932953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LgQNKr8r/V604Sp9uPvt3G5BJw9jwxBK5OgFuLEJ6t8=;
 b=LcJMDKIZVd1oTxCy1kI9NiBA79AZHm/bGDpgVoP7ppO8GxEva2cByOsLhokilwUDuD
 4pQYUTmxVe5YHqg5UdqTSm8YkyfRuT9JDeR+26iBgoClY24TjCE/WmmnFcIsUBkWcrzc
 isK8RLKwAWHX54btmLLwXAllJuJd1mqw6jOPYJDS8NThtP/fjdhFlYMVuxXvreuGxs8R
 YOq0jS8YNgBNajRH08TgTppKTYGhREjycsVaFvUeLCtWHRrXIgckvqFr7bPOfsZ5SZMD
 6nEtLFMCunowHQZEAEZRYCZzw43n7FDbSQxtWyYm9A9lhuiHkJqp7RpsrOT2uNZSfPPe
 5peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771328153; x=1771932953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgQNKr8r/V604Sp9uPvt3G5BJw9jwxBK5OgFuLEJ6t8=;
 b=iXQ0DEre+khRfNFdTDNutFE5+/u0JV5g3rlTlj8g1iejoGBphCUmZvbkdXFg/AnQAa
 iQp4gOKtSg4/E+jGKAnCJLfVSLOghWpAUsBUWKD3qneHlhiLjs9oRWQbeKMcvpG8ES0D
 kcLBoEsB5l/WXLjZIHCeu35a3JscRwgVWJVjz1laMV5j4fQUmsHM5VOqzs4W1d8DUoe0
 kmsz62yjWkReWM01ioLTFHCW0dHZ2g+TuqsH7tvkzxfddPZhLFTUIbJTDjf8EyUcXJHt
 I9gOEZmgC+qq7IoGBDswWdD2Zo6fiXXFzZvi39+z37R10oeP5oKCNcuyx0MzhwCyLkyq
 FbIQ==
X-Gm-Message-State: AOJu0YwM8G1VVe/5oJVMnMaUB9Skz8bMqeGZH6A0/Bqhd+0FlvjaNRtB
 Rtk+Af+mCcTCUOacQV1rS5QtrbMZHXLMn0l4lX6Qg6pgi7Yo78rcdhvB
X-Gm-Gg: AZuq6aLbAAYXChxwIhRjEwUVKKGVqSTNTPud2kCsVnRvjtynhjBSPEuyXVrNMYQUo2z
 7CuD9rR8UhSv/IpR1xuYn6Rql/WiVCEp6VtsTEAQ5Vvq5uZkGDsSfAPD4qLyeXUJBLB0NTntNle
 TpyFWDr3a3R61llux3+TpjRP+5/sJnWtkxIthQY7m1Qu7ahc/gTGnCY9SYgiDelGLkVlBJCk4iA
 TJE6L3vgVFMR5hGG7XJ/f8PAu5gEyjoCuPxSKxPIsu4aWf4K4QoOzYTortv2xBjU1GqpdT5yJtX
 9JZ0xRPx6SfL1W0LnfWvbnKZ6r7IkCju9IT/jKDMuZbIkQ3mCVwJzm8jmN7MEAbX4uZQNcMYKX/
 bLDtsL5Wi5v8zqXgahdM1Hyuq2EycUb7MhC9K/9KBixvnbaFezBnpvEMMghrkBJlF54Yhz8CjKr
 A9ulrjR0AQfHCWYwHlmLJsR93JUKk+3FrXyIjE57lKhl3LkbTk1hg3ayGjIL8=
X-Received: by 2002:a05:6000:40ca:b0:437:8f37:887 with SMTP id
 ffacd0b85a97d-43797917e2emr23844398f8f.36.1771328152605; 
 Tue, 17 Feb 2026 03:35:52 -0800 (PST)
Received: from [10.247.12.125] ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm33685378f8f.31.2026.02.17.03.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:35:52 -0800 (PST)
Message-ID: <2648bf28-5ac9-462a-899a-2bfa3905dcb5@gmail.com>
Date: Tue, 17 Feb 2026 11:35:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR
 to query fence error status
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260213120836.81283-1-yiconghui@gmail.com>
 <20260213120836.81283-2-yiconghui@gmail.com>
 <f1100dad-b9ff-4ba2-987c-4d5cb4c1122c@amd.com>
Content-Language: en-US
From: Yicong Hui <yiconghui@gmail.com>
In-Reply-To: <f1100dad-b9ff-4ba2-987c-4d5cb4c1122c@amd.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:michel.daenzer@mailbox.org,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com,mailbox.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 3645614B74D
X-Rspamd-Action: no action

On 2/17/26 10:29 AM, Christian König wrote:
> On 2/13/26 13:08, Yicong Hui wrote:
>> Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR to allow userspace to query the error
>> status of a fence held by a timeline/binary syncobj.
> 
> Not bad for a first try, but quite a bunch of general comments.
> 
> First of all to get that merged you need to point out a Mesa merge request where this interface is actually used in userspace, so that we can look at the full solution.


> My educated guess is that userspace doesn't want to call this IOCTL separately because of performance reasons.
> 
> Instead add some additional flag to DRM_SYNCOBJ_WAIT_FLAGS_* so that the IOCTL aborts the wait and returns an error as soon as it sees any fence with an error.
> 
> Another DRM_SYNCOBJ_QUERY_FLAGS_* is potentially also useful to query the error on a number of drm_syncobjs at the same time.
> 
> But in general since this is not a HW feature the userspace developers need to voice their requirements and explain how they want to have that implemented.
> 
> So adding Michel on CC, I've briefly discussed that topic with him on XDC last year.
> 
> Thanks,
> Christian.


Hi, thank you for the feedback! :D

Shall I just wait for Michel's input on what interface would work best for Mesa?

Thank you!
-Yicong
