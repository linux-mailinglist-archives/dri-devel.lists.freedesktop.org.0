Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95BC8D5C6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0798F10E7A7;
	Thu, 27 Nov 2025 08:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="01casfL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBB010E7A7;
 Thu, 27 Nov 2025 08:36:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D2B03C16A16;
 Thu, 27 Nov 2025 08:36:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A7FD6068C;
 Thu, 27 Nov 2025 08:36:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0CADF102F1A6A; Thu, 27 Nov 2025 09:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764232602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=b3xOwTTOUDBEVDMcXc56YWUd5ad40tIcw7ULyYpDxls=;
 b=01casfL1a2W9yx0EkESHi/algGcs+34rBTUswcCqehYO9nLqN09EKDaPtEjUnH4VmrN3dM
 WU41Y5adxT8hwQw9rTqVxvUW7NHhj+K/3LS4tQjOweKDkNFuN33rxlx46eCv505OzSJMYJ
 Deqktl9aO/y5FobceeyJn1xH+bX5xO7KeTDC4H0AilTbUj4ODU74zRRRBbE1Gl4XeA2Pia
 x1/EVgPfh5RHKyhLR+YVGFBrRvLbXdZbyyQGrSUkHmFJ6tLpFuPKaoulWQzvXSQjcJodqO
 EISs/HGUA5kN5JnD+Az2ZdiWonFBaS3O2gEL4FtZ4DrNuzV1FBy/tJEpT9M0XA==
Message-ID: <f31fdd56-18d0-47db-9df4-7a5ec73cc59c@bootlin.com>
Date: Thu, 27 Nov 2025 09:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 xaver.hugl@gmail.com, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
 <d8360e9c-502d-4003-93ab-9afd8d716c49@bootlin.com>
 <cb13dd25-82b6-4d8d-a8f2-a9a31ef2e73d@amd.com>
 <ecf54c45-4b45-4fb4-a102-46ce9e1de3a5@amd.com>
 <2270bad3-8634-438a-aa16-2092398e271b@bootlin.com>
 <6QY5Z1orPMIPt_9Gn1wlXHSZHCPaaFuECJl_lVkAAdMUaBxGELZdG2NTHjg7vRV8MaKa0EU1MO9DOnuI4Pzsjej4GuC10FsnqdaVTvWFWBk=@emersion.fr>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <6QY5Z1orPMIPt_9Gn1wlXHSZHCPaaFuECJl_lVkAAdMUaBxGELZdG2NTHjg7vRV8MaKa0EU1MO9DOnuI4Pzsjej4GuC10FsnqdaVTvWFWBk=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 11/26/25 23:38, Simon Ser wrote:
> I've cleaned up the checkpatch warnings (mostly whitespace changes) and
> pushed the series to drm-misc-next. Thanks everyone!

Perfect, thanks !
> Simon

