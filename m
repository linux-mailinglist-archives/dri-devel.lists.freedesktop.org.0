Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF279DA10B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 04:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD2310E212;
	Wed, 27 Nov 2024 03:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="IRwKZWMj";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mJ7pJzyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB80710E212
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 03:08:27 +0000 (UTC)
X-UUID: dc604e42ac6c11efbd192953cf12861f-20241127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ZZK2XU7qf20SY1T00IkOy9s58WhQt0KKU52xjk3Mu2I=; 
 b=IRwKZWMjBHPBl9STjiRIndlGX0pPwg1fJVEZCkceGD5yx6tpnbNIBXv5zWBVttRwn8j8PpqfxF+BGm23HK+6XWlCK2UG3WfZYKdwNPtWrAUaXg7dX1f+2PPEV/TJkOd4ofov+FzFwPSfKHVjszl945VEX1Yyzu2t7ovrl9gSpVs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:193400a0-753d-426e-aab5-3b61f052f203, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:1a8b8f23-634f-4016-85ba-2d63e55c9400,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dc604e42ac6c11efbd192953cf12861f-20241127
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 869042358; Wed, 27 Nov 2024 11:08:22 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Nov 2024 11:08:21 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Nov 2024 11:08:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxrRIPRbmes2ks1vXL0J1NKDOqCBnDBnz7ezU8yyWJ55D2c0gCJyQuy83OMN4PLP4txsDd5LoWsx9yUFBAaYhrKQ5gFnlNyNPUaIXlCOlX22uDZS1mxYYFYavsijJcF2qR6x3846VcuIRDJx7SDkhs8u5huHYc4wCZXz1ixnCQ1qJM9DB1xhaCHHhrO3aMsQc7iXxpdQgYYuQQ7CtLVuN6UXtgqt/pX4ReH/0DlZpKTsC3kZc+su+ZDuaWZfq27EiYphkpBqpnxJRJzD+03ToS43io4oDmRCNrNT/TeMKUUDJEmsm/YEGUCnZh7G38mMJbyJlu3M/0YphSbpU1vx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtq3jN9fEfoTc6wFmEE3vJdmIgzuIqiu2kB8XFqT/4I=;
 b=IhXRZODiDq56lRU8lu3ENsh8zFtBhrBnGNX8fLGKugaOyj88i3TO08ZqhPkDxX5bWUQDB3Ydez2vde7ygGWAIGpNJrmzti8tDHOXuazVsf65z5aHhptKIz1mkEO0A8agaiAVdlT56/GwUWD4MTiGAPgXPhtFmcRvBL4YLa8K+y7S3MkWxB8nUJlHuqIKgdDYZLG7ymx5h65zWhhBT/vNHdIbWtzUlnUKCHX7BmAZOoag22JCu1UUWhdYEYvSVCDVdNoU3Mh6dXa78aH6Dd2X8MGnADpNr7+I+6vziglwkwvp+rWod7zgUZNCBtrXVuyoHwYKd09AA86hJDw94qWR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtq3jN9fEfoTc6wFmEE3vJdmIgzuIqiu2kB8XFqT/4I=;
 b=mJ7pJzyqxGlus8sg+Y56YYZA5ytG7YUnoS8ksmF3e/0uaJRdzJZmukJEOO9j/GqGlkp8szKAFL+UHoP7pcmzxQ0bJuQQfyPrOlBk7uVSeaZ8iUkjP9bkX5kvs7b9Iwt6OaTDer75hIwrOsU2syltEO9MWXg5lQwE9qpZIJjlBsE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 03:08:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Wed, 27 Nov 2024
 03:08:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "kernel@collabora.com" <kernel@collabora.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "mripard@kernel.org"
 <mripard@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Topic: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Thread-Index: AQHbO0pF3Zp6UXdpSEmkHbI6wNkmT7LJNvSAgAAU6ICAATDAgA==
Date: Wed, 27 Nov 2024 03:08:18 +0000
Message-ID: <0711c097f724409941239696f5ab790b302d194a.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
 <133167aa2a3fab40547f5dc6602adf2c3d9e01e5.camel@mediatek.com>
 <4143b793-c5b1-4b6d-8547-26a9dc526957@collabora.com>
