Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D12B548051
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 09:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD0E10EC1F;
	Mon, 13 Jun 2022 07:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E4810EC3F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 07:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaX1ExNLWYm7Gb+M4vcoU3cQrUr0zrynrhN1NolHnBr6Ef911mDDzgwhxcRkDXXgu9sXl0W8TPHAhRiiSICrDqLoLjIDWQmpR7IcgRi3FHr4igBK/pTa7czSjh2MCNOMAMVdZTi2AEXCABg7WXCOKqpNA/ukv3WyWvltpAcPAKp8CkAfFDmst4Thg98oubsnnBO+KSMUfJHkhEXHsjmxIZb3zxtzZftnvq/p3MVjRH4A27dhZHjNgXxIimc1tOdIUHBUNK/EgpnYdqGE1r2AVmBvcfQVBmtrxd7VC9soGK7e3jTwZ/2Wzt4OMWWlQ6B5wGinp+Dk1X00Kn8HnP7B9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9Yf1NLGk0UyuIVboTs5wmu2KAd+5b1eLyrzxwjRqls=;
 b=MUmTUdE+zOZ9iQ+RQm5/7x04Q+CowtSVGiU6Goj+YwCoh+PCpAJ5Si/2Tg0uCZys5ksIzpGqcN62qkQwDZca1eeYe+oSi3y0Xp0GJxa2h56OWWoucJ35xKw/055sXBAekZo7dN6jTnfqDWmYWMZmCJSSGYQ8JRIJGRFgJwOGVOI/mpRx+lg8bvNZewPUrCTnzRHf7VvTcDaeLwigTd8nQstfn+CfZBTjANZ3ShoztZWKmdpu5+uNfgJ3QozO0YOB4KWs29c8fSP2xd+0jIdJWlr6GefygJEiXSsBPdre4F1Le/gpL4vkKQY56c7iXhXhyVPDmywnZdD73QRsatTsUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9Yf1NLGk0UyuIVboTs5wmu2KAd+5b1eLyrzxwjRqls=;
 b=DlObzYrhjyBQ61lrMLJfKo/ogKPWUp5fEJAjdbVvAjjwZNRh6bjFxpJ/SRZh3Qr2ZtJfzkvHn/WP63FLsH/Hj1WFjR9osBAwSGljLJjSITlWosLtmddpLHMVCipJTc7bJ9joWSWcrnedaIEyxBAV3tzIseNzC4eM5cnHdj+iJt0=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by DM4PR12MB6301.namprd12.prod.outlook.com (2603:10b6:8:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 07:25:25 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 07:25:25 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: William Tseng <william.tseng@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH v2] drm/edid: ignore the CEA modes not defined in
 CEA-861-D
Thread-Index: AQHYft3h33YnfcZSXUW8Nr4KMwdTEK1M4uFw
Date: Mon, 13 Jun 2022 07:25:25 +0000
Message-ID: <CO6PR12MB5489D1366E44E62AFE5A104AFCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
 <20220613042707.8525-1-william.tseng@intel.com>
