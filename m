Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023F5E7A91
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 14:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2994C10E552;
	Fri, 23 Sep 2022 12:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428D10E552
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 12:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663935766; x=1695471766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rBEzTUusJqpqVVRKwpStdhDxJ79Q6cOCG2wsvHevOFc=;
 b=jNgir2cSVALurdXk2KVBmtbItyMEezD60lNqqmb+fXeHk7HCcsmYRIlm
 kZBb/LA0+wbHxIRH+BaVGFZfSjZzH9v2FGa9+rN1kISuhzXcwHkU76yu4
 nbDyuVlCcDqLCOTS9e1srApBALeuwT7qjmxEGDsbxSy+RHNkED+wLO6jM
 TwUU9shFSfmUj+vnZlOn1GO686qeUrOr82+VXpy2+yKQ0V9i4TS9IXuVm
 EJlhpsZVc8d9KV4Oz0SEPfV50tOvReve6r40ItNDafkPkGs7M788HzXDO
 iQj+SjxD3H+iyF+/OyTicTh/hJwI6U51Aw8XJzebKiucL8CPl4O3wbzVk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280944922"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="280944922"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 05:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="650937221"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 23 Sep 2022 05:22:45 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 05:22:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 05:22:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 05:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPuFUmYve4QGbXmqdbnHqfD/nBNT3d9dMN79MbCaf22mYVyD5C4a7n+V2lX+jrnIA6MSEiGD2c2co/kEBHyOMlLW3pbCz471QwPtgpNseCfFx4c1oPtygwquLnUzQMExNKkY2L2MtnRo9uZwCb4VJD4k+DRNde+1SbDXKhfs41b2m+CBoOuMAQw8hymVTDxSoFQlsOoFM/AbP22tX35jR+gM1SWG6SJztIt2z6+808/7uwe2cn6uyhmEKHwXsL6RxIs4L8J49XFh8jhXkDv77I2dqfC0MYDijlxu16fU8OOkZ864q0WoH2B7UJ3rxm9hrp2hYk7VQOJsNruIUL8yOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBEzTUusJqpqVVRKwpStdhDxJ79Q6cOCG2wsvHevOFc=;
 b=CSXFu1e8wiQ7lDs0KfLIkPJMjMKlr2IO692/sVkNsKOH9oh8//bllMPPLFQlhdnvkIqGg3sarqw1trDvG6iOmSTO+OMM0teSqaZamkk/iH+BZrsWjRgxFGsCuRIYJXLAyqND5oZ/nUn5HvsxMy0p5Lay6PUFw2bkMlX6hvcR4vB6B7gsMdAEsYuAchdh+I4XtUXxSIcpdh/gYp8LZT1KEzN9VhT42DbMcKdeL8A282jqD1p3hhYYrGli8EpjL2OVAGrsBRD7SvsBua0+Qptl5AIHC7E5qijLlOcUrlBrS5/1M3Qtax64PhIT8bH6I/it3M5LiN9bMmkrZT3HgBngIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 CH0PR11MB5492.namprd11.prod.outlook.com (2603:10b6:610:d7::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.22; Fri, 23 Sep 2022 12:22:42 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::64f9:b9bd:85bb:c756%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 12:22:41 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "javierm@redhat.com"
 <javierm@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
Thread-Topic: [PATCH 2/5] drm/simpledrm: Use drm_atomic_get_new_plane_state()
Thread-Index: AQHYzoStC26UzvqWsk+e88H/KdOWRq3rnNgwgAEI/QCAAErYQA==
Date: Fri, 23 Sep 2022 12:22:41 +0000
Message-ID: <DM5PR11MB132491207BEAD3E6D58B1DFFC1519@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-3-tzimmermann@suse.de>
 <DM5PR11MB1324460C022C2BF66196D4F8C14E9@DM5PR11MB1324.namprd11.prod.outlook.com>
 <e902eb9d-f30f-1121-1e3f-64c154061e5f@suse.de>
