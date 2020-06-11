Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6AA1F829F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244F56E3FB;
	Sat, 13 Jun 2020 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1B66E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 12:46:26 +0000 (UTC)
IronPort-SDR: GoEYkYcZooYvt5WHfB887+11Y0eKjpCydIa/rCkRxiPmj14qG9pvbg460jX9vewgBZlVC37/VC
 rz4/VYiDr1xXiOwsaMhkq5HPHQH/P/O9nvZ6Sm3oMIbiAd/r3nHu0NEyKacFI39f7E3lPyj/kk
 3JBcqxdKqFMN1DkLhHYUlYZBfLtMow00EYgKC7SJjYlbMxRyh5BLnAzvIwavbS8nAHWbizuTVh
 0Hy5b1j1MESFs03LRxjhOWCst7PuY0R+metAyAQWawO6sjE72ysLLvfu8IxhQTqCQUdxQe+/Li
 FXc=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649695"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 11 Jun 2020 14:46:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 11 Jun 2020 14:46:25 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 11 Jun 2020 14:46:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591879585; x=1623415585;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WOtgFgMA4D6zHYZnqGioxM7e60B12PjytiO+UqR0o0c=;
 b=mRojurgQd0u21jE4CRNZo6ubrbSV1fYgoTAFAP1K9Z3iwTrFdPe6a3Iz
 JdLsIukm9tuwJfuDoGVkTTvoEueMIhnYr2Jfejv36I4KnRnlxUt5JjIvw
 2Ajoo1bMARXtBcfKP+wN8DFDnFnlT2oAcKoSMto5ilp+bzOyCQjtWBd5N
 2sT/3FFaCUZuX5smR8ndCITUXeEmxabEZud8EFcEGEqGUIUYq39SWM4wz
 uN4A5aRMADn4aF5AtItnKmHFeDo+40dk5rfNVyVGpDDsr2iobbI7G5pfU
 E1HUwrnwikmAbcS9P6ohhyQm2BYgoO+FJ82E3NsgdVE9jkQl0sjnKydrS g==;
IronPort-SDR: /kK5eJzHEjZQC5hKKsM9u7lH5ViFWA9o5oJT+Jstl6eJdiiV+yRuhHeZTQe/AVmNoLYp1dNcPz
 aiPSbO1ySGViJtGyLMowmvrBo6jBWPujX6/FpDM+X6FTA5xWyMo4/m7EekTa+YHfEY00+W9bzH
 7pin9VVGGMqVGPCNAEZZo5dCZ7lALr9egDpH8gBvq9u1cjPeECnsnNSFe84NhbKK0JaFLP0g5T
 pJ5S7X2Sr42otOa95CeuIFaJc2dXLy3sPu4cdtSUzfrydTRFh+EzKlwq9E9W9m+mtFI+GqrlN1
 VcU=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649694"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Jun 2020 14:46:25 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 5C781280065;
 Thu, 11 Jun 2020 14:46:26 +0200 (CEST)
Message-ID: <686342440e7e1be0b010820154d3ae3dbc9f7990.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: simple: add CDTech
 S070PWS19HP-FC21 and S070SWV29HG-DC44
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>,  David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Jun 2020 14:46:22 +0200
In-Reply-To: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
 <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-06-11 at 14:42 +0200, Matthias Schiffer wrote:
> Add the CDTech Electronics displays S070PWS19HP-FC21 (7.0" WSVGA) and
> S070SWV29HG-DC44 (7.0" WVGA) to the panel-simple compatible list.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: no changes

Oops, it seems I held my git send-email wrong, which caused patches v2
2-4 to bounce from some servers, should I resend?


> 
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4
> ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
> simple.yaml
> index 31e3efc73e00..2ddb520edc6d 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-
> simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-
> simple.yaml
> @@ -81,6 +81,10 @@ properties:
>        - boe,nv140fhmn49
>          # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-
> LCD panel
>        - cdtech,s043wq26h-ct7
> +        # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT
> LCD Panel
> +      - cdtech,s070pws19hp-fc21
> +        # CDTech(H.K.) Electronics Limited 7" WVGA (800x480) TFT LCD
> Panel
> +      - cdtech,s070swv29hg-dc44
>          # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD
> panel
>        - cdtech,s070wv95-ct16
>          # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
