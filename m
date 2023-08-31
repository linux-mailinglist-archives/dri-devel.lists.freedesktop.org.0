Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC478F382
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05510E6D2;
	Thu, 31 Aug 2023 19:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0C610E6D1;
 Thu, 31 Aug 2023 19:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNDPfArE10mlpucyKpowlI/CjKOET2wUDtCVfOK8kVJkVfRkMtHDY9WmQeP2zdbx3EW6nKRoNKh2iODCjy/EmOplhQa5EgWSNklbY9VB1AAMvseVaWCfN7YIRJks32oQUzPhYFcNLDmDNEm4S97bnN29MQzoS3IHcZoz/Gv7IECYOl850yL7LEf8C20tv7zyam+rSRKO1E+vNAES0s+SeKMbmNA8A0LMgEiVrGDDvtE1kW3xB/TDhikeCQaut9bVPX8A+u9nVQAT3R0V2Gu6uGHdzII+JZki3BsQ9w3SOj3tUnsRCBPHNy1U6yLwQvlr/Z6dDVeOpor3kok9FgOEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUSXkd6Kpcjdsa8kBfS9jeiwBWp9d9mKmcql8VLfKbc=;
 b=ggYrfXSJxMXHAB8YVbxsbpTcQ96IreB4/dpzVWG3sSs+IwgE3t8dnbUrVkYSgNSeHqLj0f3F2AMBa0QxitGyvMQUPnXNLfDO3PjilWXHURfhk8trt/kLaXnNsLpfxGDx9IfdxNlHbKHUkSz/ACJqmAGU+O8HFyMnSjZJq3N/vI0iL++tDA+u6mYbMhNfSTrAyPpEH7xwgKMMyJdGV+52gTvyLlHMgeR5m93YExKlWL2aSB+bP8rSXy3vlp8MMaRGADNKIKf6F4P1m8NzbXE9JPZ9KDN4u3bqTzweuucFyLL731GwD4Njm123HBhg76ccOZTJuSgPyBIqfg0asp0gag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUSXkd6Kpcjdsa8kBfS9jeiwBWp9d9mKmcql8VLfKbc=;
 b=0A8461Rapfk6XBOeP/cyPyakqU5MWNaJ77dPuH0X4UHUCcOuRhoOa8GQTFbGDtoZdNT8t6GKPH1wzO+aSIUokDqL0LVhBwt4rkjoZ4Bf4+Zfzetgh/ssWg3yNQSXsM12204xSRCeQwcv8NfGq+HA709hXeQXX8sMU8e5KefB9kM=
Received: from BN8PR12MB3348.namprd12.prod.outlook.com (2603:10b6:408:47::29)
 by BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 19:44:55 +0000
Received: from BN8PR12MB3348.namprd12.prod.outlook.com
 ([fe80::4da1:41ec:ea:5ffd]) by BN8PR12MB3348.namprd12.prod.outlook.com
 ([fe80::4da1:41ec:ea:5ffd%3]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:44:54 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] Revert "drm/amd/display: Remove v_startup
 workaround for dcn3+"
Thread-Topic: [PATCH v2 1/2] Revert "drm/amd/display: Remove v_startup
 workaround for dcn3+"