In-Reply-To: <e902eb9d-f30f-1121-1e3f-64c154061e5f@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|CH0PR11MB5492:EE_
x-ms-office365-filtering-correlation-id: 2dcc8046-8db3-4a49-7fcf-08da9d5e4fd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JVTMi503ocOAivmpNGdtMMBrRdB4FI01stivKxtQ7p6pNILbfKt+cvWjVfTgnMN+VtBZZF0Nvp8dfvC3s5ooYvi+Uesg632KtplyP+IO7N3ooUrmBuAOSEKperqOl1BEu073ciGtVtAO6+vDi8/2nmRDq7OWCei79Ncg1g5Y9jwjgZXD74mqf7QpZuBkyoj5nEA+AzuBxpFGEq2SeusE8FTxDn2HH3OBT+5akHBr9Tm3/v/EhtkoR1clVXX/5Wa1vZntQVVVknnRa6R2AhaSsy5C1NUcB/LWzCEgPA3ED6nYsFX0ZUNRM0qw6B2WyKw+0fN2oPoxH4SMJG1EuJ9KcsAMYF7TYFtVBWg3XmsyQdUnunv5RIG60it57H7OWh0hXggbxcWuUcuC5GDznKP7LzfIA4UqZyHDqFD7DaPHepblVRUS2pHt08YMGuLthhJbIoErZJZn3IWYAk+4WVKvaj0sbRImfE00+3s/4MUmac5Xwjk9NmpXVRqDieEDfQoZL4bjYWejhwS8iDbI2wtpwe5bzKxPFDrgJHA+TmpDiRRXvDZWy+Jhk/IWtMMage8JjcI6sWQLlNTjX6HXchhuXinZ65Uz0n81yuPa5o90RiLTlaTsDQZhL7qKYzc/0Y12In1GesUzN9gcrwbcLXKzU3xOj8TQCvsmjxGHvIa0kFamIjypsCeoUuMYf8q8iQuh8RY/JgvfBfSkWETn+HO3WeiwizEQJGyekzvNptVaadvPX0WEDqcuYsqvzn0udtT/3le4krCyEUb+tq8OMVxFZChYbocoAf+1S/IqtSzShgM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(38100700002)(122000001)(478600001)(41300700001)(38070700005)(71200400001)(966005)(55016003)(110136005)(53546011)(66446008)(66556008)(7696005)(2906002)(66476007)(82960400001)(26005)(9686003)(8676002)(76116006)(4326008)(316002)(66946007)(8936002)(33656002)(64756008)(5660300002)(52536014)(6506007)(83380400001)(186003)(86362001)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aStzUmZ2bFc3akozNTBnK0JueUcwMHZlSmw5V05zZkg2VmNyTlg4VjVxYjBF?=
 =?utf-8?B?d1RMZHlSSWY0V1V6b1hucW1uNnhhalJFb2VhKzAwd1JCd0doTlV2a3ZoeUdE?=
 =?utf-8?B?dk5mTU1ENU56d2c5NDg3RXI3UlpqNE1ha1c5N3JCSXVCUEVMa3NEQkpoNEpK?=
 =?utf-8?B?Z29CVVdkeHp6YkxYWGZxWDZFVEtpZ0JzdnlxMlB2TzFaeHlqTDNIMGFnN2k3?=
 =?utf-8?B?L1FOa3l1VHlON2labERjQW5JSDhFejFkeS8ybHhJdlV6ZE9kNmxVOWZjWFFQ?=
 =?utf-8?B?UDVrTFhTYXRZRlhPNGdSak0vU3FwbENzVGllbkhwV01pUjlEVDJCcEREQW53?=
 =?utf-8?B?WEZNdW40M2tBVWRaVlRyNHNPa3hGZ0hNMzlORFhtS0hxWGlkODk2RDV0WmJB?=
 =?utf-8?B?WUdaL0pUUnpFYUxpV3NvU0JkV0gzRC8waGxvWW05RXRBMkVZVkg1RzBJcUpo?=
 =?utf-8?B?alNIT2t3SExlS1dOVEhSczRqcHBPRjg2c0syL212SE9HR21GUUpqMmZaajcx?=
 =?utf-8?B?Vm9JUkFSSEhvQjdibXdrMksrNUsyNlVlRkRldkhVRUIwWDhlNWRDVW9CYWtI?=
 =?utf-8?B?Si9MV0FCM3lGdE5sZlNIdHU0V0hjdCtscG9FMG5iWHlVL2RYUHBZUS9JZUYr?=
 =?utf-8?B?LzdJeXBoeDd6YThaZXcyUnhjN0tTUFBnOVJpcXIzSy80R3pQbjlFaURrMzVi?=
 =?utf-8?B?MW1HbENBQ3FXaENkanBleUNmQmFFSFA0L0Y1dDRsUXRCeDd5WVVjbjYweWwz?=
 =?utf-8?B?UEF0T2IxRU5lYnNhSXA3ZkR5VXdCeTNaTXZER0ZGaXlVNGIwU2xraGF3T2Zp?=
 =?utf-8?B?czR6Z1RUL0MvQmo4TG50R3kyc2NQRDdRdGZ5OVN6UkMvQmtqbENuRkZlRHk1?=
 =?utf-8?B?bmNVVVMrZi9qYkhqNm1qaThJMVpqWUVQa0JVWVd4dFQ5ZEFSdzNjVkNpNmZV?=
 =?utf-8?B?T3dHdU9JRVJLTkxsV1NKVzRWa2dHTTcrNS9oTmNGYUlPS1NNb2lYWGZ0RkNh?=
 =?utf-8?B?bmRlT01hK1IzMUc5UFJvYUxWVzhKLzdvb2lYVERVOXNXZGlkVUtCaDJ3Z2NZ?=
 =?utf-8?B?a2RuQXNiRTh1Q3FIdWVjL0gyR3dlZmRTSlBXTDVJMmlDUTlnT2FKQVk4bGVa?=
 =?utf-8?B?aWZrUzFWVk5PLzMydGRnRVQ0UW41WlRZRTM2YStRVmkrT2FKT2NtVnE3RXJJ?=
 =?utf-8?B?R1R0T1VlVEY0WjFadzBRTlhCeUZCL215OUs1L3FINVNMZjBLcmlrSmVFNEZE?=
 =?utf-8?B?N09vRC85d3dXNEdhM2NDMWtPZ3VNQ2lMZ09VKzE5UlhtdThuazViTmxKSDVu?=
 =?utf-8?B?WXF6cjhacmNQQlF4c201aGpvTytyZFlCeEx0T29tYnZ0K1ZkellPT01LZ3I1?=
 =?utf-8?B?VTJVeUx5WXBwTXl4NE1VNXN4RlY2aXI0NmViSXU4ak54anc2aDlEYm9nRjMv?=
 =?utf-8?B?b1c5UllnU0lPRU95dHNmTmI0Z21XdHRvV1o5cFQ0cnM1V1EyTFIzK0xwZmIv?=
 =?utf-8?B?NXp5OW9zektlekU4cnBoQ0ZnZnZzZE1OZG0rR1JjUUJsUW5meEFpaDlYOFQz?=
 =?utf-8?B?ZDRidCtjaHdMc1kxWE8xQkhmMlhUVmRkVFN4OG5YZkhOYW14blh2V2tUS3hN?=
 =?utf-8?B?MW11UEdjZFJ2bTBUaTZDUmF4L2lrMUVNMUxCaGVMOGRIZUVKaVUra3NXNjFL?=
 =?utf-8?B?THF1VlEzRGRtVEN6QlowRi9hTnhVWjRKcW1KNkdtSkRvUHVYR1FIbUJnRHVV?=
 =?utf-8?B?ODdxZzdCWGxoR0Z0Q29vRXpwWUZWamJ0UEFsM28zQ2ZlekxaR1hnV2R1YmRj?=
 =?utf-8?B?cjluQVVGWnh6TzgxNTJOaSthRTI0WTNwTlBDWm5xdGNsbDVWT3VIVG5XSkxJ?=
 =?utf-8?B?WDhIZXlWSUJDWjFya2RHNEN2emZHdEdMSW9RQjA2UXFMUVlzSjBtS1FTOWE2?=
 =?utf-8?B?NXAzRThMWlJvMndYZkxkcEUrNldqczhORWQ4ejFwQm1TODlPSlc0VzBXbFBs?=
 =?utf-8?B?VElRUmlBcWJ4eERtM0hzQnlxQ2t5RzlKclRBSjBpYXdNaXcraGFPQkZyV3Bj?=
 =?utf-8?B?bTB0MnFiN3pNWnVkdlVOeTdHeVlydllIK0VGSEF3WWpOcGRLaWRkS3NYSHJF?=
 =?utf-8?Q?Ir96nh77T74gbCACmMg1KwqBv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcc8046-8db3-4a49-7fcf-08da9d5e4fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 12:22:41.7494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAO8hUHfICZXVGaiHTcQ00F0vDHr/db9QhT6rABaZVLTDWL7szbJE0ZGQjY8tK2hdWr2D4/uRz5kCAryoPMTe2i7G2n9r7ziEfJodX2RjXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5492
