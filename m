Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E378C940
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4C810E43E;
	Tue, 29 Aug 2023 16:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F7010E42E;
 Tue, 29 Aug 2023 16:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ue6e3is0TwR/hk4gYbQO1iDcGx5G5qGismF6liSxBcE+DZUBJ8CuBZM9YLTBAI9S48FiQDMdHx22EMygXRBafqybqJ+YhyrbWmrLvdEKGMKgrW7GfxETVmHLmvliJAgSyBnjvmqNQdcjcXDwSo/777GBf6H8r7wpfTLtqRos3jfzqZ4TixZuglOjWX1iordvWI4Sg6kZoJJrrN4YyI70Lw4z/rAmAxCEC5XIbN3ZIzbfGkoTpW9rDX4LrbVAMNs3PVRC+WmTkGrD93r45WOuFMJun302yUUbQowWtxLA3mFDHWww2pR3JFhEuLtM4QA9x9tA0AwXyp2K5lnVEkD2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5b+pUNmc3sGJGse4S8k77gZZld+YVvn1F/HOyS47VlE=;
 b=S4p/lOTKnBfIOCdfx5GFCGLjvjtI6h4Xy+0EXZXqSz0gaW/5DxO0ScGLur27gMDUNGXa6BiPvP6tlI5gI+pF7Au6q32RbAVOZEmQqkFzw40MXRFaNLVjlARkT7DsiFzbwSPGGgmtbqhRfx5PYYZZlCard9IJgmZNS5eE5Gksi6z6osvwWiCMSlUHsdoFBIbOB6cCxrLkXWtiq7fxFIosXTevms/l1X7iM6ztsakTCN+1uf8ray/bFK7zHhEwuf4qvn+AkDkwelFnj2jy1oFoisWgQwXmmXf9+0dXwAatyF1EC8/yenuWdb8cqwFzZyTBiRHP2N8UzVoWekZ4Capitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b+pUNmc3sGJGse4S8k77gZZld+YVvn1F/HOyS47VlE=;
 b=nKpDOlYQSWjEPkyd+0eAneYa6+CxZ0vSM3cyQdwfCyfn9QScsYAqNB7hgzkYtfkQO0HDpsW3CWs7tt/OlzSUR3jD483NuebEMSk3NYdTTXco9kNVxoEmDIzslPs6baSmQgJOJVF5U/nnSnAoaYPWgVLdb000rV5ARw/8Bn4kiFU=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by DS0PR12MB7994.namprd12.prod.outlook.com (2603:10b6:8:149::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 16:01:32 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::2630:61dc:a66:bf95]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::2630:61dc:a66:bf95%3]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 16:01:32 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Jani Nikula <jani.nikula@intel.com>
