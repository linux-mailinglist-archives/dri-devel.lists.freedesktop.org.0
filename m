Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFBE17835F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 20:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451106E85E;
	Tue,  3 Mar 2020 19:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DA36E85E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583265012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vf4h5E8IkOQ4lygsPliUgjFr5XtylcraEA/u77n/sos=;
 b=LDf86eTyZN5wa4esE33NT9Ibayu2gYGGQW1hw1SY9qsavOG7sVdN/xwbuLredk9NoJB18d
 8oqGQ4IPDAKjuXAbFJnWahbI1Wm96HgLLMIz2mRTUC1oKaRkBBxFqDArdyt1PH8kSA4Fcf
 AMPSWmfM/+QrxcAbsGqidLRw1d9k4I0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-gmudIVncN6OzVIphrQuYBw-1; Tue, 03 Mar 2020 14:50:07 -0500
X-MC-Unique: gmudIVncN6OzVIphrQuYBw-1
Received: by mail-qt1-f199.google.com with SMTP id r16so3014366qtt.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 11:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=vf4h5E8IkOQ4lygsPliUgjFr5XtylcraEA/u77n/sos=;
 b=qlL5OlxDigcF/6Bj8ucHYCRjLRg7bRFZEqZoqv3kW5YWmzj6c6c5Akad6SzDuGZrRf
 4qzFoGSfnO5GxiTOoz/0gezNzWvjwrPMCvqDh5BpKEwdTLjQt05reBT3+nGhp/j0UhRj
 jmlg+fwz89ioMFXQx7vC8p9Jk8DgjFITHWqnUOJQw+K+xGpv/UR/63p/9y7veYEkNd7t
 dTeEHucoRGVWmH48dyJ2GR39okQLFmKNCljG5ZE2kZlmv7ORG1K6OWuMdxZZVZW5avRs
 SZ/W9S7Ofr9N/yFyYcg7jCXC05m5RdeAPOsOcgd7FKBfF/0GgmEnISr385wfMFTKeXjz
 9vAQ==
X-Gm-Message-State: ANhLgQ2Efa9ilNwtEBI5vJZUQfSIQFN/yPP7QUtWVrAWdXGDkc8Dyx0b
 hFYTqUAp696sto2Qck29WbOLC2Kx8Xv8jvtShtH3jccw5DEYzmsDTklju+u7KpcLqLMsTPIjCl2
 162kMxeMmsY9PPBs9iY8iYmJq2MxO
X-Received: by 2002:ac8:357b:: with SMTP id z56mr6087801qtb.226.1583265007038; 
 Tue, 03 Mar 2020 11:50:07 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuoqlsF5Q/fYco3ByAB69bUva9hDSW7kKRqW116dyUw2Moz1OhiY2NeJtVZGwucZU1EvvG+kQ==
X-Received: by 2002:ac8:357b:: with SMTP id z56mr6087777qtb.226.1583265006801; 
 Tue, 03 Mar 2020 11:50:06 -0800 (PST)
Received: from desoxy ([2600:380:8e4d:1b16:f190:533c:5a8b:4a57])
 by smtp.gmail.com with ESMTPSA id f13sm8159246qkm.42.2020.03.03.11.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 11:50:06 -0800 (PST)
Message-ID: <8560ac83111aed7b4cf74b96ae578682a764f5c8.camel@redhat.com>
Subject: Re: [v2,2/3] drm/i915: Force DPCD backlight mode on X1 Extreme 2nd
 Gen 4K AMOLED panel
From: Adam Jackson <ajax@redhat.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 03 Mar 2020 14:50:02 -0500
In-Reply-To: <20200211183358.157448-3-lyude@redhat.com>
References: <20200211183358.157448-3-lyude@redhat.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-02-11 at 13:33 -0500, Lyude Paul wrote:

> -	if (!intel_dp_aux_display_control_capable(intel_connector))
> +	/*
> +	 * There are a lot of machines that don't advertise the backlight
> +	 * control interface to use properly in their VBIOS, :\
> +	 */
> +	if (dev_priv->vbt.backlight.type !=
> +	    INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE &&
> +	    !drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
> +			      DP_QUIRK_FORCE_DPCD_BACKLIGHT)) {
> +		DRM_DEV_INFO(dev->dev,
> +			     "Panel advertises DPCD backlight support, but "
> +			     "VBT disagrees. If your backlight controls "
> +			     "don't work try booting with "
> +			     "i915.enable_dpcd_backlight=1. If your machine "
> +			     "needs this, please file a _new_ bug report on "
> +			     "bugs.freedesktop.org against DRI -> "
> +			     "DRM/Intel\n");

Bugzilla's been put out of our misery, probably this should point to
gitlab instead.

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
