Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C064553C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E49210E37D;
	Wed,  7 Dec 2022 08:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F54610E036
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 13:44:57 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A7C5480;
 Tue,  6 Dec 2022 14:44:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1670334296;
 bh=IgFcqzfLNWLI38+FwMXHy3E7Ta2WF4GM2D9w3SZl+g0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rmx/AwY0HLpEMAlnzUGfV8+QIeyAtD5VZcBT9HPrSQHFYXZ6XnIrplTHyBJLhCdsD
 bHjbASatb2+BBxsf4TPhDt5T3TVQsBJsGYFGSXkJlBZD/Vj8Ng/kDhhWMgdyfozDB1
 qdGEnZhAPBVhN6FZET2j1B5qzfPHuuwiL2Qjs/Eg=
Message-ID: <b35d7cf0-99ef-86b7-41b3-0751abd4642a@ideasonboard.com>
Date: Tue, 6 Dec 2022 15:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 5/7] arm64: dts: renesas: white-hawk-cpu: Add DP output
 support
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221201095631.89448-6-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdXXoNq0CxSqPLzZUPdVTNa+6u+DNhbm_pCSQOvTHf3EjQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdXXoNq0CxSqPLzZUPdVTNa+6u+DNhbm_pCSQOvTHf3EjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:08:47 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2022 12:10, Geert Uytterhoeven wrote:
> On Thu, Dec 1, 2022 at 10:56 AM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>>
>> Add DT nodes needed for the mini DP connector. The DP is driven by
>> sn65dsi86, which in turn gets the pixel data from the SoC via DSI.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> (same comments as v2)
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.3, with the mini-dp-con node
> moved up.

Ah, sorry, I had missed this change. I'll update my branch too.

  Tomi

