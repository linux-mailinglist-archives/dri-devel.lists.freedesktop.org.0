Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56242764420
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 05:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F384510E4D0;
	Thu, 27 Jul 2023 03:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606310E4D0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 03:04:51 +0000 (UTC)
X-UUID: 58810ee02c2a11eeb20a276fd37b9834-20230727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/OIUfn1+Whxs2ZbgV0H3gJgGQmnyV+1H+kLg+ezpZi8=; 
 b=pyN864NMb6P64BmpYN87/EsMyfYzyT/GeM9mlaH5IqFCJrOHnqz7Qc+s1kY9J9tIIgeM5Z/Q1nCINJgdlFLGRtWDMvkTug7+ahnt1GHD7pdosIB9yfDxUTLzkyOx0WTYQyK9HZXuX2mNl+GUcXRNa6ZXc2tpMEbY2jZnNN3BXv0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:179a8e45-3935-4364-9c64-7d90b93d72b0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7562a7, CLOUDID:cfa55fd2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 58810ee02c2a11eeb20a276fd37b9834-20230727
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2051877871; Thu, 27 Jul 2023 11:04:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jul 2023 11:04:46 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jul 2023 11:04:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpPGebeWD/yGABjmihhMA+XtzvXA0JwQO0jvwyqjMu8q0rRnZfMYSOoWzoEPlpji8Mo6JYnMe0EuPezWOau7bz3n05rzuTirEl0LOdQHJxpMzkvQsqYlPPoxRzpbIdUlLNX28u3e1maEXxKpCn4u+mrR0/wg//4F58NmdZCFw23FTzNy/AEeeCz+uoRbvMIIpizm2FmPl1xOLgQoacKJZqwOGo+9bvqoiatVjYo4IlXj2J9z3CGBAJ0IZloLOE1KGb1XZpyUam/B3ufDaT3b5iQovehNmmPP+ep/GZDuvkZieq5qJGwZrGkzki53F08TkZ4DIjqRyMw1jviXlApPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBoBM7BHSrM8pQvVLgwGZKSpSbkF4hgWaufVtQXFyg4=;
 b=I4+xvG6Ld3TiNCiDUmtDCvPS80LbuQx4t334EWB1aZHtJEVQpRI+9qn5Mbi7XXBvfzR0lPPQVPhQoqYT95D7UyrNqlBnF79feczjb38fS7ILOR0JNUoVEWb4t8CzCXmMZP2SnVmSEN7xR0V+1ghauK6tf0j1SGOZe74wslqin0MSVjRLXhnJqG/woVwOMdS/bDPApXGjPomZ2q5WthCWubNaSNnTxFqyeWU0uaojq3M5RFSUIc+eSzUIJwBqzoOV85in8UjdwoMD1HiyhEh6CVAxijY3KOvj7TTfVB27N03tFw1ikXNN9iD2ijCX4P2NE1kxIG2TQORNjkp8VtMRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBoBM7BHSrM8pQvVLgwGZKSpSbkF4hgWaufVtQXFyg4=;
 b=C5rEzvZ8JBMhWlXiuADCxWW5arH0/6XvAiwRvFfH/ZuLjpe6GQ53tfLkhjGexIac2mA0Hde09fi84fm3olotWCTgxXYDvu2aSueAXsZ1NV0F3oLahE/mfQBD0CN8JcSslYzHJw/o+VmjpI5pau2vKS3a30hUKxPCrDS9FM+F5Nw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8361.apcprd03.prod.outlook.com (2603:1096:101:1a5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 03:04:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:04:44 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "greenjustin@chromium.org" <greenjustin@chromium.org>
Subject: Re: [PATCH v2] drm/mediatek: Add valid modifier check
Thread-Topic: [PATCH v2] drm/mediatek: Add valid modifier check
Thread-Index: AQHZv/rlLei1qvOJkEKHc1f/UDL6Oq/M7jkA
Date: Thu, 27 Jul 2023 03:04:44 +0000
Message-ID: <47101b2026e0419cff265de25e8a110b19a1e8b8.camel@mediatek.com>
References: <20230726195232.1369289-1-greenjustin@chromium.org>
In-Reply-To: <20230726195232.1369289-1-greenjustin@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8361:EE_
x-ms-office365-filtering-correlation-id: 37e44db9-8e23-400c-32fa-08db8e4e3ab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rxlqSaLPjFgFH5s2yCl/wnHr/7GtZHa6X8jkiWqBWmD2lPm1PTausZzZTbJnJhCqp7cRL92Aeywt59IIK/9eMK4yZepW0VF+1Ez0caLQXGjUwQoAOhTxIVNfxLdLZvwHe9fPjzP0V8j9hgr0tg103EVS5jmpGQ2tXQgJViPQvvnokVQflTacSy8PiJbFpNYgp2p2MbyXUWz/A12HHaZAo0iuq/dyuin0eSXDOd3Yz8UEAaQOlCBzhRX7GbDJmNPa928j3+6BQcoX1KnsgnicJtcMlHEP6Ld03pDcTzVULUwDLO3l7adxc1RwWq95sgLimMEd+AbomuCgOhvgq1rI9RKCIqtwUY1TXf041rsgf0ZbUHZyVfZ+WANeTx0rehZYGlPnSM6yt9V8VA/Q/gcgKnQdgUEHaErEk1UCMDvXhUnZsvy4AA9j+EopYIIMgX9tQ02xd+xPTN+jxw/1V+nTOyu8hIpjTTy+4AB+cXNmSR5PZ8YhQAi2rdH1DezsVCRkGwPQA4kRg/VcNUxnHS72Vibkf8W4tKsevbQxBAvtXJX5VYXolMenPPEaLbEuJKhE61IZKgpkRzW+CXqQ9Mh9aM38tsWZW1ofttvS1MbBma1qTY/EJZkNNbDkp7QCKQ1ue9MjEO4J12xcqxaR9pw5Zrc5iaUm70s+/5Jp1vOW/hc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199021)(85182001)(86362001)(36756003)(2906002)(38070700005)(110136005)(83380400001)(186003)(6506007)(26005)(6486002)(6512007)(54906003)(38100700002)(122000001)(76116006)(478600001)(8936002)(64756008)(66556008)(41300700001)(66476007)(71200400001)(66446008)(5660300002)(316002)(66946007)(4326008)(8676002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d00reTAzQWhmZElsbktKSkszQU9vRVRYenlNTnBENndRQjlVUXZlWmU2aE9N?=
 =?utf-8?B?Skpka0dkcURDWlBNeTJoODZZWFRQeVNNemZUOGM2RHZEaVBpL2tqck9Tc2dM?=
 =?utf-8?B?VGxoMEpVSXVZb2gwdXQ4ZmF5Vm9WSGVyVWgvK2dSYjZlWUM4RWhUcUZkbytI?=
 =?utf-8?B?bi9KYzAzck5RTCsxQUxFVXN2TUswUzNRenF3SGw2RGdCVkF0TDhPS0dGRnNT?=
 =?utf-8?B?akFnejZzY2xiWDVlRHZKNDNabkl1eGNQM1ZxUlZqUStwakFmZ3NCNGR1UW13?=
 =?utf-8?B?Y3RKQmJGSVNrK3Nkd1kvOHVUdS9YdzJabHhRdjU3Rm11aGx1eUF4Yyt1UjRj?=
 =?utf-8?B?bW5ZMUNUeVlKQnZpdlN6U1NubzZJcVY4V1ExY2dxbEpCWlowL1lVV2hScXRj?=
 =?utf-8?B?OEJrVXBJQ1VGa2NwWm0yMlNLVEpKVkdScmxuS05hMWhQRnNUallKamROK2NX?=
 =?utf-8?B?MTVCRU44NWNGRkxnODlKL3FndExJd2M4b09mTDh1UmVWb2VmWkdXREtkdVlW?=
 =?utf-8?B?OVl5clpWem1lTVEyanp5T2NoQjlESzBqSkUraFJKWWIvYXIybm8yMWpGWWJB?=
 =?utf-8?B?eng4dnl4TmlZVmc4NHdOR2M4dTBPbGdna0h0TFFCUG9rKzZmS080VldzMHR3?=
 =?utf-8?B?WEJVODNmdHRkenhYUnhmOGtIREhQT1E2aGV6WVVNU0cwb294aUZxWFhBY3BK?=
 =?utf-8?B?VFh0R2dONTAwS1VXTWNndUZnVUpYWWxlTnpCOG1xMGVKUlFKR3Ywemw3akhY?=
 =?utf-8?B?RUdwaUtuMzRLcFMzek9tdyt3b1hNL0xjVk1LdEgxbFJOUFB2QTVPRU5VRlZG?=
 =?utf-8?B?Smc4QjdibWptOXl1Y000eitYQ1h0dHowbDh6K2F0NndqTDhzQ2I1YnpCT2Y5?=
 =?utf-8?B?ZEhSOVBNTFFQdmdnUEliM2RTYzJNN0Jvd2pFMzZ4ZmdBSDFFUnJKSktreUxz?=
 =?utf-8?B?UHI1K0JUTGlKQ1JlNmp0QTVNSFc0NzZDMnNpSnFZMGttK21tSzB5dWFGcnBk?=
 =?utf-8?B?YS9ON3Z4ekRTdytydU1SdVFacG9Nb3NQRFNCdUJPdmtNcjhTcUs4Rms5S1M4?=
 =?utf-8?B?QjI3TFJmWktwMWNUcUdQRXMvNE9FNVdsQmZDcFRNTkk3N0NQc1pXbUZkeVhJ?=
 =?utf-8?B?b2w0R0o4Q20zcndRWDZndkVOQzMxempQRkNkY09iZE1ENHhNWGkrNUkvbHdn?=
 =?utf-8?B?NHhRa2MwRzNiTDVkRmdRY0JFb1EwbksvWDFQTDFLNFVCR29IZ0d6eU8zQnRF?=
 =?utf-8?B?eHdGYUJpUkFxZkQ0dUFGZ1hIMWNWdS84cGZJTnpsSXNGQUdzbGpXWjUxQmor?=
 =?utf-8?B?S2NuWnFzN1lwYW1YeXhQWGpNZjI4VlFiUWFTaHhOL1RPMUh3SVYxNi8zTVZz?=
 =?utf-8?B?RlBRNVduUU9YclA5UWxTbDVoZ05IczgrNFNmbURWNi9XUmhHT01jb29lSE50?=
 =?utf-8?B?b2p3UUdKZUpERGpEMUN4OGJoT0llZlNNQjJPZHNvYUtQOUttQVhRU2VuVlFC?=
 =?utf-8?B?d0NHTUZRZXZtQzJWdXU5RE5nTE5pRFU3WWs3bjdvcUIyM2NQd3RVM1U0dklj?=
 =?utf-8?B?M2s4cXlZWnlaQVU1eFVxMUdsSzdzQ2hhamhTdEFVU0RXc1R3WitWWkRQbGFk?=
 =?utf-8?B?ejBsNzBteDBxMTBwNldPU1pQOWZRNGI0c2p3QWs2d3UrdVQyODVrTUJqM3Ns?=
 =?utf-8?B?R0pQNE8yNjZHYTRvTlVUNFEzakFzLzYrbHMrN2ZpV3pPUFNjc2ZzNWttUnJ4?=
 =?utf-8?B?b1pneHZ6WndlYUFyMHlvQUN1NlA2V1FTdithMlpzN3JwMmZ2OHhSQzZodDRL?=
 =?utf-8?B?aEhZZ3RCMDBFWitBSmswNTFqMGs1QWxsUVBLcmFGLzJYZHVsV0xmcVBRRWlM?=
 =?utf-8?B?aFZHcGRqd1V3TmtSVDNpZTdBNS92cWVZNjh1SHdId0VwdkNMY2l5anR0V3Nq?=
 =?utf-8?B?MGtGNG5tTnJkYjkvZ2VwaHZqZTkxdnZlYndTai9wVkJmSElzUnMxV1JnUFpY?=
 =?utf-8?B?Y1AzbnpXOG8wKzN0THlqQlc0eEpQYUFmZVZTeGowY3JXclRmWi9EdEhXZUF3?=
 =?utf-8?B?bmMwS09FQjNQUk5kZi9QaVFPZWtocGFGSTI5UWVyendPaE55QjhmaDFyRW9v?=
 =?utf-8?B?UkVOamJ2Q2Q4SUJGTmlxQmFHWVpSNUVwRkNuQnRhelJHRmJ1dUtudFFkVUhO?=
 =?utf-8?B?d0E9PQ==?=
Content-ID: <3C6A46B07D742A4195BE7D46BD86BBBB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e44db9-8e23-400c-32fa-08db8e4e3ab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 03:04:44.6586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuoSDw5tsaFIGcUQSGZkGiUJ7bqB30MqlQMwsufunahlLoZrqBr8sCHPQYhXa8X22xv8fTXlBuIkGYLnSO7gsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8361
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1439893373.603243721"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_1439893373.603243721
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SnVzdGluOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0yNiYjMzI7
YXQmIzMyOzE1OjUyJiMzMjstMDQwMCwmIzMyO0p1c3RpbiYjMzI7R3JlZW4mIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMz
MjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29w
ZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2
ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQom
Z3Q7JiMzMjsmIzMyO0FkZCYjMzI7YSYjMzI7Y2hlY2smIzMyO3RvJiMzMjttdGtfZHJtX21vZGVf
ZmJfY3JlYXRlKCkmIzMyO3RoYXQmIzMyO3JlamVjdHMmIzMyO2FueSYjMzI7bW9kaWZpZXINCiZn
dDsmIzMyO3RoYXQNCiZndDsmIzMyO2lzJiMzMjtub3QmIzMyO3RoZSYjMzI7QUZCQyYjMzI7bW9k
ZSYjMzI7c3VwcG9ydGVkJiMzMjtieSYjMzI7TVQ4MTk1JiMzOTtzJiMzMjtkaXNwbGF5JiMzMjtv
dmVybGF5cy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGVzdGVkJiMzMjtieSYjMzI7Ym9vdGluZyYj
MzI7Q2hyb21lT1MmIzMyO2FuZCYjMzI7dmVyaWZ5aW5nJiMzMjt0aGUmIzMyO1VJJiMzMjt3b3Jr
cywmIzMyO2FuZCYjMzI7YnkmIzMyO3J1bm5pbmcNCiZndDsmIzMyO3RoZSYjMzI7Q2hyb21lT1Mm
IzMyO2ttc19hZGRmYl9iYXNpYyYjMzI7YmluYXJ5LCYjMzI7d2hpY2gmIzMyO2hhcyYjMzI7YSYj
MzI7dGVzdCYjMzI7Y2FsbGVkDQomZ3Q7JiMzMjsmcXVvdDthZGRmYjI1LWJhZC1tb2RpZmllciZx
dW90OyYjMzI7dGhhdCYjMzI7YXR0ZW1wdHMmIzMyO3RvJiMzMjtjcmVhdGUmIzMyO2EmIzMyO2Zy
YW1lYnVmZmVyJiMzMjt3aXRoJiMzMjt0aGUNCiZndDsmIzMyO21vZGlmaWVyJiMzMjtEUk1fRk9S
TUFUX01PRF9JTlZBTElEJiMzMjthbmQmIzMyO3ZlcmlmaWVzJiMzMjt0aGUmIzMyO0FEREZCMiYj
MzI7aW9jdGwmIzMyO3JldHVybnMNCiZndDsmIzMyO0VJTlZBTC4NCg0KUmV2aWV3ZWQtYnk6JiMz
MjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0p1c3RpbiYjMzI7R3JlZW4mIzMyOyZsdDtncmVl
bmp1c3RpbkBjaHJvbWl1bS5vcmcmZ3Q7DQomZ3Q7JiMzMjtUZXN0ZWQtYnk6JiMzMjtGZWkmIzMy
O1NoYW8mIzMyOyZsdDtmc2hhb0BjaHJvbWl1bS5vcmcmZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyO3YyOg0KJmd0OyYjMzI7JiMzMjsqJiMzMjtSZXBsYWNlJiMzMjt6ZXJvJiMzMjtjaGVjayYj
MzI7d2l0aCYjMzI7Y29tcGFyaXNvbiYjMzI7dG8mIzMyO0RSTV9GT1JNQVRfTU9EX0xJTkVBUi4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYyYjMzI7fCYjMzI7NyYjMzI7KysrKysrKw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxl
JiMzMjtjaGFuZ2VkLCYjMzI7NyYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0K
Jmd0OyYjMzI7aW5kZXgmIzMyO2NkNWIxOGVmNzk1MS4uMjcxOWExZTMxNjNhJiMzMjsxMDA2NDQN
CiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
Yw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jDQomZ3Q7JiMzMjtAQCYjMzI7LTUxLDYmIzMyOys1MSwxMyYjMzI7QEAmIzMyO210a19kcm1f
bW9kZV9mYl9jcmVhdGUoc3RydWN0JiMzMjtkcm1fZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7
JiMzMjtpZiYjMzI7KGluZm8tJmd0O251bV9wbGFuZXMmIzMyOyE9JiMzMjsxKQ0KJmd0OyYjMzI7
JiMzMjtyZXR1cm4mIzMyO0VSUl9QVFIoLUVJTlZBTCk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYj
MzI7K2lmJiMzMjsoY21kLSZndDttb2RpZmllclswXSYjMzI7IT0mIzMyO0RSTV9GT1JNQVRfTU9E
X0xJTkVBUiYjMzI7JmFtcDsmYW1wOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7Y21k
LSZndDttb2RpZmllclswXSYjMzI7IT0mIzMyO0RSTV9GT1JNQVRfTU9EX0FSTV9BRkJDKA0KJmd0
OyYjMzI7K0FGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDgNCiZndDsmIzMyO3wNCiZndDsm
IzMyOytBRkJDX0ZPUk1BVF9NT0RfU1BMSVQmIzMyO3wNCiZndDsmIzMyOytBRkJDX0ZPUk1BVF9N
T0RfU1BBUlNFKSkNCiZndDsmIzMyOytyZXR1cm4mIzMyO0VSUl9QVFIoLUVJTlZBTCk7DQomZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7ZHJtX2dlbV9mYl9jcmVhdGUoZGV2LCYj
MzI7ZmlsZSwmIzMyO2NtZCk7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7
JiMzMjstLSYjMzI7DQomZ3Q7JiMzMjsyLjQxLjAuNDg3Lmc2ZDcyZjNlOTk1LWdvb2cNCg0KPC9w
cmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1439893373.603243721
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEp1c3RpbjoNCg0KT24gV2VkLCAyMDIzLTA3LTI2IGF0IDE1OjUyIC0wNDAwLCBKdXN0aW4g
R3JlZW4gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgQWRkIGEgY2hlY2sgdG8gbXRrX2RybV9tb2Rl
X2ZiX2NyZWF0ZSgpIHRoYXQgcmVqZWN0cyBhbnkgbW9kaWZpZXINCj4gdGhhdA0KPiBpcyBub3Qg
dGhlIEFGQkMgbW9kZSBzdXBwb3J0ZWQgYnkgTVQ4MTk1J3MgZGlzcGxheSBvdmVybGF5cy4NCj4g
DQo+IFRlc3RlZCBieSBib290aW5nIENocm9tZU9TIGFuZCB2ZXJpZnlpbmcgdGhlIFVJIHdvcmtz
LCBhbmQgYnkgcnVubmluZw0KPiB0aGUgQ2hyb21lT1Mga21zX2FkZGZiX2Jhc2ljIGJpbmFyeSwg
d2hpY2ggaGFzIGEgdGVzdCBjYWxsZWQNCj4gImFkZGZiMjUtYmFkLW1vZGlmaWVyIiB0aGF0IGF0
dGVtcHRzIHRvIGNyZWF0ZSBhIGZyYW1lYnVmZmVyIHdpdGggdGhlDQo+IG1vZGlmaWVyIERSTV9G
T1JNQVRfTU9EX0lOVkFMSUQgYW5kIHZlcmlmaWVzIHRoZSBBRERGQjIgaW9jdGwgcmV0dXJucw0K
PiBFSU5WQUwuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdXN0aW4gR3JlZW4gPGdyZWVuanVzdGluQGNocm9taXVtLm9y
Zz4NCj4gVGVzdGVkLWJ5OiBGZWkgU2hhbyA8ZnNoYW9AY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4g
djI6DQo+ICAqIFJlcGxhY2UgemVybyBjaGVjayB3aXRoIGNvbXBhcmlzb24gdG8gRFJNX0ZPUk1B
VF9NT0RfTElORUFSLg0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jIHwgNyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCBjZDViMThl
Zjc5NTEuLjI3MTlhMWUzMTYzYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMNCj4gQEAgLTUxLDYgKzUxLDEzIEBAIG10a19kcm1fbW9kZV9mYl9jcmVhdGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIAlpZiAoaW5mby0+bnVtX3BsYW5lcyAhPSAxKQ0KPiAg
CQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gIA0KPiArCWlmIChjbWQtPm1vZGlmaWVyWzBd
ICE9IERSTV9GT1JNQVRfTU9EX0xJTkVBUiAmJg0KPiArCSAgICBjbWQtPm1vZGlmaWVyWzBdICE9
IERSTV9GT1JNQVRfTU9EX0FSTV9BRkJDKA0KPiArCQkJCQlBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tf
U0laRV8zMng4DQo+IHwNCj4gKwkJCQkJQUZCQ19GT1JNQVRfTU9EX1NQTElUIHwNCj4gKwkJCQkJ
QUZCQ19GT1JNQVRfTU9EX1NQQVJTRSkpDQo+ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0K
PiArDQo+ICAJcmV0dXJuIGRybV9nZW1fZmJfY3JlYXRlKGRldiwgZmlsZSwgY21kKTsNCj4gIH0N
Cj4gIA0KPiAtLSANCj4gMi40MS4wLjQ4Ny5nNmQ3MmYzZTk5NS1nb29nDQo=

--__=_Part_Boundary_002_1439893373.603243721--

