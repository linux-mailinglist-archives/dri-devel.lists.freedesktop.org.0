Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A0D65B6D5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 20:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26510E380;
	Mon,  2 Jan 2023 19:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [46.30.211.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14BB10E380
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 19:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IA046r3t4ojlYOK2avqOmrzgZG5LI6FsuTZMjboQR3Y=;
 b=1t48Hx8/4po34l4T+FGCoaw0/xSJ6Jcw87XfKkq7jNEff3VLg5XGrndwLDeQBxD1JGbY8KItCYz+c
 ZOjD7oXANLepGuO0bPfh0n1UdxIDhWjAqXOcmu5FHyKnzcR9Xid7qv1NCxxg+Lh7BqZp/ddMXgTqIy
 H2MYoh7Y4jXarbaTNEjqQRWKjXbiiF4QhwJpVYzcPGiYjNXID6S8yfs8WMSR3IM91e5gU4uoNSd7S8
 j0BXK9dYryiIMcawEtz34xNns7CZvoC8PGc+WsTmx4Po+DalWnX46i5ESGbm9y/FfAXSZ2r3SizBlG
 ip+Rb7MiIYEekwY8j62ddkNxNrmBLVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IA046r3t4ojlYOK2avqOmrzgZG5LI6FsuTZMjboQR3Y=;
 b=OGZhQDS4j50WDnCmGXpHc+0Da1AGjUkxraBpUC++x47c/ev1pibQXHePDcPAICMgN5zPxw6Y+qp3q
 mrff5pRCQ==
X-HalOne-ID: 0e911d60-8ad0-11ed-af86-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 0e911d60-8ad0-11ed-af86-11abd97b9443;
 Mon, 02 Jan 2023 19:02:54 +0000 (UTC)
Date: Mon, 2 Jan 2023 20:02:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 01/14] drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
Message-ID: <Y7MqXbQLzpbVI5V7@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-2-javierm@redhat.com>
 <Y7MkzucDEdsYenqX@ravnborg.org>
 <8de738ef-588b-1c59-6e97-c0277eb313b1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8de738ef-588b-1c59-6e97-c0277eb313b1@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

> > (If you align '\' under each other it would be nicer, but I could see
> > that mipi_dsi_dcs_write_seq() do not do so).
> 
> Yeah, I was actually thinking about doing like you suggested for this macro
> but preferred to keep it consistent with the existing mipi_dsi_dcs_write_seq()
> macro definition...
> 
> Maybe I can add a preparatory patch that just fixes the backslash characters
> indent for mipi_dsi_dcs_write_seq() to be all aligned?
Yep, that would be nice.

	Sam
