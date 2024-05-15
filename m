Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1F8C603C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 07:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1D910E09A;
	Wed, 15 May 2024 05:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="nVgWrQo+";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rKczmjQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA2410E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 05:43:27 +0000 (UTC)
X-UUID: 0a4a02c8127e11efb92737409a0e9459-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pvAHpDK2dCg2C/jH0moLcIgg2ApZJrFHALAsOhBhMoU=; 
 b=nVgWrQo+L3Jn2ZOmdOZyTSu55dcbim3wtbQVIl2B6pL5TTgjLbdSPou/xQaxV1YxosUchgRgZoWPextr/gwi8eO250zYh0NmB7AQHqfo2ulgCdZguhBUDpvHvcrC7uuKcgTuHzgrzrbvn8ZxMnCSPDJBI9WSzz5k8wHIaTml/qs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:e4084995-8ed7-4733-9a56-63b239d736f0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:9b23df83-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0a4a02c8127e11efb92737409a0e9459-20240515
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1215154843; Wed, 15 May 2024 13:43:21 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 13:43:19 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 13:43:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC/gfFNrEElx0E75DkeE2dAieeGq1ZAUR8fiEFh90ThskkSPsviMMkcmyQ5a/uabmoELO95cwjfoRBL6ofnPRLBFXNVvc76e/6Y9VYkmY9WCv+qXp81YxYsbeQjVTVDW0Sgb97xVQOvH8lEs2n4+BgFriUpTnuiuuZjj3NEk8RtvjMnOU99o98Op7+VXIMtcMb9hBatqkdLsVB4q89FSMmb4MBV7vYH/jvEwLAdw8jZ+hUmfv+XtHyJFw24fImU1o1stkWV2eC3GUlpF8Joct5+cxekGTDE6ZU7qzLXiKbFW0IRwpJR3vSmVucy2LXYUxGCNO1bF3Yux/ZHCHzZ/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvAHpDK2dCg2C/jH0moLcIgg2ApZJrFHALAsOhBhMoU=;
 b=X9/k3ffd/5OYNov9cdCxClgeJkV8dLVLnyfd1lgFLUIXAKQ+6fu9vSAz0DDgan/AeEDoHbfFgriHM87FvmQ+tnFNPlQLZjYnjph3EzjuJjNi0rKWzwfA/uz/nB+8gRzQAITdtzkqZ5kDj2le53H26YQ3oj9nmXw+UR9Y+l92l0IO7MC21S64uKtqNBJDkkTQLH4qN8Fbx1uJ+GRw3vN4a2VP6xURZehpz5DZmDIyD1Lv7hj8SRAty8PjVQGRzYK8aVLdZNFrZgHYEij8INbwgmuz3NmT7IO3rrHPdIctG9cmaZ+xdiTXKtvS9+hGScLXaSPyxN2kEowN4Y4csbSWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvAHpDK2dCg2C/jH0moLcIgg2ApZJrFHALAsOhBhMoU=;
 b=rKczmjQfhWtG6VGRVA5glmrbr9O5ejwt6IwFfiZolWqfmpkqNyY6sAO7SvI5MN5+1fCdRYlV4Qk3ZLmcGIEOxhKBQC1vMLmQSMGw3yKW8hh19xkeTp4GidamTZ4n+7QO5P7zGnMIe6fqzGs9lht65HPZ+JyKIpH5/PnNDu7rYAk=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 KL1PR03MB8161.apcprd03.prod.outlook.com (2603:1096:820:ff::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.25; Wed, 15 May 2024 05:43:18 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%4]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 05:43:18 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "joakim.bech@linaro.org" <joakim.bech@linaro.org>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jstultz@google.com"
 <jstultz@google.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "quic_vjitta@quicinc.com"
 <quic_vjitta@quicinc.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?=
 <kuohong.wang@mediatek.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "contact@emersion.fr"
 <contact@emersion.fr>, "jkardatzke@google.com" <jkardatzke@google.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>, "tjmercier@google.com"
 <tjmercier@google.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
Thread-Topic: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap
 ops
Thread-Index: AQHaRTi35ticVAOxfE2Wwt+Him4V07D0D1yAgKR7xIA=
Date: Wed, 15 May 2024 05:43:17 +0000
Message-ID: <3e2dc2f248cf159a53c927eeb164967ad3b3c09d.camel@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
 <20240112092014.23999-4-yong.wu@mediatek.com>
 <20240131135343.rj6xlch6zcev2v47@pop-os.localdomain>
