Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6996F18A6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A151B10E16F;
	Fri, 28 Apr 2023 13:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFDD10E16F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PpcTclKxx1k/EfVG4yQr41oM9QVmOB40SVMjWl/npqE=;
 b=k3xZbk49OVdA8HAM23WQf7QvCAkY6osK5NwKaYOCelNTZEEDAi5JLJORKG53rPRLHF2UsEnaWjci2
 UleSovMJWsiI88ObSwz3BFTTOjC+dvZXpyhqmAh22eCaseqhpMutcTvgyACjthLZQisPTD+USiia7s
 6ImH25NiJgbL2Q/PjF4KyEFzSNpy8jfrpmufZNF/jOHLpQUWwx5qYXdybf4Iwxxx7/NKm+hQtW2Q3P
 cyW5mCcjWaxt6Qws7WctuxhcfLpL4nVXl+aSBhVeYilixYQs5Of8ZBVeTVmtKS710j6TwnXUPrNgeF
 4/I0ffLZ6Zgg+oztlcjlnHxl/TX6E/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PpcTclKxx1k/EfVG4yQr41oM9QVmOB40SVMjWl/npqE=;
 b=OoYC+n7ssdxw6mi4jodInt4BWBrg7fNY89ixy7jkhAqbElGIdulre1GkkC01oXDeMYsAhMsN5uwCw
 PnTA6SfBw==
X-HalOne-ID: b3232d4d-e5c4-11ed-9b54-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id b3232d4d-e5c4-11ed-9b54-99461c6a3fe8;
 Fri, 28 Apr 2023 13:00:52 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:00:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/5] fbdev/matrox: Remove trailing whitespaces
Message-ID: <20230428130050.GA3995435@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428092711.406-2-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, linux-m68k@lists.linux-m68k.org,
 geert@linux-m68k.org, linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 11:27:07AM +0200, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
