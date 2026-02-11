Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GESyCo/5jGmVwQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:50:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED8127E1C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD74310E13A;
	Wed, 11 Feb 2026 21:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="BVVm19KS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8037010E13A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:50:01 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-8c655e0ee70so228629685a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 13:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770846600; x=1771451400; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r1B2tU81NIyyUX0BuEtA/zlgaQi/pnmwzP2mJEPsvUU=;
 b=BVVm19KSnYy3zsiYjzstCy29BuyeJyFk2zixjrVf5Lqo0GqB/XvcUk2z2WEMsCzvtC
 rBZERHYIh97Bfkphtgq99lgNfRV/ECHEAR2HOARKvvdv3GOnH6y0WMM9qwOo/EmK/DVc
 kOuhJqp/4/0KhjvMFE3r1OccfdJDe7p0rChYCzCCITC5kvmir0scRLABuWWaBb+csdRA
 o18BtnTprO4UfSsoqtpKWdOYaK16dUJNRJH0ABl+jsAP0IvzvmTFYxOFZEhKtgby3MUf
 n30S9YPXRgCHxMrNEfqA01NnJneG79oS6d2PIutfN4rMd2y4Ko4mp/V3f5R/dCOV+XFm
 ITeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770846600; x=1771451400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1B2tU81NIyyUX0BuEtA/zlgaQi/pnmwzP2mJEPsvUU=;
 b=PThI5k44+ne2vQ6WiykJ6JzytNqyZLIfcm2FINQwLM3OHUoy+9e6kCb3cO4E3o2Uw3
 F9K8Z6DxJQIWITLsptzQF2WUICJk+ZhSYUycIwkghwXjcL1I8OnD+kv0F19129yvZyvD
 RlheBbUt21r2wprCIC5BwIU3SfMPXxKvegsGbkr2df9P7oQFjEzWhsyXBMDIYKbWoRSI
 8U2uh70plrNY1Bl6Vh0PjnliS+LCMzW2LYYEPurtCGsTtkoMqdReRsd/XdBy9ChA+gbi
 uFcW/iEZjqdd27yvNb3+OvfB0OE47Gv5liR75OQ/4F6yaHu0Wx0Y6glmg82p2Pza5K8K
 XwXw==
X-Gm-Message-State: AOJu0YwX6iCI3lIbUF3ZDTqWZBiw9wSoOBUK2ImcDWbGD/D1DipZrC5t
 CoPsXTn5VIE8aBYPlRtDT+W1QvOnFNwARQZBTfOMLSY50V37Tr3S6Q7bPSxwNBclhqqrbdhMESY
 8drZt
X-Gm-Gg: AZuq6aI3pdEy0bE4W5rpTZgxN1vetYq7/bGFI8LG9UnHzSwnQJo6k1nRDq1qqqsqhy+
 VOSyJXx/oYprhufEtONLWy+UWUFayvD/Ln7aUTnRC5+N8Dj/Ac2jyBEDC+y1VDKT+U3DwRjqGFi
 ZwxJc+XukX0IHWTQiHEKVGa5V0BAUQu5ijf3DYGDGtyP0+GzcNpotwU1z20F6aEK6gpiZwcZcfT
 1WuecyeaOAt3UwqGnth0L+Zoi3hsYSggqdN9zXlgtz3+qlJMl03R/uMfODseIedCNrdBwwHtkAS
 5toRBPl7tiMtGn8FX2iCDv53Y6Rgcp28TKUKH3ebXSacdlvAP30wSO9xCaweiMLApSzx6PbSN6E
 /yZv5shFWX86kmqJW4s4IuPNaoVR5xYj73US2hJh1MMW6Ox8u2VrLquR9MpZ8bGsLasWCO4ATPq
 N8q9xoJbi5PemH7a5z+z9XTgckBKXjHMI5WoSejRitMdjTDDZuRxeqXjNz/ix2rudhsuLjYoNlO
 zz8bOI=
X-Received: by 2002:a05:620a:1a22:b0:8ca:450f:c389 with SMTP id
 af79cd13be357-8cb3316091emr101489485a.62.1770846600310; 
 Wed, 11 Feb 2026 13:50:00 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb2b2346dasm199216885a.48.2026.02.11.13.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 13:49:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vqI5u-0000000Da3q-43Cz;
 Wed, 11 Feb 2026 17:49:58 -0400
Date: Wed, 11 Feb 2026 17:49:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sima Vetter <sima@ffwll.ch>, "clm@meta.com" <clm@meta.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: drm AI patch review hacks
Message-ID: <20260211214958.GK750753@ziepe.ca>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:sima@ffwll.ch,m:clm@meta.com,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5BED8127E1C
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 05:44:46AM +1000, Dave Airlie wrote:
> Hi all,
> 
> This came up at kernel maintainers summit, so I've been trying to see
> what I can piece together, and have a small demonstration that may be
> useful to some people.

My two cents.. A few years back someone was talking about AI code
reviews at a conference and a bunch of us had a good laugh about it.

Today what Chris has working is, frankly, pretty amazing and should be
taken very seriously. It absolutely finds real problems that are
surprisingly complicated. I think it is a much higher value than a
tool like Coverity or other prior attempts I've seen at static
analysis..

Even if it is often wrong, it is still often *right*. In RDMA land we
are also experimenting with Chris's tools. Your approach is also very
interesting, I think.

At NVIDIA we are trialing some commercial review tools and they are
pretty impressive too. I was working on something unrelated and it
pointed out a real bug in a kernel driver, then it pointed out several
pre-existing stack-leak security bugs too as a drive-by. I thought it
reflected a surprisingly sophisticated evaluation of Linux
requirements, and it wasn't using Chris's Linux specific aides either.

After seeing these reports I used Claude as a super-charged Coccinelle
to look for narrow stack leak patterns across ~300 functions and it
did a very impressive job identifying the target functions, examining
the code, the struct layouts and identifying cases that were actually
problematic, largely autonomously, with a two sentence prompt. Found
another stack-leak bug this way.

This week I've tackled a giant "all driver collateral evolution" type
project in RDMA that is well beyond what I could manage with
Coccinelle.  Using Claude to generate Coccinelle, and do it's own
search/replace has been really eye opening what is now possible with
surprisingly little effort.

It is hard to tell where things will be in a years time, but there has
been a big capability improvement over the last year.

Interesting times ahead for sure!

Jason
