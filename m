Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F1B9BA33D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 01:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8863C10E240;
	Sun,  3 Nov 2024 00:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.b="NNturAPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192CF10E240
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 00:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3kS/UVmVDyI71Z9yQSfW9xsxDEcWDmKwrG8nTAZtBSA=; b=NNturAPRF3OuCUxqIHmJQGP61t
 AQUzJ/PCDKZvEpxfbL0mz4DC7KebGur7pw5CWM/V5W+Hvr6UPrsedT3N9WcFoXpGcEi/JwKIc2cpM
 uakGn1J2WrxQImRiPNUYxqHzxN7bdKS0C4O9118G2Un+s+SyNMB1iGupUHA80tcyN61HwQJFoNIfb
 Q//BmI8EriT+LG0XVdcLtB+T0Te2h6VhEe0q2BBJhsvso1gVm4AqRrHvG9SQmPMKLS05Q6vCRLAtQ
 2V2CZ7HppDh8O0bcLqQaVTk63x1nuUnZRya75APgPJLh8jvJfpGd4/RD2Hd5IyPtSZNQR/SMaUts5
 rQs5eeRQ==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <cjwatson@debian.org>)
 id 1t7OQL-00B22N-1Z; Sun, 03 Nov 2024 00:24:57 +0000
Received: from ns1.rosewood.vpn.ucam.org ([172.20.153.2] helo=riva.ucam.org)
 by riva.rosewood.vpn.ucam.org with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cjwatson@debian.org>) id 1t7OQJ-004io1-1u;
 Sun, 03 Nov 2024 00:24:55 +0000
Date: Sun, 3 Nov 2024 00:24:54 +0000
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
Message-ID: <ZybC1lsbMb91DzFW@riva.ucam.org>
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
 <Zya6ApewCZQNEfJb@riva.ucam.org>
 <20241103000534.th3jq7umwojlxnma@devuan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103000534.th3jq7umwojlxnma@devuan>
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

On Sun, Nov 03, 2024 at 01:05:34AM +0100, Alejandro Colomar wrote:
> Are you sure?  With a small tweak, I get the following comparison:
> 
> 	alx@devuan:~/src/linux/man-pages/man-pages/main$ time lexgrog man/*/* | wc
> 	lexgrog: can't resolve man7/groff_man.7
> 	  12475   99295  919842

Comparing anything to lexgrog isn't very interesting; it's a debugging
tool and is not in itself very performance-sensitive.  As I've explained
elsewhere, the interesting thing is mandb, which uses the same code
in-process to scan a whole tree of pages in one go.  I do not expect to
ever want to replace that with a shell pipeline.

-- 
Colin Watson (he/him)                              [cjwatson@debian.org]
