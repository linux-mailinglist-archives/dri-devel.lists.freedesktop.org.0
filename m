Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFF8D3958
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE1D10E09D;
	Wed, 29 May 2024 14:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HQtUTLQW";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="IGAgK9ZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D5510E09D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:33:49 +0000 (UTC)
X-UUID: 72c6b79c1dc811efbfff99f2466cf0b4-20240529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=oPnBvKoC7BttsC//NknKs8C2YGfPu5ybiO47R6zor6k=; 
 b=HQtUTLQWtCB1Lctjo0sM6i2Mkd9v5T/7hStepzIY+j/Wf2IeiUQmRlkRTKOKoYwq9PcBF06eUSKyfNlsRZRhDEui4o7eZfrRIm3iGPyFwl8wj7B/TgomdNUs19o/JrjekaUDoLun5XH5D4Bcd2SYk9IcUp+18aEeyBdOiAkGfWA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:8f03b671-6629-48c9-9f9e-60c8f21b7af3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:dee8f787-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 72c6b79c1dc811efbfff99f2466cf0b4-20240529
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1360776376; Wed, 29 May 2024 22:33:42 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 May 2024 22:33:40 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 May 2024 22:33:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql7Mhsp6wjps3XdVOvhhp9yChbRje2sVDm6UYi7pBUsDpiTxDHmN4eF/1Uf903EY4qeTCrnDl2H8PW63smAXp1ZO3c+HhrCgANnOfg/hdlkpSO9TLdTd4y1Qa8R5adLoOqeYTKum59IvK2XZvpC5SNdMBY/smXVjDQOxxl+CSKN/2DY7xYcl920Ue75GFBHXK5xfLlFZZXfPsLRzE6AlwUUaIZW4nrC4XVHdEdtIG8Ma8fvYPW8wolUMpYaYfACBWyPBAKsPvXMPyfpu8SRsLAc52wrCp7/5VXmiubFvgg8cFfU7UcN/I51mS7oXmuAygKM+1It369r1g9IHcqVNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmxEXqHp+U8/iMruTZPahzCmARxihiokgAzmzRaGDA8=;
 b=fetvIFHL7rJQX60q9TKdY2bIbqiFw2/dUp8S54ZiT5+t/LpYg16yjb40kQn90dicyzh8zYQLS06Z6sSk0h1czD7hefr81JS57XRGAuUqfHaDjONa+4Boa8BcQM1zczYdMJCZLosgfl90BElq3pym28lW+lhpi213BA34SRX8ncykFv6LYbJtjy58eJxPZXb18ln2odx3I9Dk1eFHBK1Qg7TeSsvKBw33v3+nK67YEaakg/+6zeVHv5dwy+twfqBCC9Qm1OOa5W4ZplwluU7aVGX4CSpmCl2Eo52YERvtU9Ey41oiSFwNye1dRgNkJLJGjkmFhXW1i+sGdBQN/l9g8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmxEXqHp+U8/iMruTZPahzCmARxihiokgAzmzRaGDA8=;
 b=IGAgK9ZCB/JJpn+KIo9F2g0/D0+4g28IMq2BoghDegIYFvTsHRUPYsNEcQAdLHIpDFHhPBj5FGZ4o8oCCH8GP/HKyzDGl6C+aYgN7w21+nWmzntyqa3MjL5xk4bbm52WFaO6kAYy3Mc4IOcaYBHz4+Hzx+BHjEo4ep9rlIgg1Gg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6796.apcprd03.prod.outlook.com (2603:1096:101:8b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Wed, 29 May
 2024 14:33:37 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.7633.001; Wed, 29 May 2024
 14:33:37 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND, v6 6/8] mailbox: mediatek: Add CMDQ secure mailbox
 driver
Thread-Topic: [PATCH RESEND, v6 6/8] mailbox: mediatek: Add CMDQ secure
 mailbox driver
Thread-Index: AQHasKV/cRJMjExS/0SyyRFsiJz8gLGuSRUA
Date: Wed, 29 May 2024 14:33:37 +0000
Message-ID: <dc20f80a0079dbfa832a751323752f602e559822.camel@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-7-jason-jh.lin@mediatek.com>
 <5ce30bf52a4f2e4f6f76d0a4c25a08a45f14b6fe.camel@mediatek.com>
