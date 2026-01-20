Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFmLHwX6b2mUUgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:56:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A34C9CE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7710E1C1;
	Tue, 20 Jan 2026 21:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WNPkckMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3261510E1C1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 21:56:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47a95a96d42so6385e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768946175; cv=none;
 d=google.com; s=arc-20240605;
 b=lOwOUXWOUMLSkqq0T1di2SIe9MBgTKnj49JWT2EkDDPTr0f8hBU39D0vPYwXHruMfu
 UmzYpLFrJiNKHYhkSyBOXtHhf7ofv/NMnss95V1WkTvj3p5xNLK25nTcB6UnX7cHG8PZ
 xQL9ILSjAtdbzeiUAFomDnHysJvQGSOhlNZQiT4tGdV6Va+K5C2CBmMWa7o5cxjbUgLj
 AatyhSMydOY6L+g0TbCPvO3UGr2ZR0m/DFTR0cvlVsmWX7j1+G7DArH7s57K+4BfmzEu
 eZZ/0LdByMqeT1ZeaL0Z+AaXR2q4TKG075mrJykQJCgjbJT8iw3DNn2YFCKgrYSzdyQF
 vY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
 fh=HA9O7aPTzX4bCZn6IX4QUBay0/KYiooGkCQ+7k2w7IE=;
 b=DE5h3aydi60wbT0aUmPQ0EC2DRX3VYtaMjOKAB1p2vtqLtBYBRYlluS0piBuhU4XUA
 kpWCupa4ZcY5ZYw/bbJ2Zl7gmyQVFiyvtE6ckLh8kbzZqmtlqoDTcNDCjrv+vWCXV0jH
 cG2eF30vKz/DA+umWF5e1pdEKLqcLn/YhiycZWg3doVhaa1NJo0WA6+FLOHmKv0vPK95
 2GUQRCsL9Gazb2sDtXiFBucA/7mosC+nLcIhPX6jXVNqihehm6Q7fKG2oPjPg2zkumao
 5lAmtwpymM7Ke+j8RUerNNSP5H5MgTn4rvWApIIHl3wqZibp/c0wnea8gaxPixsT4Hk5
 m0Wg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768946175; x=1769550975;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
 b=WNPkckMdsL/hRbZqLMcvvgVioox++S7K4iGlgU5FTQNoJkdxcVeoe4C22Nb2XvaeZN
 TrODCRq3oCucDetFRl2K8tMyL2au62ofA9r7WFmo2R0vB3buLMXsBae8RU2kUdwhMDv4
 zo/cxCgF/vMiWjc0iNPkXxRHMjxzvrRg8gjJsbQ+rZs+ZJLrTdn+S5KR0fVBhkuhKAmu
 XEQJl/uL+8d8dIklInw09SS07ZpFy8Uzn8m6aaeXRqH+zLF6JL0AtGt6lGCQ2wk7lUnA
 WORwh4BpbE8Dh14MeqdEORRg24Pf+m9WPwaou45vQfWoBoUTzgiHVe8F9VOjINC44dTa
 Dd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768946175; x=1769550975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
 b=W9V9qq0m09GB1ZTpJMAIuiQCexnRQP0vmitrqfvykgo5SI7F6gj4KFBrWdAXZLVruo
 nvzRjE53W2szmGRdUdaZ9u/AURU/3S9s9eoBd3g7vg7OPQPEfXu6QNgN6Kyebbbb5zcF
 Lihszc7HaNgx8jn5OYGrgBXyPfzqjLwu+HWGv3vJY+6Tep+J0OWoPEEdugOJ8bFAJXIB
 Jtdcpkm7sqnGzw9OJN8xcvx5IH3suGcfOVvlyREkOSx/AIh+oxc+YiZh/QA9f//TufQ9
 uzSr73Rt5ObIqOBJ1ElvlhWfW4KiNYLEyM2KOWai8VzkxurY3ji66y7x8hJMYtYUSiJN
 w7eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSo0B6V3OMxIRFKJM8+DGhfKjKx8RVtaxPp0KgF/Lc94b4urK2+9jxfppGCEaK4YVxua3NX/V7HQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdNZEfzP1BElM7NLfSVzH4Zc7VO0NpqPwjYf2meI3hB43hXVjH
 cxiiabJZJTwqqMW1Zy39VjrBXrIL6lNQjJ5Uy2ZSeEwl9WteSHN7CgsvjG2soESs7tyhwmd7HNx
 X0HTecyaNLSm0eua8ISK4HgTQRNWZ7uGFmLkASHR2
