Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEC8C602B
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 07:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58C510E0E4;
	Wed, 15 May 2024 05:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="GxY6YD9X";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Sh7Ou1mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A6210E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 05:35:58 +0000 (UTC)
X-UUID: fd242822127c11efb92737409a0e9459-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Lu6k+d0OfkezZBcG6x/HrQyHjLMjZpEq/TZ10rg+yO0=; 
 b=GxY6YD9X9x4zwY23UbYHO89dHNWXu1fMW/D7nONEe9S0MDZwhdJ7KqC0VEYhpRm4larLdyZ/AvWvPjPsg0eyacx7hE2KIWSaBbjlq6eE4JjoRI2O46TUN7TGkAcLWnKFbnyJjCzYTJaxAKSShdLcANjTBq/gO8fGdLnsHtbas8Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:902336af-01c4-4588-9cd8-dc258d27a842, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:d00ddf83-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: fd242822127c11efb92737409a0e9459-20240515
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 887716798; Wed, 15 May 2024 13:35:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 13:35:49 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 13:35:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6qx6JqS/QFMxT/WbP61VwsZF43i9vPT5LeykrpNlstESu+L3nVEJgevF0zAyIuhV/oqeBdTEcYRrKwdZSTuq9Eb9a/gdIO+wYyVfk97AA2FhNE6Ln53AmBCSQBpvhPkKfYqfMW9jmfMZXpijgkXqWEncLkvlS71X0giBGK9UZfvwHZXodgce6TroBceAHEvdiTtlH8n6ur+riw7gHR7YHlK4zJVlIjz49rvKm+CuLzF4WnGmEiVSW6tEe3IKA/ITFxcPFU9azsZDKXGtvCDkuz2inn1OIhP6GNiLc9vyweyrTNis7trrJHw++Gz3pfESy49iK5eipIcjRqaja/5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lu6k+d0OfkezZBcG6x/HrQyHjLMjZpEq/TZ10rg+yO0=;
 b=d+3Alu3TGZxp8RhJJJj/lKmnjK7obuD5rsMXI1/D1CbCcrccrx/1X2NPtKvx5SkMutXxS+Cmnxn1C3oXdVJQyll4qDKvz+JyHn08iUpqSxP20qKRhWjE7xl0120Scc6BHPLVoGGoAE/7nnF3DWvrkJwnhMA9ZOGekjY77cnpK2WjQg11cwsQE5P1DVjnLg/6Y1REGJWOyrFE6xn7jY13aaorCmmrHrF0yuYqBt2WTz5ahnHo3OPEeTQWA+UEt2p28yxBZgfgwej9L2+fNRWn/IWgVoUMvKGZuGFhHxi62uEUPVW1VTY224chaBrzniSchWec06icwwluhW3U9nLnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu6k+d0OfkezZBcG6x/HrQyHjLMjZpEq/TZ10rg+yO0=;
 b=Sh7Ou1mokCuiGWhpur/HPP5KIaIuHQtHawtu1gOEVqGFriKOs8v1n9qYfH6Rr6BlAGLycS13FVAjUPrFvBOy+rAvYSO/wlS6p1D0Au3uHvTB1Gdtrd3FBGDDvDhXEB4bWXFoL/9aMehFp5xAre8tFBR//zSPfUEVngYH6+8K0i4=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TY0PR03MB6534.apcprd03.prod.outlook.com (2603:1096:400:21e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.27; Wed, 15 May 2024 05:35:46 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%4]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 05:35:46 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jstultz@google.com"
 <jstultz@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "quic_vjitta@quicinc.com"
 <quic_vjitta@quicinc.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?=
 <kuohong.wang@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "ppaalanen@gmail.com"
 <ppaalanen@gmail.com>, "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 4/7] dma-buf: heaps: restricted_heap: Add dma_ops
Thread-Topic: [PATCH v4 4/7] dma-buf: heaps: restricted_heap: Add dma_ops
Thread-Index: AQHaRTjBR729oJoqokO8DlfThRQ4PrDV7IUAgAACL4CAwppRgA==
Date: Wed, 15 May 2024 05:35:46 +0000
Message-ID: <28135cc3e24201f28039ae43958d627496b20861.camel@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-5-yong.wu@mediatek.com>
 <ZaEJOjXP2EJIe9rK@phenom.ffwll.local> <ZaELD4APVuX4p77P@phenom.ffwll.local>
