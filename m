Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7D203E1C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 19:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432956E83D;
	Mon, 22 Jun 2020 17:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09A86E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 17:35:54 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4A6B4804D8;
 Mon, 22 Jun 2020 19:35:50 +0200 (CEST)
Date: Mon, 22 Jun 2020 19:35:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning:
 stack frame size of 8312 bytes in function 'ld9040_prepare'
Message-ID: <20200622173548.GA770766@ravnborg.org>
References: <202006210249.QHly8bQZ%lkp@intel.com>
 <CA+h21hpABfDvthiwq_JwWGpqZ68VJxu5TOBVbw_Gaxpq8j+XQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h21hpABfDvthiwq_JwWGpqZ68VJxu5TOBVbw_Gaxpq8j+XQg@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=jUwGT8AIfRSel3yE9RIA:9 a=CjuIK1q_8ugA:10
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 airlied@linux.ie, Mark Brown <broonie@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vladimir

> I really don't get what's the problem here. The listing of
> ld9040_prepare at the given commit and with the given .config is:

The culprint is likely ld9040_brightness_set() that is inlined.

I think we have troubles with

    static u8 const ld9040_gammas[25][22]

I did not look closely but if you can reproduce this is where I think you
should look.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
