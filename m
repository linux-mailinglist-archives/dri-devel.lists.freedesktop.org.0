Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02E985670
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 11:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E53110E2E0;
	Wed, 25 Sep 2024 09:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JYP6D9eh";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZKvzeQ39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30010E2E0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 09:36:03 +0000 (UTC)
X-UUID: 91da8a087b2111ef8b96093e013ec31c-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=EdTKHQmhUX0wPZAxZgtFvf/oR6fD2X9TUCcfXlEg8+8=; 
 b=JYP6D9eh92KAqczK2zHhu3DjJw/5WTCEkFlys3MgjTKskxJUpXEzz+vaWDkJEDGmwC+HW6FKEjZXBAYz6eKP711MpL7TIF/DUil2YD3pdgZSqKFhG5I8EVWsSDVkhf3iTFydAikmGJW0MHddtfdWHCyjGyUi6cl9z00smR8EeOg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:7169b057-6caa-4d29-b74b-991298c5052f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:8a698a9e-8e9a-4ac1-b510-390a86b53c0a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 91da8a087b2111ef8b96093e013ec31c-20240925
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2081560945; Wed, 25 Sep 2024 17:35:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 02:35:57 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 17:35:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVt8XNAX8S1NrL4FTbypiIH7Qn21FXcueyfJ3ZBTlzKgjvt8GWctkQI6T10E74IDhaa6plggFqC7Fuq54nVpAgosgzp98epAuCe+dP1xo4F5OtNe4MiylFZcy7AQrPyj0tM5aKeG1oOUTu5CCIjvS0/nQgF6l8t7rRsvCsu2fZ9Ui2/LxZCjql2kJsdeXBoJvMpu5W4Dy8F+ftqD7DABfr9Z9V29D5YZV0BIxwSixpvemk7hyADXcZI3kOBKwMEMOH7ihl4ZpmapI3DsGazOs1CIU1sIRkDgVd4ndDupxnuclvzKTYiMc1EkLbJy5/ZPYZ4sFaZNqsUn5RlcgSYvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdd/Ll1kgyiaJgoOJ1uHbB4P3Cx852Vqa5yDcXkBPcE=;
 b=T4WAID019agTLMxkyzi529VluMg6QnYh7rBq6QVouNzbe9HaCGaeRcqRe3PVJJFHfHvw7wZv6IHVmTmOv3xAqlI7q/2UeHGrO+LpO//xuik17ypomuN/eH1x5wWr3nsCqFonf1lCqlXbqbZmW2MRvrqDGzBDIThCGdgkc8ZqyJFhiD8AmElVfvXCRzYCwwbiY83QFaDiqBjRiQv4FeRobQRH20b3sFXSzMkc+hg6kGBM1ppTcJlRbCP2n3bq3PXksnw9RQLlt+vWYLR89ZQWNFuzOU+i+i89LqBavMW5SEWLJVqn4z5/lctTfuTjavx98FD6QhwILfld5W6Eom6ARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdd/Ll1kgyiaJgoOJ1uHbB4P3Cx852Vqa5yDcXkBPcE=;
 b=ZKvzeQ39S1c2/Ecf6gazRECe5dkmcNUaAGUolVuiIdpHDOThgRcnDx2sIoZcMwstiocjcXVQ5mS4EdyWj+tFkrZKbY4XXW/UkRsqJnr2g3/FXCwxh2yajKbbKAXiAebQA0IBSA0Ir54S34nFAt/KSRhH+HXDpuLr943lbQOmEWw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7502.apcprd03.prod.outlook.com (2603:1096:820:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 09:35:52 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7939.022; Wed, 25 Sep 2024
 09:35:52 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4] drm/mediatek: ovl: Add fmt_convert function pointer to
 driver data
Thread-Topic: [PATCH v4] drm/mediatek: ovl: Add fmt_convert function pointer
 to driver data