In-Reply-To: <5ce30bf52a4f2e4f6f76d0a4c25a08a45f14b6fe.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6796:EE_
x-ms-office365-filtering-correlation-id: a8417ce8-c9cc-4045-2954-08dc7fec53ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?K3hmam44VEluZnpWMUhiWWQ5N0xoNWtScHNWN0xJb29jZGFER1VkbU5HN2Ja?=
 =?utf-8?B?VWZJeG80ZlFZOTlURHE3eW8xa2U0THJPZ1ZzR1BtQ1dMZkxBaGR5d2xwRTlo?=
 =?utf-8?B?bTZLcEZZZEdLcWxWZEZYaU5sLzNNRDNNZGJ2bCtrUTROK3hCTTg0N0ZJeTR5?=
 =?utf-8?B?RC9pak11dHQxMkszUU1aQ1dndVBRa2JpcCsxbDZ1V2RkcjVQWGRlNEt2SUhw?=
 =?utf-8?B?SmpzdnQ2K3lFVFg4T0JNbXI4ZXZCdVhaMkdlalpyTXZYbEp2ZlNrTnhJYVNh?=
 =?utf-8?B?K1U5TnNmTDl3V0VUK0NDU0dkSHBDQTc5amRaeXh3ZTcwRVpHdWNQanVsU1U1?=
 =?utf-8?B?U3BCVTB5cWxGV0pkbXpLRFZISEdDRXhVMXVhbDBQeXo0YVJleGJwYStucTJn?=
 =?utf-8?B?UkpvTU04eEVWTGw3SmRrZG5DR0VSNm9tM0FpVTIyYUxjcXNSVDY0bFd0SjA4?=
 =?utf-8?B?RDhHLzVhUk9mUmVGb0NGQ0pyMmhwTm13TnQ0K0lvd3ljV0xQVy9uTmgvVE9K?=
 =?utf-8?B?b0xHSmxMTWVGbmszVmppQ3cweHI3bFNpSUNuNlpZbnpZZXZ2R0MxQWU4YkRy?=
 =?utf-8?B?cEo2cjR6Nk1UN2grWEoyNTlvdDdrWjkrcHZlS2JWcElDMUMxK1FrL1UvaWtk?=
 =?utf-8?B?T040dVJ6RjFLTTA3VndUVjRCQVlMc2NFdDJDZmxxQW1yT3JjN0JWQ2lXeER2?=
 =?utf-8?B?YWNCUzdwQ0ZabGdaRVNMWCtoOU9mUzZVcHphSzd6dE83aDJRejJmY0tiV0px?=
 =?utf-8?B?LzExYVlHMkpEQ1RReE1OeERPelBzSjRtbzh4b3pMYWFWcVlXN0phc0g0U3Uy?=
 =?utf-8?B?TFZYSmFJQ0ZOOXBLc1NLZmVaT1UyRVFHQWpTd2pLVWxlVnNPMHBpSE0yWmVC?=
 =?utf-8?B?NjY4aXFlWjhsV3BSMUxENWlTdWZtU05HZDFha1JRVkxwVFJmRE9DNTNzb0gz?=
 =?utf-8?B?cGYvbmlhME8zVW9YQXczTVp3eGI5RUtyMU41aDkrSWNuSDZVZTlnZFJmUHhv?=
 =?utf-8?B?QzZsRTIzL1JMcXFjbW42bTBSNFVFNVJOTXlzaHZYejdleDlOWG43UUYwQjUw?=
 =?utf-8?B?SWVhSzBZWUk3OHRHVVJCQnhmYUk1ckFpU3N4b0pzKzh4ZDYzeXFqVldGRThv?=
 =?utf-8?B?NFQzT0dXV0Q4bElYcWF4cW02cXJ1TngvS1FjWjQ3VldEbUdBbWJQcldqdUti?=
 =?utf-8?B?MnUwRFcrSlVTTnJ4dVd5WUI4SFVuV2t4VDdiRGEzenBQd2l4U3dvSDYxMHlm?=
 =?utf-8?B?bkVDS0tBS1k0NDJWS3VkaUJoMG14WVJ4YllWNVcrbUpZN1YvTk9qaWppbk9D?=
 =?utf-8?B?cy9Wb2VMU1A5UUp6SFhqczYyMzk2NkcvTlF4QmZCeldvT3BBcWhTbVJHNURm?=
 =?utf-8?B?VkZpWmlGamE0QkVMQ01OWlRwT00vbVVDaVBXekdXdW9taHNYcU82dmZIbC9n?=
 =?utf-8?B?VjR5SXZSVnU4TFdrNXFCNHNBVi9ub1hYZGZORFVRYkoreS90WlpwUWtEYVR3?=
 =?utf-8?B?dFhOeGFIWHFOUlFQeWhCMDl0c3RyWEFISk9MR2wvMUVtY050Mmw4anhVc3Zh?=
 =?utf-8?B?UVVCd1NuOW8yYVpycmN2cEZOV1BLSllKM0lXQ0ZSblI1eW9hKzhhSEJ6NjFN?=
 =?utf-8?B?TUdvUmErc3BDa2xkSFlrQktpZXRqREp3SXJaMWdEcjlWTWVXdTZ0ZE1FQWhF?=
 =?utf-8?B?a3dxL01lOHFRRm93ZXlmbzNVOStOVkNvQjhMTTdoNDdYQjVkcHN4OFZyVE1B?=
 =?utf-8?B?cTMzaXVIY1dKa0R4STJuUGQwZzdia0NmbnZnYyt3TkpQcThkcjVVakQ1M3cv?=
 =?utf-8?B?ODBzN3pHNzZ3OTFHMHE3Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDU5NVZvdmN6ekhzQmNzQ0JYWDdMOS9IdEYzZFN0ZVNMNjRVL2JxcklKUHRV?=
 =?utf-8?B?WStjT3MxQUlOMGxvWmlNUFRGaWpTbEpJWTV3cU1kTmdLcHU0OWRYQTkwSTNR?=
 =?utf-8?B?ditLQ2lyeXhQNkwyU3dReEcrVENSV0xhdW9MbzllZVpIOWlncEw0c1QxN3Yx?=
 =?utf-8?B?cVM2cnBvU1NzeTlCd1NIenVKYnNVeHZYbWhpT0M2YW1FQ1lCOFYxU2FHUVBz?=
 =?utf-8?B?S0RndUdOV1NBZGNPZks2K1V6dXd2UEhVd3VtdytkWk5aSUJWM3N6dk42WUx4?=
 =?utf-8?B?ZDJ5dFUxeWd2OVVRTGcyaHRuYkdHM2lHdEUvbnA3U1dsVXZSck5uOS9HNU1m?=
 =?utf-8?B?b25zMDk2UlhoMG1heUhmRERiTDVuSGJzaWNEVVJ1WFVkdmIzcVRGSWZaWXdF?=
 =?utf-8?B?RTJLS055c0xxdk84MU9iUmEvQ003bEF1QW9nNzdacHEwSzFXMEZUOWxVT1Nq?=
 =?utf-8?B?TzM1bXlhZ1QzWFh2ZHpkMVUraVVIQVJ2TjNFd3JmTzZ6WmtTK1hEamhpeWlq?=
 =?utf-8?B?ZVNkZUN4S1JDUVlHZUNiT1FwYTNDOWViaXNLdTZoNzVKWURVcXFyQlAyNXFV?=
 =?utf-8?B?cGs2WEgrUlRRRjhQYWREZlJyR3F1UDZFNG9iK3JFZW53OWQycFhFSnZqNHdC?=
 =?utf-8?B?VkdYU3pVZlcrRUUyN1UyR2VXdnFEdDgzclhSUWxobmpMQkpvSlVuencrN25N?=
 =?utf-8?B?aE1SMzRsNW9WQS9YY1JVbStzQ2RwTnZuN2JSZkRxamRCU2xJWDhiT2M3ZmJw?=
 =?utf-8?B?SUtwL2F3ZnFLRjdBV0h2Y0dvV1lMMStxaWlnZ01tbGhzaDJHSEpYeERCRWxi?=
 =?utf-8?B?cnBSM1hHcytFQk1IVTdPVEM5V3h3WVYrOUU4MUovTkZ3OTBldm5HUEFjbDdC?=
 =?utf-8?B?a1RWck4weDJ6OTJ5b2FNRDhuaXVHNFZ6ZGJya0Y4OFpkR0dLOERBVGpTeTFk?=
 =?utf-8?B?STFBbmd1bFNqek1pZVNDTFJXMnAvVkV4aTc2akRMcEIvQ21Id0tqRGFnWVdM?=
 =?utf-8?B?cW9LNitHZ2pOK2JHTUJNWDVpbE4wRjNVLzBPRkYvcUpHSFZrWjVPU0ExZUZl?=
 =?utf-8?B?SHduWUcxUE44Zlo2aXVSSTBRdjVFVDkwQ0JJbFhTQTk0U0FoTlFWeXBDc3hC?=
 =?utf-8?B?aG1ERXlRb0t5RTVMWThvMU1MNFVzZmRYSHFIMURscWlYaml2VFpyL0RuV0dj?=
 =?utf-8?B?RHdLZGZDcGpOa28zay9Kb21YVktRd2FUandiWm1UZk85NHdpL0YyWlFHaGNN?=
 =?utf-8?B?dHpQQ3gwdWtXa0IxZXJGSUl4eENveUd4cHlNTXJXVktuRGtZd3Q1TTBYUUgz?=
 =?utf-8?B?Nkxyd3BPNUFlVU5zUG5mNGsyOGNqdjRQZVNSb0N0dlg0UWVoR2pUTEorcWVm?=
 =?utf-8?B?LzBKWHM4WXNBZ01sSWFRNExuTFVxWlNma3cwUi9wOFhoQzdrUDllZTdjekI4?=
 =?utf-8?B?bnRIcUVHRFdocnNDOVd1b2o4TmFWSm5OdzRpT0tydkFTd1pBMWUzTi93UTlP?=
 =?utf-8?B?bFR2THUxc0lic0ZpeUI5eEFGRXl0RHNFcERqUzZ1eHJlcGhFUmFHQjE2Vlhp?=
 =?utf-8?B?SUJ0OE9BYUNmelRYNzlYOWR3UUYvMExFMFRvVEZQWUE3MW11VGlycUZic1d6?=
 =?utf-8?B?VkhBUEdGVTVtRWwzM0lVSHIzQ3ltdC9OeG5BK2lZL2FZWS83VUZWcHdKTENt?=
 =?utf-8?B?T2NNNGZKbnpQTmkyMnJWR041M2o5bHV3QXBaOEhmR0ZNQkN5MHp1TDUySnMz?=
 =?utf-8?B?MFZXdkliTmNzajU2djhRN2JVVktHQkpXcGpGbjNIcEIyYlBRcnRQN3owa2kw?=
 =?utf-8?B?VVFpME5oSzMycHQxc0hXOTJNL2s0dzlMaFdkWjRrV0NQcGpWSWlxT1FTekJz?=
 =?utf-8?B?dGpKU0hNM1I0Yjd2dW0rOEFEU2VqRmhUQUh3ZGNHdmpVc2tOd1FJcGViZWxZ?=
 =?utf-8?B?SENGZ0pseFdkSFUwankxNlpzSXRIQktBVnlsbkN4Z3hqc28yejl3S0VMUGFD?=
 =?utf-8?B?T0hoY29nZG0wRmpEWXJvTXRIL0VkVDg0U3JKdE9jalJJOHRaTzMwTExxT3du?=
 =?utf-8?B?YlQ5YXVEUmYyVUlZQUNSeUN2emUvM2NpcjFCdHBKWmhLZ3FvMk5PYS9wWENK?=
 =?utf-8?B?djhjU1hnOXFsSnlETldWZHBObnZjaHl1dXhSK1F1S3RjOFlTY2ROOVlOTWpY?=
 =?utf-8?B?dmc9PQ==?=
