Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D1674A152
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB0410E033;
	Thu,  6 Jul 2023 15:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9C010E033
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:45:56 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3668moGT005401; Thu, 6 Jul 2023 16:45:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=N8f/aQKB8+497pyVgB+T7ci2teqbRKd4a3QMu+7nq1Q=; b=
 BLSLfHI8ZEvWhgdaWeBzveNtu1v2Sy8YHlSzLRn/UntLLCsLHF3VuYbaxUmy4ge8
 BzvTgEGPRPecDOtNorhss4LoEFi0XpiNtvu8MHMbG+X2z7OL+/y3A35KkVeYHeMA
 3/mz7KHwNZgXJZ/2pQ3bwAOSK2HhScchz2EQ36uyh0RF3VbmzETJhek8mqlm+pb2
 P1kp1C+akSONRekbuyU6XHIYDH7n9Y578NjvxZw4uE2zCCpWkdyd0RXQkLbWrxk+
 zT6jCji0aN5SVBLCSsfcv4oWA1JLLG1SC470OPcFEYK0PRe4MK8ACHt8QeGmF/cX
 vurNlpm5fSmxYJ6JNELRbA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rjadqm42v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 06 Jul 2023 16:45:08 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 16:45:07 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 6 Jul 2023 16:45:07 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBxoof1M7fVQwQfopJbJjK06lOb3yoNxUuQaU0hkXMRJBSi/TS4UxHa7Qdw6rHg8JCp8F7V6fjxZOVDpRJadR2TYepyRCYP8bGXnWQywupg9IIYiZCmfZEoM+77NT58T2K3reztd96BDYsAdNt39smEfBhRq2aoUXBrxTZDqtRTx6TozgKiazNTO6Dq8YeLQG+YhKOE6XSwrzLVgD9N01zgDTELaTLOiEYl4swLnaC7hvWDxPxoLsRz4lG3Eq5pr/CRzPY8BZQ3aPqHq/N8V8Cv+aH3Ur7K0GLJXqp7FQhmRn0sAICff+txtKTzNB0fQqICsihAmLz0/ZewOk/zGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8f/aQKB8+497pyVgB+T7ci2teqbRKd4a3QMu+7nq1Q=;
 b=LId0wupFBKANyNP3uTzAcqT754yWk2eMm9DWz8yakw2TALwc+weI9k14Q8HrPRuBZ0Wdu0mB3pNivPZq1QyD1XrgTxLr+2a20rRS8w29r5K4u4IMGhthiU1JOyK1wIMVzxsLr4uOzWzRPeWNB107pStXDQt7JWFwwbCHW0CDg/7QSxYIaykM+Cn3hVCsRnQKfXmi3/5fG1uku7Le4qVFJlkO0Yp+VgQjRKUQtmoiLLFNKlSCq+BXaeGtxpzYm2vBIl9jbTF5lEzpqd1yBWQyKjxgdc3XFmDYI/W+v71HE1rid9nf6lbHOezjoP/zYqLdENNEP+iK/jUxeo+icxa0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8f/aQKB8+497pyVgB+T7ci2teqbRKd4a3QMu+7nq1Q=;
 b=FUPmXuKwV8pZZXyjWogpg7FDRKwkGuFT4/g5miw3H8eIzJ9DJwyl9mSvwQDA/zPSw+IPT/k/YQEcoMew67h2qtfFVx9I2E3D1mN/FSdBzn3aoriOYR/sNEj24nJdzAGSMa2/4mqB4Go1zgYGxVWibJ4YkE3RPKdTJzNwok9V1t4=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWXP265MB5650.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:159::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 15:45:05 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4694:a4a9:5649:14eb]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4694:a4a9:5649:14eb%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 15:45:05 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "jason@jlekstrand.net"
 <jason@jlekstrand.net>, "willy@infradead.org" <willy@infradead.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "boris.brezillon@collabora.com"
 <boris.brezillon@collabora.com>, "Liam.Howlett@oracle.com"
 <Liam.Howlett@oracle.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Thread-Topic: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Thread-Index: AQHZsCDVszc+u6AXYEi0dgSKg2mf4A==