Thread-Index: AQHbDiYtnGVDWdsxRkSQpqKSCVP2YbJoIZ2AgAAetYA=
Date: Wed, 25 Sep 2024 09:35:52 +0000
Message-ID: <16fde40d5a4855488c58e6fef8509c18392b2cec.camel@mediatek.com>
References: <20240924014935.23677-1-jason-jh.lin@mediatek.com>
 <dbb2722698d3b36100f0ed2bfeec92441cd4ef45.camel@mediatek.com>
In-Reply-To: <dbb2722698d3b36100f0ed2bfeec92441cd4ef45.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7502:EE_
x-ms-office365-filtering-correlation-id: 865ab6fa-a298-4abf-6a92-08dcdd457290
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SXJTamFVbW5XYVlCWUVDOUJONG82NS9FZTZlZWxNc3I1V0Z4U3BCcGVpVWJC?=
 =?utf-8?B?VmtOdms5dkJOTFhYYjBBcnk5ZXdxUkF0bnJacVNUYVJWQmV2ZHJnMU1JOTJX?=
 =?utf-8?B?UW81b2pLcGZPSHY5TExXTktvZWlROTd2ZE1aMm55MDN3UXozNEkxdUlMY3h2?=
 =?utf-8?B?bWphS3kweG5KcXM4LzVuaWd0MEVSSlo4MTY1bTBjVklkeXFHa0V6UEZLTlZM?=
 =?utf-8?B?bG81U0thSTM2NE5wekdlNXlaWHdPTzhqUUt3TW95WnBZUWdUZEV3S3g3MkFo?=
 =?utf-8?B?TkUrT3M5RHR2L1JVMkxnRzJ6dWxOSzJzS0I4Y0JDSHVFSkpzUCsxWEF0YVd4?=
 =?utf-8?B?NVRxS09oMHZvREMvY3pXcFZ4WTJOOWF1RjJCMTVsVC9vSHhzSTdxMFFqVDVZ?=
 =?utf-8?B?T3U4QkdzWFQveU8yUUlCRzlwZG9kRVpuc2FSMzFCdHJqNGU4a0pnbkVDNmwy?=
 =?utf-8?B?WDRJcUVRYXBUSTFNYUtrZDN1SzJoVXdNbXFtQlNsazcvWFd0ZVlTTjBMWG1z?=
 =?utf-8?B?cUFQUkFMK3FvTnRlNG5EV0pDWjhFUHhrb1hFV015WFpLaFFJMU5VYXJXZmJt?=
 =?utf-8?B?WHRxdTNlZE43SHgwNVpZYzRSdXlTVVJtVjRreFpnMURaK0N6ei9MYXRjcnor?=
 =?utf-8?B?dE5GT04vNDhDWlU1MzN4ejBKRU5wd0RxbkdvdkVrYldxZGpVaVJ1Yk9OdUdV?=
 =?utf-8?B?bE4zRXFUWGhRZDVQSVAxSUNyYzdpVHdIWGZxTXhmQjRiVjRxUCtoR1Q2aG9G?=
 =?utf-8?B?dzBiWmdveDlqb05DcjErM1VOb2VWeDY1ZVFxVmh1Y1MvRVI4RlZNWjRITTl3?=
 =?utf-8?B?Y2lHZHBJc3Y3TlF0dTdyeEtaakl6KzkyQnZuMWNxYmFheVVLc0RvN09Jc2o0?=
 =?utf-8?B?T2FPVlo5Umw4NGpQb2hsU1ZOYlF6VFg1ODVzSE9rUEE5ZHoxUlRSOTVIQk9G?=
 =?utf-8?B?WFZ0aGp6U0d2cWpESi9CeE00MFBHdmc0cTNoVndZVXU1TzdoNEUzVmc5MmNr?=
 =?utf-8?B?bVVrNEVjSnhJVC9na1kyVTBpQlBQK2tQTUF1cmNNOHBvSlVtMVh3bXQycHUv?=
 =?utf-8?B?RlJnMkpSVko0YTVxQVJXeG1mYnJRQWZUeks4UXcvSTBHRlJKVmZXeEdsR250?=
 =?utf-8?B?aEhzOXBFYmlUL0JZbEFkTlpKU0xWbWpJcGhsS2t4bHV2Y0k0SHhMYytUb0sr?=
 =?utf-8?B?R0NLS1RMSkFDa3piTnNkZktCeEtVa1R5THZqVitWSis5dEZxbXZiRGhibWJY?=
 =?utf-8?B?TGxXeFQyeWdsYmRmbG1kTnFzOU1QOTI0UDQvT1kvMVk4bThMYnNXL3FBaUg5?=
 =?utf-8?B?TUJYRVpPZUZrVExLb0hEQlFJNnhKZ3gvYmU2ZzhOMm1CcWd3YnE1QzhZYkdP?=
 =?utf-8?B?TGhqUmJidE1qM1ZQVHJPckdlekZLQ0dFczdIOWNsMTVhaXZqTFJWSVRHMlhU?=
 =?utf-8?B?cTVOVjMrT3lFbERiazJlRE9wMzBzOWdTcUdrTXFzK3lEcU1IL3UzdnFtK1VX?=
 =?utf-8?B?TVJhbC92bnBmdE8yejU4S0ZDTFV6U2V5QmQyb0l1Q3k5ZnU2T3FmRk5RMitB?=
 =?utf-8?B?d3RJbk9aSlpKNGJSYlBXOE5HTXZKL1R2Tm1LQUZiUzV4d0lLZTlEaTE5WmFy?=
 =?utf-8?B?YllPb3cxeldxQnNZbzVsVy8zOThod2ZBTzVlQjNaY3pCS1dGTytxK0YrSE5t?=
 =?utf-8?B?WG1JZ1pQa250clIvcURldkJ0NWlXb3JQM1lpRDNvak1sU3ZvcitUVUtOMVRQ?=
 =?utf-8?B?dVZjd0x6M2JEN1J5V1dsMnE4NjJaSjVwNWlTejY3UkVqTVRaUGpYeE5jM1d0?=
 =?utf-8?B?UVdTVFVwcjNCM3dheGtkQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2tZQ2l5WkVlMG1Wejk0aHc4TVFITStwTCtYTUpLQk9LaXVkY3RrTDNWL1dF?=
 =?utf-8?B?U3BoYXV1ME5FTkE2Ylhvak9tSHlWREJ0VWF4UXpDcURBNlhWejUrT3Q5bGZi?=
 =?utf-8?B?cmxhRVI0NGVOTVpsMkpOTlpNU0hLM0JReDVtZi9RQXA4UlpFd0FMYUdUYTZH?=
 =?utf-8?B?RGVvNGNIb20wcHV6dURnT1ZnNngvczhndkVkbGtZazhUZ3phcmloejhOTUlV?=
 =?utf-8?B?R29WZ2xhU2ljREtySmRDeDFBUmk1NjBEaWkyZzBRUnppaWJUWGFxZ2xFbFNG?=
 =?utf-8?B?MFFvdWtlMDZwMVZaMnNBQmxORTd6Ni9nV0M5UDJQbG41SWQxRURpYjFPYXN3?=
 =?utf-8?B?WHp3T09Udll6S0F0ZlNDTkdiMHJsK203TElGZFBTdVFVbUU3RGc4RHVLc292?=
 =?utf-8?B?Y0RUbTZ4bitIR1l2K1JlZmpMRTcvQllqalRjeXBPcjFZdTgvbHIvL0p2ck9U?=
 =?utf-8?B?K2JPUlNmdkRHcktNMnI0ZlpTSjJJVUE1REFCOGd0QnJ4OTh5RUt4andtVHJY?=
 =?utf-8?B?Zi8wNkFPRysrbWZNVjFRQ0ErekxpVXE5OTdyY0thTG5XOEw4RjNieDlKbHh4?=
 =?utf-8?B?RTMyTlV4OFkwVTB2ODZHaXBxcEdMenEvK1RpSFJTcXVzUmd5bi9ySTl6am1u?=
 =?utf-8?B?SXNKZFN5d3lmci9oejRtMUN1VFNXeTJBTFg2ZHJ3cVRNcnZsc1R0clRuZFFp?=
 =?utf-8?B?c0NldFd5cmNwZXBsTWtlZUJBK2RrMmxYVENlN0l3VUxyZ3VzOS9jRDVHZkd1?=
 =?utf-8?B?b05nR1BhUUNKRGR6bGxFbVE4VEJQSUxoSmlGRDYrYldSVTRJUHd1TzUrcERB?=
 =?utf-8?B?aEUweVZDK244M3JMQjFjd3pmdlp4Nk9hUmUvMjhzajhkb3NDSmQyNHlqMHNw?=
 =?utf-8?B?NmM2clpLWS8yY0QxSkl0RWc0ZFl2aTJCMjErcHJ3OGZHUkh3TmpPdDFLYzhF?=
 =?utf-8?B?WHhabkNzMmhMYnExUDJ6cVBWTWZYMDlWZldQMUFzRkpFdU5UbkhxUDRMS0tY?=
 =?utf-8?B?bUp3L3pMeWI1aU9NZ29YcTcrQ2V3azdwKy9PZE9laHJjbTFrQ3RYOGZuUHpm?=
 =?utf-8?B?U1Yxb0ZSK01tTE5FMUFMYzV1MU9ITXRERzdBRjJiNFJPakF5ekpYWFRhb2lK?=
 =?utf-8?B?THFMdW1ML3c3b0VsdVpiVWpNMit1c1JHc3F6VkZBcHVmcWFDbCt1WURNL2sz?=
 =?utf-8?B?enBkRjFHbzZwQW44V3JFWkhIT3lhdzRvRW1QQ3Z3dDI5enN4bFFsMjFKdTlC?=
 =?utf-8?B?aW9kYnI5cTJVM3JCeVdVRE5NbTFWTzRuOUljb2l6b1ZhV2t5enp1QXRHaGU1?=
 =?utf-8?B?RjVsN3JlRythM3NOcWUyR0EzR1FYVHQ5T1hHTmxWazhMM3RyczVpMjhBenNu?=
 =?utf-8?B?SThMNDhIb1Y4dW50MTFjenBpeDFHRHBUdExBOUtmcHdPWTZDZ3J1SkpKM0dR?=
 =?utf-8?B?TmpKRDVJbVR4bEUwajJXNE91blJ4dU5BQXRGU1ZTN2hxTWh5Tkp5TkpWbFp6?=
 =?utf-8?B?SnJObUd5b0tvRi83UVBOUHVtMk8vck9SUmsvZDFGdFFSa3BjY1NNMGhFVTNR?=
 =?utf-8?B?a3gyaE9yOXA3Y0JyNm1HS1U0d3ZTV0ViSEJlY0tEYjhmTDlOQ1FCWGlKY3pN?=
 =?utf-8?B?aDlDeWM4UlhkVVFKSGdCR2xqRHdNOGxwY2RTdkV0dit2aWR1MEJwNzVYSXJ5?=
 =?utf-8?B?Tm9lN1YyaThYZTJwYlo0V2FVTWpMak1pMEVoMTkremFhWEdaekh1ck8zeWdX?=
 =?utf-8?B?UDlzZmEwcThRNFltWlZ6U3RYY2VqY1VHRlBVcWI2cVZyMUhOb1BSWm5CQU1D?=
 =?utf-8?B?OXJTb2hXSEN0REU0OXdUTnVMU2hJZVFHTnJiRDNidG5ia0xqMnNNQnAwalV2?=
 =?utf-8?B?cW9xUGlySmNRQVI1VlhhUFVWTm9INTRxNy9Ub1drazRuVjJtY3hVQWRrZEZx?=
 =?utf-8?B?V093bm9NbXF0VGFleEt2VG9XQmNwMFhFYlF2VktGc0VjZEFldUU2VlRYNDI4?=
 =?utf-8?B?aldIazkrTEV6YzNsYWZ2cmlUWHUyUC91U255Z0tKSXM5ZjlEMUFNbG9VRFJ6?=
 =?utf-8?B?dWh5amg3enRPM2JDT21tanAwM29wdU5DbmRmNUU0UUlVTWRiYjF5ZEJ5c1lM?=
 =?utf-8?B?Z3dCMkIxUldrWFhSTWpaOUJmbHhYdk9IZnlkSzJ1ejlkL1UwVGhyUDJMT1pW?=
 =?utf-8?B?Unc9PQ==?=
