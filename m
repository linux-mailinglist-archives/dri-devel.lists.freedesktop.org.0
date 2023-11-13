Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941B7E96B5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 07:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ED810E07D;
	Mon, 13 Nov 2023 06:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FCB10E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 06:37:25 +0000 (UTC)
X-UUID: 180e01ae81ef11ee8051498923ad61e6-20231113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7/cDFz8daL0+HbvAFgtGnRav/S6t1IgZ4JezatEACec=; 
 b=agQ142QKrI8Is+2YLklskt+QfGjo2ZDYF4b8msO6RGjkZ5XLj4u4170XFTU8jrQU0l/hHk8ApjK0C9/H3PINU0xT5yQ2wTIVRN+sibd5dIKgsCGVXGLnqAHRfYrTgejH0V7liutgYNoVnSZQAlI8W7fpt1dPe+gFrFk83JbkXbk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:0bd2bcf5-fc3e-4366-9368-75ffb7ecad4b, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:364b77b, CLOUDID:eacb75fc-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 180e01ae81ef11ee8051498923ad61e6-20231113
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 415747343; Mon, 13 Nov 2023 14:37:19 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 Nov 2023 14:37:18 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 Nov 2023 14:37:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keJD+wVqTiWxsZ0l7tEJDgv/8I+xAcvZSixg+lpTkG9rAGM8tBnRHmNGyYYUZ6+CUPhZad6mrGwqWpjueB+3sS1JslQvuBGzGTssLvLfQhYiI+q+HvhxgqWwO7z5OGvlX6UHzepWfCzfaqYPfRXysWE+4Gu9rbSxo8cbIbEhnFAgy8puOkSH3LZzLDhgpWt4CwDJMobqsoOo4Hmj6Im7LFalg3IwEZydWNrwpI9As9e3nXn49syCUW/dyPXBeCgExDlMleGUF9kdW2ywkyLMniPxu3Bj2ku+DwtXuFBEAxZuRR8wQyYRYsS458X002QguIIeUJSzS6KR2FuTwmL0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/cDFz8daL0+HbvAFgtGnRav/S6t1IgZ4JezatEACec=;
 b=nrRxWUmsAsKzLYbqPRJc1XirdtN2pyeAQ8KK8J75S8Q5XAACQoOX+ELWiqimPoX71HkCRV3t0mgL48rOSlyy+FB3qjKTOgEsq5tjOOnG9FG6kk6h7SX6aKkn03O47WPV9ENImjGw02iJIiqoV3aRHSKBQIcbcaCc5te38zBnqtvWAbrwkPCQVuw7OrM5hkvgdm1nh1tw4aw4T09HOOmPv8nqkLxPEJ8WlnqEuglWdQGul3vraiCcNf0LWns4Q5yKs9mZPvdSgPfshPfxY3bw2kwof0KoIPxp1QdWz+tzo+FcJdMtAWf4F8ZJEKWtQINElW9bhCD03XAJI21WC+5XZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/cDFz8daL0+HbvAFgtGnRav/S6t1IgZ4JezatEACec=;
 b=Q1fx/yce/RoTgvuG3IqQ7pP8yXy3WhwtcizIhxn0UXM3/KxBzmNXMG0cjbeGDQ3Ed+W6hUWAHmZ0YyVZPN7Czqh72P4+2EQFMXVXKclwURroERaKTvHQMoBYlkjkDpGARZCABLHr3qa16DDOUZDQiqJeEHjjjszLn03Q7q4s0zE=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Mon, 13 Nov 2023 06:37:14 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::6834:f551:ad97:6f6d]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::6834:f551:ad97:6f6d%6]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 06:37:13 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
Thread-Topic: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
Thread-Index: AQHaFJDH3q0MzKy6jU6noAScabHMm7B1EbIAgAK82IA=
Date: Mon, 13 Nov 2023 06:37:13 +0000
Message-ID: <5d7b2458b8d1896ce575f4ed2d413f4e8eeb92b4.camel@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-7-yong.wu@mediatek.com>
 <0ccee72f-98ac-4a08-9253-9c22dad4d95a@linaro.org>
