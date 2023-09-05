Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6C7926C2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 18:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53BC10E191;
	Tue,  5 Sep 2023 16:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3FA10E191
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 16:33:20 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 385CvSej026731; Tue, 5 Sep 2023 17:32:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=5wSZWrM04OBjRGSdQ1yi93lZudRHKhXhMY5cZs7VBQg=; b=
 wkaLTlEk+4QmNxwCvOoQVpZocNGgBvmyxGeJUIOGv5ux49lH+nYDhbu49cHLmNwI
 broAjuFbLT9nwur/0ZloWzyQzmjH7SlK6ZfJxoDBW/0h5Hq63c0S4fazjJm11wpn
 Z94J9HGAEBaQ7/Gos5jgdXIU0XittO2yUZqQjw5tW4YiU58qbabAz4CV/5CSwEJl
 619adZbDsGEz+CLd4KZ5yXnR+XnUNcTfy3ttrCdgSTn7ttGrlNbE4cXEJfPcSl2S
 tQg5rYHEtbMmEaprxlNhT7qAiYf/aJDAHPippGbAa2UzQJIB9ZCEOEPJCkI6oYKY
 azp8Iog0RR9gQk7hHycqAg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuantgch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Sep 2023 17:32:51 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 5 Sep 2023 17:32:50 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.112)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Tue, 5 Sep 2023 17:32:50 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GN0eKqnEeSOUnrNQp23+Gvpv8T40a3yYMTO40afOAbHEf54PX/ukm+yN5M4r/4uPwsjkHGZbvPVGsvW3jyeYGql/4AvovmB0wBGxSVfJyqhEPXQofnlBXmgEZKb142Z8A5HSY9S/oflhthervTwby3VABL+5xRzv9b1LJmxIaI0gTIFGbLyPv6KckitzWjCq3/h7Uh03mO+WV4OVyOZjjPa7cx3Jsif45tir9rB54vOQDZ3lm9a3SMwsCX/pwMzwZ0KJobtzIjj9W05A695y4DzsWCCEni29zHk0okeH8q7QJnyc5o+ZpGNzSg5idIE0bQE46jUWkzRCV47f6e+Ybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wSZWrM04OBjRGSdQ1yi93lZudRHKhXhMY5cZs7VBQg=;
 b=BhTygxc2DnZQka9/lI1NqcmvsrBi7ZAlyqstVox6P+VV5bPG2MjJXaPouxmfBPtP1CY/q6x0CkZzYIweTUU6LAm34AwUlUsCCTFX7y9ca2+w9aYkavmXTgiwiMXKYeLjPK7mYr5YUNN4j363zUPueprOtATMfeec2AfdeSyyrWxaln0cbcKq6Csnni/wb8G8pvbyGnXDl4bSzO8Hjb81JsCPyFGZCUfMfbGuPzIc2B6Wt0NzBqR9MuiBOOAZTy0DWbFSYVyu0RmfjYfaMaHjcbF1FGj5/uPb1gwFsKolg1jUFhf/Jf9sQQvEIzRq0Mmb4GrIkcc9ih9GJ96FnrxFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wSZWrM04OBjRGSdQ1yi93lZudRHKhXhMY5cZs7VBQg=;
 b=G22OnD+3hOeD6av4cTTtkC/uv8AlIRriBodDr7YToin5oNNkq2mc5ESPTWxjTnQVbltSo0eEWe4errnHSut+q3jyfmIlfcxLsq+DMk1VwNLZBkfjqzyPhH0pWVpWAOUL6Ng8UyjWghEMPxcolCyIBkTUfTr+bNI8se7VziCDvSE=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB5578.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 16:32:49 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::285:7fcc:def4:7ee6]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::285:7fcc:def4:7ee6%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 16:32:49 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 Sarah Walker <Sarah.Walker@imgtec.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Topic: [PATCH v5 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Index: AQHZ0BtUY58mVJiTlkugXma+7tUDfq/vzsIAgBy+PQA=
Date: Tue, 5 Sep 2023 16:32:49 +0000
Message-ID: <fe71399487280a74a8fd05269e9734a3f7a516f6.camel@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-3-sarah.walker@imgtec.com>
 <CACRpkda-XnS-DQE-5WXnTFdycwVnJwffhhR=V27gp8vnxkHTrA@mail.gmail.com>
In-Reply-To: <CACRpkda-XnS-DQE-5WXnTFdycwVnJwffhhR=V27gp8vnxkHTrA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB5578:EE_
x-ms-office365-filtering-correlation-id: ec22db2f-033d-4349-a7dd-08dbae2dbe6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x3Y2v/DKrpEB8jKG5GXtwrGNU+brespXQTFXwb9+lxvJXWmCeKjz6PxRN6R5vpNjcIENMMv0O5ppvzqxM0VrxOtnFA42jXoy88NGdRbrZZH0VW4usDi3TDJmsRRgSBgjNfC170NS1czpERMH5OaDjVOj2gfpsACaOlzlAeetE2tnH3n1VrdjY0bH8S0CAFW26csbpWWagNoeSrO10hTITQo80jz5Qct7AdQEywvn0v5dj/MfwDRDZrzd0i7KnslkZFN7fA5tpIpN/uMW1bHSxCHTun9Uf9l/dxeXwpcAs1sm0lwLivpJ5nPvAWd2sdI2oNzhCtkSA2eFN7+HCjhRkmdAIxGvUaG/IOxXoKr8P+li7TEtUB+xpqdqj9ZpgV+2QyF0tl3i+FvV5mVox1e/KqxiEoIrwMrA+GQIe7fnlzh++IEzIMvOsJ8jXcTWJyzri3Z/WkoktVZsi8iUintfMobkmLpsvzCa7pFPBFYyS50T8jHVZEKTWaRHlnjxV9LzFYwZD6XUoquS36qxFH7BbLP2X2LYZDUGgOIWroTv18KGS8anNftKf1FOFwn9OtBbB4pT2x4SDWzT/RTF0jyulM/x7M16ZBJVlTjNG/mWzMY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(366004)(39850400004)(376002)(451199024)(1800799009)(186009)(66556008)(2906002)(66446008)(36756003)(110136005)(316002)(76116006)(86362001)(66476007)(64756008)(54906003)(66946007)(8936002)(5660300002)(4326008)(8676002)(41300700001)(107886003)(6512007)(2616005)(38070700005)(26005)(83380400001)(38100700002)(7416002)(966005)(478600001)(122000001)(6486002)(53546011)(71200400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkdVME1IWkFXbDZDVGxjM3Z3OWJJMWdvZDFNNHQ0ZWtvMEJ2Nmhxb1l5ZUVU?=
 =?utf-8?B?TE56cU1yMm0vUEY1eEpnWWJ1aWs2eVBvc2dwaXI3OE95SWEySmRMWDF4dkF6?=
 =?utf-8?B?R2VPN3V0NDJDazFXSzUyM0U5YmhKdXFTVVFFZFVTckhiY3lPZzh1MEgzYmJw?=
 =?utf-8?B?WjNTa1JLeEYvL25MUnQwQUJRcUNhaVc4eVdPT2JqM2hqTlJXY1VoWHVGaHNa?=
 =?utf-8?B?dU1ETGhrejIrVmJlRlNWcnpxZDZ3TERLdmxNWkZPcHc4VjdvcGVtUFRsYlRZ?=
 =?utf-8?B?bWxGeFFhZjh3U3ZMazM2WVUzSnc5MldJVUZBUTdnKzRFYjJUeWNOK1lSUi9N?=
 =?utf-8?B?eUtSMStOalU0TVFIdjZmQ2xrZ0R6MEhrSnc1d1pIUFVYU1B0T09qb0lTMUFa?=
 =?utf-8?B?MDErWE0wSUJ5L3lCaEFLa3JFa0tFeUQzb0Z4NWRNUnZnT01SZUhmZzhMbjhr?=
 =?utf-8?B?dWgzc296c3hrcVdESU9NR3JTQW9od3ZwY0laR2JhaEtIL0d6Y3laU2o5VFZy?=
 =?utf-8?B?ZG42RHN6ZUV0UFJHQWhPNStkVW5FOGdaRno2bHNOZGNxcDZ1V29GYkxVcEYr?=
 =?utf-8?B?MDJONSs2Q3VHbndtemJDWEp5a0ZRUUlnUzhiMGNKRmlQZ3Z3cVlRODBIbUJB?=
 =?utf-8?B?cGZOMHdKTkxoYkt0RU1xalBXVFpxWEdKTnFYMXlWV2ZzZE5Ya0ZQdys0MWV3?=
 =?utf-8?B?RHN2SmEvaHRkY1gzMHc0UXNJeWpPdDRENTJ5Z05GREc1eWlZeHd0U2t1WEIz?=
 =?utf-8?B?ZDRwYWlIOGJHeWNHd1NRSWdvZkVKcjViTXhVSGNISHFhR1NsK1FiUG0zOEM0?=
 =?utf-8?B?enNvempQT3luRXkwYlhlKzVielU5ZmZkUlR1NUVwZURWMGU5c1NMdUFYSHFq?=
 =?utf-8?B?RndVQngzYXBSUTlYOVA3a2xMdlo2UnZ3STh3cS9ZUGFCMmpXbFZKcDcyMXBl?=
 =?utf-8?B?dzN1WkFQa1gxd2FnVHVJNFVBRjlaN0RNQUE5ZTg0M1NNWWdjUUZvYVRhZ0Rx?=
 =?utf-8?B?VUo2ekhncmFLT2NxUG1BUWZlbEk2ZnBEYWk4ZGpKaURNWDc0aUtsRTk3MEpa?=
 =?utf-8?B?OGx4ZGRMVEdndklGSzQ0ZFU2WnhmVHkwMC9ySnlZUTRNODRTeHF5RE9HSTJq?=
 =?utf-8?B?WnBsQ0tNVGI1Yk1pZlMyNVJyMnBndGVlNWozVFM3S29oa2RKd0YxTjdjK1g1?=
 =?utf-8?B?bzJSWmlOQWtVMEdHN244YlVqei83U0VreEk2Y3BnNnZkTHdRYVhUREhsYlQx?=
 =?utf-8?B?Q2FzQm90blhFdGw4ellDRnlkbW9tZnZOblZTWFpMZytEUk8vMXhTNTVVZHZU?=
 =?utf-8?B?aU5Bb0g1WDZuL2xTU21HcEsrcm5GSGd1d0FoMjE1NGJRSWRDblRWZUNieitD?=
 =?utf-8?B?NmsyWFRhZkEySk9PZnBNQUE3a2hGQWMxdkJDQVdyVUF6YmJNZFozVXA5WThr?=
 =?utf-8?B?OUpva0xDbXRYalQ0NTJ2MGNHSHNMWjE0UUMrdVdsVFpUNmprR1BsVUk4VkpX?=
 =?utf-8?B?bTVWSFNMOGlYTm85K2UzWVJIbGVzaXliWlZmK1dId3NvZmFhU21QcmNxNFlL?=
 =?utf-8?B?UVhZSFg5ekpVc3A2UnkvOVhDMG1yNUd2K25WNmJ2RmpsTVlpVDRraTJtRloy?=
 =?utf-8?B?dXpveFlOUE0vVnRDZHhMZWR4bi9BOGRXQjcxNmd2QVZsZHNFRGpuODQwdVRY?=
 =?utf-8?B?eTYwMEtWSHlBS2N0ci9pdlVkbkdPcFlJcUs0Rmd5Q1Y5NHhZSG1sWDFWbG1t?=
 =?utf-8?B?VDVQWFkwcFVTZnM1a3haL3VOckl2VGJPMEE3VnpWZHJrVDUzN0doS1d4b1ls?=
 =?utf-8?B?N1hadndsakMwSUIwQ1BVZDQya3k4a2YwRk54OTkyQ08wM2lkZ2NWN1NGTUJI?=
 =?utf-8?B?OEpqQ3MyWkprSDBqclR2ek5XMDdoclI0YklrSGEyRXFGNTFKQWNOQlU1eXpn?=
 =?utf-8?B?VG1HdWNuTllQekZPRkRmMTBhRFB0T21tbmdoSG9HWVVxdVhaaUN5ZWtSREwx?=
 =?utf-8?B?SnJqTFhxaWVkLzdrL2RIMVBxUE4wQ0h3WWl6aFJ5ZTE2REJ5WDBUZnp3bTRa?=
 =?utf-8?B?N3BtTmpNSmo3N3lhaGdnTm5RV3U3SUJIU0FUdHBoZmJ2VXRGNnkyYlJjOVU2?=
 =?utf-8?B?WmJnSElGM1Q0VHRLT1R3SkVyaHZHQnZ4QkNDejg0MGlySTBsSmZVYmxGaklY?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDEA9BF45545C44A893D1DCD465CAF48@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec22db2f-033d-4349-a7dd-08dbae2dbe6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 16:32:49.4413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GLVySzON5T9nhVa4fgP5D0EB5UXiPj4KIFBM+BCdjMmvq1koPTRFqcsKoeucSm2atwUZ0c3Ce7sNRutLemmLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5578
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 42CMJe7sF-5FobBG0C43RckFMfi50Yfp
X-Proofpoint-ORIG-GUID: 42CMJe7sF-5FobBG0C43RckFMfi50Yfp
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>, "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayAoY29tbWVudHMgYmVsb3cp
Lg0KDQpPbiBGcmksIDIwMjMtMDgtMTggYXQgMTE6MzYgKzAyMDAsIExpbnVzIFdhbGxlaWogd3Jv
dGU6DQo+IEhpIFNhcmFoLA0KPiANCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gUGF0
Y2hlcyBhZGRpbmcgZGV2aWNlIHRyZWUgYmluZGluZ3MgbmVlZCB0byBiZSBDQzplZCB0bw0KPiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBhbmQgdGhlIERUIGJpbmRpbmcgbWFpbnRhaW5l
cnMsIEkgaGF2ZSBhZGRlZCBpdCBmb3Igbm93Lg0KDQpUaGFuayB5b3UgLSBpdCBsb29rcyBsaWtl
IHNvbWV0aGluZyB3ZW50IHdyb25nIHdoZW4gdGhlIHBhdGNoIHdhcyBzZW50Lg0KDQo+IA0KPiBP
biBXZWQsIEF1ZyAxNiwgMjAyMyBhdCAxMDoyNuKAr0FNIFNhcmFoIFdhbGtlciA8c2FyYWgud2Fs
a2VyQGltZ3RlYy5jb20+IHdyb3RlOg0KPiANCj4gPiBBZGQgdGhlIGRldmljZSB0cmVlIGJpbmRp
bmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIFNlcmllcyBBWEUgR1BVIHVzZWQgaW4NCj4gPiBUSSBB
TTYyIFNvQ3MuDQo+ID4gDQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBGcmFuayBCaW5ucyA8ZnJhbmsu
YmlubnNAaW1ndGVjLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBCaW5ucyA8ZnJhbmsu
YmlubnNAaW1ndGVjLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXJhaCBXYWxrZXIgPHNhcmFo
LndhbGtlckBpbWd0ZWMuY29tPg0KPiAoLi4uKQ0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNv
bXBhdGlibGU6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBlbnVtOg0KPiA+ICsgICAg
ICAgICAgLSB0aSxhbTYyLWdwdQ0KPiA+ICsgICAgICAtIGNvbnN0OiBpbWcscG93ZXJ2ci1zZXJp
ZXNheGUNCj4gDQo+IFNob3VsZCB0aGVyZSBub3QgYXQgbGVhc3QgYmUgYSBkYXNoIHRoZXJlPw0K
PiANCj4gaW1nLHBvd2VydnItc2VyaWVzLWF4ZT8NCj4gDQo+IEl0IGlzIHNwZWxsZWQgaW4gdHdv
IHdvcmRzIGluIHRoZSBjb21taXQgbWVzc2FnZSwNCj4gU2VyaWVzIEFYRSBub3QgU2VyaWVzQVhF
Pw0KDQpXZSd2ZSBub3cgY2hhbmdlZCB0aGUgc3RyaW5nIHRvIGFkZHJlc3MgeW91ciBlYXJsaWVy
IGZlZWRiYWNrIChzZWUgYmVsb3cpLg0KDQo+IA0KPiBNb3Jlb3ZlciwgaWYgdGhpcyBwZXJ0YWlu
cyB0byB0aGUgQVhFLTEtMTYgYW5kIEFYRS0yLTE2IGl0IGlzIGtpbmQgb2YgYSB3aWxkY2FyZA0K
PiBhbmQgd2UgdXN1YWxseSBkb24ndCBkbyB0aGF0LCBJIHdvdWxkIHVzZSB0aGUgZXhhY3QgdmVy
c2lvbiBpbnN0ZWFkLA0KPiBzdWNoIGFzOg0KPiBjb25zdDogaW1nLHBvd2VydnItYXhlLTEtMTYN
Cj4gYW55IHJlYXNvbiBub3QgdG8gZG8gdGhpcz8NCg0KVGhlIGV4YWN0IEdQVSBtb2RlbC9yZXZp
c2lvbiBpcyBmdWxseSBkaXNjb3ZlcmFibGUgdmlhIGEgcmVnaXN0ZXIuIFdlIHNhdyB0aGUNCnNh
bWUgaXMgYWxzbyB0cnVlIGZvciBNYWxpIEJpZnJvc3QsIHdoZXJlIHRoZXkgaGF2ZSBhIHNpbmds
ZSBzdHJpbmcgY292ZXJpbmcNCm11bHRpcGxlIG1vZGVscyBbMV0sIHNvIHdlIHRvb2sgdGhlIHNh
bWUgYXBwcm9hY2guIFdlJ2xsIGFkZCBhIGNvbW1lbnQgaW4gdjYNCmFsb25nIHRoZSBsaW5lcyBv
ZiB0aGUgb25lIGluIHRoZSBNYWxpIEJpZnJvc3QgYmluZGluZ3MuDQoNCj4gDQo+IEkgYXNrZWQg
YWJvdXQgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZXNlIHN0cmluZ3MgYW5kIHRoZSBwcm9k
dWN0DQo+IGRlc2lnbmF0aW9ucyBlYXJsaWVyIEkgdGhpbmsgOi8NCg0KU29ycnkgYWJvdXQgdGhh
dCwgSSBob25lc3RseSB0aG91Z2h0IHdlJ2QgYWRkcmVzc2VkIHRoYXQgYml0IG9mIGZlZWRiYWNr
IGJ5DQpjaGFuZ2luZyB0aGUgY29tcGF0aWJpbGl0eSBzdHJpbmcsIGJ1dCBjbGVhcmx5IHdlIGhh
ZG4ndCA6KCBUaGFuayB5b3UgZm9yDQpjYXRjaGluZyB0aGlzLg0KDQpXZSd2ZSBub3cgY2hhbmdl
ZCB0aGUgc3RyaW5nIHRvICJpbWcsaW1nLWF4ZSIgdG8gYWxpZ24gd2l0aCB0aGUgbWFya2V0aW5n
IG5hbWUsDQphbG9uZyB3aXRoIHVwZGF0aW5nIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgdmFyaW91
cyBvdGhlciBwbGFjZXMgdG8gcmVmZXIgdG8NClBvd2VyVlIgYW5kIElNRyBHUFVzICh0aGUgRFJN
IGRyaXZlciBzdXBwb3J0aW5nIGJvdGgpLg0KDQpUaGFua3MNCkZyYW5rDQoNClsxXSANCmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGkt
Ymlmcm9zdC55YW1sP2g9djYuNSNuMjkNCg0K