Thread-Index: AQHZ3ELMGrLV7rAo8Eug1E9OKdPAC7AEzodA
Date: Thu, 31 Aug 2023 19:44:54 +0000
Message-ID: <BN8PR12MB3348509D47663AD2C5685AE4E5E5A@BN8PR12MB3348.namprd12.prod.outlook.com>
References: <20230831193844.154254-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230831193844.154254-1-hamza.mahfooz@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-31T19:44:15.8382281Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB3348:EE_|BL0PR12MB4948:EE_
x-ms-office365-filtering-correlation-id: cbe54379-a349-405d-26ed-08dbaa5ac002
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYql3YDFLzKL4QtwgkkZ+/3IE0X51ccosLMoEN5hcMmC3770n4zjvCG8OfZXZ+qA7JLoXpjo8x/gHWAuJnkc7LHlH1JG8djFm6DD2/tHNhLRMndSyGBi1z61IkjRs+G/wgpCmEd9xLWOMqQ1PlWkpKD7dsQ/jVG/+PwFh3LaJGgby/WXph37Rr3Iisx39RrCHRg796AAIqj8Ob5FzwJIudW9wHYy4VI5NSVDPFhJ9L0jAGyGYpCKa9Advz5cZq0CNdRrLfDf0ka/+bf+xOV63EKubKnh6unJut+XyvPHpyYWLGAG4YjWMUxRXdweDfZKOsU1HI90EqTZAhWaT7MjrUus/U11piqaN6unBmHdUvetc9z0esnK6mOP7FYfMDXusCgiwq+dnJTHeBTGert3BVswk9c2R0+3m7CsyZPS5IbAVIeL4NfX2R5QmE6OqsEVinFBuM63GC0tky5oPXf70aFWhxgtNfS7Bql1zAtBHT1XYTug5FY2+OprfL8Uv3taNdsKHYH45pH3HKl/QJR6y/4iZe73T0Q4RSZg88NEFrumfANgl0gvdrd5Yi0t4rB6CCUKG2zFvZZsYMOuTzHcULyn+iPpAhEp3kIdWECk3yU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3348.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(1800799009)(186009)(451199024)(9686003)(66556008)(41300700001)(86362001)(66946007)(66476007)(2906002)(76116006)(64756008)(54906003)(316002)(66446008)(33656002)(8936002)(4326008)(8676002)(52536014)(26005)(5660300002)(55016003)(83380400001)(38070700005)(38100700002)(122000001)(71200400001)(478600001)(966005)(166002)(7696005)(6506007)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?V01ZQXkyU1hzeXNzNVVjZG1vK0l2N2lNMUtaSHdHK0pMaXM0OWhxUWFPcWxy?=
 =?gb2312?B?MWtUYzNDUFpOVU9COUxGTTN1dVhXSUpyR0tUbG0ydVBDWWZVVGVFRFlPRW1N?=
 =?gb2312?B?TURUZUh5UWpoRHpVUllaRVlkaXV6M01DZXJFY3gybXplNXUzenhLN1JVSDBz?=
 =?gb2312?B?WW9Ka0J4cUlPRzlTYnVlcUo5QlJQZlpWZG9DaGtpdktVVDV2eFZEL2xLelo4?=
 =?gb2312?B?WlViVHVpMDBVNGpRYkpoQ0Z3V3FkS2xTWmhHaFVmOHpjU25jS3JlZDRNWmll?=
 =?gb2312?B?Z1RJN2o0d2Q4cEdNVHNibm16KzZFOFR5MG56YWNrdUVmZ1JUR0FWUGhPZC9z?=
 =?gb2312?B?TzUxZDlOREZTWUlvVkFIVld6REtnekJkV3VaNW1lTkR5MERuems3MFJ0K1BL?=
 =?gb2312?B?cXBSTW9wVU1TeTQ1ODZhYmM5a0ZMOERyTVpZL3hoSm9oUS9VZ1hOcUErWmZk?=
 =?gb2312?B?YmFVd0thQnBlTm03UXU2aXpGMlNDajZwSlhPMGVLYTBMVmI2YW56NHNmVXo1?=
 =?gb2312?B?eWJUS1VqcTJUWXJnbHRGSkNvbkVaU1FyQnZwUndZdzdLRlp1bUIyUjA3MlNx?=
 =?gb2312?B?NjJ6dS93V0hLUzJUMlU5MG9IMkQxU285bEVIQkNBU2xzYVlqbjZkajc1UUdn?=
 =?gb2312?B?aTNqMnIwanhXK1I1dFhLT2VSMHROU3VLOVREcy92b1FoWGp6QlUxcnpRZWNN?=
 =?gb2312?B?Ui9BR1kzZXNJT0dWV2NRbGxMWFp5ZmtXd0RwL3JIZ0szZGpRcmk3SVZTQkgy?=
 =?gb2312?B?cTdwemUrWE8yZzhwNXhnMGFIZUFJaHRXWEhSUDZ5NlVpenZha1g4aWM2Ulo2?=
 =?gb2312?B?ZWlRRU9sT2ZqZnI1R2d1UXpzNDAxbE0xSHJNOGJKWHJJQUhrSHJodGxscWdu?=
 =?gb2312?B?cWVxc25QOGM1ekhMUzlrd2pKYmZXN0F6dHMyRXdsblZtekR0T3lRZG9EMFBk?=
 =?gb2312?B?aE80SXhlbUFvVzUzOTE2SmlNWVp1bkFrTG0rQzliakVpL2VjcFlYaFRyam1t?=
 =?gb2312?B?S1pDR0NkNGkwVzJ0Z1JtYXlUZHp5azFpQWNDVlpxV1ZDMnh0WjBuZTd1bU1j?=
 =?gb2312?B?dDlmL2J5TlZBWVJBMXA5V21ScVFMKzR1MnlON3NnYzE1a2ZnZXlHMXJyeTFw?=
 =?gb2312?B?ZFBPRjZ4VEVycmwwT3RqbFhRQ3o3RDlYVG9OeVdRYXJBdkN1UmR0aDhHYWtq?=
 =?gb2312?B?aXYxWlppTlE2Ny9iQWRqeGJQeTA1TTlhb1BCRzIraVZkb0VNVTRYTUpzQjMw?=
 =?gb2312?B?SEhxQlE3ZzVPWjVBY1hhN1Myc2h5Z1lMaU10S3NlblRHWEZ1WjM3Q2g1SjRx?=
 =?gb2312?B?QzFDUVZNZnNXcTFuM3k1MGttYmpSM2VWeGE4ZmJ5bFA1YkZzeE1uQXkrazlU?=
 =?gb2312?B?TzlOT2paSktWa3lvU1gwZVkvN1ArWXBVZkdxNnZ1UGtGL2Y2V3BaOFRoaHRq?=
 =?gb2312?B?bUJ4WWlsWThqdHRRNTN2ZFdwU0hPVzFZbElRWUd0eHNiRVpWQ1hPQTNFQyts?=
 =?gb2312?B?RWcxbFhydzhmRlpwUDVxOGRqOEE4amxHMjZvWkMwcDRyeUgyS3ppemlERTUv?=
 =?gb2312?B?Z1JzZmtDMVBqOHdBd0krTTJSWndHRU12MzRiTmtwdDNVNnNuQkxtR0FuM2ZG?=
 =?gb2312?B?bmtQbVY5c2MrMlBkSS9ZeWoybEtFd1RaV3FaRG1Rd1lnd2pHdkgvUHlDNkFl?=
 =?gb2312?B?MmZOVStrNWxHWkRZSzVOVnZxcEdxTUl0ckNEZ2tSYitFSjRUVmxCUVdydDdk?=
 =?gb2312?B?amh1Y1lzVUxLUGhYNTNIdmk4bE1uMW82Ti90UjIvY3pQVEhQYm1jSy8xZENJ?=
 =?gb2312?B?U1QrTjJ2VWx3UHM2eENySWRIWEd6blh1S1BnKy8vR3JnZmRtRGVSRWpzRTMv?=
 =?gb2312?B?R3A4R2s5T0Y2WUFNWC9TRUNwWUtwdHRxWG41K2t6bDR1ZytrWXhrRGpTazNt?=
 =?gb2312?B?ZE9lc2tQTHM3c0Y2d3RGU2hVdjY2b0QwdzhkbTdVSmd4bHAvdXB2YmNsREtG?=
 =?gb2312?B?YUpKaFdQTkxKRFdqU204MlV4SURCclptNi9MOTdqRXcvMkxsT0tCWnVuV2xF?=
 =?gb2312?B?MGhPeVR0TmtiU0hMajhZNVM2cDVyK2IrMXUyTzBmbXJ6WEkxTVR1TGsrVjcz?=
 =?gb2312?Q?Oi6APmTdtJwp4d8KCcHM4QFIk?=
