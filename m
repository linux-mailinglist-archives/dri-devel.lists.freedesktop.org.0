Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606721A6F55
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 00:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF65489BF3;
	Mon, 13 Apr 2020 22:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A0489BF3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 22:32:53 +0000 (UTC)
Date: Mon, 13 Apr 2020 22:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1586817170;
 bh=seUGhoZepOTnyOHLE3h+4/e4jZLc55h9FX57lknv1A0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=TU1GJV8XzK9LYQ8Pa65IahPFwirwI2nMYSb8vXtvgfkxI7nBzdDrRJdtCIkqn5q6w
 6EN8wDVhb1ApjR1INNEAinkN+gUgLfU5hI4rfdpkrOUSQ8TUUSiGtfKZfSfQkrxXCa
 rar5mDd027U13HpPbGUAU1GjONIxHZq8mdspJaEA=
To: Yussuf Khalil <dev@pp3345.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/5] drm: Add "RGB quantization range" connector property
Message-ID: <k5qjrDz46MIiTOYsgNWoplNnN6Y2wuMP9iHqOw555BtThDyBETAFd7JNbVK3bi-FUsOu9Gzx9Ibj3p8iLpwc9yAPiOBl-t_5e9tw48e4dFw=@emersion.fr>
In-Reply-To: <20200413214024.46500-3-dev@pp3345.net>
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-3-dev@pp3345.net>
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

Can you also add docs for this property in "DOC: standard connector
properties" in drm_connector.c?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
