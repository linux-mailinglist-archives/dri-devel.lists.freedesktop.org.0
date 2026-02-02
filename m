Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHdVJK0CgWmdDgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 21:01:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4598D0E62
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 21:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7894C10E276;
	Mon,  2 Feb 2026 20:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fZLADw8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7159A10E276
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 20:01:44 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4359a302794so3330795f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770062503; x=1770667303; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4hGFAoXoGcmWys+uUjHRPMoq6GYRS4Iplih/Yjd1Z5o=;
 b=fZLADw8EvxoKzR6U2czszCjCWm3divTHyHllmkQP7fNdI3bSxj60M4WMd21Hme0pXB
 BnMAHkZqscbvJtqe6t5s15bQZi05MSWjqDmt0OYVvCbpoaEAgPdVTGdOle7cIuN+LKbx
 +c6RfBEsQNgH4xDR7uCY+saXBXI+5lQHdG8VNc3qPkfc+NH/E1geI//jkypJaIkBjb/v
 lQIlpccuICWS/YYfH130JB77yb2KhmbBxit/HdoqDgiTwJlVqDkfaofM+Liv1v54lHzK
 Ib689w47WcG61DR88uF0a3AS3oQGhHGAAcOjyxhoyWJc13Hhcfo5C0RVlcMxPTLy2cal
 gCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770062503; x=1770667303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hGFAoXoGcmWys+uUjHRPMoq6GYRS4Iplih/Yjd1Z5o=;
 b=Mzgxe7fZi9GE4Q9djvgVLV3bx3FyHORVBj/Owj0Bn9XENw6ssq3NzIDjEVCHg9FWzm
 IypTtK65bTqhkUNVnX8MlbTxTY4u7MsOkYv7dDWiDnYuxkhI9aohNSs7TuH16O6uprdN
 Siu8VxSfe6NDpCa6Gjw4NIwpaxTQoQBjca9+orG5zvZUyz4Udoq+JwCF3SAmWoE3e0RO
 O0Y0AP6BSGguTSM0mbWQdiip+Ahg3PQE3OeUQuzHxZVPQt4Gm5lEnSfkBbJoVdkcCWmk
 cQcja4caxlPC2qV8NKDR6xKVMZhLoiG/DqxoSuLM5uOffl7Q5qoLR3qkazv3QkzX0Kdb
 /aeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGkO1kzR/7YodJ882LbEInAfBOgU5diswBQBZxNmDafhMTOOBa9PzwcV4ICuEs/VG3IgYUilYv7sk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH9APGHXtM9aQ3r3NU7AEEmiP6R0YzJs/+bUdLqvV7TdM61OER
 w5zcUFQ9DlpuIvVGvhs+GTa+lsvpjZqJd2qqyEf8HoB/dAgIuI7JbKC841FEgMMhlBY=
X-Gm-Gg: AZuq6aLsQFYec0id2NMtW4/jrMlJg7gvucxHvyIzOlQZ5bv5JqBDnGsopoiS2JVFv/w
 gwxLACNUlxsnp8/t6/N12e6bY6cVCBYqBVeA12KSxdeFW6EASVj/edIFtKGX3+i/ccHV+8YWkS4
 DVMhRYwS0c8cuwsiLCoK5b33yf61xXzmqcHhhqE1OpVmp5zTGMnkEQxZd0soyrNSdGs5iZcEroR
 g36K5dVc7oorLCdFeUDst1QL44+J608Sdau+L1y7hNSyLkwlNOMz1XZx/nHhnb/R4vPpAGiUHsd
 t0PAHuHvv53CAZSTvZ9Otq5OM6JLH+OtKGNK/7bhrQ6+M886BSyDa4SEjG+ChaCcQje9mcuCp85
 a3vzjNb5F3eMlQdDaCD5YboWNYDtppVjoacmnuVCu5t4L+hk10cj49zNk3x6uhjI8NmApEmsnsY
 4bfF3/PAK8CSyislsZ
X-Received: by 2002:a05:600c:c162:b0:480:1b65:b741 with SMTP id
 5b1f17b1804b1-482db4ac5bamr160582205e9.15.1770062502857; 
 Mon, 02 Feb 2026 12:01:42 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483051287cfsm19591905e9.6.2026.02.02.12.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 12:01:42 -0800 (PST)
Date: Mon, 2 Feb 2026 23:01:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix macro flow control warning and empty
 macro argument in fbtft-bus.c
Message-ID: <aYECoy7Apjwgzr9r@stanley.mountain>
References: <20260202162826.116739-1-krishnaworkemail1308@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202162826.116739-1-krishnaworkemail1308@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishnaworkemail1308@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E4598D0E62
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 09:58:26PM +0530, KrishnaAgarwal1308 wrote:
> Fix checkpatch warning by adding identity modifier for define_fbtft_write_reg().
> No functional change.
> 

This commit does two things.  It introduces fbtft_identity()
and it flips the if (ret < 0) condition around to avoid the goto
inside a macro.  Only the first change is mentioned in the commit
message.

I have see the fbtft_identity() approach before and I don't like it.
https://lore.kernel.org/all/20250718191935.5918-2-abronzo@mac.com/
The name identity() doesn't mean anything.  It's a real word and
it has a meaning but it doesn't have a meaning which is at all
related to this code.

I think I would be okay with this the macro were called nop_endian()
or cpu_to_cpu_endian() or something.  Or another approach is to just
leave the code as-is.  Or maybe we could add a comment?

Regarding the flipped condition, the new code is badly formatted and
uglier than the original.  I would prefer to leave it as-is.

regards,
dan carpenter