Content-Type: multipart/alternative;
 boundary="_000_BN8PR12MB3348509D47663AD2C5685AE4E5E5ABN8PR12MB3348namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3348.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe54379-a349-405d-26ed-08dbaa5ac002
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 19:44:54.8115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v43UTlPsoGMi+258Po7i6FugMfHzyxzu2BafPOaxv05/oLZZQofg83UFmlf46tLW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4948
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
Cc: "Miess,
 Daniel" <Daniel.Miess@amd.com>, "Teeger, Gabe" <Gabe.Teeger@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kim,
 Sung joon" <Sungjoon.Kim@amd.com>, "Lei, Jun" <Jun.Lei@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Lee, Alvin" <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BN8PR12MB3348509D47663AD2C5685AE4E5E5ABN8PR12MB3348namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KU2VyaWVzIGlzOg0KDQpSZXZp
ZXdlZC1CeTogRmFuZ3poaSBadW8gPGplcnJ5Lnp1b0BhbWQuY29tPg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBNYWhmb296LCBIYW16YSA8SGFtemEuTWFoZm9v
ekBhbWQuY29tPg0Kt6LLzcqxvOQ6INDHxtrLxCwgsMvUwiAzMSwgMjAyMyAzOjM5OjA0IM/CzucN
CsrVvP7IyzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPg0Ks63LzTogWnVvLCBKZXJyeSA8SmVycnkuWnVvQGFtZC5jb20+OyBNYWhm
b296LCBIYW16YSA8SGFtemEuTWFoZm9vekBhbWQuY29tPjsgc3RhYmxlQHZnZXIua2VybmVsLm9y
ZyA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz47IFdlbnRsYW5kLCBIYXJyeSA8SGFycnkuV2VudGxh
bmRAYW1kLmNvbT47IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBhbWQuY29tPjsgU2lx
dWVpcmEsIFJvZHJpZ28gPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhh
bmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJp
c3RpYW4uS29lbmlnQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsg
RGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD47IExlaSwgSnVuIDxKdW4uTGVpQGFtZC5jb20+OyBQaWxsYWksIEF1cmFiaW5kbyA8
QXVyYWJpbmRvLlBpbGxhaUBhbWQuY29tPjsgS2F6bGF1c2thcywgTmljaG9sYXMgPE5pY2hvbGFz
LkthemxhdXNrYXNAYW1kLmNvbT47IExpdSwgV2VuamluZyA8V2VuamluZy5MaXVAYW1kLmNvbT47
IExlZSwgQWx2aW4gPEFsdmluLkxlZTJAYW1kLmNvbT47IEtpbSwgU3VuZyBqb29uIDxTdW5nam9v
bi5LaW1AYW1kLmNvbT47IE1pZXNzLCBEYW5pZWwgPERhbmllbC5NaWVzc0BhbWQuY29tPjsgVGVl
Z2VyLCBHYWJlIDxHYWJlLlRlZWdlckBhbWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQrW98ziOiBbUEFU
Q0ggdjIgMS8yXSBSZXZlcnQgImRybS9hbWQvZGlzcGxheTogUmVtb3ZlIHZfc3RhcnR1cCB3b3Jr
YXJvdW5kIGZvciBkY24zKyINCg0KVGhpcyByZXZlcnRzIGNvbW1pdCAzYTMxZThiODliNzI0MGQ5
YTE3YWNlOGExZWQwNTBiZGNiNTYwZjllLg0KDQpXZSBzdGlsbCBuZWVkIHRvIGNhbGwgZGNuMjBf
YWRqdXN0X2ZyZWVzeW5jX3Zfc3RhcnR1cCgpIGZvciBvbGRlciBEQ04zKw0KQVNJQ3Mgb3RoZXJ3
aXNlIGl0IGNhbiBjYXVzZSBEUCB0byBIRE1JIDIuMSBQQ09OcyB0byBmYWlsIHRvIGxpZ2h0IHVw
Lg0KDQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KTGluazogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9pc3N1ZXMvMjgwOQ0KU2lnbmVkLW9mZi1ieTogSGFtemEg
TWFoZm9veiA8aGFtemEubWFoZm9vekBhbWQuY29tPg0KLS0tDQogLi4uL2RybS9hbWQvZGlzcGxh
eS9kYy9kbWwvZGNuMjAvZGNuMjBfZnB1LmMgIHwgMjQgKysrKy0tLS0tLS0tLS0tLS0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMC9kY24yMF9mcHUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMjAvZGNuMjBfZnB1LmMN
CmluZGV4IDA5ODlhMDE1MmFlOC4uMWJmZGYwMjcxZmRmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMC9kY24yMF9mcHUuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMC9kY24yMF9mcHUuYw0KQEAgLTEwOTks
NiArMTA5OSwxMCBAQCB2b2lkIGRjbjIwX2NhbGN1bGF0ZV9kbGdfcGFyYW1zKHN0cnVjdCBkYyAq
ZGMsDQogICAgICAgICAgICAgICAgIGNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0ucGxhbmVf
cmVzLmJ3LmRwcGNsa19raHogPQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBpcGVzW3BpcGVfaWR4XS5jbGtzX2NmZy5kcHBjbGtfbWh6ICogMTAwMDsN
CiAgICAgICAgICAgICAgICAgY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtpXS5waXBlX2RsZ19w
YXJhbSA9IHBpcGVzW3BpcGVfaWR4XS5waXBlLmRlc3Q7DQorICAgICAgICAgICAgICAgaWYgKGNv
bnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtLT5hZGFwdGl2ZV9zeW5jX2luZm9wYWNr
ZXQudmFsaWQpDQorICAgICAgICAgICAgICAgICAgICAgICBkY24yMF9hZGp1c3RfZnJlZXN5bmNf
dl9zdGFydHVwKA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY29udGV4dC0+cmVz
X2N0eC5waXBlX2N0eFtpXS5zdHJlYW0tPnRpbWluZywNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJmNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0ucGlwZV9kbGdfcGFyYW0udnN0
YXJ0dXBfc3RhcnQpOw0KDQogICAgICAgICAgICAgICAgIHBpcGVfaWR4Kys7DQogICAgICAgICB9
DQpAQCAtMTkyNyw3ICsxOTMxLDYgQEAgc3RhdGljIGJvb2wgZGNuMjBfdmFsaWRhdGVfYmFuZHdp
ZHRoX2ludGVybmFsKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqY28NCiAgICAgICAg
IGludCB2bGV2ZWwgPSAwOw0KICAgICAgICAgaW50IHBpcGVfc3BsaXRfZnJvbVtNQVhfUElQRVNd
Ow0KICAgICAgICAgaW50IHBpcGVfY250ID0gMDsNCi0gICAgICAgaW50IGkgPSAwOw0KICAgICAg
ICAgZGlzcGxheV9lMmVfcGlwZV9wYXJhbXNfc3QgKnBpcGVzID0ga3phbGxvYyhkYy0+cmVzX3Bv
b2wtPnBpcGVfY291bnQgKiBzaXplb2YoZGlzcGxheV9lMmVfcGlwZV9wYXJhbXNfc3QpLCBHRlBf
QVRPTUlDKTsNCiAgICAgICAgIERDX0xPR0dFUl9JTklUKGRjLT5jdHgtPmxvZ2dlcik7DQoNCkBA
IC0xOTUxLDE1ICsxOTU0LDYgQEAgc3RhdGljIGJvb2wgZGNuMjBfdmFsaWRhdGVfYmFuZHdpZHRo
X2ludGVybmFsKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqY28NCiAgICAgICAgIGRj
bjIwX2NhbGN1bGF0ZV93bShkYywgY29udGV4dCwgcGlwZXMsICZwaXBlX2NudCwgcGlwZV9zcGxp
dF9mcm9tLCB2bGV2ZWwsIGZhc3RfdmFsaWRhdGUpOw0KICAgICAgICAgZGNuMjBfY2FsY3VsYXRl
X2RsZ19wYXJhbXMoZGMsIGNvbnRleHQsIHBpcGVzLCBwaXBlX2NudCwgdmxldmVsKTsNCg0KLSAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgZGMtPnJlc19wb29sLT5waXBlX2NvdW50OyBpKyspIHsNCi0g
ICAgICAgICAgICAgICBpZiAoIWNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtKQ0K
LSAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQotICAgICAgICAgICAgICAgaWYgKGNv
bnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtLT5hZGFwdGl2ZV9zeW5jX2luZm9wYWNr
ZXQudmFsaWQpDQotICAgICAgICAgICAgICAgICAgICAgICBkY24yMF9hZGp1c3RfZnJlZXN5bmNf
dl9zdGFydHVwKA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY29udGV4dC0+cmVz
X2N0eC5waXBlX2N0eFtpXS5zdHJlYW0tPnRpbWluZywNCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJmNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0ucGlwZV9kbGdfcGFyYW0udnN0
YXJ0dXBfc3RhcnQpOw0KLSAgICAgICB9DQotDQogICAgICAgICBCV19WQUxfVFJBQ0VfRU5EX1dB
VEVSTUFSS1MoKTsNCg0KICAgICAgICAgZ290byB2YWxpZGF0ZV9vdXQ7DQpAQCAtMjIzMiw3ICsy
MjI2LDYgQEAgYm9vbCBkY24yMV92YWxpZGF0ZV9iYW5kd2lkdGhfZnAoc3RydWN0IGRjICpkYywN
CiAgICAgICAgIGludCB2bGV2ZWwgPSAwOw0KICAgICAgICAgaW50IHBpcGVfc3BsaXRfZnJvbVtN
QVhfUElQRVNdOw0KICAgICAgICAgaW50IHBpcGVfY250ID0gMDsNCi0gICAgICAgaW50IGkgPSAw
Ow0KICAgICAgICAgZGlzcGxheV9lMmVfcGlwZV9wYXJhbXNfc3QgKnBpcGVzID0ga3phbGxvYyhk
Yy0+cmVzX3Bvb2wtPnBpcGVfY291bnQgKiBzaXplb2YoZGlzcGxheV9lMmVfcGlwZV9wYXJhbXNf
c3QpLCBHRlBfQVRPTUlDKTsNCiAgICAgICAgIERDX0xPR0dFUl9JTklUKGRjLT5jdHgtPmxvZ2dl
cik7DQoNCkBAIC0yMjYxLDE1ICsyMjU0LDYgQEAgYm9vbCBkY24yMV92YWxpZGF0ZV9iYW5kd2lk
dGhfZnAoc3RydWN0IGRjICpkYywNCiAgICAgICAgIGRjbjIxX2NhbGN1bGF0ZV93bShkYywgY29u
dGV4dCwgcGlwZXMsICZwaXBlX2NudCwgcGlwZV9zcGxpdF9mcm9tLCB2bGV2ZWwsIGZhc3RfdmFs
aWRhdGUpOw0KICAgICAgICAgZGNuMjBfY2FsY3VsYXRlX2RsZ19wYXJhbXMoZGMsIGNvbnRleHQs
IHBpcGVzLCBwaXBlX2NudCwgdmxldmVsKTsNCg0KLSAgICAgICBmb3IgKGkgPSAwOyBpIDwgZGMt
PnJlc19wb29sLT5waXBlX2NvdW50OyBpKyspIHsNCi0gICAgICAgICAgICAgICBpZiAoIWNvbnRl
eHQtPnJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtKQ0KLSAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7DQotICAgICAgICAgICAgICAgaWYgKGNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhb
aV0uc3RyZWFtLT5hZGFwdGl2ZV9zeW5jX2luZm9wYWNrZXQudmFsaWQpDQotICAgICAgICAgICAg
ICAgICAgICAgICBkY24yMF9hZGp1c3RfZnJlZXN5bmNfdl9zdGFydHVwKA0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtpXS5zdHJlYW0t
PnRpbWluZywNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNvbnRleHQtPnJlc19j
dHgucGlwZV9jdHhbaV0ucGlwZV9kbGdfcGFyYW0udnN0YXJ0dXBfc3RhcnQpOw0KLSAgICAgICB9
DQotDQogICAgICAgICBCV19WQUxfVFJBQ0VfRU5EX1dBVEVSTUFSS1MoKTsNCg0KICAgICAgICAg
Z290byB2YWxpZGF0ZV9vdXQ7DQotLQ0KMi40MS4wDQoNCg0K

