Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE463B3B9BC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE68C10EB80;
	Fri, 29 Aug 2025 11:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="egr6eXJ5";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hObBYkJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6699310EB80
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 11:10:48 +0000 (UTC)
X-UUID: ce858bc284c811f0b33aeb1e7f16c2b6-20250829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=n7UJetyqLWztSR6VmVO9VQ5iegyEjfl3r2qHStruMaE=; 
 b=egr6eXJ5o4ZuXvhzb4gHb902ATL+Qi8xNq8lwode81p6BqX6QFZXFv3NPizurf61IE/i8vJpatui0YUyNw8IUx7iby+Rr2nEz2bUoY7HS6mtYsg+gODVhTvTSxdHv3XZ/39IMhy3WMBl25Y0GoRG5GWI/PPn7ztfDx+MRw8imtw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:8218ad66-cf7a-416b-8f96-21f1c82205a7, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:721aff6b-8443-424b-b119-dc42e68239b0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ce858bc284c811f0b33aeb1e7f16c2b6-20250829
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2016553074; Fri, 29 Aug 2025 19:10:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 29 Aug 2025 19:10:42 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 29 Aug 2025 19:10:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orMr4HbHtpsFsyUTWAIqLbLjdbTD9n4ZAkLccvQ5XDN3wSws3NOPEbo8na22cuQU+sDtxerakO0cAbSopHJLJ+gGB7TTN8b/Gfn9L6UXZmgMqVcQeXudrp5sbSSRKIUGJRugr14uP7uB2nDXY5gl7VJYbvgztEOml335WNrEDKzCgFPyGd96VfMY3PIT33+IMzsDEu7QvgMw6Pk+iSenLXgsrvxEIzCJa7mSDLcps+ABu89DDX++VYYV9wWqCm0viixsc63o1pWIlVXDBNyubFyAhvWvziGon2dfvNRdpaJGwcFyZBslS6seR5os72p/3YzCOVxQK+UOVroVF3NohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiM3iZEUTVslvUJQ/mcFwkNxBJNpsJ0Tfffamz5QY7U=;
 b=Bz8YYBDJhel91WQUXosXBFa9QGwRPdyQ5aWpzMVGx7IzsMVkeejsj0z/wAdgBSIX22vqKvYSFoDSpejb0pOGI4c6djsJt2I+eri1RES2W6Z7hiU3q/P10OatKAjhd5XAte75dNRtCoHYHIIlhm1vnIGOC4No5d8zfWCSI6tRcKLtP8QWuPh89OMzHv3kbE9gLPp+5TRyTbDZUlgxOBTbI3AnT9Xl5pBwxXe0OzAUhU8zpFeeUIbzkChcVkdu3yH3tEvhglKkWJ/8IhcizLOwEzftn67J+iirolFrMFnQDr+/I0AC52XKWyqRw7tGX0duYpd0paWPl/Q3D0eIvDCdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiM3iZEUTVslvUJQ/mcFwkNxBJNpsJ0Tfffamz5QY7U=;
 b=hObBYkJWQkfD01r6/mTGStqXDVlK4uA1VF4f7uQmM2/Z/O5/NmCwx9kUiOQvh6fahXiUR42ES+A2VInJUlkfDhGeOp5eDZQZBl4crmc3Pd7HIyiePcwVLFLv2DT6dwIMbJ+XXey/cpUt/o1xs8yP/WHlvlhoFgF7DPh0G93q4uM=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 JH0PR03MB7905.apcprd03.prod.outlook.com (2603:1096:990:2e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.19; Fri, 29 Aug 2025 11:10:39 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%6]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 11:10:39 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?=
 <Sunny.Shen@mediatek.com>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
 <Sirius.Wang@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Topic: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA yaml
 for MT8196
Thread-Index: AQHcF/M2pVyHeJ+qWEyw1vmq6kK48bR5LkuAgAADtgCAAEkxAA==
Date: Fri, 29 Aug 2025 11:10:39 +0000
Message-ID: <ef990ad24a95309250054cf40d06ceb2dabb27c1.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
 <20250829-solemn-herring-of-conversion-ec5b1a@kuoka>
 <20250829-industrious-economic-jacamar-ce264d@kuoka>
