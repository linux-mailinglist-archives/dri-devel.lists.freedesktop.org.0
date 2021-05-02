Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D505370F22
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 22:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C200C6E580;
	Sun,  2 May 2021 20:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9164A6E580
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 20:50:33 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.181.225])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dJ2rlzK2pDFOPdJ2slHWTD; Sun, 02 May 2021 22:50:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1619988631; bh=UmC8cYWqWPtxo1qJPZXiF+uYGkCGWSWN2TXTowI2gtA=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=W+Ftvsybk7YNALtW8he8l58l2dQZxxAr5Wv/wfy/ovhmMzcuAeUOEqH5O2Ge6lryl
 JqOmcMxxtnTyCTtgB3UocJBhwfWQKTHwL4KIxJaFl4ao5APVDtS8kra0KjbK42cecp
 oYuyGpOIhxxKEDkkI32HWpp8DgPiluX/FAyx2K16iLy8Go+nppBOD/JnToElFEq26t
 oJ31x885tmRbl/6ZEOOeXISTWQzB+XI6YwZo+iNaaz0JpM//nH+aQ5VlzwSmB7xyad
 o4HWJfT+nACCLry5Q7H6fKosOKvwsbiNulImLxN0WAhWxRzUaksl8QKYpjl/tX2U4t
 rdXD2u6U7Uc0Q==
Subject: Re: [PATCH v3 0/9] Add 4 Jenson simple panels
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <b5685187-15f8-14da-386f-507ae518d22b@benettiengineering.com>
Date: Sun, 2 May 2021 22:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfDmkwaDwQfqdqzrFwQ+mTdJP7fbwRWoGWZynIN/EozISlmaPt1edXmGyga4XoD5oAHpHm1qcNOqBi9uhHzyH2z94bbuAAjPL3V47hyvrRy/e7tbbU14n
 ETH1UBHJKWOLG6p0ZmySFHHAB1gXQSoqtQ5+npeY3Vg5S2ExlX2SCYncs/+W7CZ18bLAkPqmMyVH9gMe0sCVltA2/3+/2xv+kFx5xt+ARYiAOUIdmuvywIB4
 qcz0BvhI8JuAl3nlOZOz85D8IgQlESMtyYClABwECkyXYCSsIn1MTZrNqLtEipXlHgHoNCE+UeCwjsH5eiKIvIzWS7LKoKKLiq584Bd5b1IHONhBrvP4nGpS
 WbHD1awHYqTnQcevnefZ0pgP+D5fFzDAbTYHjGo0lUJFVgx05qQWtN1iWw8VFwPfEzSdtaND
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thierry,

I've seen that this patchset [1] in DRI Patchwork has been archived, but 
it's not been applied and all patches result as "New", so I've set them 
as un-archived. Hope it's correct.

[1]: https://patchwork.kernel.org/project/dri-devel/list/?series=459931
[2]: https://patchwork.kernel.org/project/dri-devel/list/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 4/2/21 1:17 AM, Giulio Benetti wrote:
> This patchset introduce Jenson vendor and add 4 of its panels to
> panel-simple driver.
> 
> ---
> V2-V3:
> * changed my SoB and authorship
> * added some forgotten acked-by
> * fixed alpha-numeric order on adding bindings
> ---
> 
> Giulio Benetti (9):
>    dt-bindings: Add Jenson Display vendor prefix
>    dt-bindings: display/panel: add Jenson JT60245-01
>    dt-bindings: display/panel: add Jenson JT60248-01
>    dt-bindings: display/panel: add Jenson JT60249-01
>    dt-bindings: display/panel: add Jenson JT60250-02
>    drm/panel: simple: add Jenson JT60245-01
>    drm/panel: simple: add Jenson JT60248-01
>    drm/panel: simple: add Jenson JT60249-01
>    drm/panel: simple: add Jenson JT60250-02
> 
>   .../bindings/display/panel/panel-simple.yaml  |   8 ++
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   drivers/gpu/drm/panel/panel-simple.c          | 108 ++++++++++++++++++
>   3 files changed, 118 insertions(+)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
