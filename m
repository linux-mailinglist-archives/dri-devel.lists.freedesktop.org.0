Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7E9BA31B
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 00:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F2410E139;
	Sat,  2 Nov 2024 23:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.b="AlG2mx3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CC10E139
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eoGhU4EOnnVch2ZqousEJe/1GDqYRsVtfFAZpWXwzv0=; b=AlG2mx3SsFA1RWNC+Z2sgikSKv
 y7RaposLnPon6AMwqXzk/VWaNBSXd7tux4PJaJqH0yT9AppLSuFoOXbUd2bpvrtpv+cIyI9TvkwfI
 4eRl8OphQOD7zcnxAFb1vvoqYMRMMfHnmr3m9WLAav+1rrlfco+glkszlZlBBqZMGgQq4lKerjuYZ
 fWmVVMbI2gyXtpQemhU7J4xmTTGuM7qGg7yb96ELoDQZF/CbC729qpQe9TgBpoUNFsa+DTL0yiT16
 FDjKOglGcJt8OfNzp2CeWtodXlUWc5ZDWbY+DZQ9PXDgw0axJcw3iuQhwD1Pb5Q5xv0FSthyc09lh
 O/0gDTpA==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <cjwatson@debian.org>)
 id 1t7Npt-00B0e0-Bw; Sat, 02 Nov 2024 23:47:17 +0000
Received: from ns1.rosewood.vpn.ucam.org ([172.20.153.2] helo=riva.ucam.org)
 by riva.rosewood.vpn.ucam.org with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cjwatson@debian.org>) id 1t7Npr-004e0o-2B;
 Sat, 02 Nov 2024 23:47:15 +0000
Date: Sat, 2 Nov 2024 23:47:14 +0000
From: Colin Watson <cjwatson@debian.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <Zya6ApewCZQNEfJb@riva.ucam.org>
Mail-Followup-To: Alejandro Colomar <alx@kernel.org>,
 "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, groff@gnu.org
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <20241102103937.ose4y72a7yl3dcmz@devuan>
 <20241102213620.kfccilxvhihwmnld@devuan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102213620.kfccilxvhihwmnld@devuan>
X-Debian-User: cjwatson
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

On Sat, Nov 02, 2024 at 10:36:20PM +0100, Alejandro Colomar wrote:
> This is quite naive, and will not work with pages that define their own
> stuff, since this script is not groff(1).  But it should be as fast as
> is possible, which is what Colin wants, is as simple as it can be (and
> thus relatively safe), and should work with most pages (as far as
> indexing is concerned, probably all?).

I seem to be being invoked here for something I actually don't think I
want at all, which suggests that wires have been crossed somewhere.  Can
you explain why I'd want to replace some part of a fairly well-optimized
and established C program with a shell pipeline?  I'm pretty certain it
would not be faster, at least.

Thanks,

-- 
Colin Watson (he/him)                              [cjwatson@debian.org]