In-Reply-To: <20250829-industrious-economic-jacamar-ce264d@kuoka>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|JH0PR03MB7905:EE_
x-ms-office365-filtering-correlation-id: f8aa4a9a-fdb9-4c0c-db23-08dde6ecb016
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?THpGZzloV1NTcG9nRmFWNERzZVIxUmZlQWlrazJmRlRsRTJ4RDZDTmE5em9U?=
 =?utf-8?B?dUs1bmUrRmZINVR5V1FmRDJnRlplQThEazFFRlRYR0xvRHZNSmowYmsvS1JM?=
 =?utf-8?B?bWxaL3dFNlkyc254MmJQa2ViN1FGTDJmejZ4NVRpd2IwaUhLR1d1Y2g1dzBt?=
 =?utf-8?B?NUkvMVJXbnRuUndOMlhsaHUyS2IyVUNtT2IvdGI4VVhHR0w4aXo2RjBVbjVj?=
 =?utf-8?B?blVNK1IzbXNsWGo0ZzhkcWppVy9qb3QxWUoraWdsS2JSNDdZYkV4L3llYmk2?=
 =?utf-8?B?bkpnNHowU1pWdjJaVS9MUlBZak8zRmkyaTF5MVFSOWowNi9SaCtJRzRKbkd6?=
 =?utf-8?B?bVlGb2hMMHB5UmJmTnRpUUQrakVjdHpDYVJLN1lHRzYxdUt1VUlGdTBkcHY3?=
 =?utf-8?B?KzdtcS9ENUlnM2QzK0dVNjg0UDZnZkpjbHMwQmJ0ZWY4Qy9SU3JUL3RCSVZU?=
 =?utf-8?B?NnIwWXNDNkFnQndYbWxSV2NWaWVDeWI4UGRVV1BOS3hXSGljRlZzL3hvTm43?=
 =?utf-8?B?WVJuVnFIWFVKRVNVSmNGWklEay9sdS92b2pFSkp3MmFrcGRtbitiNHF6Zis5?=
 =?utf-8?B?bWt5WGQzSWtqakc5R1FCUDNtNlpvTnhoYnU0Tkl5d2RYcVNoYmNKbTBHV3JO?=
 =?utf-8?B?MFFLdDIvNytOVDgrTENLeDZ0UFowcEI0OXlWNjF2Mld4Tk1rUE5iY3lid3Bk?=
 =?utf-8?B?eGpjTE5Td0dUMGNqdjFFb09MQUlHL1lQL25XU3M4SmRubllacEJGNWtLWGQ2?=
 =?utf-8?B?RkNweVdvSi9jOU92eWY1VFB4dHJjNjVobnVFbmR0OHlvbEYyL1lKZExEaVJw?=
 =?utf-8?B?THcvaDBxVFhwQTBoQWNVYVIyQUJ1UzJKRm5lYkphN3ZhTDdSM3N3aWpjc2hB?=
 =?utf-8?B?MHRNUkhJNkxYVXJSeUpLdmhsZzBMTGZvc01FOXByWjI1UDBJTFZNS1BSN05K?=
 =?utf-8?B?ajhRU1NySkZ1MGNWYTdVNGxpRHFTZUNSclNPZThXdkZJbTVBVlVsM0pXUFpr?=
 =?utf-8?B?NG0vNzlETWtPZXZFZjFEY1I4VWZ5MElsMHhUbnRVd2dZVUlWMWlCeXpYdkN5?=
 =?utf-8?B?RGVhTlVwRzZTeGJCaSt5ZTMyVWxGRVlTSFlLZVhuYm5HMXlhSUlCQ2FxSHpk?=
 =?utf-8?B?Mk9odUVQODJLbzNtNis0M3ZUWlZNK25YbXJneVRNS094b2dDNm5IU3RDR1FX?=
 =?utf-8?B?V0M3azNnaldGeVJSdVZhQTFFektDZ0xhVmVnV3hvclRFcjFWcXYyYTZSS0Nx?=
 =?utf-8?B?M1plRGxxeXdXcVAxclhQUVBDNGt1UWp5TUhMSEZXNy9xeTBSVW5KNUx5a2pW?=
 =?utf-8?B?TkM2YTY3S1Y3NjFLNXdCcEFDcXNNVWVScnNWREVZSDZ2VEZrQ3BwcEFIQ3Nk?=
 =?utf-8?B?RFFWem11NmxzcGpwc0VrRHd6dHBYRklEV1Y3d2pJZnFvSm1ITS9Jd0E3TC9C?=
 =?utf-8?B?alQxZWhCeVZya3JhU1U0YnhnZ0VoVDA4ekNwa2p0ZjJHc2krbmtXNVhUSS9F?=
 =?utf-8?B?cVc1SEEwYjZzaStzY2NSbE13Q0Q4UnBvd2N4NG8xcEpXRjNxUndRRWhnRm5G?=
 =?utf-8?B?bEg4T1lEZHJydWNnT293QVd2ZG1vayt2N1VOSG5JQnVYcWlQdXVkZWl3REJM?=
 =?utf-8?B?MXFtU0hlNDUyU2I0cjRsa0FocmJuUFlYUXZlSGc2SndWMVcwTDZaNmF5VFJz?=
 =?utf-8?B?aHZXVklCbmhiNXl3cmVOamlRS2NxbVIwNWR5RXhyam1YSXIyRnE0WldNS21n?=
 =?utf-8?B?M1M1aHVGRDB0ZG5vV1RMMmcvLzNSWHYwd0VMMFRjeTVHcWNsY0U4S0JCYi8r?=
 =?utf-8?B?QjI5Z3dadHdmMWpkZGhWak5lOVJ3QVBQVTdUV0xabXVFL3BCNlAzZzJKTkNY?=
 =?utf-8?B?VnpCN3RjQlVPRFhlQTZHVHU2dUQ4aWNzTXpRNkJBYU8rQXc0bW9EeUhtUHNk?=
 =?utf-8?B?VHEvU01EdTVaSWJoUFB3UDV3QkpaUWhIOFJzV29Udm9lVEZERkp2TzFCZCtN?=
 =?utf-8?B?NEorcXhsVHlRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjNBNDlyTHJRZ1J4UDhNTk42SzE4ZjB1SUVVais5cnlXVXhBdWlKOWRLOGty?=
 =?utf-8?B?ZFFNcy82K1p6WDhtbEdUK0hodGs0YktLdmlxSnA3ZTZWK0xUQ1RnSXo1ckNM?=
 =?utf-8?B?QnhEdnNaQk4vQlhBUEk5S0ZacS9QenE3WGRObjc3YVF6SmFBUXZsU2haS0Ex?=
 =?utf-8?B?Qm9reS93K21pa0hjdWxIb0tRaTErczZ3d1FNbjkyS0V6YWVkSnpwbXdjek9o?=
 =?utf-8?B?Tzl6QnFRNzVzVy8yRHROVHdqeTlSTEkzeUdoRW1NVVdFOE9oZ3plN3F4QTVD?=
 =?utf-8?B?N0F1UkpsZXFYbkFNQ3dGeHk4R3VRTUpRZmpTNjhiamlPbGR5ZzJRT1dSbWtW?=
 =?utf-8?B?WGtDZEdNY3ZQbVlNK1VPZDBYbm5zRmpjVUowWXJDQW5NM0RmMyt3N2tiK3RI?=
 =?utf-8?B?MjVickJGRzNleU5QL0RMZ2ZXU1RiOHV0ajBndmltNEc2dElONzJWQ1Z3ZnJ1?=
 =?utf-8?B?bTJ1aU9FSE5SQXdTM0FsbW0xNWdnaDJVK3hkMXdQWmFoR0R1Y1JqbWVGMjZm?=
 =?utf-8?B?dVlmR2xUZDJVMlh5TkNINWl5MEhsZGdwK3hJSjNkSDVhcklLL2pKdzFtbHhL?=
 =?utf-8?B?K3RxOWN3T2NoRFJSbmd4UVcrSHdsK0hNZWI3Tk9xbnVzY2MyZk9BS0pBWWQr?=
 =?utf-8?B?TklvUHlqcTJqOUE1di9lWUZEdEtDMjI5WVc5cDZGdFcxQmtrd2t3aUJjMjd4?=
 =?utf-8?B?Q0l1MkphRlhJNkN6anVYR2hGejhqVldwWHJsY1R2UklsbE9lVVlKemw1NjU4?=
 =?utf-8?B?WjBuOTJ3a2J4L2YzUTRCUm1qS1BkWkhpcWR6Z1RWVnBjRno0WUsrTjhPTXcv?=
 =?utf-8?B?TnAyQUFLSFV0NGdNMmY3RklqQUlYYUZaV0RlZ2IydUFxdytzcTZBZTU0VmJU?=
 =?utf-8?B?QXNyS2lKZ1grb0xzdHcwM2xkN1BpOVJMRHJVREtadjE1N0VUdmFiR1p0VXRa?=
 =?utf-8?B?Tm01dnFRZXk3V3pjUXFwNHl0bHFETmdsamw1dFFyT05DSHBrOXE0M08vTmFj?=
 =?utf-8?B?Nk40ZHJMZ1JvYmhJSk5jMk1KdjFZYXptZzJqTENWekFrbk9lSE1GL2hDYVBy?=
 =?utf-8?B?VWlDTi95c2hHSE42WjVUZVJTY2dwNnJaNk1kbnREZDJneDl6NTJ5QzRIRWo5?=
 =?utf-8?B?U0VlOXFsZS9CSTU4QTZMb2JnRVdpUG5nbS9MMnBSOVQ1WDBVQjZNclhZK1Fl?=
 =?utf-8?B?SEcvdjFJSThoRzh6eFpsK09BWjQ0Wks4amxLYlVkQVdaLy94QUF5eDRxM1Vy?=
 =?utf-8?B?ckMzYmdrNEErOWlrUjFWV3JVSEpTL0l4b0UvdHExS3N5Q2ZBb0hURlNLczFl?=
 =?utf-8?B?aEZTR0xlQ1hFd1IwSDBZdit1bEplQUtGSUxKb3NEVEZYeTRnelYrTUoxSXJt?=
 =?utf-8?B?ZHd0R1NFbHF2WFRHMHZiWVNGUTA2bWNVaDVkVGFUTlJPT0FaQWd6MTdqbXYw?=
 =?utf-8?B?YmV1ck40Z3NJVTI5Yldid29QK1pXU1BIWDlEUzRmLzdXSGgzOWd6cFJPMFh0?=
 =?utf-8?B?elR2NndRbjJJZFRKbmt6c0k3VG1BeUFuQll4VnIzOElsTUxpVG1CdHZ2VHEw?=
 =?utf-8?B?RlZRV01yRU5qNCsyOHc5QVhsazc3Skx4anBVdjhBUTlYblYwQ1lmVVphN3NE?=
 =?utf-8?B?b0E4NXdJd1V6RUp4ejdqaWRkWHZGTDRUdnRrM3ozSUNoelFLaERpa3puamg0?=
 =?utf-8?B?NVhMeU1FaGxWd1oyUzZEUUo2c3hPelNzWXNQTzFEYVR4dEtZeDlNb01Zay9C?=
 =?utf-8?B?aE5NdiswREtMMFg3eTBBTGQzOEJEWitMU09HNGQ3Tlh6OWhSajB5MlFsOGds?=
 =?utf-8?B?K0RxN3pSZmdHVXl2cCtLOCtQak1rRjBUVUhDQWlvWkpndEVRRVlMbis1cjdY?=
 =?utf-8?B?T2N4YnI5UWc2VGhlWHA5MXFZU2pBUlNhdkVpZG5OWnp4MGFIU2kveXRIcEN0?=
 =?utf-8?B?UHZWSi81VlNncmtwSUlabW1Vc2lMWE9WOUlPMzE5WXBDSnFLQkE2d2IyUGhu?=
 =?utf-8?B?OEJEaXB6WWZGMjU4WWQzYnZqajIvYnpKTjNudHJZb0U4a3ZsTWdLTjMxbnFH?=
 =?utf-8?B?MXpQeGhsS2hPSXZiYk4yeWxBSi9UbDFVYmtrdWdZRUh0R21PeGNGTkMrMlJu?=
 =?utf-8?B?WDJHcXJSWlZ6cjR2K2NqOTNjNzZJQVIxSTdxN0ROZnhXUElTM1dFaTNxUGo3?=
 =?utf-8?B?V0E9PQ==?=
