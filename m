Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810356C7106
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 20:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F8510EB1A;
	Thu, 23 Mar 2023 19:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A431F10EB10;
 Thu, 23 Mar 2023 19:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AI9Na0jQO+L/aW/rDOI7I80kGgx9ZT3rKsy4+WnEErNTDuSPPwNWNo1bYX/PZjwFjHdtYWLpLTBzPiku32my9U2BaV/dN4vYl31tyyMOMoJK8rda3qvUfst3NK6AZDhXfUSMN2gvpPTH1aov1Ce9HRzgxidNOxAsmY5ZWpYLkJqpsj0ApwpIy14WbrFK82gYWMol4AFY2R63/HtQkIZOsHFMcdIS9Gz/Pd7fvIZu8inxnjbnsrfyHIUARsPFrbtbxt1IetCNo+dBvMcxGeQ2hMmU1Hooop9LMXR5KR/k+nRtltJHrBPk4DNkpkHeUPfA5hsznuaDXpeuNGCyZbXJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heEHfuqXbSMQr2q/JbalmVXT5zz9HgWVUS/AwaVnLHQ=;
 b=Ak6tdDDWGySI1929RNLS/l5Q/Nk7q1MgsU/lz9/+pe9vTXYo5U7UVQ+oxcQzcmkUAymA4Xtz0nZ589snGhIAxobRsqF5xAJznS4wAi/nH0COH8yhgbp37rZQKudTVQZ2B8pWSoyFGFxHGcjXdB/ytWDvzx6x64JkuS/VKE4Cz/Ge/UqBgRsqP9E+K/l2O1Qr+tdbs6kx78wQUefyJrbFMAGulUqQgZLVYawrhSym8vdfRuuu+4iVGZUWW3iWhmHK5VdgEbzCqLloY11352zYjpp8Ny0suFUo2FV8/8+/KbrDAFb2ph+qtAaEclnyap8BoNq4SjFlG7Zq3WlOT86C+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heEHfuqXbSMQr2q/JbalmVXT5zz9HgWVUS/AwaVnLHQ=;
 b=Wj1/n3UCQa80CZu1KmWDB9+NLu7+vtlpz9EsyHMoLvCo47myzO8pulBXU6GB6Q09owoubGym3oV6kFIXpndFna4kR/K2rAF/B7ijjEsJc/I2e1P2homTtzjC8UO4EJysiW/QCd42B9w7QCiBgXj+hGWjUEZBOEwUXqJQL/p0ZBg=