Content-ID: <80D1FD4B7936684EB420343ADD1DB4D6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865ab6fa-a298-4abf-6a92-08dcdd457290
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 09:35:52.4097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCmI/I7HQT7cczi8Z7wEtcz2K0HVPEVJ7JG53wUuxcLwNK3vrf+ySwzm2/8KxLjK8A5Q42O3fF9vaPP5XzHX44F5ntIcBTLf+zuAEKlJI0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7502
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1954328891.341870300"
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

--__=_Part_Boundary_004_1954328891.341870300
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI0LTA5LTI1IGF0IDA3OjQ1ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gPiANCj4gSGksIEphc29uOg0KPiANCj4gT24gVHVlLCAyMDI0LTA5LTI0IGF0IDA5OjQ5
ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gT1ZMX0NPTl9DTFJGTVRfTUFOIGlzIGEg
Y29uZmlndXJhdGlvbiBmb3IgZXh0ZW5kaW5nIGNvbG9yIGZvcm1hdA0KPiA+IHNldHRpbmdzIG9m
IERJU1BfUkVHX09WTF9DT04obikuDQo+ID4gSXQgd2lsbCBjaGFuZ2Ugc29tZSBvZiB0aGUgb3Jp
Z2luYWwgY29sb3IgZm9ybWF0IHNldHRpbmdzLg0KPiA+IA0KPiA+IFRha2UgdGhlIHNldHRpbmdz
IG9mICgzIDw8IDEyKSBmb3IgZXhhbXBsZS4NCj4gPiAtIElmIE9WTF9DT05fQ0xSRk1UX01BTiA9
IDAgbWVhbnMgT1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODguDQo+ID4gLSBJZiBPVkxfQ09OX0NMUkZN
VF9NQU4gPSAxIG1lYW5zIE9WTF9DT05fQ0xSRk1UX1BBUkdCODg4OC4NCj4gPiANCj4gPiBTaW5j
ZSBPVkxfQ09OX0NMUkZNVF9NQU4gaXMgbm90IHN1cHBvcnRlZCBvbiBwcmV2aW91cyBTb0NzLA0K
PiA+IEl0IGJyZWFrcyB0aGUgT1ZMIGNvbG9yIGZvcm1hdCBzZXR0aW5nIG9mIE1UODE3My4NCj4g
PiANCj4gPiBUaGVyZWZvcmUsIHRoZSBmbXRfY29udmVydCBmdW5jdGlvbiBwb2ludGVyIGlzIGFk
ZGVkIHRvIHRoZSBkcml2ZXINCj4gPiBkYXRhDQo+ID4gYW5kIG10a19vdmxfZm10X2NvbnZlcnRf
d2l0aF9ibGVuZCBpcyBpbXBsZW1lbnRlZCBmb3IgTVQ4MTkyIGFuZA0KPiA+IE1UODE5NQ0KPiA+
IHRoYXQgc3VwcG9ydCBPVkxfQ09OX0NMUkZNVF9NQU4sIGFuZCBtdGtfb3ZsX2ZtdF9jb252ZXJ0
IGlzDQo+ID4gaW1wbGVtZW50ZWQNCj4gPiBmb3Igb3RoZXIgU29DcyB0aGF0IGRvIG5vdCBzdXBw
b3J0IGl0IHRvIHNvbHZlIHRoZSBkZWdyYWRhdGlvbg0KPiA+IHByb2JsZW0uDQo+IA0KPiBUaGlz
IHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUsIHNvDQo+IA0KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNr
Lmh1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IEJ5IHRoaXMgcGF0Y2gsIG9ubHkgc29tZSBTb0Mgc3Vw
cG9ydCBwcmUtbXVsdGlwbGllZCBwaXhlbCBmb3JtYXQuDQo+IEluIFsxXSwgaXQgZGVjbGFyZSB0
aGF0IGFsbCBTb0Mgc3VwcG9ydCBwcmUtbXVsdGlwbGllZCBwaXhlbCBmb3JtYXQsDQo+IHNvIEkg
dGhpbmsgbmVlZCBhbm90aGVyIHBhdGNoIHRvIGxldCBvbmx5IHNvbWUgU29DIHN1cHBvcnQgcHJl
LQ0KPiBtdWx0aXBsaWVkLg0KPiANCj4gWzFdIA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWs/aD1uZXh0LTIwMjQwOTI1JmlkPTQyMjVkNWQ1ZTc3OWI4NTlhNjY2
MTEzMGEzNDQ0ZWI0YzVkYjc3ZTUNCj4gDQoNCk5vIHByb2JsZW0sIEknbGwgc2VuZCBhbm90aGVy
IHBhdGNoIHRvIGZpeCBbMV0gaW4gdjUgc29vbi4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K
DQo=

