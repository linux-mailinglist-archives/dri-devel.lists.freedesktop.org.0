Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOe8M9hscGkVXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 07:06:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEFC51DE2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 07:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C15810E073;
	Wed, 21 Jan 2026 06:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ayOwYbv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0810E073
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 06:06:13 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-88a3b9ddd40so38877966d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 22:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768975572; cv=none;
 d=google.com; s=arc-20240605;
 b=E+BiQwgn11bSHy9iAsgAZycVYt7ez+24rf50Ew9srokKreZoU+OrPiADPMX44oH6EJ
 7ZHaUfYdBtnCKxMWlWKu21vY/G5/lJVfRSg7SwHpszdA9Y/830rIG+Kj5Ba/8YA4fBN7
 fcAxFRE2B0BtNvccQ1Mcj1V9flKHwLqQvBOqFZ4dOHIo0nk+lAlOgAnaD0lbwkcDh5C7
 EYMyr++P2QqTyY04xjkx10LcKTkT45qe3HnPkivSzAnZquUoN4pgxA/3UbBXNbenovxB
 sZ1GlbxjkzDWcrFN5XB7FywSDzhDAps3PAGHn+IA3HXr3T/C8BDbFMRmJBZ1dr2pmdI+
 EboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Z7UojO72eVbVg73zkaZW8PxUfBtrnWv4riC70q+KrZ0=;
 fh=LRS4vKAJBgJrXOwG+1GHeN8eVFNFs2hHK/gPSesVw7c=;
 b=eTCgcTdl3xfHr9eSLMsAvQBOL6ybSWZWZoY+iYWRYGVCXZZ1cPYKR1ElDxHMzYA6SX
 5oU9d83K0X1AoFnhaBS0U6g4ocYP+T8b/gEnQidDiud9MmaPbAir6hOy/CdDhcOI1ALh
 C9m65IBuQY5AnwqZTfRXE8IZqzbA3JNa0sgRXUMhzDyoL+8dodJK5fkh1ELSLmVxgU7F
 NJOTJ9gkyylazzbFf7gApCSO1XMvAZ5rQ71HdFuq/PrI8Dbqbkk9aGkbvtEP0tSgP9Nm
 7FafX8flN+Is9Ds/RzvExnzqHW/BOjzDed1k+QPEzKSaAR76afMPUwQts4eW8DC7ISpX
 btzg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768975572; x=1769580372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7UojO72eVbVg73zkaZW8PxUfBtrnWv4riC70q+KrZ0=;
 b=ayOwYbv4wuxpKnWkpb0JQxZCkBxS6whzWUTmFnG4/rsua+B9x2Vo6IXcWIOO5rXrgB
 FZhdjaTJHfGNzI/68f1WTu7S6WG3VmqHNcqPZMvKnKz3MG4NtBAZTj+HmLRxNlUXSnJX
 mQisR9vexl3k10gpgw/Mre+DZyhWa7skeLQTeNi3GS3nnFtwQHKPSR0qY9dJNHGmQp9g
 4Lpz/YgxPN23j0otQok5DRlbTmSAvD5okUfqOUKJIcIpqXegaRP80ZLiF97xqnOwJEkp
 c2ZzZvkERuLb3td+Ql8XETYSiUEquacQApS+3fOxI00js4msqnLUyEZR24o0xBVPBibM
 hErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768975572; x=1769580372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z7UojO72eVbVg73zkaZW8PxUfBtrnWv4riC70q+KrZ0=;
 b=pjUbqRnhKBpbIZSQ3GaDxSTFLHOr2TsexyBHst+Adfodv8HIom6pRCZnOODtGd+Id0
 DmHIo2aQqkOGjOEDs/9rYg7/re5q3Sk8Z9pmIzxGaSm6+PndoW5YWBQpcUnkm7l8PDAb
 aljnBYclpgvkLD7mPM4U4qOWZupEYnlY7o3S4klHqbm4abXTkR5NqJhvlMHC3bXWcHAx
 knGtkwiGCM+QtD9+buto/PHJM6qCC0COPEbx0ObZ9RsetCrw2tY0W820j8eJ02gqH0gR
 5aTrDD37T/SInWL9bjH/4bwZjiR/0/SRLyNHsXqyNf4wigtCF5nRtwOV63Ym6bjfs15p
 ieJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmcFkRCkgaWYOXa7Ofl7ADIv2G2DLSdqNnUZ0xycRTS28S5VymjusrNub8Cg8StLlnKK9WyByCKic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5ymWg26YoHrhTrSJXoHbe/COrTuc+ZkwR3inmNiyBm4nJcb5c
 L/dUxx8XDnYk0WR91KYuMvznVTd5Ncour8oEtIwKN7OwpBTG70OTip78lGAaFWTX4oOT5/QohRM
 lBoIn4fuSNK5P1eDsmJOK6IOBd53n0ak=
