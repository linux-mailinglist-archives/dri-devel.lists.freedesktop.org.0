Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E6E2C6AA0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 18:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9852E6EE7A;
	Fri, 27 Nov 2020 17:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AB06EE7A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 17:30:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ARHUerL102484;
 Fri, 27 Nov 2020 11:30:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606498240;
 bh=TMc+/KMubRagvKXylVncMloff3Zi2x+utydRkFRJCGw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=aHxVOMA/37Ki2ukOpie+yhg0Ik3ZkrFQPJXmB/Mh23TVw4eXPv38I8NqFDra6HYwX
 GrwRYt83RupJQaIGymg+SS3Vg8Bg837MCb8cPIcXhCCReDIdtQaGp0guh/36mTigVP
 lXErxGmGGZ0DNWZ2SmjTG6Wjk4Rd1eosRfptOoBM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ARHUe3v021696
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Nov 2020 11:30:40 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 27
 Nov 2020 11:30:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 27 Nov 2020 11:30:40 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ARHUcWo100496;
 Fri, 27 Nov 2020 11:30:38 -0600
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
 <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
 <8010e452-745a-ac12-bc02-5537305c70ed@gmail.com>
 <4948a40d-c887-5617-f5bc-1e0aff824ad7@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a86e0ef4-0b90-5aec-9632-e78fa4ca6d58@ti.com>
Date: Fri, 27 Nov 2020 19:30:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4948a40d-c887-5617-f5bc-1e0aff824ad7@gmail.com>
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/11/2020 17:37, Ivaylo Dimitrov wrote:

> With 5.9.11 and the patch on top, n900 boots fine, albeit display remains blank, could be related to
> brightness, we're still investigating.

Ok. A DSS regdump for a working version and the latest one would be good too. There's a omapdss
debugfs dir, with dss, dispc and clk files which are of interest here.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
