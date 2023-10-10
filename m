Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA317BF4BB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 09:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E91810E1B5;
	Tue, 10 Oct 2023 07:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9672C10E1B5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 07:50:59 +0000 (UTC)
Received: from [192.168.1.23] (unknown [171.76.86.192])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 088966607038;
 Tue, 10 Oct 2023 08:50:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696924258;
 bh=uSu0g+zrD88+d7SsFCucNpmU9HR6IeduY5+Lnz9neKA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ALlmQ31A83wpiAqOmjFDvybjtoYsUzTqD2PG6Px+VQnHLoUjSTBcJ7aNNU6Wnhrwl
 QP2YAyoZJr0rVR4h+SOBa27eo+eewkZkxitfCcrc3a07LkgXrdvqIB17TVg6Qi5ZAV
 R75p+Qgqj0WifGmCENK4FkliTbjFovnKmoUcY9vKcifCVP5bXojrj2wOMujU5G0/js
 C4wqlyvHMfaO7xJf8HfMWsAr2uOxjKxP2HUlZ5sAbhUceGRgJO0YM142qTlBCGEmjq
 C64Z+ChN9FJ4YBChVZOj7rS9BUijobKC2iqix63tlKLK/KCweCC+zlayv6dQdzcMkx
 3nd1HfENSLy3g==
Message-ID: <a4393a64-a640-a935-7e7c-e1e287bfe528@collabora.com>
Date: Tue, 10 Oct 2023 13:20:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/9] drm/ci: add helper script update-xfails.py
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231009004953.203576-1-helen.koike@collabora.com>
 <20231009004953.203576-4-helen.koike@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20231009004953.203576-4-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helen,

On 09/10/23 06:19, Helen Koike wrote:
> Add helper script that given a gitlab pipeline url, analyse which are
> the failures and flakes and update the xfails folder accordingly.
> 
> Example:
> Trigger a pipeline in gitlab infrastructure, than re-try a few jobs more
> than once (so we can have data if failues are consistent across jobs
> with the same name or if they are flakes) and execute:
> 
> update-xfails.py https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/970661
> 
> git diff should show you that it updated files in xfails folder.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Hello,
> 
> This script is being very handy for me, so I suppose it could be handy
> to others, since I'm publishing it in the xfails folder.
> 
> Let me know your thoughts.

Thanks for the script.

Tested-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh
