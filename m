Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88224FEE0A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 06:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C69710FE35;
	Wed, 13 Apr 2022 04:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DF810FE35
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 04:02:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6B9B183A41;
 Wed, 13 Apr 2022 06:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649822574;
 bh=VOxepa6saW8f5xMFVgq6LneTMoAn5gcb19hh09tKyQY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=z+2cFID3Mxo4NHkoHXP2i3cZNLOpnbh+m4N3QCrbPataq92IcAGS0frmnY41ZOsI4
 UsIohxkvaPc8q5gbtOz2ZroFhUqm95vfySlA9/DQbPdzziURyOByGV83Y4ayM9FjTw
 N/AylaaXBOAt79MTLTDIdxB1TJY3u9w4by9Pa8fFEog9DNhtluvgXqwLZSq2KD3SJA
 0U+EZNoyEfvOnDtXkEi07YrwHm98pNcE/z/nOAWY1mwYHu57t3P5yaKfJ8RR8yw8mh
 ZxHLSso2eW+AA+w01O007VnGadhlB4hAxSp54rBNMuVAl3FM/IFy+bqBA+M/4eAJCg
 CLcVN01fcCs0A==
Message-ID: <5643cc40-9566-3370-6efe-1571206e2c2e@denx.de>
Date: Wed, 13 Apr 2022 06:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: bridge: icn6211: Convert to regmap
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220403171004.368464-1-marex@denx.de>
 <Yk7NSIeYgQIK+3pq@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Yk7NSIeYgQIK+3pq@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 13:38, Mark Brown wrote:
> On Sun, Apr 03, 2022 at 07:10:04PM +0200, Marek Vasut wrote:
>> To make debugging easier, convert driver to regmap. Implement read and write
>> regmap tables for known registers, keep all known register readable and mark
>> those which are obviously read-only as not writeable.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

If that's OK with everyone, I will apply this soon.
