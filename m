Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA966333D32
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 14:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802D889B8F;
	Wed, 10 Mar 2021 13:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B1D89B8F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:02:28 +0000 (UTC)
Received: from [192.168.15.1] (koleje-wifi-0044.koleje.cuni.cz [78.128.191.44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ledoian)
 by nikam.ms.mff.cuni.cz (Postfix) with ESMTPSA id 78B622803F4;
 Wed, 10 Mar 2021 14:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kam.mff.cuni.cz;
 s=gen1; t=1615381344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=un/5UZjRn4gYkqxFK4G17AulEHU5k9ci4WXFFPWHjoQ=;
 b=K4xAU1iZrZNpABwJVPeCRAfO7zLa4L25NhBRbU/d/KmxS6Msg4kQ3TH3Lf3vYVjhcehID9
 ewnhwDrg7k7KEZ8msPyGjHfuomaJlOlsBZBxjQio5wjdnotpNgk/I9qvFoaNLi+DP1hM4t
 fSM7zLLhVmdvaLvZwDPPBU99vo0EOlg=
Subject: Re: [PATCH] drm/gem: add checks of drm_gem_object->funcs
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210228161022.53468-1-ledoian@kam.mff.cuni.cz>
 <e7f0747c-cb10-692a-aa36-194efcab49ef@suse.de>
 <CAKMK7uEMgV=EN7EJh6tzpP6b0x4MX1on9Xoz_zACZVyMK-+QyA@mail.gmail.com>
 <5bd3c672-3277-69b5-27ca-898c8cb79f9e@gmail.com>
 <CADnq5_MyLatUasyU0W9_zQDSrkzfe96NP0YHkom6tthZzf3yvA@mail.gmail.com>
From: =?UTF-8?Q?Pavel_Turinsk=c3=bd?= <ledoian@kam.mff.cuni.cz>
Message-ID: <d6e92dd9-4ffe-0e5e-2bc5-d424dc464e6f@kam.mff.cuni.cz>
Date: Wed, 10 Mar 2021 14:02:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_MyLatUasyU0W9_zQDSrkzfe96NP0YHkom6tthZzf3yvA@mail.gmail.com>
Content-Language: cs-CZ
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Deucher <alexander.deucher@amd.com>, stable <stable@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08. 03. 21 20:20, Alex Deucher wrote:
> Should be fixed here:
> https://patchwork.freedesktop.org/patch/423250/
> 
> Alex

Thanks, it works for me! I tried only the first patch from the series,
the rest didn't look relevant to me. I can try that too.

I didn't test it thoroughly (I don't know how), but the issue with being
unable to start X.org is gone now and the kernel doesn't complain.

Pavel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
