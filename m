Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70C356AAB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 12:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C0F6E8FA;
	Wed,  7 Apr 2021 10:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ADC6E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 10:59:39 +0000 (UTC)
Date: Wed, 07 Apr 2021 10:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617793177;
 bh=KJECspWceKoa/duWfXXTOMcSU5xltHyQQjQgzOtcgd0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=m0my42GxxYDfe3qBBDjj+tEiqB2CrpYdDTMHVS3uR699qis4AM07aA4bB+L6uCsx4
 j7ESLhKddZmaOGFm9Xbr6GVIuapQc7CADiqj+wiAXy52HvZqGBmuuNpGbuc/eZ6lXp
 XQcclKfCSRrvvmeuHkEsbPT6Ksd3GW4dlrbv/znx8T1TWgBEQV7lQHYcigsdh8NrU6
 Z+qa2llJtSdKLHfrh5jv+h+mGN7BtBp0eoI8v3nCRkYTlgtujGyiWf/+WMDIjty9tK
 /FBzV5ow1F2ylj8X927YV41Np4z0Q3PMWRE1SQZqrwLKQnsRaqmJdHPObUFPyapsp2
 dY1z5wV0SZuOQ==
To: Pekka Paalanen <ppaalanen@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Call for an EDID parsing library
Message-ID: <DJjftAG6WNev87c34XyXFLCHe49rJBCYdqENxfO3uHXUFJXmPerOg5LuQKAbd3D_pdO34vkWgfy9uggujNI12VE-ttglyarF5wAogYC8m3E=@emersion.fr>
In-Reply-To: <20210407114404.13b41822@eldfell>
References: <20210407114404.13b41822@eldfell>
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
Cc: linux-media@vger.kernel.org, xorg-devel@lists.x.org,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW, with my Sway/wlroots hat on I think this is a great idea and I'd
definitely be interested in using such as library. A C API with no
dependencies is pretty important from my point-of-view.

I'd prefer if C++ was not used at all (and could almost be baited into
doing the work if that were the case), but it seems that ship has
sailed already.

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