--_000_BN8PR12MB3348509D47663AD2C5685AE4E5E5ABN8PR12MB3348namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div dir=3D"auto">
<div dir=3D"auto">
<p><span style=3D"font-size: 12pt;">Series is:</span><br>
</p>
<p>Reviewed-By: Fangzhi Zuo &lt;jerry.zuo@amd.com&gt;</p>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div id=3D"mail-editor-reference-message-container" dir=3D"auto">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>=B7=A2=BC=FE=
=C8=CB:</strong> Mahfooz, Hamza &lt;Hamza.Mahfooz@amd.com&gt;<br>
<strong>=B7=A2=CB=CD=CA=B1=BC=E4:</strong> =D0=C7=C6=DA=CB=C4, =B0=CB=D4=C2=
 31, 2023 3:39:04 =CF=C2=CE=E7<br>
<strong>=CA=D5=BC=FE=C8=CB:</strong> amd-gfx@lists.freedesktop.org &lt;amd-=
gfx@lists.freedesktop.org&gt;<br>
<strong>=B3=AD=CB=CD:</strong> Zuo, Jerry &lt;Jerry.Zuo@amd.com&gt;; Mahfoo=
z, Hamza &lt;Hamza.Mahfooz@amd.com&gt;; stable@vger.kernel.org &lt;stable@v=
ger.kernel.org&gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Li, Sun=
 peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Sique=