Content-ID: <F5BB86A183880C48BC3782F3D1F232E0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8417ce8-c9cc-4045-2954-08dc7fec53ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 14:33:37.4186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWJPlxlhybuKSKB6tNnk49zRZKoYjicueRRafzY6x6/+CKCJ2QS8u3Ez1A17w17d0YzLlDwGykrh9x4oAn24/FOGZ1nHfbDD8FMaccqNF80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6796
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.532100-8.000000
X-TMASE-MatchedRID: VfovoVrt/oYOwH4pD14DsPHkpkyUphL9fjJOgArMOCb3bBqxmjinTbs0
 9RsYKeKEiUqxWFzqa/9QGF7v4Up8Fw9FV6kNYiPHbc297PAGtWaQoBr+SFneJOfyso7l4CECNGR
 pRnc8uefONwCKwD2eBbkK4EPjG7pLvkVC8Xcyk7UmEURBmKrZlPngX/aL8PCNTgrQgyTabcbU00
 xRT8R7/mvKfnxrioXQXv3Br7NehX3p+5uxX4D6T3V7tdtvoibafkSt9GqmKVUA6s2mIXI3kP4ZA
 Usty2ENUySZEu6rYVqfb6bl1YfU90L9tcyTZdAsgxsfzkNRlfLdB/CxWTRRuyUIayx+Skid
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.532100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 850D670209E5A42AB2E209C581801795B764407DBDA7C67731A4A1DC9C5FBA002000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1338585941.1640847480"
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

