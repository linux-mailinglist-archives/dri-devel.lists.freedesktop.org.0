Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8FF466F39
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 02:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71D66E08C;
	Fri,  3 Dec 2021 01:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A9D6E08C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 01:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJqm8g/jHgJbi2+p0O4XQP3wJUHxdHyoTYxp+wrxcETubxFECtJOEQbJNYLi8gaWdrLtUPUlEX3rVbiERApcy8IUNnzYhSsAfZGNI9q5y0M7klL6RVqIsb18rBQpSF1iWV6/0cBBZ8tCHRazmch8swHI92JyMlYIvkyfC75AvejGa5994AhIS4FB/HTRC5BixDzIJPw/N+Qgnc08AWEe4X9+MRqct8u9li+7AcZjlkhbTLHdHg12Ef2qa0QOVS3dXUV0ffA2mvYAFrgArppSWiwudLjY1jZWstrLRn/JQ9ky6FRTdj/6EQ6evtuCTADBkgqVYGWe6USa2Mu1ELyNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkArF00XcTqycf8aDjtvtxdJvCvx4d38WBdw2EiThsY=;
 b=CZBxP1cBTWhftFOtXbwFSvc1tJXMf9FqwtVE4RqNzoTC1hRZTZJgzPpY8UPnbBIQeeuKJPhMWg7ku6IuqQpK5d6hp2aiAK1aZHBZ4Zmbr3nCGVr/D5BzmPRjFto2FVLplAXjj+qm1bLHW2YrrwBziW3p+ZcUbDsbM/Z9/ZLR5BnBXP1GVEM8nhwKSI17XZvAF7UIb8xb+0PtXKq8JMDpYDejJDgSaIuqF8uBeyBcsKDxexQuhqACO1ax2W1ryYFcyDnQnShteBJSuPmfwdEVkDhso2IcktZxhJ3SOXX/oIGPEiwjuImkQ+WGrcNql/PFwXmA78q8YwvCXwgrReE7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkArF00XcTqycf8aDjtvtxdJvCvx4d38WBdw2EiThsY=;
 b=ViuaP96Wf3vdHNGLEoyByO5/VQXJkfhkzQXAORAbjqX62hPTglfV3bHhDwYC4fGFvSTffdgwv2QQh6UrLBNttTcgbikYyKBMdbFrjc98HT/cLK8mdnOMQVx2vwMw6Op5E12bh+BnR8BqX+/gA60Rb6uCiId8hop38vqyau0NagQ=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM6PR12MB5534.namprd12.prod.outlook.com (2603:10b6:5:20b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14; Fri, 3 Dec 2021 01:45:03 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2512:c434:e164:df7]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2512:c434:e164:df7%5]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 01:45:03 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/ttm: fix ttm_bo_swapout