In-Reply-To: <4143b793-c5b1-4b6d-8547-26a9dc526957@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6468:EE_
x-ms-office365-filtering-correlation-id: ff1f1dca-73e5-4d04-e57c-08dd0e90be12
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NUI5RU9vL040SnprUFpjNW1HZEM1aDl0cVRlU1ZwdytjcVBrK3RhUWcrSVVo?=
 =?utf-8?B?VFlSSzBpb084SW9sdkJNRTdhQWFTY3Fra1lZOXRjSDh5cTBzM2laWXN2RHY3?=
 =?utf-8?B?U1FLUFF6eG9zU3BXbElrMXdpMWFkUW8yMCtManN2K0hSVjBJN3JFSU11aEgv?=
 =?utf-8?B?RlN3UEJYSXIxMHhOaE12SytFVzIzeXUwUVRMWHFNRVkwUGpNSE1yM0xmbkVZ?=
 =?utf-8?B?SHJyUkZ4a1FHZmZzelZYcFZqNzJmMndwY08xVm1XRTh2UnpkSVNwVmJlRVZC?=
 =?utf-8?B?Wk5PR2N6dWRraE5EeWdDZUZtNURYK3gzeThlaFpTWHhjamdPeWROclpwdTdv?=
 =?utf-8?B?RGFSWUUvNEwxOW9va0tZWmlaRTBqZzhNUXY1YkJKeEdtcnQwQWVtTVJib3Z3?=
 =?utf-8?B?alhqamlvVlJ5V2wzWDFVdWxiVU1ITUpldlJwWXk2eHppYzdZSE1XeUJlRjFY?=
 =?utf-8?B?enA1RDBMY1ppb0pnVVJ5aHR0ZXV5UHVSRzBxTDdZNXQxZkpPemdyUDB6OVhp?=
 =?utf-8?B?YVYrd01oRXVMZ2dDTk1wNk5oVisyMkNVYm5GMG8rakpNRWpjdldWNFFDNElj?=
 =?utf-8?B?M2lMT1FkNUVFNmdGbkk1NENra05oQW9lbCtKUGZ4NUdlSVh6bk1yTzlsTWJL?=
 =?utf-8?B?Rm41ZUsvVm1LSUM4djN0V2htQzVPUGM5NWZUbFRSbjRKZ2RWbEZyTzI4L2dw?=
 =?utf-8?B?T21XY2ZScXhMWEl2cW9BWUova3pQVXFQeDN3ZlBETzZLcmdySHJ3SEpGbkE5?=
 =?utf-8?B?RW1pSDVzVUxMTlllUHNwWVg5NXptQzBUaXBwczExb3luaG9SelBOVk9iU3Rq?=
 =?utf-8?B?U1BBWHU3aC9ubmVGN3NEd0xuSUFxQTJ1blZrWHdOUk1tWHJuM0gwK2hGeW8z?=
 =?utf-8?B?NG5MUFBWOFY0aFVlV0h6b3hXeHVHVDF5K1pjZnQyS1VPdy81WjkrS3k5UkhD?=
 =?utf-8?B?TUZaRjN2N2gvWnY1NVRDR0pUNXNkcVZiaWJoQWhLMVQrVzRxSXRuOHJvU2V1?=
 =?utf-8?B?d3hadTNqRGNRTHpVdURtSXBwL1NmZyt5Umhwa2tkMTUySlhEd2xrZzQzMWNY?=
 =?utf-8?B?Wm9CbkRVZDdheTdTWXNnRFVmUWNJbHdDSXhXK1U0OS9iUzQ2dXFlWVZ5UEQ5?=
 =?utf-8?B?dWxCaGFSbUNPczdGc0d0WkZneW5BMVhpcWMxQzZBdFZYT3Q3N2JUOXZscUlW?=
 =?utf-8?B?UlkvRFpYcUp6YWZjZ0NSM0lEbUpWQm04QTBNaVNvUWNic2U1b0N4VUJvUElW?=
 =?utf-8?B?clc2VGJ6cFViNW5Zc3Y2Z2hCaEExRUl6Y0Y0VFJpMlV0RlNVQUZaSm9CTENS?=
 =?utf-8?B?MG5yK2JoTmdxQ0liV25VeHVmN1lRVmtUeXIyaDhhS2t3aHI4R3AzdUg5Q0lo?=
 =?utf-8?B?TE5Ya29DbUMxOVAxb0RKQW1pbFdvbnBLUWFnSU9maUJIY21OOEdaNlZzWHQ3?=
 =?utf-8?B?TzM1T0VveGVMN0pvNzgwZDliWnc2bEZVVTE2TnBtZ2lCZVdBeCs4NGpmZ20y?=
 =?utf-8?B?V1owekpqMHk0R2dJVDY0Y0t6RWFwTmhOVENWdUtjM3ZScFlJM0xHd0x0KzdZ?=
 =?utf-8?B?UkJmZXRuY3o0aFpmcHdrVGoyN09lUzNpd09pcXZWZTFuM1NqUVVJa1FNdGVn?=
 =?utf-8?B?d0lLMHp2T2Y4WFZzdWdyQS9HQURhUDJncjVhQXUxbHZhOFFYSDF2UXgzOGo3?=
 =?utf-8?B?KzhDcGxhNDNwSjlidGZ4dDhOVWd0ZTFsckk0c3o4OXY5djE4QU1mZklCNHlT?=
 =?utf-8?B?b2JtOUdtaTVBdG9YRzJQSy8vUFBKVzVqQURPM0g2eEpXR0hwbG9hNExiYXds?=
 =?utf-8?B?c2JacWEzd1RVMDJDa3RQSExUNElUcUFobUdUZ2RSL0dycmZYRmtkbFZiRFps?=
 =?utf-8?B?d3VrdG9uQUlPL3BlQXAySnNTelA4MVpXamxCK1FaYTZKeXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG9qcTNNNGhCakErOUhNSHhTbnRzREZWaTNkblc5dk40V3NIRlJsbjk2YThE?=
 =?utf-8?B?R0U5NlFIVk81Z1kzdWdVV3RBY25Pem9GVU9VZGFIRFdBNkhpVlBYVVViT1ha?=
 =?utf-8?B?UUVwZkhJZU1lL0haOEZiaUgybU5nS2h4M1hmby9PUkxYSFJ6S1VBdFRjTTNr?=
 =?utf-8?B?MVl0RlVMY2gyMnB0ZXc4MWcrQXZsR0lCY3VObTNiSFV5RUpmZTVHcUpFWThh?=
 =?utf-8?B?eDljdG1PbmtQK053NTcvdGY0d2ZTOGNoRUtrTXpsL0ZxU0d0ZFV1VVlBTzl0?=
 =?utf-8?B?TTZVRTZiUGZJZUlySkRPSkdpUzhHYXRjelRyaXcyZ1N5NWZXdUIyM3RZVmNP?=
 =?utf-8?B?TEVKYzErRk9HQ3M1ZVhpOWhTcFYvNC8wNVFHVEZKQXNSM2tMVjY1Rzg5bE9x?=
 =?utf-8?B?RUJtdU5ydVBxTTBRbnJSSXVCYkZQdkV0OVc1akFINHhqeFdiZVdQdGxheFV5?=
 =?utf-8?B?d2tFdUZLMnVLYXRScnVjYWlKQWk3U05odHVvZFM1SXZlSFBzektUaURIdHRI?=
 =?utf-8?B?T21tRjNsTnU2bTJpMTJoT2RvSGpRa3ppb2FuNDlnVjM3WEhKcnJLcmxiK1lx?=
 =?utf-8?B?M1RZemZQa2hTci8rdUh1SGk3dDhZNkcvZjhGa2ZyOUVYcGpUVk1qNElqL2pE?=
 =?utf-8?B?NXZlKzFRMEhMZi9CT0lGZXhwQWNFajBkZ3ZFVWE1VDFHcXlFaXBwRnJVdXZi?=
 =?utf-8?B?czZDVmZ0Z0Zvd0M2TGlNb2dGMzRGUk5pQllUOXdGVjVFWS9icCtHcUlWL0Fa?=
 =?utf-8?B?SG9ZQzErNTEvelBYL1dJaTltYzlvMkVpdnJqM1dyb2tUV1BQdFpyM3pjeVJG?=
 =?utf-8?B?L3ZheG5VcVZvS3FwdFRBRkFiUFNYMS9rTThsb1RxWEVZWjNqeFd6ZGZKSWVJ?=
 =?utf-8?B?YXNwKzdCMlNzOHpmN1dWYWdidGtPLzRsUUxZWHgvM1hNN0NISkNXcFBtbDdk?=
 =?utf-8?B?SHNXZXdHVlBDQnR2VUxjbEwxdHBXaEVRdm9JMVpIUHNwQ3JpYVdCa2hldDZa?=
 =?utf-8?B?MkJ1Wkp3SFBkenJXbVBGVklYaW5Bd1VHM1pMZHlIS1NKNUJRUlplYjRvT3pS?=
 =?utf-8?B?UzdJM1A3ZWFZVFN1MkFjK0pmV2lyZXRCTzV6SkpUbG9WZDhsNmFpbmN1SDBx?=
 =?utf-8?B?TmR5amxScHdsUGVzYnppMDYrcmR6SHBodEs4K00rVDR5TjVrUFl6T2p3UlZS?=
 =?utf-8?B?TXhUb0wvTHcxY1A5Sk1wWHNnMlJTVDEwWVJmOGJvMzFtNDY1eFoxM2llMUpX?=
 =?utf-8?B?TXhmZm4xZDJTVFo5VTc3aG9HSFJ0dkw5ZmFsOFFnZldYcVNXeUlkMHViR292?=
 =?utf-8?B?SDE4d0NxT1JUeVQzVVEyWkEzL25zajRGMXdwcXJ6MnpwOTViSUYwNTlIL1Rh?=
 =?utf-8?B?bkJzYTYxRGgvTFpnK2NXeG1IVkFsUTFZZ2NkbGMvQnZLWkVKekdSZUVnQkw3?=
 =?utf-8?B?WjRLY0lKM2crOHBkMGxadjJJS2NOa083eG96V1hBbnZHVTRWVlZIUlc3SWwx?=
 =?utf-8?B?dmoxMFZwL1FqRkdyWjd5SlhrMHFEc0NkbEdwR1BSdkxrcWVuSTg0SVdZQS9W?=
 =?utf-8?B?V2oxVGVnVytyOGpoQnpFbk9pT1NsR01PYjZkQXZUL0FGN0ZYaHdtWk1mNFU1?=
 =?utf-8?B?cDYwdE03UHJ2VGRYRU1JY1JmV0RJY25DNHN2aEpnMi80OEZSSEVLTzVueU9J?=
 =?utf-8?B?OWV3Nk11SG9MZTN6cFJBcGtqcGNqQVBLNWZndzc5VFY5YVRXandnMnZlM1BS?=
 =?utf-8?B?dy9qaHhpb3JXOGoyTmVWZk5mY0x5MVlBenBkUGNsV01BcWFJN1A0Q0h6dSsy?=
 =?utf-8?B?aFhpMXVKK3FGdWNJOENvZUdHZUVMRFMveTFoWTdmMFd1ZTUrR3diYm5oSG5Z?=
 =?utf-8?B?UDRkWkxpMmRFaVQ1VDRIUER1b3NISXlVdmtQYlV5OFBydm1nVHRyc2sxckxN?=
 =?utf-8?B?VzQ0Rkl6d0dld1M3RitRY3ZPaituOWNMVmZPQ0xKYTJrNVdwTndYNjg5RlNp?=
 =?utf-8?B?Tjl3WFBNOVBXaGVuMEZQWUc1VkI0cThwNmhnOGlUaUpQSlAzSFVDUmFLTXpX?=
 =?utf-8?B?REF1TUc0Qm85elc5MjVQcHArT1pqWlJhbjVJSXpFREorV2NmMkNDdEllVzJx?=
 =?utf-8?B?RGZjdExhNUNOY1dHMVNOUXZQSk52RGx3bE9NRGtRdXZCdE9kYUcwQUJMbENs?=
 =?utf-8?B?WlE9PQ==?=
