Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F0B35650A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 09:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC20892BD;
	Wed,  7 Apr 2021 07:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BC5892BD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 07:16:50 +0000 (UTC)
Date: Wed, 07 Apr 2021 07:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617779807;
 bh=HVBcGOPvLSAFIyarPd3qF/C5tNpTu6Ja2UuinT14nmE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dx1ODbs9Oa4XkTPdLstsrzC1/nUBiKrvxJL7dFfHBMb+abUoZ6gLMiy4rpuqx+HAS
 FDb1PV1uBShLKwSy1g+kji9JoOxxAxHez/WIfCJ7sGmLBDVTuQMOALQKXlrD/fCypM
 2bV5BEZ0Em1u+CVHlSPS4xVjBg/gBN7xJtih4eECXYMXvF80+aHA9yvJNFcIUcHnI5
 5nIJxNTSVr53bhKq4O0T+DPM7xUph5b0lZ5Ri0S78ew5MXlgR2q51EI7WggazHfA55
 63PdLAPaE/u2C8NzUwEb2Dw6uoAe20JL8lYKuau0yocar+Ycsaj4xxAegXZMT6gTFZ
 YDCVOvXjlQ2VQ==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: demote connector force-probes for
 non-master clients
Message-ID: <itV15ocZXBT9rpF0IwtL2H5MES6wcFyY2FfKiuN_4sc6VM39xYBEvYz42p6Iba2IW_MuNZk2_dws36blub8Pd8WBod4t_ruqFk9wjRI-fbE=@emersion.fr>
In-Reply-To: <20210407100224.653fa3e7@eldfell>
References: <20210402112212.5625-1-contact@emersion.fr>
 <20210407100224.653fa3e7@eldfell>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, April 7th, 2021 at 9:02 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> Btw. can force-probe be triggered via sysfs as well and does it require
> root privs?

sysfs can force-probe like so:

    echo detect | sudo tee /sys/class/drm/card0-DP-1/status

But this requires root, yes.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
