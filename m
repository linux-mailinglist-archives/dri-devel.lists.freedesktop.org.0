Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C6D536B78
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 09:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCD011211A;
	Sat, 28 May 2022 07:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8F010F131;
 Sat, 28 May 2022 07:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dew1uNRuhVBRzd0is5HaJ74Aejfp4V/HKcTNN5OWm8T2vBbExI978QaYg0rpZDYdgnJj0fOH3s7+wGQyTsW5aiFCeP5aMAtMRNlhpu87SAbNwD87n+QNu5BiRIZN4g13mYMpyRYsC06mEzhVIVFWdWJbR18qnQMrA7yGOelLTHhLSexHD0AL7eBFud/shuEGfNLF9hDMFeQP/FyT25YL5xguPBq7K9dz+mnUvkNdT/zEXYcaFgZXcyP0DF8lFFFt7VZY0ogrfJxUi6W2hRit9CLoLlH+XUJFsDQqEumbYEbU7MgjVKRAWIjljc87Z5HyabnA1O9h2RetjMCKLZ3eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nuv6IOdmETpFBHIidbtuVwFh+pSpCSUbdWhO7XziWJw=;
 b=QeREyLP7CVstM4eC0GBn076z9GnO8ak6xOH7azD6iT4nk0vLlYO2SKfcDYSvqopin+AyJuWvyWRx017ZUN8kCtLkpRyAYf7t8uQ44CBixoREahbA7q9p/mSnV3b/OhVBJYQ2qxVqZhobH69jQ/x6PidP/segJGv48kJH6iDScqaVjOpGojGVl77dJPsJ10LyvRkuhAdW5I9gyLCATA+yHckQCw9Ik59X7rPLymYWxgqgyPWnWHdaRWkqYQyQ0gLy/CIrlt7+iVW7XOlRV7dUe+BbQdKx91q9otAFqNrFMmZCyOcIb90wY2fFTZE3jhMKxhxOt1Kl8noPs5iQADXLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nuv6IOdmETpFBHIidbtuVwFh+pSpCSUbdWhO7XziWJw=;
 b=4FDPkM2zjjX2a6b99P4/2zXsCZL3QoTypdtLapa80REwjwuyPTAdnWnhEvwCvsYRGgcmGakhs20om40b7NIB/sS9D3oB72uZxmWAe3bulE3nkYehLi4iM7z/kKHQxgcctbWv7g6x/LIuDPwuS4pIgh9SabZUhWDwflr++dQfUAA=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BN6PR1201MB0179.namprd12.prod.outlook.com (2603:10b6:405:59::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sat, 28 May
 2022 07:43:59 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::1c8b:d7c0:bf7:d7d3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::1c8b:d7c0:bf7:d7d3%7]) with mapi id 15.20.5293.016; Sat, 28 May 2022
 07:43:58 +0000
From: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Mike Lothian <mike@fireburn.co.uk>
Subject: RE: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Thread-Topic: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Thread-Index: AQHYSkLuyQZC9+Z8JUaKDa0xeTQlh60CcEKAgAASsgCAAUPbgIAIEo4AgAAL+4CAAApQAIAVwBSAgAAomICAEkm/wA==
Date: Sat, 28 May 2022 07:43:58 +0000
Message-ID: <MN2PR12MB43425B6EC07A7F6877B884C7E4DB9@MN2PR12MB4342.namprd12.prod.outlook.com>
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
 <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
 <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
 <8b99ca20-f711-ec32-0cd2-16fc52846ce0@amd.com>
 <CAHbf0-EzPP5gAyZQmxeAo3Ep0g-rO4XbDgEB_SdsR84xY+at9A@mail.gmail.com>
 <CAHbf0-G-rnvNXaXxMzkPerW6h=9vkxJyysUUV-oJV5UGD67KqA@mail.gmail.com>
 <CADnq5_PTRPTsCvGwKFzNA_k7diAVqYEv1xV1yJszRD1K-v2FfQ@mail.gmail.com>
