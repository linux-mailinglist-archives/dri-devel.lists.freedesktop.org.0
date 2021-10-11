Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E2429813
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 22:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B5589D77;
	Mon, 11 Oct 2021 20:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE6889D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 20:19:17 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E0E4B1F41F;
 Mon, 11 Oct 2021 22:19:14 +0200 (CEST)
Subject: Re: [PATCH v2] drm/msm/dsi: Use division result from div_u64_rem in
 7nm and 14nm PLL
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20211011201642.167700-1-marijn.suijten@somainline.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <b550abf9-ae80-bbdd-de26-2ce95386d08b@somainline.org>
Date: Mon, 11 Oct 2021 22:19:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011201642.167700-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
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

> div_u64_rem provides the result of the division and additionally the
> remainder; don't use this function to solely calculate the remainder
> while calculating the division again with div_u64.
> 
> A similar improvement was applied earlier to the 10nm pll in
> 5c191fef4ce2 ("drm/msm/dsi_pll_10nm: Fix dividing the same numbers
> twice").
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> 
> Changes in v2:
> - Corrected two typos in the first commit-message sentence.
> 

Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
