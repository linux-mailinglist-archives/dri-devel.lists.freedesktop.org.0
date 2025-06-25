Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343F4AE79FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C1D10E1BF;
	Wed, 25 Jun 2025 08:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="VC7rXLXV";
	dkim=pass (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="GmIzAikO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 543 seconds by postgrey-1.36 at gabe;
 Wed, 25 Jun 2025 08:26:05 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CF910E1BF;
 Wed, 25 Jun 2025 08:26:05 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4bRvmc4kkRz49Q5s;
 Wed, 25 Jun 2025 11:16:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1750839408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MrQC7Tos4anaJUbtszYmQNSsMU7siWR0u74LO5jbtxY=;
 b=VC7rXLXVw4vwp8IoATh/qxtDmh+Xrgz/LT+GGq/IKtHxPt01XOPLPR3pth6nPvetvGQEsw
 CRf874lMculCF3ibIlkbCqoG8J9KJfAuMfnb6gVLv3NZ42G4RgRev8/sWaI+lZvutxSXiy
 GfZMwg6o8vb2mHYQPiaKaWiqb27RPVL0Hpm1QcQFaEHJJhpE5uI/injgxCsAlv9lFOySTY
 oaJVX7ndRxJIXJAK7HDap4+HSXlPdlDwifivwv6H1Xps9sIK2ZUjnQ+xzdH+6srFJOtYZr
 3R2lGjLIgVY2gBslroRDRj1ANaW5NhPF6kloms5nvzSsEYEj9frdMcp59zlzlw==
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4bRvmT67FTzyQ5;
 Wed, 25 Jun 2025 11:16:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1750839402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MrQC7Tos4anaJUbtszYmQNSsMU7siWR0u74LO5jbtxY=;
 b=GmIzAikOby6iq36P4gbjFfrehlkARIALWJD2C4Pt9zr0js+tvGgzLgBS6sf6rOR4V9voM2
 gMi/s07tIWdNmzBPiVDEU/zsr4zh/0U13YtSE3ZZc5TQ/r86nYBs/5x75RjU9MkPSChGUZ
 fz73PKHwybahYhbnxNcN7vty7Iiv9vk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1750839402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MrQC7Tos4anaJUbtszYmQNSsMU7siWR0u74LO5jbtxY=;
 b=Ka7TTCIx8rxkMORpPwCxAY+72JgTmJ5cmHt2CXIA2Ay+9KqTo55Tias/0AgmHFx+v7CQOX
 ScbAJjSaXPJdyJ+bRqMeSW1raUhbPIa8EXXheuiRAwRa2ehj0HHI0/H3JxJrQ2cUyS67jp
 T00a5rgfepnNUDzK3mt6DjMVXOYS4qA=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1750839402; a=rsa-sha256; cv=none;
 b=xD3eINPrld3VHOT5rKZPM1aHuLa9bV+jNMVMC/qRCUqgSx0UoeMXzgUYas5lxATMxd+N4T
 Ebt9qbHqX7ccx+yhjzbfWK1RvFHZyv5Urb4bji6LShku+DSQFr4ASv2qZFSGbYvybd0gLK
 kYL4NMPRpIu0doLGv2tsvaiE9ntz4pA=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2B2FA634C93;
 Wed, 25 Jun 2025 11:16:41 +0300 (EEST)
Date: Wed, 25 Jun 2025 08:16:40 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/nouveau/disp: Use dev->dev to get the device
Message-ID: <aFuwaMpjbvWgcwYV@valkosipuli.retiisi.eu>
References: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
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

On Wed, Apr 09, 2025 at 01:33:44PM +0300, Sakari Ailus wrote:
> The local variable dev points to drm->dev already, use dev directly.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Ping.

-- 
Sakari Ailus
