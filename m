Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F60725849
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C98210E46B;
	Wed,  7 Jun 2023 08:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6657F10E396
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686072586; cv=none; d=zohomail.in; s=zohoarc; 
 b=ZBSRFyICfOJrAcbRS5ORpYDf/ZvmdQpGrrec0bsZ2FJdcsyJXUE8xRytUpTsCX5SsMRW+E3s0SVhULHG30B0s4EWPxzmn1ieFbHo0b19RlltKA4xT6q/XIqrRMZGar+UV8NnSE9ph3gLGuNWHdoilXjYVz0bOuEN0WhL7BppfEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686072586;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Q/lg2cuY9NfgatGsJ+3rhXij7qz4ZMKGJ048y4n18ho=; 
 b=ebPE5QpqZN3hB41JtLPa/Zw6XzxhKqADJq52bkLv3+INKbkNUVlTmheCpt8wGDid9s9EWOjYdamQ3dhd+FBH0p4VLoQX+sbUI8epXFkOGhGsRH0MVG6OfqV2TrIiHGoQ5cS5MJ4i+ddcxdLWWn+DMgi9IQ9Fcr21Y0re3S6COL8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686072586; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Q/lg2cuY9NfgatGsJ+3rhXij7qz4ZMKGJ048y4n18ho=;
 b=cSGdymNuimMWKCBoUWJU2pAg1Wutx0Tu3ZnqguRGfluPTAsaElSoix60vvHg3LJq
 DRW9y6u1r+VXHnktx7PhnELnoa7+V5PZwr7fvgrW122GbCEYqgDzi/UdlJT8q6o8PT2
 A0sppKyz9AU5laiSKfPzx5KlEkgY6pvMHvb6RKfs=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1686072554600520.406666699926;
 Tue, 6 Jun 2023 22:59:14 +0530 (IST)
Date: Tue, 06 Jun 2023 22:59:14 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <18891c17458.393a54b1127185.1502341592143085000@siddh.me>
In-Reply-To: <20230606150545.GJ5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <20230606150545.GJ5197@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 0/8] drm: Remove usage of deprecated DRM_* macros
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

On Tue, 06 Jun 2023 20:35:45 +0530, Laurent Pinchart wrote:
> This is a nice series, thank you for working on that.
> 
> Now that the deprecated macros are used in drivers only, would it make
> sense to move them to a drm_print_deprecated.h header, to make sure no
> new driver uses them ?

Sure, but then should that header be included wherever drm_print.h is
included with a find and replace, to avoid breakage?

Not every file can be seen at a case-by-case basis or by coccinelle
as far as I understand its usage. Consider the following:

DRM_INFO is used on line 210 of amd/amdgpu/amdgpu_acpi.c, but the
file does not even include drm_print.h directly. It includes the
amdgpu.h header, which includes the amdgpu_ring.h header, which
finally has the "#include <drm/drm_print.h>" line.

If a simple find and replace has to be done, then that can be added
at the end of the series.

Thanks,
Siddh