X-OriginatorOrg: intel.com
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQo+U2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMjIgMzo1
MyBBTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IGph
dmllcm1AcmVkaGF0LmNvbTsNCj5haXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2gNCj5D
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0gg
Mi81XSBkcm0vc2ltcGxlZHJtOiBVc2UNCj5kcm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUo
KQ0KPg0KPkhpDQo+DQo+QW0gMjIuMDkuMjIgdW0gMTg6MTIgc2NocmllYiBSdWhsLCBNaWNoYWVs
IEo6DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBkcmktZGV2ZWwg
PGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+
Pj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+PiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDIyLCAy
MDIyIDk6MTAgQU0NCj4+PiBUbzogamF2aWVybUByZWRoYXQuY29tOyBhaXJsaWVkQGxpbnV4Lmll
OyBkYW5pZWxAZmZ3bGwuY2gNCj4+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+OyBkcmktDQo+Pj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gU3Vi
amVjdDogW1BBVENIIDIvNV0gZHJtL3NpbXBsZWRybTogVXNlDQo+Pj4gZHJtX2F0b21pY19nZXRf
bmV3X3BsYW5lX3N0YXRlKCkNCj4+Pg0KPj4+IExvb2t1cCB0aGUgcGxhbmUncyBzdGF0ZSBpbiBh
dG9taWNfdXBkYXRlIHdpdGggdGhlIGhlbHBlcg0KPj4+IGRybV9hdG9taWNfZ2V0X25ld19wbGFu
ZV9zdGF0ZSgpLiBBbHNvIHJlbmFtZSB0aGUgaGVscGVycycNCj4+PiBzdGF0ZSBhcmd1bWVudHMu
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+IC0tLQ0KPj4+IGRyaXZlcnMvZ3B1
L2RybS90aW55L3NpbXBsZWRybS5jIHwgOCArKysrLS0tLQ0KPj4+IDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90aW55
L3NpbXBsZWRybS5jDQo+Pj4gaW5kZXggNTFkMDFlMzRkNWViLi4xNDc4MmE1MGY4MTYgMTAwNjQ0
DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4+IEBAIC00NzAsMTAgKzQ3MCwxMCBA
QCBzdGF0aWMgY29uc3QgdWludDY0X3QNCj4+PiBzaW1wbGVkcm1fcHJpbWFyeV9wbGFuZV9mb3Jt
YXRfbW9kaWZpZXJzW10gPSB7DQo+Pj4gfTsNCj4+Pg0KPj4+IHN0YXRpYyB2b2lkIHNpbXBsZWRy
bV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlKHN0cnVjdA0KPj4+IGRybV9wbGFu
ZSAqcGxhbmUsDQo+Pj4gLQkJCQkJCQkgc3RydWN0DQo+Pj4gZHJtX2F0b21pY19zdGF0ZSAqb2xk
X3N0YXRlKQ0KPj4+ICsJCQkJCQkJIHN0cnVjdA0KPj4+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRl
KQ0KPj4+IHsNCj4+PiAtCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlID0gcGxh
bmUtPnN0YXRlOw0KPj4+IC0Jc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRl
ID0NCj5kcm1fYXRvbWljX2dldF9vbGRfcGxhbmVfc3RhdGUob2xkX3N0YXRlLCBwbGFuZSk7DQo+
Pj4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSA9DQo+ZHJtX2F0b21pY19n
ZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+Pg0KPj4gR29pbmcgZnJvbSBwbGFu
ZS0+c3RhdGUgdG8gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlIHNlZW1zIGxpa2UgYQ0K
PnNsaWdodCBmdW5jdGlvbiBjaGFuZ2UuDQo+Pg0KPj4gSWYgdGhpcyBpcyB0aGUgZXF1aXZhbGVu
dCBhbmQgdGhlICJyaWdodCIgd2F5IHRvIGRvIHRoaXMsIHNob3VsZCB0aGUgLT5zdGF0ZQ0KPnBh
cnQgb2YgdGhlIGRhdGENCj4+IHN0cnVjdHVyZSBiZSBwcnVuZWQ/DQo+DQo+VGhlIHBsYW5lLT5z
dGF0ZSBmaWVsZCBpcyBzdGlsbCByZWxldmFudC4gSSByZWNlbnRseSBsZWFybmVkIHRoYXQgdGhl
DQo+c3RhdGUtbG9va3VwIGhlbHBlcnMgYXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQgaW4gYWxsIGF0
b21pY19jaGVjay9jb21taXQNCj5mdW5jdGlvbnMuIFZpbGxlIGdhdmUgYSBkZXNjcmlwdGlvbiBo
ZXJlOg0KPg0KPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9ZeDlwaWo0TG1G
SHJxODFWQGludGVsLmNvbS8NCj4NCj4+DQo+PiBUaGUgY29tbWVudCBmb3IgZHJtX2F0b21pY19n
ZXRfbmV3X3BsYW5lX3N0YXRlIGFsc28gc2F5cyB0aGF0IGl0IGNhbg0KPnJldHVybiBOVUxMLg0K
Pj4NCj4+IHdvdWxkIHBsYW5lLT5zdGF0ZSBiZSBOVUxMIGluIHRoaXMgY2FzZT8NCj4NCj5JIGRv
bid0IHRoaW5rIHNvLiBJbiBhdG9taWNfdXBkYXRlLCB3ZSBrbm93IHRoYXQgd2UncmUgc3VwcG9z
ZWQgdG8NCj5jaGFuZ2UgdGhlIHBsYW5lLiBUaGF0IHJlcXVpcmVzIHRoZSBzdGF0ZS4gTWF5YmUg
aXQncyBkaWZmZXJlbnQgaW4gdGhlDQo+cGxhbmUncyBhdG9taWNfZGlzYWJsZSBoZWxwZXIsIHdl
IGRvbid0IGFjY2VzcyB0aGUgc3RhdGUgdGhlcmUuDQoNCk9rLCB0aGF0IG1ha2VzIHNlbnNlLg0K
DQpJZiB5b3UgbmVlZCBpdDoNCg0KUmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFl
bC5qLnJ1aGxAaW50ZWwuY29tPg0KDQpNDQoNCg0KPkJlc3QgcmVnYXJkcw0KPlRob21hcw0KPg0K
Pj4NCj4+IFRoYW5rcywNCj4+DQo+PiBNDQo+Pg0KPj4+ICsJc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqb2xkX3BsYW5lX3N0YXRlID0NCj5kcm1fYXRvbWljX2dldF9vbGRfcGxhbmVfc3RhdGUoc3Rh
dGUsIHBsYW5lKTsNCj4+PiAJc3RydWN0IGRybV9zaGFkb3dfcGxhbmVfc3RhdGUgKnNoYWRvd19w
bGFuZV9zdGF0ZSA9DQo+dG9fZHJtX3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZV9zdGF0ZSk7DQo+
Pj4gCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmZiOw0KPj4+IAlz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGxhbmUtPmRldjsNCj4+PiBAQCAtNTAzLDcgKzUwMyw3
IEBAIHN0YXRpYyB2b2lkDQo+Pj4gc2ltcGxlZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21p
Y191cGRhdGUoc3RydWN0IGRybV9wbGFuZQ0KPipwbGFuZQ0KPj4+IH0NCj4+Pg0KPj4+IHN0YXRp
YyB2b2lkIHNpbXBsZWRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfZGlzYWJsZShzdHJ1
Y3QNCj4+PiBkcm1fcGxhbmUgKnBsYW5lLA0KPj4+IC0JCQkJCQkJICBzdHJ1Y3QNCj4+PiBkcm1f
YXRvbWljX3N0YXRlICpvbGRfc3RhdGUpDQo+Pj4gKwkJCQkJCQkgIHN0cnVjdA0KPj4+IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlKQ0KPj4+IHsNCj4+PiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9
IHBsYW5lLT5kZXY7DQo+Pj4gCXN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2ID0gc2ltcGxl
ZHJtX2RldmljZV9vZl9kZXYoZGV2KTsNCj4+PiAtLQ0KPj4+IDIuMzcuMw0KPj4NCj4NCj4tLQ0K
PlRob21hcyBaaW1tZXJtYW5uDQo+R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPlNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KPihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj5HZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=
