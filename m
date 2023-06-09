Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE947729B2E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 15:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9189167;
	Fri,  9 Jun 2023 13:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC8B89167
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 13:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686316355; cv=none; d=zohomail.in; s=zohoarc; 
 b=cuRz/wB0oHBkLui5lqe56bz2MX6+c13PeXX1nM6bbq7OfD1AtjgwZwlCekXjUAeFg9mzwhp3dT4k7Mp5vySvQOPL3C9vuW8sz9mvP6Zll701qUWNgTR0EfCElGNjPc1KCiDHNBvsbZo2e/WEy6bCILejYYuEN6mI5TbScW7sebU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686316355;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=0wR1QW2HWcPSLyYbi6wbjalDMT14PCeAcN2byXJtA9M=; 
 b=KCu+ts5342GaIIvf415bG6PbySc0j8+Of6KyO7FRKs+DT0BP4WjZlrPSHyhhGWjgPnzOMZWMtzMF0WvntGnlAXX+AMCKQG5z0+FjIU9Qgx7BXT+Ped/fnxF3sAbvVBYv8F0YF2g8OqozRV3ArkZy+jhKLV4aO1/LvwR46IlX368=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686316355; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0wR1QW2HWcPSLyYbi6wbjalDMT14PCeAcN2byXJtA9M=;
 b=mmGoD3PrOVO9TbHl20Tsc8fbhRqaA/RUAvVt/fzgfg6Ks0wgJsjFUPiDEuqu0FHN
 c0xrXyzAeYZVzYQAfnkcPLtVhSEQAMGSQMNObLCKDHb+gTlMQUL9r1cDWvqgj7RnuAO
 syZf4JEioxMGGe9i1t+1EwCSkR/MpbCRxT76l4yk=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 168631632304450.447001692476306;
 Fri, 9 Jun 2023 18:42:03 +0530 (IST)
Date: Fri, 09 Jun 2023 18:42:03 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jani Nikula" <jani.nikula@linux.intel.com>
Message-ID: <188a04910ce.618ad5d6114734.6174984142831512776@siddh.me>
In-Reply-To: <35def11d3722b361bc394c3d297adea922db5fd9.1686075579.git.code@siddh.me>
References: <cover.1686075579.git.code@siddh.me>
 <35def11d3722b361bc394c3d297adea922db5fd9.1686075579.git.code@siddh.me>
Subject: Re: [PATCH v10 9/9] drm: Remove superfluous print statements in DRM
 core
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Jun 2023 00:00:10 +0530, Siddh Raman Pant wrote:
> There are a couple of superfluous print statements using the drm_*
> macros, which do stuff like printing newlines, print OOM messages
> (OOM while allocating memory is already supposed to be noisy), and
> printing strings like "Initialised" with no extra info whatsoever.
> 
> Thus, remove a couple of these superfluous strings.
> 
> Suggested-by: Laurent Pinchart laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Siddh Raman Pant code@siddh.me>

This patch is the only one introducing these changes additionally,
no other patch content has been changed from v9 and sent for merge.
I should have clarified this in the cover.

This patch may or may not be dropped, courtesy follow-up discussion on
v9 regarding it: https://lore.kernel.org/lkml/87jzwfu1wf.fsf@intel.com/

Thanks,
Siddh
