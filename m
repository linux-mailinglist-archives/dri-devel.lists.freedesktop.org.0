Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA627A4779
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 12:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E9B10E04E;
	Mon, 18 Sep 2023 10:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE8110E04E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 10:47:09 +0000 (UTC)
X-UUID: b32b3860561011eea33bb35ae8d461a2-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=2MqPHU/zn8Ud/XLOpmFvCwck3invK4ut+YCNurSJ4WM=; 
 b=CAt8SrNbfrFip6Xyprwi3qm8xpxkyn3tccXzFFUzo9zTE9dLtFSqPa650OZ+m8cvBPbqc+JXyGk/aEqxtyTu3MctOCH4AL8kuqbLkOHmxzW/s9gFNNcuVsqP1N7lLSSd4VxBpmKVhXugzgA9BUZjpvjoazZ8J4drFPSyCOaFYzs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:6e0c5582-58bd-481a-82c9-dd04a7b5359f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:f2a628c3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b32b3860561011eea33bb35ae8d461a2-20230918
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1095601228; Mon, 18 Sep 2023 18:47:02 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 18:47:01 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 18:47:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejiwu4C/L4W7KeY0KP+1C6HmqxjTsyYqwmFQmM7mgva8z2I62UfO2jHwah+u+XwTwzlcJ8gw1iUJdmSjjIj4o3HrHl4rLLHfnVyx4lfBdbqaOZmvxSQZqo6IJeRQirie2HPn1KOnu2QluWbmEZXXaADe/mf5GrXVQ6oAzZ/8fCMm+DtJH1Fq/8G0dO2zYBpcFlTk6jrP1xFykCEB+wRaUB+jJLIeXBssA2M7D0U6/YSsJWHfDa9dZmfv/jrHDxA8PBRs/dZyb0XJtUaOUDv4eiwDB0O3NeuuzeBzrQATKI/g/iNDKygy4viD/b8tHox5NJN1RNapznjC4ctYozY8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MqPHU/zn8Ud/XLOpmFvCwck3invK4ut+YCNurSJ4WM=;
 b=MllpA4jGl+ACgv6k2OjiLMHc0V7i89SilnlTGscXnun39/aFh5qT4xlv2AzT2ChN2jHZGdEBaFtCuMnryn7dedleWQUnT8yF6FPP2K4YPMhhWZ88zZxM+Ocl8Kal4H5oe5Movuy1sUQuotD5IG89cY+RI4gRZ9ztx19FMhX8A/7gLWwY8MKrUf8ltqeNBQi2GfZWxddE2Jd1lrVcWOZ30vZwqdw+vbzpOhXzoq2mo+j8anvNALyrjaJwkPz8mO+4v9I0Hfw88C6aJ16/xZlmrSl/A12gwpOOd/CjmeAPW7GLUEgmXZ7uBo2MZZ+W/0f5701P7Gic4+VTFv9rbiiAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MqPHU/zn8Ud/XLOpmFvCwck3invK4ut+YCNurSJ4WM=;
 b=TautwjDuHniXKntKE9+UktOWIjbPbw67JWcBbvSI+CtQzBiIdy1DkS2LTJGrGCA8WzWMksifhVZyPHL7+YqBO0AUT/vZXWWE1gctf6HQkMBbVpqhag2XFH1oqjlJQvxGb84I9HPQMAE7Kn7mjUOsuYJcurYEEIaCckllcGiXnwQ=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYSPR03MB7881.apcprd03.prod.outlook.com (2603:1096:400:482::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.24; Mon, 18 Sep 2023 10:46:59 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 10:46:58 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "nicolas@ndufresne.ca"
 <nicolas@ndufresne.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
Thread-Topic: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel
 drivers can allocate dmabufs from specific heaps
Thread-Index: AQHZ5FgOSAh5MZm7Ik69mQtVpHaxabAVzMeAgAEV/ACAAGm2gIAJJbqA
Date: Mon, 18 Sep 2023 10:46:58 +0000
Message-ID: <e991a548a16e8a40c68eedc860ce78c2013aace6.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-4-yong.wu@mediatek.com>
 <827b859e3ff8176ef0b18c29bc17481b4105e368.camel@ndufresne.ca>
 <8e795311ff93c7a336eb688818f055c5c569741e.camel@mediatek.com>
 <d15067b12571f8868925aace9dc84473cd74ec1f.camel@ndufresne.ca>
In-Reply-To: <d15067b12571f8868925aace9dc84473cd74ec1f.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYSPR03MB7881:EE_
x-ms-office365-filtering-correlation-id: b71bdd59-8805-4fa9-94f9-08dbb8349545
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dy+ZGQIl1ai2CHPrxM1McsnqzTRWBVXy9rvbZOL4PrfmPPUe83CLZYXYZmsj89lxdbLTaBUgKnBdKlfF02gq5qBwQwxvhpnlPx7c71irb5IgneIrm2/6CretJsnSTqHP6BN/fA9JdGZRt0oPSnmXe8g62KSeIr0Ye/kPPy4z/JhmpIU6HxP3Yqi9Y4OsPS+FU/xtmVfS+VnqhLouBzRC0qkAbFa7S/3vj8hD+VlrzzvYWbIJNpbwynMbgk0/4eu+WW4fT5zuW4dv17KTi1CkOEDA1uEEsUVLxZbBgKlB+f9PGZnCzkWVSYrmH1lMkTXB9OzPslzhuaxfZZix/AYTyhJlKYaBGyQ5dNPd71E4DTtpip9kuPKjc/PiLoqptvL+xzEWetjLFDY6+Pw9rTQzPPEYy1bHWmqUkDxoRNE4tJapYldmBNgCS37ofMQej5oq+27tFrPdzu6YGcAHc3PbSx/IKuC7G83ujU5pcSatQDAa3uvwngdrxlTi5s7J7PADUJujpjkK1E+1V543u1hgcda+1Ziu0b8rMoZ1y8j2iN6Mke4iS1MqbBxrh5LspHivwl3D9HtpLH80C2p6vnvJ/jskmoT+rWISiHnmF97s4WlYdLtkndcnAJZ9nLlQoTK+04vlP+HQ4ZG7DTe0xaIWkq5KzdmDimwaslHGnGSLsO4eSMwAgdP2PFCV5oTO7gYS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(186009)(1800799009)(451199024)(316002)(8936002)(4326008)(8676002)(41300700001)(26005)(2616005)(83380400001)(66476007)(6512007)(478600001)(6506007)(85182001)(6486002)(36756003)(71200400001)(86362001)(122000001)(38070700005)(38100700002)(66574015)(110136005)(91956017)(76116006)(64756008)(54906003)(66446008)(66556008)(66946007)(2906002)(5660300002)(7416002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0hCM1RtdU10L3NJdWRFcS84SVRhVmluK1M4VnY5ZmRxbGFBdnBKeFQ3ME53?=
 =?utf-8?B?WGFkaVZlZi9MY250cUhDZXBnYmZsOWVrM0ZXNk5BSmkycFNEYnFORnN4d3ZJ?=
 =?utf-8?B?L09mSG9jY0w2dnN2ZGZCZERiY3lwNGgwamJUYVBFZy90VjlqbHZoc1A1cklE?=
 =?utf-8?B?Nk92WVRKSFFlZjBCN1F2a3IzU1ZiRTdjTUxEY3NWcm95VlhEb0tUR2tXOUsv?=
 =?utf-8?B?aDk5Nk11SmhKOTFpdU4yYW1ZaDdXZzNiTG1xL3NSMDJMYWw3cjk4ckx5QVI2?=
 =?utf-8?B?TDBoZVJPcHRRenQ1TitLZHhjUDBIdVVSb0NIM0V3YnBRVTVBYklFd0pQNmpI?=
 =?utf-8?B?NGhIUFBmbTBONUtveldKQUI5LzVWL2RDRTQ1TUtaSnUwaGNFd0VVNHRNWVZV?=
 =?utf-8?B?RnR1djlzZjRWdG5ndjlKWFMxclAyN2RJQWJ0WjdmYWZZL1oyMTdQVU9UV212?=
 =?utf-8?B?RWd5dEhjZjNRTUVBQUV6Y2FJTFdTWWJWMG9sSXBNeFlBVEluSTlVQmdqUUdE?=
 =?utf-8?B?OXZua0F2VmZQN1o1d2pLaUJVNGNyT3hVOXBaRjcveE5kV0IrRVlyS0g2WkZQ?=
 =?utf-8?B?TTE5UURqQ3dHT0JqQWRFQW9weWxRVWdrT1g4YVEyUlVrdW9FTDVORmtoL29L?=
 =?utf-8?B?NWZqUjdzdmNQZG5wQmpaVElHeU5HbVJNM01lM2VRZW8xcEZ1VzlhUUNPemt4?=
 =?utf-8?B?dDhKcHhYV3YrMnFmc2JGeU9ZcVNoWGtjWUx1NDAwa0xHVXRjZU5ZdkFGNmlD?=
 =?utf-8?B?Q3VVUkRzOTk5eDBTNjBDdUNzc1BkL0w5NDgwcFlaNVRXaG1lWStUWDhjVTYw?=
 =?utf-8?B?TUNHRmpGOFBHMkJBcHpIRDlPWGl3NGNFWFNOQ1hhak5vL1hLNlVVUUo4OUsv?=
 =?utf-8?B?aXBBOHNmcFhmN3Nld1J3dHBpWHBGRDhCOWZwYkV2cjlkR0VhWkVBQ2Zwd3Q2?=
 =?utf-8?B?cDJaVXlZb0RaUzdIUFlmcmJaaVBicU1mWGJId0NUa091SjlOWFA5V0ZMRVpL?=
 =?utf-8?B?SzhGYVgwMjU0d29XczRNNDdQWU5uaHVuVHZiR1VEQUNUeitJQXZlYXFhOEFG?=
 =?utf-8?B?Ykd2amVLMGFjUVBSbTNhN0theWFtK1liVDkvVHVyZmFoeFhGd3MzVjRUemJn?=
 =?utf-8?B?VjYzdG1DQ0hYUUl0R0p0RjhDemt4UTVrWEU2VkNwUmF0OFF4a3ZNNHM3a3BI?=
 =?utf-8?B?RE5jQU9Nd1djZ1hadVMvRVd5MTIvRmd1R0U1UnA0andaZkduVU5TQ3dmZHNC?=
 =?utf-8?B?cEFoUDkvQWlzT2d2QWRPa3VNcFB4NTN0K1V6Umlnamk2V2MvVVd3UnlFTlcw?=
 =?utf-8?B?aFF5SGNiT1ArMjRHMm54eDh6dWNmaWxkZnRNNm8xUUtFZ1RjN1FxWnUyQU1V?=
 =?utf-8?B?eS9abGMzR2IrWEVqSktaN2lPbFF3eHF0Y3pyTGZvVkdZTWlqT0hIMVBXSkk0?=
 =?utf-8?B?WDd5Zk16MkFqbVhyT3NyY2RGMk1NZ1hZdExDNktKOFNwREMzQTVFYzhXdUVR?=
 =?utf-8?B?V25ZTlh0cVAvUzY0cUk3TG9EZmtPaVNIVUg1TlRnb1dRalNGSnV4cW96SE93?=
 =?utf-8?B?QnN6ZGw3cmlQM3VVaTlCSVZsaDRjN21sNFRYMXlRelJJQm9vZDdMa00rWndJ?=
 =?utf-8?B?MUV3NGtsNk5PcFhncFZ0Yy83U2dkVTB4ZW1hRkNsTmpIS0o1UU1oVzY5K2xr?=
 =?utf-8?B?dlZiOHVqb1VtYUJpS1JyZE1tZE10OU80TkxOWjltNVgvK0ZTVFJtZjRoWDNT?=
 =?utf-8?B?dCtvVmk4OGpjUk0xeS9ZM3hKYk1XcWQ3S1Y0dHh1N1BMY1VRMkRkdmdiYWNq?=
 =?utf-8?B?cUlZdU8zUlNhUzZOWkRTNUgrK3BIbVQvR1hSWFdMRVd5WVpSOFJ4ZUhSK1Zs?=
 =?utf-8?B?bCsyTUVtZ2pEUncyckJjNDVMWGRsRXRjNTVjdEFhZ2xnbnM4YzQyRWpObjJ0?=
 =?utf-8?B?bnBtQkJNZUxXVThKMHBQUTd6bWc5YUVjeU4xMXBGeUJLV241R0x4WGhOeW5F?=
 =?utf-8?B?Vm1ZR00vQUVPUTIzNDgzR2Y1dVRBOWRjUUlTeGVON2RBNEl6MFFaWnl0NnB6?=
 =?utf-8?B?V3hWdUp5Z0M2cURvZzF5ZmFhOVlYM0dNUXB3TjVDUG5TNGtudEVFMGNIRFZi?=
 =?utf-8?Q?WFnydQEx9iYqb8joEUOMqpljp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3825D18FD523894E9C782CE6C7A6E986@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71bdd59-8805-4fa9-94f9-08dbb8349545
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 10:46:58.5197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weNy0FtqaMUaioy45AO5W9fheRCDk2BWOScpO7TnyDWpyLL/GuerKPI24n9XJgozPEJ6KfE3j7XzAeruLOeW9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7881
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--37.169800-8.000000
X-TMASE-MatchedRID: EpAKQ3/s2vnUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2t3tJaKJZJX/VAq6/y5AEOOtvpj5+dNlQvLOx
 C6suyQ8a3TQE1hd7P2AY4ukDrG+XlzpFIpbxp7n24jAucHcCqnShRWQHuJ8me/k12Sb2MaHnuc/
 n71nc6Da7+d6Fd+0xWt43B5J96WnlC9qEX7ASCsb0dPFETpBAHqQ9UezeTkTgKA2OoGAlTk8VJI
 RTDvqF7I85AAY8dYvvYVjTEv2zPIaV+SUdLT6ob7TLIvnWov9EXRHoL/W4Y6kS/boWSGMtdrqHM
 1KIOYyjkn6SkMwS8XegqGV6KStbQ4vZjlIwkBi9c/msUC5wFQUGtrAxy5ENO2e73tJcoE9iigM5
 Qnp17hfMTFlTKF7n7+jiS4agxuA5HOh+HtZFlz4QnnAFRgjn9esw8RnBRGwqHwGEm+CpYGTIZWP
 TEEfeGzCI8XB2Ya3PZ+h2E+tDSpjTYzAgtAkN3ydRP56yRRA8pWss5kPUFdNr4gfya+A9U9P1gJ
 OQHwksnJUwaj3uuxFijcb6u/Gs1eg57/0k0nqaeAiCmPx4NwMFrpUbb72MU1B0Hk1Q1KyLUZxEA
 lFPo8/cUt5lc1lLgtT4piLWpY7p+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--37.169800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C3EFC3A1BD7A02134CDABF6460D30E29FA45B50893AB39CE7D205AD01420F8142000:8
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
Cc: "jkardatzke@google.com" <jkardatzke@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDExOjA1IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIExlIG1hcmRpIDEyIHNlcHRlbWJyZSAyMDIzIMOgIDA4OjQ3ICsw
MDAwLCBZb25nIFd1ICjlkLTli4cpIGEgw6ljcml0IDoNCj4gPiBPbiBNb24sIDIwMjMtMDktMTEg
YXQgMTI6MTIgLTA0MDAsIE5pY29sYXMgRHVmcmVzbmUgd3JvdGU6DQo+ID4gPiAgIA0KPiA+ID4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMNCj4gdW50aWwNCj4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ID4gPiAgSGksDQo+ID4gPiANCj4gPiA+IExlIGx1bmRpIDExIHNlcHRlbWJy
ZSAyMDIzIMOgIDEwOjMwICswODAwLCBZb25nIFd1IGEgw6ljcml0IDoNCj4gPiA+ID4gRnJvbTog
Sm9obiBTdHVsdHogPGpzdHVsdHpAZ29vZ2xlLmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMg
YWxsb3dzIGRyaXZlcnMgd2hvIGRvbid0IHdhbnQgdG8gY3JlYXRlIHRoZWlyIG93bg0KPiA+ID4g
PiBETUEtQlVGIGV4cG9ydGVyIHRvIGJlIGFibGUgdG8gYWxsb2NhdGUgRE1BLUJVRnMgZGlyZWN0
bHkNCj4gPiA+ID4gZnJvbSBleGlzdGluZyBETUEtQlVGIEhlYXBzLg0KPiA+ID4gPiANCj4gPiA+
ID4gVGhlcmUgaXMgc29tZSBjb25jZXJuIHRoYXQgdGhlIHByZW1pc2Ugb2YgRE1BLUJVRiBoZWFw
cyBpcw0KPiA+ID4gPiB0aGF0IHVzZXJsYW5kIGtub3dzIGJldHRlciBhYm91dCB3aGF0IHR5cGUg
b2YgaGVhcCBtZW1vcnkNCj4gPiA+ID4gaXMgbmVlZGVkIGZvciBhIHBpcGVsaW5lLCBzbyBpdCB3
b3VsZCBsaWtlbHkgYmUgYmVzdCBmb3INCj4gPiA+ID4gZHJpdmVycyB0byBpbXBvcnQgYW5kIGZp
bGwgRE1BLUJVRnMgYWxsb2NhdGVkIGJ5IHVzZXJsYW5kDQo+ID4gPiA+IGluc3RlYWQgb2YgYWxs
b2NhdGluZyBvbmUgdGhlbXNlbHZlcywgYnV0IHRoaXMgaXMgc3RpbGwNCj4gPiA+ID4gdXAgZm9y
IGRlYmF0ZS4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBXb3VsZCBiZSBuaWNlIGZvciB0aGUgcmV2
aWV3ZXJzIHRvIHByb3ZpZGUgdGhlIGluZm9ybWF0aW9uIGFib3V0DQo+IHRoZQ0KPiA+ID4gdXNl
ciBvZg0KPiA+ID4gdGhpcyBuZXcgaW4ta2VybmVsIEFQSS4gSSBub3RpY2VkIGl0IGJlY2F1c2Ug
SSB3YXMgQ0NlZCwgYnV0DQo+ID4gPiBzdHJhbmdlbHkgaXQgZGlkbid0DQo+ID4gPiBtYWtlIGl0
IHRvIHRoZSBtYWlsaW5nIGxpc3QgeWV0IGFuZCBpdHMgbm90IGNsZWFyIGluIHRoZSBjb3Zlcg0K
PiB3aGF0DQo+ID4gPiB0aGlzIGlzIHVzZWQNCj4gPiA+IHdpdGguIA0KPiA+ID4gDQo+ID4gPiBJ
IGNhbiBleHBsYWluIGluIG15IHdvcmRzIHRob3VnaCwgbXkgcmVhZCBpcyB0aGF0IHRoaXMgaXMg
dXNlZCB0bw0KPiA+ID4gYWxsb2NhdGUgYm90aA0KPiA+ID4gdXNlciB2aXNpYmxlIGFuZCBkcml2
ZXIgaW50ZXJuYWwgbWVtb3J5IHNlZ21lbnRzIGluIE1USyBWQ09ERUMNCj4gPiA+IGRyaXZlci4N
Cj4gPiA+IA0KPiA+ID4gSSdtIHNvbWV3aGF0IGNvbmNlcm5lZCB0aGF0IERNQUJ1ZiBvYmplY3Rz
IGFyZSB1c2VkIHRvIGFic3RyYWN0DQo+ID4gPiBzZWN1cmUgbWVtb3J5DQo+ID4gPiBhbGxvY2F0
aW9uIGZyb20gdGVlLiBGb3IgZnJhbWVidWZmZXJzIHRoYXQgYXJlIGdvaW5nIHRvIGJlDQo+IGV4
cG9ydGVkDQo+ID4gPiBhbmQgc2hhcmVkDQo+ID4gPiBpdHMgcHJvYmFibHkgZmFpciB1c2UsIGJ1
dCBpdCBzZWVtcyB0aGF0IGludGVybmFsIHNoYXJlZCBtZW1vcnkNCj4gYW5kDQo+ID4gPiBjb2Rl
Yw0KPiA+ID4gc3BlY2lmaWMgcmVmZXJlbmNlIGJ1ZmZlcnMgYWxzbyBlbmR1cCB3aXRoIGEgZG1h
YnVmIGZkIChvZnRlbg0KPiBjYWxsZWQNCj4gPiA+IGEgc2VjdXJlIGZkDQo+ID4gPiBpbiB0aGUg
djRsMiBwYXRjaHNldCkgZm9yIGRhdGEgdGhhdCBpcyBub3QgYmVpbmcgc2hhcmVkLCBhbmQNCj4g
cmVxdWlyZXMNCj4gPiA+IGEgMToxDQo+ID4gPiBtYXBwaW5nIHRvIGEgdGVlIGhhbmRsZSBhbnl3
YXkuIElzIHRoYXQgdGhlIGRlc2lnbiB3ZSdkIGxpa2UgdG8NCj4gPiA+IGZvbGxvdyA/IA0KPiA+
IA0KPiA+IFllcy4gYmFzaWNhbGx5IHRoaXMgaXMgcmlnaHQuDQo+ID4gDQo+ID4gPiBDYW4ndA0K
PiA+ID4gd2UgZGlyZWN0bHkgYWxsb2NhdGUgZnJvbSB0aGUgdGVlLCBhZGRpbmcgbmVlZGVkIGhl
bHBlciB0byBtYWtlDQo+IHRoaXMNCj4gPiA+IGFzIHNpbXBsZQ0KPiA+ID4gYXMgYWxsb2NhdGlu
ZyBmcm9tIGEgSEVBUCA/DQo+ID4gDQo+ID4gSWYgdGhpcyBoYXBwZW5zLCB0aGUgbWVtb3J5IHdp
bGwgYWx3YXlzIGJlIGluc2lkZSBURUUuIEhlcmUgd2UNCj4gY3JlYXRlIGENCj4gPiBuZXcgX0NN
QSBoZWFwLCBpdCB3aWxsIGNtYV9hbGxvYy9mcmVlIGR5bmFtaWNhbGx5LiBSZXNlcnZlIGl0DQo+
IGJlZm9yZQ0KPiA+IFNWUCBzdGFydCwgYW5kIHJlbGVhc2UgdG8ga2VybmVsIGFmdGVyIFNWUCBk
b25lLg0KPiANCj4gT2ssIEkgc2VlIHRoZSBiZW5lZml0IG9mIGhhdmluZyBhIGNvbW1vbiBkcml2
ZXIgdGhlbi4gSXQgd291bGQgYWRkIHRvDQo+IHRoZQ0KPiBjb21wbGV4aXR5LCBidXQgaGF2aW5n
IGEgZHJpdmVyIGZvciB0aGUgdGVlIGFsbG9jYXRvciBhbmQgdjRsMi9oZWFwcw0KPiB3b3VsZCBi
ZQ0KPiBhbm90aGVyIG9wdGlvbj8NCg0KSXQncyBvayBmb3IgdjRsMi4gQnV0IG91ciBEUk0gYWxz
byB1c2UgdGhpcyBuZXcgaGVhcCBhbmQgaXQgd2lsbCBiZQ0Kc2VudCB1cHN0cmVhbSBpbiB0aGUg
bmV4dCBmZXcgZGF5cy4NCg0KPiANCj4gPiAgIA0KPiA+IFNlY29uZGx5LiB0aGUgdjRsMi9kcm0g
aGFzIHRoZSBtYXR1cmUgZHJpdmVyIGNvbnRyb2wgZmxvdywgbGlrZQ0KPiA+IGRybV9nZW1fcHJp
bWVfaW1wb3J0X2RldiB0aGF0IGFsd2F5cyB1c2UgZG1hX2J1ZiBvcHMuIFNvIHdlIGNhbiB1c2UN
Cj4gdGhlDQo+ID4gY3VycmVudCBmbG93IGFzIG11Y2ggYXMgcG9zc2libGUgd2l0aG91dCBoYXZp
bmcgdG8gcmUtcGxhbiBhIGZsb3cNCj4gaW4NCj4gPiB0aGUgVEVFLg0KPiANCj4gRnJvbSB3aGF0
IEkndmUgcmVhZCBmcm9tIFl1bmZlaSBzZXJpZXMsIHRoaXMgaXMgb25seSBwYXJ0aWFsbHkgdHJ1
ZQ0KPiBmb3IgVjRMMi4NCj4gVGhlIHZiMiBxdWV1ZSBNTUFQIGZlYXR1cmUgaGF2ZSBkbWFidWYg
ZXhwb3J0YXRpb24gYXMgb3B0aW9uYWwsIGJ1dA0KPiBpdHMgbm90IGENCj4gcHJvYmxlbSB0byBh
bHdheXMgYmFjayBpdCB1cCB3aXRoIGEgZG1hYnVmIG9iamVjdC4gQnV0IGZvciBpbnRlcm5hbA0K
PiBTSE0gYnVmZmVycw0KPiB1c2VkIGZvciBmaXJtd2FyZSBjb21tdW5pY2F0aW9uLCBJJ3ZlIG5l
dmVyIHNlZW4gYW55IGRyaXZlciB1c2UgYQ0KPiBETUFCdWYuDQo+IA0KPiBTYW1lIGFwcGxpZXMg
Zm9yIHByaW1hcnkgZGVjb2RlIGJ1ZmZlcnMgd2hlbiBmcmFtZSBidWZmZXIgY29tcHJlc3Npb24N
Cj4gb3IgcG9zdC0NCj4gcHJvY2Vzc2luZyBpdCB1c2VkIChvciByZWNvbnN0cnVjdGlvbiBidWZm
ZXIgaW4gZW5jb2RlcnMpLCB0aGVzZSBhcmUNCj4gbm90IHVzZXINCj4gdmlzaWJsZSBhbmQgYXJl
IHVzdWFsbHkgbm90IERNQUJ1Zi4NCg0KSWYgdGhleSBhcmVuJ3QgZG1hYnVmLCBvZiBjb3Vyc2Ug
aXQgaXMgb2suIEkgZ3Vlc3Mgd2UgaGF2ZW4ndCB1c2VkDQp0aGVzZS4gVGhlIFNITSBidWZmZXIg
aXMgZ290IGJ5IHRlZV9zaG1fcmVnaXN0ZXJfa2VybmVsX2J1ZiBpbiB0aGlzDQpjYXNlIGFuZCB3
ZSBqdXN0IHVzZSB0aGUgZXhpc3RlZCBkbWFidWYgb3BzIHRvIGNvbXBsZXRlIFNWUC4NCg0KSW4g
b3VyIGNhc2UsIHRoZSB2Y29kZWMgaW5wdXQvb3V0cHV0L3dvcmtpbmcgYnVmZmVycyBhbmQgRFJN
IGlucHV0DQpidWZmZXIgYWxsIHVzZSB0aGlzIG5ldyBzZWN1cmUgaGVhcCBkdXJpbmcgc2VjdXJl
IHZpZGVvIHBsYXkuDQoNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+IE5pY29sYXMNCj4gPiA+IA0K
PiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpzdHVsdHpAZ29v
Z2xlLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVC5KLiBNZXJjaWVyIDx0am1lcmNpZXJA
Z29vZ2xlLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRp
YXRlay5jb20+DQo+ID4gPiA+IFtZb25nOiBGaXggdGhlIGNoZWNrcGF0Y2ggYWxpZ25tZW50IHdh
cm5pbmddDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMg
fCA2MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IC0tLS0NCj4gPiA+IC0tLS0tLQ0K
PiA+ID4gPiAgaW5jbHVkZS9saW51eC9kbWEtaGVhcC5oICAgfCAyNSArKysrKysrKysrKysrKysr
DQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQ0KPiA+ID4gPiANCj4gPiBbc25pcF0NCj4gDQo=
