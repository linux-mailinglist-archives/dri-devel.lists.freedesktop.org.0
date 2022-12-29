Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D7658B74
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 11:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F1810E257;
	Thu, 29 Dec 2022 10:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645C10E257
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 10:15:14 +0000 (UTC)
Received: from [192.168.2.235] (109-252-113-89.nat.spd-mgts.ru
 [109.252.113.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B5B5660036C;
 Thu, 29 Dec 2022 10:15:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672308912;
 bh=0kQT8Bh1gpTI0PhTVbpVVPlgGNzAygaDOS3KBPSE7kU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C69GwGwqAdptSU2nE5YnNU+Zs2QRdOblVvLaqpzlNVf6V+g84Y5P+5fr1s49N7wmX
 Eys8dD9ikMyekdpwuql8FK1NcH3WMPcW7FP3hZtGLME3nnl2DgcCWEFaNtNt3LQaG4
 8pkMYaIk9kbx+Mxb6JqdRlTRfmaFCrKveX+QcemDz0YV7udfOQnV2d4CgKeXAf5nZc
 gUHOO39HdVGxi8siBJ0snIgZAuOA9lxqSKI1Z1RQWysDde372JfZ3Pm6uGIA5EomCP
 py34SBKYg28JW0/ep3U9rn51D6hwljmpZaJPKCl7VSb0IeVPGrWId7m9M9v/SunmKo
 jLmO0VgLFe40A==
Message-ID: <41aecacc-44e5-1455-48cb-20e32187610c@collabora.com>
Date: Thu, 29 Dec 2022 13:15:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] drm/scheduler: Fix lockup in drm_sched_entity_kill()
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <3f87a88c-c375-4a02-0f09-4831544e5f96@igalia.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <3f87a88c-c375-4a02-0f09-4831544e5f96@igalia.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Guilherme G. Piccoli" <kernel@gpiccoli.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, luben.tuikov@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/27/22 22:28, Guilherme G. Piccoli wrote:
> Hi Dmitry / Christian, thanks for the fix!
> 
> (And thanks Melissa for pointing that, saving me lots of time in
> research heh)
> 
> Is this fix planned to be released on 6.2-rc cycle? I've just tested it
> on Steam Deck, and it resolved a lockup observed (since v6.2-rc1) -
> exactly the same thing mentioned in the commit message.
> 
> FWIW:
> Tested-By: Guilherme G. Piccoli <gpiccoli@igalia.com> # Steam Deck
I'll push the patch to misc-fixes as soon as it will be rebased on
6.2-rc. Thanks!

Best regards,
Dmitry

