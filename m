Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DDF7944F9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC0610E1E2;
	Wed,  6 Sep 2023 21:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU008.outbound.protection.outlook.com
 (mail-westcentralusazon11012012.outbound.protection.outlook.com
 [40.93.200.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52FB10E1E2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqgD5yZd0PuKUlOhOvzckVvb47RQIeYxTEgDdEAkgrD/e/Ngfl1/IMpLgNLsOm9f5dAN/HUoK9ug5XDaYaZFmF4jat6wkHE5snwRDe7IQMho/Oq/37+TnaEYndDJL+yBDotUhFhaMNu09f8Vya8aI6C7r5t1sW6F8l7tPsU2Wtrv3uV9QlYKMVq1CKzXbMm3N2NDDXr+JzQx3Kw3LOrXpANeO/Uow5qNIqUdmCED5V+UbkzRhtMnYwgZDKqm767zdIFPBhJkaTI2aLsyvEmdt66EDKwq1XiUOqNX9X96ctegxuzgK4GJfogwLOjEAp/sLFgxXqgecLoRjlsfCoT/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip4CzFd41Ma4o7g+WRvBKUKhOrEYAudKPnmcuxueAmc=;
 b=bM9JEt6CiLnc0dd/IcsLmixQ7YgbYCVjgfC9avmZDA075NlcTTrDeLwR6VAF4K0//+8IDkP+1N+WE3eef9xiw1SmRwYcQ+vhJhbeqAWvrpbYZlTo3tdhmJ4KakyzGEzaA2f5FJO70vXhRnHUx6EBtXRcmq7GSLzQ3le6DhMUzUPd2beTzXHUGi+qlvJyR76lBaQ6sXlHoDoYBDlkS56NOWXa0xIYO2gUpWcdgg84k+3ry5jBiR9ETGUiBMu1voXTf5khvXK0UujPlJSM//W8HoxzZSfVVgx3+XhAFLzvMC3rlDZuKPS2oC3PCezVWWnhsCwqTFqq//WIL8ANK/nIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip4CzFd41Ma4o7g+WRvBKUKhOrEYAudKPnmcuxueAmc=;
 b=rZ8fK80iChBQoZr9+IEb68m2keB9shWlrWH+nlvlPRxauqGnI1qud4YGXeUTWOrN/k5OCk/67Ig6zFqrAwgN3r5qYsAdT7Bv9cbMzD9RyCobbuPztDwfCYe9uxd+LfMGzG9T8iZjwrjXc3nDtTIiOTSU34u7MHvnHixe++kbCmc=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by DS0PR05MB9152.namprd05.prod.outlook.com (2603:10b6:8:c4::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Wed, 6 Sep 2023 21:13:49 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::9e05:acf:9240:addd]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::9e05:acf:9240:addd%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 21:13:49 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "juntong.deng@outlook.com" <juntong.deng@outlook.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>
Subject: Re: [PATCH] drm: Rename drm_ioctl_flags() to eliminate duplicate
 declaration warning
Thread-Topic: [PATCH] drm: Rename drm_ioctl_flags() to eliminate duplicate
 declaration warning
Thread-Index: AQHZ4OGrqbSFeiBTZ0emwmy+Yq650bAOTEMA
Date: Wed, 6 Sep 2023 21:13:49 +0000
Message-ID: <da7e44fac65b2c73c9f1000a2c1d9c75d931a9d7.camel@vmware.com>
References: <VI1P193MB0752635EE197F2BB14A2D87499EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752635EE197F2BB14A2D87499EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|DS0PR05MB9152:EE_
x-ms-office365-filtering-correlation-id: f89b430f-4825-4066-47cb-08dbaf1e2a21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HN3cBn9ieT7rWZdxuVhFT6RalJ+I5j2fvzMw+6wvXwHW7iIPZ1H2NofAnwBC+uaGs+hIAMuKrXDJV9/8LjzM2/iq8eMZbt2plhCKuaumhDq9t/qta1V0vwZxO60A/TyZUdE85oEZ/XvyB3rlUTB3mMjhgWcLlLEXTiFq3WHYGXuDrpPb+eDgkEON9CLuYbH3+A4GHXhZoro7p8s3UIyWDjwgOmLLb3/oZ2821+kfmczXO2MEjMzT/vUVg7Z1Ek9aK5Ijd6FnZYFejhPLnmM9WM+wPlcbsxzT3CiH80lAJytvFuV8OMO3wcoO69XQ/4JoH7D0OZ2KZz0Ax7u/9qjbfyfD9jjPhIf5u2Eivxg7+YDDTCpxxrSlXUsuF6msLituKIINKmzel8+aKj//ctnT7crG4wmPurm+lSgL7xUBHJfRztfG6r01b0/bSxTviCPyq73S6WbJRZNxJsUvMB1BYBj5Ked08m9obipFHS82xCMJjynFjFIYYJ7ZRVZ5Lc69zAVAbcNxVbV0esV7Kcm5BKW9ueU8Meeq5IAW2+XXUd9JzuyrlYtNAD79CYUmi8GXoVtgfYv9v+MgvjItLsBJkjJ3LGRaLZHV092k+Pp36doZR3IAsPCjNVLu762GP1jPT64Dd3ccAswP2zXSArfoEmo5foW3OjxbT8kpJYdrTh8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(186009)(1800799009)(451199024)(122000001)(2616005)(38100700002)(26005)(38070700005)(6506007)(6486002)(6512007)(36756003)(83380400001)(4326008)(66446008)(478600001)(8676002)(8936002)(66946007)(110136005)(66556008)(76116006)(5660300002)(66476007)(64756008)(86362001)(6636002)(54906003)(316002)(71200400001)(2906002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VldzN1dNbmF6c09VeHBFcnNKZ05QU2x0OWVEbldaSEVVTDNKemdxbDIySlFu?=
 =?utf-8?B?TTVzM043cENMczR1dXJDN1NSM0JTa0dqQVMyeFEyY0FCVVMrbnhnazczY3Zt?=
 =?utf-8?B?NlI5WktQQjg2VzZ1M3FGdFFXZmFsOUQ5bWs1SWQwRG41NmJUSm9sVnFTMDNX?=
 =?utf-8?B?MzVuL0txaks1UllCMmVhVG5qZjQxeXdDRHFIY09wMDlCTTZiWG42M041OGFD?=
 =?utf-8?B?eWlJOUpKMHlyNkhQTHNDRldnSkdkbEIyWHVpVEtjS1BtQUJGai9KZ2k4TXMv?=
 =?utf-8?B?VmJJRHJ3dUY0SXlVTDBQNGJxTHlqMHB0S0pZQmMrbkhHUzhjTXBaNkh0MkR4?=
 =?utf-8?B?Mi9Fd2MzL01jWVhMWGRTUEp0d2taK2FMQWUvejM4ZUtPZmlCRXRtU2JmeE1R?=
 =?utf-8?B?ajRmbnVUOWNkUE9GTVRoQVd5Wmx4ZXIweXA0TVd1REIxMXZrenU1U05VcGFD?=
 =?utf-8?B?amNEN0IrQjhwT09PTm9KUUE0eUZsUm1vN014Y1pHMjFHNkwyeUFaZ2hRNjVh?=
 =?utf-8?B?NG9LREVwSlNyMzJkY21uR3RuV2VwRXlMOFJCRXUzOXhMZmRRdW9iR3hLR2RD?=
 =?utf-8?B?dlZ1L25mNTgvajV3Snh4c1Eyd3FUOFhTMVg1UzlITTAvTTRhY2FqTHhqNjhH?=
 =?utf-8?B?MG5RWGxTSzBOWlFwY3J3VStCbTZuOVVkYkxvYS9mUXcvYWt2VTdacmlhN01J?=
 =?utf-8?B?UjB0OStYVXdXM3FtUjFRSVg4aTAzSmtoMHhUN3pXRHRsc2xFc1hIL3lJU1N0?=
 =?utf-8?B?K0NURWkxTXpXY1hydklRdE51UzdUakxkOTlWM2E4TzMyaUhXOEFUd093aHpW?=
 =?utf-8?B?OU04bW1zclVsSld2a0l5ZVFLeC9jdU92M1oveEEvMmkvbk9rL1psN0s5UjBU?=
 =?utf-8?B?dWkzZjRSWE9COHZBZ1M3ZVI0Y0xQYkV1UTRhRzNJYVI0K3Y3Vjc4MTIzVTNV?=
 =?utf-8?B?a3oyRFV1Rzk2cnIxSHA1ellpbGlqSlQ5NUtOUTh5aTRqdTFqSTl6bkRMY09E?=
 =?utf-8?B?RE9mNmpNeXVNdlVQTGtKQzJTaVJ5cGRPUTRMSVNHd0hCekd6NmhnMFZoRXJS?=
 =?utf-8?B?ZjJmR2ltay9KQVZYSnJPSmVRalZtc3c1Sld4WEZBVXo0K3hkL3YzVlU5ZzZk?=
 =?utf-8?B?UDR1cmptMytkeW1GRVczRzVYMEtOSldUa256eFZoZlhzUmxyT2MzcTZGOWRW?=
 =?utf-8?B?VkdTNXBpZVFmTCsxWkY5USttRVNFN3V1SFpKNndINEthTm0wWVhZU1g3NFNX?=
 =?utf-8?B?dHJhcnNlQmFvNU9URndjZS9oWXc0UlBtbEFDbk53R01zNGxDOTI3QitTSC9G?=
 =?utf-8?B?QlA2V0pzZW9pdldWZWR1dXIyWW4xOGJXUnpnYmY0YzJnSlRuMXFDWWQyaW9m?=
 =?utf-8?B?SGJ0MHRYZWh4ek9sM0RxekVSKzJxay9uZmZ0eUhYaS9XZDU3MXNoclpqeGpv?=
 =?utf-8?B?OFh4TGUraXFBQURvQW5CVWdNOG9BNWFadGI4QjJjc1ovQXJ6VFVKNExCUzB5?=
 =?utf-8?B?VFZOQ0pSaU9pNGxFS2VNK014dkt6dEFPV1dIY3pnTWJvVktQVUIxdmVRK3RW?=
 =?utf-8?B?a0hqR2JEMzVtV1o2ajNpdVJjOGxPQWJ4WWg4cGI2MXF4ZEpROTRVSUd0dFNs?=
 =?utf-8?B?bUI2V3plL21LQVdTSDArS1ViU3AvL2EvdW5RQjFjODYreTdLYVJuRjQ4WVQw?=
 =?utf-8?B?NDliZ00zOURGbWl4NzVvY3Jma1Jta0MyS3JvczVaa0kwTDU1NGdmNWp5b0c1?=
 =?utf-8?B?c1ZlVWROSFB4VHp4cHFGYWVSVUNRNVZMcU1Wb01Cb29YTzkrWWtlYmdlRGMx?=
 =?utf-8?B?TzhEU1lYVm1kZDNIY2xqaFgxQTJZdEFieE5aYXZWOU5VdXZ5RDd4VXFUbVJl?=
 =?utf-8?B?c2VDL0JKTlp0a1lVMTlmOFo2eU1uQ1Vsbzc3cEtzTjg4RFdLZnJSOGplZUpU?=
 =?utf-8?B?OTN6SE04NHBTbjEwVEx5SkJFQXQzNEIxU2d4NkFMY2FMSVY5a3ovc3NuQ3BZ?=
 =?utf-8?B?SUlxVEdmRTNkVWx5bVNNL0loRWprY0dIa2NENmdlWmlTUCtZQ01vL0I4bnpY?=
 =?utf-8?B?RFhhSFdudUxFNEtYK2taM2l1NWU2MW5uOFRjRmkxemppdkV2UVJFSGgzSklX?=
 =?utf-8?Q?5AAvTzGHrZAqXSHQilpASQRZT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ED573EA7518654FB78E6B70216C592A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89b430f-4825-4066-47cb-08dbaf1e2a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 21:13:49.3492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3XVyN6afef0m/AB5aJlXQnBTYnQjfZDWxjANQSBTKO2xwZ3I+5hg6bL4WlouLs4dCaq4Au346U6v5c+3TOmo9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR05MB9152
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
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTA3IGF0IDAwOjQ1ICswODAwLCBKdW50b25nIERlbmcgd3JvdGU6DQo+
IFRoZXJlIGFyZSAnZW51bSBkcm1faW9jdGxfZmxhZ3MnIGFuZCAnYm9vbCBkcm1faW9jdGxfZmxh
Z3MoLi4uKScgd2l0aCB0aGUNCj4gc2FtZSBuYW1lLCB3aGljaCBpcyBub3QgYSBwcm9ibGVtIGlu
IEMsIGJ1dCBpdCBjYW4gbGVhZCB0bw0KPiAnV0FSTklORzogRHVwbGljYXRlIEMgZGVjbGFyYXRp
b24nIHdoZW4gZ2VuZXJhdGluZyBkb2N1bWVudGF0aW9uLg0KPiANCj4gQWNjb3JkaW5nIHRvIHRo
ZSBwdXJwb3NlIG9mIHRoZSBmdW5jdGlvbiwgcmVuYW1lICdkcm1faW9jdGxfZmxhZ3MoLi4uKScg
dG8NCj4gJ2RybV9jaGVja19pb2N0bF9mbGFncyguLi4pJyB0byBlbGltaW5hdGUgdGhlIHdhcm5p
bmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdW50b25nIERlbmcgPGp1bnRvbmcuZGVuZ0BvdXRs
b29rLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jwqDCoMKgwqDC
oMKgwqDCoCB8IDYgKysrLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2
LmMgfCAyICstDQo+IMKgaW5jbHVkZS9kcm0vZHJtX2lvY3RsLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAyICstDQo+IMKgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jDQo+IGluZGV4IGYwM2ZmYmFjZmU5Yi4uMzA2
OTlhMGExMGJjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jDQo+IEBAIC05MTEsNyArOTExLDcgQEAg
bG9uZyBkcm1faW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsDQo+IMKgRVhQT1JUX1NZTUJPTChkcm1f
aW9jdGwpOw0KPiDCoA0KPiDCoC8qKg0KPiAtICogZHJtX2lvY3RsX2ZsYWdzIC0gQ2hlY2sgZm9y
IGNvcmUgaW9jdGwgYW5kIHJldHVybiBpb2N0bCBwZXJtaXNzaW9uIGZsYWdzDQo+ICsgKiBkcm1f
Y2hlY2tfaW9jdGxfZmxhZ3MgLSBDaGVjayBmb3IgY29yZSBpb2N0bCBhbmQgcmV0dXJuIGlvY3Rs
IHBlcm1pc3Npb24gZmxhZ3MNCj4gwqAgKiBAbnI6IGlvY3RsIG51bWJlcg0KPiDCoCAqIEBmbGFn
czogd2hlcmUgdG8gcmV0dXJuIHRoZSBpb2N0bCBwZXJtaXNzaW9uIGZsYWdzDQo+IMKgICoNCj4g
QEAgLTkyMiw3ICs5MjIsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9pb2N0bCk7DQo+IMKgICogUmV0
dXJuczoNCj4gwqAgKiBUcnVlIGlmIHRoZSBAbnIgY29ycmVzcG9uZHMgdG8gYSBEUk0gY29yZSBp
b2N0bCBudW1iZXIsIGZhbHNlIG90aGVyd2lzZS4NCj4gwqAgKi8NCj4gLWJvb2wgZHJtX2lvY3Rs
X2ZsYWdzKHVuc2lnbmVkIGludCBuciwgdW5zaWduZWQgaW50ICpmbGFncykNCj4gK2Jvb2wgZHJt
X2NoZWNrX2lvY3RsX2ZsYWdzKHVuc2lnbmVkIGludCBuciwgdW5zaWduZWQgaW50ICpmbGFncykN
Cj4gwqB7DQoNCkNhbiB3ZSBmb2xsb3cgdGhlIG5hbWVzcGFjZV9hY3Rpb24gbmFtaW5nIGNvbnZl
bnRpb24gaGVyZT8gaS5lLg0KZHJtX2lvY3RsX2ZsYWdzX2NoZWNrIGluc3RlYWQuIEkgZmluZCBp
dCBhIGxvdCBlYXNpZXIgdG8gbG9vayB1cC9tZW1vcmlzZSB0aGUgYXBpIGlmDQpuYW1pbmcgaXMg
Y29uc2lzdGVudC4NCg0Keg0K