Content-ID: <2B7403866C2C8F49BF48D6770141B719@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1f1dca-73e5-4d04-e57c-08dd0e90be12
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 03:08:18.3420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KzNJyA4XGDP0Alv7JGvMWmeCeQ3h8641F5/j0+PXeIsNtQvYD9n6i56SLxWvcTxIBVuxLgEd5dtm1JocRsgm1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1937539998.682321182"
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

--__=_Part_Boundary_002_1937539998.682321182
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI0LTExLTI2IGF0IDA5OjU3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyNi8xMS8yNCAwODo0MiwgQ0sgSHUgKOiDoeS/
iuWFiSkgaGEgc2NyaXR0bzoNCj4gPiBIaSwgQW5nZWxvOg0KPiA+IA0KPiA+IE9uIFdlZCwgMjAy
NC0xMS0yMCBhdCAxMzo0NSArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6
DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgbmV3ZXIg
SERNSS1UWCAoRW5jb2RlcikgdjIgYW5kIEREQyB2MiBJUHMNCj4gPiA+IGZvdW5kIGluIE1lZGlh
VGVrJ3MgTVQ4MTk1LCBNVDgxODggU29DIGFuZCB0aGVpciB2YXJpYW50cywgYW5kDQo+ID4gPiBp
bmNsdWRpbmcgc3VwcG9ydCBmb3IgZGlzcGxheSBtb2RlcyB1cCB0byA0azYwIGFuZCBmb3IgSERN
SQ0KPiA+ID4gQXVkaW8sIGFzIHBlciB0aGUgSERNSSAyLjAgc3BlYy4NCj4gPiA+IA0KPiA+ID4g
SERDUCBhbmQgQ0VDIGZ1bmN0aW9uYWxpdGllcyBhcmUgYWxzbyBzdXBwb3J0ZWQgYnkgdGhpcyBo
YXJkd2FyZSwNCj4gPiA+IGJ1dCBhcmUgbm90IGluY2x1ZGVkIGluIHRoaXMgY29tbWl0Lg0KPiA+
IA0KPiA+IEJvdGggTVQ4MTczIEhETUkgYW5kIE1UODE3MyBDRUMgaGFzIGhvdCBwbHVnIGRldGVj
dGlvbiBpbnRlcnJ1cHQuDQo+ID4gSSBkb24ndCBrbm93IHdoeSBidXQgTVQ4MTczIGNob29zZSBD
RUMgdG8gZGV0ZWN0IGhvdCBwbHVnLg0KPiA+IA0KPiA+IERvZXMgTVQ4MTk1IENFQyBoYXMgaG90
IHBsdWcgZGV0ZWN0aW9uIGludGVycnVwdD8NCj4gPiBJZiBpdCBoYXMsIG1heSB3ZSBhbGlnbiB0
aGUgaG90IHBsdWcgZGV0ZWN0aW9uIGZsb3cgd2l0aCBNVDgxNzM/DQo+ID4gDQo+IA0KPiBUaGUg
Q0VDIG9uIE1UODE5NSBkb2VzIGhhdmUgYW4gaG90cGx1ZyBkZXRlY3Rpb24gaW50ZXJydXB0LCBi
dXQgdGhhdCAqbXVzdCogYmUNCj4gdXNlZCBleGNsdXNpdmVseSBmb3IgQ0VDIGZvciBvbmUgaW1w
b3J0YW50IHJlYXNvbi4NCj4gDQo+IFdoaWxlIG9uIE1UODE4OCB3ZSBvbmx5IGhhdmUgdGhlIEhE
TUkgKFRYKSBFbmNvZGVyLCBNVDgxOTUgZmVhdHVyZXMgYm90aCBIRE1JIFRYDQo+IGFuZCBIRE1J
IFJYIGFuZCBpbiB0aGUgc3BlY2lmaWMgY2FzZSBvZiB0aGlzIFNvQ3MsIHRoZSBDRUMgYmxvY2sg
aXMgc2hhcmVkIGJldHdlZW4NCj4gdGhlIHR3byBjb250cm9sbGVycy4NCj4gDQo+IElmIHdlIHVz
ZSB0aGUgQ0VDIGhvdHBsdWcgZGV0ZWN0aW9uIGZvciBIRE1JLVRYLCB3ZSB3b3VsZG4ndCBiZSBh
YmxlIHRvIHNoYXJlIHRoZQ0KPiBibG9jayB3aXRoIHRoZSBIRE1JLVJYIHdpdGhvdXQgaGFja3Mu
DQo+IA0KPiBUaGlzIGlzIHdoeSB3ZSBuZWVkIHRvIHVzZSB0aGUgSFRQTEcvUE9SRCBwcm92aWRl
ZCBieSB0aGUgSERNSS1UWCBibG9jayBpbnN0ZWFkIG9mDQo+IHRoZSBDRUMgb25lLg0KDQpPSywg
cGxlYXNlIGFkZCB0aGlzIGluZm9ybWF0aW9uIHRvIGNvbW1pdCBtZXNzYWdlIHNvIHRoYXQgd2Ug
a25vdyB3aHkgbm90IHVzZSBDRUMgdG8gZGV0ZWN0IGhvdCBwbHVnLg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiANCj4gPiBUaGlzIGlzIG5vdCBhIHN0cm9uZyBzdWdnZXN0aW9uIGJlY2F1c2UgSSBkb24n
dCBrbm93IHdoeSBNVDgxNzMgY2hvb3NlIENFQyB0byBkZXRlY3QuDQo+ID4gSSBqdXN0IHdhbnQg
bW9yZSBmdW5jdGlvbiB0byBiZSBjb21tb24uDQo+IA0KPiBZZWFoLCBJIGdvdCB0aGUgcG9pbnQg
YW5kIEkgd291bGQndmUgYXNrZWQgdGhlIHNhbWUgcXVlc3Rpb24sIGJ1dCBmb3IgdGhlIHJlYXNv
bnMNCj4gdGhhdCBJIGV4cGxhaW5lZCwgdGhhdCdzIHVuZm9ydHVuYXRlbHkgbm90IHBvc3NpYmxl
IDotKQ0KPiANCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCj4gDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4g
PiBDSw0KPiA+IA0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5v
IERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiANCj4gDQo+IA0KPiANCg==