X-Gm-Gg: AY/fxX7IkF0vEaDbkmqn+OSQNX/c/ylUXPUqjKYHVGzO4boPmDc31fYXzJq/Tn2bTx0
 otPE3cLdQoinhJ3UQJXlKqJjH+d/NwI8D4Y1vtQsweVcbtq/71AiV1myd+OX3VsDo+SO1SgW2b9
 K7CcSx0AF4QEwNxwOn5GN9A5uk0P/cyBzfsTgypx96HkSSeDf/rkYBWCG6k5p3RadHRoP7iWePH
 ifo7mQMlxFDOneHctYJz3uWcvBg2Xhy9lTZFozNxSeJp84mRlSe1SrT0ub5y7xIj/3yBvqhUrVF
 2jbrskO4nFmQAEobaNvc3xgxh/Ciq19L/Q17q2CEvuQUy5x+7njE2gMSPo7xkRD1PxU2
X-Received: by 2002:a05:600c:2294:b0:477:b358:d7aa with SMTP id
 5b1f17b1804b1-4804269ded7mr182155e9.18.1768946174451; Tue, 20 Jan 2026
 13:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20260116190517.3268458-1-tjmercier@google.com>
 <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com>
 <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
In-Reply-To: <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 20 Jan 2026 13:56:02 -0800
X-Gm-Features: AZwV_QhAkwIRZ_-oc6BWWemkNMCWB__3YgDNYfNqrl_eFujJJHCLVOgaVNe7XtY
Message-ID: <CABdmKX3LGWueY91k+i7_WFTC8b8LJdR8nj6Y9KeJMRk7fSrsww@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove DMA-BUF sysfs stats
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:corbet@lwn.net,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: C22A34C9CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 5:08=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hi T J,
>
> On Mon, 19 Jan 2026 at 15:15, Christian K=C3=B6nig <christian.koenig@amd.=
com> wrote:
> >
> > On 1/16/26 20:05, T.J. Mercier wrote:
> > > Commit bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF st=
ats
> > > in sysfs") added dmabuf statistics to sysfs in 2021 under
> > > CONFIG_DMABUF_SYSFS_STATS. After being used in production, performanc=
e
> > > problems were discovered leading to its deprecation in 2022 in commit
> > > e0a9f1fe206a ("dma-buf: deprecate DMABUF_SYSFS_STATS"). Some of the
> > > problems with this interface were discussed in my LPC 2025 talk. [1][=
2]
> > >
> > > Android was probably the last user of the interface, which has since
> > > been migrated to use the dmabuf BPF iterator [3] to obtain the same
> > > information more cheaply. As promised in that series, now that the
> > > longterm stable 6.18 kernel has been released let's remove the sysfs
> > > dmabuf statistics from the kernel.
> > >
> > > [1] https://www.youtube.com/watch?v=3DD83qygudq9c
> > > [2] https://lpc.events/event/19/contributions/2118/
> > > [3] https://lore.kernel.org/all/20250522230429.941193-1-tjmercier@goo=
gle.com/
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > Oh yes please :)
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Thank you for your patch, LGTM :)
>
> If its not pushed yet, I'll push it tonight.
>
> Best,
> Sumit

Thanks Sumit and Christian!
