Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F4872584F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DD510E477;
	Wed,  7 Jun 2023 08:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DB610E38D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686071216; cv=none; d=zohomail.in; s=zohoarc; 
 b=TeqIs6VNP33WxwuTKd12ENO3dx+DVRpR7YgKZTYY43iBeORMFWwHbjzOr9hl5Cf001YaW4UjAiu4pdCT/6Odxps86kwVxjsBHFYpZ0LvIUTzOhQnjAogSoxQDITW1FaZflMTl4xnh2xbsIJzaQANupP1xCGLfTcl8QGERjuazmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686071216;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Skp2Jt0s0n1zpvQS9KKzyWhrNJUPXxN9cPVb5N8Tvco=; 
 b=Vht/F9pHnqkVRJeKfqeciQnNKw0wVcuG2foUXN0oFjFGFfxtZrZbyOKlUaJIj1g+eFrpoPDIJvCjaJRsKagZnkQHNR0d3ctEiFZpg5NN26SEYFNlB5H0EEvkL330Nu6no237NwM78Dqo1o7RT5FeE9OCk8zBacZPt8nlezwhbXM=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686071216; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Skp2Jt0s0n1zpvQS9KKzyWhrNJUPXxN9cPVb5N8Tvco=;
 b=B0BofOy6bRg7j6QAEE+5bE4n2TlzP+xKANhf3K8Gzu/zqSLSY1wTM5rs1QPhgeJx
 D2HYPQCuRfhwOrP1IcL4RQkXFroiqSIaD9hDEZ8Jg/t6VZYEphQkQwPeJ0sk5fmEyMe
 s3QBEUSenlFF0cGi9hYgc8zIwmTNMTdKUDJF10wk=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 168607118569857.07043308212849;
 Tue, 6 Jun 2023 22:36:25 +0530 (IST)
Date: Tue, 06 Jun 2023 22:36:25 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <18891ac9112.109b85f8126467.5521217359687209203@siddh.me>
In-Reply-To: <20230606144452.GE5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <247297c1171bc0ddbde0e90d33961fd5636caf0f.1686047727.git.code@siddh.me>
 <20230606144452.GE5197@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 5/8] drm: Remove usage of deprecated DRM_ERROR
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

On Tue, 06 Jun 2023 20:14:52 +0530, Laurent Pinchart wrote:
> Hi Siddh,
> 
> Thank you for the patch.

Anytime :)

> >       if (!crtcs || !modes || !enabled || !offsets) {
> > -             DRM_ERROR("Memory allocation failed\n");
> > +             drm_err(client->dev, "Memory allocation failed\n");
> 
> We could probably drop this message as memory allocation functions are
> already vocal on failure, but that's a separate fix.

Okay. Should I send a patch at the end of the series removing the
superfluous messages you pointed out in drm core?

> >       if (!drm_core_init_complete) {
> > -             DRM_ERROR("DRM core is not initialized\n");
> > +             drm_err(NULL, "DRM core is not initialized\n");
> 
> Could this use dev ?

No, the drm_device's dev pointer is assigned later. See line 621.

> >       if (!vma_offset_manager) {
> > -             DRM_ERROR("out of memory\n");
> > +             drm_err(dev, "out of memory\n");
> 
> Same here, I think the message could be dropped.

Okay.

> >       if (!ht->table) {
> > -             DRM_ERROR("Out of memory for hash table\n");
> > +             drm_err(NULL, "Out of memory for hash table\n");
> 
> Same.

Okay.
 
> With the commit message fixed as mentioned in the review of an earlier
> patch in this series, and the issue in drm_dev_init() addressed if
> needed,
> 
> Reviewed-by: Laurent Pinchart laurent.pinchart+renesas@ideasonboard.com>

Thanks,
Siddh
