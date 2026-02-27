Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLbeOU5ToWkfsAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:18:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F771B4625
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D16010EA5A;
	Fri, 27 Feb 2026 08:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T5Ao4sNg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C65810EA33
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 04:51:12 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c70ea5e9e9dso638702a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772167872; x=1772772672; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xlc5/wJcGMy2qVaQwNIPCexEitX/U5dL8H2UtAkaHiA=;
 b=T5Ao4sNgxUFhhhQqZkzQr6js+3UhX/T3zeTixTU29c3GBw0n4b7aBX4D5rL+Gpinb+
 RHjC50hYAXMttr0IbMVWtiDzsm8UWtSu/NiMlJsuJhpYgFnZLN1YSOfn0lFhcxmUMGCa
 Q2HbHrIM3vN59bKYIrk/RR3bubU9t4rpJZCb9s5EpylldG5OfCizZQpp4aeMNk+C95pK
 hIqniC4wIm3GGAjlYLwBuAHmYFP9eGWA8Pr3/JSeSUjDCDp7Ko3ZfGzev8BsTnvIRCzE
 SUh/RbAYpkThGOj5xbyvY5Ceob66RXoJrbSZudAa/yIroWrqZzIeLdluKM7JJ7O22d1A
 gf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772167872; x=1772772672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xlc5/wJcGMy2qVaQwNIPCexEitX/U5dL8H2UtAkaHiA=;
 b=WA/virX/gygq3pqhNd8C5WbWs5Vh7ZsRhL+rB0jwcYOQfSvFFUfFtaGvAa6pnkuPzM
 5RW8jNr9VZ+GT0PIEH4YT01IIPw7JuSsfb91wPehlbKu1havR4UYLhTRLA46yfOqMWLd
 g4fGuqtWCa7N1kQ6CqX2ECB89hW/auF3bHhFDPQH+l82fRKWt0dY1XecOQ5L5MQLIaUe
 d7gLfPtckpJwppPyhFVd41tZjJ6FIuH9jRAZrm4kPmnwrZgugJ5N5Hgf+YyildYK3yK0
 XVJ4ItoyJU/dOJbFT8jsVwERO9Dh+9V4t3Ksfd+YDtcEENjGrnllondLe+tkMQ63ZHLY
 RrXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjJTJhYSSerj6v2JFHPjYkCnHl015lAIxMAsLk3oh+4273rASmSGPvQzibNzyWj4/zLDbWo/j5/rU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzfJ1ldgpFj6PQbetgHVzzBKw4pHHwzftyBPjHetIjn1CUc3iC
 9N4QMAyUt8+IrRj6yoUjmVvbj9lSTagqV0FS7e4B5FLUFhDeyEpadGwaViyTOPao/20=
X-Gm-Gg: ATEYQzzvAUhRGXKB6D95sEOgcUV8DjqNWHwou+6hRg9w+S7js+/SKbsuPviGctIPlnm
 1yZtprEvaFRTH8dlZNFZ603d0pRuOspKeccVGeTWpxpSOuWhAHQazDAUqfRrSLfQ1YkGQHswQJf
 xnIwxmQoDt1MBicUJuwqciLfZ3jRG8l7ay4AgBY74T+maAFxl1XDNtNHFUnW4AOb7lKdnOq3HQF
 fLQwVfIAIIrmlbtDJZwD5P82uCxYcpOkxcv9pEUmC8y28SfoRKxTcPtjpJBx7rVz28xmMOdNS98
 OwR+BC5ndjU+b6rf0D0n4Gfa4hE5/yhTJt+8HVZDgxssdm20+pQ7Y6AVnt3tFJdTis+Voze3lAw
 xOx4XOfQj/4ilds2vZy9k+eqwwW79dosy7jlKPaMxfCYsqRPwOJ22XBBiD8j2laMFoeBc5bqxv+
 /1rg8IJ8QlCT4cJLOfTE1EeKs/hQ==
X-Received: by 2002:a17:90b:2496:b0:354:ad98:7d1c with SMTP id
 98e67ed59e1d1-35965c3cb32mr1089009a91.11.1772167871672; 
 Thu, 26 Feb 2026 20:51:11 -0800 (PST)
Received: from latitude ([2401:4900:ae25:bd8:c189:b262:db26:b797])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3593dcc9c37sm3706534a91.8.2026.02.26.20.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:51:11 -0800 (PST)
Date: Fri, 27 Feb 2026 10:21:05 +0530
From: Dhyan K Prajapati <dhyan19022009@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Donenfeld <Jason@zx2c4.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix macro whitespace errors
Message-ID: <aaEiubs2v51xMmUN@latitude>
References: <20260226172531.13714-1-dhyan19022009@gmail.com>
 <aaCIqUXPB75vR6rK@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aaCIqUXPB75vR6rK@smile.fi.intel.com>
X-Mailman-Approved-At: Fri, 27 Feb 2026 08:18:15 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:Jason@zx2c4.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dhyan19022009@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhyan19022009@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C0F771B4625
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 07:53:45PM +0200, Andy Shevchenko wrote:
>On Thu, Feb 26, 2026 at 10:55:31PM +0530, dhyan19022009@gmail.com wrote:
>>
>> Remove prohibited spaces before closing parentheses in macro calls in
>> fbtft-bus.c, reported by checkpatch.pl
>
>You haven't compiled this, have you?
>
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>

Hey, sorry I atleast should've checked the definition, i'll keep in mind
not to trust checkpatch.pl blindly