In-Reply-To: <CADnq5_PTRPTsCvGwKFzNA_k7diAVqYEv1xV1yJszRD1K-v2FfQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-05-28T06:23:10Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1e862171-e0a4-47b4-8a95-7985c32b8148;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-05-28T07:43:56Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: b4d298ae-94b1-44d1-a853-edb527f7437d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 747f7d11-43af-4ac4-d4da-08da407dd369
x-ms-traffictypediagnostic: BN6PR1201MB0179:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB0179A9EC40F5F6AC00CCCF3EE4DB9@BN6PR1201MB0179.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eCBqB8bIjKW7mXlOryttuWBHpf31vZmC4hW1oS1vDpneYRtX8R3Qgy4EZp/uYULLcYrGAitZOIUJaSrcG+i36Ik7det+IfyWgiU03ygO1BR0RvBHdz1I2hlrLn0nKAjhoK88O27EFRCbJ4CDbmc5HkoNIHcVBqwqkBxkfKMLACskcmGd1pbD94Ou06g/Tzl6EvnUtpo8uqBxTNDVNt2zdPc2BT9IqA0JbB3ZkLWLyJneZGUirfHjqfhXbcHorUtYIOlXnr0M1ktw8aei4/uwoj5tQKqqSsawnQJPW2ytsM9weSzIeozhT7UyecXrl+P4OrUbBDikavWBTaSIhMyMdcfeqR39WMR03icoSsel5gbSPyK9tQEQDmkc9gaqroMf1Wkhe1akvIyWItKzRXfJKayueqBAWBhglNsodwaj6i4l39hVqDdPu/WYRgROvnBJUkZRELp8wcXOt58DRXJ/TBkcRnioi+0/xCg8PJpYLzcdGaUzF9h8ny1IRG0VIpPFyi2yRei5xj2JC+cuSXgg5/C2tsR4oD2Ouk1qFCkYlII/jnFR3bXqxUadXreKOWOXpcdK4H4OkwRaWbQhb4Xs4BxjEcPiDW1UJLRM8/FpuZCG8Qipv7lFeaJ02KVjqKVUwi+SzScC1qSEASc+KW+yPC9cex0tQWNXeXq54asn8GDx1p0cDj0ZJ6enWcQldyCCYBSrJQQhKZ4DXElw4Qd7Tw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(66946007)(66556008)(64756008)(8676002)(66476007)(66446008)(9686003)(83380400001)(53546011)(76116006)(55016003)(38100700002)(5660300002)(122000001)(508600001)(33656002)(966005)(71200400001)(6506007)(316002)(7696005)(52536014)(110136005)(186003)(86362001)(54906003)(2906002)(26005)(38070700005)(66574015)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3F4ajJBN0RmaWloQjRvVkF5RytNQ2hONlBZUzNHSjd0cUV0NElqajFtMU9i?=
 =?utf-8?B?NmRUTStsTnl4eVhXOFMyVHNVdnZtaDl2VjUvMWcxRzk1RWZSTElXYWRsMTFF?=
 =?utf-8?B?SnFOcDJiY3NNWmg1dGFUajd3SVNxYTU2c0hNMmorMUw5RHNzNGZtYUZJcXRk?=
 =?utf-8?B?WXR2T3hxTTVaY2F6MjVuZUgxdi8xdGtuN1d0N3NPcTBwOFNWU3BETUc2dFMz?=
 =?utf-8?B?Y2RwTVlyRitiZXB4dE9XQU51bG5kdGJFbitla2hkRjUvMFJ6dE5ESEtoQmFr?=
 =?utf-8?B?OUhiUDYxd3JUdGxQNWY2MFZOR25TK29mZk9VSk1mbzA5Uko1REZTZmNIUFVV?=
 =?utf-8?B?MHJENVFqQklhdk16eFRZQ2YxMXlJYkZoVDhHd2luQVp0RUtydWF3REl5Szls?=
 =?utf-8?B?U1JmeWZaeEJtSFdtYkZ0ai9zK0Nua0lhOE40QkQ1ZjJtaFFWMXAvS25LbnlL?=
 =?utf-8?B?azFmSkY4dnlYUGpkNVU4Z3N2NlZsb3ZWT0VIdjF0K053em5HU1NPdkJ2UytN?=
 =?utf-8?B?V1ZGTUxybEd2ajdFbXNISTZHdFc4UWZTZXdSUDFzR2RlS1RqaFc0ZHFyeFow?=
 =?utf-8?B?dG4vdzdCVitsSG8velFJU0xTNVdTWUh2Z25GazdicmhFeGVwSnZ4TVpyY29O?=
 =?utf-8?B?TDROeHpMRXcveElrR1djVFVzNzZPc0pUNzBNdVczN2tVVlRhZVY2MVdJM1o1?=
 =?utf-8?B?K1AybjN6QVN0bW1zcDl6VDc2dDE5cVlwTXVoRGVrblJwYm16emRkNHY0aTJ6?=
 =?utf-8?B?cU8xbHpyMWxPVEpld0hwYzlwN1plUGR5WnNvWklZTzFuVy9FaHhYZGFCcFhH?=
 =?utf-8?B?Qlh2QUNtcE9CT0xmMnFFaW1abjVxRThKako2Uk5HdXM2SXEzdDQzd3phSFA3?=
 =?utf-8?B?Y3Jtak8vVXBnckdUOWZwMUxyWFc0Z21XN2ZIMkpDek1ocDRoUmpFSkVNTW5o?=
 =?utf-8?B?enhyVmQxYk41ZTBHNXZmbG5POWtnWW0vZ3lCY3pkNmQ0cHpDR2dJcGVhamxW?=
 =?utf-8?B?aWtjS081ZHhzakNTbjVRMkpOcmdWcVZSa01lOGsxeEZJS3lIQmNNSitBajNP?=
 =?utf-8?B?R1MzbkJiYVZ6Tm9JT2M1RXRseHAxb0ozYm1qZWdXbjdjN0VZT1VwditadVJ3?=
 =?utf-8?B?TWxlaFl4UnVUWFJhbFM1SVJaNmdlWjJYNVdZbWZCTk1uK09oOFBGblpXNmhT?=
 =?utf-8?B?b3J6dGc2V0pza1JhVWs1bkwwNGRKczJyTTBWL1NSMXRqdW1PaU5pd3h6WG1t?=
 =?utf-8?B?c1BOaTFKZTM3U0JHbWFYTHZlWGhrSVQrN2w4dTV6dHl0N2U3b25Nb1NYRHBZ?=
 =?utf-8?B?eXllUXRTVWQ0U3YwOUlYSzJtYlpGbFc3cVcyRjQrdE5zYlJwUnVvZzFMM0Js?=
 =?utf-8?B?TnVndE1VMzc0NHpnQndnK1dJenA1NXc5TEZMTW03cTh1SGFqNzBCWXFJVFpi?=
 =?utf-8?B?MWo1SGZkMDRERGR2ZG03NmpORk5GS3NKRXp6aEVSZXhGZ2VTcnJqQTZoYlJn?=
 =?utf-8?B?VGJSblhLWFliL3E2aENYWktnTFYxdW5zNUpsbHpwQWxvMyt4Y2liUXB3VDhv?=
 =?utf-8?B?QURmTUxBb0dTUUd4MWgxTkZIMjFKTklCdUxYaU5LQ0psQjBqcGRCc2dUK292?=
 =?utf-8?B?UXdEeC9TZUdzWmNqLy9CSkU0d29YZTc0MnZKSVRld2VZOWc0bGtUMkhMZ0FC?=
 =?utf-8?B?MmNyQ01acUJoWityenlMaXR4bWFoQkpNK3pFSEZtSHB0YjYyNEpHMGJCeGRL?=
 =?utf-8?B?L042OEJrRmgvNFFJa0NYSExRSzNHbFpyV1p3dXhxNnhmZHo0NGNrWmM3U1pq?=
 =?utf-8?B?OXo5NHJQWTdUV1RVcG1ybGZwN0JEVS9QNXdlT1h4TVpaa3VMd1g2eUFQYnNy?=
 =?utf-8?B?eHNvYlJWOEhjR2hpSDBhQXB2MXkxUDVWNm1xYVovTE5KZk9mY0FhaU1yY2Yy?=
 =?utf-8?B?eVdCMDRqSFlyQXpzRWdlQ1d3Ym9jODI1TlBnSnVjMzJSdnM3ZFhkWWV5cGZY?=
 =?utf-8?B?d3NtZ2VqdTVpRTNrN3ZmTmFlNmU4dnQvZy9GT3pEL0pRc016bmY4YlZqR1Iv?=
 =?utf-8?B?UlEyNHVjenY2dDR6Wk05MHFLZ2p1dDlZV3ZoNXlLNFhBMVRwYU9RNUlSNFVi?=
 =?utf-8?B?OVFtemN5M1dOT1ZBVVE4dndRcUIxMlRkTjk3bnRQWjREQmtsKzQyeG5sTWU1?=
 =?utf-8?B?Q0piM01Rc3pNS2ZCWk5kcm5YQStNbFZpYm9yS0IwRUhyeUJxVDd4bm02aVp1?=
 =?utf-8?B?YjJYcE1oZzcwSlNCdnFuK0w3RnhpVnhtZ1lTZVE3N3BTZWxOZDVKOUF5NVVJ?=
 =?utf-8?Q?LHP1OK00/YyOju43MB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747f7d11-43af-4ac4-d4da-08da407dd369
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2022 07:43:58.7739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YL+uutMAsZXMw5uwkJWcRymY5azneNJ7gd70nCr0ZBcCojmtSFO9l5QwZ8Yl2BI1WOdyLtlw402BwXmsG/9umA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0179
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KSGksDQoNCkFmdGVyIGludmVzdGlnYXRpbmcgcXVpdGUgc29tZSB0aW1lIG9u
IHRoaXMgaXNzdWUsIGZvdW5kIGZyZWV6ZSBwcm9ibGVtIGlzIG5vdCB3aXRoIHRoZSBhbWRncHUg
cGFydCBvZiBidWRkeSBhbGxvY2F0b3IgcGF0Y2ggYXMgdGhlIHBhdGNoIGRvZXNu4oCZdCB0aHJv
dyBhbnkgaXNzdWVzIHdoZW4gYXBwbGllZCBzZXBhcmF0ZWx5IG9uIHRvcCBvZiB0aGUgc3RhYmxl
IGJhc2Ugb2YgZHJtLW5leHQuIEFmdGVyIGRpZ2dpbmcgbW9yZSBpbnRvIHRoaXMgaXNzdWUsIHRo
ZSBiZWxvdyBwYXRjaCBzZWVtcyB0byBiZSB0aGUgY2F1c2Ugb2YgdGhpcyBwcm9ibGVtLA0KDQpk
cm0vdHRtOiByZXdvcmsgYnVsayBtb3ZlIGhhbmRsaW5nIHY1DQpodHRwczovL2NnaXQuZnJlZWRl
c2t0b3Aub3JnL2RybS9kcm0vY29tbWl0Lz9pZD1mZWUyZWRlMTU1NDIzYjBmN2E1NTkwNTBhMzk3
NTBiOThmZTlkYjY5DQoNCndoZW4gdGhpcyBwYXRjaCBhcHBsaWVkIG9uIHRvcCBvZiB0aGUgc3Rh
YmxlICh3b3JraW5nIHZlcnNpb24pIG9mIGRybS1uZXh0IHdpdGhvdXQgYnVkZHkgYWxsb2NhdG9y
IHBhdGNoLCB3ZSBjYW4gc2VlIG11bHRpcGxlIGlzc3VlcyBsaXN0ZWQgYmVsb3csIGVhY2ggdGhy
b3duIHJhbmRvbWx5IGF0IGV2ZXJ5IEdyYXZpdHlNYXJrIHJ1biwgMS4gZ2VuZXJhbCBwcm90ZWN0
aW9uIGZhdWx0IGF0IHR0bV9scnVfYnVsa19tb3ZlX3RhaWwoKSAyLiBOVUxMIHBvaW50ZXIgZGVm
ZXJlbmNlIGF0IHR0bV9scnVfYnVsa19tb3ZlX3RhaWwoKSAzLiBOVUxMIHBvaW50ZXIgZGVmZXJl
bmNlIGF0IHR0bV9yZXNvdXJjZV9pbml0KCkuDQoNClJlZ2FyZHMsDQpBcnVuLg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwu
Y29tPiANClNlbnQ6IE1vbmRheSwgTWF5IDE2LCAyMDIyIDg6MzYgUE0NClRvOiBNaWtlIExvdGhp
YW4gPG1pa2VAZmlyZWJ1cm4uY28udWs+DQpDYzogUGFuZWVyIFNlbHZhbSwgQXJ1bnByYXZpbiA8
QXJ1bnByYXZpbi5QYW5lZXJTZWx2YW1AYW1kLmNvbT47IEludGVsIEdyYXBoaWNzIERldmVsb3Bt
ZW50IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgYW1kLWdmeCBsaXN0IDxhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IE1hbGluZyBsaXN0IC0gRFJJIGRldmVsb3BlcnMg
PGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFs
ZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPjsgTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTJdIGRybS9hbWRncHU6IGFkZCBkcm0gYnVkZHkgc3VwcG9ydCB0
byBhbWRncHUNCg0KT24gTW9uLCBNYXkgMTYsIDIwMjIgYXQgODo0MCBBTSBNaWtlIExvdGhpYW4g
PG1pa2VAZmlyZWJ1cm4uY28udWs+IHdyb3RlOg0KPg0KPiBIaQ0KPg0KPiBUaGUgbWVyZ2Ugd2lu
ZG93IGZvciA1LjE5IHdpbGwgcHJvYmFibHkgYmUgb3BlbmluZyBuZXh0IHdlZWssIGhhcyANCj4g
dGhlcmUgYmVlbiBhbnkgcHJvZ3Jlc3Mgd2l0aCB0aGlzIGJ1Zz8NCg0KSXQgdG9vayBhIHdoaWxl
IHRvIGZpbmQgYSBjb21iaW5hdGlvbiBvZiBHUFVzIHRoYXQgd291bGQgcmVwcm8gdGhlIGlzc3Vl
LCBidXQgbm93IHRoYXQgd2UgY2FuLCBpdCBpcyBzdGlsbCBiZWluZyBpbnZlc3RpZ2F0ZWQuDQoN
CkFsZXgNCg0KPg0KPiBUaGFua3MNCj4NCj4gTWlrZQ0KPg0KPiBPbiBNb24sIDIgTWF5IDIwMjIg
YXQgMTc6MzEsIE1pa2UgTG90aGlhbiA8bWlrZUBmaXJlYnVybi5jby51az4gd3JvdGU6DQo+ID4N
Cj4gPiBPbiBNb24sIDIgTWF5IDIwMjIgYXQgMTY6NTQsIEFydW5wcmF2aW4gUGFuZWVyIFNlbHZh
bSANCj4gPiA8YXJ1bnByYXZpbi5wYW5lZXJzZWx2YW1AYW1kLmNvbT4gd3JvdGU6DQo+ID4gPg0K
PiA+ID4NCj4gPiA+DQo+ID4gPiBPbiA1LzIvMjAyMiA4OjQxIFBNLCBNaWtlIExvdGhpYW4gd3Jv
dGU6DQo+ID4gPiA+IE9uIFdlZCwgMjcgQXByIDIwMjIgYXQgMTI6NTUsIE1pa2UgTG90aGlhbiA8
bWlrZUBmaXJlYnVybi5jby51az4gd3JvdGU6DQo+ID4gPiA+PiBPbiBUdWUsIDI2IEFwciAyMDIy
IGF0IDE3OjM2LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdy
b3RlOg0KPiA+ID4gPj4+IEhpIE1pa2UsDQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBzb3VuZHMgbGlr
ZSBzb21laG93IHN0aXRjaGluZyB0b2dldGhlciB0aGUgU0cgdGFibGUgZm9yIFBSSU1FIA0KPiA+
ID4gPj4+IGRvZXNuJ3Qgd29yayBhbnkgbW9yZSB3aXRoIHRoaXMgcGF0Y2guDQo+ID4gPiA+Pj4N
Cj4gPiA+ID4+PiBDYW4geW91IHRyeSB3aXRoIFAyUCBETUEgZGlzYWJsZWQ/DQo+ID4gPiA+PiAt
Q09ORklHX1BDSV9QMlBETUE9eQ0KPiA+ID4gPj4gKyMgQ09ORklHX1BDSV9QMlBETUEgaXMgbm90
IHNldA0KPiA+ID4gPj4NCj4gPiA+ID4+IElmIHRoYXQncyB3aGF0IHlvdSdyZSBtZWFuaW5nLCB0
aGVuIHRoZXJlJ3Mgbm8gZGlmZmVyZW5jZSwgSSdsbCANCj4gPiA+ID4+IHVwbG9hZCBteSBkbWVz
ZyB0byB0aGUgZ2l0bGFiIGlzc3VlDQo+ID4gPiA+Pg0KPiA+ID4gPj4+IEFwYXJ0IGZyb20gdGhh
dCBjYW4geW91IHRha2UgYSBsb29rIEFydW4/DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBUaGFua3Ms
DQo+ID4gPiA+Pj4gQ2hyaXN0aWFuLg0KPiA+ID4gPiBIaQ0KPiA+ID4gPg0KPiA+ID4gPiBIYXZl
IHlvdSBoYWQgYW55IHN1Y2Nlc3MgaW4gcmVwbGljYXRpbmcgdGhpcz8NCj4gPiA+IEhpIE1pa2Us
DQo+ID4gPiBJIGNvdWxkbid0IHJlcGxpY2F0ZSBvbiBteSBSYXZlbiBBUFUgbWFjaGluZS4gSSBz
ZWUgeW91IGhhdmUgMiANCj4gPiA+IGNhcmRzIGluaXRpYWxpemVkLCBvbmUgaXMgUmVub2lyIGFu
ZCB0aGUgb3RoZXIgaXMgTmF2eSBGbG91bmRlci4gDQo+ID4gPiBDb3VsZCB5b3UgZ2l2ZSBzb21l
IG1vcmUgZGV0YWlscywgYXJlIHlvdSBydW5uaW5nIEdyYXZpdHkgTWFyayBvbiANCj4gPiA+IFJl
bm9pciBhbmQgd2hhdCBpcyB5b3VyIHN5c3RlbSBSQU0gY29uZmlndXJhdGlvbj8NCj4gPiA+ID4N
Cj4gPiA+ID4gQ2hlZXJzDQo+ID4gPiA+DQo+ID4gPiA+IE1pa2UNCj4gPiA+DQo+ID4gSGkNCj4g
Pg0KPiA+IEl0J3MgYSBQUklNRSBsYXB0b3AsIGl0IGZhaWxlZCBvbiB0aGUgUkVOT0lSIHRvbywg
aXQgY2F1c2VkIGEgDQo+ID4gbG9ja3VwLCBidXQgc3lzdGVtZCBtYW5hZ2VkIHRvIGNhcHR1cmUg
aXQsIEknbGwgYXR0YWNoIGl0IHRvIHRoZSANCj4gPiBpc3N1ZQ0KPiA+DQo+ID4gSSd2ZSBnb3Qg
NjRHQiBSQU0sIHRoZSA2ODAwTSBoYXMgMTJHQiBWUkFNDQo+ID4NCj4gPiBDaGVlcnMNCj4gPg0K
PiA+IE1pa2UNCg==
