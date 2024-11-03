Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEB9BA6A6
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 17:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DFF10E05E;
	Sun,  3 Nov 2024 16:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=chiark.greenend.org.uk header.i=@chiark.greenend.org.uk header.b="1szn5lWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1667 seconds by postgrey-1.36 at gabe;
 Sun, 03 Nov 2024 01:15:46 UTC
Received: from chiark.greenend.org.uk (permutation-city.chiark.greenend.org.uk
 [93.93.131.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF9E10E18B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 01:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=chiark.greenend.org.uk; s=n.chiark; h=DKIM-Signature-Warning:In-Reply-To:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=K99DbM/X9UDHqpSWXZmsvhSxE/wI224pXodl18QBjjc=; b=1szn5lWCj0MX
 gtLNF6kOo6nFKs6bFCQSI0pAS2NpCHfz7ONVIRmyjk2IOVYg16FTFxxgCgnYBaTSElylSUb4s4lEj
 tuSbfMibikiHc4pFLr9IIQu0y5OfBCjGWtENWVaCjMZC7V8vA7aHvF2JP4FVdif/Jcu8HLejxngLm
 8aFp0uD14Ld/cQkFX/4EXzVc9gSsvy/UHPeJwGP12EznSzHZnStMMXxkjhXoA6UWG1+pE/TYoSLW5
 Q+jwfNBw1AE/alCeI5+YCk+TX+WbU6JckYan5uAjQ7Lte0aVzBwEXHEQMsKlf/Fs7eeDAmGtbNnSc
 U50F/3jX7gEAg4+DuT7Glg==;
Received: from [90.155.79.218] (helo=riva.rosewood.vpn.ucam.org)
 by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with esmtpsa
 (return-path cjwatson@chiark.greenend.org.uk)
 id 1t7Om4-0007mI-EQ; Sun, 03 Nov 2024 00:47:24 +0000
Received: from ns1.rosewood.vpn.ucam.org ([172.20.153.2] helo=riva.ucam.org)
 by riva.rosewood.vpn.ucam.org with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cjwatson@chiark.greenend.org.uk>)
 id 1t7Om4-004mHG-0S; Sun, 03 Nov 2024 00:47:24 +0000
Date: Sun, 3 Nov 2024 00:47:23 +0000
From: Colin Watson <cjwatson@chiark.greenend.org.uk>
To: Alejandro Colomar <cjwatson@debian.org>
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
Message-ID: <ZybIG9xykOW6driW@riva.ucam.org>
Mail-Followup-To: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
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
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE
 https://www.chiark.greenend.org.uk/dkim-rotate/README.txt
 https://www.chiark.greenend.org.uk/dkim-rotate/99/994dcb1603a1454f0f92dbe5c4081b04.pem
X-Mailman-Approved-At: Sun, 03 Nov 2024 16:30:27 +0000
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

I'm not trying to stop you committing whatever you want to your
repository, of course, but I want to be clear that this doesn't actually
solve the right problem for manual page indexing.  The point of the
parsing code in mandb(8) - and I'm not claiming that it's great code or
the perfect design, just that it works most of the time - is to extract
the names and summary-descriptions from each page so that they can be
used by tools such as apropos(1) and whatis(1).  Splitting on section
boundaries is just the simplest part of that problem, and I don't think
that doing it in a separate program really gains anything.

(That's leaving aside things like localized man pages, which I know some
folks on the groff list tend to sniff at but I think they're important,
and the fact that the NAME section has both semantic and presentational
meaning means that like it or not the parser needs to be aware of this.)

-- 
Colin Watson (he/him)                              [cjwatson@debian.org]
