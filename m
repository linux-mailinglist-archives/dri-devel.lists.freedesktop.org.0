Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDSKGk5On2nNZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:32:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C232719CBC0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687A110E22A;
	Wed, 25 Feb 2026 19:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="i6/lEpWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A4410E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:32:25 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48318d08ec2so9945e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772047943; cv=none;
 d=google.com; s=arc-20240605;
 b=GYjlxbgW7uMQdDn/FDR0iN3J0VjGk2nfIL0RrZHIoYqMuTDaoriH30WqHJJ8GCTHy6
 oXYfmrM+Of3vKwPPkRmUFl7PMaVxO3xCHakkV/eeEvUheblXrlv10ZoFSSNgRLzJZ99C
 ZGhjh8wPNVV2B7kQpIUe8RuAmgExMi0xjCHlOuPkL551IDes7II4HcmcS8bSL3kARmF3
 TKfTDP39FP44E+JFwurSr2PuQ1dhRN4AWL7b4Tz6/6cUx44fdH2nBLLWvRS17EVlhaeh
 xqhVVNwkiDLDgz4kbyxJH5jLQ42CFjsgzuq2B/fxZnNVYyMMYbeH/hAXh0M4GzgPEOiH
 Zmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jgvQ9LOkQazsPmWMTTjFvYurOXwrvdriypbs6xoQIpY=;
 fh=ax2ZpxpxMV0OPAqiJa50KnwZNqS61LkM51QSBhxQ1yg=;
 b=jD3miMq+uaOdowurGFmTG2+qcBr5XKJGM/3/VSTlLe7Ba09Zbs9GdGevQFVBaaBMnr
 cvNyMaARAQh1EpHztfJxPj/pYX+FKCXhcQruaPGnTCMaY6ITl2Kge8pnIr9So3nxVKJG
 TDMgCWDWOIz4w7h2R97ZSp7Ui8UvDimXebz1RBn9jjwPQQCyITn/Nk6kFyrXjgPmTU/g
 uLeUIL43VJ2+B8ED9wFSwHhyHToM9yo54EeSWS+8lquVbW50X3LOiOaSZ/23vAm/FDaN
 PLjJFrKbLBs1UIfItiLI2cXot98Bx6HOl8fG269Kf6mWYvuBcjmDvKQotjHC8psPX3Uw
 NA7g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772047943; x=1772652743;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgvQ9LOkQazsPmWMTTjFvYurOXwrvdriypbs6xoQIpY=;
 b=i6/lEpWZ97f3vuoVUSP9szug2FG86bBDOzjCBpv4x6Bej0BbVXcU4bcsrYeiM5tKmR
 xDBC5vzZ0jpCmI9eDK3JSCE7wHLOfR1E13nYsL+0sGM/Ttt524JYcLDybrASqhE43We2
 d9Ls5uPcX84oNjc4U5u65pMzvtR3rbra3n2rlEkAKhFOn9tiJ7lGVDSpIaxGsPhBCM4t
 rs4xW0yWHstTkwUmVUVMvIkZa7vO5XJRmXLGV0EsYIdSZTRN9QLUim8C8zr+XEIzGqRe
 S0mXYYEkaL8f45vCE+2vBiQA/1zDM5MuzC4lLWxFWD4GcRUrqCVdNTFHkTdkOcanpr/n
 R4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772047943; x=1772652743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jgvQ9LOkQazsPmWMTTjFvYurOXwrvdriypbs6xoQIpY=;
 b=sgWfpxsYVrIAeelwvpsXnd4Ho+jHGt5SPLBTiow7/WuDCqoQ9sExnOqj5MYRR4OC24
 WMPfNA4lKyMMVxdY8Q9k84xioNq4H3HzOi0KQuW6i2p1BLvdlHC3Wh9iBQR/M343czug
 rF3h2JE9HW7VZRcOVyRndoq8HHnY39jaA8yRICoiuV82AhXoKqkJkhP0O3wSKs59fWaw
 RyJJddxDnSK1/mNYjWBxCV1asvYZWQRdpgxTt4ySiIIhWzWXeuZhd8OLvgXxAsuzjtHJ
 u0ZshUZRksAlkHypPZKmJzh7Ief0ftqxg7D/06cbtkThAQuJGxlMAwMcIKRMkwDUkJIZ
 ebyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHqtpzvABFwGqYLur3oXZhoRSVql0V369AuW9K3qAxfcFIlz66IWV+YQEKfsaV92tChBuxE6sVRM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4pL1ZVkOm3BJYf/ks/n52YqJ4BQa8fnqIhUnUBObH/kPWTXhx
 ANGD3J5hGXtPcuwTvWic1DIOFqItNCRAU6CESsURyuyxoFQwB5EGdjBtyrrjGUglaQtDFmzqcXw
 Eebk7qydYgIX6TQs0O8L1tSOP/twAAuaOdwHQkrew
X-Gm-Gg: ATEYQzxtIBd14ExQv/SiDB7MMGjER6yA4ino42v8ph+iAKtBnuOZdv4poO77gmrlpSV
 AqQL13177LtiX5RE2d0lBnh8FjR0k51UTU9+YubBoFvn1I+aFdHY6mbkljTVt8MLRXo7FQb4mEP
 ETWHowxYX15WNS3WxMEop4faG+MQZ21KiLXBu7M63yF2qK8wTJxMpsxUG+ndYwpy3BmvK749vym
 M5mH8My09s4ZGaBo8BZr6EcNzNvgmW/HhWqKdi5oEiufzDXP6Xs9dCFh77is8FO0aDBFZcDhsYJ
 zcx8gwwdE5jkirGLLHxq9OYd54tBvSxvBtOLIFLBLREdIMlTCCErqKJQLMbXqD5FPKZ91A==
X-Received: by 2002:a05:600c:628e:b0:480:274f:843d with SMTP id
 5b1f17b1804b1-483c31b00d9mr64725e9.16.1772047943193; Wed, 25 Feb 2026
 11:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-1-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-1-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:32:11 -0800
X-Gm-Features: AaiRm50SiWoOS9CfY38Fs_M7N-g3DOx_BZCYfNv6nN_YOmBm3wEPmTfvWS_ulms
Message-ID: <CABdmKX2_+zh9jg+Wc9iS-YndB1KefC6+fQZ5G7f1LyyCtuP67g@mail.gmail.com>
Subject: Re: [PATCH 1/7] dma: contiguous: Turn heap registration logic around
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C232719CBC0
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA heap instantiation was initially developed by having the
> contiguous DMA code call into the CMA heap to create a new instance
> every time a reserved memory area is probed.
>
> Turning the CMA heap into a module would create a dependency of the
> kernel on a module, which doesn't work.
>
> Let's turn the logic around and do the opposite: store all the reserved
> memory CMA regions into the contiguous DMA code, and provide an iterator
> for the heap to use when it probes.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thanks! I disabled this registration in the Android kernels where we
build all dmabuf heaps as modules instead of built-in, so I can undo
that if this is merged.
