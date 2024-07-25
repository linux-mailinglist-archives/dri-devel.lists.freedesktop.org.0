Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FA593BFD4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 12:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D3810E0E2;
	Thu, 25 Jul 2024 10:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="mM4OIwkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89F510E0E2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 10:23:26 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1721903004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t4B5CpogFr/6szGnySiBlRSQMQJUsoQdHfG8O0D6Vd0=;
 b=mM4OIwkj418FvPDuuERKrHUMX3ct9zYl0HmYydENQB+MSGBP++IZpMbJ9vp06N+BlRRsi5
 OC/Gn0WwdodBtUHjD6xRhsxDob9PgsQRAWvh1Vm+wP4B7MeuYBd/mSWCzME0jT0EZSrYVI
 GCCKn5qp7bBb4i2Gh0cnYvMVklrfoRSDAGdwux7CudFRR42tN5SUQVQBQ9SexPwHBSNlsG
 3rESJ1dxGpSHqhTDEv5R68cigBOFa0iRFt0AYWwEjEQbBkFWy4zQnrvOj+MDbkXw5cnm3E
 Fa6SzwUQAj0lry//NyNzXxJxFlJX7BgVnt23OW0n/60TfXNF9dH8UgGUZyqjTA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Dragan Simic <dsimic@manjaro.org>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 robh@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, Furkan Kardame <f.kardame@manjaro.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Mark simple_ondemand governor as softdep
Date: Thu, 25 Jul 2024 12:23:13 +0200
Message-ID: <3863847.7OiSWjA07a@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ae62139f-3655-44d0-aeb7-15c6b67eb97c@arm.com>
References: <4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org>
 <d20667e76aa56fb69c91ef327d467d4a@manjaro.org>
 <ae62139f-3655-44d0-aeb7-15c6b67eb97c@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3174170.kLLAvsri18";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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

--nextPart3174170.kLLAvsri18
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Thu, 25 Jul 2024 12:23:13 +0200
Message-ID: <3863847.7OiSWjA07a@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ae62139f-3655-44d0-aeb7-15c6b67eb97c@arm.com>
MIME-Version: 1.0

On Thursday, 25 July 2024 11:20:22 CEST Steven Price wrote:
> [1] Although from my understanding it's firmware which is the real cause
> of bloat in initramfs size. I guess I need to start paying attention to
> this for panthor which adds GPU firmware - although currently tiny in
> comparison to others.

Can confirm that's the case.
When using (f.e.?) plymouth, the gpu drivers and corresponding firmware
gets added to initramfs. If you then have much more and much larger firmware 
files (nvidia f.e. added 2 fw files of 23 and 38 MB respectively ...) then you 
get a corresponding much larger initramfs.
If you add a (fixed) bug in initramfs-tools where symlinks to directories 
weren't preserved, but full copies were made, you could end up with a single 
initramfs of 240MB ...
--nextPart3174170.kLLAvsri18
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZqInkQAKCRDXblvOeH7b
bqhlAP9pNuQEjWf+eKX8vuBpB+yxlxQNwxFBHAmPe/eBLu3cjwD8D9QJdQx86PUn
WiKv4UAe5v7jglsoI4Tu2tWe41m83A4=
=Dv1b
-----END PGP SIGNATURE-----

--nextPart3174170.kLLAvsri18--