ira@amd.com&gt;;
 Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &l=
t;Christian.Koenig@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; Dav=
id Airlie &lt;airlied@gmail.com&gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;;=
 Lei, Jun &lt;Jun.Lei@amd.com&gt;; Pillai, Aurabindo &lt;Aurabindo.Pillai@a=
md.com&gt;;
 Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&gt;; Liu, Wenjing &lt=
;Wenjing.Liu@amd.com&gt;; Lee, Alvin &lt;Alvin.Lee2@amd.com&gt;; Kim, Sung =
joon &lt;Sungjoon.Kim@amd.com&gt;; Miess, Daniel &lt;Daniel.Miess@amd.com&g=
t;; Teeger, Gabe &lt;Gabe.Teeger@amd.com&gt;; dri-devel@lists.freedesktop.o=
rg
 &lt;dri-devel@lists.freedesktop.org&gt;; linux-kernel@vger.kernel.org &lt;=
linux-kernel@vger.kernel.org&gt;<br>
<strong>=D6=F7=CC=E2:</strong> [PATCH v2 1/2] Revert &quot;drm/amd/display:=
 Remove v_startup workaround for dcn3+&quot;<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This reverts commit 3a31e8b89b7240d9a17ace8a1ed050=
bdcb560f9e.<br>
<br>
We still need to call dcn20_adjust_freesync_v_startup() for older DCN3+<br>
ASICs otherwise it can cause DP to HDMI 2.1 PCONs to fail to light up.<br>
<br>
Cc: stable@vger.kernel.org<br>
Link: <a href=3D"https://gitlab.freedesktop.org/drm/amd/-/issues/2809">http=
s://gitlab.freedesktop.org/drm/amd/-/issues/2809</a><br>
Signed-off-by: Hamza Mahfooz &lt;hamza.mahfooz@amd.com&gt;<br>
---<br>
&nbsp;.../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c&nbsp; | 24 ++++---------=
------<br>
&nbsp;1 file changed, 4 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c<br>
index 0989a0152ae8..1bfdf0271fdf 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c<br>
@@ -1099,6 +1099,10 @@ void dcn20_calculate_dlg_params(struct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].plane_res.bw.dppclk_k=
hz =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipes[pipe_=
idx].clks_cfg.dppclk_mhz * 1000;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; context-&gt;res_ctx.pipe_ctx[i].pipe_dlg_param =3D pi=
pes[pipe_idx].pipe.dest;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;res_ctx.pipe_ctx[i].stream-&gt;adaptive_sync_inf=
opacket.valid)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_adjust_fre=
esync_v_startup(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].stream=
-&gt;timing,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].pipe_d=
lg_param.vstartup_start);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pipe_idx++;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
@@ -1927,7 +1931,6 @@ static bool dcn20_validate_bandwidth_internal(struct =
dc *dc, struct dc_state *co<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_split_from[MAX_PI=
PES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st=
 *pipes =3D kzalloc(dc-&gt;res_pool-&gt;pipe_count * sizeof(display_e2e_pip=
e_params_st), GFP_ATOMIC);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_LOGGER_INIT(dc-&gt;ctx-=
&gt;logger);<br>
&nbsp;<br>
@@ -1951,15 +1954,6 @@ static bool dcn20_validate_bandwidth_internal(struct=
 dc *dc, struct dc_state *co<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_wm(dc, con=
text, pipes, &amp;pipe_cnt, pipe_split_from, vlevel, fast_validate);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_dlg_params=
(dc, context, pipes, pipe_cnt, vlevel);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; dc-&gt;res_pool-=
&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;res_ctx.pipe_ctx[i].stream-&gt;adaptive_sync_inf=
opacket.valid)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_adjust_fre=
esync_v_startup(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].stream=
-&gt;timing,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].pipe_d=
lg_param.vstartup_start);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_END_WATERMARK=
S();<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto validate_out;<br>
@@ -2232,7 +2226,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vlevel =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_split_from[MAX_PI=
PES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pipe_cnt =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_e2e_pipe_params_st=
 *pipes =3D kzalloc(dc-&gt;res_pool-&gt;pipe_count * sizeof(display_e2e_pip=
e_params_st), GFP_ATOMIC);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DC_LOGGER_INIT(dc-&gt;ctx-=
&gt;logger);<br>
&nbsp;<br>
@@ -2261,15 +2254,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn21_calculate_wm(dc, con=
text, pipes, &amp;pipe_cnt, pipe_split_from, vlevel, fast_validate);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_calculate_dlg_params=
(dc, context, pipes, pipe_cnt, vlevel);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; dc-&gt;res_pool-=
&gt;pipe_count; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!context-&gt;res_ctx.pipe_ctx[i].stream)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;res_ctx.pipe_ctx[i].stream-&gt;adaptive_sync_inf=
opacket.valid)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcn20_adjust_fre=
esync_v_startup(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].stream=
-&gt;timing,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;context-&gt;res_ctx.pipe_ctx[i].pipe_d=
lg_param.vstartup_start);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BW_VAL_TRACE_END_WATERMARK=
S();<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto validate_out;<br>
-- <br>
2.41.0<br>
<br>
</div>
</span></font><br>
</div>
</div>
</div>
</body>
</html>

--_000_BN8PR12MB3348509D47663AD2C5685AE4E5E5ABN8PR12MB3348namp_--
