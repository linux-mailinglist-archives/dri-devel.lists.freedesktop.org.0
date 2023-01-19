Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14E67330B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB1010E8CD;
	Thu, 19 Jan 2023 07:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D0910E8CD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8RmU549DZV3sHG3j8ZTm4NBHjfrkUuiCrcyrCec7K+A=;
 b=wEt0EBBgU5LTcly3GFA+lxNYbutTTL9rmFz42LPrI2ituqBW14ZLnsy1H8VvCbCiw6kfUjqqy+tfC
 aIGRH7WASsKmiPaFJ8grY1YCEg260L6KG1Y6tum7gAIKA7dzf8lTdXVTiVIbQir3FA0Mm5mdp+1fKx
 kZr9+cEqc08k/cScYIMXXujvP6DrhbDCGvvJXY7Z0P3x3x+nkblXYQn4jFv4xSM1Jus+xKEka0STTh
 zJqWFA+hVXvVU5Mr8JB0TVk7Y6c0igi1vhY9mcXk5NRBt/EeXLkIkxInXtxG4As4w2YUfkfm0+F0ID
 HfT9UEtKfKI0K7eKe7fCuwdL5ws0ZeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8RmU549DZV3sHG3j8ZTm4NBHjfrkUuiCrcyrCec7K+A=;
 b=SaU3lMRsEzNGi8t6uNHk4w7+8ItLIdpaZNrMjFwmcsGiEXF6zT1TS1q7Rtp82tGw4zQZgVrKm/vJj
 DJoIFTVAg==
X-HalOne-ID: bd85b07b-97ce-11ed-94f6-93f0a866dfbb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id bd85b07b-97ce-11ed-94f6-93f0a866dfbb;
 Thu, 19 Jan 2023 07:56:13 +0000 (UTC)
Date: Thu, 19 Jan 2023 08:56:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/radeon: Do not use deprecated drm log API
Message-ID: <Y8j3m6Y5tROJMIMf@ravnborg.org>
References: <20230117180417.21066-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117180417.21066-1-nirmoy.das@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,
On Tue, Jan 17, 2023 at 07:04:16PM +0100, Nirmoy Das wrote:
> Replace deprecated DRM_DEBUG_KMS_RATELIMITED() and DRM_ERROR()
> with proper APIs.
Thanks for working on this!

Also thanks for Christian to take care and apply the patches.

	Sam
