Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7755A1C9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390EF10F1A8;
	Fri, 24 Jun 2022 19:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4915B10F1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hM8H5jNdDV2m3N2/bzcvVYmDN72ROl49guROe3TMxyo=;
 b=I2R7VoY9gPI/yzPc7HW9wo0uNQBSe0c1gdr9ToZgH3Pf+FaqXzC07LDCgjBirz0IrHn/rwA0RhZE/
 D12CtgStiMOFTLzXqAxwqQpiNmtSR+hTwb90lJJLpUqmARzvrfnlz/ysHh5sWStsTE4+mYPWIqqnPA
 m0Qr0nUnrPZ0FYPjYuZ5i8ZMKpjwjShzn59pePRUqe1aW4SJOJVZgy6vSMK14+/26tmPDnc3eiSbqF
 q34RWt9UK5ZB6Pv5FPjy1kQuvo0xwFZmeCduiHv+US5t+w7CT5Xj4CJCLkpkUOL64rI6p2RC4H5QDq
 AWW9jITEUh8iCnFGID4kGZtL85/qqBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hM8H5jNdDV2m3N2/bzcvVYmDN72ROl49guROe3TMxyo=;
 b=/ky+Bw3K9K6hMLaqxxRWKXNWAL6PkHbpiFylHXbVxSytDa1BY3cjAma/BIKW1ML8Qov2xS7RvF7T9
 tgavI81Bw==
X-HalOne-Cookie: 88621d8ca6d01eeacaece26c1c80bcf20f563f0b
X-HalOne-ID: b89fbbbb-f3f3-11ec-a916-d0431ea8a290
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id b89fbbbb-f3f3-11ec-a916-d0431ea8a290;
 Fri, 24 Jun 2022 19:27:44 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:27:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 09/68] drm/bridge: panel: Introduce
 drmm_panel_bridge_add
Message-ID: <YrYQLYAAG09W8P7+@ravnborg.org>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-10-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-10-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 04:31:10PM +0200, Maxime Ripard wrote:
> Unlike what can be found for other entities, there's no DRM-managed
> function to create a panel_bridge instance from a panel.
> 
> Let's introduce one.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
