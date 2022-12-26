Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1966575BD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 12:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D547B10E38A;
	Wed, 28 Dec 2022 11:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5D10E129
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 17:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1672076792; cv=none; d=zohomail.in; s=zohoarc; 
 b=bAlhL7aP3fsjeUrpqp1Pn13A7PMswn4rjjDEuTx8nP41bqM1a4ho9fuAP3Rmk6LkKzHn+OOYEwcV1ZIgzJ3I4PHInsBgRMb+5WBrp1t+oz0aOIUJHPzu8FypiMpfZqxyN/fV3XdXmrkVgbM1f4XyLs5Mkj2kOS5UzBzD2+tXMyM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1672076792;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=dwtLWmXNxflBjaV4qEHidkeaPv4mAwUVJoiUFTomIn4=; 
 b=HBAgciBeGMlOgQvChEQOqwJKEhnKN/hlyf2xFDM78t672dAqr28UV28TaOzh5v6XkyorLAJd3yibnVlAL/dFrCDozJvNE7oAudTGybuByq8zNvHkxPbILzrcYLfbxOBAbVM/A9QyZs1M0+byIV7HcvQPABEDvNmK+BDKmYA58F4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672076792; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=dwtLWmXNxflBjaV4qEHidkeaPv4mAwUVJoiUFTomIn4=;
 b=WdSQ/xrqe/WrDZDhLH/6/sZFDczmij3zCcnuSLBprXO408u9iHVvxPNxj0kErfFc
 dtROgvDBXvtBhgvSEsQwRLxJXt6gU916ShlcOzk8UOgd2KV29Bqswtmh356lHEb7Bng
 PEdn8NBwWPH3Ssx+KBAsWDuhJYFAFH3+AvWK2yWI=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1672076781143688.1686966549753;
 Mon, 26 Dec 2022 23:16:21 +0530 (IST)
Date: Mon, 26 Dec 2022 23:16:21 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Simon Ser" <contact@emersion.fr>
Message-ID: <1854f8ae643.39d1e908319811.6354420860669945497@siddh.me>
In-Reply-To: <cover.1671723195.git.code@siddh.me>
References: <cover.1671723195.git.code@siddh.me>
Subject: Re: [PATCH v2 0/9] drm: Remove usage of deprecated DRM_* macros
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Wed, 28 Dec 2022 11:16:34 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Dec 2022 21:10:34 +0530, Siddh Raman Pant wrote:
> Changes in v2:
> - Removed conversions to pr_*() in DRM_INFO, DRM_NOTE, and DRM_ERROR changes.
> - Due to above, DRM_NOTE usage cannot be removed and the patch is dropped.
> - DRY: NULL support is now achieved by way of a separate function.

I just noticed I forgot to change commit message mentioning pr_*()
after squashing. Apologies for this.

I will send a v3, rebased to drm-misc-next, and also fixing the docs message
pointed out by robot, as well as supporting NULL so pr_* stuff can be moved
to drm_*(NULL, ...).

Thanks,
Siddh
