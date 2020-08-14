Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B64244564
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8804F6EB18;
	Fri, 14 Aug 2020 07:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70206EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 07:13:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07E7DdSD034276;
 Fri, 14 Aug 2020 02:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1597389219;
 bh=6HpcResJMgUsplZKJl9InYJFIkGZ0vKUjGDdIgYfgCs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=azmpoUWWOIKErTnQ7IQEMPyjuqShMOVh5rLf2IFmCQPUE4uF5C8Ki6IjMvGl6nKD6
 syJ7Jo7EnMyftV676QxAGcObgWgR6VBrJw2eWVZES6Tw5/IQa9IDVYiwtpaB3O4Qor
 aXvquofpqpRU5tqK0A9BqoCsPuZyQ3pspVF14m9A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07E7DdGw019060
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Aug 2020 02:13:39 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 14
 Aug 2020 02:13:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 14 Aug 2020 02:13:39 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07E7DZDS073565;
 Fri, 14 Aug 2020 02:13:36 -0500
Subject: Re: [PATCH v8 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Swapnil Jakhade
 <sjakhade@cadence.com>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
 <1596713672-8146-2-git-send-email-sjakhade@cadence.com>
 <20200811003638.GB13513@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <89942101-52c4-e1bb-3605-569b311da89f@ti.com>
Date: Fri, 14 Aug 2020 10:13:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811003638.GB13513@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08/2020 03:36, Laurent Pinchart wrote:

> I've got a chance to study the J721E datasheet, and it shows the DP
> bridge has 4 inputs, to support MST. Shouldn't this already be reflected
> in the DT bindings ? I think it should be as simple as having 4 input
> ports (port@0 to port@3) and one output port (port@4).

I think this is a good point, mhdp has 4 input streams.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