In-Reply-To: <ZaELD4APVuX4p77P@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TY0PR03MB6534:EE_
x-ms-office365-filtering-correlation-id: 27eec2e5-d154-4e66-8d21-08dc74a0dee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?WFowekliSnJkUTNGSXU0Q0hCb3NVWmRuRS9kM1JDNzJRaGxFakNRdWJMVldy?=
 =?utf-8?B?MmhTc3NxMFdmM1FMNnBwb2hKQ1o2eWNTaTZrUVphVnAwcGJIZjJ5Q1Bnb0dG?=
 =?utf-8?B?ai9Pb01kOExDVUowWlMxTXU5aGJCY0ZOV3VtTFFhd3M5MjRMZW1WVmxtVGdS?=
 =?utf-8?B?UnZVWUNFdnh3S0lpWUU3eDBJWWRkTHZ0cE1vK1BIZVhFMVY2VVlUamR0Mzh2?=
 =?utf-8?B?Ri96ZDRad09uZjUwM3g5ekNRL0ZVeHNCa3JYRjdpL3JCZHNTS1hvRC9KMERC?=
 =?utf-8?B?OFJGKzFodlo4emZnUVBZMm1JRlVDSXk2Yi82QVBhZnhXb0lpejgyazVVTUlN?=
 =?utf-8?B?N3I0bGFNMWFoRTQ3NzFwZjZMU2FhemswVXVuMjBWRVV6ZGlHSXgrN2plUWlV?=
 =?utf-8?B?QWt6aFJtRHpEaWFyRjRnQWlnRjlkSjNZMGZneTQrS0NoQXlLZnVWV1BlQUhh?=
 =?utf-8?B?WEtlQUQ3NXllYTFXNXd4TmI3T2ZnWGdDM1BkUkJDMjZJaDQ1a29vcTNRSko1?=
 =?utf-8?B?QVVZR2JURTZDOHhVclN5bWtaWk1RVndSb2dSbzRsaEtPMDdlU2lkNElVcWRp?=
 =?utf-8?B?UUV4RlovRERWUEdZbDJwNWcwcFBWdjBhcXVGRTA2QU9sQVlhNnlJSGpYZVVG?=
 =?utf-8?B?Mi9TeFIvS3pvbyttVFUzTkZkbjcwaTdsZFdIaFh3RFVzNDFESnRWQU1pZzg4?=
 =?utf-8?B?TmJUMUN5U3p0MmlGaWYxeExzdmVlSE1jdHJMTENTWFdxL2Nld1lDbldKcjQv?=
 =?utf-8?B?d3ArWWJBdGthcDhQY1pRcnNLOWRiMnErTHBQZ0ZIdW9IZ1JodmJjdHNzeUp0?=
 =?utf-8?B?R2s3RGQ3c1FTVFFDSWptcmc5VWF0R1pPNVNtRytyelQ5QTZtRUFmWkYyNjJ0?=
 =?utf-8?B?UWZ5R2lidUZJUVpPL3lkN0hxR3JreGp1cU5YS1pwSUJYWFpYQUp3TVlmcktu?=
 =?utf-8?B?VnZjTzVIaFQyNjRmZTBSNXpJSmZwcVdBQTJwcHRsc0hpM0w1cGlGamJjVVBw?=
 =?utf-8?B?L3gvbVZBNUVKRThVSGRKY05VZ3RKWXlDNVRNc0dKTVgwSVk2QjFKcnRteTgr?=
 =?utf-8?B?ZldKbExhOXJnVW5qeHU4b3M4SE1LV0hOMldwN29nZlltMkc4RGFsZFBCaTMz?=
 =?utf-8?B?NlZKTzJKUVhWeXpHVEh6Q1pwWnFCN0oyRjlBZndFT3RlY2NqTER1bERvNFFq?=
 =?utf-8?B?bXlobEtvc0VsaDR1VXJpT21NYWRxOEFpTzYyK0JRUEJ5elBCUHpRVmNhWXpM?=
 =?utf-8?B?REx6b1RXWS8rTjU2WnRIYm5RTUtPNVpHRmJ2WnJQNndhOVpYTXU2cHV0UzRy?=
 =?utf-8?B?VUVKVFBiTTFsSnhEcmpsMnN2SFV2K0NyYUdsQzhSWFUrVnliWmF0bXJ2emZi?=
 =?utf-8?B?RXh1cGJJbjFxNUQrd2lyZFFCT3gySjIvTytEZVYyUWhPL09MRkFzNm9xUzF0?=
 =?utf-8?B?Rkc3bVB4b01LWTcxOWNQWlRUMFhqa3F4UXNrN1poQjlJQXVySGtubFZvcTNR?=
 =?utf-8?B?di9aMm56UTBUOHhiTUJmMXdKQjhBbnd4RU9zQWZwdGJqUWFEQnZwV2hGaFFI?=
 =?utf-8?B?YWxhTlBGMHZXMERmZUV5Tyt1dDB1b0dqdDRwN0FDS1VRemY1TnhHNHlXYmVK?=
 =?utf-8?B?UHlyT0JvenF1aEhTOHNpdit2cUU5SWVaOG80N3pwOE9WNXVHcThTQTlmRll5?=
 =?utf-8?B?RVY1TlFhV0dYOTNhZXEyWmNZUlM3REFleUFTVVNIaU5oekFoQ0s3KzlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXNVaExtazlOY3hOVDlzNnV4NW5LT3hTOG9kYkNQL1BYN2MvM0dXdnFhK0xO?=
 =?utf-8?B?eFlrcnpUL3h1Q3Q5Sk9jMWNKYktPb2FoWkxoV1AvWE9DcUlHMU5XNWZJcTJT?=
 =?utf-8?B?YmlpcHk1dFlBeWZ1eUxZVnhHYk9QZ3BQbWJwU05NSnJoQnlMeWhzVDQvTW9m?=
 =?utf-8?B?RmNndWd3REFlaTlMSVhZZU1RdnhvbTNBS1NOd2tHeHFtMDlQTWwvWTFlV2VG?=
 =?utf-8?B?N3gxckpFQWZFTFpQN0MwRTBQazdXaFJpM2crVVFKdktvRUNESTZXQ3pDUU5w?=
 =?utf-8?B?UlBJczkvTWpaVjdPbUFxM3NqNnZQUXNiOFExL3BnTjJtZVp3YkJVczIxbjRx?=
 =?utf-8?B?ZFMzK01wUlVuVDJ3NjBnYSs1a3BzN1ZzamJWR0s1c3U4Wk94RHJTM2ZpN20x?=
 =?utf-8?B?MjE1RzAzN0ZsNDllcWEzZDJyMUhDS0JJV2c5ekkxK1JJUTFXZTM0YnU4M3Fo?=
 =?utf-8?B?ZUZuUWVoNStQYW4xOUxXeDRGV0R1NE9QM2NlS2tMdVRGbWJobG9wdGtTemhp?=
 =?utf-8?B?MXRPMTR6aWgyZ1BDSzdUQnBzN1VRNkc5VHc3MjNDRE1vWFlYekdFdksxeDc1?=
 =?utf-8?B?NDJxa1laOWhYQUIwa3Z4a3Z6V3A1SWdsTjhVTFdZYnZsTzZ4UDJQQ3ZaRU1N?=
 =?utf-8?B?UkwzaUVMQTBZYW5qSWFjRldSaUc1allxWklGdVBTV3ZlL2taelB3WmRRRlZF?=
 =?utf-8?B?Z2Y4NWliMVBTaHZLMzcxV3JJQkx3YktEQlpKNEJ3SitnOEdFVUJCOTVtRE9x?=
 =?utf-8?B?ZlBIR2dyQWZ0ZHZzbVlELzAyT0ZGRUpmRFlGQUc0NDRxdlFrQ3piMXZkVUF3?=
 =?utf-8?B?Ykl4ajlkdVJiN0xXa3JLNTRWTUlmNjNVSjFGbUxjM29yT1FjZ1dEWnUzRzB4?=
 =?utf-8?B?L3FjS1BQQ2w3bkNCT283Vy9sWDVWaklSTXZiZ3V0TFNrbHFoNkVtOFZBS3Ev?=
 =?utf-8?B?Tk9kc0c2c0FxWUdsSHhJU0daQ2toV0Zzd1JCMlN3bmpZRWwzajZuK2xjcDhG?=
 =?utf-8?B?eFgxWW8xWks0YTZvVUEwS1YzVGFDNGZTeVYwS3ZDcUZIOHB5dnp1QnhCZWxy?=
 =?utf-8?B?VFo2VmJTbkVuY3Z0Q0ZyZ0lUblVQUnVDeklxTW9pWVd0UmtqaHZCWmRQbUor?=
 =?utf-8?B?QkprYUpUaExkSGFLUmF0UDNTeFRKMFl5c3QvRDgzZVRmNy84R1ozN2U3NE12?=
 =?utf-8?B?TmE2MTZPZU8xejZPeDRXUzh6N0duSlZHRENYZlhnOUxyaGljSU1seVowa0Jm?=
 =?utf-8?B?a0lBNzNrMWdENGlML2Z4eDQwZGQydG9CUVc5bnAyZjA2NGZERFJtR0hOUllE?=
 =?utf-8?B?WnNFYXRWRS8yZkx6dlJSNHFkbERCWmdvY0gzd2lSTUhMb0JjclBaNC9GRnVM?=
 =?utf-8?B?cE9rVlBURTVoanduZ0llbnEzVUFWV2V6RmRNNDRzQTE0WXBjd2VaY1VZQXpt?=
 =?utf-8?B?L2hxTzRHSE1jeTVtNVRoRSszMHhEazdXMFkrdnVHWm9zd0tGMVhrUWRmK3hV?=
 =?utf-8?B?cTVHWktuRHhPTUd6TCtrdkhBVnBib2FGajdRbmxNenMyR25GUEVJM1F4dXlh?=
 =?utf-8?B?c2wrOFo0Y2Exc2xucU13bHVqMTRvdjFnMkxHS1Q3YjFmZDdGWCt4OGFmY0ZZ?=
 =?utf-8?B?RVFwbzZ5T29kb09OMEo5SGNuNzFYUEIxK0FsbWZHb29hKzROVFNQc1p5ejFQ?=
 =?utf-8?B?bmFYYkpEa2RINUpFU3NOSTlHQklvT0JxSkR0eXVtTVBHNnpnbG1ncWw5TGZC?=
 =?utf-8?B?NElKOXFNM3E4UzJRSVM0QnZIelh3K3FVSC9vTXc2K1k1Vm9SbExsYUJEREdv?=
 =?utf-8?B?NlpzamtrUDVIMDBBaUc1OC8zT3BMSENLZ0Fnc2tnTUFUeUt1UTVPWTg1cGE0?=
 =?utf-8?B?QmFkbHZqTkRDU2dCbnkzenlwc1Y2MXd3MTJrSm5YQTNsenJmVlFXVEdmaDBr?=
 =?utf-8?B?RnhNZ1dRRExZUGhTMUYzanMvU2s4bUFmdmRBY2l6SDVRU1ptcnV4cE1hSVJE?=
 =?utf-8?B?YjBVSGtDTU84Uk1uL3FxUGwvdnVDRHF4NEo1TEE0Z3F0enE0aHlKWFRSeXNK?=
 =?utf-8?B?Z3VzeFh5ZjlDbWJWbTl4aFFCdXhEYm1ZTFVVSVVsRjJqb1c5L3A0QTg0aTJZ?=
 =?utf-8?B?VGE1T2RXSzdtN2VPcTlSQk9hK3dkV1pTZ1ZITi9FWWtHN2JGSlQrc25Ja3Qx?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A73D04FE45FDB4EBD1B0BC76FFC5281@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27eec2e5-d154-4e66-8d21-08dc74a0dee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 05:35:46.2754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jF00RZ3Bp/6LadTCVgInrtV4mYW/LZs83wIu8st6jEduAazRGPh4gQkTTcLLsTEBjZOvDc50SWuQeHxnmI5Ltw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6534