--__=_Part_Boundary_004_1954328891.341870300
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjQtMDktMjUmIzMyO2F0
JiMzMjswNzo0NSYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7SGksJiMz
MjtKYXNvbjoNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO1R1ZSwmIzMyOzIwMjQtMDktMjQm
IzMyO2F0JiMzMjswOTo0OSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7T1ZMX0NPTl9DTFJGTVRfTUFOJiMzMjtpcyYjMzI7YSYjMzI7Y29u
ZmlndXJhdGlvbiYjMzI7Zm9yJiMzMjtleHRlbmRpbmcmIzMyO2NvbG9yJiMzMjtmb3JtYXQNCiZn
dDsmIzMyOyZndDsmIzMyO3NldHRpbmdzJiMzMjtvZiYjMzI7RElTUF9SRUdfT1ZMX0NPTihuKS4N
CiZndDsmIzMyOyZndDsmIzMyO0l0JiMzMjt3aWxsJiMzMjtjaGFuZ2UmIzMyO3NvbWUmIzMyO29m
JiMzMjt0aGUmIzMyO29yaWdpbmFsJiMzMjtjb2xvciYjMzI7Zm9ybWF0JiMzMjtzZXR0aW5ncy4N
CiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7VGFrZSYjMzI7dGhlJiMzMjtz
ZXR0aW5ncyYjMzI7b2YmIzMyOygzJiMzMjsmbHQ7Jmx0OyYjMzI7MTIpJiMzMjtmb3ImIzMyO2V4
YW1wbGUuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstJiMzMjtJZiYjMzI7T1ZMX0NPTl9DTFJGTVRfTUFO
JiMzMjs9JiMzMjswJiMzMjttZWFucyYjMzI7T1ZMX0NPTl9DTFJGTVRfUkdCQTg4ODguDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjstJiMzMjtJZiYjMzI7T1ZMX0NPTl9DTFJGTVRfTUFOJiMzMjs9JiMzMjsx
JiMzMjttZWFucyYjMzI7T1ZMX0NPTl9DTFJGTVRfUEFSR0I4ODg4Lg0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaW5jZSYjMzI7T1ZMX0NPTl9DTFJGTVRfTUFOJiMzMjtp
cyYjMzI7bm90JiMzMjtzdXBwb3J0ZWQmIzMyO29uJiMzMjtwcmV2aW91cyYjMzI7U29DcywNCiZn
dDsmIzMyOyZndDsmIzMyO0l0JiMzMjticmVha3MmIzMyO3RoZSYjMzI7T1ZMJiMzMjtjb2xvciYj
MzI7Zm9ybWF0JiMzMjtzZXR0aW5nJiMzMjtvZiYjMzI7TVQ4MTczLg0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGVyZWZvcmUsJiMzMjt0aGUmIzMyO2ZtdF9jb252ZXJ0
JiMzMjtmdW5jdGlvbiYjMzI7cG9pbnRlciYjMzI7aXMmIzMyO2FkZGVkJiMzMjt0byYjMzI7dGhl
JiMzMjtkcml2ZXINCiZndDsmIzMyOyZndDsmIzMyO2RhdGENCiZndDsmIzMyOyZndDsmIzMyO2Fu
ZCYjMzI7bXRrX292bF9mbXRfY29udmVydF93aXRoX2JsZW5kJiMzMjtpcyYjMzI7aW1wbGVtZW50
ZWQmIzMyO2ZvciYjMzI7TVQ4MTkyJiMzMjthbmQNCiZndDsmIzMyOyZndDsmIzMyO01UODE5NQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7dGhhdCYjMzI7c3VwcG9ydCYjMzI7T1ZMX0NPTl9DTFJGTVRfTUFO
LCYjMzI7YW5kJiMzMjttdGtfb3ZsX2ZtdF9jb252ZXJ0JiMzMjtpcw0KJmd0OyYjMzI7Jmd0OyYj
MzI7aW1wbGVtZW50ZWQNCiZndDsmIzMyOyZndDsmIzMyO2ZvciYjMzI7b3RoZXImIzMyO1NvQ3Mm
IzMyO3RoYXQmIzMyO2RvJiMzMjtub3QmIzMyO3N1cHBvcnQmIzMyO2l0JiMzMjt0byYjMzI7c29s
dmUmIzMyO3RoZSYjMzI7ZGVncmFkYXRpb24NCiZndDsmIzMyOyZndDsmIzMyO3Byb2JsZW0uDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO3BhdGNoJiMzMjtsb29rcyYjMzI7Z29vZCYjMzI7
dG8mIzMyO21lLCYjMzI7c28NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtD
SyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsm
IzMyO0J5JiMzMjt0aGlzJiMzMjtwYXRjaCwmIzMyO29ubHkmIzMyO3NvbWUmIzMyO1NvQyYjMzI7
c3VwcG9ydCYjMzI7cHJlLW11bHRpcGxpZWQmIzMyO3BpeGVsJiMzMjtmb3JtYXQuDQomZ3Q7JiMz
MjtJbiYjMzI7WzFdLCYjMzI7aXQmIzMyO2RlY2xhcmUmIzMyO3RoYXQmIzMyO2FsbCYjMzI7U29D
JiMzMjtzdXBwb3J0JiMzMjtwcmUtbXVsdGlwbGllZCYjMzI7cGl4ZWwmIzMyO2Zvcm1hdCwNCiZn
dDsmIzMyO3NvJiMzMjtJJiMzMjt0aGluayYjMzI7bmVlZCYjMzI7YW5vdGhlciYjMzI7cGF0Y2gm
IzMyO3RvJiMzMjtsZXQmIzMyO29ubHkmIzMyO3NvbWUmIzMyO1NvQyYjMzI7c3VwcG9ydCYjMzI7
cHJlLQ0KJmd0OyYjMzI7bXVsdGlwbGllZC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7WzFdJiMzMjsN
CiZndDsmIzMyO2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlayYjNjM7
aD1uZXh0LTIwMjQwOTI1JmFtcDtpZD00MjI1ZDVkNWU3NzliODU5YTY2NjExMzBhMzQ0NGViNGM1
ZGI3N2U1DQomZ3Q7JiMzMjsNCg0KTm8mIzMyO3Byb2JsZW0sJiMzMjtJJiMzOTtsbCYjMzI7c2Vu
ZCYjMzI7YW5vdGhlciYjMzI7cGF0Y2gmIzMyO3RvJiMzMjtmaXgmIzMyO1sxXSYjMzI7aW4mIzMy
O3Y1JiMzMjtzb29uLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCg0KPC9wcmU+DQo8L3A+
PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_004_1954328891.341870300--

