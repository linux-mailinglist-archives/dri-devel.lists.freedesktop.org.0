Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232192627DF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBB66E9DE;
	Wed,  9 Sep 2020 07:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Tue, 08 Sep 2020 08:35:19 UTC
Received: from mail.alarsen.net (mail.alarsen.net [144.76.18.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D446E580
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 08:35:19 +0000 (UTC)
Received: from oscar.alarsen.net (unknown
 [IPv6:2001:470:1f0b:246:b440:f8d3:1c0c:d20c])
 by joe.alarsen.net (Postfix) with ESMTPS id C72DC2B80B87;
 Tue,  8 Sep 2020 10:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alarsen.net; s=joe;
 t=1599553730; bh=vAMC3BpR+mvYVqZXlzgmRJWrQUKXzqY7hp9gqzLPC+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kMpihx1Mn0lZF+E26HcrGXm3wEl1wM3kQy9vMh0OgkdaWmym0/RAttcriMqnUNx+Q
 onTCxRAk4kQFdU4k5nSd+5wUEG3XWrGMOplq2HqO9QooG+jtDochhQkAddnZU6i3BM
 A7l1QtSqSgTV0VKpPpD0wi38Cf+6S8QGZy0DmSts=
Received: from oscar.localnet (localhost [IPv6:::1])
 by oscar.alarsen.net (Postfix) with ESMTP id 98F8327C02A7;
 Tue,  8 Sep 2020 10:28:50 +0200 (CEST)
From: Anders Larsen <al@alarsen.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top
 Display Optolelectronics vendor prefix
Date: Tue, 08 Sep 2020 10:28:50 +0200
Message-ID: <14178277.p4ol7qMFiq@alarsen.net>
In-Reply-To: <20200908075421.17344-2-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
 <20200908075421.17344-2-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 2020-09-08 09:54 Neil Armstrong wrote:
> Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
> from Shanghai.
> Web site of the company: http://www.shtdo.com/
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index a1e4356cf522..4e9dfb352c68 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1078,6 +1078,8 @@ patternProperties:
>      description: TPK U.S.A. LLC
>    "^tplink,.*":
>      description: TP-LINK Technologies Co., Ltd.
> +  "^tdo,.*":
> +    description: Shangai Top Display Optoelectronics Co., Ltd

Please keep the list sorted alphabetically as requested in line 25 of the file.

>    "^tpo,.*":
>      description: TPO
>    "^tq,.*":

Cheers
Anders


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