Subject: RE: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
Thread-Topic: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
Thread-Index: AQHZ1PCVshFeKm1/rU2vqAsCcQ2D4K/2tpMAgADQKQCACZwUAIAAUqMAgAAEudA=
Date: Tue, 29 Aug 2023 16:01:32 +0000
Message-ID: <PH8PR12MB6962AD4C488502584B475535FDE7A@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
In-Reply-To: <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=73f72eb6-c734-4cc6-8963-c9c1b3d0c5c6;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-29T16:01:10Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|DS0PR12MB7994:EE_
x-ms-office365-filtering-correlation-id: 4ba005e2-d5ba-48b9-b76e-08dba8a936e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FVScmlmiK52rWbYRMBMfDyn9NlqUgl5vyNQ5oZm5jwHPNfvCAnTrYr/TTC2Y8GOHfgi1N0F3GMdXhQ2wRwZ9sAaX3LTh6QzzR1I5rc9AZoeORuVT2bng9cB7AdJrtv8GhggG1hF4ExfRLLzzpe6ui3sr6MQStaL+2RMKnyG8zqRVSlpzh99H0hSbyjl6gN9qZ4T6MfaHnMeedRMeKiucO72M89++OzkYCJ74z/Slk2okjDo+PtcaWqAVc+OQRHIscIv5lahWVvznv2AOu1Pf7N7p1oVIzlVtNEXZNNrDr/YkkQloH8io2ClaEJUvwulVNXaIatmKy0NtxfgY4VbMWaQliJXNXRVpe/U3GXe7FykCeHuC7P4EtJz8fP6K4+dsj1zGtybX7R+J4jezkPj1YUO6uB0NJbC7jyZb6/INNGwmKPABvj0Gu0IIVr545mJkLsDb2wc2m6VbzmF8aJuI97unfHonqMWHB8Iabts8+HNko0/v5CaJJ3GMOnuIktHglwr0AAZAZZgH6GcbVhYkT/lbW7FT2TvDLieBjt/Krj8pYvxFNNYnxiYn7oCpNKCMctKtiKrCpUxxTjb4KMICzoMg3SfWabdVMwXNt0eSK5yoa95EOUBc1g1NAloA3khk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(186009)(1800799009)(451199024)(6506007)(9686003)(7696005)(71200400001)(83380400001)(53546011)(478600001)(26005)(2906002)(110136005)(64756008)(54906003)(66446008)(66476007)(66556008)(66946007)(8676002)(76116006)(52536014)(316002)(5660300002)(8936002)(4326008)(41300700001)(33656002)(86362001)(55016003)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjJka29qcTZtZWtuYWxEcXZzUFNNR0piTWx4eGw1THArc3lZUWpQbGl1bVRU?=
 =?utf-8?B?WmZzVTBLUkx5VjFxeWZWdGVCYjRyRHpCdXJ6TGtkTCt1QUdrcXRWNE9FZkhZ?=
 =?utf-8?B?bDd6c0ZpZzNXL0NPUzQ4akxRWmRmODdCSUs5RitWeEljQXZ5dkFhQWtnaUh3?=
 =?utf-8?B?Rm93RVowT2FaVHZxZGdDVWl1aEFxajBVbkd4WTA3dGhFMWViYjQ0Q3lHN2Jz?=
 =?utf-8?B?Y21PWWEyMXoraXI5elNHTVR4MCtCME5RQWU3a1lyemVFMTRPOVNSQzUwMk5M?=
 =?utf-8?B?cVpuTXBzK3Z1VUc3YlNGTlNQZmNWZ1h6bHU2RVp4NmtlcGxwYTlyUTRNRWhN?=
 =?utf-8?B?RG1lZGpTRUJ0TkNybzFDUW1NaGdoN2NuT2JBSjhHTisyNlY0RFNEWFFVeG1n?=
 =?utf-8?B?QXNQRW10SXZRbEYxcVdUN2VDV0RReURVSTNxU3pMUXIrVjdMMVdUSkt6MGtO?=
 =?utf-8?B?Tk8waUFkekdxN1NiZUMvNm5MaFNhR0tLYTZCZXdPWmhKeUZwYUpkZGFoOHFn?=
 =?utf-8?B?QldJcm9xV1hwc3M4clo5SlVjMzl6UThNOUxnWk5EbHJ2VXdXSFcyUDlyRXZq?=
 =?utf-8?B?bmcwTDRJUG11TWRicVdONlBEazVndlNsVWtPeW4rcnlObVQ2MzI3S2VqUkV1?=
 =?utf-8?B?M3E4QnpoYVZBaXNEQjNmR25adkgwSXJHUTlRZ0YxNVBFV3M4d0t1a3VxbTRB?=
 =?utf-8?B?eElwaS9pdVVUdjVwWVRTRVNZelk0RTNyMUVCNEx2QmRGTXVDaHp0dDBlb0lq?=
 =?utf-8?B?ZFdMUUlaL0ZRSEgvNmpMbDFEZW4vNXFSdXBYaXA2b1hjTTR1S1dlZWRCYlhl?=
 =?utf-8?B?bkZDMEZTQmJ0dklaUTg3bGhYd3hkZG04citPTUpjS2RSQ1doV2xlbGJvM0hj?=
 =?utf-8?B?RXJtSWR4dTRlcVdwWVVZLy9ITWRyc2xUMnhaRTdoRXRjam9rb1YxSlVnYTdz?=
 =?utf-8?B?Tzc2b3NLRGxyc0RQc285UndhSmV1R2g3TVlPZitnSTVLTk96a0NjbytTOXpY?=
 =?utf-8?B?Z24wM3RiSDJlUEFSQk5TbGJKZmM3U2FtYzRSM0lOTnR3TWRYK0FwSmFBdm5q?=
 =?utf-8?B?UFEvM1F2cHo1dnFXN3crWSt0WENHbUZlc0d4cklTQU94eVlSWWVJeU94aFI2?=
 =?utf-8?B?dklveGN0eFhhelg2TlhSeDlsd1V5Z1ZSR2djMFJoOEdrZTQrZVR1RGFkQ3NW?=
 =?utf-8?B?Z2tCY2ZMb0N2dUt0WnBlbmhKMllqS2JXNlVMaG9JQlBSVVRIRkdjazl5SjFH?=
 =?utf-8?B?K2NxTWQvY2d4NGdoa0RMOWY3ZHpLODdUVXdlUkdWbi9ZeDc0SWtlQndNZnp4?=
 =?utf-8?B?SmtQUFZ2WklSTGNhd2VtVlNnd1ljMWVLd1JRWDNpSnd5b3lIRlBzQmt4MzZ1?=
 =?utf-8?B?dUVsdUZpVzJKZWw4eU1qZG4zZjNSODNKY2RoQTQ2b0ZTOW9tN3l6aTQ4cHIw?=
 =?utf-8?B?Tk1sQldQN2FGQmlsTXBhQlhEQndReWpTNC9WUTl4THNIUWxoQ1N0cDFyUTRE?=
 =?utf-8?B?QUJVQmZQb3l6YXFwYTJHUjJKWFkzVS9CNDJCZTRITm5zL3lkUXQ0K1NNNHZ6?=
 =?utf-8?B?ZXdtYlU4T1lzUUVwdC9TZE1KZ294Y0loRVlTK1dLZkFnM0RHSm5qa1NsQkJD?=
 =?utf-8?B?dVE3QjNEUEZDL3d1M2tzVGFjeVNRWlJFNStHYjN2R3hQQ05iWHRpZisvbmdV?=
 =?utf-8?B?YlB4YTFhTjFRWm1sM3JQcUVxempqUUVnZW8wWEZuL1A0Q2FNWU15MTBlVFMz?=
 =?utf-8?B?RDR5bkUvTTRMUG1IZlJCVGMyaUo5QUNTazJzZmJlOTErSzNCZi9CdVVQZ3Vi?=
 =?utf-8?B?T2xXWmxGZXRja3hwU1l3M3laVkhqdVRhTGhhK2pKcWRpcmwrd095WDhxVDZa?=
 =?utf-8?B?dHBWcUdRc0ZFRk9URjRQM1JGNkxWdFRPa2VZaFVON0xvZHFqbU9vcUdkcjI4?=
 =?utf-8?B?SUtURWJCaEVHQXZrZXgvRGZSYlVwQStUd3lIT1hHeDVyL3RpTWVCUEtZT2Qy?=
 =?utf-8?B?U2Z3N1JCTVhPdUIyZ3pVeE1wd01RVTA1OFhBbE5DNHgvSjU5alF0RStLVlA1?=
 =?utf-8?B?d0pLQ3RkSUtHOW1yNVE4QlhQZWRCd0p2eFpFVmlEUFJlWFE5L3QwQ3gzY29l?=
 =?utf-8?Q?Bspo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba005e2-d5ba-48b9-b76e-08dba8a936e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 16:01:32.6166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QR+tNoLV1aqwYNgiBnNhdtMQejVxPNAK0HSzYjBxHMDjV/UG5YRkAAwZtxv8A8rajcAWKq17YvVVJ1T+657bng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7994
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
Cc: "Hung, Alex" <Alex.Hung@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wheeler,
 Daniel" <Daniel.Wheeler@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chien,
 WenChieh \(Jay\)" <WenChieh.Chien@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wang,
 Yu \(Charlie\)" <Yu.Wang4@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCisgQ2hhcmxpZSBXYW5nDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4NClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyOSwgMjAyMyAxMTo0NCBBTQ0KVG86
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQpDYzogSHVuZywgQWxleCA8QWxl
eC5IdW5nQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTGksIFN1biBwZW5nIChMZW8pIDxTdW5wZW5nLkxpQGFt
ZC5jb20+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaXF1ZWlyYSwgUm9kcmln
byA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPjsgV2hlZWxlciwgRGFuaWVsIDxEYW5pZWwuV2hl
ZWxlckBhbWQuY29tPjsgV3UsIEhlcnNlbiA8aGVyc2VueHMud3VAYW1kLmNvbT47IENoaWVuLCBX
ZW5DaGllaCAoSmF5KSA8V2VuQ2hpZWguQ2hpZW5AYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRl
ciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBb
UEFUQ0ggMC80XSBkcm0vYW1kL2Rpc3BsYXk6IHN0b3AgdXNpbmcgZHJtX2VkaWRfb3ZlcnJpZGVf
Y29ubmVjdG9yX3VwZGF0ZSgpDQoNCk9uIFR1ZSwgQXVnIDI5LCAyMDIzIGF0IDY6NDjigK9BTSBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPiB3cm90ZToNCj4NCj4gT24gV2VkLCAy
MyBBdWcgMjAyMywgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4gd3JvdGU6DQo+
ID4gT24gVHVlLCAyMiBBdWcgMjAyMywgQWxleCBIdW5nIDxhbGV4Lmh1bmdAYW1kLmNvbT4gd3Jv
dGU6DQo+ID4+IE9uIDIwMjMtMDgtMjIgMDY6MDEsIEphbmkgTmlrdWxhIHdyb3RlOg0KPiA+Pj4g
T3ZlciB0aGUgcGFzdCB5ZWFycyBJJ3ZlIGJlZW4gdHJ5aW5nIHRvIHVuaWZ5IHRoZSBvdmVycmlk
ZSBhbmQNCj4gPj4+IGZpcm13YXJlIEVESUQgaGFuZGxpbmcgYXMgd2VsbCBhcyBFRElEIHByb3Bl
cnR5IHVwZGF0ZXMuIEl0IHdvbid0DQo+ID4+PiB3b3JrIGlmIGRyaXZlcnMgZG8gdGhlaXIgb3du
IHJhbmRvbSB0aGluZ3MuDQo+ID4+IExldCdzIGNoZWNrIGhvdyB0byByZXBsYWNlIHRoZXNlIHJl
ZmVyZW5jZXMgYnkgYXBwcm9wcmlhdGUgb25lcyBvcg0KPiA+PiBmb3JrIHRoZSBmdW5jdGlvbiBh
cyByZXZlcnRpbmcgdGhlc2UgcGF0Y2hlcyBjYXVzZXMgcmVncmVzc2lvbnMuDQo+ID4NCj4gPiBJ
IHRoaW5rIHRoZSBmdW5kYW1lbnRhbCBwcm9ibGVtIHlvdSBoYXZlIGlzIGNvbmZsYXRpbmcgY29u
bmVjdG9yDQo+ID4gZm9yY2luZyB3aXRoIEVESUQgb3ZlcnJpZGUuIFRoZXkncmUgb3J0aG9nb25h
bC4gVGhlIC5mb3JjZSBjYWxsYmFjaw0KPiA+IGhhcyBubyBidXNpbmVzcyBiYXNpbmcgdGhlIGRl
Y2lzaW9ucyBvbiBjb25uZWN0b3ItPmVkaWRfb3ZlcnJpZGUuDQo+ID4gRm9yY2UgaXMgZm9yY2Us
IG92ZXJyaWRlIGlzIG92ZXJyaWRlLg0KPiA+DQo+ID4gVGhlIGRyaXZlciBpc24ndCBldmVuIHN1
cHBvc2VkIHRvIGtub3cgb3IgY2FyZSBpZiB0aGUgRURJRA0KPiA+IG9yaWdpbmF0ZXMgZnJvbSB0
aGUgZmlybXdhcmUgbG9hZGVyIG9yIG92ZXJyaWRlIEVESUQgZGVidWdmcy4NCj4gPiBkcm1fZ2V0
X2VkaWQoKSB3aWxsIGhhbmRsZSB0aGF0IGZvciB5b3UgdHJhbnNwYXJlbnRseS4gSXQnbGwgcmV0
dXJuDQo+ID4gdGhlIEVESUQsIGFuZCB5b3Ugc2hvdWxkbid0IGxvb2sgYXQgY29ubmVjdG9yLT5l
ZGlkX2Jsb2JfcHRyIGVpdGhlci4NCj4gPiBVc2luZyB0aGF0IHdpbGwgbWFrZSBmdXR1cmUgd29y
ayBpbiBkcm1fZWRpZC5jIGhhcmRlci4NCj4gPg0KPiA+IFlvdSBjYW4ndCBmaXggdGhhdCB3aXRo
IG1pbm9yIHR3ZWFrcy4gSSB0aGluayB5b3UnbGwgYmUgYmV0dGVyIG9mZg0KPiA+IHN0YXJ0aW5n
IGZyb20gc2NyYXRjaC4NCj4gPg0KPiA+IEFsc28sIGNvbm5lY3Rvci0+ZWRpZF9vdmVycmlkZSBp
cyBkZWJ1Z2ZzLiBZb3UgYWN0dWFsbHkgY2FuIGNoYW5nZQ0KPiA+IHRoZSBiZWhhdmlvdXIuIElm
IHlvdXIgdXNlcnNwYWNlLCB3aGF0ZXZlciBpdCBpcywgaGFzIGJlZW4gd3JpdHRlbg0KPiA+IHRv
IGFzc3VtZSBjb25uZWN0b3IgZm9yY2luZyBpZiBFRElEIG92ZXJyaWRlIGlzIHNldCwgeW91ICpk
byogaGF2ZQ0KPiA+IHRvIGZpeCB0aGF0LCBhbmQgc2V0IGJvdGguDQo+DQo+IEFueSB1cGRhdGVz
IG9uIGZpeGluZyB0aGlzLCBvciBzaGFsbCB3ZSBwcm9jZWVkIHdpdGggdGhlIHJldmVydHM/DQoN
CldoYXQgaXMgdGhlIGdvYWwgb2YgdGhlIHJldmVydHM/ICBJIGRvbid0IGRpc2FncmVlIHRoYXQg
d2UgbWF5IGJlIHVzaW5nIHRoZSBpbnRlcmZhY2VzIHdyb25nLCBidXQgcmV2ZXJ0aW5nIHRoZW0g
d2lsbCByZWdlc3MgZnVuY3Rpb25hbGl0eSBpbiB0aGUgZHJpdmVyLg0KDQpBbGV4DQo=