Content-ID: <E11BAFE1A333B441947E42F414A37E76@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa4a9a-fdb9-4c0c-db23-08dde6ecb016
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 11:10:39.7356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nJ24Uvqc3J+ns+j/JMudhMJEgqPkNeCLtM+zZsQtXTwyoEkr9vKgQPwOii4eWgyteO3XcO8EA371dD2bqcgopL7iClNZCrhAYXIF6NRe2kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7905
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_688347659.1159079742"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_688347659.1159079742
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA4LTI5IGF0IDA4OjQ4ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiBGcmksIEF1ZyAyOSwgMjAyNSBhdCAwODozNToy
M0FNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+IE9uIFRodSwgQXVnIDI4
LCAyMDI1IGF0IDA0OjA2OjU4UE0gKzA4MDAsIFBhdWwgQ2hlbiB3cm90ZToNCj4gPiA+IEZyb206
IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiA+IA0KPiA+ID4g
QWRkIG1lZGlhdGVrLGV4ZG1hLnlhbWwgdG8gc3VwcG9ydCBFWERNQSBmb3IgTVQ4MTk2Lg0KPiA+
ID4gVGhlIE1lZGlhVGVrIGRpc3BsYXkgb3ZlcmxhcCBleHRlbmRlZCBETUEgZW5naW5lLCBuYW1l
bHkNCj4gPiA+IE9WTF9FWERNQSBvciBFWERNQSwgcHJpbWFyaWx5IGZ1bmN0aW9ucyBhcyBhIERN
QSBlbmdpbmUNCj4gPiA+IGZvciByZWFkaW5nIGRhdGEgZnJvbSBEUkFNIHdpdGggdmFyaW91cyBE
UkFNIGZvb3RwcmludHMNCj4gPiA+IGFuZCBkYXRhIGZvcm1hdHMuDQo+ID4gPiANCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4g
PiA+IC0tLQ0KPiA+ID4gwqAuLi4vYmluZGluZ3MvZG1hL21lZGlhdGVrLGV4ZG1hLnlhbWzCoMKg
wqDCoMKgwqDCoMKgwqAgfCA2OA0KPiA+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+IA0KPiA+
IA0KPiA+IFlvdXIgY2hhbmdlbG9nIHNheXMgTk9USElORyBjaGFuZ2VkIGhlcmUgYW5kIHRoaXMg
ZmFpbHMgdGVzdHMsIHNvDQo+ID4gZG9lcyBpdA0KPiA+IG1lYW4geW91IHJlY2VpdmVkIHRoYXQg
d2FybmluZ3MgYmVmb3JlIGJ1dCB5b3Uga2VlcCBzZW5kaW5nIHNhbWUNCj4gPiBicm9rZW4NCj4g
PiBjb2RlPw0KPiA+IA0KPiA+IExhc3QgdHdvIHdlZWtzIG9mIGNvbnRyaWJ1dGlvbnMgZnJvbSBt
ZWRpYXRlayBhcmUgYWJzb2x1dGVseQ0KPiA+IHRlcnJpYmxlLg0KPiA+IFZlcnkgcG9vciBjb2Rl
LCBiYXNpYyBpbi1ob3VzZSByZXZpZXdzIG5vdCBkb25lLCBiYXNpYyB0ZXN0aW5nIG5vdA0KPiA+
IGRvbmUuDQo+ID4gDQo+ID4gSSB0YWxrZWQgYWJvdXQgdGhpcyBhdCBPU1NFIDI1IHdpdGggc29t
ZSBmcmllbmRzIGFuZCBnb3QgcmVhc29ucw0KPiA+IHdoeQ0KPiA+IHlvdXIgc2V0dXAgaXMgYnJv
a2VuLiBXZWxsLCBpdCdzIG9uIHlvdS4NCj4gPiANCj4gPiBJIHdhcyBhbHJlYWR5IHJhaXNpbmcg
dGhpcyB3aXRoIE1lZGlhdGVrLCBidXQgd2UgYXJlIG5vdyBiYWNrIHRvDQo+ID4gc3F1YXJlDQo+
ID4gb25lLg0KPiA+IA0KPiA+IE5BSywgYmVjYXVzZSB0aGlzIHBhdGNoIFdBUyBORVZFUiB0ZXN0
ZWQuDQo+IA0KPiANCj4gQW5kIG5vdyBJIGZvdW5kIHlvdSBnb3QgRVhBQ1RMWSB0aGUgc2FtZSBl
cnJvciBhdCB2Mywgc28geW91IGp1c3QNCj4gbmV2ZXINCj4gdGVzdGVkIGFuZCBpZ25vcmVkIE9V
UiB0ZXN0IHJlcG9ydHMuDQo+IA0KPiBUaGlzIGlzIHVuZm9ydHVuYXRlbHkgYW4gZXhhbXBsZSBo
b3cgeW91IHdhc3RlIHJldmlld2VycycgdGltZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6
eXN6dG9mDQo+IA0KDQpIaSBLcnp5c3p0b2YsDQogDQpJIGFwb2xvZ2l6ZSBmb3IgcmVzdWJtaXR0
aW5nIGFuIGluc3VmZmljaWVudGx5IHRlc3RlZCBwYXRjaCBhbmQgd2FzdGluZw0KcmV2aWV3ZXJz
4oCZIHRpbWUuIFRoZSByZXBlYXRlZCBmYWlsdXJlIGFuZCB0aGUgaW5hZGVxdWF0ZSBjaGFuZ2Vs
b2cgYXJlDQplbnRpcmVseSBteSByZXNwb25zaWJpbGl0eeKAlG5vIGV4Y3VzZXMuIEnigJltIHdp
dGhkcmF3aW5nIHRoaXMgcmV2aXNpb24NCmFuZCB3aWxsIG9ubHkgcmVzZW5kIGFmdGVyIEnigJl2
ZSByZXByb2R1Y2VkIGFuZCBmaXhlZCB0aGUgZmFpbHVyZXMsDQp2YWxpZGF0ZWQgd2l0aCBjb21w
cmVoZW5zaXZlIHRlc3RzLCBjb21wbGV0ZWQgaW50ZXJuYWwgcmV2aWV3LCBhbmQNCmluY2x1ZGVk
IGEgY2xlYXIg4oCcQ2hhbmdlcyBzaW5jZSB2Ti7igJ0NCiANClRoYW5rIHlvdSBmb3IgdGhlIGRp
cmVjdCBmZWVkYmFja+KAlEkgd2lsbCBkbyBiZXR0ZXIuDQogDQpCZXN0IHJlZ2FyZHMsIFBhdWwN
Cg0K

