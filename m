Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527162F7D1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64DD10E75E;
	Fri, 18 Nov 2022 14:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E0110E720;
 Fri, 18 Nov 2022 14:37:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIDxvvq010542; Fri, 18 Nov 2022 14:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=egmf7kiLS7udSqzXI1VvFjgNUgxrbYS+Cp+1yqCyV3w=;
 b=AUC9nY1PK+gctaD8c85CAzrtQypua0AXWhXss3qcGntB3HxQQwhtUbQp7hIaFThUVjdC
 1nIwTKUdbAxBlnNW3USKgOFXIJoVZt/RJ2jleA/esf10wxgydHURLkOkeXMzDCopB76K
 jxofmqzTw+2eO62MxY52qWI8adRPDagPHsCUSuueE/HBup2vm+jj2AOCEaj0MfQa79UR
 bixFdM7jAK+7jyin1vMa581/yJMt/ZKP+8nrlg2q2u6jqeP48WAgB55slhiQcGgrFEVy
 8ToHcWROfZBv+xeskMFb07pL0wkdLNLWQYi2Fs+C4qq3X7ZUubViiZL5lXyirdBUiaWv /Q== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0u7sgkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 14:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msI0tHyMF/nfFFi8jzX/oc/+YCXHXmNAPWP305sHhGxpsGgfKo3OZoXbwYyvOjhslTeaG7ZuPfjLOjd5kjUGQDFrKNvg5bIv4JRxPZIHWJ9BUtTTWpp3Ks4F3jQj8Ts9x+wNiGmUop9H9oz+eRDBKusoZjSpEXvdT+JCg745XwgLDHUFggEVWqoJOM8iSct3bfw33WiFbmyxr2NpZ3KdluRfl4UqLHVjQtyDqrB5O+nmvddAQVV8HBxRcmAqdsrOXSrsNGM1R54DKdp/MziXtTC+SAh+LBxjC7XsOYgR75K8IL2yJxZ/48Mv/3DhGDZ6D6sSKo01HWneWaJTGMNo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egmf7kiLS7udSqzXI1VvFjgNUgxrbYS+Cp+1yqCyV3w=;
 b=Ey+8zycbfP8CCCnIO56UhpJ3A/KmmwGJwFg3VDhLGE9qnZ8qaHBN0G3oJLgadzv7WPN97GLAgECwhlmWGZQTUmqZmVmwji+RuqvvLmdAf9v35tx/Nt3zhe6afqbfkyKrdbOs10/nu+xmdftqtCo90TWnj+xNxnjcQUKgDuZY3t69ThDlaS3Kv/OuDoMPAo0+RjWXTY4RYj1rzA5iGEwlfH2lp817QYWTAHRLuga5eshOZa6UT0F53WCedLLLUKMkc12sdnQ0w/6tXeQpCYtzXuU5xGc75UnPlDmaCVEVQVbMGEHtZR8vmAWnU1lXc+QVtuHgE0KFWTQj4J14aOYHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by SA0PR02MB7467.namprd02.prod.outlook.com (2603:10b6:806:ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 14:37:26 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::881:65fa:f52a:480f]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::881:65fa:f52a:480f%3]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 14:37:26 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Kalyan Thota
 (QUIC)" <quic_kalyant@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] drm/msm/disp/dpu1: add helper to know if display
 is builtin
Thread-Topic: [PATCH v3 2/3] drm/msm/disp/dpu1: add helper to know if display
 is builtin
Thread-Index: AQHY+0epaakVqtDIsk2ch0RvU+FCxq5EnsyAgAAgH6A=
Date: Fri, 18 Nov 2022 14:37:26 +0000
Message-ID: <BN0PR02MB81424044EB8F918A99ECE3ED96099@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
 <1668773807-19598-3-git-send-email-quic_kalyant@quicinc.com>
 <5dddeaa9-aab1-e437-a3ed-8ad242d50171@linaro.org>
