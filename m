Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6BF725844
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C840810E466;
	Wed,  7 Jun 2023 08:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A517410E38D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686071812; cv=none; d=zohomail.in; s=zohoarc; 
 b=ATrlHIcqcLpy1PBiRvhF7ACfyIJDrqdLx7VuzKLtLADdGOPy2KtrBQmZpkVvmFrCp+xhPpTnSLWxeJJbmfUJMjS7hFvOJ2V1bRhtLnl3nfDtRO2PPqnV/Sl9DVpgpIRO8JFsSjq3rPOCsdexYF/of3gPyw3kmEmeclooFO2benI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686071812;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=LTxuxhAkDUTr7cvt9W2R40ESQVovz8E2KvQjnCTzwmk=; 
 b=d9jAGnc7PtqUmZhZZRmrtXcVp/0zdeiopoa1q1ktD6WxUVgD19w1lFWPbQRBwKIy5HzaKX+b04S50A+zRL5AZ+KubPNXihhtIP51FUfi8bYEWcd3nQtPKAV7Dzp+OhLJKXTig0ZeOSUm+FnGdBP1tHOmSMY1qLicdKyWajKF120=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686071812; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=LTxuxhAkDUTr7cvt9W2R40ESQVovz8E2KvQjnCTzwmk=;
 b=t5SOgODmJS0mdusxjbfc+2BsRCB66NPFEZuH/oG7AY0QbnXJ2/h/fxzA5qRwwBwr
 ExzAcXtHTkz5O5xI2ZjLunbCzmi23ZMSKQQ1KwQk6S4tdC/yKAVCAIaEE/KJ0ya2hcl
 vxGIULlPy5o8LQaJ65f7Yk7PaD/67TchBMtAWyog=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1686071671472920.9108657396287;
 Tue, 6 Jun 2023 22:44:31 +0530 (IST)
Date: Tue, 06 Jun 2023 22:44:31 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <18891b3faa3.57976e1f126744.7700241596970251743@siddh.me>
In-Reply-To: <20230606145706.GE7234@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <3b880e4a20b7952b257b896900256fcfff14b153.1686047727.git.code@siddh.me>
 <20230606145706.GE7234@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 6/8] drm: Remove usage of deprecated DRM_DEBUG
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

On Tue, 06 Jun 2023 20:27:06 +0530, Laurent Pinchart wrote:
> Hi Siddh,
> 
> Thank you for the patch.

Anytime :)

> >       if (!ctx_entry) {
> > -             DRM_DEBUG("out of memory\n");
> > +             drm_dbg_core(dev, "out of memory\n");
> 
> This message could also be dropped.

Okay.

> > -     DRM_DEBUG("\n");
> > +     drm_dbg_core(dev, "\n");
> 
> This message seems of dubious value :-) Maybe you could drop it in a
> patch on top of this series ?

Okay.

> > -     DRM_DEBUG("\n");
> > +     drm_dbg_core(NULL, "\n");
> 
> This is even worse :-) The next two messages are also fairly useless,
> they should be expanded, or dropped.

Okay.

> > -     DRM_DEBUG("\n");
> > +   drm_dbg_core(dev, "\n");
> 
> Ditto.

Okay.

> > +   drm_dbg_core(dev, "\n");
> > +
> 
> Same, and the two messages below too.

Okay.

> > -   DRM_DEBUG("\n");
> > +     drm_dbg_core(dev, "\n");
> 
> Here too.

Okay.

> With the commit subject fixed,
> 
> Reviewed-by: Laurent Pinchart laurent.pinchart+renesas@ideasonboard.com>

Thanks,
Siddh
