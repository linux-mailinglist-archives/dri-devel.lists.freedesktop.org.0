Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE07D1723
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 22:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A024310E075;
	Fri, 20 Oct 2023 20:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE610E075;
 Fri, 20 Oct 2023 20:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697834260; x=1729370260;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5yuPYE0A4u7aBh4KxKMc8G+g+Ogcj87SxdRh8L1U94c=;
 b=m2YF3fMe3Fl6E8jwLiwfyUpVfisU1s0M2cWBPTIFAbTqL/ihpRnBD9IY
 ZLYbRnm/bbA0K3AGB4rSopLjvSL5zFK76gdYYR8Oijys3F76YCtHAyXkh
 FZQxbuzKNPwtuZNGhIAne0Fwit1sD9zioiSgLeyTISeLBXW2KafkIWtIY
 gahNr+9u3elTRTpd/c3SDn8+77caRBDYD8dWPAhdbI/8I2wB3jiYqMCIv
 xvGbReFWPS6HQhgI1wfT4vhuP/tXfnagXc8cC8T32+AINFxkiAjSyE1+S
 BYXTt+YstdI5z8Yz8Xko8VEsWImWiGqJxgIsfoTjjWuVFZPpvhdOFpJsK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376945550"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="376945550"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 13:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="734071529"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="734071529"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 13:37:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:37:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 13:37:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 13:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USswUM58MR+tF7Pg+O9Mb/rpXihzejx6QD2EREPH4TX0BEt91e2FOmhS+I1EmTJc8/HJmlGfb2SJyCd7QisYEoeUOOgxdFmA0ZpdJFLJrUeWztQ3sDcSiKuYdBckqleGgIBJbl8ihuLKas2WH+erfGCQXTutQrAqT7zNyhhyJcvImPulk55rYrz/Nt+aqD1UNDZxrNo3kST1evGib8ENojEkAOz24XeBRQl9qpbcLTBn83MmuedQBprwAGzmORyA7WzfARFi/3c0qwhTuYW6UMnz/5UiBZDuIjght05o8nho3Gi7QY8j15uahL3tCbSO2Y2LecGcPL4VZftMNBnRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yuPYE0A4u7aBh4KxKMc8G+g+Ogcj87SxdRh8L1U94c=;
 b=j2FqwbncpkTFf+xWRLQxbC3HNYGiQWW8tatitOcLfBExYNhFkWs6o3P8NEzcr+9oJBcI+XA8hFnodWS3lK1JzsDMRc+wijQquPw3ss54Ps3BailtU9VRzFgNi46lJPeeRU4C8Dd9p7sEoc72rcGPQvzbrNA/Hiqzggh5U3DeoLCxoUUfSdYIxwd4NK6Wpe66EsFziC3g6dnyqC7SRh9WFd/PuMcZvMMbfREwJ0+2+JrUd5hTS1ytqbQax2BLBV2RK8GLOUXV1uV1Awb2qjjNhWP5Hj/8qd1+OxM6rc31JAGKBeZ04Wa0kcs+2w1NzhAPWa7Fctpmq9K6jZEfslbhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 20:37:36 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 20:37:36 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "Tayar, Tomer (Habana)"
 <ttayar@habana.ai>, "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>, "Luben.Tuikov@amd.com"
 <Luben.Tuikov@amd.com>
