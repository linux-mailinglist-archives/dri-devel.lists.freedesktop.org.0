Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED352A52F
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 16:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEADE10E086;
	Tue, 17 May 2022 14:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502A110E086
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 14:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id E43681F44765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652798925;
 bh=yNNPr5XFsSXSJe4H/gUzu6dOOR6FMgJNwNBFp9VwSAk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m/zJebqbp/Lb/8dfj9qgPiJdfr5Nu67sgf3VB6fu1RmxFwYoenwnKlx341aH0t4pL
 mfRC7shfAYoSDrXpr/Kuv6SMUGlcvA2CtGzl48kP4lldT7Si1rLtf1U7gZgIeq81BS
 TsUMiiA48U797AXCFFcow4aW0Fp9NaWyFOOEC3Sxy+zMTrCOLyQhp5SiWnlrJcoKYN
 PGKsfVQRy20lGeGs1cXgtvKa60DWUNSz5o56050P4UQQvVUbJdTMYia4VbZ6ToGxSn
 jt4l2RDBxLgNDmIsTeDVURh/e9nDicCIJOHNNmG/xFeaDQIJeWZY7f8geFqTsud7h+
 N+SBslj6j9anA==
Message-ID: <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
Date: Tue, 17 May 2022 17:48:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Erico Nunes <nunes.erico@gmail.com>, Steven Price <steven.price@arm.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/22 17:13, Andrey Grodzovsky wrote:
> Done.
> 
> Andrey

Awesome, thank you!

-- 
Best regards,
Dmitry