X-Gm-Gg: AZuq6aIUc8yPA06NMc1pXAufjzmiynZaX2H/ThXrXHsOyhq88ihliMGec1V13Jp1q33
 /6WSn6MLKwY+diCQxItBxpYXAGa98RhrfcmWo1AlpBIzY8mvEiuyTUXMoruKKruFcwHm5lBlbJp
 Gwg7pNhYwNY69L1no1FgCWK8OA+y4ecuGfN2Te5pT/25Z2u7pJCYKvCHLLNRrxZ03OzDZTwWKbq
 K+ycQtp2jDjrGVm7b6sunORsYrpfLe4UOlQkKetm1eoUK+H2v7RMeHlY/3IoHlu59TmU684a/Da
 /SM9+JpfCu9Ji/i6wUqh3nTpAw8/mDA6+q8oUBVoB5Y7LjQpUfahTTnXiRueFal9OA==
X-Received: by 2002:a05:6214:3007:b0:890:2df9:c6a3 with SMTP id
 6a1803df08f44-8946391947emr59560006d6.50.1768975572034; Tue, 20 Jan 2026
 22:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
 <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
 <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
 <19bdf152a97.5ffa0a07806790.470935296772844852@linux.beauty>
In-Reply-To: <19bdf152a97.5ffa0a07806790.470935296772844852@linux.beauty>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 Jan 2026 16:06:00 +1000
X-Gm-Features: AZwV_QigfFK2fLqZfST8Ad7KET0n2cYjnEyPoN4JddxN7P9HrS2OyyM7MmT2BXg
Message-ID: <CAPM=9txNMnPhaCO9PJb=-kptgWia=18TbfFnQ1W03Cj3dLDCsQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
To: Li Chen <me@linux.beauty>
Cc: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Daniel Palmer <daniel@0x0f.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:me@linux.beauty,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:daniel@0x0f.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.beauty:email,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 3BEFC51DE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 at 15:44, Li Chen <me@linux.beauty> wrote:
>
> Hi Dave,
>
>  > Hi Danilo
>  >
>  >  > On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
>  >  > >  > > +       usleep_range(200, 400);\
>  >  > >  >
>  >  > >  > Why is this needed? it at least needs a comment.
>  >  > >
>  >  > > This patch is needed for kexec/KHO/LUO reboot: firmware reset is =
skipped, so the GPU may remain in an active/DMA
>  >  > > state and the next kernel can fail to re-init nouveau. We can=E2=
=80=99t call the full DRM/TTM teardown from ->shutdown() because
>  >  > > userspace may still hold DRM fds during shutdown, which triggers =
WARNs.
>  >  > >
>  >  > > So the shutdown hook reuses the suspend/quiesce path (safe with o=
pen fds) and then powers down the PCI function (D3hot)
>  >  > > to leave the device in a consistent state for the next kernel.
>  >  >
>  >  > I think the question was about the usleep_range() specifically. :)
>  >  >
>  >
>  > Thanks for the hint.
>  >
>  > That usleep_range(200, 400) is just to give the PCI power transition t=
ime to settle before an immediate kexec jump.
>  >
>  >  It=E2=80=99s mirroring the existing nouveau_pmops_suspend() behavior,=
 which already does udelay(200) right after pci_set_power_state(..., PCI_D3=
hot). In ->shutdown() we=E2=80=99re allowed to
>  >  sleep, so I used usleep_range() instead of a busy-wait udelay().
>
> Dave, if this is ok, I would add it as comment in the next version.

Please do,

Also with that,

Reviewed-by: Dave Airlie <airlied@redhat.com>

>
> Regards,
> Li
>
