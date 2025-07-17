Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F839B09207
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CA210E67C;
	Thu, 17 Jul 2025 16:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="nF5YyOi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC0A10E67C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1752770452; x=1753029652;
 bh=LCkSsJU1mnsUQWSRljJum5gspLhDn4EJn8frPOC+QHU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=nF5YyOi3FwhzcqJPsI7aHMB+kLZ/jpJZsWQGSfMoaaEAyE7j8A8SWD7UmBEzYKav9
 scM/svG7sUewqqT7L4dK8ZXOIOC2HGxrrflAbcUyI/JnddhX2SozE/KBElUrtRDQAF
 ItCAfkAeMGBHjAJEK/fU6RABkzVKl+lWn9Fs6fj4XGpbrziV2PPOyqkQMRxj0OUfOw
 EVkLERsoIlEohsKCmYtvYBEHTBn+pNc7LqXFCxd478Tv34itSv6X+CeE08l1a9ZwSl
 NxkOsZJ3LKwM32sAsC+s6uqnPbmkXgrjejSsrXATaZKGBQjpugwmlstOTkA3yMFyuA
 U97/IvNNTnMgw==
Date: Thu, 17 Jul 2025 16:40:46 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions
 with atomic
Message-ID: <kSz2jJd7YqNFSwu84XbqQ8vpStDT0CbdJpMIY7Av0Lbg2oMURZ7sT2PHoKgfYOVt4Nfz2oe8wtFuDYwVT7s3WHU01NT1khprAmLq6Ftq7oY=@emersion.fr>
In-Reply-To: <aHDP19Ny6MEJlS75@phenom.ffwll.local>
References: <20250501112945.6448-1-contact@emersion.fr>
 <chRMluYufVIQOwgvGCTE0bDiRwi69U-MECSebFV3mto1c2_MKEZyVuslrvJgdzusI_CBhz86NSx4oeeClWmZxc_zq1UnCUWlvOVlv9lIyGE=@emersion.fr>
 <aHDP19Ny6MEJlS75@phenom.ffwll.local>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 4cbe9af49eb9da08d804b7e5dbb4bf7edbbfabfc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Thanks for the review Simona!