Received: from DM5PR12MB1899.namprd12.prod.outlook.com (2603:10b6:3:113::21)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 19:24:47 +0000
Received: from DM5PR12MB1899.namprd12.prod.outlook.com
 ([fe80::a819:97aa:d313:274e]) by DM5PR12MB1899.namprd12.prod.outlook.com
 ([fe80::a819:97aa:d313:274e%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 19:24:47 +0000
From: "Clark, Felipe" <Felipe.Clark@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/display: Add missing OLED Vesa brightnesses
 definitions
Thread-Topic: [PATCH] drm/display: Add missing OLED Vesa brightnesses
 definitions
Thread-Index: AQHZXNgmD7+dfhPMoECf47qbaCoQa68HFukAgAGcr9A=
Date: Thu, 23 Mar 2023 19:24:47 +0000
Message-ID: <DM5PR12MB189979B9FCBC8EC57F23B63997879@DM5PR12MB1899.namprd12.prod.outlook.com>
References: <20230322160513.1438881-1-Rodrigo.Siqueira@amd.com>
 <7cf3ae87-9d7e-a846-89c6-d267ca76472a@amd.com>
In-Reply-To: <7cf3ae87-9d7e-a846-89c6-d267ca76472a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=88347bde-6d37-49e4-93b0-f49d3aba537d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-23T18:38:20Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB1899:EE_|IA0PR12MB8085:EE_
x-ms-office365-filtering-correlation-id: 9447aeb1-5d28-450d-bc5e-08db2bd443be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aEHeGeNDxoGwT8flmz+GgPiJVUt4B3ds6C7tez8lZ5pGHPiYjnw7meR7XaOgKfq9MD8Oxk3nBGGMBPssyr6arY1M+CipboKcMA5wfDHrUTsslWidRCunNG9UNJTiJj5cIjDlN+X7s920DXfzZiEGJd0T84w+o/vfcYKmSRxkRkVlmRlOiKNizmfHmpFzgxTxIYqzAD5AAg+SvwCw4xjjYuaDg91+45r8IQlS2f+O6bV3IW+udY12CkntcfZgZb/XtMPbXWkR9SB8KbdRlHg2Yf68kglTMfvB3+px25c1Jr7cwE3VMeA0WvD/z9rvbP79Juc9DJP0qXq7xTrpcYZ9JfHsJdMPqiqc5lcD4U7vhkwoRIPmVT9/AY8v/cN5Lq/oUGT+B55phOfdQITXXSY0eV1I+YCmuZ0Gadgx++Tgw3p0CudcwqVhzN3x3hdUTXjoh97O21qcZKKkVIR2iWExSHTMAb6C/HNZlJ4NYg1a/ZF6d6kelV7PGds82JH7G6fs2zNt/vAPp1xR9u5BdipoR1kT43zO1Q2TLJnF0MluzvTf98z/bNsr3DYofNpYQJg/zaDztV114YMlLG4/50eH3qoo3r+h1vnWrJhC49eDyYq/gPYNclbEhI9wlb2N+zMxC+0ZqtJ4zSY1lI5GCfKWHP5emNQQZqJVl7uaOboR9FeXDWWLhXSOQUcvkQTLyh/cx0e2jnwZFidshM/aqWYhtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1899.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(316002)(54906003)(38070700005)(33656002)(110136005)(478600001)(41300700001)(55016003)(2906002)(8936002)(5660300002)(122000001)(52536014)(66946007)(4326008)(76116006)(66556008)(66476007)(8676002)(38100700002)(64756008)(66446008)(6506007)(53546011)(26005)(86362001)(9686003)(186003)(7696005)(71200400001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkZUZ1RKTE9peDkxNFFTa2poRmY3cmdRMDdqUEFTL1RlWWdUSGRkSldsSUJS?=
 =?utf-8?B?ajMyckVIVCtteGxPbjBLRzFhMGJvREJ5ZEZuakNQTVRBVnI5RzZMRk9tTXBM?=
 =?utf-8?B?VVhKTFlINDc1bWRBNVAvd3MzVzA3VGl2anJjUFlCb2pOcDRxZzRKb0wzTkwr?=
 =?utf-8?B?QlJIVGhNenlZL3Q0SEVyRmoxLzF4WVpqZTZQbk5SbFdoK2ExanVLR3Z6TFZz?=
 =?utf-8?B?T0dUNjlrcSsxR1dLSVRFMmlBQjZJcE9tZEVXL2RKbFZQL2JEMXpJV09kVGZW?=
 =?utf-8?B?QnpyR09jWG9rYitlNkJSdmpwR2RZdGJHcDZyYWpNRDBsUFFwdERJMUREWis4?=
 =?utf-8?B?RExadTAwaGJiQndzWU5CUXEyMzloSWtJM3pzS21pWEVWSVJHS2gxUEtWNTIx?=
 =?utf-8?B?Q2V2ZUZEaFlCVmR3Sktrc0lGamNhemhWZ3pWbThVL0dHR0hyR0FTKy8xYU4w?=
 =?utf-8?B?a1dLQ0Nra0JncmQ2NnJqblRWZ2NhdEgxTFhiUldjVFNTM2prVzRheEVMaXpP?=
 =?utf-8?B?VllabVE2bmQydmVTQVFmNE9CRk13eGlqSmhwUllUL2hSS0V5RVhHUDBDeW0r?=
 =?utf-8?B?STB1N00xaWhUY1lPUWNpMUJVcmhMQVJwaXFOQ2tuTUlBZ0doQk5jaEZaUkh1?=
 =?utf-8?B?NTRmK09kblUzd3pYOTZtRGxSb21MN3JudS83YmN5Sm4zL0crcEVXUnNCNXRm?=
 =?utf-8?B?STJYMTZRblBLY1dDNUlxamdOY1VYUGxoR0hZcVAvSXRYYXRIcThZMGFqa1hW?=
 =?utf-8?B?aENFWkE2UlFKcDlGZGxxMG5VeUlPcGN5V1BjM3E1L0swc1FxRURhSDNCSHd6?=
 =?utf-8?B?bkU1UVFRcGJkdmVtcWVkRHA2bWVJaVJJdFA4QUh0MStwdE1JeDRteHJVNk9E?=
 =?utf-8?B?R09lMHY2Rmg2Tm1lYmFraDZCRUxjTG52WFgrc3pCZ2tiOTA5TDloQ1NhWUpH?=
 =?utf-8?B?WDdkclAyQkZHVFJiRmhoNXMwY2VXZ2RIMzFvT1FnOEFvTytFbExNU0MrbVRV?=
 =?utf-8?B?MFl4dmhSZHZ2QS9EL1QvdVhZNWNzRmplaU9uUHpDcExsNVVsVHJpUFR2TG1S?=
 =?utf-8?B?NTgvOVU5UVNKS0xsaTBMVVFhS1lHTGVyNjJJV1RXMzRYQ2pDK0ljL0owa1E3?=
 =?utf-8?B?YnFVd3ZxMGlDbitlaUJTMDlBSjhTYjdZTzRzcC9wYzVkUUZNU3UyRTIwVDFw?=
 =?utf-8?B?SmJaVjk4WS9vRk5oY2t4VHJIMzBEUC9TenZnWkovR3dmb3IxUStnTStJemlL?=
 =?utf-8?B?dE5wcU1YVlg4b09Pd1JmMFFRMlJxc3NmQ0dtREJTMyttckwyZVR5aDJnL3NR?=
 =?utf-8?B?L3A2RUVkd05WZU9PbmsxeHZ3OTFDS2RjdlJwMkxzU2RpOVovcnpVMk5OaXgz?=
 =?utf-8?B?Yy8rU1pINHR5VGVBRjlwNlhiVVRmdGFLOWdtUmUyM0pLdVRsUDNDTEFhMHNW?=
 =?utf-8?B?ZFQrRlQzLzkxWHJmNmo0ZWF1Q1NIc1hWcEc1bFdYS25xMG5RM1ZYc2NSS0lw?=
 =?utf-8?B?ZkUwd2E3UFJBbEs5SnVRTytZMlZrenZ1cURNZU9ESWVFWTdZV1E2VC8xRW1l?=
 =?utf-8?B?VHA1RGRzVi9yOVg3cUwzbFZLQVBWdnZhd1lDUlVDMW1teE1UYU5lRnNOZzEz?=
 =?utf-8?B?KzJrYU1qQXlXNVhZN3VaWXl3V20rVStDNzdNVDcvTWtWZmIvUVJmNDRMRTQ1?=
 =?utf-8?B?UlRXOURUcXZTZU9jTElUa3RsRkhVa3g5SG01MDNCZE9PTDRhK0VBSmdTdmdG?=
 =?utf-8?B?U2Z4Ukl3SVQ5Z1d2bnlUV0lIK0ZtbkxlWkdPaXEwYVdYaWgvaUdJeHg3VUxu?=
 =?utf-8?B?NnYxNE9yNnpGRzd3VGdRUmVieXU1UjkxRHVaY2UxTVBMZXpaZllCV0dQV3kx?=
 =?utf-8?B?M0VpSzYyTkdQVGVPMC9NUWpjdU1Jd3pkS2xIQm1nNFVaQzM4OWZRVnZPRHNZ?=
 =?utf-8?B?YVZsNUROVW9GTzNhYjdWUlgxY0hnNXJOdXdZdUFIVVBxVFU1WWZiUnJNajdE?=
 =?utf-8?B?WjN2Q05rNGdmeWc3QlVsTkVja3JZc0haNnlHSENLbFFQTXpXRjZGc1k1WldD?=
 =?utf-8?B?QUJDcXdOamVSQWpHRStZKzVObDVONGY1eGd5Mk1KWDRHd0hZNjZORnppWk14?=
 =?utf-8?Q?2qBk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1899.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9447aeb1-5d28-450d-bc5e-08db2bd443be
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 19:24:47.2379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4M3WYfsyg6OILIhYrp4H7O7fgJgwM/2mvgffV7CnF/cwpW15ocNx3Y/0ff72fb/2TIhUNKASpL/6cYIxWlY9ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Koo,
 Anthony" <Anthony.Koo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Nagulendran,
 Iswara" <Iswara.Nagulendran@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhlbGxvIFJvZHJpZ28gYW5kIEhh
cnJ5LA0KSSB3b3VsZCBsaWtlIHRvIHByb3Bvc2Ugc29tZSBjaGFuZ2VzIHRvIGtlZXAgdGhpcyBw
YXRjaCBjb25zaXN0ZW50IHdpdGggdGhlIG5hbWluZyBzY2hlbWUgYW5kIGdlbmVyYWwgb3JnYW5p
emF0aW9uIG9mIHRoZSBkcm1fZHAuaCBmaWxlLg0KDQojZGVmaW5lIERQX0VEUF9PTEVEX1ZFU0Ff
QlJJR0hUTkVTU19PTiAgICAgIDB4ODANCkl0IHdvdWxkIGJlIGJldHRlciB0byB1c2UgdGhlICgx
PDw3KSByZXByZXNlbnRhdGlvbiBmb3IgdGhpcyBiaXQgdG8gZm9sbG93IHRoZSBwYXR0ZXJuIGVz
dGFibGlzaGVkIGJ5IHRoZSBvdGhlciBkZWZpbmVzIGluIHRoZSBmaWxlLiBBbHNvLCBhIG1vcmUg
Z2VuZXJpYyBuYW1lIGZvciB0aGlzIG1hY3JvIHdvdWxkIGJlIERQX0VEUF9QQU5FTF9MVU1JTkFO
Q0VfQ09OVFJPTF9FTkFCTEUuDQoNCiMgZGVmaW5lIERQX0VEUF9PTEVEX1ZFU0FfQ0FQICAgKDEg
PDwgNCkNCkEgbW9yZSBnZW5lcmljIG5hbWUgZm9yIHRoaXMgbWFjcm8gd291bGQgYmUgRFBfRURQ
X1BBTkVMX0xVTUlOQU5DRV9DT05UUk9MX0NBUEFCTEUNCg0KDQpJbiB0ZXJtcyBvZiB0aGUgZmls
ZSBzdHJ1Y3R1cmUsIERQX0VEUF9QQU5FTF9MVU1JTkFOQ0VfQ09OVFJPTF9FTkFCTEUgc2hvdWxk
IGFwcGVhciB1bmRlcm5lYXRoIHRoZSBkZWZpbml0aW9uIG9mIERQX0VEUF9CQUNLTElHSFRfTU9E
RV9TRVRfUkVHSVNURVIuIFNpbWlsYXJseSwgRFBfRURQX1BBTkVMX0xVTUlOQU5DRV9DT05UUk9M
X0NBUEFCTEUgc2hvdWxkIGFwcGVhciB1bmRlcm5lYXRoIHRoZSBkZWZpbml0aW9uIG9mIERQX0VE
UF9HRU5FUkFMX0NBUF8yDQoNCkZvciBhIGNvbXBsZXRlIGRlZmluaXRpb24gb2YgdGhlIG1pbGxp
bml0IGJhc2VkIGJyaWdodG5lc3MgY29udHJvbCBzcGVjaWZpY2F0aW9uIHRoZSBmb2xsb3dpbmcg
c2hvdWxkIGFsc28gYmUgYWRkZWQ6DQojZGVmaW5lIERQX0VEUF9QQU5FTF9UQVJHRVRfTFVNSU5B
TkNFX1ZBTFVFICAgICAweDczNA0KDQpIZXJlIGlzIGEgc3VnZ2VzdGVkIHBzZXVkby1wYXRjaCB3
aXRoIGFsbCB0aGVzZSBjaGFuZ2VzOg0KDQojZGVmaW5lIERQX0VEUF9HRU5FUkFMX0NBUF8yICAg
ICAgICAgICAgICAgMHg3MDMNCiAjIGRlZmluZSBEUF9FRFBfT1ZFUkRSSVZFX0VOR0lORV9FTkFC
TEVEICAgICAgICAgICAgICAgKDEgPDwgMCkNCisjIGRlZmluZSBEUF9FRFBfUEFORUxfTFVNSU5B
TkNFX0NPTlRST0xfRU5BQkxFICgxPDw3KQ0KDQojIGRlZmluZSBEUF9FRFBfRFlOQU1JQ19CQUNL
TElHSFRfRU5BQkxFICAgICAgICAgICAgICAgKDEgPDwgNCkNCiAjIGRlZmluZSBEUF9FRFBfUkVH
SU9OQUxfQkFDS0xJR0hUX0VOQUJMRSAgICAgICAgICAgICAgKDEgPDwgNSkNCiAjIGRlZmluZSBE
UF9FRFBfVVBEQVRFX1JFR0lPTl9CUklHSFRORVNTICAgICAgICAgICAgICAgKDEgPDwgNikgLyog
ZURQIDEuNCAqLw0KKyMgZGVmaW5lIERQX0VEUF9QQU5FTF9MVU1JTkFOQ0VfQ09OVFJPTF9FTkFC
TEUgKDE8PDcpDQoNCiAjZGVmaW5lIERQX0VEUF9EQkNfTUlOSU1VTV9CUklHSFRORVNTX1NFVCAg
IDB4NzMyDQogI2RlZmluZSBEUF9FRFBfREJDX01BWElNVU1fQlJJR0hUTkVTU19TRVQgICAweDcz
Mw0KKyNkZWZpbmUgRFBfRURQX1BBTkVMX1RBUkdFVF9MVU1JTkFOQ0VfVkFMVUUgMHg3MzQNCg0K
DQpUaGFuayB5b3UsDQpGZWxpcGUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IFdlbnRsYW5kLCBIYXJyeSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4NClNlbnQ6IFdlZG5lc2Rh
eSwgTWFyY2ggMjIsIDIwMjMgMjowMSBQTQ0KVG86IFNpcXVlaXJhLCBSb2RyaWdvIDxSb2RyaWdv
LlNpcXVlaXJhQGFtZC5jb20+OyBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVsQGZmd2xsLmNoDQpD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtvbywgQW50aG9ueSA8QW50aG9ueS5L
b29AYW1kLmNvbT47IE5hZ3VsZW5kcmFuLCBJc3dhcmEgPElzd2FyYS5OYWd1bGVuZHJhbkBhbWQu
Y29tPjsgQ2xhcmssIEZlbGlwZSA8RmVsaXBlLkNsYXJrQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0
OiBSZTogW1BBVENIXSBkcm0vZGlzcGxheTogQWRkIG1pc3NpbmcgT0xFRCBWZXNhIGJyaWdodG5l
c3NlcyBkZWZpbml0aW9ucw0KDQoNCg0KT24gMy8yMi8yMyAxMjowNSwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToNCj4gQ2M6IEFudGhvbnkgS29vIDxhbnRob255Lmtvb0BhbWQuY29tPg0KPiBDYzog
SXN3YXJhIE5lZ3VsZW5kcmFuIDxpc3dhcmEubmFndWxlbmRyYW5AYW1kLmNvbT4NCj4gQ2M6IEZl
bGlwZSBDbGFyayA8ZmVsaXBlLmNsYXJrQGFtZC5jb20+DQo+IENjOiBIYXJyeSBXZW50bGFuZCA8
SGFycnkuV2VudGxhbmRAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBTaXF1ZWly
YSA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQoNCkhhcnJ5DQoNCj4gLS0tDQo+ICBpbmNsdWRl
L2RybS9kaXNwbGF5L2RybV9kcC5oIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0K
PiBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmggaW5kZXggNjMyMzc2YzI5MWRiLi5kMzBh
OWIyZjQ1MGMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4g
KysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiBAQCAtOTc3LDYgKzk3Nyw4IEBA
DQo+ICAjIGRlZmluZSBEUF9FRFBfQkFDS0xJR0hUX0ZSRVFfQVVYX1NFVF9DQVAgICAgICAgICAg
ICgxIDw8IDUpDQo+ICAjIGRlZmluZSBEUF9FRFBfRFlOQU1JQ19CQUNLTElHSFRfQ0FQICAgICAg
ICAgICAgICAgICAgICAgICAgKDEgPDwgNikNCj4gICMgZGVmaW5lIERQX0VEUF9WQkxBTktfQkFD
S0xJR0hUX1VQREFURV9DQVAgICAgICAgICAgKDEgPDwgNykNCj4gKyNkZWZpbmUgRFBfRURQX09M
RURfVkVTQV9CUklHSFRORVNTX09OICAgICAgMHg4MA0KPiArIyBkZWZpbmUgRFBfRURQX09MRURf
VkVTQV9DQVAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgxIDw8IDQpDQo+DQo+ICAj
ZGVmaW5lIERQX0VEUF9HRU5FUkFMX0NBUF8yICAgICAgICAgICAgIDB4NzAzDQo+ICAjIGRlZmlu
ZSBEUF9FRFBfT1ZFUkRSSVZFX0VOR0lORV9FTkFCTEVEICAgICAgICAgICAgICgxIDw8IDApDQoN
Cg==
