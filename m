Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F210BB0B302
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406E10E0DD;
	Sun, 20 Jul 2025 00:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="f7g4d8kG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CD810E0DD
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752972085; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cAkYgHtv37ehENtfCSx/MN+lq9+Ylrb6iKdrxUJuM+5FMG77INAPMgkMLsAVBXlTbFjr4sZtJZ4Oux0or0jQWEUadg1/VVEhwN7sNJfOM/mkaSH1YfYI5tEPnjKc+QgMSrRNxHeTdBz3SS34pjhgPiuCMOiQuEV1au+rg+gMfvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752972085;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vvJnn10fiOWDfWVPGX6ZaeZ4E5cJTo1UUcUc8Cx/ki0=; 
 b=XXn+iv0PVSPCUzkeF1MYUf5E9ztSheUr0IT78Nxxycd9xLidbQ/k3C6ldh/OItWVl9CK5cGoszb5AXDBzk8z8ESaQpA+Na4RkFVDN1sb8/xUHN5aAd7h13kvtX0JSdwe8tXMmil8g7Ffh+NdDukHJqCw5puELzEDz1silqeq0vQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752972085; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=vvJnn10fiOWDfWVPGX6ZaeZ4E5cJTo1UUcUc8Cx/ki0=;
 b=f7g4d8kGb7hGMsNPPrvaYEyiryugGXPXgWXoE9wrp6MUzjdJltKbYMiPmIfRkB2H
 iyaVJktaUc9rRZ3URyilTvisasCFRiJypDZtFziiav5Ext0k64mb/Ra/TPEHPtbQVs0
 6tKQEWRilNwNBGhtaKdcwatHqcW/F3Ketrtq1s3o=
Received: by mx.zohomail.com with SMTPS id 1752972082801374.456597010289;
 Sat, 19 Jul 2025 17:41:22 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 0/9] drm/panthor: add devcoredump support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250720000146.1405060-1-olvaffe@gmail.com>
Date: Sat, 19 Jul 2025 21:41:06 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Message-Id: <0198AAC0-2F53-4A20-A869-9D720A086818@collabora.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
To: Chia-I Wu <olvaffe@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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

Hi Chia-I Wu :)

> On 19 Jul 2025, at 21:01, Chia-I Wu <olvaffe@gmail.com> wrote:
> 
> This series adds devcoredump support to panthor.
> 
> This is written from scratch and is not based on the prior work[1]. The
> main differences are

I wonder why this was started from scratch? IIRC, that work stopped, among
other things, because we were not sure about what exactly to include in the
dump. I don't think it warranted a completely new implementation, IMHO.

Do you plan to work on the userspace part as well?

-- Daniel

