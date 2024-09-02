Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A203E968053
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C5710E202;
	Mon,  2 Sep 2024 07:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EpCC68db";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5BF10E202
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 07:18:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5E844A4171E;
 Mon,  2 Sep 2024 07:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE09C4CEC2;
 Mon,  2 Sep 2024 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725261506;
 bh=t3O+Haqt881Ky7t8Rj0Jw62sr6ssAiXOVQAeAImmuM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EpCC68dbEmo2/+mIi/v055ItB5z6LNlBLnJBCFvX1IB5+DhCZRV9T/S6cyYy3AsxD
 tSS9g80IH0mbbTkU158+fsH7rLIKR2/dzEiP9Em9dvzU2HCiUrB1YL3aNs28CB6yPa
 J61SFJvYYRg6fOLUDYdpuPTTot/isZ8ntfBXNHc5Twjt8xZpC7NaHdlDD8isVYPl+C
 zJWSU4656qXw7zfBTdjfB5peXcAfdCMIuoWSSCAJmOAOiGhbFKys4s1kBkK6cJFsTP
 olJ8NDXKlrvkybnTnKkgvkbCWL/ypXgkRbu83en+NCmq8NlxBLaJUabOn0I1693o2h
 xY+62Ka8cPcmA==
Date: Mon, 2 Sep 2024 09:18:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, visitorckw@gmail.com
Subject: Re: [PATCH] docs: devicetree: Fix typo in lvds.yaml
Message-ID: <n6rbeaomxoey5acg7jyxcclg3z7p7ucxlxzflpizq2j4cktqep@o35wquc7ioav>
References: <20240901133046.962263-1-eleanor15x@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240901133046.962263-1-eleanor15x@gmail.com>
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

On Sun, Sep 01, 2024 at 09:30:46PM +0800, Yu-Chun Lin wrote:
> Corrected the spelling in the description of LVDS Display Common
> Properties.
> 
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/lvds.yaml | 2 +-

Replacing one typo in one place is a churn. Fix several typos.

You engaged three people to review this, so three people spent their
time on reviewing and answering this trivial stuff.

Please use subject prefixes matching the subsystem. You can get them for
example with  on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof

