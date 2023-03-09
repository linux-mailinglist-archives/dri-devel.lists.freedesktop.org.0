Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A06B205D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 10:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DDB10E7CD;
	Thu,  9 Mar 2023 09:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02olkn2017.outbound.protection.outlook.com [40.92.50.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97CF10E7CD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 09:42:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFkTDTNcjZXVJtURClVAmdnfCtDnFA9PgyOd/nlVmAji+/bLwnSBJ0bSLC1MqN44jAhhtUCWW8IJ1GNdM8yYXxd6qTl0LQ09VRM0jPpjsPkWNskUGcDE0wvXt0AJn+qTLJTi2DXbz8IIZSV4+icpM7dM1xXepgICFTH1+5CpRe9FQlNQUWT85KQ8OLX5GUeItU/h+iRzDFxZF2uaSVllQ04Q5IE+bogMCHRkP5ZBTuh139F6XuOoZTh9465GcuxlUWu1U3nxZ7NuiTj5fLzRwXWKSAApLdLQ6f1CWUSWUwmm6Kl/5wUG5uIQhNUK+LSLU4C1rHaKdo9RYsegmslYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTmX2QTIhBrZyAAG5x/hdo2YNcV90sf1mG24VvNlTrA=;
 b=dKd9EFFVxPUHckq2LopuUzFD7p1vJFP9EPGIZ02ikJMLSBRLxyScpJPgrGcY+oCDVieQsPMCJSAfoKMyw+YV1PEK1+iCcuxwnWI5iygT8mFE8clcWa9VOcSLmsKudGqIigfYH5sQuqpvMuwpFc2z/x0PiVzKVwiSPBmN1lZtqw6SNA6evu0q49RUNEDTVMO11hLI5ONfTkOGrdkYDTk7KkN4Xc4HBsSPzIV9s4Weh11YEv8LXGchgyf3Gid4WvmsP9Zgaj5Q0ABRX3hgHkDitBfLq6HBwXnzNkDXRfKFL7kWko7HmPSd1BwBxa6Or7lJZest2ZUv7sPtW3HkMGt1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTmX2QTIhBrZyAAG5x/hdo2YNcV90sf1mG24VvNlTrA=;
 b=kTxqSN49bdnYTQRRa84E7HY6o9astC2Xh0hGXljVabAEY1vfOAlBvHFF85SiIagZIpoCwR1GOrzGb54nbqMCO2w8G8nVfPD6eegPjFnHKE7EpBVwDM5o80whrVXeIu4dvIvC3TJAUWUlqIE/JH8fSBORwiOZrd/tl+3MfYYCHhj/Lvu2iuvyKiEZr3EAAr62IDdjRYjNslDxZH61f7g4/ppVBUjGVEA6xvnQEkvTndUUToOwRDaxwFMqRKp4ruJqlcAs1JUU4W+nSQ0+cmSVyLOIr4hLvJyZt2Idkv6oOukCCxJOhKco71UUcQZjHJKOM3QVu1Ay8XvjHE4rqQXFuw==
Received: from DB6P189MB0568.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:31::16) by
 AS8P189MB2093.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:521::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Thu, 9 Mar 2023 09:42:54 +0000
