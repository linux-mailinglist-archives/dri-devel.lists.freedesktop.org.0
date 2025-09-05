Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D0B46295
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C4710E0C6;
	Fri,  5 Sep 2025 18:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.b="FDJHuT0W";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="JL71OQyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A67410E0C6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1757097107;
 x=1757701907; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XLrsQjlopOzuKX1/eHehC43L8GgHSisCzYiPyOWGnls=;
 b=FDJHuT0WaJMRjBW8mdLPp3rn7DYJCnm6MmdcaAbqml4Rv+KIqnCfJ1LnGHdg9dHoQrNXkD722CKMa
 QVpTRQjdnY+4S/AQfwH0mXw3MviObRP2q9yf6li9MJKmtENFaqBLQjEEUjCNKNrOXHRTGlfxRb5LaK
 I8FlU2ZAENPgWhqjOJFxNzwWs6M2YxgdkcXHjBmSotJnFeDkvH/nVA7P5oPHwHOBmoquJudQN9ZTFE
 5yQOdfTrZxFBBS3w2hNteMeY9w7vlDQh6vpd3p1CZKE6pq6EUrTGkj59qqA1Rk/IFA4Gj67Bf3EHEO
 3yS8hrf2OmBR7uODszHLSlJ+QVSYv/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1757097107;
 x=1757701907; d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XLrsQjlopOzuKX1/eHehC43L8GgHSisCzYiPyOWGnls=;
 b=JL71OQyOVlwKXEPCWtIEffYZQ1lig2lzogR5w0MWucQlDvlyaaON6JNLm3HR06Yn9Iv3JwwAO1CeO
 cOugqiSCg==
X-HalOne-ID: 92b917ff-8a86-11f0-874e-f7376af24660
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 92b917ff-8a86-11f0-874e-f7376af24660;
 Fri, 05 Sep 2025 18:31:46 +0000 (UTC)
Date: Fri, 5 Sep 2025 20:31:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] fbcon: Rename struct fbcon_ops to struct fbcon
Message-ID: <20250905183145.GA360685@ravnborg.org>
References: <20250818104655.235001-1-tzimmermann@suse.de>
 <20250818104655.235001-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818104655.235001-3-tzimmermann@suse.de>
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

Hi Thomas.

(I needed a distraction - this patchset was my excuse).

On Mon, Aug 18, 2025 at 12:36:37PM +0200, Thomas Zimmermann wrote:
> The type struct fbcon_ops contains fbcon state and callbacks. As the
> callbacks will be removed from struct fbcon_ops, rename the data type
> to struct fbcon. Also rename the variables from ops to confb.
My personal preference would be to name the variable fbcon.
This matches the name of the struct, and I did not see any conflicts
while browsing the diff.
But this is bikeshedding..
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Assuming the bug reported by the kernel robot is fixed.

	Sam