--__=_Part_Boundary_002_1937539998.682321182
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjQtMTEtMjYmIzMyO2F0
JiMzMjswOTo1NyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0lsJiMzMjsyNi8xMS8yNCYjMzI7MDg6NDIsJiMzMjtDSyYjMzI7
SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMyMDgwOTspJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZn
dDsmIzMyOyZndDsmIzMyO0hpLCYjMzI7QW5nZWxvOg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7V2VkLCYjMzI7MjAyNC0xMS0yMCYjMzI7YXQmIzMyOzEzOjQ1
JiMzMjsrMDEwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6
JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMy
O29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbCYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJp
ZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7QWRkJiMzMjtzdXBwb3J0JiMzMjtmb3ImIzMyO3RoZSYj
MzI7bmV3ZXImIzMyO0hETUktVFgmIzMyOyhFbmNvZGVyKSYjMzI7djImIzMyO2FuZCYjMzI7RERD
JiMzMjt2MiYjMzI7SVBzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtmb3VuZCYjMzI7aW4m
IzMyO01lZGlhVGVrJiMzOTtzJiMzMjtNVDgxOTUsJiMzMjtNVDgxODgmIzMyO1NvQyYjMzI7YW5k
JiMzMjt0aGVpciYjMzI7dmFyaWFudHMsJiMzMjthbmQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyO2luY2x1ZGluZyYjMzI7c3VwcG9ydCYjMzI7Zm9yJiMzMjtkaXNwbGF5JiMzMjttb2RlcyYj
MzI7dXAmIzMyO3RvJiMzMjs0azYwJiMzMjthbmQmIzMyO2ZvciYjMzI7SERNSQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7QXVkaW8sJiMzMjthcyYjMzI7cGVyJiMzMjt0aGUmIzMyO0hETUkm
IzMyOzIuMCYjMzI7c3BlYy4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7SERDUCYjMzI7YW5kJiMzMjtDRUMmIzMyO2Z1bmN0aW9uYWxpdGll
cyYjMzI7YXJlJiMzMjthbHNvJiMzMjtzdXBwb3J0ZWQmIzMyO2J5JiMzMjt0aGlzJiMzMjtoYXJk
d2FyZSwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2J1dCYjMzI7YXJlJiMzMjtub3QmIzMy
O2luY2x1ZGVkJiMzMjtpbiYjMzI7dGhpcyYjMzI7Y29tbWl0Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtCb3RoJiMzMjtNVDgxNzMmIzMyO0hETUkmIzMyO2FuZCYjMzI7
TVQ4MTczJiMzMjtDRUMmIzMyO2hhcyYjMzI7aG90JiMzMjtwbHVnJiMzMjtkZXRlY3Rpb24mIzMy
O2ludGVycnVwdC4NCiZndDsmIzMyOyZndDsmIzMyO0kmIzMyO2RvbiYjMzk7dCYjMzI7a25vdyYj
MzI7d2h5JiMzMjtidXQmIzMyO01UODE3MyYjMzI7Y2hvb3NlJiMzMjtDRUMmIzMyO3RvJiMzMjtk
ZXRlY3QmIzMyO2hvdCYjMzI7cGx1Zy4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7RG9lcyYjMzI7TVQ4MTk1JiMzMjtDRUMmIzMyO2hhcyYjMzI7aG90JiMzMjtwbHVnJiMz
MjtkZXRlY3Rpb24mIzMyO2ludGVycnVwdCYjNjM7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJZiYjMzI7
aXQmIzMyO2hhcywmIzMyO21heSYjMzI7d2UmIzMyO2FsaWduJiMzMjt0aGUmIzMyO2hvdCYjMzI7
cGx1ZyYjMzI7ZGV0ZWN0aW9uJiMzMjtmbG93JiMzMjt3aXRoJiMzMjtNVDgxNzMmIzYzOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoZSYjMzI7Q0VDJiMzMjtvbiYj
MzI7TVQ4MTk1JiMzMjtkb2VzJiMzMjtoYXZlJiMzMjthbiYjMzI7aG90cGx1ZyYjMzI7ZGV0ZWN0
aW9uJiMzMjtpbnRlcnJ1cHQsJiMzMjtidXQmIzMyO3RoYXQmIzMyOyptdXN0KiYjMzI7YmUNCiZn
dDsmIzMyO3VzZWQmIzMyO2V4Y2x1c2l2ZWx5JiMzMjtmb3ImIzMyO0NFQyYjMzI7Zm9yJiMzMjtv
bmUmIzMyO2ltcG9ydGFudCYjMzI7cmVhc29uLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtXaGlsZSYj
MzI7b24mIzMyO01UODE4OCYjMzI7d2UmIzMyO29ubHkmIzMyO2hhdmUmIzMyO3RoZSYjMzI7SERN
SSYjMzI7KFRYKSYjMzI7RW5jb2RlciwmIzMyO01UODE5NSYjMzI7ZmVhdHVyZXMmIzMyO2JvdGgm
IzMyO0hETUkmIzMyO1RYDQomZ3Q7JiMzMjthbmQmIzMyO0hETUkmIzMyO1JYJiMzMjthbmQmIzMy
O2luJiMzMjt0aGUmIzMyO3NwZWNpZmljJiMzMjtjYXNlJiMzMjtvZiYjMzI7dGhpcyYjMzI7U29D
cywmIzMyO3RoZSYjMzI7Q0VDJiMzMjtibG9jayYjMzI7aXMmIzMyO3NoYXJlZCYjMzI7YmV0d2Vl
bg0KJmd0OyYjMzI7dGhlJiMzMjt0d28mIzMyO2NvbnRyb2xsZXJzLg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtJZiYjMzI7d2UmIzMyO3VzZSYjMzI7dGhlJiMzMjtDRUMmIzMyO2hvdHBsdWcmIzMyO2Rl
dGVjdGlvbiYjMzI7Zm9yJiMzMjtIRE1JLVRYLCYjMzI7d2UmIzMyO3dvdWxkbiYjMzk7dCYjMzI7
YmUmIzMyO2FibGUmIzMyO3RvJiMzMjtzaGFyZSYjMzI7dGhlDQomZ3Q7JiMzMjtibG9jayYjMzI7
d2l0aCYjMzI7dGhlJiMzMjtIRE1JLVJYJiMzMjt3aXRob3V0JiMzMjtoYWNrcy4NCiZndDsmIzMy
Ow0KJmd0OyYjMzI7VGhpcyYjMzI7aXMmIzMyO3doeSYjMzI7d2UmIzMyO25lZWQmIzMyO3RvJiMz
Mjt1c2UmIzMyO3RoZSYjMzI7SFRQTEcvUE9SRCYjMzI7cHJvdmlkZWQmIzMyO2J5JiMzMjt0aGUm
IzMyO0hETUktVFgmIzMyO2Jsb2NrJiMzMjtpbnN0ZWFkJiMzMjtvZg0KJmd0OyYjMzI7dGhlJiMz
MjtDRUMmIzMyO29uZS4NCg0KT0ssJiMzMjtwbGVhc2UmIzMyO2FkZCYjMzI7dGhpcyYjMzI7aW5m
b3JtYXRpb24mIzMyO3RvJiMzMjtjb21taXQmIzMyO21lc3NhZ2UmIzMyO3NvJiMzMjt0aGF0JiMz
Mjt3ZSYjMzI7a25vdyYjMzI7d2h5JiMzMjtub3QmIzMyO3VzZSYjMzI7Q0VDJiMzMjt0byYjMzI7
ZGV0ZWN0JiMzMjtob3QmIzMyO3BsdWcuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyO1RoaXMmIzMyO2lzJiMzMjtub3QmIzMyO2EmIzMyO3N0cm9uZyYjMzI7
c3VnZ2VzdGlvbiYjMzI7YmVjYXVzZSYjMzI7SSYjMzI7ZG9uJiMzOTt0JiMzMjtrbm93JiMzMjt3
aHkmIzMyO01UODE3MyYjMzI7Y2hvb3NlJiMzMjtDRUMmIzMyO3RvJiMzMjtkZXRlY3QuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtJJiMzMjtqdXN0JiMzMjt3YW50JiMzMjttb3JlJiMzMjtmdW5jdGlvbiYj
MzI7dG8mIzMyO2JlJiMzMjtjb21tb24uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1llYWgsJiMzMjtJ
JiMzMjtnb3QmIzMyO3RoZSYjMzI7cG9pbnQmIzMyO2FuZCYjMzI7SSYjMzI7d291bGQmIzM5O3Zl
JiMzMjthc2tlZCYjMzI7dGhlJiMzMjtzYW1lJiMzMjtxdWVzdGlvbiwmIzMyO2J1dCYjMzI7Zm9y
JiMzMjt0aGUmIzMyO3JlYXNvbnMNCiZndDsmIzMyO3RoYXQmIzMyO0kmIzMyO2V4cGxhaW5lZCwm
IzMyO3RoYXQmIzM5O3MmIzMyO3VuZm9ydHVuYXRlbHkmIzMyO25vdCYjMzI7cG9zc2libGUmIzMy
OzotKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtDaGVlcnMsDQomZ3Q7JiMzMjtBbmdlbG8NCiZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0
OyYjMzI7Jmd0OyYjMzI7Q0sNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7
QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwh
LS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UN
CiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlz
IGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25m
aWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBm
cm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBi
ZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNl
LCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBj
b3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVu
aW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJl
IHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBl
LW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwg
aW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBs
eWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5k
IGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVy
IHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_1937539998.682321182--

