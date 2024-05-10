Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBB78C223E
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7895F10E49F;
	Fri, 10 May 2024 10:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="H3MAYKRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0169A10E49F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1715337378; x=1715596578;
 bh=W6ldrZHyhNbaLwRUyHUt1fUzGd1gchc7ZpEta+RuCHM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=H3MAYKRUXM6dhlKd+WmmJcHSKq890Wb0QY7esHVNi42UyKff8ZPyUyhUe+fc3lt3J
 xpZp2Cu8EaOWOXI1Ru5fk6JcAVb04NgEFO58GpkZljQyXF7VWGfYP16dHRzafs6i+j
 q71SUTilLCIinHbtQrBrZ8DCH8ThjtN0k/mT/yMhnjfcHFuH3RcRja27cbYYHpJaKc
 q4Wb6lslW//yaEtFjbBlq3CNeARt6PYb1l7F0bjSeWpudLRvV877nJNOEbsoZfRnC+
 hPAKx3MQM4MPEwbY2V+/wnkZB7DVZMPcMByeooACEXdx6qwpE8lpdppj6WQnB0jrXS
 25ViuoGxmeE3Q==
Date: Fri, 10 May 2024 10:36:16 +0000
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm: use "0" instead of "" for deprecated driver date
Message-ID: <ia3bVucInjRPA5zIVPlcqrKq7dvZvbRQpiz4TbXNtY6R_J2JWjbq3pvY1VEWUQi-lFvIczft6nftX4GNFz1GtZba1ys3HHSAgPb8mG8UfAE=@emersion.fr>
In-Reply-To: <20240510090951.3398882-1-jani.nikula@intel.com>
References: <20240510090951.3398882-1-jani.nikula@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 8f057f7f065eeb364c61c645663933a4505ead3b
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

Sounds good to me.

Reviewed-by: Simon Ser <contact@emersion.fr>
