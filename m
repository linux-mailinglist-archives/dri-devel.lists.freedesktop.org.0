Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC39B4731
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 11:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0816410E61B;
	Tue, 29 Oct 2024 10:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z5hCKpm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD5F10E61B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730198866;
 bh=z4MmmruKHDgcFwBjhbNnPFNvUTYhOCWSBr6hgQkASJE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z5hCKpm64qYkRVt4QTVglpykqTb/92V4MqBTZWVJ8xXtTHSEA+Hxqfc4nIVgAUHkL
 8I+Qti/Mzke1ZDQnS9JgnsglYu/+0jMZAs/r0QFgTUDn7kAOUSJoy5XaWpF2HgKaDj
 ADEy+nFvNw5z+/383EAUHmtTw7vd9wiQGKiPFRKn58GQRNrRHjoBZ7pdR/1k5xLzVw
 PWQx6itWPsLIpq+5YV5aObjk+swpJwV2/gFMXPZvj/Z2rfrtzauzhZ81KCk1Ed2akS
 Rp0sw3ONVscDpyhF0Ytv7msRGgO6PgHPx7B6npYszPKblVBuoBFUjFamG5fRNxwTEj
 VLnl3UM2sfeRw==
Received: from [192.168.50.250] (unknown [171.76.83.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E3E817E12D6;
 Tue, 29 Oct 2024 11:47:43 +0100 (CET)
Message-ID: <7acf985b-044e-41ff-9d5b-621d165b689f@collabora.com>
Date: Tue, 29 Oct 2024 16:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND. PATCH 1/5] drm/ci: Upgrade requirements because of
 bothering by GitHub Dependabot
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 WangYuli <wangyuli@uniontech.com>
Cc: "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 mripard <mripard@kernel.org>, tzimmermann <tzimmermann@suse.de>,
 airlied <airlied@gmail.com>, simona <simona@ffwll.ch>,
 "david.heidelberg" <david.heidelberg@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 guanwentao <guanwentao@uniontech.com>, zhanjun <zhanjun@uniontech.com>
References: <11312D359DDCA3CF+20241017034004.113456-1-wangyuli@uniontech.com>
 <192d7da2f2a.1069aaa001047791.5583301334791429946@collabora.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <192d7da2f2a.1069aaa001047791.5583301334791429946@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helen,

On 29/10/24 16:07, Helen Mae Koike Fornazier wrote:
> 
> 
> 
> 
> ---- On Thu, 17 Oct 2024 00:39:48 -0300 WangYuli  wrote ---
> 
>   > GitHub Dependabot keeps bugging us about old, vulnerable Python packages.
>   >
>   > Until we figure out a way to make it calm, we're stuck updating our
>   > dependencies whenever it complains.
>   >
>   > I guess it's a good thing in the long run, though, right?
>   > Makes our CI a bit "more secure"...
>   >
>   > Signed-off-by: WangYuli wangyuli@uniontech.com>
>   > --
>   > 2.45.2
>   >
>   >
> 
> 
> Hi WangYuli,
> 
> Thanks for this.
> 
> tbh, I'm tempted in removing the python script that is in the repo, and keep it out-of-tree somewhere, since it is a tool that is only triggered manually in local environment.
> 
> I also want to hear Vignesh's thoughts about it.

We can remove xfails/update-xfails.py script since we do not use this in 
CI jobs. Once ci-collate [1] is ready and tested for drm-ci, we could 
use this tool directly.

[1] https://gitlab.freedesktop.org/gfx-ci/ci-collate/

Regards,
Vignesh
