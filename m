Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA999E3232
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 04:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7ED10E293;
	Wed,  4 Dec 2024 03:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GOgLDnWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5DA10E287
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 03:42:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4BPozXcyjGYgYU38LuuW3lQU8UO1hmGt0xzLuF0cHTpTEunUXfBBK6i9+U13xhkcmxdVUZi6D2YakvrVP9xKKXhDjKiFM1unlNumfk1VwnNaOoJCRnpQyhOl+Ri8fOfb1Qw9OooGvzy9qyVAJ1di6/34wqbaUBxhrr3TOs6OeA6KK2e70NEJtOFiKc/ehXvVW5j7P4QMYH+D7AR59N7zSQMIzx08kq5mTCClHPTp5OL6Xs6xqHJlr3sp0d7u6QXbvJBDd26BwuUatYPayyN0vr+LgN4/ZhNqFYGGiKJ0CCBt/+zQnxyDqEmUImg2VlZm57E7hzySnOUTotEfTlZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg8jL4T5SiM2A4WVlAudLm9PAKUFaYnyNkQlXTMZueU=;
 b=YaryKB+3S7ccB4w7yj7xc3JQZpnYsglQsQocptt8KaMExZRHh/oiJBskRlXEcDnCjhZko7NMncP60MS94+CoJFSj4aUd7+nkd8OOAnEW2kPP8lkzFH6CaHkBKD7E1aIgGgFYHCnjGcw0oUPWjEM0pEsd54la12SfXZS5pBVfWcQFzqshUx2B0/h2U0hLVqQOaaQlW1hVn+Oa+8w665j+NPu5Oi8nDKmJROpHlUi6fTN8wF/L0x+/LkJ0JoAFdWFfdPoneOimxoBsjqcXv674SdCTOBHrmC5aszdDvmYfVdljzi8ji7ecf2ql9IJAZu6Hflbiy//RoSSXmCfjKVIG+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg8jL4T5SiM2A4WVlAudLm9PAKUFaYnyNkQlXTMZueU=;
 b=GOgLDnWiZl4K1eiT/WUVnCItR13rzzJXgXugmADLwdmnEZ/Hij4Z5oe2791orCBWTgOyFJIzLCYe2gkeNyk9sB9PR4bJShUvqI9sj9mvXsA9TIehgmm5UfaZNCGaIjWO9LsDYLDkjRQOwD+S9ysijSvKim5X+jo3rCzZm2R6cX9XpZXdksu+/iC4uvmCnCFIIymH1Z+ExputOPj0eTMN2EhdNR7IxkFRLnNuvQDC1R/709WxdiVM/BzVvN60f+mLXwWKM+tDiFbNPYHLnTjf9roTQamxu3qvjzAMAXXUuecMgfH2p412wBCufQqHUto/3bNHUvdQMjgh3hiRI1ccYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9662.eurprd04.prod.outlook.com (2603:10a6:102:260::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Wed, 4 Dec
 2024 03:42:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 03:42:16 +0000
Message-ID: <054a0278-428f-49cb-b0f0-182c5bb3b61b@nxp.com>
Date: Wed, 4 Dec 2024 11:42:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b619c6-5c0d-4c0d-fb96-08dd1415a562
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU5rVG1SWElJY0s4enZYTE5kUW5CMHVMdXVFRVVCQ3REeE4yazFzL2Q5VjlT?=
 =?utf-8?B?cGJHUkpqc3loWUVHSi8zb0NCMUw1bGN6WDU0bklqVE1mVENEN2ZYMVpGYkNh?=
 =?utf-8?B?SUpMTTF5TW8reVVOYkwwdU4rN3dMNTExaVhIc0lTMndiU3dIMldVZ3Fub3po?=
 =?utf-8?B?ZWFmMjRJcHRpbTJ5Y1pqV05GelovcmJxWTNJWkdmbXplRmlTbkorTnUrcVc0?=
 =?utf-8?B?Wm1TbFVmSVRBNkdmUXNCRnN3RTRQQmNtNXpTRWliSTFxS1pmd3I0cEdHV0x4?=
 =?utf-8?B?ZGIwQnd3YVJXRlljUmxIRnl2Z2h0Qnd2ZWtPTExIMEt0YS9zMUV6WTNUTnho?=
 =?utf-8?B?U2NTdStqbXRLZjFWSno0djNoWG55d0FYUy92czRWL3o1RG9XVFhjdWpYeStu?=
 =?utf-8?B?ZEpnWWc3c1M2U2VLZG1qbk9rNkg4MXdNM3VYYlBNWGNQaUVQY3hpQ2lLUVVm?=
 =?utf-8?B?eWIvQnVkUlloRmQ2MkxCZUNvODk0UFV3dllQVXI2dlgyMlVKekZaRERGcHdG?=
 =?utf-8?B?VnliMVFCTkUzM3ZqSmxZT0gxNUlRZW9lZ2hVWFlZd2g4Nmpsc2p5SkV6YUtC?=
 =?utf-8?B?eHdVRERsQW80QWd2UHNuUytsdmJxcmltVGJPWkJoRTBUZmlJT1hXL2V0aGtv?=
 =?utf-8?B?WmZPaXNSRDhBdnJmSmk2REw2blpwMHd3bmZGSXp5SFUySk9kQnpJa25nU29V?=
 =?utf-8?B?UXpYYkRDTUg3UU5LK2RZRkg3TUZaakhOYXVBQmZuRmlOL3EwMy9zdjJJSGp1?=
 =?utf-8?B?MFhOamY3blJFbnNhQURTaWV0eUJLNG83SUJFZnNiajA3RGhXV2FocDI3OWYz?=
 =?utf-8?B?OEVPbEQ3bUN6STBia3BzdFVDMWpDNlZEays3RitITGhIWkNkdkJqbktKbWx5?=
 =?utf-8?B?NnBIMkZyU3V3M0xhUXNabUxyRnEvclBsWDRMREpZVHR4ZXV3Sjg2b0ZLamJ3?=
 =?utf-8?B?eVFZbHQ0aG9lTkF4QWt2cktJRWN6aWFtZFQ4ZmpuZ1JacWZUYUpKYURiOCt4?=
 =?utf-8?B?ZTF0MzBKR1J0LzRtWEVnTm5wdkV3WENQcC85ajdhNWptSnVPMHRZOHBQN0cv?=
 =?utf-8?B?cFVBa01zZzlaT2J2a3VqU3VMWXU5MmhrWlRnK1BhcmpuaXlTNkZKQnlvRkln?=
 =?utf-8?B?UlBzU0poTy9rNjh6VTRnVnZqaXNtUWNzak5iUDRGMWtneFE2dFhqR2phdHhp?=
 =?utf-8?B?YUtnZEVmQ2UzOWF4amVkYk5TUmpISDJqMTRyblNWc1hLblV2QXFCQkNtejVs?=
 =?utf-8?B?SkFlVEpsd2JuRmd0UktLdUNhVTVwbWNsOHFSMGNBbUVuMkUvTzl5YU13aS84?=
 =?utf-8?B?Q1Q4RGUwZ2JZV1JxV2FPbldzM1hTKzVSMU81YVhFcVE0UkExRGd3WjZHbGVF?=
 =?utf-8?B?bmVvWmxmK2ZrWkZFSXI5S1ptcVZaY2srZlp6Tk1kTjVzUTdsZkw4UXN4UnRN?=
 =?utf-8?B?K3piTXZZa2Q5THVQWDlVS3AxUHVKK2xLaCt5Z0wvQlhranRyWWJDZkVTeW53?=
 =?utf-8?B?YW0rd1JOczltRXAxaWJWU1g1N3NFeXVhaWNtSnNNRzZmc0RNa0N4T3ZFYVFn?=
 =?utf-8?B?aDVBWTErandIcldxMmoxVXF5UzdQOS91SEMrNnVLUEV2aXZEMVF4SVBiVlhk?=
 =?utf-8?B?QlVUeXpxR0ZxOHBGejRGT1hvcVlkMkxEakpqVFI4MHljOXJ4eXZ0U3Y5azIx?=
 =?utf-8?B?ZEIrUk5wTUlsUE1qL2oybnJrQWltUWpYS2pxRUdSNGlYdThFM0hicERWa0d5?=
 =?utf-8?B?MEprRllGSmNUNTVHL3Viby9yWDhPSVQ5YzkzYm5GRnc1dFlGWHEyeDdFa05S?=
 =?utf-8?B?ZEdmc0s0OGxreGVaZStzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3R2UXZQT3VhZ01HcTc5MTVzbEN3RkJsTTI4YnF4elJWdFNHZ212QXgvR0tP?=
 =?utf-8?B?Q1U1ODlLalpTNzg4aHBjcWY1elZZYkM4MGFCU3dWSXZiUDBDMURoWHhjdldT?=
 =?utf-8?B?cWlBOGJQUGEybmxRZ1dBbmN4YXUxbXdzVkduaTVRY3FZdkZqaUViQVArRkxL?=
 =?utf-8?B?K2hsb05VYTdYWm13LzVQMXlraVFQU1ZuMy90cFE3a21ZV1ZtTXZFdDZTTThR?=
 =?utf-8?B?U3hhcW15ODhsRS9WL0RDeTJvUWdtT0cyam9HRjdvNlg1VzBPMFgyZnIwTmp5?=
 =?utf-8?B?RkxZanpYb2FIMUVJRGVJTUxKNTFqZTB3cWJYVU1iQUkxdGMvR1RWVExnT3pZ?=
 =?utf-8?B?OFk3S3pkVk5MS09vNnpIRmF1NWl0UlM3dHhJa2ZlSFN2czJERS92MW9mSU9L?=
 =?utf-8?B?WUFlTmIxMEpkNFBOdlFENEM2cDNnZU9Cb2FYSHFta2pBSVEzd0d1SVJUMEZF?=
 =?utf-8?B?akFqYUIyR3BZQUdtK1FVSUhlaERucEVoWVhkbms1MHk2MnQvb1lpN3BVOW5l?=
 =?utf-8?B?d0lJV0NCNE5RendNSTQ0UjEyU3NOZFJuNnlrSlRXT1I1Y2wzd25yYWZlNjJm?=
 =?utf-8?B?TGFzdnpHZFlWSDRUTFc1RURjZ1FRaktwelVBcU0ydGgyakttemNldTQ1Vklk?=
 =?utf-8?B?L09MRThFL3A1c0pnWU5iY2tLdFdvK1FvdXdESitEVHYwYy9TSitKdmxlRllH?=
 =?utf-8?B?REYwT1VXbFJhQ1pKa2p3WXhsa1FFa0grYVVzQWdlTWY5Y1FlZStwcHoxMURQ?=
 =?utf-8?B?czJxbXkrMWpZb3ZnZUlQWTdkYlJjVnBzWHUyVlVnS0VZZmFVVzdzQ1RIOTl1?=
 =?utf-8?B?NUhnK0tubFhQNVhjcmI1SFhRdnJESHFSZklnQTdmb2hETkRkY29GOHJuc3VZ?=
 =?utf-8?B?OTVyU0xTaTJ5b2xVSFVMQ2gvTkhTaHA2YWJ3UlhTejdqYkN5Ulo5anYvTVE0?=
 =?utf-8?B?cy9kVVZVRjkxQ2E2WUFMcFlFakdMcGJiZ3ZmRmlRemJyNjRHM0Y4ekl6aHc2?=
 =?utf-8?B?WnRxQXdTSEN2K1RZa21wYk93eUdvSzM0bC9VbVNVRHhVVnVJUkljMUpITjlw?=
 =?utf-8?B?YklndTNjaE02YWxqaTg2WnZTSExiYVFRWVRmMnJ5WFZJamdsMGNJVzc4aitF?=
 =?utf-8?B?bkF3TVBiem4xbXlabTRHMDM2V00rdy8wRENYdkVzYzVYMXBxL0plZXdoYjFC?=
 =?utf-8?B?N28rUFJxUEpmeTRwb3BObGRCYW9vUitpNjhCVEhrQUVxNVFZcUNOWEYybjVH?=
 =?utf-8?B?ZTV0R0NvK1g3QWhibEhyZExFNUdQekZBVGxrSWozZU1aUXRUUUxIWVB1clBH?=
 =?utf-8?B?SVUxV1NEaHMvbWQxWHFWUWhYUy9ISlpyVWtFMzcxclFUblR0bEJNcDRMK0I3?=
 =?utf-8?B?MitWSU5jdThVVVRFN1UxM1FZYVNIZVNMZFdua1dRQkNpRkxsc2FCRGhwZ3hj?=
 =?utf-8?B?Njl6QVhPeE92ZEtxeFRjQjU5YUdKOC9jcEVOR3VCSWp4Y28yVlU3VW00eWlh?=
 =?utf-8?B?dXBtdSt3eVVGWFZLOFoxSU5JS3RJQ2U1b2FjWElkbEYreVNuQS85aGFpdFFM?=
 =?utf-8?B?QmlpQ0crRTc3ayt1Slprb0pnS3Z5UCtGVG5Zd0lHSFZvQWViRVdvdzNJNkx4?=
 =?utf-8?B?REpxOFFtN01rS3pKUTBIZ0lCbVJoenoyVTVrVWpmdDNTZXhwZG1BMk9jQlFB?=
 =?utf-8?B?WW4vNGNXc0xpYnk2ZGhSTk9EMGxaOUk1ZDc0eEtZWDZXaDNBa3cvNkVXOGNQ?=
 =?utf-8?B?Q2t2OUVjTk1zQVBSU0RrWjdGUDA0Y3FNYVlTMmtxbmQ3MVQ1aVZ6Q0wvTmkx?=
 =?utf-8?B?RXkxMjJhaEQyamgwUXlTcnVONjhwZzJ0ajZaRXMzNmxESUZKZk50M2dNUnE3?=
 =?utf-8?B?ZFdoTlpjcVBVVjZjcG04dGhCU0NvTkh3eUFCTGgrblJMOHhkeWxaUi9ORUpn?=
 =?utf-8?B?bVVsUXg3ZTk5Q01ZUUNXQTJnTFFTN3Y4c0xxT1VuZ1JmaDJZSlNKN01MVndt?=
 =?utf-8?B?dU04aGYzeHdOT3lzN0MvN00xSy9rWklRbXk0Yjhkdk1meHV4TjljZXY4UjVZ?=
 =?utf-8?B?UlM2MHNjanJKcW40SlZCSHlWa0w1Z1JpOEtwQWltclkzWHhpZkw3WkhRMzNs?=
 =?utf-8?Q?0DYySYOTq/ty97nbausdNFmTS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b619c6-5c0d-4c0d-fb96-08dd1415a562
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 03:42:16.0671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3b4/ueTRjMs7hGeF4Ke2n54lxR9FKHKcvaKcdqoUv/cFrMimvKFwuh/X3ZgxDTPhe2XoKyqrleMwyFPz+sSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9662
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

On 12/04/2024, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 06:21:29PM +0100, tomm.merciai@gmail.com wrote:
>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>
>> Introduce it6263_is_input_bus_fmt_valid() and refactor the
>> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
>> format by selecting the LVDS input format based on the LVDS data mapping
>> and thereby support both JEIDA and VESA input formats.
> 
> For the patch itself,
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> A more generic question: is the bridge limited to 4 lanes or does it
> support 3-lane or 5-lane configurations?

According to ite,it6263.yaml, the bridge supports all the data
mappings(jeida-{18,24,30} and vesa-{24,30}) listed in
lvds-data-mapping.yaml.  lvds-data-mapping.yaml specifies the
data lanes(3/4/5) used by each of the data mappings.  So, the
bridge supports 3, 4 or 5 data lanes.
 
> 
>>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> ---
>>  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
>>  1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>> index cbabd4e20d3e..83d1db29157a 100644
>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>> @@ -48,6 +48,7 @@
>>  #define  REG_COL_DEP			GENMASK(1, 0)
>>  #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
>>  #define  OUT_MAP			BIT(4)
>> +#define  VESA				BIT(4)
>>  #define  JEIDA				0
>>  #define  REG_DESSC_ENB			BIT(6)
>>  #define  DMODE				BIT(7)
>> @@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
>>  	fsleep(10000);
>>  }
>>  
>> +static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)
>> +{
>> +	switch (input_fmt) {
>> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
>> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
>> +		return true;
>> +	}
>> +	return false;
>> +}
>> +
> 

-- 
Regards,
Liu Ying

