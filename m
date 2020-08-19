Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7824AA11
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 01:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EA76E882;
	Wed, 19 Aug 2020 23:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9316E882
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 23:56:35 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB9D621744;
 Wed, 19 Aug 2020 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881394;
 bh=clNqGInZpcU+sLDTIvIChzWr8ATSGgZvfk4+nx2hB2U=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=cRPLAgRBIZGi9peqzU372KKon83fIunlNQQHRbXFGjy5YIyMydT3kzDJCgXkRKSYQ
 jVRDUpCIhk/RRyyhY19NHYyvjqLg1JEjwfdeeOTnONtCBShF5WTpi/iKtQ8btc5fIu
 08sS7p9x2nCBSoZsLGId8uw1E7FmuJTvfaSMKd4s=
Date: Wed, 19 Aug 2020 23:56:34 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/5] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
In-Reply-To: <20200813062113.11030-3-andr2000@gmail.com>
References: <20200813062113.11030-3-andr2000@gmail.com>
Message-Id: <20200819235634.BB9D621744@mail.kernel.org>
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
Cc: sstabellini@kernel.org, stable@vger.kernel.org, dan.carpenter@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend").

The bot has tested the following trees: v5.8.1, v5.7.15, v5.4.58, v4.19.139.

v5.8.1: Build OK!
v5.7.15: Build OK!
v5.4.58: Failed to apply! Possible dependencies:
    4c1cb04e0e7a ("drm/xen: fix passing zero to 'PTR_ERR' warning")
    93adc0c2cb72 ("drm/xen: Simplify fb_create")

v4.19.139: Failed to apply! Possible dependencies:
    4c1cb04e0e7a ("drm/xen: fix passing zero to 'PTR_ERR' warning")
    93adc0c2cb72 ("drm/xen: Simplify fb_create")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
