Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00D4B6A9E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 12:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB1A10E3F0;
	Tue, 15 Feb 2022 11:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B476D10E3F0;
 Tue, 15 Feb 2022 11:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d17eRlcrURyPtVPdj6CSYTVX98h1hA+wjkmAfbXpE1DpfPV0vV7u3b9fpds5aMkpZAF32BLJRMSx+5ejNrvsZFG+ZQCvKlBj4U/rPrCnLNM8D6CGP5TUn46jXAYYk7458SDR24p4EUwlQAhs6jVA5/6b01+GG7qDPD2ZFX9wSD54ReEG/9U028doJNgC0Y07CTfoLgBWeZixR69oBzyoj8hIi66IKMtyayeLI0SRmNpA8WR2SuRo9FSq9eNPoTFr7X9/agsP3rEuFH8SSug9QWQ8bL6/nc7bun97i0maI59or9spuWZLebwpR3yqfqXD9w2IeRZX3PwLZtTA45FfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D65h5012vVD65R8WlCs2I/MeRRgkXWF3EbBonUsbIg=;
 b=N2UcVexboIHXVkN8za73da1iAimYclvqnvUJOsFzdiEAGPLyct0K4TXWavsB23oCqd0KlJ3bWp7TRdLYzTuR56cKDOvePO81FQsbHm9U2o0LxVCqewvdfOyUETfMUjk8kearzFAkXqqvSDM6EpiiRCk/nmz1v1ikcgIz8kMa3r4cuYBWvhR4LT05EqS0VBOLDWqaL2vRbptDsgrJDa4rNr0Ha7tb/M63kQDZoz29M9LeDlaiyznrn9Sj1oCP5oZjtUKaB4kQYy8U8ZjBrhhRLEyoFKcLNEf0uiyz6gvi6sPqlzHNsCNz6UTLBcQ5o/NdZPmtx0sibO/v12hmeL8Sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D65h5012vVD65R8WlCs2I/MeRRgkXWF3EbBonUsbIg=;
 b=fna+EMa2vg5b8MUVf2iTZ1KKWrN0QAHbAHEEAHNdVC6E3accU9Us8nmC/hGzlGUikXuTr4FIUFcTxEyMa6/nLt4zsUQJwO98KzncGFCn+pbHY90QkjfCkhpZJ6b0waGJw1VTsV6LP7FdvTnZp+qn5/emYSL1gApaCkCotH9vXWY=