In-Reply-To: <5dddeaa9-aab1-e437-a3ed-8ad242d50171@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|SA0PR02MB7467:EE_
x-ms-office365-filtering-correlation-id: 0491d850-fa01-4274-4d08-08dac97269d1
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +RAJYItW3DdOfJajtgWvTmZhlWIe8UHOY9YHwocsskMBuUS8rf+gIWhL1aAQ6KMKhH9eYTn3+CwtivqNm+1I9lE3eJCAAC93WbG3TCLhPrxpyVkOnE8dbtsbkxyP6a5as1b7+VjoxLaZ/dn7VVhMXW6xC1R5Zg5C4Uo6tc481c5Aa8g4iCNpKYrhcOiSVGmMwm/DKHAreGPMJaA+ZzzXq257z8Y5j5/M7wVfJQ3kfi3TPGgwSEnXgSkr7cL7BbTeJ8V7MLJGuR8aQLtbCn4J6nRx+c1GwZhcPNQnofYq9I59Xrt1LLQjSUu/402i8h4CoewkxBuHtACBe13NpQgm40/asypW4eu+/wBoIRX8o5QhuH5UAcumrKP8rsmg3Dhl3aeEm5JbSwwdTKlXwOBTCIxmwYZHRpW0N/lDmiXydmefeZzjzJFvUfOUZ+yeh4lPOR0ISW35Hb2ez+B5XJXmG0FAmeSJw1n5BSbbZWjJnugREHaHsbr0pw0ajuZpEN4XqQ3TuwzZuyVM/tf37TXmFaldw0mQAAzYN3RkBKmN0v3vZk3x0uXJNFB9j/Pfw2MEz/tlLrckFTaSimkrFC1RNdPGRHF4SSbyNPyVD91ivQib9pZkAZcSx0R/UADm5dpAsSe2lCIePS83PTAMdktQCsediZSn75gpQSx3zX5gDKalMA9lr4FoikBk/XHtDDOhtjkj45+6K8YBzEhkRks6DA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(38100700002)(33656002)(38070700005)(71200400001)(478600001)(83380400001)(122000001)(86362001)(8936002)(55016003)(5660300002)(8676002)(2906002)(7696005)(66556008)(64756008)(66476007)(6506007)(4326008)(52536014)(107886003)(66946007)(66446008)(76116006)(9686003)(26005)(186003)(54906003)(110136005)(316002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajNHYUdhUTVrd0lVWWdTZWZyMEwwNEhDQnZ1enBCa2NWWG90YzNWYk1XRFp3?=
 =?utf-8?B?akZCSm9BRnRPMWlHRDNLVTdFTXh6eHlPVENXM1dHNzhSOTdkODZ5NUZKL3lk?=
 =?utf-8?B?VG0zT0FtSGpXcnRyRFBVVm0wUDI4Q3BHZVNJODY2MHFMZVFhQWdVRlZQOHNz?=
 =?utf-8?B?WFJoR1hMWjdmQXFPc2VLZEoyQ1RyaW9PelkvdytQakQ5bzV4NXdDNE9BS0FW?=
 =?utf-8?B?NGNaSVVaTW5KYnNVZGY4dDBPdGpmSFBjVFNWcThMOVBUaWZ5TVZPTkVjSTVD?=
 =?utf-8?B?QjMxaCtuYTBiS2k5V3dMcEdjT2w4NkNhbDhYZ1hWcUVDTUF4Qzd4UnpoVzVC?=
 =?utf-8?B?Rmt3OTVNckFTUzRkN2FOdUg0NkhnWEdHNVpUK1d6cmRaNm5CQXdMem54dENr?=
 =?utf-8?B?WkhIN3R2c3kzRlIrRG5VWHY5SW41WXRpMU9aSkpDYWpEZEJmZHl2a0dEMHFP?=
 =?utf-8?B?N0Jqd0l5a042b28yb2tYeE5QV2UvKzkxV2VuVytVSzd1Nkxxc1hJb1hZcHpO?=
 =?utf-8?B?eHFmUHhPNmwzNTA0d0gzWUZRSDhaRS93RXI4Q09NbFJENXFQVXhIQXRkVGht?=
 =?utf-8?B?bnNCMHZ4SlRhcGZ1R2crR2FPck5lVDZETjZPOFF1Z0xNenV0OFVhQXlJcjdX?=
 =?utf-8?B?OWtsaE01Mk9va3dPeUhzMmZZY0MyVE5lSHZNOURkMG9DR08xZzdzeWJkMVdF?=
 =?utf-8?B?c0gvVjc2N25kUGJGUmhQQk8vYVJGYm1SY3VaSlNXRVg1SUdlWld6UE04dFZr?=
 =?utf-8?B?dnRES1BwWU1zT25BWDdXcW1FMWNEMHJpS1QrNUpSQ0laRE10QTVJM0h4MlF5?=
 =?utf-8?B?TncwSnhlc2hqRkFqWUYvcnFhQTh3OFlzSkY4ZVc3R1NkM0RZU2F4VGRkYmJW?=
 =?utf-8?B?azY0MC81TGVqNUE4TkxxNjJxVzlTMmdwQi9BMXFxbHVXbGZaTVlNWHpXNG1s?=
 =?utf-8?B?WnExMk1COXpqUnFWeTlNV3RWQkRWWmtHa2FFUnZlRXhCdGpVSDRMSDJSN0gw?=
 =?utf-8?B?OHgvRnpTM0NyTXd4Q20wQnhXN0kzbFFxRnZtY0dQU0IxK0NZNDF1TjRaclZZ?=
 =?utf-8?B?SXI0MWowc3E1alMycnp0M2NYRWxIaE5MZFdscHFOdDJxdk4vZXJvZ0ozaHJi?=
 =?utf-8?B?ZE1CRDhiZUFFbHVSL0pReFRoQzBZS1Y0NnBLOWNKMEEvTmwwWGpTaG9VYjJq?=
 =?utf-8?B?Qk1yWGZ0Rk9uWjNCUWJaZFZIc1NUSDY5YnA4UXZ1Z20vV3ZJaXdTcTBrQkpR?=
 =?utf-8?B?RFhIODRTek9RbHN0UVoyWEVmNW1wOXdEbDZ0bkNLTU9NeERXTC9yNmx2UGl3?=
 =?utf-8?B?WHZJWGU0d1h4SUNaenVqa2pUSzB0a29NdEtzLzJiYnNSeUFvWEl3OTloSlBK?=
 =?utf-8?B?UmVTaVB0MHUrazBTR3hyZTBFMHpiYU55aFlmbDZVdmxOMGdnYy8wcnhSS1Z5?=
 =?utf-8?B?d1hOUk1wK3dXU2Z1dHlIejA0NnNHRmtSa2lLTWVXc05tWFI0MDlLSnBKRVUy?=
 =?utf-8?B?eE43Qit0UVhmcUxnZmhPbVNaZ2pBMFhTcUZCcndUM3JqVXZTd1NkWjE3SEhC?=
 =?utf-8?B?MkhQc3pRMGdJdjFOeW9zdzE5UzJ3RzN0cWw0NlVORFdlYlpqZm95aU13MTlC?=
 =?utf-8?B?WFJPNENkS203Z3JyVjlZaS9xM2ZINDBJcytjcTgrckNhLy8zdkVIYkdRL09n?=
 =?utf-8?B?NlAwKzByeTZPQ2MrNWNCaGFKVFVGS0ZaNDJLS1lmOVpud1JmRDVlc0pyRUVB?=
 =?utf-8?B?ZzYvMW9HSXNoNm9odlpaT2Rtc0tQZVdLRWxiNGNYeTRNY3JsUElxTHEzQ0NH?=
 =?utf-8?B?R3pTSnNob3JrOXh6MUs3RHYyeEt3eUpsT3RVNFordnlqVDlWZFozU1N6MDdm?=
 =?utf-8?B?bVBTV0FkajdaaHYzTkxhdUd2Uk1xM1RmSmhVRURVM0JMbjlyNUNvZE5QdmpV?=
 =?utf-8?B?UC9keTFkMDUwdHlFTUk1eWpKbEhMSDJSQWhKckN4a1R5ZE1hZzFlV1d1U3FB?=
 =?utf-8?B?cnljdk93NUY1anRrSDBVclloMFJGdGNpNTh6YWc4OGJDOU9VSkRiWTlxREFE?=
 =?utf-8?B?dnZzWEYvck5VaGRyRUg0b0xwZFV5NnFtZWFhNS9LTE8zQnM5LytYUEZHNUpE?=
 =?utf-8?B?YXpnSnh0QWV0UjlKdVFNY1pLQzNOV1VYcUFWanN3VS93Y2kxWGw4UExnWlh4?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?NzMybFN3cUxRS0xJSU1HcytuYlJZL1h4cm4vK1hrNy9LMER5Q0JqM1dBZCtY?=
 =?utf-8?B?MjJSbyt1WGpabGRXNEl1V3NjM0JDRVI2ck9wTUppSlNHdnZicVRFM3lMMG1u?=
 =?utf-8?B?bW9vSDVtUDRnRFJsWW81aHZBK2lxbW4reFUvajBNLzJBOUZOdmo0b0lSMVU4?=
 =?utf-8?B?OTJsNy9LeWw2bHRPMTEzQU1nQ2xtSVlEVE9qRTBQdHE0ajhUb0JqKzZlaTZE?=
 =?utf-8?B?WVBrbnZybjRVcjR6SU9Eanlpcyszc0QyYjJ5cHE3SG5mQTNoUVlCU1pKK2g3?=
 =?utf-8?B?RHpnQU5LWVppQW1LNjI5WVhIQThycm9nN05ka2dsZUllS1Y4b2ZiNmFHODZH?=
 =?utf-8?B?TWMxbUJvNkhSbkgydjA3Yyt2N1luT3lXdk1pK2htV0VwWGRwczc0VXQwRHdv?=
 =?utf-8?B?WTZEY2w5UjBTUFIzRDZLNm5rTDFHeTlrWm9CTmRaRVAvQUpPU3RJVm1rL3Qr?=
 =?utf-8?B?a2lhemZVaE5mcEorbXZFVDhBUmpJSjNyeWgwOU1HSWY5ZWIrZC9WSkFkckRX?=
 =?utf-8?B?Ni8vSjhTMjhwRnE5N2NXR1NIdHNpbWFoRTJlSUI1UTc2YXNRRVpTUk40RHQ4?=
 =?utf-8?B?QUF4cit3MlJBVTNIaUs4WEFrcXROZjdRMTBZcDRKeUVzUFpodFhNMWp3dGE4?=
 =?utf-8?B?eVJDZjgzVThCU25xdWJQWGZnKzd6VWNSN2ZxaVVCL0R4M1VFUDZkWVMxb1VQ?=
 =?utf-8?B?bmFRZC9IcWluZDJtaG0ya0RHa1ZhQXZZbWYzcFBlWHJFS3dtb3ZyTEFlWjlN?=
 =?utf-8?B?NW9nZFM5ZXlhWG9aWUJSb0h1MVFXc3FEZ3F4MjMrdVlSRWNJRVJXSHlwY1RI?=
 =?utf-8?B?UWNtNHVjQTl6aTRwUXcxNEVac1h2WXVKcFYzTEp0eldZZjlxZXFGRm96NXFQ?=
 =?utf-8?B?aDlKbjRXMmVMd1Ntdml6Z3ViM0dFc0tzWHVBR2lLRVhCSWU2Z01wM1B4NWo2?=
 =?utf-8?B?eHRlM0YzNG82ZEw4elBjUEVyQldzR01QYVBzalE2VW5hZWk5NWRscHJiVmlC?=
 =?utf-8?B?SXRHaHpKR0d4a1ZtK2l1dnRLblRQSmQrN21wWXcwQmx2R2NxK3lZeXo3SnNL?=
 =?utf-8?B?ZnVjWW8yNWF3VEg0Z0dtYTVUWnlRQVdMMGJ1SGI5UE5KVU1uOXVsdlpOWTRS?=
 =?utf-8?B?SCsrb29vbWliMkRvUit4QjRVY3FQa0hhdldiQ0FaaHhuNG1BRkFDRCtsa2ZP?=
 =?utf-8?B?WU5OM2FiMUFBZjhteS9RUVl0R21aMlFxTDJ4SGpPZFhEU0RLdWU4Zk1nVEFH?=
 =?utf-8?B?ekhJV1FBeUdTdHFXLzZKeHVsUXRHbjArVmRDd3RXZStZSUx5Q25CUGtjeCtF?=
 =?utf-8?B?d215WjN6UHM4R3hjZ0NZNS90WmtKS3ZNVnFDVjhXUGNZUW9QT3R2TXU3Q1pv?=
 =?utf-8?B?TjB5WjNHanI1WE8ya25JRzJnUlZ5Y21TeVV3ZzRPVzMyTnJmdTFwK0tYYVU0?=
 =?utf-8?B?cTVlenN4VmI1QVludm9rTklOY1pMRk5uTThXeGp3d1lhYzVvS1hWaGV6ajli?=
 =?utf-8?Q?RQpzvk=3D?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0491d850-fa01-4274-4d08-08dac97269d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 14:37:26.4656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tz7MxRJJWAM65R1A51ZCrbdUYhj25OL2/qZVDyaQzN7RQRi2BWOK5rGOYSHEdZ9rOWrSUT0cUtQLNdH/B700hSzd41qZlhvYPg+VaNyG/Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7467
X-Proofpoint-GUID: CxGmBNyQXClx0Y16XjMsjPZwVdWX6Yff
X-Proofpoint-ORIG-GUID: CxGmBNyQXClx0Y16XjMsjPZwVdWX6Yff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180085
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vinod
 Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj5TZW50OiBGcmlkYXksIE5vdmVtYmVyIDE4
LCAyMDIyIDY6MDkgUE0NCj5UbzogS2FseWFuIFRob3RhIChRVUlDKSA8cXVpY19rYWx5YW50QHF1
aWNpbmMuY29tPjsgZHJpLQ0KPmRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJt
LW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj5DYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgcm9iZGNsYXJrQGNocm9taXVtLm9yZzsNCj5kaWFuZGVyc0BjaHJvbWl1bS5vcmc7IHN3
Ym95ZEBjaHJvbWl1bS5vcmc7IFZpbm9kIFBvbGltZXJhIChRVUlDKQ0KPjxxdWljX3Zwb2xpbWVy
QHF1aWNpbmMuY29tPjsgQWJoaW5hdiBLdW1hciAoUVVJQykNCj48cXVpY19hYmhpbmF2a0BxdWlj
aW5jLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvM10gZHJtL21zbS9kaXNwL2RwdTE6
IGFkZCBoZWxwZXIgdG8ga25vdyBpZiBkaXNwbGF5IGlzDQo+YnVpbHRpbg0KPg0KPldBUk5JTkc6
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBi
ZSB3YXJ5IG9mDQo+YW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBt
YWNyb3MuDQo+DQo+T24gMTgvMTEvMjAyMiAxNToxNiwgS2FseWFuIFRob3RhIHdyb3RlOg0KPj4g
U2luY2UgRFJNIGVuY29kZXIgdHlwZSBmb3IgZmV3IGVuY29kZXJzIGNhbiBiZSBzaW1pbGFyIChs
aWtlIGVEUCBhbmQNCj4+IERQKSBmaW5kIG91dCBpZiB0aGUgaW50ZXJmYWNlIHN1cHBvcnRzIEhQ
RCBmcm9tIGVuY29kZXIgYnJpZGdlIHRvDQo+PiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gYnVpbHRp
biBhbmQgcGx1Z2dhYmxlIGRpc3BsYXlzLg0KPj4NCj4+IENoYW5nZXMgaW4gdjE6DQo+PiAtIGFk
ZCBjb25uZWN0b3IgdHlwZSBpbiB0aGUgZGlzcF9pbmZvIChEbWl0cnkpDQo+PiAtIGFkZCBoZWxw
ZXIgZnVuY3Rpb25zIHRvIGtub3cgZW5jb2RlciB0eXBlDQo+PiAtIHVwZGF0ZSBjb21taXQgdGV4
dCByZWZsZWN0aW5nIHRoZSBjaGFuZ2UNCj4+DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBhdm9p
ZCBoYXJkY29kZSBvZiBjb25uZWN0b3IgdHlwZSBmb3IgRFNJIGFzIGl0IG1heSBub3QgYmUgdHJ1
ZQ0KPj4gKERtaXRyeSkNCj4+IC0gZ2V0IHRoZSBIUEQgaW5mb3JtYXRpb24gZnJvbSBlbmNvZGVy
IGJyaWRnZQ0KPj4NCj4+IENoYW5nZXMgaW4gdjM6DQo+PiAtIHVzZSBicmlkZ2UgdHlwZSBpbnN0
ZWFkIG9mIGJyaWRnZSBvcHMgaW4gZGV0ZXJtaW5pbmcgY29ubmVjdG9yDQo+PiAoRG1pdHJ5KQ0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEthbHlhbiBUaG90YSA8cXVpY19rYWx5YW50QHF1aWNpbmMu
Y29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNv
ZGVyLmMgfCAyNw0KPisrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5oIHwgIDYgKysrKysrDQo+PiAgIDIgZmls
ZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4+IGluZGV4IDljNjgxN2IuLjU3NGYyYjAg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
ci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5j
DQo+PiBAQCAtMTUsNiArMTUsNyBAQA0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+DQo+
PiAgICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJv
YmVfaGVscGVyLmg+DQo+PiArI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+DQo+Pg0KPj4gICAj
aW5jbHVkZSAibXNtX2Rydi5oIg0KPj4gICAjaW5jbHVkZSAiZHB1X2ttcy5oIg0KPj4gQEAgLTIx
Nyw2ICsyMTgsMzIgQEAgc3RhdGljIHUzMiBkaXRoZXJfbWF0cml4W0RJVEhFUl9NQVRSSVhfU1pd
ID0gew0KPj4gICAgICAgMTUsIDcsIDEzLCA1LCAzLCAxMSwgMSwgOSwgMTIsIDQsIDE0LCA2LCAw
LCA4LCAyLCAxMA0KPj4gICB9Ow0KPj4NCj4+ICtib29sIGRwdV9lbmNvZGVyX2lzX2J1aWx0aW4o
c3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKSB7DQo+PiArICAgICBzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlOw0KPj4gKyAgICAgaW50IG9wcyA9IDA7DQo+PiArDQo+PiArICAgICBpZiAoIWVu
Y29kZXIpDQo+PiArICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICsNCj4+ICsgICAgIC8q
IEdldCBsYXN0IGJyaWRnZSBpbiB0aGUgY2hhaW4gdG8gZGV0ZXJtaW5lIGNvbm5lY3RvciB0eXBl
ICovDQo+PiArICAgICBkcm1fZm9yX2VhY2hfYnJpZGdlX2luX2NoYWluKGVuY29kZXIsIGJyaWRn
ZSkNCj4+ICsgICAgICAgICAgICAgaWYgKCFkcm1fYnJpZGdlX2dldF9uZXh0X2JyaWRnZShicmlk
Z2UpKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIG9wcyA9IGJyaWRnZS0+dHlwZTsNCj4NCj5X
aHkgZG9uJ3Qgd2UgY2hlY2sgdGhlIGNvbm5lY3RvciB0eXBlIGRpcmVjdGx5PyBZb3Ugc2hvdWxk
IG5vdCBhc3N1bWUgdGhhdA0KPmNvbm5lY3RvcidzIHR5cGUgaXMgZXF1YWwgdG8gdGhlIGxhdGVz
dCBicmlkZ2UncyB0eXBlLg0KDQppZiB3ZSBuZWVkIHRvIGdldCB0aGUgdHlwZSBmcm9tIGNvbm5l
Y3RvciwgbmVlZCB0byBkbyBzb21ldGhpbmcgYXMgYmVsb3cuDQpBcmUgeW91IHRoaW5raW5nIG9u
IHRoZSBzYW1lIGxpbmVzID8NCg0KInRvX2RybV9icmlkZ2VfY29ubmVjdG9yIiBtYWNybyBuZWVk
cyB0byBiZSBtb3ZlZCB0byBkcm1fYnJpZGdlX2Nvbm5lY3Rvci5oDQoNCnN0cnVjdCBkcm1fYnJp
ZGdlX2Nvbm5lY3RvciAqYnJpZGdlX2Nvbm5lY3RvcjsNCg0KZHJtX2Nvbm5lY3Rvcl9saXN0X2l0
ZXJfYmVnaW4oZGV2LCAmY29ubl9pdGVyKTsNCglkcm1fZm9yX2VhY2hfY29ubmVjdG9yX2l0ZXIo
Y29ubmVjdG9yLCAmY29ubl9pdGVyKSB7DQoNCgkJYnJpZGdlX2Nvbm5lY3RvciA9IHRvX2RybV9i
cmlkZ2VfY29ubmVjdG9yKGNvbm5lY3Rvcik7DQoJCWlmIChicmlkZ2VfY29ubmVjdG9yLT5lbmNv
ZGVyID09IGVuY29kZXIpIHsNCgkJCXR5cGUgPSBjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlOw0K
CQkJYnJlYWs7DQoJCX0NCgl9DQpkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRl
cik7DQoNCg0KPj4gKw0KPj4gKyAgICAgc3dpdGNoIChvcHMpIHsNCj4+ICsgICAgIGNhc2UgRFJN
X01PREVfQ09OTkVDVE9SX1Vua25vd246DQo+PiArICAgICBjYXNlIERSTV9NT0RFX0NPTk5FQ1RP
Ul9MVkRTOg0KPj4gKyAgICAgY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQOg0KPj4gKyAgICAg
Y2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfRFNJOg0KPj4gKyAgICAgY2FzZSBEUk1fTU9ERV9DT05O
RUNUT1JfRFBJOg0KPj4gKyAgICAgY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfV1JJVEVCQUNLOg0K
Pj4gKyAgICAgY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfVklSVFVBTDoNCj4NCj5Vbmtub3duLCBX
UklURUJBQ0sgYW5kIFZJUlRVQUwgYXJlIG5vdCBidWlsdGluIChmb3IgdGhlIHBvaW50IG9mIENU
TSBhdA0KPmxlYXN0KS4NCj4NCj4+ICsgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+PiArICAg
ICBkZWZhdWx0Og0KPj4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArICAgICB9DQo+
PiArfQ0KPj4NCj4+ICAgYm9vbCBkcHVfZW5jb2Rlcl9pc193aWRlYnVzX2VuYWJsZWQoY29uc3Qg
c3RydWN0IGRybV9lbmNvZGVyICpkcm1fZW5jKQ0KPj4gICB7DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuaA0KPj4gYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5oDQo+PiBpbmRleCA5ZTcyMzZlLi43ZjNk
ODIzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXIuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29k
ZXIuaA0KPj4gQEAgLTIyNCw0ICsyMjQsMTAgQEAgdm9pZCBkcHVfZW5jb2Rlcl9jbGVhbnVwX3di
X2pvYihzdHJ1Y3QNCj5kcm1fZW5jb2RlciAqZHJtX2VuYywNCj4+ICAgICovDQo+PiAgIGJvb2wg
ZHB1X2VuY29kZXJfaXNfdmFsaWRfZm9yX2NvbW1pdChzdHJ1Y3QgZHJtX2VuY29kZXIgKmRybV9l
bmMpOw0KPj4NCj4+ICsvKioNCj4+ICsgKiBkcHVfZW5jb2Rlcl9pc19idWlsdGluIC0gZmluZCBp
ZiB0aGUgZW5jb2RlciBpcyBvZiB0eXBlIGJ1aWx0aW4NCj4+ICsgKiBAZHJtX2VuYzogICAgUG9p
bnRlciB0byBwcmV2aW91c2x5IGNyZWF0ZWQgZHJtIGVuY29kZXIgc3RydWN0dXJlDQo+PiArICov
DQo+PiArYm9vbCBkcHVfZW5jb2Rlcl9pc19idWlsdGluKHN0cnVjdCBkcm1fZW5jb2RlciAqZHJt
X2VuYyk7DQo+PiArDQo+PiAgICNlbmRpZiAvKiBfX0RQVV9FTkNPREVSX0hfXyAqLw0KPg0KPi0t
DQo+V2l0aCBiZXN0IHdpc2hlcw0KPkRtaXRyeQ0KDQo=
