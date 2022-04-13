Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6F4FFC3E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 19:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D8010E189;
	Wed, 13 Apr 2022 17:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1221610E189;
 Wed, 13 Apr 2022 17:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649870324; x=1681406324;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=/V2AxXR/5X4jJP7Rgd8gNsygZGvjxfRTU/TinntFjIQ=;
 b=e1wno9YjCqXnZoX5ujU4UnxL1yGSPRGf41SVw9FthzO5TPEZfvM5zoja
 WXmqElIJLMhxjben6dSBQL88hVTLdmKt+eEFIhsjomFaBlZ1zvmjwtZcp
 TYZEQyEs5kDFbV097z6FVsPocvxF9FfJ0c9zhaWHTVNclpAhp9FSZDC7R
 x7TDvVgYCCYbSZnJbPkyU+d/8S5XKDorW0j3VsD0I2l3EMuMWHfNQ+1PL
 s0yzqeqv4RR0vH7fo/EvWysv7iEugRiMizdffTncHu2IYiEYZ2k/W+89q
 JtO/agEkp4kygdUbW0QXwmbzqWWcl/U4cFJEbP5PG/l6VqHI8aPRtAhH3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="250013702"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="250013702"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:18:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="552290888"
Received: from jardanow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.150.86])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 10:18:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Fran=C3=A7ois?= Valenduc <francoisvalenduc@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes with
 spots in console screeens.
In-Reply-To: <38ecddfe-194c-7336-514d-de90c5aabb5c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <38ecddfe-194c-7336-514d-de90c5aabb5c@gmail.com>
Date: Wed, 13 Apr 2022 20:18:18 +0300
Message-ID: <87pmlkgaw5.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, Fran=C3=A7ois Valenduc <francoisvalenduc@gmail.com> wr=
ote:
> Commit 15512021eb3975a8c2366e3883337e252bb0eee5=20
> (15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spots=20
> to appears on the right upper corner of all console screens see the=20
> attached photo). git-bisect shows that this is the offending commit and=20
> if I revert it, the problem goes away. The problem still occurs with=20
> kernel 5.18-rc2 and to all stable trees where it was applied.
> Can somebody explains what happens ?
>
> The video card is the following: VGA compatible controller: Intel=20
> Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00=20
> [VGA controller])
>
> Please tell me if you need more info.

Replied to your other message:
https://lore.kernel.org/r/87v8vcgb63.fsf@intel.com

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
