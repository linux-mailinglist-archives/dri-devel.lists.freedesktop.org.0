Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1272E2262
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 23:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D99489BCD;
	Wed, 23 Dec 2020 22:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0388FBF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 22:20:16 +0000 (UTC)
Date: Wed, 23 Dec 2020 22:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608762014;
 bh=EK/kRuktdtjfQl45kjvt1uNuLM2wx6A+3pLRg30o7AI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=HQBB7c4AzpvPt+F0PSqxFQgiWKTPWDOo2evV4XsOQYMJf3Cxfd/j6F1dkf+Q8tpsH
 QgUOKzxBfeNBFvKU/kzeO+6LcZL7j6dGJNR89FR87faPSBijOKDdG9RpoORiB90Iu6
 W7/TBErmSmocrT3LO4fW56DkeRM1T+xCMTgV03X26cKEvwoK8xHVzqtXqklQLNIxoX
 +r4YGNcJ7OxghwrWKuZcSU/L/Bg9j62uLUDBxmRKdiccPmrvQw7YCcH1dUKy5OwxoJ
 bY8aWa6WRRlDEM+xY9YxcRRT666H/BfDhri4m9s06fwqIwUvR/Vp25CEvaQFD/nT2k
 MKScipIHD5S0g==
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v8 4/4] NOTFORMERGE: drm/logicvc: Add plane colorkey
 support
Message-ID: <oDsOkjfTYKa11LxfNy4LBLqutkVidfFn8--tjQPZj4w9gzCYNTOFglHqxXohsrYqTJ4uDv2xgJNKXPHzgAsACGnCkbKQis95SScGucOb1PI=@emersion.fr>
In-Reply-To: <20201223212947.160565-5-paul.kocialkowski@bootlin.com>
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
 <20201223212947.160565-5-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau already has something for colorkey:
https://drmdb.emersion.fr/properties/4008636142/colorkey

I know this is marked "not for merge", but it would be nice to discuss
with them and come up with a standardized property.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