Received: from SJ0PR12MB5504.namprd12.prod.outlook.com (2603:10b6:a03:3ad::24)
 by BY5PR12MB3890.namprd12.prod.outlook.com (2603:10b6:a03:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 11:23:47 +0000
Received: from SJ0PR12MB5504.namprd12.prod.outlook.com
 ([fe80::9cc:9f51:a623:30c6]) by SJ0PR12MB5504.namprd12.prod.outlook.com
 ([fe80::9cc:9f51:a623:30c6%5]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 11:23:47 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "iam@lach.pw" <iam@lach.pw>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [2/2] drm/amd: use fixed dsc bits-per-pixel from edid
Thread-Topic: [2/2] drm/amd: use fixed dsc bits-per-pixel from edid
Thread-Index: AdgiXnlzLjvwyhTiSnGb7Uj4pLwEjQ==
Date: Tue, 15 Feb 2022 11:23:47 +0000
Message-ID: <SJ0PR12MB55040F0F0ECF27FB1E13889EFC349@SJ0PR12MB5504.namprd12.prod.outlook.com>
References: <20220213133128.5833-2-iam@lach.pw>
In-Reply-To: <20220213133128.5833-2-iam@lach.pw>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=eb6fb98c-bfda-42c4-94e4-53441be044b3;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-02-15T11:15:44Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ced2675d-5469-46d8-1f68-08d9f075a23d
x-ms-traffictypediagnostic: BY5PR12MB3890:EE_
x-microsoft-antispam-prvs: <BY5PR12MB38907BE33E02574D3847AE2DFC349@BY5PR12MB3890.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rv3jIx7w1RxckHBHA8XZPyoEOtDOEy+Cb9ltLYc6hG4ZinVjIEp6TLq9LM4lV+k9O9eUWI/fSvmTxP572GvtvEIOK5giDTJT7hfbMKA3DpTUxWnsobU/8KkFbmlsusW0mKNsYD95ARkpVxsM6owku7znSaatvUhN7NtAbffGaM1XiTgp/vHK7oSyxmIKWKwlgj962L8A+3e63LdynT6RyFrUUeSSqBungIrdg0z3oZWCqxGOoZMeQ32Qkr1jVHWe8sFTzaIB3xyEv95vZPO+vt9MTyrbVybCAteCOFtTHv6eWVEQco5oKNgSvsj7Vtdddwvexid3Gfx+i+hQpbbEAJrtIFDqZYjNS23erinuXJUcZ0TC1sQ9GiePYVwO7hPbKN9xAI9FMGsnbGvI4rXQA+1O9MYz9gljjlmJdZF/Jw0/CzMsdMzpGSV/kMdsdkRLVi59Qa0kfVfHbibb+yPSdK4kSPlNxr+DotTWt+5meCEoxtF8wYXYtdtFv658M8N/BbFo85CowxGMoaGMsOZstMh9sUz8wou96lzVSUMWJSy3WHwiHGhwIfIWq4qcJDPfsqzXFddxrfQcWger+eTmHmknzbx/dBx/1Hmw080ZqKRVRAme5/etou1YWDv2lBlch4itLcYQPW0bZcusaCuNS+XYyRdfxXzZEigv3JGuIOSZoaGwkwpVYNUl2pZtvQgPcJKt++abGSC4xPpeEwsATg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(110136005)(54906003)(86362001)(122000001)(55016003)(38070700005)(53546011)(26005)(316002)(76116006)(66476007)(7696005)(9686003)(6506007)(8936002)(5660300002)(8676002)(2906002)(66946007)(52536014)(4326008)(66556008)(71200400001)(64756008)(508600001)(33656002)(66446008)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3l5ZkJSZnM3QW9NUjczUnBCVTVlVGl6bHozWkliZ29RNm5OTTdocTBQb2RZ?=
 =?utf-8?B?bHVtbHV5TU9kWk5SN1hFTzdXSmg2Q2N6RExmcnI2STkxV3grV1NZOVdtOXgy?=
 =?utf-8?B?alVsQk5DWGs3dFBwVGpwdlZmcHNOOUV4b1F2V2dVYTZiWk0wbW5sOG1iTVk2?=
 =?utf-8?B?VHlTZ1I2UmFHcThXcWt5dGlvWkMxQ2szb0s5Rkc1bVpMQ1ByTUxzdGtZZjJ0?=
 =?utf-8?B?eDJVQSsyWEhBMG5URy9CdkFGdlFmTTRhTEkvaHk1TThXcmJaSXdNYzQ2UWNq?=
 =?utf-8?B?aWNVVUx3VytNVVRWNFpWcmsvczNKQzc5OUpXdE1SOFJ4VHBkSGI0UVowY3RX?=
 =?utf-8?B?MjZqa0tMcFc4TTQ3ZHJYdXpEcHZqeERDK1lXM2gyU2JaSDBBc0FPcnJRRGlz?=
 =?utf-8?B?Z2w1OE8vZnc2d2Q1RzBTV1lNSXR2VmsvOEh1R01NR05PVlZyMHJKOWNlVHI0?=
 =?utf-8?B?Yk1MYUZaVWpMbW1LTHg4SUpMdXAzanI3WFJiS3phTUxqU1FlbGJ2MU1sSk9M?=
 =?utf-8?B?TTY4dXVPMG04dmFGUlJRdXRxd1ViUEtBVzNwWlVxSHFRUlluak1UUno0NHVO?=
 =?utf-8?B?ZitreE1LVi9hNk9qbmo2Uk9uV3hIWVJMd1RpNGJIRHJua3BjNXZCMHQwenpv?=
 =?utf-8?B?OHZiR1RkVDEvU21UVHk5bWtTalZqY3lCY3ROSFhrMWlEaUwyNC9Zdzc5Q3U0?=
 =?utf-8?B?SGZMOGZaYUJJT01KMUtkQmlKZVFwdlI1Vjl6c2FWZHVGYlRKUVFoRlVWbGdI?=
 =?utf-8?B?UUdCeWlUY1lySEg4ckErQ285WkVidWNKVG9vRFlONFUyalZGdUtVUXJWTDZJ?=
 =?utf-8?B?enNrSm5rQmh1VGlpcHgwMFhUdzdRODZXSklMbUxpM3VaTTYwbDNBWHhuUXM1?=
 =?utf-8?B?clZLNTdZV2hFWVJvR01KWW44ajRjY3pwZkFBN3VpalpjS2ZoWm9XNjA5VjBX?=
 =?utf-8?B?UTBXQjJFaWlIZXRMRnl0a0xCQTF6MGViTFJ3Vzd0WFNyaHJ1MStCSWdXcXF3?=
 =?utf-8?B?Z284ZlBvaVNSM2RaOWFOUHZRUHlVcEs5L1F3QUM4MExneS9hcE05OUpWejRF?=
 =?utf-8?B?aFlkUkFXVlQvRlJJcHd5TlM4WDVpVnArWjVRcjc4ZFkzRUp2OTZQd04raUVC?=
 =?utf-8?B?ZURpMS9nam0yS3FjNjlQWEhvdDliOE5pWS9VZUloeDdibXBwVnRlNGhtTEoy?=
 =?utf-8?B?S2RabUlsMEdnUUZtZUViYWliY3NJclVMYzl5aVlteUlBa0ZNNi82RmZ3Y1Bv?=
 =?utf-8?B?cG5oVk9iV0M2Uk9oMkRxcm9CN1JUU2U2TWxyZHc0b29Bc0lPR2FaYytCaGpq?=
 =?utf-8?B?VTc2SkpMaTdVWjBhUXl5M3ROdTB2N0FDQVdVR3VneWJZNytKRENpeU5UWXJN?=
 =?utf-8?B?dGtqVXBFdzU4OW9xd1Rab2hNeDExV1Yyem1maVJtTnhMUFAxbHZVRDd6Z2xD?=
 =?utf-8?B?aXZiVlhZc0JRVTFvdFErbnBmdWVoUWwxd01EU2VUcXBLMldEYzA4bVBwcmdY?=
 =?utf-8?B?ckVIc2s3ME01TC9oVEdxdE1DZmdRMzkxdm5LS0hlbi9LczljOHg2NHhzQ1ls?=
 =?utf-8?B?UVBOL2UyOWE5UW9oTFFKL1hJbXBrdUVYSjFIRWpJTVJQVDAvNHBYaEV6NDhv?=
 =?utf-8?B?c3RpT1BQejE5WW8raHVQTmtySDNkT1NrMUtyWWVvcjEwbjVLaGpoOEI3clk2?=
 =?utf-8?B?V3RzMHUvaGZ2Nm95RHZHWXNZQkh5TTlMMnJvdHluTXpPQUN2QTVWSlBJYWoy?=
 =?utf-8?B?aUxJejI1YkF4V3pEeVR0NXFQSHlpdm9WTUp5N1BNT3pSY1RNOEwzeG5zc0xU?=
 =?utf-8?B?MHJ2YldBRFJ2Y2tDRFlYWnBtekdJdEFUalc5cDUwcTFaV3Jxalc0QUVVRUxk?=
 =?utf-8?B?M1ZrbGgzSThNa2J0TExudTExbU9OR2pvcHFCb3dYbllwWDRZQWJUSFlURUJT?=
 =?utf-8?B?UjVPRjdyM0t0ZlRGN3psbkxSenZ1cFduVmNpVktMYWxGaWtYNms0dHpRcDNQ?=
 =?utf-8?B?MHhibE1sK3drN1BiQms0S053U2kzQVVvMkZ0RXc1NlB0VlM1Tm0xbFgxemlo?=
 =?utf-8?B?djk2SHBaMjBhZWV1RUQ2Qml5NXlxYk9xT1ZNamRzdEJOZUUyMzY5OFFyTS9o?=
 =?utf-8?B?cGpTZVpwWS9HMDVIRGpaUy8vcllnejNUQjgwWGtVZXJVREZjTWh3YTNIWEFl?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced2675d-5469-46d8-1f68-08d9f075a23d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 11:23:47.1516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyItejZyZsfP7V25GuJJEsBVpuAjWEQx0ViInvgtEd/M5tD8bUD0jA4k0F2ExuT7E41BJUyxpTEX8UD/bp/1nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3890
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KSGksDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoIGFuZCBpdCBMR1RNLg0KRmVl
bCBmcmVlIHRvIGFkZA0KUmV2aWV3ZWQtYnk6IFdheW5lIExpbiA8V2F5bmUuTGluQGFtZC5jb20+
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFyb3NsYXYgQm9seXVr
aW4gPGlhbUBsYWNoLnB3Pg0KPiBTZW50OiBTdW5kYXksIEZlYnJ1YXJ5IDEzLCAyMDIyIDk6MzEg
UE0NCj4gVG86IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT47IFJvZHJpZ28gU2lxdWVpcmEgPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT47
IFBhbiwNCj4gWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBMZW8gTGkgPHN1bnBlbmcubGlA
YW1kLmNvbT47IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT47IENocmlz
dGlhbiBLP25pZw0KPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgWWFyb3NsYXYgQm9seXVr
aW4gPGlhbUBsYWNoLnB3Pg0KPiBTdWJqZWN0OiBbMi8yXSBkcm0vYW1kOiB1c2UgZml4ZWQgZHNj
IGJpdHMtcGVyLXBpeGVsIGZyb20gZWRpZA0KPg0KPiBWRVNBIHZlbmRvciBoZWFkZXIgZnJvbSBE
aXNwbGF5SUQgc3BlYyBtYXkgY29udGFpbiBmaXhlZCBiaXQgcGVyIHBpeGVsIHJhdGUsIGl0IHNo
b3VsZCBiZSByZXNwZWN0ZWQgYnkgZHJtIGRyaXZlcg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYXJv
c2xhdiBCb2x5dWtpbiA8aWFtQGxhY2gucHc+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgMiArKw0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgICAgICAgICAgIHwgMyAr
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oICAgICAgICAg
ICAgICAgICB8IDMgKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jDQo+IGluZGV4IDI5ZjA3YzI2ZC4u
YjM0ZGQ4OWFlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jDQo+IEBAIC0xMTgsNiArMTE4LDgg
QEAgZW51bSBkY19lZGlkX3N0YXR1cyBkbV9oZWxwZXJzX3BhcnNlX2VkaWRfY2FwcygNCj4NCj4g
ICAgICAgZWRpZF9jYXBzLT5lZGlkX2hkbWkgPSBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5pc19o
ZG1pOw0KPg0KPiArICAgICBlZGlkX2NhcHMtPmRzY19maXhlZF9iaXRzX3Blcl9waXhlbF94MTYg
PQ0KPiArY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uZHBfZHNjX2JwcDsNCj4gKw0KPiAgICAgICBz
YWRfY291bnQgPSBkcm1fZWRpZF90b19zYWQoKHN0cnVjdCBlZGlkICopIGVkaWQtPnJhd19lZGlk
LCAmc2Fkcyk7DQo+ICAgICAgIGlmIChzYWRfY291bnQgPD0gMCkNCj4gICAgICAgICAgICAgICBy
ZXR1cm4gcmVzdWx0Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfc3RyZWFtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19zdHJlYW0uYw0KPiBpbmRleCA1N2NmNGNiODIuLmY4NTE2ZWM3MCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMNCj4gQEAg
LTEwNSw2ICsxMDUsOCBAQCBzdGF0aWMgYm9vbCBkY19zdHJlYW1fY29uc3RydWN0KHN0cnVjdCBk
Y19zdHJlYW1fc3RhdGUgKnN0cmVhbSwNCj4NCj4gICAgICAgLyogRURJRCBDQVAgdHJhbnNsYXRp
b24gZm9yIEhETUkgMi4wICovDQo+ICAgICAgIHN0cmVhbS0+dGltaW5nLmZsYWdzLkxURV8zNDBN
Q1NDX1NDUkFNQkxFID0gZGNfc2lua19kYXRhLT5lZGlkX2NhcHMubHRlXzM0MG1jc2Nfc2NyYW1i
bGU7DQo+ICsgICAgIHN0cmVhbS0+dGltaW5nLmRzY19maXhlZF9iaXRzX3Blcl9waXhlbF94MTYg
PQ0KPiArICAgICAgICAgICAgIGRjX3NpbmtfZGF0YS0+ZWRpZF9jYXBzLmRzY19maXhlZF9iaXRz
X3Blcl9waXhlbF94MTY7DQo+DQo+ICAgICAgIG1lbXNldCgmc3RyZWFtLT50aW1pbmcuZHNjX2Nm
ZywgMCwgc2l6ZW9mKHN0cmVhbS0+dGltaW5nLmRzY19jZmcpKTsNCj4gICAgICAgc3RyZWFtLT50
aW1pbmcuZHNjX2NmZy5udW1fc2xpY2VzX2ggPSAwOyBAQCAtNzM4LDQgKzc0MCwzIEBAIHZvaWQg
ZGNfc3RyZWFtX2xvZyhjb25zdCBzdHJ1Y3QgZGMgKmRjLCBjb25zdCBzdHJ1Y3QNCj4gZGNfc3Ry
ZWFtX3N0YXRlICpzdHJlYW0pDQo+ICAgICAgICAgICAgICAgICAgICAgICAiXHRsaW5rOiAlZFxu
IiwNCj4gICAgICAgICAgICAgICAgICAgICAgIHN0cmVhbS0+bGluay0+bGlua19pbmRleCk7DQo+
ICB9DQo+IC0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y190eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmgNCj4g
aW5kZXggMDI4NWE0YjM4Li5jZTJlMTFkNzAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY190eXBlcy5oDQo+IEBAIC0yMjcsNiArMjI3LDkgQEAgc3RydWN0IGRjX2Vk
aWRfY2FwcyB7DQo+ICAgICAgIGJvb2wgZWRpZF9oZG1pOw0KPiAgICAgICBib29sIGhkcl9zdXBw
b3J0ZWQ7DQo+DQo+ICsgICAgIC8qIERpc3BsYXlQb3J0IGNhcHMgKi8NCj4gKyAgICAgdWludDMy
X3QgZHNjX2ZpeGVkX2JpdHNfcGVyX3BpeGVsX3gxNjsNCj4gKw0KPiAgICAgICBzdHJ1Y3QgZGNf
cGFuZWxfcGF0Y2ggcGFuZWxfcGF0Y2g7DQo+ICB9Ow0KPg0KLS0NClJlZ2FyZHMsDQpXYXluZSBM
aW4NCg==
