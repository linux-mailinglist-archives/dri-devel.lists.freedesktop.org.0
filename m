Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F44E51D1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 13:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B45510E6A5;
	Wed, 23 Mar 2022 12:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B2210E6A5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 12:04:28 +0000 (UTC)
Date: Wed, 23 Mar 2022 12:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1648037066;
 bh=h4InX3QbhX/9tTuxNM2cupqSoZNVXz+7MzzxBhr11YY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=br2AOvFA9TNz6VzP5ABGnHmoB6ASAquXNdTj7xCxCznA+FZjmFveqDL70ASnnHnOI
 crNNXakqd3FE5ZX0mscGOG9mK5a9Fzk6LOb9ZkPqb7KdQ+6leAxhD5tJQQFL1Tk8Lm
 YfaRHwvEmqf8V4fCJQL1DyNzUFbRCwIJOXUZt8YtaniKqPr7K/eXv0BlJBu59VqbIQ
 bJI4oiujmAGtsPSFMPA5cqQL4I0jKZkdA01lSSLhAA4b/Qthhja5aCEQu8J7w1A9Vu
 /wIU82YfyjHWvfgRYwuOMlfsl/Oa6pTCus5A9ZD3KwfCj/j2d2tmBtkcPwWt15Lwys
 AcOMJDX1B/4gQ==
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [v8 3/5] drm/edid: read HF-EEODB ext block
Message-ID: <v5n3uG2NAQA-QZycdMslyq4R7fW8xPTlrIsDkPubuVyx5tf_VG_YZp_GHylatC_-fTg01rR8sZtbHcGSzqdho8YZyuKDihIX-jJ4CGAgems=@emersion.fr>
In-Reply-To: <87tuboj2rl.fsf@intel.com>
References: <20220317124202.14189-1-shawn.c.lee@intel.com>
 <20220317124202.14189-4-shawn.c.lee@intel.com> <8735j9j7vd.fsf@intel.com>
 <87tuboj2rl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 23rd, 2022 at 13:02, Jani Nikula <jani.nikula@intel.com=
> wrote:

> Simon and Daniel also tell me on IRC we can't just modify the base block
> extension count to match HF-EEODB to dodge the problem, because the EDID
> gets exposed to userspace.

I'm not familiar how the EDID blob gets exposed to user-space. If the
EDID data gets copied when creating the blob, and the blob is created
before the kernel mutates the EDID to accomodate for HF-EEODB, then
this proposal might still be workable.