--__=_Part_Boundary_006_1338585941.1640847480
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFR1ZSwgMjAyNC0wNS0yOCBhdCAwMjoxOSArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IE9uIFN1biwgMjAyNC0wNS0yNiBhdCAyMjo0NCArMDgwMCwgSmFzb24t
SkguTGluIHdyb3RlOg0KPiA+IFRvIHN1cHBvcnQgc2VjdXJlIHZpZGVvIHBhdGggZmVhdHVyZSwg
R0NFIGhhdmUgdG8gcmVhZC93cml0ZQ0KPiA+IHJlZ2lzdGdlcnMNCj4gPiBpbiB0aGUgc2VjdXJl
IHdvcmxkLiBHQ0Ugd2lsbCBlbmFibGUgdGhlIHNlY3VyZSBhY2Nlc3MgcGVybWlzc2lvbg0KPiA+
IHRvIHRoZQ0KPiA+IEhXIHdobyB3YW50cyB0byBhY2Nlc3MgdGhlIHNlY3VyZSBjb250ZW50IGJ1
ZmZlci4NCj4gPiANCj4gPiBBZGQgQ01EUSBzZWN1cmUgbWFpbGJveCBkcml2ZXIgdG8gbWFrZSBD
TURRIGNsaWVudCB1c2VyIGlzIGFibGUgdG8NCj4gPiBzZW5kaW5nIHRoZWlyIEhXIHNldHRpbmdz
IHRvIHRoZSBzZWN1cmUgd29ybGQuIFNvIHRoYXQgR0NFIGNhbg0KPiA+IGV4ZWN1dGUNCj4gPiBh
bGwgaW5zdHJ1Y3Rpb25zIHRvIGNvbmZpZ3VyZSBIVyBpbiB0aGUgc2VjdXJlIHdvcmxkLg0KPiA+
IA0KPiA+IFRPRE86DQo+ID4gMS4gU3F1YXNoIGNtZHFfc2VjX3Rhc2tfZXhlY193b3JrKCkgaW50
byBjbWRxX3NlY19tYm94X3NlbmRfZGF0YSgpLg0KPiA+IDIuIENhbGwgaW50byBURUUgdG8gcXVl
cnkgY29va2llIGluc3RlYWQgb2YgdXNpbmcgc2hhcmVkIG1lbW9yeSBpbg0KPiA+ICAgIGNtZHFf
c2VjX2dldF9jb29raWUoKS4NCj4gPiAzLiBSZWdpc3RlciBzaGFyZWQgbWVtb3J5IGFzIGNvbW1h
bmQgYnVmZmVyIGluc3RlYWQgb2YgY29weWluZw0KPiA+IG5vcm1hbA0KPiA+ICAgIGNvbW1hbmQg
YnVmZmVyIHRvIElXQyBzaGFyZWQgbWVtb3J5Lg0KPiA+IDQuIFVzZSBTT0ZUREVQIHRvIG1ha2Ug
Y21kcV9zZWNfcHJvYmUgbGF0ZXIgdGhhbiBPUFRFRSBsb2FkZWQgYW5kDQo+ID4gdGhlbg0KPiA+
ICAgIG1vdmUgY21kcV9zZWNfc2Vzc2lvbl9pbml0IGludG8gY21kcV9zZWNfcHJvYmUoKS4NCj4g
PiA1LiBSZW1vdmUgdGltZW91dCBkZXRlY3Rpb24gaW4gY21kcV9zZWNfc2Vzc2lvbl9zZW5kKCku
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1
bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ICtzdGF0aWMg
dm9pZCBjbWRxX3NlY19pcnFfbm90aWZ5X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0DQo+ID4gKndv
cmtfaXRlbSkNCj4gPiArew0KPiA+ICsJc3RydWN0IGNtZHFfc2VjICpjbWRxID0gY29udGFpbmVy
X29mKHdvcmtfaXRlbSwgc3RydWN0DQo+ID4gY21kcV9zZWMsIGlycV9ub3RpZnlfd29yayk7DQo+
ID4gKwlpbnQgaTsNCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZjbWRxLT5leGVjX2xvY2spOw0K
PiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPD0gY21kcS0+cGRhdGEtPnNlY3VyZV90aHJlYWRf
bnI7IGkrKykgew0KPiA+ICsJCXN0cnVjdCBjbWRxX3NlY190aHJlYWQgKnNlY190aHJlYWQgPSAm
Y21kcS0NCj4gPiA+c2VjX3RocmVhZFtpXTsNCj4gPiArCQl1MzIgY29va2llID0gY21kcV9zZWNf
Z2V0X2Nvb2tpZShjbWRxLCBzZWNfdGhyZWFkLQ0KPiA+ID5pZHgpOw0KPiANCj4gSSBwcmVmZXIg
dG8gZ2V0IGN1cnJlbnQgcGEgaW5zdGVhZCBvZiBjb29raWUsIGJ1dCB0aGUgY3VycmVudCBwYSBp
cw0KPiBtYXBwZWQgZnJvbSBzZWN1cmUgcGFja2V0IHBhIHRvIG5vcm1hbCBwYWNrZXQgcGEuDQo+
IElmIHNvbWV0aGluZyB3cm9uZywgbm9ybWFsIHdvcmxkIGNvdWxkIGtub3cgd2hlcmUgR0NFIGlz
IHN0YWxsZWQuIEFuZA0KPiB0aGlzIGlzIGhvdyBub3JtYWwgdGhyZWFkIGlycSBoYW5kbGVyIGRv
ZXMuDQo+IFdlIGNvdWxkIHVzZSBvbmUgbWV0aG9kIGZvciBib3RoIG5vcm1hbCB0aHJlYWQgYW5k
IHNlY3VyZSB0aHJlYWQuDQo+IFRoaXMgaXMgZWFzaWVyIHRvIG1haW50YWluIGNvZGUuDQo+IA0K
SSdsbCB0cnkgdG8gY2hhbmdlIGNvb2tpZSB0byBjbWQgYnVmZmVyIHBhIGFuZCBxdWVyeSBpdCBm
cm9tIHNlY3VyZQ0Kd29ybGQuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBSZWdhcmRz
LA0KPiBDSw0KPiANCj4gPiArDQo+ID4gKwkJaWYgKGNvb2tpZSA8IHNlY190aHJlYWQtPndhaXRf
Y29va2llIHx8ICFzZWNfdGhyZWFkLQ0KPiA+ID50YXNrX2NudCkNCj4gPiArCQkJY29udGludWU7
DQo+ID4gKw0KPiA+ICsJCWNtZHFfc2VjX2lycV9oYW5kbGVyKHNlY190aHJlYWQsIGNvb2tpZSwg
MCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJbXV0ZXhfdW5sb2NrKCZjbWRxLT5leGVjX2xvY2sp
Ow0KPiA+ICt9DQo+ID4gKw0K

