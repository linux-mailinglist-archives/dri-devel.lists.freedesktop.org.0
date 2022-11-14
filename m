Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AE628B8B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 22:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265BF10E10D;
	Mon, 14 Nov 2022 21:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com
 (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880CC10E31E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 21:45:55 +0000 (UTC)
Received: from mailrelay5.pub.mailoutpod2-cph3.one.com
 (mailrelay5.pub.mailoutpod2-cph3.one.com [104.37.34.10])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
 id b665c347-6465-11ed-824f-d0431ea8bb10;
 Mon, 14 Nov 2022 21:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=7Kq2TrkstcbamEArggIuJHMeAdsOFxGUFTWtLF9ZDCk=;
 b=XhR4bnBV89BeS/+94ajkK+fQ4+7lXgz5w09JqCTWfMfmxf0pPIhrXit2JbPOsFtuZ5lYZC3wkobqa
 wqUmlljTaJtRtAfrLSRG4L5QUDvOU9as43oy7m5UhX1DV8AlLw7fehRPlcYGrDb2676tG9z04f0TRr
 Yr4xwHamJZvXFgtKXbD3CJIfq2KD+8TCBkaSINjyhtD/yPAnXzz0usMQqBK+TJMzV93kJ+7azyHhID
 tGlwMoxYUNl2Tn7RPI2no8NX6MwfLGk6ZZI8XACB1xyCKmGOy6qQhvjiDAmL4EYFMBLuS3PYQfxPHn
 PXaz37DkR+ruaph73NZE+Tdfor7YLGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=7Kq2TrkstcbamEArggIuJHMeAdsOFxGUFTWtLF9ZDCk=;
 b=+DXIpGppS+XYVWOi9BMiGioKW0iWNRvsS4NODyow6/T6JZeZy4lN2uPf1E3x10UtIlib9ObCJcaiW
 PbTrl4VDA==
X-HalOne-ID: b483860a-6465-11ed-8631-2b2c31a40212
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id b483860a-6465-11ed-8631-2b2c31a40212;
 Mon, 14 Nov 2022 21:45:52 +0000 (UTC)
Date: Mon, 14 Nov 2022 22:45:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Swindells <rjs@fdy2.co.uk>
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
Message-ID: <Y3K3Dk1nHFXZUo/H@ravnborg.org>
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
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
Cc: dri-devel@lists.freedesktop.org, sfr@canb.auug.org.au,
 marcel.ziswiler@toradex.com, daniel.vetter@ffwll.ch, liuzixian4@huawei.com,
 lucas.demarchi@intel.com, boris.brezillon@collabora.com, nroberts@igalia.com,
 noralf@tronnes.org, cai.huoqing@linux.dev, kraxel@redhat.com,
 tzimmermann@suse.de, kuba@kernel.org, airlied@redhat.com,
 emil.velikov@collabora.com, dan.carpenter@oracle.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 12, 2022 at 07:42:10PM +0000, Robert Swindells wrote:
> Contributors to these files are:
> 
> Noralf Trønnes <noralf@tronnes.org>
> Liu Zixian <liuzixian4@huawei.com>
> Dave Airlie <airlied@redhat.com>
> Thomas Zimmermann <tzimmermann@suse.de>
> Lucas De Marchi <lucas.demarchi@intel.com>
> Gerd Hoffmann <kraxel@redhat.com>
> Rob Herring <robh@kernel.org>
> Jakub Kicinski <kuba@kernel.org>
> Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Stephen Rothwell <sfr@canb.auug.org.au>
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Cai Huoqing <cai.huoqing@linux.dev>
> Neil Roberts <nroberts@igalia.com>
> Marek Szyprowski <m.szyprowski@samsung.com>
> Emil Velikov <emil.velikov@collabora.com>
> Sam Ravnborg <sam@ravnborg.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