Date: Thu, 6 Jul 2023 15:45:05 +0000
Message-ID: <8d01cb3add315277c86cf4b28d6901fed1977448.camel@imgtec.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
In-Reply-To: <20230629222651.3196-3-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWXP265MB5650:EE_
x-ms-office365-filtering-correlation-id: 6fba4e03-a841-4e00-64ab-08db7e37f839
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8wVAtJZ4XnWG/shEniPLEoBbescBXfempfylRjOsLwWYTvN7sPTzPeEQozNMwaAeAtT/DwirS1B9NOu6FSTVdoMKhFhH29Q/ETLTa4qaSvZ8UWCTdCfv/pTkt+//EVzR3VuQrINEa0CB5O81fgIAIwXW+C//XrLDqIRBdc5JyU6jnpZAJ+vZmdZtwVm0hpDQpntTJLxm6MErXZQ6bvX2fGHa2zCMeJlen/b9Ct5QCc2OoOfXbxoyaqXoGtQSycUryReph8uSyhM3Ohc5v3eXruoysUl0GKvqyOXT05y49fwNbHaGnp8vQUqnQ9V0rtu7T+1IlljBT+v/YDOkWSwkusM3iLHXn51NI/pDJYyKAZmamNzgoiRCDxX2I+/GlR6dzgdvowbDSeJPywrlA09g2nXRBsIOFC/F8LDoTM5DM6aOYJUhDOzXNaUG9LFbCVGgYNjstIM00faKUPmXiw3IbwSLfoykP2DFvP6/OSwGm0XAMYjR1g3uKrIYakCNtDTTAZ3pI5QE5uMhdVeP5/07eTpW+GX5Hesr5gfCN/SP/vFiYEzGZYG/+6GJ0xeOUOx9vUihxZqjPhpvj6ZtoK0NBS8UkIWhQ3yoG5gX2mznC17abBwN16myf+u6Gvb0Z1gD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39850400004)(366004)(346002)(136003)(396003)(451199021)(54906003)(5660300002)(8936002)(8676002)(41300700001)(316002)(2906002)(83380400001)(7416002)(122000001)(921005)(76116006)(2616005)(4326008)(66946007)(66556008)(91956017)(38100700002)(64756008)(66476007)(66446008)(478600001)(86362001)(186003)(26005)(110136005)(6506007)(36756003)(6486002)(38070700005)(6512007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGVZc290NXVoUU5kTG5xUVpQSmtCTmdJbVJTWnpRbTY0cmVVTTl0NzJDNnlz?=
 =?utf-8?B?STlUdW9rdlNtUExXV25pT0lYZ3FmUGVGQXFZK1BDc0M2SEdwWVZleGFSajhL?=
 =?utf-8?B?S1pXSVBUOWhqQm1kL1ZqcEg5WWtXZzB3ZW1XWXF5dmpWNFhqUjE1SzNaS0I0?=
 =?utf-8?B?WXNEUGpRclpTZkdUMlV4SW1KcnhWNW5hWGFPaFRWSnZKOSt3Rkwrc3J2NEMr?=
 =?utf-8?B?SldmcmxyUyttRThQQ3NEbkFZODZnTVF1T0FmZ0Nockp3alA1YTFRS2ZxK3Fu?=
 =?utf-8?B?WWlwUVFCQ2VibEt1U2c4QjM0YVJ4cUlJbXd0K0hQUGhZOHI0NlNXWGZuSmp4?=
 =?utf-8?B?cVlWSzVoOHZiOWxucDJEWjRpNWZBeVZUNzF4ODV0dGJKOGViWjk0L1lneDls?=
 =?utf-8?B?SEh6OURuQzBqOGhCbEt3TFVGUVNobHhLL2pVc3NWalZ5czRCd3ZqSWYvNHFp?=
 =?utf-8?B?b0Y0RWJkb2IyWUFsZFdObUVwcW5yUkg4NUN1aWppMGNmOEhlcHNlMzZleXNK?=
 =?utf-8?B?R3JsbmtOR2pZT2FFdVJUODZNbFYwblJoalU2MVowc0c5NU53MUVrOG5pVmIv?=
 =?utf-8?B?OUNyRUhpeVk2dzNRQWg1SW1UdFUwWHJubnk0TGlPYlc5cW1LUEdneDRZRHNa?=
 =?utf-8?B?K1QrZjYxSXVwQ1RHNXBNMjF2LytFL0VWaTMzWGgzMjVpRUQvemR6VVZ3cU9X?=
 =?utf-8?B?STVic09JVDlzS21Nd1hqSHJudFRIRjZvcXVuN1FmTjRzY3dnUEQrQm1RSVlV?=
 =?utf-8?B?NHkvSndYczZ2SDFYTVoralpyVFdUaG12b0NiSkdpYzZqVGhqaWJLZmxHb1py?=
 =?utf-8?B?dUJyVmdDMElnVm1SMnFCZ00xbkdmOXQ4a1g3L2N1R0VqOEhGcExpWHpKK1Zn?=
 =?utf-8?B?SGx3M2ltWG5mNFpnaVdIKzgzdjU1UlhaWlp5eUkvcUV6L2FTMUtJeGNsMktZ?=
 =?utf-8?B?cWw3MVBmWHRadkJlVkYrOEtXaWdCcnU1MXdkNTRnRmJCdVp3Ym45RkUwNzRk?=
 =?utf-8?B?WklTeVhncWo1T0w2a1NxMWp2bUxVVXViQlNWVU1MN0l0aEMremp5TldLczlr?=
 =?utf-8?B?TnVsV25sVklEeGFObG5qVzYyVmlNY1VkMmFOTDErU1BrZmUzZjc5bTROREtF?=
 =?utf-8?B?NzhrQmNDTnhjVW1Fa2pycHh1azQ5L2M1OHhRbldKbnU3WE1LdEZ3ZWc5WHlT?=
 =?utf-8?B?azdBOHNtOTF5bHpYYnJ5aDArUlVTOVl2L1pvZHQvZVNJcXZQbTgybnV6aFh0?=
 =?utf-8?B?TStmKzdzN01VT0JnSmFoYThEbDdhU1RlYXNPV0g4dldZV0lwVDBKREhULy9M?=
 =?utf-8?B?cldiT2pia29vbVVuUU1lQm5Panp2R3FwY1pNRnM2dURETTlsOWVuNGU3cldo?=
 =?utf-8?B?ZGJveTQ1clh0bGVaSyt3Smgvc1d6MlVHR3U5UitvaFdLYzBJVThMSFE2VlEv?=
 =?utf-8?B?dWtpZEF1cU1xc29HTHhYeUROL3NjWm9yb1NkZVJrMEZ4a0lKbFFkeEpKc1pG?=
 =?utf-8?B?SUliYlJ4TS9JWTVHOWVkSitWMjZsVVo0aGZLTDBIUWFES1JybHgrTG1MT1I4?=
 =?utf-8?B?eEhrODBSRmRNeU9sLzQ0UFZIb0NJSDgwNjFUKzdQV0RzNU9NREY4eEVSM255?=
 =?utf-8?B?Q2ZlZkE1TFd2NWNtVlBHZVpwL2JITVVQRGc0QjZKRzNXL2F5OFhXb212N2FT?=
 =?utf-8?B?b2FsbTNTVWVSK0x6R0hWaWlCZW9NOTFMa0llU0dKbUg0WGpqVzFxZTMxeXUx?=
 =?utf-8?B?VUlBUEcvNmhUekp6NzhVNC91OFNDSHd6TEhJaTFobEJiOEpDellXNzg0SW5o?=
 =?utf-8?B?VG1Ka1dYaStxUnI2SVRtd2FlVHI2dzJtcXdNek9CelA1cnBuN2FoaEhQS0Ur?=
 =?utf-8?B?MXk1U0YwNkV1S3lQYTFHUktDRXhodERuZ25TM1BmSUxVN1VPRkFQclZUZTFT?=
 =?utf-8?B?djRyWE1NbXgwRjk5RzhkYmhFZmprRTRwUWR6TlQvYmROaFYvaFY4SXlSUEZ0?=
 =?utf-8?B?L1hPRG5wZlJyL3ZkUFgzOEtnMVYzT1EzcHdvYlNjNzc4a3IvOFB0bU9YU2ll?=
 =?utf-8?B?dm5nd0dJU1c0blZaeEtMRHJrWEtJaVJOd0Vxbnh2WDhacENRQTJTaTFnVlY1?=
 =?utf-8?B?RlZMN0FyTGVHaVBnVnBpdjNTUG1BQVU4V29yRWJuNzR6b1hzbk01NGhURTk0?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44FCC495D5E8F2499AF1C33EDBDA5C86@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fba4e03-a841-4e00-64ab-08db7e37f839
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 15:45:05.5597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UoMDqqbDpDehv1T0bCOcy9HoxHxU1a/3iodj/UV1UvmlyySdfYreQYLqZ+ouOH2roMzNwbPHSxv/LwbMpWir2Av3jT/5wgsjgiZxla3GyOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5650
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Tt50dFvZAKIj1sP-Nm-zF4LTJHHMSvX9
X-Proofpoint-GUID: Tt50dFvZAKIj1sP-Nm-zF4LTJHHMSvX9
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA2LTMwIGF0IDAwOjI1ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiANCj4gKyNpZmRlZiBDT05GSUdfTE9DS0RFUA0KPiArdHlwZWRlZiBzdHJ1Y3QgbG9ja2Rl
cF9tYXAgKmxvY2tkZXBfbWFwX3A7DQo+ICsjZGVmaW5lIGRybV9ncHV2YV9tYW5hZ2VyX2V4dF9h
c3NlcnRfaGVsZChtZ3IpCQlcDQo+ICsJbG9ja2RlcF9hc3NlcnQobG9ja19pc19oZWxkKChtZ3Ip
LT5leHRfbG9jaykgIT0gTE9DS19TVEFURV9OT1RfSEVMRCkNCj4gKy8qKg0KPiArICogZHJtX2dw
dXZhX21hbmFnZXJfc2V0X2V4dF9sb2NrIC0gc2V0IHRoZSBleHRlcm5hbCBsb2NrIGFjY29yZGlu
ZyB0bw0KPiArICogQERSTV9HUFVWQV9NQU5BR0VSX0xPQ0tfRVhURVJODQo+ICsgKiBAbWdyOiB0
aGUgJmRybV9ncHV2YV9tYW5hZ2VyIHRvIHNldCB0aGUgbG9jayBmb3INCj4gKyAqIEBsb2NrOiB0
aGUgbG9jayB0byBzZXQNCj4gKyAqDQo+ICsgKiBJZiBARFJNX0dQVVZBX01BTkFHRVJfTE9DS19F
WFRFUk4gaXMgc2V0LCBkcml2ZXJzIG5lZWQgdG8gY2FsbCB0aGlzIGZ1bmN0aW9uDQo+ICsgKiB0
byBwcm92aWRlIHRoZSBsb2NrIHVzZWQgdG8gbG9jayBsaW5raW5nIGFuZCB1bmxpbmtpbmcgb2Yg
JmRybV9ncHV2YXMgdG8gdGhlDQo+ICsgKiAmZHJtX2dlbV9vYmplY3RzIEdQVVZBIGxpc3QuDQo+
ICsgKi8NCj4gKyNkZWZpbmUgZHJtX2dwdXZhX21hbmFnZXJfc2V0X2V4dF9sb2NrKG1nciwgbG9j
aykJXA0KPiArCShtZ3IpLT5leHRfbG9jayA9ICYobG9jayktPmRlcF9tYXANCj4gKyNlbHNlDQo+
ICt0eXBlZGVmIHN0cnVjdCB7IC8qIG5vdGhpbmcgKi8gfSBsb2NrZGVwX21hcF9wOw0KDQpsb2Nr
ZGVwX21hcF9wIGNvbmZsaWN0cyB3aXRoIGFuIGlkZW50aWNhbCB0eXBlZGVmIGluIG1hcGxlX3Ry
ZWUuaCB3aGVuIENPTkZJR19MT0NLREVQIGlzDQpub3Qgc2V0IChpdCdzIGJlaW5nIHB1bGxlZCBp
biBieSBtbS5oIGluIGRybV92bWFfbWFuYWdlci5oKS4gSSdsbCBqdXN0IGNvbW1lbnQgdGhlIGxp
bmUNCm91dCBmb3Igbm93Lg0KDQo+ICsjZGVmaW5lIGRybV9ncHV2YV9tYW5hZ2VyX2V4dF9hc3Nl
cnRfaGVsZChtZ3IpCQlkbyB7ICh2b2lkKShtZ3IpOyB9IHdoaWxlICgwKQ0KPiArI2RlZmluZSBk
cm1fZ3B1dmFfbWFuYWdlcl9zZXRfZXh0X2xvY2sobWdyLCBsb2NrKQlkbyB7IH0gd2hpbGUgKDAp
DQo+ICsjZW5kaWYNCj4gKw0K