--__=_Part_Boundary_006_1338585941.1640847480
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0NLLA0KDQpPbiYjMzI7VHVlLCYjMzI7MjAy
NC0wNS0yOCYjMzI7YXQmIzMyOzAyOjE5JiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYj
MzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7T24mIzMyO1N1biwm
IzMyOzIwMjQtMDUtMjYmIzMyO2F0JiMzMjsyMjo0NCYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5M
aW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7VG8mIzMyO3N1cHBvcnQmIzMyO3NlY3Vy
ZSYjMzI7dmlkZW8mIzMyO3BhdGgmIzMyO2ZlYXR1cmUsJiMzMjtHQ0UmIzMyO2hhdmUmIzMyO3Rv
JiMzMjtyZWFkL3dyaXRlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyZWdpc3RnZXJzDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtpbiYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO3dvcmxkLiYjMzI7R0NFJiMzMjt3aWxs
JiMzMjtlbmFibGUmIzMyO3RoZSYjMzI7c2VjdXJlJiMzMjthY2Nlc3MmIzMyO3Blcm1pc3Npb24N
CiZndDsmIzMyOyZndDsmIzMyO3RvJiMzMjt0aGUNCiZndDsmIzMyOyZndDsmIzMyO0hXJiMzMjt3
aG8mIzMyO3dhbnRzJiMzMjt0byYjMzI7YWNjZXNzJiMzMjt0aGUmIzMyO3NlY3VyZSYjMzI7Y29u
dGVudCYjMzI7YnVmZmVyLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtB
ZGQmIzMyO0NNRFEmIzMyO3NlY3VyZSYjMzI7bWFpbGJveCYjMzI7ZHJpdmVyJiMzMjt0byYjMzI7
bWFrZSYjMzI7Q01EUSYjMzI7Y2xpZW50JiMzMjt1c2VyJiMzMjtpcyYjMzI7YWJsZSYjMzI7dG8N
CiZndDsmIzMyOyZndDsmIzMyO3NlbmRpbmcmIzMyO3RoZWlyJiMzMjtIVyYjMzI7c2V0dGluZ3Mm
IzMyO3RvJiMzMjt0aGUmIzMyO3NlY3VyZSYjMzI7d29ybGQuJiMzMjtTbyYjMzI7dGhhdCYjMzI7
R0NFJiMzMjtjYW4NCiZndDsmIzMyOyZndDsmIzMyO2V4ZWN1dGUNCiZndDsmIzMyOyZndDsmIzMy
O2FsbCYjMzI7aW5zdHJ1Y3Rpb25zJiMzMjt0byYjMzI7Y29uZmlndXJlJiMzMjtIVyYjMzI7aW4m
IzMyO3RoZSYjMzI7c2VjdXJlJiMzMjt3b3JsZC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7VE9ETzoNCiZndDsmIzMyOyZndDsmIzMyOzEuJiMzMjtTcXVhc2gmIzMyO2Nt
ZHFfc2VjX3Rhc2tfZXhlY193b3JrKCkmIzMyO2ludG8mIzMyO2NtZHFfc2VjX21ib3hfc2VuZF9k
YXRhKCkuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsyLiYjMzI7Q2FsbCYjMzI7aW50byYjMzI7VEVFJiMz
Mjt0byYjMzI7cXVlcnkmIzMyO2Nvb2tpZSYjMzI7aW5zdGVhZCYjMzI7b2YmIzMyO3VzaW5nJiMz
MjtzaGFyZWQmIzMyO21lbW9yeSYjMzI7aW4NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyO2NtZHFfc2VjX2dldF9jb29raWUoKS4NCiZndDsmIzMyOyZndDsmIzMyOzMuJiMzMjtSZWdp
c3RlciYjMzI7c2hhcmVkJiMzMjttZW1vcnkmIzMyO2FzJiMzMjtjb21tYW5kJiMzMjtidWZmZXIm
IzMyO2luc3RlYWQmIzMyO29mJiMzMjtjb3B5aW5nDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtub3JtYWwN
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbW1hbmQmIzMyO2J1ZmZlciYjMzI7
dG8mIzMyO0lXQyYjMzI7c2hhcmVkJiMzMjttZW1vcnkuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjs0LiYj
MzI7VXNlJiMzMjtTT0ZUREVQJiMzMjt0byYjMzI7bWFrZSYjMzI7Y21kcV9zZWNfcHJvYmUmIzMy
O2xhdGVyJiMzMjt0aGFuJiMzMjtPUFRFRSYjMzI7bG9hZGVkJiMzMjthbmQNCiZndDsmIzMyOyZn
dDsmIzMyO3RoZW4NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO21vdmUmIzMyO2Nt
ZHFfc2VjX3Nlc3Npb25faW5pdCYjMzI7aW50byYjMzI7Y21kcV9zZWNfcHJvYmUoKS4NCiZndDsm
IzMyOyZndDsmIzMyOzUuJiMzMjtSZW1vdmUmIzMyO3RpbWVvdXQmIzMyO2RldGVjdGlvbiYjMzI7
aW4mIzMyO2NtZHFfc2VjX3Nlc3Npb25fc2VuZCgpLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFz
b24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYt
Ynk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlh
dGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtb
c25pcF0NCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3N0YXRpYyYjMzI7dm9pZCYjMzI7
Y21kcV9zZWNfaXJxX25vdGlmeV93b3JrKHN0cnVjdCYjMzI7d29ya19zdHJ1Y3QNCiZndDsmIzMy
OyZndDsmIzMyOyp3b3JrX2l0ZW0pDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrew0KJmd0OyYjMzI7Jmd0
OyYjMzI7K3N0cnVjdCYjMzI7Y21kcV9zZWMmIzMyOypjbWRxJiMzMjs9JiMzMjtjb250YWluZXJf
b2Yod29ya19pdGVtLCYjMzI7c3RydWN0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjbWRxX3NlYywmIzMy
O2lycV9ub3RpZnlfd29yayk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjtpOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K211dGV4X2xvY2soJmFtcDtjbWRxLSZn
dDtleGVjX2xvY2spOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2Zv
ciYjMzI7KGkmIzMyOz0mIzMyOzA7JiMzMjtpJiMzMjsmbHQ7PSYjMzI7Y21kcS0mZ3Q7cGRhdGEt
Jmd0O3NlY3VyZV90aHJlYWRfbnI7JiMzMjtpKyspJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
c3RydWN0JiMzMjtjbWRxX3NlY190aHJlYWQmIzMyOypzZWNfdGhyZWFkJiMzMjs9JiMzMjsmYW1w
O2NtZHEtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7c2VjX3RocmVhZFtpXTsNCiZndDsmIzMyOyZn
dDsmIzMyOyt1MzImIzMyO2Nvb2tpZSYjMzI7PSYjMzI7Y21kcV9zZWNfZ2V0X2Nvb2tpZShjbWRx
LCYjMzI7c2VjX3RocmVhZC0NCiZndDsmIzMyOyZndDsmIzMyOyZndDtpZHgpOw0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtJJiMzMjtwcmVmZXImIzMyO3RvJiMzMjtnZXQmIzMyO2N1cnJlbnQmIzMyO3Bh
JiMzMjtpbnN0ZWFkJiMzMjtvZiYjMzI7Y29va2llLCYjMzI7YnV0JiMzMjt0aGUmIzMyO2N1cnJl
bnQmIzMyO3BhJiMzMjtpcw0KJmd0OyYjMzI7bWFwcGVkJiMzMjtmcm9tJiMzMjtzZWN1cmUmIzMy
O3BhY2tldCYjMzI7cGEmIzMyO3RvJiMzMjtub3JtYWwmIzMyO3BhY2tldCYjMzI7cGEuDQomZ3Q7
JiMzMjtJZiYjMzI7c29tZXRoaW5nJiMzMjt3cm9uZywmIzMyO25vcm1hbCYjMzI7d29ybGQmIzMy
O2NvdWxkJiMzMjtrbm93JiMzMjt3aGVyZSYjMzI7R0NFJiMzMjtpcyYjMzI7c3RhbGxlZC4mIzMy
O0FuZA0KJmd0OyYjMzI7dGhpcyYjMzI7aXMmIzMyO2hvdyYjMzI7bm9ybWFsJiMzMjt0aHJlYWQm
IzMyO2lycSYjMzI7aGFuZGxlciYjMzI7ZG9lcy4NCiZndDsmIzMyO1dlJiMzMjtjb3VsZCYjMzI7
dXNlJiMzMjtvbmUmIzMyO21ldGhvZCYjMzI7Zm9yJiMzMjtib3RoJiMzMjtub3JtYWwmIzMyO3Ro
cmVhZCYjMzI7YW5kJiMzMjtzZWN1cmUmIzMyO3RocmVhZC4NCiZndDsmIzMyO1RoaXMmIzMyO2lz
JiMzMjtlYXNpZXImIzMyO3RvJiMzMjttYWludGFpbiYjMzI7Y29kZS4NCiZndDsmIzMyOw0KSSYj
Mzk7bGwmIzMyO3RyeSYjMzI7dG8mIzMyO2NoYW5nZSYjMzI7Y29va2llJiMzMjt0byYjMzI7Y21k
JiMzMjtidWZmZXImIzMyO3BhJiMzMjthbmQmIzMyO3F1ZXJ5JiMzMjtpdCYjMzI7ZnJvbSYjMzI7
c2VjdXJlDQp3b3JsZC4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQomZ3Q7JiMzMjtSZWdh
cmRzLA0KJmd0OyYjMzI7Q0sNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYj
MzI7Jmd0OyYjMzI7K2lmJiMzMjsoY29va2llJiMzMjsmbHQ7JiMzMjtzZWNfdGhyZWFkLSZndDt3
YWl0X2Nvb2tpZSYjMzI7fHwmIzMyOyFzZWNfdGhyZWFkLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
O3Rhc2tfY250KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7K2NvbnRpbnVlOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2NtZHFfc2VjX2lycV9oYW5kbGVyKHNlY190aHJlYWQs
JiMzMjtjb29raWUsJiMzMjswKTsNCiZndDsmIzMyOyZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrbXV0ZXhfdW5sb2NrKCZhbXA7Y21kcS0mZ3Q7ZXhl
Y19sb2NrKTsNCiZndDsmIzMyOyZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQoNCjwv
cHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioq
KioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdl
IChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3By
aWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUg
dW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9u
bHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9u
LCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBp
ZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGll
dmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUt
bWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xv
c2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsg
eW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_1338585941.1640847480--

