Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC741A6F58
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 00:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48F96E14F;
	Mon, 13 Apr 2020 22:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948A96E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 22:35:33 +0000 (UTC)
Date: Mon, 13 Apr 2020 22:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1586817330;
 bh=jl/uF/D1PYwXMaOqDJFEWYGC7NJfXJLhzLgI8MtWbvw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=DLGTLJlDtp72qIxjJIcyWYZi04gJ8hiXW7N14NeSglVLHZmfXyH1F59RPbbU1vVO9
 IqtLf5AzSsJ/8rvh3QYEb20XgGZBMhQcOf/9KhfhymnOu7KNHXeftPdXopouqzN91O
 bQZEe2JuSnGJRjZnvu9mf5KtfXLai+ShnEtSLccM=
To: Yussuf Khalil <dev@pp3345.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB
 quantization range" property
Message-ID: <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
In-Reply-To: <20200413214024.46500-6-dev@pp3345.net>
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-6-dev@pp3345.net>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, April 13, 2020 11:40 PM, Yussuf Khalil <dev@pp3345.net> wrote:

> DRM now has a globally available "RGB quantization range" connector
> property. i915's "Broadcast RGB" that fulfils the same purpose is now
> considered deprecated, so drop it in favor of the DRM property.

For a UAPI point-of-view, I'm not sure this is fine. Some user-space
might depend on this property, dropping it would break such user-space.

Can we make this property deprecated but still keep it for backwards
compatibility?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
