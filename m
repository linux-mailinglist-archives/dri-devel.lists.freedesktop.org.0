Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DF72583A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0D410E461;
	Wed,  7 Jun 2023 08:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910CA10E38D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686071885; cv=none; d=zohomail.in; s=zohoarc; 
 b=fat7aSr4hP7KZUIDjnmaT5q10X8sLQ87y3yxhCyaO4Cy1OjSCktPm4rH7BH6N89E+PHbIdEz5b6SAsDjdQ2jcjGtlvXjy3wt4Uj89Tf6WDXGUc0+kv89ZXFYBt3meCwvZLYogSdDZHW1JrJzgOjaE/3ncIhV4bRqquaTGpb/D84=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686071885;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=VOaURRjH+j7FHRo0DEicjaVzmUpKTc9dyQo++kOw5nI=; 
 b=EI1AQzRPA1IysWg5SJklywj2qmICt/Hd+E22I51qVSrsZiPhToscXAAfg0d9Xj2qkRo/w5Zf3vSyLZPKG9vEXgZEVxO6MdbR5d6uv0fAb+NKA4cMeEh6P3unYDHZn7ysU46fUEvvbEsA152YHKFe3hzSBDdR14N3z0mQmKko3W4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686071885; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VOaURRjH+j7FHRo0DEicjaVzmUpKTc9dyQo++kOw5nI=;
 b=n6vmOER6lo3pzoJdfV8wVRZFtukttrChH9NKMaNShkLglV2crsPtDAXDGgCQdk/h
 8XJ/zIB1ezfvfbpr3OBVpOjJiXpiBWUy0F9QIv+E7Xy/Zqk1v5AHIzk0EGsYluOVmNP
 xkwQWU1vbupb87A+RCjuegfc9MM3jZkyGEgzak7Y=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1686071852876938.8904790603814;
 Tue, 6 Jun 2023 22:47:32 +0530 (IST)
Date: Tue, 06 Jun 2023 22:47:32 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <18891b6bf3c.4ebd5fab126863.7291537060970485946@siddh.me>
In-Reply-To: <20230606150419.GI5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <35bd95856a69f141640c27ea2b5e4073275032f7.1686047727.git.code@siddh.me>
 <20230606150419.GI5197@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 8/8] drm: Remove usage of deprecated DRM_DEBUG_KMS
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

On Tue, 06 Jun 2023 20:34:19 +0530, Laurent Pinchart wrote:
> Hi Siddh,
> 
> Thank you for the patch.

Anytime :)

> > -   DRM_DEBUG_KMS("\n");
> > +     drm_dbg_kms(dev, "\n");
> 
> This message is pretty useless, it could be dropped on top of this
> series.

Okay.

> > -   DRM_DEBUG_KMS("\n");
> > +     drm_dbg_kms(NULL, "\n");
> 
> Same.

Okay.

> > -   DRM_DEBUG_KMS("\n");
> > +     drm_dbg_kms(&dbidev->drm, "\n");
> 
> Same.

Okay.

> With the commit subject fixed,
> 
> Reviewed-by: Laurent Pinchart laurent.pinchart+renesas@ideasonboard.com>

Thanks,
Siddh