In-Reply-To: <0ccee72f-98ac-4a08-9253-9c22dad4d95a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|KL1PR03MB6899:EE_
x-ms-office365-filtering-correlation-id: 2c289089-6ff4-4e41-b296-08dbe412f8d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZWLA58sZ56tp47K/uGuwCuNwHMXC58U24adoyDsdnMuj/vjDqMy0Q6kE6QnA3gOsKKgNb6ZdCrfoRt+pHFzKGBR5m2QTncGLIXbc21gWbbVwsWJpQtvxUnSj1jQYq4fAauCSE2S0/2OQV9Bvhr5QK4YIijVI6NzTSSH7joyi7X8kHjBTEAqSeWfvzaeyLZZZI7Ia4oumVizzeXl59onkwt63/ju68lZozCcE4tspTSnvQpLylQS0ZAVjPGJU9RBur3RYYdR35WKhDiC1kerl4OhcvbCfzzIfLUXSPMMf7tgvfkctoDVaG6xWD26OuzeOgygajWCxEOEJ2bXkvFbMh2eeMqfJ07/468UeBcgdHz43iz/Ds4bawGfwutXyWAU/kazky8gfeQ2HbuC7kfW0pokZHR2sapGhxafrFspj8DqcQqBCPfmSY25YOjgkTUWuTfpDB55XZJQiJ4C4pHJuFG00et1Xv818zo4zS5MsazW/2ftQImsUO7ExOXF7uVo2W41lU04xnAczvwmn+hQ+YjdRDfRgpqIt3YpL3c4Vtzs61CrfBAH/AMg0nM7nrnifWqfcLB3uTuOw2eH/fG2ppc1Tk0XMj0PSzr5lArQSQ9iMd9b8/DOtrplX0rWSIAkOaHFriFvkGyQtHE6xMabkVxZV0UKSnSY5+sx+tE2hfCNMmJIyb957WHYgj07hnKhCTXQ2zFW5SrWgDvFqv7vHNXaX7IkImlqWmgK0lZ9+AlCge9+ZSsXx6g4TCrXwhimL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799009)(451199024)(7416002)(83380400001)(26005)(2906002)(4001150100001)(2616005)(122000001)(38100700002)(86362001)(36756003)(85182001)(38070700009)(41300700001)(8936002)(4326008)(8676002)(71200400001)(54906003)(64756008)(66446008)(66476007)(316002)(478600001)(6486002)(966005)(53546011)(6506007)(66556008)(91956017)(110136005)(66946007)(76116006)(6512007)(5660300002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTRvTWVTeDQ4VkpNVEdBVDRsRm5ML1ZBZkltSXU1N1VVVjNmMXc5RnF2bkt0?=
 =?utf-8?B?V1dwTzN0ZnFLRHZna2VUTE4xZk5kOTYwdjZINFpBSGlpVFliSEJKTGVibm9n?=
 =?utf-8?B?Y004c0VJU3NLYnUvcldqeWl0V0J2ckdnTHNGV1U4eWZZNTdoOWpSbWNvbEFY?=
 =?utf-8?B?ZGNUaGk0c2RnNVcrQnFPeUMzWmwyL3k3V2FlSTNHelZjNUg4ajk2dm5BTWhZ?=
 =?utf-8?B?cVZUbVpEN2VvMVVkNHdTMitpck9La2FqNlQwYWhiMUJVUTJHcGMzM1pDdnJD?=
 =?utf-8?B?MmEyTFJ2MWxlbkdjUXpIbUdVdytRc3hKbGxCd3dXWEhqWmR1dG9ZNi9OeWw2?=
 =?utf-8?B?VGVkSjExbFByMFJ3UWF0MWRadFJlSXFhbVJnc2dkelA4cVpBZVdwVU9Ha1Rx?=
 =?utf-8?B?ZTh6b240blErYW10NmpmYzBOa1JyWnlPeU53bVZkZ2NwMnFSaE5FK0JEb2Yv?=
 =?utf-8?B?bUsreXdBaVBRU2RFL3RrcjZDS1lPT3A5ZURFYUtLUzl5SFRMUXIxQmx5QjlH?=
 =?utf-8?B?OU5CdzdVenZaUXorMlJkQjM4VTNNTnpOVmJ0SXZQNVdIWEhnQ09PTng4VEVG?=
 =?utf-8?B?TUh0THFVS3Rpa3V5UDk4K1VmemFZelphSWQ0MW4zWjhJQlhCWjVaR3N1YnJZ?=
 =?utf-8?B?Wm9FVWFMSmhEYnc3cVZ1RW9SRHVwZzdsTVpPVHJ6QUhmaGdVWjhUK3YvTHpI?=
 =?utf-8?B?M00yMitOc0hHbXJXc21BNjk1NkFMcWErWVM1SThnai9xQkR5TE5hckRuODNs?=
 =?utf-8?B?Q1d1empKOU5Qenk0SkxqNXg0VGdDRWZJNlVNMHZtWkovOGVrVkgvZzlXd1A1?=
 =?utf-8?B?akdzUFl6SXdWV2Y1b2hsRTFTWXd6N2VadHV4SlVyUi9CczVNYVdNL0ZmOExo?=
 =?utf-8?B?RDgvT3NqZlFIK2tGbzNuaDdnT3h4UXRWdEZSdmhjbHZrYlVLTmF1WlJiUHRm?=
 =?utf-8?B?REN6VjR3NWYxTmFmdWx0aStpWVNEa3lEVUxQMnJYeU9hSDNrTkVEeFdkN04v?=
 =?utf-8?B?MURyckRQakVlc01FYVhQYUxWWnFSTkdMTjVLZ3lWSzI3L2VOYTNLanNnSUhI?=
 =?utf-8?B?YUtZdnVXb1JwckhuaUxzeUVZdEwreXhseXhFb2sySEZGVGdtS3pjbFNsaS9s?=
 =?utf-8?B?aDNpRFY2VFVhYzNWNTBsL0l5WHkxTUZkMUVhVW9GWVVrSEUvZmdqQUVweWRQ?=
 =?utf-8?B?eXB3c0E4OTFHT3ExdXFBM3lBMGhkeFl4aUdSNkxzSWFrSkVlRTcvdHhmRFpo?=
 =?utf-8?B?S1FyWGhXclN1eEppSUdxaEtkNTJ0UXB4U3RyakVtVlRkQUt4MTNqb1hqMUd1?=
 =?utf-8?B?NVhwYWRrYzB2WFowR3BxL0JCa3B2NUszUFdmV09BV3hBYTloR2xxS1k5cjg1?=
 =?utf-8?B?S1Rkb3NjYldpTVBhbEYwY1pFRmlvdUt0dzV3RlJrTVZrMG1DQ2M1cmljbERO?=
 =?utf-8?B?c1BENFdlNm5nbG0yeGwzSWM1cGhoMEtkaWVITjF4bjFMVGVQZXBTei92cEZG?=
 =?utf-8?B?YWcxUTRzc2U2ellJWnQyMmNXaWNyaXo4MEo0VFB6UmVKRFBjN3RkNmw3aFRU?=
 =?utf-8?B?VnpadnpzNzFwcTArYTBlUWxYZlRnZGFqRnpYZ3RjRDhFNm1BZm1SMlBzMFNW?=
 =?utf-8?B?Q1VWbzFDVUZEdFJOMmtrekJEc0d4Vzc3L2I0L2pNcERiMlY4bkMzWTFTL3ZQ?=
 =?utf-8?B?alR0K1NPL2YxdXIxdVFITmJQakVqUkE4MHJ1NDAzeGRoYVBnSHVFOFNQSVZz?=
 =?utf-8?B?a2pwaEZXWFc5QlhPcFBYYmNJcWR1WldkdHhqS242YzRrUm5XOC9La1RyZUFO?=
 =?utf-8?B?alF0OW10VVZWdWtzeWQ0RWw5RC9OTXNDYlZvSFUrLzV2Q0VKd3YxTnJXSmtD?=
 =?utf-8?B?VFFNb1RkOWZMZzdTRk1wZjNIYmRERWJmb0p1VWxtaXBuZUc5YnZNeGhKNFlv?=
 =?utf-8?B?aWIrSThaQlRHd0pLWW01MkJiSS80b0MrUHpwVFN4anczV3ZlbEswOTdxcXZI?=
 =?utf-8?B?VU16M2toUitjMGtFNW5ZSURtOGxRMWJiOUh5MHV6WU9ZN3FSVUl2MFhoN1h4?=
 =?utf-8?B?VENtUmJWd3AvYXd0VVNVY3h5MDRjNVc2TG50VUNYYWhnTXRmSTFSNUJCVVJF?=
 =?utf-8?Q?DbKXQA7ocVMiuc+MqfJMDoO8j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <188B1C5740DD1D478C571C7081F5CDCC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c289089-6ff4-4e41-b296-08dbe412f8d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 06:37:13.8240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2vzzt3nAOiDwH1V2auYQNwXD6Jc+w7gdbKi6oaJHs7d+MqWh4mCK4BwUpX5aBXpsaYXlFYHgeD0EBKXAs5TNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
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
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTExLTExIGF0IDEzOjQ4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDExLzExLzIwMjMgMTI6MTUsIFlvbmcgV3Ugd3JvdGU6
DQo+ID4gQWRkIGEgYmluZGluZyBmb3IgZGVzY3JpYmluZyB0aGUgc2VjdXJlIENNQSByZXNlcnZl
ZCBtZW1vcnkgcmFuZ2UuDQo+IFRoZQ0KPiA+IG1lbW9yeSByYW5nZSBhbHNvIHdpbGwgYmUgZGVm
aW5lZCBpbiB0aGUgVEVFIGZpcm13YXJlLiBJdCBtZWFucyB0aGUNCj4gVEVFDQo+ID4gd2lsbCBi
ZSBjb25maWd1cmVkIHdpdGggdGhlIHNhbWUgYWRkcmVzcy9zaXplIHRoYXQgaXMgYmVpbmcgc2V0
IGluDQo+IHRoaXMNCj4gPiBEVCBub2RlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcg
V3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gV2hhdCB3YXMgdGhlIG91
dGNvbWUgb2YgcHJldmlvdXMgZGlzY3Vzc2lvbj8gSSBkb24ndCBzZWUgYW55DQo+IHJlZmVyZW5j
ZXMNCj4gdG8gdGhlIGNvbmNsdXNpb24gYW5kIHlvdXIgY2hhbmdlbG9nICJSZXdvcmQgdGhlIGR0
LWJpbmRpbmcNCj4gZGVzY3JpcHRpb24iDQo+IGlzIHdheSB0b28gZ2VuZXJpYy4NCj4gDQo+IFlv
dSBtdXN0IGV4cGxhaW4gd2hhdCBoYXBwZW5lZCBoZXJlLg0KDQpJIGRvbid0IHRoaW5rIHRoZXJl
IGlzIGEgZmluYWwgY29uY2x1c2lvbiB5ZXQgaW4gdjEuIEplZmYgaGVscGVkDQpleHBsYWluIHRo
YXQgdGhpcyByZWdpb24gYWxzbyBpcyBkZWZpbmVkIGluIFRFRSBmaXJtd2FyZS4gSSBwdXQgdGhp
cyBhDQpiaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFib3ZlLg0KDQpTb3JyeSBmb3IgY29uZnVz
aW5nLg0KDQo+IA0KPiA+ICAuLi4vcmVzZXJ2ZWQtbWVtb3J5L3NlY3VyZV9jbWFfcmVnaW9uLnlh
bWwgICAgfCA0NA0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
NCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtDQo+IG1lbW9yeS9zZWN1cmVfY21hX3JlZ2lvbi55
YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yZXNlcnZlZC0NCj4gbWVtb3J5L3NlY3VyZV9jbWFfcmVnaW9uLnlhbWwNCj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtDQo+IG1lbW9yeS9zZWN1cmVf
Y21hX3JlZ2lvbi55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjhhYjU1OTU5NWZiZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtDQo+IG1lbW9yeS9zZWN1cmVf
Y21hX3JlZ2lvbi55YW1sDQo+ID4gQEAgLTAsMCArMSw0NCBAQA0KPiA+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwg
MS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IA0KPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9yZXNlcnZlZC1tZW1vcnkvc2VjdXJlX2NtYV9yZWdpb24ueWFtbCMNCj4gPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+
ICt0aXRsZTogU2VjdXJlIFJlc2VydmVkIENNQSBSZWdpb24NCg0KV2lsbCBjaGFuZ2UgdG86IFNl
Y3VyZSBSZWdpb24uIElzIGl0IG9rPw0KDQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiAr
ICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVzIGEgQ01BIHJlZ2lvbiB0aGF0IGNhbiBkeW5hbWljYWxs
eQ0KPiB0cmFuc2l0aW9uDQo+IA0KPiBEZXNjcmliZSB0aGUgaGFyZHdhcmUgb3IgZmlybXdhcmUs
IG5vdCB0aGUgYmluZGluZy4gRHJvcCBmaXJzdCBmb3VyDQo+IHdvcmRzIGFuZCByZXBocmFzZSBp
dC4NCg0KTWVtb3J5IHJlZ2lvbiBmb3IgVEVFIHVzYWdlLCB3aGljaCBpcyBhbHNvIGRlZmluZWQg
aW4gdGhlIFRFRSBmaXJtd2FyZS4NCldoZW4gYW4gYWN0aXZpdHkgKGUuZy4gc2VjdXJlIHZpZGVv
IHBsYXliYWNrKSByZXF1aXJpbmcgdXNhZ2Ugb2YgdGhpcw0Kc3RhcnRzLCB0aGlzIHJlZ2lvbiB3
aWxsIGJlIHByb3RlY3RlZCBieSBNUFUgKE1lbW9yeSBQcm90ZWN0IFVuaXQpIGluDQp0aGUgVEVF
IGZpcm13YXJlLiBBZnRlciB0aGUgYWN0aXZpdHkgaXMgY29tcGxldGVkLCB0aGUgcmVnaW9uIHdp
bGwgYmUNCnVucHJvdGVjdGVkIGJ5IHRoZSBURUUgYW5kIHVzYWJsZSBieSB0aGUgbm9uLXNlY3Vy
ZSBzaWRlIChpLmUuIGtlcm5lbA0KYW5kIHVzZXJzcGFjZSkuDQoNCkRvZXMgdGhpcyBkZXNjcmlw
dGlvbiBtYWtlIHNlbnNlIGZvciB5b3U/DQoNCj4gDQo+ID4gK2JldHdlZW4gc2VjdXJlIGFuZCBu
b24tc2VjdXJlIHN0YXRlcyB0aGF0IGEgVEVFIGNhbiBhbGxvY2F0ZQ0KPiBtZW1vcnkNCj4gPiAr
ZnJvbS4NCj4gDQo+IEl0IGRvZXMgbm90IGxvb2sgbGlrZSB5b3UgdGVzdGVkIHRoZSBiaW5kaW5n
cywgYXQgbGVhc3QgYWZ0ZXIgcXVpY2sNCj4gbG9vay4gUGxlYXNlIHJ1biBgbWFrZSBkdF9iaW5k
aW5nX2NoZWNrYCAoc2VlDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93cml0
aW5nLXNjaGVtYS5yc3QgZm9yDQo+IGluc3RydWN0aW9ucykuDQo+IE1heWJlIHlvdSBuZWVkIHRv
IHVwZGF0ZSB5b3VyIGR0c2NoZW1hIGFuZCB5YW1sbGludC4NCj4gDQo+IERvIG5vdCBzZW5kIHVu
dGVzdGVkIGNvZGUuDQoNClNvcnJ5LiBJIHdpbGwgdXBkYXRlIHRoZW0gYW5kIHRlc3QgdGhpcyBi
ZWZvcmUgc2VuZGluZy4NCg0KPiANCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0g
WW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo+ID4gKw0KPiA+ICthbGxPZjoNCj4gPiAr
ICAtICRyZWY6IHJlc2VydmVkLW1lbW9yeS55YW1sDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0K
PiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBjb25zdDogc2VjdXJlX2NtYV9yZWdpb24NCj4g
DQo+IFN0aWxsIHdyb25nIGNvbXBhdGlibGUuIExvb2sgYXQgb3RoZXIgYmluZGluZ3MgLSB0aGVy
ZSBpcyBub3doZXJlDQo+IHVuZGVyc2NvcmUuIExvb2sgYXQgb3RoZXIgcmVzZXJ2ZWQgbWVtb3J5
IGJpbmRpbmdzIGVzcGVjaWFsbHkuDQo+IA0KPiBBbHNvLCBDTUEgaXMgYSBMaW51eCB0aGluZ3ks
IHNvIGVpdGhlciBub3Qgc3VpdGFibGUgZm9yIGJpbmRpbmdzIGF0DQo+IGFsbCwNCj4gb3IgeW91
IG5lZWQgTGludXggc3BlY2lmaWMgY29tcGF0aWJsZS4gSSBkb24ndCBxdWl0ZSBnZXQgd2h5IGRv
IHlvdQ0KPiBldmVubm90DQo+IHB1dCBDTUEgdGhlcmUgLSBhZGRpbmcgTGludXggc3BlY2lmaWMg
c3R1ZmYgd2lsbCBnZXQgb2J2aW91cw0KPiBwdXNoYmFjay4uLg0KDQpUaGFua3MuIEkgd2lsbCBj
aGFuZ2UgdG86IHNlY3VyZS1yZWdpb24uIElzIHRoaXMgb2s/DQoNCj4gDQo+IA0KPiA+ICsNCj4g
PiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAt
IHJldXNhYmxlDQo+ID4gKw0KPiA+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4g
Kw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArDQo+IA0KPiBTdHJheSBibGFuayBs
aW5lLg0KDQpUaGFua3MgZm9yIHJldmlld2luZyBzbyBjYXJlZnVsLiBXaWxsIGZpeCB0aGlzIGFu
ZCBiZWxvdy4NCg0KPiANCj4gPiArICAgIHJlc2VydmVkLW1lbW9yeSB7DQo+ID4gKyAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQo+
ID4gKyAgICAgICAgcmFuZ2VzOw0KPiA+ICsNCj4gPiArICAgICAgICByZXNlcnZlZC1tZW1vcnlA
ODAwMDAwMDAgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInNlY3VyZV9jbWFfcmVn
aW9uIjsNCj4gPiArICAgICAgICAgICAgcmV1c2FibGU7DQo+ID4gKyAgICAgICAgICAgIHJlZyA9
IDwweDgwMDAwMDAwIDB4MTgwMDAwMDA+Ow0KPiANCj4gcmVnIGlzIHNlY29uZCBwcm9wZXJ0eS4g
T3BlbiBEVFMgYW5kIGNoZWNrIGhvdyBpdCBpcyB0aGVyZS4NCj4gDQo+ID4gKyAgICAgICAgfTsN
Cj4gPiArICAgIH07DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==