X-MTK: N
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

T24gRnJpLCAyMDI0LTAxLTEyIGF0IDEwOjQ5ICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIE9uIEZyaSwgSmFuIDEyLCAyMDI0IGF0IDEwOjQxOjE0QU0gKzAxMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+ID4gT24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgMDU6MjA6
MTFQTSArMDgwMCwgWW9uZyBXdSB3cm90ZToNCj4gPiA+IEFkZCB0aGUgZG1hX29wcyBmb3IgdGhp
cyByZXN0cmljdGVkIGhlYXAuIEZvciByZXN0cmljdGVkIGJ1ZmZlciwNCj4gPiA+IGNhY2hlX29w
cy9tbWFwIGFyZSBub3QgYWxsb3dlZCwgdGh1cyByZXR1cm4gRVBFUk0gZm9yIHRoZW0uDQo+ID4g
PiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0K
PiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL3Jlc3RyaWN0ZWRfaGVhcC5j
IHwgMTAzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
bWEtYnVmL2hlYXBzL3Jlc3RyaWN0ZWRfaGVhcC5jDQo+IGIvZHJpdmVycy9kbWEtYnVmL2hlYXBz
L3Jlc3RyaWN0ZWRfaGVhcC5jDQo+ID4gPiBpbmRleCA4YzI2NmEwZjYxOTIuLmVjNGM2M2QyMTEy
ZCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9yZXN0cmljdGVkX2hl
YXAuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3Jlc3RyaWN0ZWRfaGVhcC5j
DQo+ID4gPiBAQCAtMTIsNiArMTIsMTAgQEANCj4gPiA+ICANCj4gPiA+ICAjaW5jbHVkZSAicmVz
dHJpY3RlZF9oZWFwLmgiDQo+ID4gPiAgDQo+ID4gPiArc3RydWN0IHJlc3RyaWN0ZWRfaGVhcF9h
dHRhY2htZW50IHsNCj4gPiA+ICtzdHJ1Y3Qgc2dfdGFibGUqdGFibGU7DQo+ID4gPiArfTsNCj4g
PiA+ICsNCj4gPiA+ICBzdGF0aWMgaW50DQo+ID4gPiAgcmVzdHJpY3RlZF9oZWFwX21lbW9yeV9h
bGxvY2F0ZShzdHJ1Y3QgcmVzdHJpY3RlZF9oZWFwICpoZWFwLA0KPiBzdHJ1Y3QgcmVzdHJpY3Rl
ZF9idWZmZXIgKmJ1ZikNCj4gPiA+ICB7DQo+ID4gPiBAQCAtNDUsNiArNDksMTA0IEBAIHJlc3Ry
aWN0ZWRfaGVhcF9tZW1vcnlfZnJlZShzdHJ1Y3QNCj4gcmVzdHJpY3RlZF9oZWFwICpoZWFwLCBz
dHJ1Y3QgcmVzdHJpY3RlZF9idWZmDQo+ID4gPiAgb3BzLT5tZW1vcnlfZnJlZShoZWFwLCBidWYp
Ow0KPiA+ID4gIH0NCj4gPiA+ICANCj4gPiA+ICtzdGF0aWMgaW50IHJlc3RyaWN0ZWRfaGVhcF9h
dHRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0DQo+IGRtYV9idWZfYXR0YWNobWVu
dCAqYXR0YWNobWVudCkNCj4gPiA+ICt7DQo+ID4gPiArc3RydWN0IHJlc3RyaWN0ZWRfYnVmZmVy
ICpyZXN0cmljdGVkX2J1ZiA9IGRtYWJ1Zi0+cHJpdjsNCj4gPiA+ICtzdHJ1Y3QgcmVzdHJpY3Rl
ZF9oZWFwX2F0dGFjaG1lbnQgKmE7DQo+ID4gPiArc3RydWN0IHNnX3RhYmxlICp0YWJsZTsNCj4g
PiA+ICtpbnQgcmV0Ow0KPiA+ID4gKw0KPiA+ID4gK2EgPSBremFsbG9jKHNpemVvZigqYSksIEdG
UF9LRVJORUwpOw0KPiA+ID4gK2lmICghYSkNCj4gPiA+ICtyZXR1cm4gLUVOT01FTTsNCj4gPiA+
ICsNCj4gPiA+ICt0YWJsZSA9IGt6YWxsb2Moc2l6ZW9mKCp0YWJsZSksIEdGUF9LRVJORUwpOw0K
PiA+ID4gK2lmICghdGFibGUpIHsNCj4gPiA+ICtyZXQgPSAtRU5PTUVNOw0KPiA+ID4gK2dvdG8g
ZXJyX2ZyZWVfYXR0YWNoOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICtyZXQgPSBzZ19hbGxv
Y190YWJsZSh0YWJsZSwgMSwgR0ZQX0tFUk5FTCk7DQo+ID4gPiAraWYgKHJldCkNCj4gPiA+ICtn
b3RvIGVycl9mcmVlX3NndDsNCj4gPiA+ICtzZ19zZXRfcGFnZSh0YWJsZS0+c2dsLCBOVUxMLCBy
ZXN0cmljdGVkX2J1Zi0+c2l6ZSwgMCk7DQo+ID4gDQo+ID4gU28gdGhpcyBpcyBkZWZpbml0ZWx5
IGJyb2tlbiBhbmQgdmlvbGF0aW5nIHRoZSBkbWEtYnVmIGFwaSBydWxlcy4NCj4gWW91DQo+ID4g
Y2Fubm90IGxldCBhdHRhY2ggc3VjY2VkIGFuZCBzdXBwbHkgYSBkdW1teS9pbnZhbGlkIHNnIHRh
YmxlLg0KPiA+IA0KPiA+IFR3byBvcHRpb25zOg0KPiA+IA0KPiA+IC0gUmVqZWN0IC0+YXR0YWNo
IGZvciBhbGwgdGhpcyBidWZmZXJzIHdpdGggLUVCVVNZIGFuZCBwcm92aWRlDQo+IGluc3RlYWQg
YQ0KPiA+ICAgcHJpdmF0ZSBhcGkgZm9yIHRoZXNlIHNlY3VyZSBidWZmZXJzLCBzaW1pbGFyIHRv
IGhvdw0KPiB2aXJ0aW9fZG1hX2J1ZiBoYXMNCj4gPiAgIHByaXZhdGUgdmlydG8tc3BlY2lmaWMg
YXBpcy4gVGhpcyBpbnRlcmZhY2Ugd291bGQgbmVlZCB0byBiZQ0KPiA+ICAgc3RhbmRhcmRpemVk
IGFjcm9zcyBhbGwgYXJtIFRFRSB1c2Vycywgc28gdGhhdCB3ZSBkb24ndCBoYXZlIGENCj4gPiAg
IGRpc2FzdHJvdXMgcHJvbGlmZXJhdGlvbiBvZiBhcGlzLg0KPiA+IA0KPiA+IC0gQWxsb3cgLT5h
dHRhY2gsIGJ1dCBfb25seV8gZm9yIGRyaXZlcnMvZGV2aWNlcyB3aGljaCBjYW4gYWNjZXNzDQo+
IHRoZQ0KPiA+ICAgc2VjdXJlIGJ1ZmZlciBjb3JyZWN0bHksIGFuZCBvbmx5IGlmIHlvdSBjYW4g
cHV0IHRoZSByaWdodCBzZWN1cmUNCj4gYnVmZmVyDQo+ID4gICBhZGRyZXNzIGludG8gdGhlIHNn
IHRhYmxlIGRpcmVjdGx5LiBJZiBkbWEgdG8gYSBzZWN1cmUgYnVmZmVyIGZvcg0KPiBhDQo+ID4g
ICBnaXZlbiBzdHJ1Y3QgZGV2aWNlICogd2lsbCBub3Qgd29yayBjb3JyZWN0bHkgKGkuZS4gd2l0
aG91dCBkYXRhDQo+ID4gICBjb3JydXB0aW9uKSwgeW91IF9tdXN0XyByZWplY3QgdGhlIGF0dGFj
aCBhdHRlbXB0IHdpdGggLUVCVVNZLg0KPiA+IA0KPiA+IFRoZSAybmQgYXBwcm9hY2ggd291bGQg
YmUgbXkgcHJlZmVycmVkIG9uZSwgaWYgaXQncyB0ZWNobmljYWxseQ0KPiBwb3NzaWJsZS4NCj4g
PiANCj4gPiBBbHNvIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBhcm0gVEVFIGlzIHN0YW5kYXJk
aXplZCwgc28gSSB0aGluaw0KPiB3ZSdsbCBhdA0KPiA+IGxlYXN0IHdhbnQgc29tZSBhY2tzIGZy
b20gb3RoZXIgc29jIHBlb3BsZSB3aGV0aGVyIHRoaXMgd2lsbCB3b3JrDQo+IGZvciB0aGVtDQo+
ID4gdG9vLg0KPiA+IA0KPiA+IEZpbmFsbHkgdGhlIHVzdWFsIGRyaWxsOg0KPiA+IC0gdGhpcyBh
bHNvIG5lZWRzIHRoZSBkcml2ZXIgc2lkZSBzdXBwb3J0LCBpZiB0aGVyZSdzIGFueSBjaGFuZ2Vz
DQo+IG5lZWRlZC4NCj4gPiAgIEp1c3QgdGhlIG5ldyBoZWFwIGlzbid0IGVub3VnaC4NCj4gDQo+
IE9rIEkgcXVpY2tseSBzY3JvbGxlZCB0aHJvdWdoIHlvdXIgZHJtIHBhdGNoZXMgYW5kIHRoYXQg
Y29uZmlybXMgdGhhdA0KPiB0aGUNCj4gY3VycmVudCBkbWEtYnVmIGludGVyZmFjZSB5b3UncmUg
aW1wbGVtZW50aW5nIGlzIGp1c3QgY29tcGxldGVseQ0KPiBicmVha2luZw0KPiB0aGUgYXBpLiBB
bmQgeW91IG5lZWQgdG8gcGFwZXIgb3ZlciB0aGF0IHdpbGwgYWxsIGtpbmRzIG9mIHZlcnkgaWNr
eQ0KPiBzcGVjaWFsLWNhc2luZy4NCj4gDQo+IFNvIGRlZmluaXRlbHkgbmVlZCB0byByZXRoaW5r
IHRoZSBvdmVyYWxsIGRlc2lnbiBiZXR3ZWVuIGRtYS1idWYNCj4gaGVhcHMgYW5kDQo+IGRyaXZl
cnMgaGVyZS4NCg0KSGksDQoNClRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHRoZSByZXZpZXcsIGFuZCBz
b3JyeSBmb3IgcmVwbHkgc28gbGF0ZS4gIFdlDQpyZWNvbnN0cnVjdGVkIG91ciBURUUgY29tbWFu
ZHMgc28gdGhhdCB0aGUga2VybmVsIGNhbiBvYnRhaW4gdGhlIHZhbGlkDQpQQS9wYWdlcywgdGhl
biB0aGUgc2cgb3BlcmF0aW9ucyBjYW4gcnVuIG5vcm1hbGx5LiANCg0KSSB3aWxsIHNlbmQgdGhl
IG5leHQgdmVyc2lvbi4NClRoYW5rcy4NCg0KPiAtU2ltYQ0KPiANCj4gPiAtIGFuZCBmb3IgZHJt
IHlvdSBuZWVkIG9wZW4gdXNlcnNwYWNlIGZvciB0aGlzLiBEb2Vzbid0IGhhdmUgdG8gYmUNCj4g
dGhlDQo+ID4gICBmdWxsIGNvbnRlbnQgcHJvdGVjdGlvbiBkZWNvZGUgcGlwZWxpbmUsIHRoZSBk
cml2ZXJzIGluIGRybSB0aGF0DQo+IGxhbmRlZA0KPiA+ICAgc2VjdXJlIGJ1ZmZlciBzdXBwb3J0
IHRodXMgZmFyIGVuYWJsZWQgaXQgdXNpbmcgdGhlDQo+ID4gICBFR0xfRVhUX3Byb3RlY3RlZF9j
b250ZW50IGV4dGVuc2lvbiB1c2luZyBnbCwgd2hpY2ggc2lkZSBzdGVwcw0KPiBhbGwgdGhlDQo+
ID4gICBjb21wbGljYXRpb25zIGFyb3VuZCBjb250ZW50IGRlY3J5cHRpb24ga2V5cyBhbmQgc3Vw
cG9ydA0KPiA+IA0KPiA+IENoZWVycywgU2ltYQ0KPiA+IA0KPiA+ID4gKw0KPiA+ID4gK2EtPnRh
YmxlID0gdGFibGU7DQo+ID4gPiArYXR0YWNobWVudC0+cHJpdiA9IGE7DQo+ID4gPiArDQo+ID4g
PiArcmV0dXJuIDA7DQo+ID4gPiArDQo+ID4gPiArZXJyX2ZyZWVfc2d0Og0KPiA+ID4gK2tmcmVl
KHRhYmxlKTsNCj4gPiA+ICtlcnJfZnJlZV9hdHRhY2g6DQo+ID4gPiAra2ZyZWUoYSk7DQo+ID4g
PiArcmV0dXJuIHJldDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQgcmVz
dHJpY3RlZF9oZWFwX2RldGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLA0KPiBzdHJ1Y3QgZG1h
X2J1Zl9hdHRhY2htZW50ICphdHRhY2htZW50KQ0KPiA+ID4gK3sNCj4gPiA+ICtzdHJ1Y3QgcmVz
dHJpY3RlZF9oZWFwX2F0dGFjaG1lbnQgKmEgPSBhdHRhY2htZW50LT5wcml2Ow0KPiA+ID4gKw0K
PiA+ID4gK3NnX2ZyZWVfdGFibGUoYS0+dGFibGUpOw0KPiA+ID4gK2tmcmVlKGEtPnRhYmxlKTsN
Cj4gPiA+ICtrZnJlZShhKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHN0cnVj
dCBzZ190YWJsZSAqDQo+ID4gPiArcmVzdHJpY3RlZF9oZWFwX21hcF9kbWFfYnVmKHN0cnVjdCBk
bWFfYnVmX2F0dGFjaG1lbnQNCj4gKmF0dGFjaG1lbnQsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9u
IGRpcmVjdCkNCj4gPiA+ICt7DQo+ID4gPiArc3RydWN0IHJlc3RyaWN0ZWRfaGVhcF9hdHRhY2ht
ZW50ICphID0gYXR0YWNobWVudC0+cHJpdjsNCj4gPiA+ICtzdHJ1Y3Qgc2dfdGFibGUgKnRhYmxl
ID0gYS0+dGFibGU7DQo+ID4gPiArDQo+ID4gPiArcmV0dXJuIHRhYmxlOw0KPiA+ID4gK30NCj4g
PiA+ICsNCj4gPiA+ICtzdGF0aWMgdm9pZA0KPiA+ID4gK3Jlc3RyaWN0ZWRfaGVhcF91bm1hcF9k
bWFfYnVmKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQNCj4gKmF0dGFjaG1lbnQsIHN0cnVjdCBz
Z190YWJsZSAqdGFibGUsDQo+ID4gPiArICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGly
ZWN0aW9uKQ0KPiA+ID4gK3sNCj4gPiA+ICtzdHJ1Y3QgcmVzdHJpY3RlZF9oZWFwX2F0dGFjaG1l
bnQgKmEgPSBhdHRhY2htZW50LT5wcml2Ow0KPiA+ID4gKw0KPiA+ID4gK1dBUk5fT04oYS0+dGFi
bGUgIT0gdGFibGUpOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgaW50DQo+ID4g
PiArcmVzdHJpY3RlZF9oZWFwX2RtYV9idWZfYmVnaW5fY3B1X2FjY2VzcyhzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLA0KPiBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pDQo+ID4gPiAr
ew0KPiA+ID4gK3JldHVybiAtRVBFUk07DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gK3N0YXRp
YyBpbnQNCj4gPiA+ICtyZXN0cmljdGVkX2hlYXBfZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcyhzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmLA0KPiBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24p
DQo+ID4gPiArew0KPiA+ID4gK3JldHVybiAtRVBFUk07DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+
ID4gK3N0YXRpYyBpbnQgcmVzdHJpY3RlZF9oZWFwX2RtYV9idWZfbW1hcChzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLA0KPiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gPiA+ICt7DQo+ID4g
PiArcmV0dXJuIC1FUEVSTTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQg
cmVzdHJpY3RlZF9oZWFwX2ZyZWUoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikNCj4gPiA+ICt7DQo+
ID4gPiArc3RydWN0IHJlc3RyaWN0ZWRfYnVmZmVyICpyZXN0cmljdGVkX2J1ZiA9IGRtYWJ1Zi0+
cHJpdjsNCj4gPiA+ICtzdHJ1Y3QgcmVzdHJpY3RlZF9oZWFwICpoZWFwID0NCj4gZG1hX2hlYXBf
Z2V0X2RydmRhdGEocmVzdHJpY3RlZF9idWYtPmhlYXApOw0KPiA+ID4gKw0KPiA+ID4gK3Jlc3Ry
aWN0ZWRfaGVhcF9tZW1vcnlfZnJlZShoZWFwLCByZXN0cmljdGVkX2J1Zik7DQo+ID4gPiAra2Zy
ZWUocmVzdHJpY3RlZF9idWYpOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGRtYV9idWZfb3BzIHJlc3RyaWN0ZWRfaGVhcF9idWZfb3BzID0gew0KPiA+ID4g
Ky5hdHRhY2g9IHJlc3RyaWN0ZWRfaGVhcF9hdHRhY2gsDQo+ID4gPiArLmRldGFjaD0gcmVzdHJp
Y3RlZF9oZWFwX2RldGFjaCwNCj4gPiA+ICsubWFwX2RtYV9idWY9IHJlc3RyaWN0ZWRfaGVhcF9t
YXBfZG1hX2J1ZiwNCj4gPiA+ICsudW5tYXBfZG1hX2J1Zj0gcmVzdHJpY3RlZF9oZWFwX3VubWFw
X2RtYV9idWYsDQo+ID4gPiArLmJlZ2luX2NwdV9hY2Nlc3MgPSByZXN0cmljdGVkX2hlYXBfZG1h
X2J1Zl9iZWdpbl9jcHVfYWNjZXNzLA0KPiA+ID4gKy5lbmRfY3B1X2FjY2Vzcz0gcmVzdHJpY3Rl
ZF9oZWFwX2RtYV9idWZfZW5kX2NwdV9hY2Nlc3MsDQo+ID4gPiArLm1tYXA9IHJlc3RyaWN0ZWRf
aGVhcF9kbWFfYnVmX21tYXAsDQo+ID4gPiArLnJlbGVhc2U9IHJlc3RyaWN0ZWRfaGVhcF9mcmVl
LA0KPiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiAgc3RhdGljIHN0cnVjdCBkbWFfYnVmICoNCj4g
PiA+ICByZXN0cmljdGVkX2hlYXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLCB1bnNp
Z25lZCBsb25nDQo+IHNpemUsDQo+ID4gPiAgIHVuc2lnbmVkIGxvbmcgZmRfZmxhZ3MsIHVuc2ln
bmVkIGxvbmcgaGVhcF9mbGFncykNCj4gPiA+IEBAIC02Niw2ICsxNjgsNyBAQCByZXN0cmljdGVk
X2hlYXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwDQo+ICpoZWFwLCB1bnNpZ25lZCBsb25nIHNp
emUsDQo+ID4gPiAgaWYgKHJldCkNCj4gPiA+ICBnb3RvIGVycl9mcmVlX2J1ZjsNCj4gPiA+ICBl
eHBfaW5mby5leHBfbmFtZSA9IGRtYV9oZWFwX2dldF9uYW1lKGhlYXApOw0KPiA+ID4gK2V4cF9p
bmZvLm9wcyA9ICZyZXN0cmljdGVkX2hlYXBfYnVmX29wczsNCj4gPiA+ICBleHBfaW5mby5zaXpl
ID0gcmVzdHJpY3RlZF9idWYtPnNpemU7DQo+ID4gPiAgZXhwX2luZm8uZmxhZ3MgPSBmZF9mbGFn
czsNCj4gPiA+ICBleHBfaW5mby5wcml2ID0gcmVzdHJpY3RlZF9idWY7DQo+ID4gPiAtLSANCj4g
PiA+IDIuMjUuMQ0KPiA+ID4gDQo+ID4gDQo+ID4gLS0gDQo+ID4gRGFuaWVsIFZldHRlcg0KPiA+
IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+IGh0dHA6Ly9ibG9nLmZm
d2xsLmNoDQo+IA0K
