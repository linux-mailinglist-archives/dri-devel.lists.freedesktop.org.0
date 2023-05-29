Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F227171477F
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B4E10E26E;
	Mon, 29 May 2023 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8690810E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 09:54:55 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1EC8885727;
 Mon, 29 May 2023 11:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685354094;
 bh=9GUyg9+gt7TVBcEa/jnDJGhoVSQTLctlj2bS4yr1fZY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mIyaKHlWyKDfRge7rpO4RsQnmyhSUWEcSRJY7Fi1gP8w06+cu8xmBDWbLPOeDzS/U
 +Rxtd1qQWyV4rmnUmCnnsst7K60Lgw0CDnehN4+eCmv9Fmi6D0STvSJ5OUR5KniP1d
 oCbvGPJNCLY5P0BamRPTDIR8hd1yNtKFgGlCKF+CmI4sxge1EEZ9N5HmO5P/wXAWou
 oIHnhcQtyIoYoQWOHXDTVCgdVNvRr5/MITRXfNir+a8DLvyBRXarvucXBPg5PrAKfH
 uU4CpcV8SFsQqI0s95yjCf/eAjEuX4h8CO0WJhVAFHv06gfO35PxuUmZfjA/3pOBHi
 4Rc9MkON9wEOw==
Message-ID: <f5b83a37-f448-64e5-1d7a-b297106ce22a@denx.de>
Date: Mon, 29 May 2023 11:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/4] ARM: dts: stm32: fix ltdc warnings in stm32mp15
 boards
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-5-raphael.gallais-pou@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230529091359.71987-5-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/29/23 11:13, Raphael Gallais-Pou wrote:
> Those concern:
>    * "#size-cells" and "#address-cells" wrongly used
>    * residual "reg" property appearing on endpoints where it could be
>      avoided
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
