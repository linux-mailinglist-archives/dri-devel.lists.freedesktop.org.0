Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0494BAD5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F8710E6BF;
	Thu,  8 Aug 2024 10:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="bwX2TJ89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690A010E6BF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:25:08 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723112698; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AX4MtLArGT0YeizEE6ap3foXEGRAPG3kfQbEjH8W4mcsotf+wbaCyY4c62g0hG9QinqAJx6ijasUiCzinCxs43yKtUAnNDfwONgK48G28xY7+whW+DaYn2uBaMaBMXhQ+YUp+l0RerDKcQtH0urFkxIPGpC1Y3HPxjoMqC7FB5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723112698;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6VuuDzgz6Oct6fAZTlg1PnvNSVOVV/qd+NnU7AJAABk=; 
 b=VoU5kGyoSkqZFYRhF4DlqWLwstp2xwbDK2V2E//g6pTlkeBiEbaBV1FSN1tYtmGd8P63Nv3Sl/FtRhS8oPvR/xM3MjIKoRL9pQJp5hILkErTbRUCQZD4dGnMwdjaiT4x8T/Jq7lCLfXRQ9Ss/WtNqUeYhudSzUaMVv2fVF7E6ks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723112698; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=6VuuDzgz6Oct6fAZTlg1PnvNSVOVV/qd+NnU7AJAABk=;
 b=bwX2TJ89PzTIFNb6xM9L9DMZ4AkRqOA5ehMjsQG3VKC9YpdOG20lQYvoNYAdOQY3
 w6nyLbOW6vPf7ElJp4p3fHnm8+Kd0sfHEok/XUHHq8jQh3UIYthLIagyU6OZplpMn3R
 6o1IB2lanJCdP72lAOEWmHx7GfVxq+o7Ua/zyHgs=
Received: by mx.zohomail.com with SMTPS id 1723112696563524.6318540213172;
 Thu, 8 Aug 2024 03:24:56 -0700 (PDT)
Date: Thu, 8 Aug 2024 12:24:51 +0200
From: Mary Guillemard <mary.guillemard@collabora.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 nd@arm.com
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Message-ID: <ZrSc87IA0U9WPNYW@kuroko.kudu-justice.ts.net>
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
 <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
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

> As it stands, this query has nothing to do with the actual GPU so
> doesn't really belong here.
> 
> It'd be more valuable, and can maybe give better calibration results
> than querying the system timestamp separately in userspace, if you
> reported all of:
>  * the system timer value
>  * the system timer frequency
>  * the GPU timer value
>  * the GPU timer frequency (because it _could_ be different in some systems)
>  * the GPU timer offset

I see, I missed those registers... I will also fix this on my v2 of my Panfrost series.

From my understanding, the GPU timer frequency doesn't have a register
so I suppose it would be wired to cntfrq_el0 if CONFIG_ARM_ARCH_TIMER is
set, am I correct?

Thanks for the review,

Mary
