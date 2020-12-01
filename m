Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB22CA189
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DAB89E69;
	Tue,  1 Dec 2020 11:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A802E89E69
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:37:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BbGV0069247;
 Tue, 1 Dec 2020 05:37:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606822636;
 bh=jEq7ysfM/MmVZ2xizqReURrPG2TOZjPsyQUB6CXL2CQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=t1FjgA+iMGxkySYKNOTQMqmYhT2Omol3aisv1vYqNs19ZWzuq5wLqrI0uZ4WrXfWs
 X3WiC1RTtR9F62mZzusBD3zYNRYieRMAJ8r5eL3bkDq6hT3GsH+oc9ZzHHRRWIjH1B
 qz9ZxFKd8WJKwVLI0VlpQ+8hSZW1DJ4vzcpnuhns=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1BbG8j089583
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 05:37:16 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 05:37:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 05:37:15 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BbDtP074868;
 Tue, 1 Dec 2020 05:37:14 -0600
Subject: Re: [PATCH v4 71/80] drm/omap: dsi: move structs & defines to dsi.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-72-tomi.valkeinen@ti.com>
 <20201201003112.GP25713@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <213843e4-3d14-7dc1-0250-8c9f254d02fb@ti.com>
Date: Tue, 1 Dec 2020 13:37:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201003112.GP25713@pendragon.ideasonboard.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2020 02:31, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:29PM +0200, Tomi Valkeinen wrote:
>> Move structs and defines to a private dsi.h header file to make dsi.c a
>> bit easier to navigate. Also move the (now) private structs and defines
>> from omapdss.h to dsi.h.
> 
> I usually tend to keep structures used by a single .c file in that file,
> but it's a matter of personal preference I suppose.

We already had dsi.h. After all the recent changes, it was now only used by dsi.c. So I could have
moved everything from there to dsi.c. But dsi.c was pretty crowded already, and I had trouble
navigating it, so I thought it's better to move structs and macros from dsi.c to dsi.h.

>> +struct dsi_reg { u16 module; u16 idx; };
> 
> How about using the common kernel coding style ?
> 
> struct dsi_reg {
> 	u16 module;
> 	u16 idx;
> };

Ok.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