Thread-Topic: [PATCH] drm/ttm: fix ttm_bo_swapout
Thread-Index: AQHX52jBwqh8kOFWykGj6pxiH5f0cqwf/8FQ
Date: Fri, 3 Dec 2021 01:45:03 +0000
Message-ID: <DM4PR12MB51651B519EAF8C640F14548A876A9@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20211202103828.44573-1-christian.koenig@amd.com>
In-Reply-To: <20211202103828.44573-1-christian.koenig@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=7ab93ba0-7bf8-4a50-90da-b7351c36376d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-03T01:44:18Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 953245bd-0288-4ea6-b9d7-08d9b5fe8681
x-ms-traffictypediagnostic: DM6PR12MB5534:
x-microsoft-antispam-prvs: <DM6PR12MB5534EA041CF84764E2CFAADA876A9@DM6PR12MB5534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 11OSTblbZmDIa5eZWd1smX4Qnlk4PyV0V/eYHiJH3ZA98HxPTcl/keYbYRhafdQvCjkT2x3zktNXMLORDxgbxR8D8f3Nf8Sj16atsvatrZcO/6AXg258BQ1OBvv3iT7K51rHYT1hAvFrQeyICk3sThzA3BlFTyRL28NJqhoBBqq2frDBOPu600er5dM+t/T/pL1gK2Qrpx/MOp5eepb7moh2nlOuJkLxjs9IBVroUeBPc+8X9fCRkGOJOswVG1yulSme7JmamRuxmEqf1loF7P0aDX014s1eSQ+rHvq5gu9+erBGu2WDVCL+2DAo72WqBSWY+DVBC3W/a8mZrJ3Gvl9aaBob5UWNZpJzixMWet4Yzq7yxMcsunFEaaDtyio6u6Jz1kzfAi7yvTq/1t+izUdhgunFIAP+ghPB4G//zbmnWl5vH7HHCdwW3e+mZ2g+Hf7L0YmLD29mEC1RDU5PkdXjaL477vhnukpfGRRVjKRrnC9t/Cr0DmKioQmWB3UftoFhvAzWnlcvGATF9iyR+yccq0oBikBjanJcU+GcYLir+/ppRdDC5MkLjH1phbVHSNITfH5DAZEDA8ZbhNY0quI9ddWaM2NYjX3hobO4QBPSVSMCwC/YQO8as6KY24RvHl/nY7qKMBa/27LwNa667WLybRnH5so8nBXJKwzewgDHqy09yalxkAAwkldnIU7lrb8C/zfyW32Qz9m7c7v4Ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(66556008)(66446008)(2906002)(5660300002)(76116006)(53546011)(6506007)(64756008)(8676002)(66946007)(66476007)(33656002)(26005)(508600001)(186003)(66574015)(86362001)(8936002)(38070700005)(9686003)(122000001)(71200400001)(52536014)(110136005)(55016003)(38100700002)(83380400001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzBuRFdkb01PSGowSE5yQlNGT3RybVF5NFBaSmRNMHRFM0U3bmxVeFY1QWZy?=
 =?utf-8?B?K0NEVU9STnBHUERjVFU5L2NUUlg2eko4SDBicHR2YVlvamlhMG9lMzVWNDBw?=
 =?utf-8?B?dHJCY2FKWDMwc0RnM2FOUG1JM3h4UmljbGdOTW1vcEVrZGhkZzRmelNOUzVa?=
 =?utf-8?B?eFJIWFBacndNMCtpRmV5ZTNEYXhvNUVQdldEOFR6cmpUL3k2aXlFL1RWNktr?=
 =?utf-8?B?NHBQYWVIbitEMUtSa0FQaFlQdlZrdmtmVlRmNGdlU282TDdoVlYxQjhZUTZj?=
 =?utf-8?B?OUtxdXlMK3NZOUZVYzdIbnA3NGdvOTJUTkdJZHVKU1hkNDNMeENOeWl3L2Rr?=
 =?utf-8?B?enBERjdqaWhZTmh2WkR2R081SEdZT3VORXRSZ1lIVG5jNGZSYk5nSmFGZG5m?=
 =?utf-8?B?NmdwckRTc08xTVp4OTk2bkljMWtrRDdrWHd1ajBpWUNyRlVpYjNSbGVEMlpi?=
 =?utf-8?B?MzB3Rm9vQ3NjOTFZT05TU3JyNTNHT3MwdytNUXNsZ1p5aTZ2Z2hEc0xWRWFW?=
 =?utf-8?B?NzcrUkZlWTZBeTl0RUtvZVl6NFdmSW0xOUV0ZHNuclN1RnRvRHc3QUVFU3F4?=
 =?utf-8?B?SDRVS0JtQXhjd2JNNHZMa3Zxa3lNbGMvaE56QUlUVU54a0tWRW9ycVVWMmI4?=
 =?utf-8?B?bDkyZjFnNTE5bXpEMFV2SDRzb04yK2RvdWZHMmllamxkN1FUQXNvb1Z6Y3pX?=
 =?utf-8?B?VTFJMnJOdG5qVWwrZ0dQNjlzMlhYTTlVNzU5cHdZN2hsMVpucGZpZGRSY2p6?=
 =?utf-8?B?ZFpXa0hFZHJXVmZua3o3alFMTEs0L2dFend1SEFNUkxadU9aVnppdlJ4T050?=
 =?utf-8?B?TGlQQmpBbzY2T0lPYm55dlNNWmJmZW1MQTNFVnZzckhzWlBZalFEcFVLVjdX?=
 =?utf-8?B?QXhiYUNHWTNCSmQxREcxMDRqN3FDTGhCWTg5Z3ZZREpUb3pEb3ZWTEErZWhG?=
 =?utf-8?B?Tk9iQjRFSVJpY2FHb2c3VEQ2cWpoaXBuTVE5V0hWVWkycGVSaDdlMFlhOUsw?=
 =?utf-8?B?NTd1dHY0eGNlR3RFR0ZHUjc2OHhxK094azV6Yml6N1QvM3h3RlZZTDV3OWtw?=
 =?utf-8?B?ekU0KzBRaDgvU2FlSndCNTAydXRJT2JibnppanYrQnVqTXJlVmJ0NDVYME5T?=
 =?utf-8?B?aGJ5UFBXL0w1NFVEaGxId2Q4YTM1eXExNlpoYm1ibnd4SXY3WC9EaFBLOTcv?=
 =?utf-8?B?NFFySDFSSGJXWkF0L2dqSHVqSUZBSTlkSVl1UE4wYWFoN2J6MlU5THJHNkF1?=
 =?utf-8?B?Z1dEZm5mTi9RTTEwYitUS3I4SjJYMnNNdGVwdXNJbnRZTmx3dGpEdWZnL2xG?=
 =?utf-8?B?OHl6RzZEUmFjQ2JpS2tVTi9VT0IrbGRLZmpoZkhoTTlWZWc5SXJjMHgvK0ha?=
 =?utf-8?B?ZXQ2WXdoUWNnSk9XK1FOT05wQzY3L2l6RGljZ1lxNmN1dFJBbVRrTWEvQWNU?=
 =?utf-8?B?SlU5TmJGbkhTcFhuZ1piYVZQam84WndJd0NOM2NJTUJsQkhXNlB6MTkvS1l2?=
 =?utf-8?B?eHJ2Z25qeFpsL0hua0JJSS9ocGxKMk1xN0huVC9pVnArM2JIcDNXdHdReWtI?=
 =?utf-8?B?UW16eEZEZUNhOVVpdWY5QTJqYkhrb2ZjZEtBN0FMVDRLaCtSdmpjc0pQSWdv?=
 =?utf-8?B?UDRQc2ZiZ0RnL3FVRzhxcEU1TU9HdXpVNTRFak9vYW1CcWwzOXpLaXVRdHVO?=
 =?utf-8?B?cmQrQXZCU1MzMVFsWVJIeE5DVmRwM0ZFOFhPKzRMWjhJQ0NJRmNIZTBaNFVj?=
 =?utf-8?B?VXVXYm1yNW1qWlF3bGNWMGl1cHRtaUttL3RxLzBEYU11WWxzdnBzcm1OeUZy?=
 =?utf-8?B?TlFuc3J4QS9OK1ZYdkxFZFNPRGFjR1BBRnZOR1cyd3MrYnJMUGJ5NGhqTVNj?=
 =?utf-8?B?eWtaNVd1WjZzSnp1U25sblZITWNsUDVKMm5OSk0wdHNsOGVBbmFOOUQ1NTNU?=
 =?utf-8?B?Yk1yb2J3b3hmZ0xyVnNQRjVxZWFDQ3BVMi9vOVV3YTlmRjQ0RmNscVg2RlpV?=
 =?utf-8?B?NFN5RlUzb2hjUVBZN0o0aFVlY1pXZUlkWkgweDB2WHUxZlQ2L1VSUFVkTW1x?=
 =?utf-8?B?SUVYc0lKM20vUit4dnZKYW1FN3gwR2tSTzExSWgzbFJTNzZEelNHTndNckp5?=
 =?utf-8?Q?7FpY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953245bd-0288-4ea6-b9d7-08d9b5fe8681
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 01:45:03.1355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MT1sJODw6bu2+4p2SCxAXbaQ6sQV3chhA+K8eKHC31oDELpBv9gdFJdPznm60Sjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5534
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KTG9va3MgZ29vZCB0byBtZS4gVGhhbmtzDQoNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2Vu
aWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDIs
IDIwMjEgNjozOCBQTQ0KVG86IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBbUEFUQ0hdIGRybS90dG06IGZp
eCB0dG1fYm9fc3dhcG91dA0KDQpDb21taXQgNzEyMGE0NDdjN2ZlICgiZHJtL3R0bTogRG91Ymxl
IGNoZWNrIG1lbV90eXBlIG9mIEJPIHdoaWxlIGV2aWN0aW9uIikgbWFkZSB0dG1fYm9fZXZpY3Rf
c3dhcG91dF9hbGxvd2FibGUoKSBmdW5jdGlvbiBhY3R1YWxseSBjaGVjayB0aGUgcGxhY2VtZW50
LCBidXQgd2UgYWx3YXlzIHVzZWQgYSBkdW1teSBwbGFjZW1lbnQgaW4gdHRtX2JvX3N3YXBvdXQu
DQoNCkZpeCB0aGlzIGJ5IHVzaW5nIHRoZSByZWFsIHBsYWNlbWVudCBpbnN0ZWFkLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQpG
aXhlczogNzEyMGE0NDdjN2ZlICgiZHJtL3R0bTogRG91YmxlIGNoZWNrIG1lbV90eXBlIG9mIEJP
IHdoaWxlIGV2aWN0aW9uIikNCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAz
ICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIGluZGV4IDczOWYxMWMwMTA5Yy4uMDQ3YWRjNDJkOWEwIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYw0KQEAgLTExMDMsNyArMTEwMyw3IEBAIGludCB0dG1fYm9fc3dhcG91dChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0
eCwNCiAgICAgICAgICogYXMgYW4gaW5kaWNhdGlvbiB0aGF0IHdlJ3JlIGFib3V0IHRvIHN3YXAg
b3V0Lg0KICAgICAgICAgKi8NCiAgICAgICAgbWVtc2V0KCZwbGFjZSwgMCwgc2l6ZW9mKHBsYWNl
KSk7DQotICAgICAgIHBsYWNlLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsNCisgICAgICAgcGxh
Y2UubWVtX3R5cGUgPSBiby0+cmVzb3VyY2UtPm1lbV90eXBlOw0KICAgICAgICBpZiAoIXR0bV9i
b19ldmljdF9zd2Fwb3V0X2FsbG93YWJsZShibywgY3R4LCAmcGxhY2UsICZsb2NrZWQsIE5VTEwp
KQ0KICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7DQoNCkBAIC0xMTM1LDYgKzExMzUsNyBA
QCBpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0
IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgsDQogICAgICAgICAgICAgICAgc3RydWN0IHR0bV9wbGFj
ZSBob3A7DQoNCiAgICAgICAgICAgICAgICBtZW1zZXQoJmhvcCwgMCwgc2l6ZW9mKGhvcCkpOw0K
KyAgICAgICAgICAgICAgIHBsYWNlLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsNCiAgICAgICAg
ICAgICAgICByZXQgPSB0dG1fcmVzb3VyY2VfYWxsb2MoYm8sICZwbGFjZSwgJmV2aWN0X21lbSk7
DQogICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHJldCkpDQogICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIG91dDsNCi0tDQoyLjI1LjENCg0K
