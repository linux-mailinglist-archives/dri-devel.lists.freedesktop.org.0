Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093C725847
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1B210E46D;
	Wed,  7 Jun 2023 08:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347A210E362
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:39:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686062339; cv=none; d=zohomail.in; s=zohoarc; 
 b=NRMwi30fHFoOYPTsJxxPO8mtNBPqggM7ZYFYKYiH5T+3S+bO32/iCjvSCJohkvSusJJdGWPC1Fyo2/HpIEcNFiL7wMNQotTltfN0qLMi6y+AkmBR2k4waDePDO9X6ovrSXQ/IAFzyZL9Y3dzrIhjB5cjezOGaYX4qX0dOUzT/yA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686062339;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=we4OKyiqxKpRZqTOEuovizJ9NsdFVjeQ9dA+yX7m0xQ=; 
 b=LPvOJ7fM11E7ZXnz1BUNR76kulY0nl9otY5bAQBTEYnQqivKa3Dbi2e1R6tdNFKdvb+Q3/zKkWwME/KdSBFVzCx0MmHBTnXWNIBkCwwTufeT1Jvlcu4GQOTnDcb4AIYUhQGew1hDYN7BGWhvGbShzmv33iv/Ugh3I8IASrx6yJg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686062339; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=we4OKyiqxKpRZqTOEuovizJ9NsdFVjeQ9dA+yX7m0xQ=;
 b=dUxBTwoXq4sKuQ3aRnhHNUfBwypUh6wjQ00adzIIHni5kMVZ70/OS3OI3wg1Za7F
 spU+vGtHHZjNRZ97GnFvE10tpGuKWuSkO33UycppjDjHO5J/8GRSDBS61MsPOGPIixj
 3k8UAOVhTPTjJEefFpkhjQPRGCvzfXC5XtUQrhI8=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1686062307468507.0230860934555;
 Tue, 6 Jun 2023 20:08:27 +0530 (IST)
Date: Tue, 06 Jun 2023 20:08:27 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <1889125187d.5d36766d120183.6659725053490512400@siddh.me>
In-Reply-To: <20230606142322.GB5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <52c8eb0f241a9d67ce5b7e6fc64dc397e735ccd8.1686047727.git.code@siddh.me>
 <20230606142322.GB5197@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 3/8] drm: Remove usage of deprecated DRM_INFO
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Jun 2023 19:53:22 +0530, Laurent Pinchart wrote:
> Hi Siddh,
> 
> Thank you for the patch.

Anytime :)

> Any plan to remove it from drivers as well ? If not you should mention
> in the commit message (probably in the subject line itself) that you're
> only addressing the DRM core.
> 
> Same comment for further patches in this series.

Yeah, this patch set aims to replace just in drm core (as mentioned in
the cover).

I thought "drm" would suffice since I did not specify a specific driver
like i915. So the subject line should say "drm core: ..."?

Thanks,
Siddh

