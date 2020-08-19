Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC124AFD6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB9C6E8F8;
	Thu, 20 Aug 2020 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23D06E29E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:04:54 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 3D74DDFA44;
 Wed, 19 Aug 2020 13:04:00 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cWLOxwqKPIt6; Wed, 19 Aug 2020 13:03:59 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id A93C3DFA74;
 Wed, 19 Aug 2020 13:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wl2dX1KjOX-V; Wed, 19 Aug 2020 13:03:59 +0000 (UTC)
Received: from localhost (unknown [77.240.177.143])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 7F439DFA44;
 Wed, 19 Aug 2020 13:03:59 +0000 (UTC)
Date: Wed, 19 Aug 2020 15:04:52 +0200
From: Lubomir Rintel <lkundrak@v3.sk>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 0/2] dt-bindings: display: himax,hx8837: Add Himax HX8837
 bindings
Message-ID: <20200819130452.GB152043@furthur.local>
References: <20200819102246.634039-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819102246.634039-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Re-sending the cover letter here, because I left the subject empty and
the archive didn't pick it up. Sorry.)

Hi,

please take a look at the patches chained to this messages and consider
applying them. They add support for the controller that drives the panel
on the OLPC XO laptops.

Compared to the previous version the bindings have been converted to
YAML and the driver itself has been rewritten without any fancy features
such as the self-refresh so that the bare minimum works before the rest
can be figured out. Detailed change logs are in individual patches.

Tested on an OLPC XO-1.75 laptop.

Thank you
Lubo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