In-Reply-To: <20240131135343.rj6xlch6zcev2v47@pop-os.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|KL1PR03MB8161:EE_
x-ms-office365-filtering-correlation-id: 3202b9a1-abe8-4157-250c-08dc74a1ec24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|1800799015|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?TC9zTmJpM01yNytoUzVSdzJuOU1PVm9rV1lmTVU5VmsvQ3JwZXNrbDFTZ1Vj?=
 =?utf-8?B?Y2F0WERhMEJ4YTJmKyt5VEp3cXhrTkcwdGlhbmlpRVAwcTlNM1NjYStUOVIz?=
 =?utf-8?B?L3BqbWlCN3lpSjNoTythaFZpMnBSdTdCUUw5c0ZoMURkSVZRUW9FV3RSZ2l2?=
 =?utf-8?B?dzlSeFhmUTlObmhMb3RQeWhncER4SVo1UUVDZDFkeTl4Y3VSVFo2aHdJUCs0?=
 =?utf-8?B?Si9uaUo4OEJuQ3lUSW9vOStmRXFEVDZSc0V6bDFKSHl5MFllNll1UkFuOGV5?=
 =?utf-8?B?MjF3eHBIbE1VZDI2K3Uya0RTUTJMMnBMQUpLRDZqT1pKR3l3Nlc4cHpYNGlB?=
 =?utf-8?B?eDRpZDY3TlRkMzZhcDRrVkR0ZmRUdG5teFBjWkl6ZmVVMlZaMjl0eTAzQVZL?=
 =?utf-8?B?UytoVHg0ZnJ2OW5RTFFpbXpQSXNJYllKSTA4c1lKTVRYbjNUVzEwQ2RZb0sw?=
 =?utf-8?B?eVE1a1RqTldyTVg1V1hLTnA2ejZFMXVFWWZFc3ZsWXhFNFgwT0tKVE1adCt6?=
 =?utf-8?B?aEYxTVZ1cU5WalhLUUwvTGFIQzNlYmZkWGU3cXhleXhOOHNUcG02UjVkaVJI?=
 =?utf-8?B?WFZBRHdDMEprQlRzSlVvYzYwaXp2N2lZL3RkNjNlU0h5ZlFTS1hZdGR3Y0lI?=
 =?utf-8?B?enNhZkdpK2FlREJyT0g1RUg3VGw3Z1h0Ulg0cU01REtqZlh6bE1MVWl1Y0lW?=
 =?utf-8?B?V2kwODhublNmeFFWdFl0VXowOU5RcUNaZE5XRlB4UXVtaE5RS1krQzlpMVpu?=
 =?utf-8?B?OFV0T0VDVUJnS0NoT2pOWWtEbkgyc1B3SnJXa21oS1FnVWwxVEV4UER5akdD?=
 =?utf-8?B?NGIzdmlWbDVONjZDSFlhbldaeHUvcjQ2emsyenkwRHJuTFdNdXlhN1FhRm15?=
 =?utf-8?B?aUdHcHBsYU9YdWhtZmtueTRsK1JvR1BJZWs1Rk5ZYWdrd094U3UwT2FsYlNY?=
 =?utf-8?B?VlhUUUJDNURmdTFtT0JmNyt0R1RGeWFlQ0g1QVZqc3NSeEpDTFZmSU9YQzh1?=
 =?utf-8?B?MkxwcDNycmt4ZHA2QldWU25UWjNuWDlXb1JuZU1hbDNNcmNmenhzMEIxbWgx?=
 =?utf-8?B?SlVVTDkvemtQK3FvZkZvL0J0Z2hpNmpRVWh0SENER0pjL01ocTFnZFdQUnY1?=
 =?utf-8?B?WHQ5a1Q2Undqa3lqU21nTmVwdUJSVUFQZW9nMXZuQk1vd3FMd2hwT0pHcnlj?=
 =?utf-8?B?eVJxcTJkMHdiUFFOeElycTFmcmZNUVBPRGs1bGVGem44T3REVDNHUnpxUUh6?=
 =?utf-8?B?Q1VDMWV3RFBhVU5iaVRPMG8ybUpHckVzdDJlR1oyQ0FPakczTUZlOWJjYVI0?=
 =?utf-8?B?RGo5Wm5EeXFSRGdoUkpLYUc0OGJGaUZQeXRSZEU0TjZBWHNwWitjMTA2NU1i?=
 =?utf-8?B?amhXSTRRY0Rzc0RHVlI4OGM4emFhSnBxUVc0NDZVb1R0T0FDbVJSRnA4VHgr?=
 =?utf-8?B?cnlwTXJ4ME0rSW9wcFRRMW9nZUc4ZStuVkdvT2dPWHNqV1hJV2tZWm16N2sv?=
 =?utf-8?B?YnF0aHJYWEU2S2JNSDUvcksxaFpwZmo2L2lBRFdLaHNrcnN1L2RvbWVhWXpR?=
 =?utf-8?B?THIwQWRzMFhDektWZ1FNcUdqbnZTYmJDbFUrVnFORit6Uzl6WUYrMWVPaER3?=
 =?utf-8?B?TllKUUk3VDFJNi9KeFdEVDB6SXQ4dmVxL00zY2UvZmRLb3B4eGVPR0NtMlNu?=
 =?utf-8?B?U284RGhkRzJsZTI3Tk8zMmxlNmFiTFh0VXA2OVJMWm8zS3dyTEtObFNyN0t3?=
 =?utf-8?B?RktxVk1rWUFXMDdYSExqY1hBYWhNaEtLOUNHWUpzUXZuZHFuOU1tRTgwbWlv?=
 =?utf-8?B?Mnp0WmhsUUZJbHRXTlkyUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFNyVlE5RnBramhVbXZNb085SDdRMm03S1ZsS0V1WVZPM2d0dFlLa2pPMFVU?=
 =?utf-8?B?bEQ0eElHdGZyWTNxQUplMEpvK2ZsZkdVVnhrTG5oTzNjTHhoNG1TVWV4TUFF?=
 =?utf-8?B?bU5DZE0vaDRqYUg1c0xlaE1QMUZBQkdPcXNwMWZWbTI3ejFDWmFmREc1ditS?=
 =?utf-8?B?VVFaQnE4TGRDeDg5VGZmU1NQOUlGL0Q3cGc1L1pobTh1YjBzRGlDU1EvQjFu?=
 =?utf-8?B?bWRDVE5SY1htQ2lnMU1McExzTXFxclMzV3lYd0JmN2hqTVZMeFJTcVVpMlBZ?=
 =?utf-8?B?YmsrQUpZVnlSKzdOTDJROTRQRkZ3N011c25GNFBGVEhHcVYyQkJSNFRKZ0Rk?=
 =?utf-8?B?aklYd1k3V3JQa240STZoQVZJdm95dUp0L1dzR2FZTTJBeXN0ZDZ1bHAzZjUz?=
 =?utf-8?B?VlhnYldrc0xUNXpNM040bCtUU3dJc1RoWUphVEY2Q1oxa1ZQYlZobEJ5aVRJ?=
 =?utf-8?B?ZTd4eFJVY0U2MjczNC9nVDNWaVlad3lNSGNid3Y0empjMU9uV055RHBSMGty?=
 =?utf-8?B?SlV3V1ZHM1Q1UVVGKzczQktqOW9OTzZGZUdHdmRoOVN4eG5wVG1XaGR4Qmc2?=
 =?utf-8?B?dFlqMnlseXJPY1hwRUNxNkcza1VjM2h2bUx0VzF0aGJrOTIrRWFnVlJZcDRy?=
 =?utf-8?B?cnBydWk4Q2QzYVRsZFZodjh1K3F6MUJMTGdzY2wzSm5pNUZpcmFtaUdIOUxu?=
 =?utf-8?B?MnMzWXJDOVJPbFpsNFNyRlJxMnlIODBSWEJqM0hvRXk0Ym5USUVkTjJjcTNX?=
 =?utf-8?B?YnNNTlY1SnRET0pYc2hNYzI3Y3czYWdZaUw1THNhQzBxMVVjL1hLVXAyWCtU?=
 =?utf-8?B?MUI4SmtQSU5WZTV3VVE0UVV6aG9oV3dFTllrUFFuOFZYT2dGeTFJUGYwK1Z4?=
 =?utf-8?B?TWlUR1h2TFhMN3VzSXBXempZNGRGZDhhNzdoeUN2S1ZFYXdMSW51ZTV4TXZZ?=
 =?utf-8?B?SmMvUWVEMWl1SC9SMUJLZTF2NndSMnhPSVdiV3hMM2gzUDgxVWY0anRSdVhS?=
 =?utf-8?B?bTZQRlJISmhFcEdrMEF6WFJSR2wveHROWWpmK3M2UTF5c2Y3TTJhN3RGcG1w?=
 =?utf-8?B?cmlyWEFVT1B2RXpHdjdTTC9KRDRCVHJuOGQxdU1XN0kyUXpDUkM2b0ZBc3ZG?=
 =?utf-8?B?UUxvNUF0U0tlTHNYRkhmSE5vaEhWajJaaTF1TFFXQUpnNGNMNy9NRVJtUDNX?=
 =?utf-8?B?TnhQQ1hHWXhXZlpsYTdjZ2pXTnJTMDg1ZWExaVVNNm1icldiMmNsdnVaaGVr?=
 =?utf-8?B?WHhSTWZ4SERlaCtwNVN2Y3ZjVVRqNVBSaU1OL2VOVE1NaUpOdU16ZmNYd0V0?=
 =?utf-8?B?N0FsY1h6QUpLbUoyVmVVeFJzNDUxcVBFL3VFT0tjcXQyZ3g0eFZuOFArZ2hG?=
 =?utf-8?B?WUkyQTFFeVNEcnNwVEp4cTJRZFpCaFpqb2F3UkNiYjFqQ3VFbktQSURFLzNm?=
 =?utf-8?B?a3BYVFppeWQ2NnZNUW1MSk9RTnc0MTdaaituVTRRVkNhNGgzSmltK2xuVHk3?=
 =?utf-8?B?ZzFPcHM5aVN5OG9sK3FhZkV4dzlIVVZ2R0NWQ2JXbFZWRTFDR0JHeUR1SmZY?=
 =?utf-8?B?SlN5RWxwQnlJVmVEUWhHeFkwTmwvUnFLMENvRGQ1V0l2Y2tjQjc4THptUGZG?=
 =?utf-8?B?dmV6ZlY4TzN5NE9DWWEwK1ZTNGR5YTJ6RGVRRW9VcmpmdWRtOE9YaHZaWkg3?=
 =?utf-8?B?WTdSRjVYVUhVcWNnaW9vbTlxcnp1Wk1qbUM5NW9TeHU1Qk1aS2duZFBrbGRa?=
 =?utf-8?B?RDk1NGVmdSszbGp6R0YrZ0NVMk5sdkhjVW9scFIwZFlFSlEwaWI5L1BpTVRM?=
 =?utf-8?B?dnd3b1YrVXI5amdkZWxxSU1OQWlmME9VOW5XeGlTWkozUmhsdWEwaWx6cVlQ?=
 =?utf-8?B?TnJnbTQrMXpXZ3VKajFvMHpUczk5bHlkUWxSeWRUS2xDWUhvMVl6eHhXS2Vt?=
 =?utf-8?B?YkpVNk9LWXJSMTdIMWI1VEJCWTNOV0d6aitNZzJBZnUwZUF4b3MvUklSeFRw?=
 =?utf-8?B?bzJScjJiME5CVGlPcmdHOFo2aVVTeVU0MGorNy9NU1phZndRWnE3RHNETWpP?=
 =?utf-8?B?YjhYVXBXYzhCeXlyaFRwcG5aVy9XcVRSQXI5cm83ZHlOVjdmQitIMzBod0dr?=
 =?utf-8?B?MWtvQ1JjbTg3bERUOERQRW5LS1lKSUE4VTltbktGSHd2QnR0V245QkVQZmdM?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1E8F459FC1F5440B715C60599D3F1F4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3202b9a1-abe8-4157-250c-08dc74a1ec24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 05:43:17.9848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: El7F2d2NLnQSK79tXnYKRIk1m5YN3zvktWpjADVbnSkkecWNlozb9u5y9VOAeBQFaNXZIQ7lsskJZY5W/oPXLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8161
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--24.686000-8.000000
X-TMASE-MatchedRID: bo3l66eN8rbUL3YCMmnG4lt3XMydUaMXbbJe5V+4LlINcckEPxfz2DEU
 xl1gE1bkfdd9BtGlLLzx1uczIHKx54/qvvWxLCnegOqr/r0d+Cx+Mk6ACsw4JlwpnAAvAwaz5Qz
 lrvDXtyo9UqwAbdENgi6e1ADIRJCJF0rpaZ47th+Td7CJ8bYw077VXHusOfivNSweOixQAJJTuA
 Q+5yzMZ04W7yyyPEbztGsOD3P/3l3Qf/Mt4GBfbxIMDPFEv6UxWDdWpJMntKju6Fkg4cyCElq76
 7Z30NK4inSSFrOeQHLwmzALiKoiasvTk9bUe4riSHCU59h5KrGBHKTJ+sfXGYKwF4K/wIz9+Mzd
 OXklDHpRQOInRU3DTQrGcD6+dJT6wy6Tx10F8nXmAId+2bAQwkMYMp0ANFh56+6mfxThVmUHNZC
 oVB2xSL+4M5eHvRGV816p3ZU0neE9Xb7STHV7tbMjW/sniEQKoA9Le8XJpbpZxWTX4+l5tgHVre
 bjgv4S4vM1YF6AJbY9l7H+TFQgdbew1twePJJB3QfwsVk0UbuAUC1moT5enH7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--24.686000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0F4BC343CAA1C6F5956E178EF951512D7F2459E8939F8FBC5179339559E340FC2000:8
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

