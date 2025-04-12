Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF5AA86A05
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 03:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8A810E044;
	Sat, 12 Apr 2025 01:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.b="rd+/nIH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A5710E044
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 01:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i3D8uqAyeJXdjGXrTJsEVPFeBnK4qn8Jh4ZEY/amgTc=; b=rd+/nIH98FqlH7HAOBg/U1Agm2
 ib0QvDX1oys+zvOdSMi04PXmkIaWWJ4oxBcR9oCjUXZ2PKBlKkxbYYN7oqzxhQ/GDgalKJGsj1GlM
 UebVJJKdSjwgryP0ZWTZv0mgPgj4r1rH3e7ojmimkmqA9sqhOk7r1iYBBsuiUj1/OQgqyOvpo+yNa
 8Qh2t/bsuuN+Klhho9rHzHlz36yq1FpRce09Ye8XMmZiW/pIkoS4AB6PbmwT2KSHxWvETJoFpzm5i
 Hx1imR43+eCboZfCzu/e5Es/uSMhRSBVjlCkjL6p3SpvpUev0pMhTd0WY/xwWHzdMowli+xmV/OYf
 KdR1vrMw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1u3Pb1-00F1Dq-09; Sat, 12 Apr 2025 09:23:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 12 Apr 2025 09:23:47 +0800
Date: Sat, 12 Apr 2025 09:23:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gupta, Nipun" <nipun.gupta@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
 ogabbay@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, derek.kiernan@amd.com, dragan.cvetic@amd.com,
 arnd@arndb.de, praveen.jain@amd.com, harpreet.anand@amd.com,
 nikhil.agarwal@amd.com, srivatsa@csail.mit.edu, code@tyhicks.com,
 ptsm@linux.microsoft.com, linux-crypto@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
 Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <Z_nAo7UpzBqeXLbA@gondor.apana.org.au>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
 <Z_imAnYu1hGRb8An@gondor.apana.org.au>
 <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f365fae-aae2-a0df-e8e9-268b536378b1@amd.com>
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

On Fri, Apr 11, 2025 at 11:50:54PM +0530, Gupta, Nipun wrote:
>
> AFAIU after looking into it, the keyring subsystem is not to perform the
> data operations, but for managing keys for these operations. Kindly correct
> me if I am wrong here.

Have a look at

security/keys/keyctl_pkey.c

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