In-Reply-To: <20220613042707.8525-1-william.tseng@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-13T07:25:22Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=bfe34404-cdb8-474a-9659-739ac2272273;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b87e84b-26a5-4ed6-d490-08da4d0de249
x-ms-traffictypediagnostic: DM4PR12MB6301:EE_
x-microsoft-antispam-prvs: <DM4PR12MB6301C2216D9F5517B590E340FCAB9@DM4PR12MB6301.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RwJ/YMfxhSuVvI4I3DqhRBdqY6LB7t8OLsrDU8RWO0bbPykuX9U7Tmo8QtEyznZKLBdl1rltCiKhpR0zksj3plm577LGwRnmfCpYoBhJosystwlY6nkPvd3Rjoh58hP8QXlGKeBz9Dz6inJLBubB33ekyKgaLbm+UZkp8EHuINip4wDKlMFYOj5zG825pXRJgedBLgc4EGZp9JI72SQ9GfPixvnO/GS2S1ulzEZtFREYGNDIdggex9MmhkRW7uRgqo/Tw19c10RjdfxviSLtU2pPo0SHccAqPEXAvRFlyYOgrmJueue8jpw8auxgAHImBmzQyhlrOJtf4/1pNsEN3GMmy5Y/VxJ6vkqvVd1oolawJEAht0ayzhflmTOhZJW8pHXOZFKPuYrcjpLdlMwjIJu6KFXZZpq+/h8ArS2lY3M46Us2qmhcB2sjnPpLmuLYdwJHjv6GK19cZ/oMW5Iue7QKN36mMKyvXyaKGu/obnfZ2M5Mu4pI38jHbSxSeU/lUqgjkcOIjMBKwzuT19QoQAm3evM5yi4ja8I+2N/XvXXPKHN3NNt7evNSPnM1gGujRgKO5A0cFkh7dq50q6a8IDfuZnrVmSBY6NVbDSKLRYTFPZecs7yjPCxvO0v1OPvWXMcWNx8OyGv4aHclzBJOtmJUombR/km5DA/7qfx4hMmWjlM5RJ/eyXn7SVsnhllLruUxVy2O/jyySgJCC7vL9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(55016003)(316002)(110136005)(54906003)(66446008)(64756008)(66574015)(66556008)(83380400001)(4326008)(38100700002)(8676002)(86362001)(71200400001)(186003)(33656002)(2906002)(66946007)(66476007)(76116006)(122000001)(508600001)(52536014)(8936002)(9686003)(7696005)(6506007)(26005)(38070700005)(5660300002)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RSt0eFVxR3pDRWE2L3IrdVhGR29KZ3ZJcnFTTC95cHA3THpTYms4Yi9hWTRF?=
 =?utf-8?B?bWtZZ2lUR256eWplRk4yL1hRYWIwTUdEYkxjdm9yTWVrQ3J2eVJkcmx6TFB0?=
 =?utf-8?B?RTB1Y2tLZUVMQXBuZHFadnkzMkRGL0ZEZHV0eFZyaWFERkkrRnhyWGkvbm1C?=
 =?utf-8?B?cGxEK0k3K2ExYkdtVE92M24yNStnNzRxcExsbU4wT3lLbmEyRDh0MVRiS21l?=
 =?utf-8?B?L293TkR4RmE5OVUySFhwblp5bjhRU0JRRzM1M0piWlJLVmRVUkZkL3lpSlJq?=
 =?utf-8?B?YXhBT05HQWZySzVxSmxnTGpQUGxRajVFTWFxdVpmZUp5cTZ2aHc2V2grWVZZ?=
 =?utf-8?B?TDk3Qjg5bG9qdURCVjRVa2hqMWgwdU1ZekVTT05qQzFDMjVNdjFvNHZ2WEhE?=
 =?utf-8?B?aDNNZzJkYmNGMGJxTm90MjhTbmRPbEQyVWlEMkYzcVR4Vm0vNS91dmQxcDY4?=
 =?utf-8?B?dy94NU52K211WTRlLzRHbERkYStxUTg3MHNzMmtreGtZWEhRbHVvdG5xc2lh?=
 =?utf-8?B?MTltTllXdUJ3ZGEra0JHRGZlaCtTSnVheWdnb012M0NnM0p0cmRreUhjRkxN?=
 =?utf-8?B?d1o0OXR6RTVTWkl4WW50L0h6dnJ6TmYrNUZ3Z2R3U3NrV2JjQnZjcnh1Qk0w?=
 =?utf-8?B?ZzBGZlVsRytNbU53cFA4eWt0OGNMTXhyMGtVVXFUV3ZrZ0tLMXJtUUVSWE1p?=
 =?utf-8?B?Qjdvem5DWXFBQmxoYkxsb3NrVGtkcFRMRVd2dmZVZDI5R2RHVzlEMW0yKzNh?=
 =?utf-8?B?Y3hxYnVmZmJiaUxQSVFoYnpFOVdSeU1EUU96bkNWODE4aTl2djUyRktoaTZs?=
 =?utf-8?B?ZmMrY1FpNWZtUmRJNWFHdDJMd1k0bGIxQVZJa0JidTkyU3RNMER2OHpKWjhK?=
 =?utf-8?B?M3RkL211K20yYUN4MkVoQXhQNnhLR0pVdVZrMFMwQ1h2YzZyQWttS0llMDB1?=
 =?utf-8?B?L3htS1BRSC84ZEcwaWo2Vk1GOXBYc0lLM3UvRWoxd3J4bVlQcW80UzF0aldF?=
 =?utf-8?B?VllEaXZkQStNbFJNRngrRTV2VFFBVFkvUXdxTDdZVnJQc1pSM0tmZHdsRlZ1?=
 =?utf-8?B?Z3JsdFBXcklqWGc2aVlsQXVlTFE1M2NMZE94b2xCZHNpVW9GR2RZSG9lby9N?=
 =?utf-8?B?NmNrZzRydGhEZUYvRUhSM3ZyZ0lMVHNWS0VjNG95a1hCdWZXcHRhNXEyVDNN?=
 =?utf-8?B?bUZPUk9ZUm1Gak1Cc0ZLeEhrS0d2cmp3TTNrMzhzZ0JhMUZueHRtUU9nSW5o?=
 =?utf-8?B?aC9xTVdDREZNVDRjYTY1aDRDZGZQRFBsbUZyd3FwZnAwSDMyWGtrUEllWEtV?=
 =?utf-8?B?ajM1NmlQS1pyRjhVRHZEbXV4b2F4Ykxvd2V5bmszazV2Z1hjK0t4TjNRaHlt?=
 =?utf-8?B?ODdkMWJuREZUN1JxOStuWEdiWC9MSUZBUVVTY1JiTWo5bHZuNDZkZHhUMVYz?=
 =?utf-8?B?ZjhzRkJxRVFNeUJtRjZLcjhEenNkU2l4QmRxSVdFNHBJd0VNckFiMDltcEhh?=
 =?utf-8?B?V3BiQWlMVzBxSkhydmxvb2RhL2F4MHhhNWZpNC9vakF2emlqUUQyRkNiSXF5?=
 =?utf-8?B?WnNOWDM5a05Kd0RwN1luZzdzTG9WM0JLZWRtNWsxL1JRcFh0OGhiTjdEdDJC?=
 =?utf-8?B?S0hPR3JuUFlIRFJlWU1oM0FJU2lWWG0vTGQ4a0tRazNxbGpiMUNXcHhNUXdU?=
 =?utf-8?B?Y3pWdzNIK3dJQXZIWWN3UWkxZWF2UkpOZjFkMkJKUnRPdCtSVHdiMTdnN3g5?=
 =?utf-8?B?Ym1Db29GWUNrekJHS0xtTVZVRC9MSGZ5Nm1lTzRFRm1SMnpzRkw3U0xyZThj?=
 =?utf-8?B?SnBrQ0ZYZ2ZpT0tNRVhoZUsraXZSZEVmT2kzY0dCM3Q5MmZTc2ZmK1A0RWtZ?=
 =?utf-8?B?djdRbm4xeGdha1dqRjFBVmZ3dUZZMTdYdVVzWFZUZmhMckFzV1I0dG42TmVi?=
 =?utf-8?B?UjJLV01YVXd4MytlS2hhc2RnZm1qc0Zxend1NzNJOUluMzlXNGRoNHlDWmhL?=
 =?utf-8?B?N0dDYXI3SEIxVWNFZ01LY2x3WmNXZGRWSkpSaXIyd3JkL05RV0lDcE8wMzdX?=
 =?utf-8?B?amhnTVlyZGJtcERsSHJUaU5pWVBVU0doK1JaeE9lWEFpYnNTZkp0ZUc5QzIy?=
 =?utf-8?B?TThGVkhMMGJuKzBjOEpuZjdSanJJWEdqbXN0MmxUN0s3Wkdnb1pNUGoxQ2w1?=
 =?utf-8?B?QTNLQkVJZWtTdTlKa29zaUVEMDhvaVA5aWg5cWdwTHVFeXdSdXFOZXVKRjdt?=
 =?utf-8?B?SFROSUUrSG01T3VBVlNPTmJwdnJVek1iSDlhNksxVXh2MGs1eVQ3NVBXTHlV?=
 =?utf-8?B?UkcvK0Fzc1ZiYUtRUXJpVXA5WEpILzZJRndzczlab2tEOXpTSnFFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b87e84b-26a5-4ed6-d490-08da4d0de249
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 07:25:25.2593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iomU1TaZRnNOLDvRB21BFa8wERGrHQlldX31mmg3C+Ai+RIgRbUSJnu1R8JxDspXpX/kYnAoR1SaeWfBSG7+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6301
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
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoYW5rcyBXaWxsaWFtIQ0KDQpB
ZnRlciBmaXhpbmcgZmV3IHR5cG9zIGJlbG93LCBmZWVsIGZyZWUgdG8gYWRkOg0KDQpBY2tlZC1i
eTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBXaWxsaWFtIFRzZW5nIDx3aWxsaWFtLnRzZW5nQGludGVsLmNvbT4N
Cj4gU2VudDogTW9uZGF5LCBKdW5lIDEzLCAyMDIyIDEyOjI3IFBNDQo+IFRvOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBXaWxsaWFtIFRzZW5nIDx3aWxsaWFtLnRzZW5n
QGludGVsLmNvbT47IFZpbGxlIFN5cmrDpGzDpA0KPiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPjsgTGluLA0K
PiBXYXluZSA8V2F5bmUuTGluQGFtZC5jb20+OyBMZWUgU2hhd24gQyA8c2hhd24uYy5sZWVAaW50
ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS9lZGlkOiBpZ25vcmUgdGhlIENFQSBt
b2RlcyBub3QgZGVmaW5lZCBpbiBDRUEtDQo+IDg2MS1EDQo+IA0KPiBUaGlzIGlzIGEgd29ya2Fy
b3VuZCBmb3IgSERNSSAxLjQgc2luayB3aGljaCBoYXMgYSBDRUEgbW9kZSB3aXRoIGhpZ2hlciB2
aWMNCj4gdGhhbiB3aGF0IGlzIGRlZmluZWQgaW4gQ0VBLTg2MS1ELg0KPiANCj4gQXMgYW4gZXhh
bXBsZSwgYSBIRE1JIDEuNCBzaW5rIGhhcyB0aGUgdmlkZW8gZm9ybWF0IDI1NjB4MTA4MHAgdG8g
YmUNCj4gZGlzcGxheWVkIGFuZCB0aGUgdmlkZW8gZm9ybWF0IGlzIGluZGljYXRlZCBieSBib3Ro
IFNWRCAod2l0aCB2aWMgOTAgYW5kDQo+IHBpY3R1dXJlIGFzcGVjdCByYXRpbyA2NDoyNykgYW5k
IERURC4gIFdoZW4gY29ubmVjdGluZyB0byBzdWNoIHNpbmssIHNvdXJjZQ0KDQpUeXBvIC0gcGlj
dHVyZQ0KPiBjYW4ndCBvdXRwdXQgdGhlIHZpZGVvIGZvcm1hdCBpbiBTVkQgYmVjYXVzZSBhbiBl
cnJvciBpcyByZXR1cm5lZCBieQ0KPiBkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxh
eV9tb2RlKCksIHdoaWNoIGNhbid0IGZpbGwgdGhlDQo+IGluZm9mcmFtZSB3aXRoIHBpY3R1dXJl
IGFzcGVjdCByYXRpbyA2NDoyNyBhbmQgdGhlIHZpYywgd2hpY2ggaXMgb3JpZ2luYWxseSA5MA0K
DQpUeXBvIC0gcGljdHVyZQ0KPiBhbmQgaXMgY2hhbmdlZCB0byAwIGJ5IGRybV9tb2RlX2NlYV92
aWMoKS4NCj4gDQo+IFRvIHdvcmsgYXJvdW5kIGl0LCBkbyBub3Qgc2V0IHRoZSB2aWMgMCBzbyB0
aGUgY29ycmVzcG9uZGluZyBtb2RlIG1heSBiZQ0KPiBhY2NlcHRlZCBpbiBkcm1faGRtaV9hdmlf
aW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKCkgYW5kIGJlDQo+IGRpc3BhbHllZC4NCj4gDQo+
IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBD
YzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFdheW5l
IExpbiA8d2F5bmVsaW5AYW1kLmNvbT4NCj4gQ2M6IExlZSBTaGF3biBDIDxzaGF3bi5jLmxlZUBp
bnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gVHNlbmcgPHdpbGxpYW0udHNlbmdA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMTAgKysr
KysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jDQo+IGluZGV4IGJjNDNlMWIzMjA5Mi4uYTQ1ODI2MjdlYzlk
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiBAQCAtNTg3Niw3ICs1ODc2LDggQEAgc3RhdGljIHU4
IGRybV9tb2RlX2hkbWlfdmljKGNvbnN0IHN0cnVjdA0KPiBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IsICB9DQo+IA0KPiAgc3RhdGljIHU4IGRybV9tb2RlX2NlYV92aWMoY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gLQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlICptb2RlKQ0KPiArCQkJICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1v
ZGUsDQo+ICsJCQkgICBib29sIGlzX2hkbWkyX3NpbmspDQo+ICB7DQo+ICAJdTggdmljOw0KPiAN
Cj4gQEAgLTU4OTYsNyArNTg5Nyw3IEBAIHN0YXRpYyB1OCBkcm1fbW9kZV9jZWFfdmljKGNvbnN0
IHN0cnVjdA0KPiBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+ICAJICogSERNSSAyLjAgVklD
IHJhbmdlOiAxIDw9IFZJQyA8PSAxMDcgKENFQS04NjEtRikuIFNvIHdlDQo+ICAJICogaGF2ZSB0
byBtYWtlIHN1cmUgd2UgZG9udCBicmVhayBIRE1JIDEuNCBzaW5rcy4NCj4gIAkgKi8NCj4gLQlp
ZiAoIWlzX2hkbWkyX3NpbmsoY29ubmVjdG9yKSAmJiB2aWMgPiA2NCkNCj4gKwlpZiAoIWlzX2hk
bWkyX3NpbmsgJiYgdmljID4gNjQpDQo+ICAJCXJldHVybiAwOw0KPiANCj4gIAlyZXR1cm4gdmlj
Ow0KPiBAQCAtNTkyNyw3ICs1OTI4LDcgQEANCj4gZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9mcm9t
X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lDQo+ICpmcmFtZSwNCj4gIAlp
ZiAobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0RCTENMSykNCj4gIAkJZnJhbWUtPnBpeGVs
X3JlcGVhdCA9IDE7DQo+IA0KPiAtCXZpYyA9IGRybV9tb2RlX2NlYV92aWMoY29ubmVjdG9yLCBt
b2RlKTsNCj4gKwl2aWMgPSBkcm1fbW9kZV9jZWFfdmljKGNvbm5lY3RvciwgbW9kZSwgdHJ1ZSk7
DQo+ICAJaGRtaV92aWMgPSBkcm1fbW9kZV9oZG1pX3ZpYyhjb25uZWN0b3IsIG1vZGUpOw0KPiAN
Cj4gIAlmcmFtZS0+cGljdHVyZV9hc3BlY3QgPSBIRE1JX1BJQ1RVUkVfQVNQRUNUX05PTkU7IEBA
IC0NCj4gNTk3MSw3ICs1OTcyLDggQEAgZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9mcm9tX2Rpc3Bs
YXlfbW9kZShzdHJ1Y3QNCj4gaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwNCj4gIAkJcGljdHVy
ZV9hc3BlY3QgPSBIRE1JX1BJQ1RVUkVfQVNQRUNUX05PTkU7DQo+ICAJfQ0KPiANCj4gLQlmcmFt
ZS0+dmlkZW9fY29kZSA9IHZpYzsNCj4gKwlmcmFtZS0+dmlkZW9fY29kZSA9IGRybV9tb2RlX2Nl
YV92aWMoY29ubmVjdG9yLCBtb2RlLA0KPiArCQkJCQkJaXNfaGRtaTJfc2luayhjb25uZWN0b3Ip
KTsNCj4gIAlmcmFtZS0+cGljdHVyZV9hc3BlY3QgPSBwaWN0dXJlX2FzcGVjdDsNCj4gIAlmcmFt
ZS0+YWN0aXZlX2FzcGVjdCA9IEhETUlfQUNUSVZFX0FTUEVDVF9QSUNUVVJFOw0KPiAgCWZyYW1l
LT5zY2FuX21vZGUgPSBIRE1JX1NDQU5fTU9ERV9VTkRFUlNDQU47DQo+IC0tDQo+IDIuMTcuMQ0K
