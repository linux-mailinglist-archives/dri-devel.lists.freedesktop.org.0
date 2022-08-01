Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74604586D0E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 16:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADB910E6B6;
	Mon,  1 Aug 2022 14:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA2310EBF8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=WRt37k4Qt3GNFMf30YyCmDSeBz142wzTClx/M8GdbzM=;
 b=LgM3jKKR5+0/FNeifzMtb16hHztGaIm4S5kzvoQb7AeUHZH595MCXqtBzRf+52qriwdmH+a2IZgQ+
 KHJdeJrRYpF7Jk/uElV0+n5BjWTQDqG3xT6EBK4bHQ3HPpIMqU39ymPuKn+W+IJB66UhOrjMmVFtov
 i/AAgrf7byV40IPfv0jpBb8mxzIFxACHuQJyXfRXn8dTIuOc8Wj5zk9PWQRD/elk0HuW6EauiB1J4x
 q2O8M3ynu2SgZ32qVTaauWEBmwKjUqTWzfmlw2pLpacunSF/Dadgu1Rov6D6+ZLpghx3pL1W3xXR7O
 fC4uhZaZVXyvKIyfC4j55fLeh5sH85w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=WRt37k4Qt3GNFMf30YyCmDSeBz142wzTClx/M8GdbzM=;
 b=DCdc0iXSfcTWryagaIHxLz0Vvynzo079xqeT92+WlN4Eb3kBY06w5NLaplPl5h5M1kDh+oxzFzHRR
 O6X9h/TCw==
X-HalOne-Cookie: 39eda0a5609e95c7db16012654d8c9a914eb7ab6
X-HalOne-ID: eedeebc8-11a7-11ed-a919-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id eedeebc8-11a7-11ed-a919-d0431ea8a290;
 Mon, 01 Aug 2022 14:40:48 +0000 (UTC)
Date: Mon, 1 Aug 2022 16:40:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Message-ID: <Yufl737qQnxlHeGd@ravnborg.org>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
 <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

> I cannot drop the older DRI1 based uAPI calls.
> This is because include/uapi/drm/via_drm.h needs to retain backward
> compatibility with the existing OpenChrome DDX's XvMC library
> (it gets compiled when OpenChrome DDX is built) and likely with the
> existing DDX Xv code as well.
> If I remove the DRI1 based uAPI calls, the XvMC library will not get
> compiled (compile error will occur since the XvMC library assumes the
> presence of DRI1 based uAPI), and I assume the same for the DDX Xv code
> (I cannot even reach here since the XvMC library is compiled first).

If you just keep the relevant definitions in drm_via.h then the compile
issues should be OK - and then there is no need to implement anything in
the driver. Or did I not understand the problem you are trying to solve?

	Sam
