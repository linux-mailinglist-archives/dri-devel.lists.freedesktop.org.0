Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73135151C9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7139C10EDAF;
	Fri, 29 Apr 2022 17:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35DB10EDAF
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 17:24:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9843B80029;
 Fri, 29 Apr 2022 19:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651253079;
 bh=5UvwHOuVa77SqdFjnAYHaHQ717VGvxoGwC0KODxVL4w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kl9g0IVeY1J2qNDbdNCZx3AUDEoYvghi0DVnaQUmVLMx40hLOLyOY+0/OaYlSVTTO
 Kei4F/PI4LdoLJ6sezDYBe2PDoa82e/ahWgUukD0iuQ8dqIVDT71tOFTRFt8oyTmPG
 BZ2Rzj8AGLiLPzN5SjkwzbHxQSY1Kqn8QWPvclvWy5Wa2oWlMYM+X0V/kcnydtbpGJ
 n/YR85xuO6kAYnOKr57GLzWDzQTAuAd5Y1ay42EQX7vzkrO33lobpJzJrN6GMccHRU
 fzVnLv653h4VQdrb6+oyHuDplLS2meViW/IJowj5bO8O7oNf8RFGxnQdPdh9KkfwoX
 rpAORa4yURmsw==
Message-ID: <b8222fcd-ec1e-c6c9-905e-da00321443ae@denx.de>
Date: Fri, 29 Apr 2022 19:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add Startek KD070WVFPA043-C069A
 panel support
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, sam@ravnborg.org
References: <20220429172056.3499563-1-festevam@gmail.com>
 <20220429172056.3499563-2-festevam@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220429172056.3499563-2-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 19:20, Fabio Estevam wrote:
> From: Heiko Schocher <hs@denx.de>
> 
> Add Startek KD070WVFPA043-C069A 7" TFT LCD panel support.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> [fabio: passed .flags and .bus_flags]
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Marek Vasut <marex@denx.de>