Received: from DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
 ([fe80::325a:fba5:af4e:4484]) by DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
 ([fe80::325a:fba5:af4e:4484%7]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 09:42:54 +0000
From: David Binderman <dcb314@hotmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of
 information.
Thread-Topic: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of
 information.
Thread-Index: AQHZUROWy83Z6Qqx6EKYMWjImUxUIK7xh4YAgACLKmKAAB2zgIAAA9x7
Date: Thu, 9 Mar 2023 09:42:54 +0000
Message-ID: <DB6P189MB0568832655843F63CCE9B63C9CB59@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
References: <DB6P189MB0568FCA97758B820EAC036989CB79@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
 <20230308232224.GG31765@pendragon.ideasonboard.com>
 <DB6P189MB056810B266B656706ECF7EAB9CB59@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
 <20230309092647.GM31765@pendragon.ideasonboard.com>
In-Reply-To: <20230309092647.GM31765@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [wWW5ElY6jxEpd8Dhy3J/QZlQVdIH+LUj]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P189MB0568:EE_|AS8P189MB2093:EE_
x-ms-office365-filtering-correlation-id: f506b46f-05a2-4427-1a1a-08db2082a889
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8EEcj/uUWO9aPsuGmm0UjZAwGcjWpzqulRf0shvPZWkdLAsf4/pPfdcP1NZzVUeNoixvgddSgTSnOGXtVmHeuPiqs1EETCQHsyME68QzSDefhegDhhIu+yMoWN00z5NO5+2nZa4uwEiPhTKYVHuPcAGEmU5aVmwbFKy7SesVcSgOMXruKPqO3JfYAUQFISfedltfuIj4ouSfZApylkIy5nwhRRIhbFBKFDKpWJRGJehicI67j+fvdmjWdzhQ1jiKdHpNDgy0Hi6iKF3x6fxHuKttRKDyH7p9ERorQaFL4JV6NPukEJ+yVSNjnsVfCb648M+1HGP47kO089JeqR3U1MRF25gZilAAsAk/ZXTAYpTvBA9M2enqOEYD96KRmRxE+wD4l6aAbR5M+2A5G1IaKuSF9uGcXqHcqtGULw07Yn+CVpmBps9cj3lH5+t7ICObMLfTB3YuSfvWE0BNKw95PAbaeURkYoy6ZSjFSCa7dvXCbl1EAM3rvOBwCVZ8OSAuI/rHlL7mOqkiwB+CmENI34T6kgXZ0Jly5TYPdB9QW+gaXR/dFKP+iK4J/8DvQ1h3iImUjEwtarTAQED3d19OrJm6jiH/HmxmRKhEQGv5bajTavfb586e51MqPdf03iLRsDIUyrZb8voveFdr8xpX3Q==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DDlfo+4b5GSCfZm4j6NmEnv2PqHd72MPAfDQe3upXOUowLFnMDZSpyV59w?=
 =?iso-8859-1?Q?KDaP+Qlwsg4JiMPciHuIFSEF4GT863AKE4ltP4x8hDaUngW862gfZBP82O?=
 =?iso-8859-1?Q?1F8VQfKOM4KyEEl/8n7LWE58Jy+Df+/GPMrElVYhQJGTu/LbLMaxzWQUui?=
 =?iso-8859-1?Q?xSpgkjXqE7FJJKOosT2QiZ2ez61vZsHC33cegftzoVLGulFa7QHt3eT1F2?=
 =?iso-8859-1?Q?zgKqyCE3YFfktgTQ/UcPO8IjopcOlL6nuIJ+oZBLtNrtPl1E58dShFutIu?=
 =?iso-8859-1?Q?2Jep53dAm+VqFhPycXLQJfiWASXzxUiBYsl3ntmnGeh+Blr/yOUdDkOFOV?=
 =?iso-8859-1?Q?i/TfL+XVYPDWKlYk5iioYCvnd+ubJPmZpoRyoaJFdRvpLDq3HdxUuK2wRz?=
 =?iso-8859-1?Q?wdJ0e7YO8zHdyggmEAVjUyTwyjTllJUPO1EQTCM60MymidhoimOvED8jgJ?=
 =?iso-8859-1?Q?u0jEFgNOmww8G1Bi7JEjc7GHc7Wx3a3o5qXC6ayQ0POJUa5aSN9pFL1OsU?=
 =?iso-8859-1?Q?TXx9ZUwQRkxcIpAP7XMRZ+dTYATL6+2cysMPozwwbIrk0y7IWtJifRZNd4?=
 =?iso-8859-1?Q?GyS83gILZ/z3iGvI1eFmUbULNUqFFISz4wpW76qlNBQJpVyzgE3O5M4mT2?=
 =?iso-8859-1?Q?LO9gzOtvxClqo/kyUrUq17gM52zH5AEG3n6nt38DfgVA/DQLupqCtPzdgm?=
 =?iso-8859-1?Q?MKj8f/c48dMGxDexCu8LT0gONpe1XI+TuxEb8Z3SzScyOBAUQublvqA6it?=
 =?iso-8859-1?Q?yCqIqa/5HxmziUIxxAUhxa+yphe/zMR5KiW7HElQnTW7kweFskMa+FYYNp?=
 =?iso-8859-1?Q?eiyqeyX8fxW/angmWgQ2fmaFCMlu1Mrxb1p007MNzkPtI952Uwgx2ib2fK?=
 =?iso-8859-1?Q?epB4ITV3zNMDHs2kucsEXlVTgXF70cTmR7cNd/8GIy9t7XcR7RbtxLj59s?=
 =?iso-8859-1?Q?4JSRw8Sl6xU1u99D2jhVeS0KS7xkCl6HWM3gWx1vdQ/m5+ZOegEp/f3oqk?=
 =?iso-8859-1?Q?Rx4XZy8UANAdCZQGebnApVTUS1FL5Eica+snOSc8vmQa44cF/iLxG6KVq4?=
 =?iso-8859-1?Q?jzK94UU2yur/bFPs5J5WOePC+OzQH3Vx+4hdyfH2sxpDCjV5YUBMcYYSHw?=
 =?iso-8859-1?Q?Nfz525f5Pb8RRAZ4vYy3S05tFC2o4bJ2NN3Hy/6lSNQtPUO1Z8WnIa3EBc?=
 =?iso-8859-1?Q?Ja86E5+UqEmOdmwzW2Dd2hPiF7931wLMp3oy06wLQsMwH0/vsGwE2kKv7e?=
 =?iso-8859-1?Q?T/n6p/RHnipmzLkAwvu5Zzw97nqKLyhHT395pIxphCO5Wl+n5DD7bwTS56?=
 =?iso-8859-1?Q?qaj9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f506b46f-05a2-4427-1a1a-08db2082a889
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 09:42:54.7983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2093
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello there Laurent,=0A=
=0A=
>Would you be able to send a patch to fix this ?=0A=
=0A=
Sadly, no. My success rate with kernel patches is low enough to make it not=
 worth trying.=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
=0A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
Sent: 09 March 2023 09:26=0A=
To: David Binderman <dcb314@hotmail.com>=0A=
Cc: andrzej.hajda@intel.com <andrzej.hajda@intel.com>; neil.armstrong@linar=
o.org <neil.armstrong@linaro.org>; rfoss@kernel.org <rfoss@kernel.org>; jon=
as@kwiboo.se <jonas@kwiboo.se>; jernej.skrabec@gmail.com <jernej.skrabec@gm=
ail.com>; airlied@gmail.com <airlied@gmail.com>; daniel@ffwll.ch <daniel@ff=
wll.ch>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>;=
 linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>=0A=
Subject: Re: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of informa=
tion. =0A=
=A0=0A=
Hi David,=0A=
=0A=
On Thu, Mar 09, 2023 at 07:59:34AM +0000, David Binderman wrote:=0A=
> Hello there Laurent,=0A=
> =0A=
> >We could, but I don't think it will make any difference in practice as=
=0A=
> >the maximum pixel clock frequency supported by the SoC is 80MHz (per=0A=
> >LVDS channel). That would result in a 560MHz frequency returned by this=
=0A=
> >function, well below the 31 bits limit.=0A=
> =0A=
> Thanks for your explanation. I have a couple of suggestions for possible =
improvements:=0A=
> =0A=
> 1. Your explanatory text in a comment nearby. This helps all readers of t=
he code.=0A=
> =0A=
> 2. Might the frequency go up to 300 MHz anytime soon ? The code will stop=
 working then. =0A=
> In this case, I would suggest to put in a run time sanity check to make s=
ure no 31 bit overflow. =0A=
=0A=
As it's a hardware limit of the SoC, I wouldn't expect so.=0A=
=0A=
This being said, I think adding a UL suffix to the constants would be=0A=
better than a comment as it will please static checkers and serve as=0A=
documentation to humans. Would you be able to send a patch to fix this ?=0A=
=0A=
> Just a couple of ideas for the code.=0A=
=0A=
Thanks for taking the time to share those.=0A=
=0A=
-- =0A=
Regards,=0A=
=0A=
Laurent Pinchart=