Subject: RE: [RFC v2 2/5] drm/xe/RAS: Register netlink capability
Thread-Topic: [RFC v2 2/5] drm/xe/RAS: Register netlink capability
Thread-Index: AQHaA232M/zZ4YzKxUuCjlNUjlyd8rBTI3rw
Date: Fri, 20 Oct 2023 20:37:36 +0000
Message-ID: <IA1PR11MB64187A19882489A2166D6FC6C1DBA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-3-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231020155835.1295524-3-aravind.iddamsetty@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA0PR11MB4621:EE_
x-ms-office365-filtering-correlation-id: bd85a3d2-2d0f-4b51-8e76-08dbd1ac6563
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9JWLgaF77szFCSpwSUNVHyW26/2MVJNqu5RlAKaui+XdtzDaRKVGjivBDAxK/n5W+wkxUv3dsjLbk4RSSphmkIHyEAEN4l4aReXa5GXJVt0mEcCerh4nBEwhvwCMBiixuaIyPCQS4i0/665ixDD21TuUUlfMfu8OZno/lrDhyziFflQiTU8+CnzvnpSQcqqHdDEx/eGCfyFM7s9Q8ORzE6ndeI6KZoMWGv2nW89iW3XyhBKxpvHfsKPxZJ58MQ7+9bsWKJ/zzYiqHhG82MyzZ2VjCwxnwpq7C7tXCLUTi5USs7e9eIlWu7O4gICI4UiLtshhg1vSpCkSGT2hVcUAKl90SKXXdXgvi3jTHJv5o1Qrs1tE3sLBvAvT0BnyXfc8oJSJuj/m7VKKdxZ+O8elRjEtc+3EdNuOHlplQmh4VGeaADb+tBE+wlIzSL80OTexp3LzeQBqfQwopE1Qfvb/YOS+aSMLlMUf/4IQ9fckt7iwuKSn50NPChSP8msfVRu4pyGgYBgabNmwTVnc0aFli5U6QD/OBmVW/b5Uj3lEUaLnH/4HJvRpPi92UxBATWIGKETeFOW5H9kFEP5GgUBdgF+RMQmLszEZdraaCP7i4q5XR2xjiWU0MCVQ64dxmzUtPEgSlOPmStmRmHnuOxCQUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(55016003)(38070700009)(478600001)(7416002)(76116006)(8936002)(5660300002)(8676002)(66899024)(52536014)(38100700002)(41300700001)(316002)(66476007)(66946007)(66446008)(110136005)(33656002)(86362001)(71200400001)(9686003)(66556008)(6506007)(7696005)(82960400001)(26005)(64756008)(83380400001)(921008)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1pmWm85ZC93WWJVdGxlVmtRWjA1NjlUelNrOU5mbDM4dHJyaHdpYTN4UmxV?=
 =?utf-8?B?SzU5WmVlaDQzZDc5ZVIwaTRkazZsczlGK0VUa0tVKzBSeDkwalhreHdNRFl2?=
 =?utf-8?B?S0JzV1pWVzhJVXBDU2NxTVJpclNGRXR2MjF2ZG5JRDZxK2dhNENwZTVXTmJ0?=
 =?utf-8?B?dFBKNHdERVR2Z3FUNWlFWnFVVzRHY0c4dWJDZGZXdXRjTVRuV2tZckZVMERu?=
 =?utf-8?B?VjViYUpoS3owMnN2NXdFeld4WC9GRllWSVhmcjRyTkN1bjkzZzdscDRMbHlQ?=
 =?utf-8?B?L01hOU9IMXhtcUJDYTVaWVhDbSs1R2F2a1poc2xWa2dTM3NwbnhqVTEzQmJL?=
 =?utf-8?B?L3cxaWxlbUVPMVd3R2VMcS8vc3plcGVKZng4eHJqVmRRekRHTktDQW9CQVgw?=
 =?utf-8?B?bnpRNXZGMmlrbEhJL1NRaFd2RnRiTXJqZ05DVjZKN2d1RDFYNThCWXZLQStt?=
 =?utf-8?B?WkoraFU1NS85OHhCd0Q4VGtRQlYzc1dnSElGTUVTSWljeXJhbi9RWnBrNzE3?=
 =?utf-8?B?ZXdtRU8xWUhleThoMzdZNzU4c2R3V0JYOHNSOUNPSkRCSTdzUGtVUk15VldK?=
 =?utf-8?B?OWJlSGU0QzNCZWZjM0JBR0daemt2MEtXb1RaRDRmcUdDekowbXdKVnd3V0ZH?=
 =?utf-8?B?MGpsRTllZFNWT3pMZ1RjL042SkliZHJXNUU2S1ZnK0dTU2JGOTBCN1RuN1Qy?=
 =?utf-8?B?cEEySGZYbTlWQXl6L3ZkaEMrTTBxTllyREF6MURTSStZdEszcTBjZ21maTVL?=
 =?utf-8?B?QTdWWDl2anF5WkVEaUFyWlVIRWZMaFJQUjZ3eHc5Yll0RTk0d0ozaXBlV3gz?=
 =?utf-8?B?ODVSWEY5ZnZwdWNyM0RsWEI0VHJTUUpIV0JrWlJzMmhrMzNyTnovLzQ2bGlx?=
 =?utf-8?B?UE5jQktyQ29MMUo0QzNPUUZkZy9QY3hhN3YzZVFycmJHL3RkV08xdTRieVMr?=
 =?utf-8?B?YkxMMGV5MnY2V1ZxWEJDcFhaSU02a05jWjlES29DamJBTUpUek9SRG9VTnRD?=
 =?utf-8?B?S1BLa3JUSksxYnhwVDBsWllVVWxlR1k2WnlPQnBCa1daZVovTVp0bS9kNlhV?=
 =?utf-8?B?aDZnbGdGc3ZPcGVVcmN2Wlhpb21mS0toYkhnbm9neXpSL0NMa3RWYVlxM2tK?=
 =?utf-8?B?Z1lIelJqRDZLM241bTc2VURQQ2dtRWFIY25DUC9KZXdtNW13VjV5UWZqRlY5?=
 =?utf-8?B?anJ1UU5UcTJ5Y29HbmtLekhybzNlT2JWeS9NdFRKOFdHQzdETnpINytobnk3?=
 =?utf-8?B?eHJ0TWw2V0d2Y1B1WHdhSlFvUTBPVTMwSm5pS1NJa2dGSUs5VTc5Z1plQ09r?=
 =?utf-8?B?SkFHb2syZjgwT00wRWFTcDIwc1lURDNGeldmOFpaUE1GZXR5em9KOEpmT05T?=
 =?utf-8?B?R3Jzc1p4TE1FK3FsSTVoakNQdTl6NHdUdHBlZzhBOThUODk0UHl1WkNHcFBJ?=
 =?utf-8?B?b0NHSjhmbHNCZ1RNNVVSRlBhVGZiTCt1SFRVekJORnRhRE9UenRNUVFwM3VE?=
 =?utf-8?B?T2lkeDFLamVqQTZVYlhkem90OWNBMjFyYzR5R1gyK1J4eFplOFVvRDlHRmxT?=
 =?utf-8?B?cTJwdjhjZUpObnVVbW13dndmdVZmWXRmTklEM2Q5Q1dsbzdtQTk0ZHhxUjhh?=
 =?utf-8?B?KzJCdDllTjl3ekpnV0liTkFjR1g3RmpsUlFXbHQwREtXdVRsRGNYL01WQjUr?=
 =?utf-8?B?bkFsVWNBbUxEOW1iTE5qSzVxZnJWbUlKOUpqdjRrYzBpQlp4YXp1cXFTRXps?=
 =?utf-8?B?S1lGTnBiQ3o0M09NNXNNZWd2V3p5WUFDZHpXNVRWNEVLaGdsNjFwd1NJMTVO?=
 =?utf-8?B?MzJOaUd1SHNVUVJ2bFU5dlczbHUyekRVVzQ4V0RKZ2JvM1krakZQMWhhclh0?=
 =?utf-8?B?T1Q1WGZzL3ZBRXk4RWlFUW1RQStnSmtDR3ZCTEdNcWEvQ2NuT2FCdlRJWmJj?=
 =?utf-8?B?c1dtSXYwemt4NUx0dXE1dXpIdXlCYy9yVno4WWxlVWlSaXhiNWpBT2VQcEhG?=
 =?utf-8?B?VnZ2aDZNYXJkbWNJUThjTlFFeGwyYTQ5NCtBenlQZk41eGpHUCtGYWtGOXBu?=
 =?utf-8?B?QVJPY1VTZk9pcmpKWVJHblRiTUV5aFFmVldHdjczNHFCWEl2d09oOGMvZzl3?=
 =?utf-8?Q?suRPn5yQXHtwi0A6kUKJCNDjR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd85a3d2-2d0f-4b51-8e76-08dbd1ac6563
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 20:37:36.8333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcdyNwdF6IRrcrXYVKCVEBoSn5PAMcDgyRRoGsXRSr9nidkEax81VHF9EROu9eQxFK47CVl4RQKStHIoEdAKdiD5t6Qo5hv92UJOxIQ/1PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQXJhdmluZCBJZGRhbXNldHR5IDxh
cmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgT2N0b2Jl
ciAyMCwgMjAyMyAxMTo1OSBBTQ0KPlRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbTsgYWlybGllZEBnbWFpbC5jb207IGRhbmllbEBmZndsbC5jaDsNCj5qb29uYXMubGFodGlu
ZW5AbGludXguaW50ZWwuY29tOyBvZ2FiYmF5QGtlcm5lbC5vcmc7IFRheWFyLCBUb21lciAoSGFi
YW5hKQ0KPjx0dGF5YXJAaGFiYW5hLmFpPjsgSGF3a2luZy5aaGFuZ0BhbWQuY29tOw0KPkhhcmlz
aC5LYXNpdmlzd2FuYXRoYW5AYW1kLmNvbTsgRmVsaXguS3VlaGxpbmdAYW1kLmNvbTsNCj5MdWJl
bi5UdWlrb3ZAYW1kLmNvbTsgUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRlbC5j
b20+DQo+U3ViamVjdDogW1JGQyB2MiAyLzVdIGRybS94ZS9SQVM6IFJlZ2lzdGVyIG5ldGxpbmsg
Y2FwYWJpbGl0eQ0KPg0KPlJlZ2lzdGVyIG5ldGxpbmsgY2FwYWJpbGl0eSB3aXRoIHRoZSBEUk0g
YW5kIHJlZ2lzdGVyIHRoZSBkcml2ZXINCj5jYWxsYmFja3MgdG8gRFJNIFJBUyBuZXRsaW5rIGNv
bW1hbmRzLg0KPg0KPnYyOg0KPk1vdmUgdGhlIG5ldGxpbmsgcmVnaXN0cmF0aW9uIHBhcnRzIHRv
IERSTSBzdXNic3l0ZW0gKFRvbWVyIFRheWFyKQ0KPg0KPkNjOiBUb21lciBUYXlhciA8dHRheWFy
QGhhYmFuYS5haT4NCj5TaWduZWQtb2ZmLWJ5OiBBcmF2aW5kIElkZGFtc2V0dHkgPGFyYXZpbmQu
aWRkYW1zZXR0eUBsaW51eC5pbnRlbC5jb20+DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS9N
YWtlZmlsZSAgICAgICAgICB8ICAxICsNCj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5j
ICAgICAgIHwgIDQgKysrKw0KPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgg
fCAgMSArDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9uZXRsaW5rLmMgICAgICB8IDIyICsrKysr
KysrKysrKysrKysrKysrKysNCj4gNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspDQo+
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfbmV0bGluay5jDQo+DQo+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9NYWtlZmlsZQ0KPmluZGV4IGVkNzcyZjQ0MDY4OS4uMDQ4ZjlhMjNlMmYwIDEwMDY0NA0K
Pi0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9NYWtlZmlsZQ0KPkBAIC04Nyw2ICs4Nyw3IEBAIHhlLXkgKz0geGVfYmIubyBcDQo+IAl4
ZV9tbWlvLm8gXA0KPiAJeGVfbW9jcy5vIFwNCj4gCXhlX21vZHVsZS5vIFwNCj4rCXhlX25ldGxp
bmsubyBcDQo+IAl4ZV9wYXQubyBcDQo+IAl4ZV9wY2kubyBcDQo+IAl4ZV9wY29kZS5vIFwNCj5k
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZS5jDQo+aW5kZXggNjI4Y2I0NmEyNTA5Li44YzkyODcxOWE1MzcgMTAw
NjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+KysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+QEAgLTE1MSw2ICsxNTEsOCBAQCBzdGF0aWMgdm9p
ZCB4ZV9kcml2ZXJfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAJcGNpX3NldF9k
cnZkYXRhKHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpLCBOVUxMKTsNCj4gfQ0KPg0KPitleHRlcm4g
Y29uc3Qgc3RydWN0IGRyaXZlcl9nZW5sX29wcyB4ZV9nZW5sX29wc1tdOw0KPisNCj4gc3RhdGlj
IHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsNCj4gCS8qIERvbid0IHVzZSBNVFJScyBoZXJl
OyB0aGUgWHNlcnZlciBvciB1c2Vyc3BhY2UgYXBwIHNob3VsZA0KPiAJICogZGVhbCB3aXRoIHRo
ZW0gZm9yIEludGVsIGhhcmR3YXJlLg0KPkBAIC0xNTksNiArMTYxLDcgQEAgc3RhdGljIHN0cnVj
dCBkcm1fZHJpdmVyIGRyaXZlciA9IHsNCj4gCSAgICBEUklWRVJfR0VNIHwNCj4gCSAgICBEUklW
RVJfUkVOREVSIHwgRFJJVkVSX1NZTkNPQkogfA0KPiAJICAgIERSSVZFUl9TWU5DT0JKX1RJTUVM
SU5FIHwgRFJJVkVSX0dFTV9HUFVWQSwNCj4rDQoNCkdyYXR1aXRvdXMgYmxhbmsgbGluZT8NCg0K
V2l0aCBvciB3aXRob3V0IHRoaXMgY2xlYW5lZCB1cDoNCg0KVGhpcyBsb29rcyByZWFzb25hYmxl
IHRvIG1lLg0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBp
bnRlbC5jb20+DQoNCk0NCj4gCS5vcGVuID0geGVfZmlsZV9vcGVuLA0KPiAJLnBvc3RjbG9zZSA9
IHhlX2ZpbGVfY2xvc2UsDQo+DQo+QEAgLTE3MCw2ICsxNzMsNyBAQCBzdGF0aWMgc3RydWN0IGRy
bV9kcml2ZXIgZHJpdmVyID0gew0KPiAJLnNob3dfZmRpbmZvID0geGVfZHJtX2NsaWVudF9mZGlu
Zm8sDQo+ICNlbmRpZg0KPiAJLnJlbGVhc2UgPSAmeGVfZHJpdmVyX3JlbGVhc2UsDQo+KwkuZ2Vu
bF9vcHMgPSB4ZV9nZW5sX29wcywNCj4NCj4gCS5pb2N0bHMgPSB4ZV9pb2N0bHMsDQo+IAkubnVt
X2lvY3RscyA9IEFSUkFZX1NJWkUoeGVfaW9jdGxzKSwNCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3R5cGVzLmgNCj5pbmRleCBhMWJhY2Y4MjBkMzcuLjgyMDFmMzY0NGI4NiAxMDA2NDQNCj4t
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4rKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj5AQCAtMTAsNiArMTAsNyBAQA0KPg0KPiAj
aW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4NCj4gI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPg0K
PisjaW5jbHVkZSA8ZHJtL2RybV9uZXRsaW5rLmg+DQo+ICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9k
ZXZpY2UuaD4NCj4NCj4gI2luY2x1ZGUgInhlX2RldmNvcmVkdW1wX3R5cGVzLmgiDQo+ZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9uZXRsaW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbmV0bGluay5jDQo+bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj5pbmRleCAwMDAwMDAwMDAw
MDAuLjgxZDc4NTQ1NTYzMg0KPi0tLSAvZGV2L251bGwNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbmV0bGluay5jDQo+QEAgLTAsMCArMSwyMiBAQA0KPisvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTUlUDQo+Ky8qDQo+KyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0
aW9uDQo+KyAqLw0KPisjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+Kw0KPitzdGF0aWMgaW50IHhl
X2dlbmxfbGlzdF9lcnJvcnMoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IHNrX2J1ZmYg
Km1zZywNCj5zdHJ1Y3QgZ2VubF9pbmZvICppbmZvKQ0KPit7DQo+KwlyZXR1cm4gMDsNCj4rfQ0K
PisNCj4rc3RhdGljIGludCB4ZV9nZW5sX3JlYWRfZXJyb3Ioc3RydWN0IGRybV9kZXZpY2UgKmRy
bSwgc3RydWN0IHNrX2J1ZmYgKm1zZywNCj5zdHJ1Y3QgZ2VubF9pbmZvICppbmZvKQ0KPit7DQo+
KwlyZXR1cm4gMDsNCj4rfQ0KPisNCj4rLyogZHJpdmVyIGNhbGxiYWNrcyB0byBEUk0gbmV0bGlu
ayBjb21tYW5kcyovDQo+K2NvbnN0IHN0cnVjdCBkcml2ZXJfZ2VubF9vcHMgeGVfZ2VubF9vcHNb
XSA9IHsNCj4rCVtEUk1fUkFTX0NNRF9RVUVSWV0gPQkJeyAuZG9pdCA9IHhlX2dlbmxfbGlzdF9l
cnJvcnMgfSwNCj4rCVtEUk1fUkFTX0NNRF9SRUFEX09ORV0gPQl7IC5kb2l0ID0geGVfZ2VubF9y
ZWFkX2Vycm9yIH0sDQo+KwlbRFJNX1JBU19DTURfUkVBRF9BTExdID0JeyAuZG9pdCA9IHhlX2dl
bmxfbGlzdF9lcnJvcnMsIH0sDQo+K307DQo+LS0NCj4yLjI1LjENCg0K