SGkgSm9ha2ltLA0KDQpTb3JyeSBmb3IgcmVwbHkgc28gbGF0ZS4NCg0KT24gV2VkLCAyMDI0LTAx
LTMxIGF0IDE0OjUzICswMTAwLCBKb2FraW0gQmVjaCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFs
IGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
dGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBP
biBGcmksIEphbiAxMiwgMjAyNCBhdCAwNToyMDoxMFBNICswODAwLCBZb25nIFd1IHdyb3RlOg0K
PiA+IEFkZCAic3RydWN0IHJlc3RyaWN0ZWRfaGVhcF9vcHMiLiBGb3IgdGhlIHJlc3RyaWN0ZWQg
bWVtb3J5LA0KPiB0b3RhbGx5IHRoZXJlDQo+ID4gYXJlIHR3byBzdGVwczoNCj4gPiBhKSBtZW1v
cnlfYWxsb2M6IEFsbG9jYXRlIHRoZSBidWZmZXIgaW4ga2VybmVsOw0KPiA+IGIpIG1lbW9yeV9y
ZXN0cmljdDogUmVzdHJpY3QvUHJvdGVjdC9TZWN1cmUgdGhhdCBidWZmZXIuDQo+ID4gVGhlIG1l
bW9yeV9hbGxvYyBpcyBtYW5kYXRvcnkgd2hpbGUgbWVtb3J5X3Jlc3RyaWN0IGlzIG9wdGluYWwN
Cj4gc2luY2UgaXQgbWF5DQo+ID4NCj4gcy9vcHRpbmFsL29wdGlvbmFsLw0KDQpXaWxsIEZpeC4N
Cg0KPiANCj4gPiBiZSBwYXJ0IG9mIG1lbW9yeV9hbGxvYy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL3Jlc3RyaWN0ZWRfaGVhcC5jIHwgNDENCj4gKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPiA+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvcmVzdHJpY3RlZF9oZWFwLmgg
fCAxMiArKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBz
L3Jlc3RyaWN0ZWRfaGVhcC5jIGIvZHJpdmVycy9kbWEtDQo+IGJ1Zi9oZWFwcy9yZXN0cmljdGVk
X2hlYXAuYw0KPiA+IGluZGV4IGZkN2M4MmFiZDQyZS4uOGMyNjZhMGY2MTkyIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9yZXN0cmljdGVkX2hlYXAuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9yZXN0cmljdGVkX2hlYXAuYw0KPiA+IEBAIC0xMiwxMCAr
MTIsNDQgQEANCj4gPiAgDQo+ID4gICNpbmNsdWRlICJyZXN0cmljdGVkX2hlYXAuaCINCj4gPiAg
DQo+ID4gK3N0YXRpYyBpbnQNCj4gPiArcmVzdHJpY3RlZF9oZWFwX21lbW9yeV9hbGxvY2F0ZShz
dHJ1Y3QgcmVzdHJpY3RlZF9oZWFwICpoZWFwLA0KPiBzdHJ1Y3QgcmVzdHJpY3RlZF9idWZmZXIg
KmJ1ZikNCj4gPiArew0KPiA+ICtjb25zdCBzdHJ1Y3QgcmVzdHJpY3RlZF9oZWFwX29wcyAqb3Bz
ID0gaGVhcC0+b3BzOw0KPiA+ICtpbnQgcmV0Ow0KPiA+ICsNCj4gPiArcmV0ID0gb3BzLT5tZW1v
cnlfYWxsb2MoaGVhcCwgYnVmKTsNCj4gPiAraWYgKHJldCkNCj4gPiArcmV0dXJuIHJldDsNCj4g
PiArDQo+ID4gK2lmIChvcHMtPm1lbW9yeV9yZXN0cmljdCkgew0KPiA+ICtyZXQgPSBvcHMtPm1l
bW9yeV9yZXN0cmljdChoZWFwLCBidWYpOw0KPiA+ICtpZiAocmV0KQ0KPiA+ICtnb3RvIG1lbW9y
eV9mcmVlOw0KPiA+ICt9DQo+ID4gK3JldHVybiAwOw0KPiA+ICsNCj4gPiArbWVtb3J5X2ZyZWU6
DQo+ID4gK29wcy0+bWVtb3J5X2ZyZWUoaGVhcCwgYnVmKTsNCj4gPiArcmV0dXJuIHJldDsNCj4g
PiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQNCj4gPiArcmVzdHJpY3RlZF9oZWFwX21lbW9y
eV9mcmVlKHN0cnVjdCByZXN0cmljdGVkX2hlYXAgKmhlYXAsIHN0cnVjdA0KPiByZXN0cmljdGVk
X2J1ZmZlciAqYnVmKQ0KPiA+ICt7DQo+ID4gK2NvbnN0IHN0cnVjdCByZXN0cmljdGVkX2hlYXBf
b3BzICpvcHMgPSBoZWFwLT5vcHM7DQo+ID4gKw0KPiA+ICtpZiAob3BzLT5tZW1vcnlfdW5yZXN0
cmljdCkNCj4gPiArb3BzLT5tZW1vcnlfdW5yZXN0cmljdChoZWFwLCBidWYpOw0KPiA+ICsNCj4g
PiArb3BzLT5tZW1vcnlfZnJlZShoZWFwLCBidWYpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0
aWMgc3RydWN0IGRtYV9idWYgKg0KPiA+ICByZXN0cmljdGVkX2hlYXBfYWxsb2NhdGUoc3RydWN0
IGRtYV9oZWFwICpoZWFwLCB1bnNpZ25lZCBsb25nDQo+IHNpemUsDQo+ID4gICB1bnNpZ25lZCBs
b25nIGZkX2ZsYWdzLCB1bnNpZ25lZCBsb25nIGhlYXBfZmxhZ3MpDQo+ID4gIHsNCj4gPiArc3Ry
dWN0IHJlc3RyaWN0ZWRfaGVhcCAqcmVzdHJpY3RlZF9oZWFwID0NCj4gZG1hX2hlYXBfZ2V0X2Ry
dmRhdGEoaGVhcCk7DQo+ID4gIHN0cnVjdCByZXN0cmljdGVkX2J1ZmZlciAqcmVzdHJpY3RlZF9i
dWY7DQo+ID4gIERFRklORV9ETUFfQlVGX0VYUE9SVF9JTkZPKGV4cF9pbmZvKTsNCj4gPiAgc3Ry
dWN0IGRtYV9idWYgKmRtYWJ1ZjsNCj4gPiBAQCAtMjgsNiArNjIsOSBAQCByZXN0cmljdGVkX2hl
YXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLA0KPiB1bnNpZ25lZCBsb25nIHNpemUs
DQo+ID4gIHJlc3RyaWN0ZWRfYnVmLT5zaXplID0gQUxJR04oc2l6ZSwgUEFHRV9TSVpFKTsNCj4g
PiAgcmVzdHJpY3RlZF9idWYtPmhlYXAgPSBoZWFwOw0KPiA+ICANCj4gPiArcmV0ID0gcmVzdHJp
Y3RlZF9oZWFwX21lbW9yeV9hbGxvY2F0ZShyZXN0cmljdGVkX2hlYXAsDQo+IHJlc3RyaWN0ZWRf
YnVmKTsNCj4gPg0KPiBDYW4gd2UgZ3VhcmFudGVlIHRoYXQgInJlc3RyaWN0ZWRfaGVhcCIgaGVy
ZSBpc24ndCBOVUxMIChpLmUuLCBoZWFwLQ0KPiA+cHJpdikuIElmDQo+IG5vdCBwZXJoYXBzIHdl
IHNob3VsZCBjb25zaWRlciBhZGRpbmcgYSBjaGVjayBmb3IgTlVMTCBpbiB0aGUNCj4gcmVzdHJp
Y3RlZF9oZWFwX21lbW9yeV9hbGxvY2F0ZSgpIGZ1bmN0aW9uPw0KDQpoZWFwLT5wcml2IGFsd2F5
cyBpcyBzZXQgd2hlbiBkbWFfaGVhcF9hZGQgaXMgY2FsbGVkLiBTdXBwb3NlIGhlYXAtDQo+cHJp
diBpcyBOVUxMLCB0aGUgS0Ugd291bGQgaGF2ZSBhbHJlYWR5IGJlZW4gb2NjdXJyZWQgaW4NCnJl
c3RyaWN0ZWRfaGVhcF9hZGQuIEkgZG9uJ3QgdGhpbmsgaXQgY2FuIGJlIE5VTEwuIGlzIGl0IHJp
Z2h0Pw0KDQo+IA0KPiA+ICtpZiAocmV0KQ0KPiA+ICtnb3RvIGVycl9mcmVlX2J1ZjsNCj4gPiAg
ZXhwX2luZm8uZXhwX25hbWUgPSBkbWFfaGVhcF9nZXRfbmFtZShoZWFwKTsNCj4gPiAgZXhwX2lu
Zm8uc2l6ZSA9IHJlc3RyaWN0ZWRfYnVmLT5zaXplOw0KPiA+ICBleHBfaW5mby5mbGFncyA9IGZk
X2ZsYWdzOw0KPiA+IEBAIC0zNiwxMSArNzMsMTMgQEAgcmVzdHJpY3RlZF9oZWFwX2FsbG9jYXRl
KHN0cnVjdCBkbWFfaGVhcCAqaGVhcCwNCj4gdW5zaWduZWQgbG9uZyBzaXplLA0KPiA+ICBkbWFi
dWYgPSBkbWFfYnVmX2V4cG9ydCgmZXhwX2luZm8pOw0KPiA+ICBpZiAoSVNfRVJSKGRtYWJ1Zikp
IHsNCj4gPiAgcmV0ID0gUFRSX0VSUihkbWFidWYpOw0KPiA+IC1nb3RvIGVycl9mcmVlX2J1ZjsN
Cj4gPiArZ290byBlcnJfZnJlZV9yZXN0cmljdGVkX21lbTsNCj4gPiAgfQ0KPiA+ICANCj4gPiAg
cmV0dXJuIGRtYWJ1ZjsNCj4gPiAgDQo+ID4gK2Vycl9mcmVlX3Jlc3RyaWN0ZWRfbWVtOg0KPiA+
ICtyZXN0cmljdGVkX2hlYXBfbWVtb3J5X2ZyZWUocmVzdHJpY3RlZF9oZWFwLCByZXN0cmljdGVk
X2J1Zik7DQo+ID4gIGVycl9mcmVlX2J1ZjoNCj4gPiAga2ZyZWUocmVzdHJpY3RlZF9idWYpOw0K
PiA+ICByZXR1cm4gRVJSX1BUUihyZXQpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvcmVzdHJpY3RlZF9oZWFwLmggYi9kcml2ZXJzL2RtYS0NCj4gYnVmL2hlYXBzL3Jl
c3RyaWN0ZWRfaGVhcC5oDQo+ID4gaW5kZXggNDQzMDI4ZjZiYTNiLi5kZGVhZjk4MDU3MDggMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3Jlc3RyaWN0ZWRfaGVhcC5oDQo+
ID4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3Jlc3RyaWN0ZWRfaGVhcC5oDQo+ID4gQEAg
LTE1LDYgKzE1LDE4IEBAIHN0cnVjdCByZXN0cmljdGVkX2J1ZmZlciB7DQo+ID4gIA0KPiA+ICBz
dHJ1Y3QgcmVzdHJpY3RlZF9oZWFwIHsNCj4gPiAgY29uc3QgY2hhcipuYW1lOw0KPiA+ICsNCj4g
PiArY29uc3Qgc3RydWN0IHJlc3RyaWN0ZWRfaGVhcF9vcHMgKm9wczsNCj4gPiArfTsNCj4gPiAr
DQo+ID4gK3N0cnVjdCByZXN0cmljdGVkX2hlYXBfb3BzIHsNCj4gPg0KPiBUaGlzIGhhdmUgdGhl
IHNhbWUgbmFtZSBhcyB1c2VkIGZvciB0aGUgZG1hX2hlYXBfb3BzIGluIHRoZSBmaWxlDQo+IHJl
c3RyaWN0ZWRfaGVhcC5jLCB0aGlzIG1pZ2h0IGJlIGEgbGl0dGxlIGJpdCBjb25mdXNpbmcsIG9y
Pw0KDQpUaGFua3MgdmVyeSBtdWNoLiBJIHJlYWxseSBkaWRuJ3Qgbm90aWNlIHRoaXMuIEkgd2ls
bCByZW5hbWUgaXQuDQoNCj4gDQo+ID4gK2ludCgqaGVhcF9pbml0KShzdHJ1Y3QgcmVzdHJpY3Rl
ZF9oZWFwICpoZWFwKTsNCj4gPiArDQo+ID4gK2ludCgqbWVtb3J5X2FsbG9jKShzdHJ1Y3QgcmVz
dHJpY3RlZF9oZWFwICpoZWFwLCBzdHJ1Y3QNCj4gcmVzdHJpY3RlZF9idWZmZXIgKmJ1Zik7DQo+
ID4gK3ZvaWQoKm1lbW9yeV9mcmVlKShzdHJ1Y3QgcmVzdHJpY3RlZF9oZWFwICpoZWFwLCBzdHJ1
Y3QNCj4gcmVzdHJpY3RlZF9idWZmZXIgKmJ1Zik7DQo+ID4gKw0KPiA+ICtpbnQoKm1lbW9yeV9y
ZXN0cmljdCkoc3RydWN0IHJlc3RyaWN0ZWRfaGVhcCAqaGVhcCwgc3RydWN0DQo+IHJlc3RyaWN0
ZWRfYnVmZmVyICpidWYpOw0KPiA+ICt2b2lkKCptZW1vcnlfdW5yZXN0cmljdCkoc3RydWN0IHJl
c3RyaWN0ZWRfaGVhcCAqaGVhcCwgc3RydWN0DQo+IHJlc3RyaWN0ZWRfYnVmZmVyICpidWYpOw0K
PiA+DQo+IElzIHRoZSBwcmVmaXggIm1lbW9yeV8iIHN1cGVyZmx1b3VzIGhlcmUgaW4gdGhlc2Ug
b3BzPw0KDQpJIHdpbGwgcmVtb3ZlICJtZW1vcnlfIi4gIEJ1dCBpdCBsb29rcyBsaWtlIHRoZSAi
cmVzdHJpY3QiIGlzIGENCmtleXdvcmQsIEkgY2FuJ3QgdXNlIGl0IG9yIGl0IHdpbGwgYnVpbGQg
ZmFpbC4gVGhlcmVmb3JlIEkgcGxhbiB0byB1c2UNCmFsbG9jL2ZyZWUvcmVzdHJpY3RfYnVmL3Vu
cmVzdHJpY3RfYnVmIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gQWxzbyByZWxhdGVkIHRvIGEg
Y29tbWVudCBvbiB0aGUgcHJpb3IgcGF0Y2guIFRoZSBuYW1lIGhlcmUgaXMgImhlYXAiDQo+IGZv
cg0KPiByZXN0cmljdGVkX2hlYXAsIGJ1dCBiZWxvdyB5b3UgdXNlIHJzdHJkX2hlYXAuIEl0J3Mg
dGhlIHNhbWUgc3RydWN0LA0KPiBzbyBJIHdvdWxkDQo+IGFkdmlzZSB0byB1c2UgdGhlIHNhbWUg
bmFtZSB0byBhdm9pZCBjb25mdXNpb24gd2hlbiByZWFkaW5nIHRoZSBjb2RlLg0KPiBBcw0KPiBt
ZW50aW9uZWQgYmVmb3JlLCBJIHRoaW5rIHRoZSBuYW1lICJyaGVhcCIgd291bGQgYmUgYSBnb29k
IGNob2ljZS4NCg0KSSB3aWxsIHVzZSAicmhlYXAiIHRvIHJlcGxhY2UgZXZlcnl3aGVyZS4NCg0K
VGhhbmtzLg0KDQo+IA0KPiA+ICB9Ow0KPiA+ICANCj4gPiAgaW50IHJlc3RyaWN0ZWRfaGVhcF9h
ZGQoc3RydWN0IHJlc3RyaWN0ZWRfaGVhcCAqcnN0cmRfaGVhcCk7DQo+ID4gLS0gDQo+ID4gMi4y
NS4xDQo+ID4gDQo+IA0KPiAtLSANCj4gLy8gUmVnYXJkcw0KPiBKb2FraW0NCg==