--__=_Part_Boundary_001_688347659.1159079742
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDgtMjkmIzMyO2F0
JiMzMjswODo0OCYjMzI7KzAyMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZp
ZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtGcmksJiMzMjtBdWcmIzMyOzI5LCYjMzI7
MjAyNSYjMzI7YXQmIzMyOzA4OjM1OjIzQU0mIzMyOyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtL
b3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO1RodSwmIzMyO0F1
ZyYjMzI7MjgsJiMzMjsyMDI1JiMzMjthdCYjMzI7MDQ6MDY6NThQTSYjMzI7KzA4MDAsJiMzMjtQ
YXVsJiMzMjtDaGVuJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0Zyb206
JiMzMjtQYXVsLXBsJiMzMjtDaGVuJiMzMjsmbHQ7cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbSZn
dDsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7QWRkJiMzMjttZWRpYXRlayxleGRtYS55YW1sJiMzMjt0byYjMzI7c3VwcG9ydCYjMzI7RVhE
TUEmIzMyO2ZvciYjMzI7TVQ4MTk2Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7VGhlJiMz
MjtNZWRpYVRlayYjMzI7ZGlzcGxheSYjMzI7b3ZlcmxhcCYjMzI7ZXh0ZW5kZWQmIzMyO0RNQSYj
MzI7ZW5naW5lLCYjMzI7bmFtZWx5DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtPVkxfRVhE
TUEmIzMyO29yJiMzMjtFWERNQSwmIzMyO3ByaW1hcmlseSYjMzI7ZnVuY3Rpb25zJiMzMjthcyYj
MzI7YSYjMzI7RE1BJiMzMjtlbmdpbmUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2ZvciYj
MzI7cmVhZGluZyYjMzI7ZGF0YSYjMzI7ZnJvbSYjMzI7RFJBTSYjMzI7d2l0aCYjMzI7dmFyaW91
cyYjMzI7RFJBTSYjMzI7Zm9vdHByaW50cw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7YW5k
JiMzMjtkYXRhJiMzMjtmb3JtYXRzLg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7UGF1bC1wbCYjMzI7Q2hl
biYjMzI7Jmx0O3BhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMTYwOy4uLi9iaW5k
aW5ncy9kbWEvbWVkaWF0ZWssZXhkbWEueWFtbCYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7fCYjMzI7NjgNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOysrKysrKysrKysrKysrKysrKysNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtZb3VyJiMzMjtjaGFuZ2Vsb2cmIzMyO3Nh
eXMmIzMyO05PVEhJTkcmIzMyO2NoYW5nZWQmIzMyO2hlcmUmIzMyO2FuZCYjMzI7dGhpcyYjMzI7
ZmFpbHMmIzMyO3Rlc3RzLCYjMzI7c28NCiZndDsmIzMyOyZndDsmIzMyO2RvZXMmIzMyO2l0DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjttZWFuJiMzMjt5b3UmIzMyO3JlY2VpdmVkJiMzMjt0aGF0JiMzMjt3
YXJuaW5ncyYjMzI7YmVmb3JlJiMzMjtidXQmIzMyO3lvdSYjMzI7a2VlcCYjMzI7c2VuZGluZyYj
MzI7c2FtZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YnJva2VuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjb2Rl
JiM2MzsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7TGFzdCYjMzI7dHdv
JiMzMjt3ZWVrcyYjMzI7b2YmIzMyO2NvbnRyaWJ1dGlvbnMmIzMyO2Zyb20mIzMyO21lZGlhdGVr
JiMzMjthcmUmIzMyO2Fic29sdXRlbHkNCiZndDsmIzMyOyZndDsmIzMyO3RlcnJpYmxlLg0KJmd0
OyYjMzI7Jmd0OyYjMzI7VmVyeSYjMzI7cG9vciYjMzI7Y29kZSwmIzMyO2Jhc2ljJiMzMjtpbi1o
b3VzZSYjMzI7cmV2aWV3cyYjMzI7bm90JiMzMjtkb25lLCYjMzI7YmFzaWMmIzMyO3Rlc3Rpbmcm
IzMyO25vdA0KJmd0OyYjMzI7Jmd0OyYjMzI7ZG9uZS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7SSYjMzI7dGFsa2VkJiMzMjthYm91dCYjMzI7dGhpcyYjMzI7YXQmIzMy
O09TU0UmIzMyOzI1JiMzMjt3aXRoJiMzMjtzb21lJiMzMjtmcmllbmRzJiMzMjthbmQmIzMyO2dv
dCYjMzI7cmVhc29ucw0KJmd0OyYjMzI7Jmd0OyYjMzI7d2h5DQomZ3Q7JiMzMjsmZ3Q7JiMzMjt5
b3VyJiMzMjtzZXR1cCYjMzI7aXMmIzMyO2Jyb2tlbi4mIzMyO1dlbGwsJiMzMjtpdCYjMzk7cyYj
MzI7b24mIzMyO3lvdS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SSYj
MzI7d2FzJiMzMjthbHJlYWR5JiMzMjtyYWlzaW5nJiMzMjt0aGlzJiMzMjt3aXRoJiMzMjtNZWRp
YXRlaywmIzMyO2J1dCYjMzI7d2UmIzMyO2FyZSYjMzI7bm93JiMzMjtiYWNrJiMzMjt0bw0KJmd0
OyYjMzI7Jmd0OyYjMzI7c3F1YXJlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtvbmUuDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO05BSywmIzMyO2JlY2F1c2UmIzMyO3RoaXMmIzMy
O3BhdGNoJiMzMjtXQVMmIzMyO05FVkVSJiMzMjt0ZXN0ZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7QW5kJiMzMjtub3cmIzMyO0kmIzMyO2ZvdW5kJiMzMjt5b3UmIzMyO2dvdCYj
MzI7RVhBQ1RMWSYjMzI7dGhlJiMzMjtzYW1lJiMzMjtlcnJvciYjMzI7YXQmIzMyO3YzLCYjMzI7
c28mIzMyO3lvdSYjMzI7anVzdA0KJmd0OyYjMzI7bmV2ZXINCiZndDsmIzMyO3Rlc3RlZCYjMzI7
YW5kJiMzMjtpZ25vcmVkJiMzMjtPVVImIzMyO3Rlc3QmIzMyO3JlcG9ydHMuDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO1RoaXMmIzMyO2lzJiMzMjt1bmZvcnR1bmF0ZWx5JiMzMjthbiYjMzI7ZXhhbXBs
ZSYjMzI7aG93JiMzMjt5b3UmIzMyO3dhc3RlJiMzMjtyZXZpZXdlcnMmIzM5OyYjMzI7dGltZS4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRv
Zg0KJmd0OyYjMzI7DQoNCkhpJiMzMjtLcnp5c3p0b2YsDQomIzMyOw0KSSYjMzI7YXBvbG9naXpl
JiMzMjtmb3ImIzMyO3Jlc3VibWl0dGluZyYjMzI7YW4mIzMyO2luc3VmZmljaWVudGx5JiMzMjt0
ZXN0ZWQmIzMyO3BhdGNoJiMzMjthbmQmIzMyO3dhc3RpbmcNCnJldmlld2VycyYjODIxNzsmIzMy
O3RpbWUuJiMzMjtUaGUmIzMyO3JlcGVhdGVkJiMzMjtmYWlsdXJlJiMzMjthbmQmIzMyO3RoZSYj
MzI7aW5hZGVxdWF0ZSYjMzI7Y2hhbmdlbG9nJiMzMjthcmUNCmVudGlyZWx5JiMzMjtteSYjMzI7
cmVzcG9uc2liaWxpdHkmIzgyMTI7bm8mIzMyO2V4Y3VzZXMuJiMzMjtJJiM4MjE3O20mIzMyO3dp
dGhkcmF3aW5nJiMzMjt0aGlzJiMzMjtyZXZpc2lvbg0KYW5kJiMzMjt3aWxsJiMzMjtvbmx5JiMz
MjtyZXNlbmQmIzMyO2FmdGVyJiMzMjtJJiM4MjE3O3ZlJiMzMjtyZXByb2R1Y2VkJiMzMjthbmQm
IzMyO2ZpeGVkJiMzMjt0aGUmIzMyO2ZhaWx1cmVzLA0KdmFsaWRhdGVkJiMzMjt3aXRoJiMzMjtj
b21wcmVoZW5zaXZlJiMzMjt0ZXN0cywmIzMyO2NvbXBsZXRlZCYjMzI7aW50ZXJuYWwmIzMyO3Jl
dmlldywmIzMyO2FuZA0KaW5jbHVkZWQmIzMyO2EmIzMyO2NsZWFyJiMzMjsmIzgyMjA7Q2hhbmdl
cyYjMzI7c2luY2UmIzMyO3ZOLiYjODIyMTsNCiYjMzI7DQpUaGFuayYjMzI7eW91JiMzMjtmb3Im
IzMyO3RoZSYjMzI7ZGlyZWN0JiMzMjtmZWVkYmFjayYjODIxMjtJJiMzMjt3aWxsJiMzMjtkbyYj
MzI7YmV0dGVyLg0KJiMzMjsNCkJlc3QmIzMyO3JlZ2FyZHMsJiMzMjtQYXVsDQoNCg0KPC9wcmU+
DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioq
KioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioq
KioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGlu
Y2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRh
cnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRl
ciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0
byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0K
ZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQo
cykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBh
cmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0K
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_688347659.1159079742--

