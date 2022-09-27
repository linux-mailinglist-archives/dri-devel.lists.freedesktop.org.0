Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D705EBB80
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 09:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9711610E3F9;
	Tue, 27 Sep 2022 07:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE47110E309;
 Tue, 27 Sep 2022 07:31:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R6v47n003653;
 Tue, 27 Sep 2022 07:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=FDd3nhIN0cTqBXuJqRJLzMKPGHByXR0sceREHFNaWoA=;
 b=M/qXi8mxl0Px4DiYXZp2hao4hpA4g8evU6uG8oHdLKe3pmaxerxQ4Rhbr7WsGdd12r1P
 fKwuqyGhkbbOjFmK5jRhbGg+d4kLDoCGXMGHsZejgZ/EM9j+2q5pvEUtdbGbe5DS5pJn
 ZpMmBa9MVMCUR2081KCtUBlSZdMKbWpt6qEQe634qWiTMnAkg8bwWWpBsbeBe0+CpsG9
 I4OATj0ZvLuUsDWw4A4ygHFLsytYuacXkw+O/UBGLMQxjMII+RcpD2k1AcwyVJDafccv
 LY59vNI7kqMz/60W2XaDZFJPo63uV1uzsiuvmKvhp+elc82NgS6S3SIA2ApPyH9eL+EZ ZA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jss7sdn1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 07:31:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqfSyMqMHQkwd8hSV+a5M8B6TzJMu/pbLXprNv80l50vrJHyjMAa0HVsjulqw5ujynsZRiGXSekgYyC+5dGb1vwWz8ekctr3TX8+5PoCF/aGtTQthm5rvr3gxKoAgrPR+txrlkD7BGGEjAuWuC18AS3tXwmLWDdQtxLo7Oh7iXWcCpk5N3hWOLfv2IIiQ7f8ijehVhoF8NHdXy6CahdiCefhJImseFSv/JGHFW30uxhDBJMVkXbP0QtNOrRLWgE68VN9O3ClkZsmAtL4HuR4YcHVN8r87to0XgOwl79mpUe1XOkJ1wKUywyDhxjckwIL1s3NpG9FBmycOuePWyFOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDd3nhIN0cTqBXuJqRJLzMKPGHByXR0sceREHFNaWoA=;
 b=lQCRjiONYOOlFMqcOfK41bG33CkWiVtFlEd57y69yESVOCZfrq0E9W6/Z8u5JGVWOv4uP+CrfiKDbLztfd//vLtO7xn1oeNjVcGKrVT1pGyopT0gkii7N5WyXATT94RPNLoaAJvGDAcrNCQ1cMJ9siIrY4EgwcH3UzHdoBJxId9kGgFzDIdd/5aZg9yC4cGmR/3YF5pqIoek6t6oElzx6iEEgQSVHjBbZ1EwOAkH8Hqny14ktfd6pAnC7KCfq2gVyF3GDS83Rs5+9+CXkl1CZAeJaH/xXL+EprQ/GBjpCIRPmflnc61cKLmRVddR529jJ6m7+EVJmfSqmPgamtKhjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by DM8PR02MB8181.namprd02.prod.outlook.com (2603:10b6:8:a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.26; Tue, 27 Sep 2022 07:31:26 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::223f:870b:a23:9abe]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::223f:870b:a23:9abe%6]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 07:31:25 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [v2] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Thread-Topic: [v2] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Thread-Index: AQHYdy5JIZknP2ToOUOfgpJqMFEL3q1QdyUAgHDpw4CAMhiscA==
Date: Tue, 27 Sep 2022 07:31:25 +0000
Message-ID: <BN0PR02MB8173E3E88164E52AEF5AB1A1E4559@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
 <29ae886c-b2b2-2387-87cb-e4a885080418@linaro.org>
 <f70f9f1b-c835-7baf-974d-87f2bf6e4e53@linaro.org>
In-Reply-To: <f70f9f1b-c835-7baf-974d-87f2bf6e4e53@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|DM8PR02MB8181:EE_
x-ms-office365-filtering-correlation-id: 55de42ca-abc1-4502-264e-08daa05a48fc
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AS3WNcwz0G1mkZmHxYsVFsNZfkdr76x4RJPvddsLS0AefsbrbvAT9Iwt7rEcfcma0oHPJOYIIXEjW0pd8FjZiRhWy9o5wFmkw0rkjZptsC27ItUiDKMmKLouoPKL/GYkYVKIx9x7YJcn3Exj6fCWUOuApbAEk4vgP6l3fm2lB1n2h43fyNHMPIJjXM0a3hN9B5jbExe0tqlxyWTbLJGcOClN7cRyFl0yUIwFFkJF+EJksozIoZo7D1Mz8sFLea67dRF9y/p50mM/avFaa2+uPN2ewp1u7kFwKEM2Vl4Ui3032Va7OGf5gn9THBEas5X27zPnt8eHfmsVR3/20sbHVmsxwloX9U3YlXlQR1+s+myGKCsAWLePZ0F+P3SYeCQy5CeLH+5TQnawNlPUpkGOChfzF1JpOeK7KhT/GaUCBry2rjXLrD3zTvsf/S1glmXchYxkT/O85bcYNksWP9ZdvJzBAI7/UwupTw5RlgsjESs6yjcGhubijgNjzmSYt2TxEL3IIKpySzxfj/w3ysLOc7GhqYIL3c87emsgoVWp/XE2oKgk73xMPdQoitLzqPlkUCuHY29d5B0vDXUODWC/hV/Z8+2z9PKk3eW2XuDv15hRK6MQXrXXMn6hQm4tqOlXBUtSIYQ2O+2hrG6v7JqWm7glE+a6ZjfrEfneF0zLHNe5dt22AA6zEPjPNmGZcD7DhtYY+WZTmCYr7fKupiDQ6Nsc44h3Umpat1vR3FBGuw4KfdRH+n6WRzTGNXEkD9WlEIO5N5KMM2XVQ7OIGVe8vw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(83380400001)(2906002)(316002)(9686003)(7696005)(53546011)(26005)(107886003)(6506007)(38070700005)(38100700002)(122000001)(110136005)(54906003)(55016003)(86362001)(478600001)(5660300002)(52536014)(8676002)(33656002)(8936002)(186003)(41300700001)(64756008)(66476007)(66556008)(66946007)(66446008)(76116006)(71200400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUdwb2t2MVBqMlpaUTZXdHJ2M1lMNkRXWEhpRkFBSkxtQXhseDZFbXJvTFQx?=
 =?utf-8?B?RXZmNW9lVjFOOFlSTUF4ZURSN09LTHVNL1oycU8xTjhPMGNKbkNyQjNydGFr?=
 =?utf-8?B?aXcwcTRUa2FZSis1b1BNZUhHVmhHQ1RkTnRVSXZRZThpS0tMQ2NyaE5oU2Jk?=
 =?utf-8?B?Kzh4M3ZOWVgyRVVNYnFjSnNMWXJpWDhxQ1F0ZUFRQlVKeEczNDYrTVZocFpC?=
 =?utf-8?B?YnFTYlpTYlZCYnNjT1o2QXdVdmM3ZjVBSndsc2QyOU1RRVNNQVFLMXdxdkd2?=
 =?utf-8?B?Wk5sU0d3bnVnb2ZUMGhtUFluYmp5NlZUWTd4K0ZXMlBKZndOK3ZlSjVBSlAx?=
 =?utf-8?B?eVNOWUtOUXQ4S0pPOVlGcGhFUGdOQkd2MEp6UlRpSXpTMUNNM1dsditMYTdy?=
 =?utf-8?B?OGNBeDIzR0twckhtNkhKTFJHK0NHQ1NrU0hSVW1KK29FdEVyUnJIUGJvajh2?=
 =?utf-8?B?MEV4bDNPUlppU2N4ZFpJOWcvbkRjVHhCcG5BZXBZajRhRkJvZlZ4UXpoK2Zz?=
 =?utf-8?B?UEpqZVNGMzJ3eHo2R3JHajlhd0k0eGd3b2ViVUl3c2tZNXdCcjk5SWJHRHE3?=
 =?utf-8?B?elhScEhNeW40MFZmZXoycllCUy9uVmxqaFl6ay9tNXhoaGNwcXVXanFhd3JQ?=
 =?utf-8?B?RFhEL0N2K2NsZSt3V1l5UzlhbmhIOWQrRGcxMi9WZnRjbFFxMW52RXEvWWRs?=
 =?utf-8?B?SXg3ZHlCS2dYaHNENkRlODE1bWM5Z0dlT1p2aUtFd252aHNMVXhYcVhRbWNz?=
 =?utf-8?B?dWZpR0hOa1l6eXhkMEVabFQ1S293ZGFPOFdMbFFSdVZCYWRmQzAwNVh6L0Zp?=
 =?utf-8?B?Q0VEbEZwRWR5SUV2eE9jVkExUEtQVEl2RmVBUlY5NXNKeHlsaktzakpvTjlK?=
 =?utf-8?B?NDRadkpHNUxxdElxN1piMXdmdzVHTndORTRGNDNDNnpsZ05tTXhyRDFNM1hV?=
 =?utf-8?B?QWxaYVBmVnYwYXRvRUlQcW5lR204ZDlBS0FiRlFVM0N5aGV2bFFVOHlkaHE3?=
 =?utf-8?B?MFIrQVFWSkpKN1dyUFArdk9uZzY4REVvdmFnNHVwNGVlS3kvMGIwTHpIaWEw?=
 =?utf-8?B?ZmdtMVM1SHRra3gwRnk5WW11SzNieGNBMVhmdGZldzkwMXArZVdkSUJhQnhZ?=
 =?utf-8?B?QXQ2eFpJS0tUcVlSd2JIRTdtbDJocnRvdEZ3OWJOTGZQN3NoRGNMUmVjODRD?=
 =?utf-8?B?RGIxWGp6MGROZjg0emF3MDBqemMwYzhWeXVZSFpvNEFvc2N5TnBwYTk5UXg3?=
 =?utf-8?B?MWJjWGFjL2dLMi9uSGVTNldabk81OFBZS2ZaUHd3RVFaSnMycm4yQ1ltZjJk?=
 =?utf-8?B?Y0RpTllRc0VYVnBqVEdJVXlhZmRWeTRwNFJlZDNnTEV2ZkFIMkh3SWZ1d1lk?=
 =?utf-8?B?ZXU0cW5HcEdHckYzNWNCbURGTm1ORFd0blZwd1VuUFFlRHlwbG10SWZENFJn?=
 =?utf-8?B?WHBTU1hkcEJnV3d6N0NPc2F3SnN2dW4xODlZc1JIWmxxanpLNjkwTTd3NG9h?=
 =?utf-8?B?ZVVCZ1RZRWROUnVnaGIwOG8vZ201S0czNkIwZ0ZpOW8weXFKQkwvVXV2ZFUr?=
 =?utf-8?B?ZWJJbGhTMWhFTGtLOWV6UWhLbzFjUHhMMTdWdkN5ZVNaZGF3clBLZFZEOGQ5?=
 =?utf-8?B?R2gyV1pscEJrMXpiZktWdzVsWWYxcFRQQ0Vrb3I2aGl5YTJSMUJKWXQ4U2E3?=
 =?utf-8?B?S3dSM2JDM3N5QVlNcjl4bjFWRXlPVHZCeDRKQjdSVnJHVnFmYzJ1Sk5yRkVp?=
 =?utf-8?B?QlhXZEVwWHdaRSs2T3lDQ1E1S2VJaGlSUDhNd3JIbkhORFpCMWFtRFQ2RXRQ?=
 =?utf-8?B?NCtQRmNMVnBrNFJWcDdVTWJaVitHOXNXWlZPOXZQUDZhUExsK2h6eEd4bFlN?=
 =?utf-8?B?cENhT3JhRk5nb3dHR1gvcXlMWk1VZG9VdFdLaUZWQVdpNkdEeG1RSmdOSzhD?=
 =?utf-8?B?aERaWGVHVjF4emVpTjlWOEx6eGxyN0R2MW00bmNhY0VPb0pteXFxMVhkbnVW?=
 =?utf-8?B?akJoaUJSQW1PZldqM1RzZ3NpRGRPNHpxYllGRDVkb0RLOTdraFlQU25zMytl?=
 =?utf-8?B?empocExTRjl6bVBNUzZsN0VaVjFDTmMrdUVYMXNEeVkvaGFjL2ozdVVURnRz?=
 =?utf-8?B?NjVUV01IS0M0QVFuQlJFKzdpTzJIOVpralpoYWhPTlRqWThtc0JmdXhvalcw?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55de42ca-abc1-4502-264e-08daa05a48fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 07:31:25.8019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZQ2jSiXysbxQWxFT1Kqir6USnVYwADJVfa4KLXWm3BOBRo+hfHs0Pr6xlZk+X77wnlrO/QCS9CHO60Y0vgp+N/pUI/0I9mSnrcPvgrA4AM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8181
X-Proofpoint-ORIG-GUID: OeWmFzlPL1P5GRe5AxveWuqBo-wMqEdz
X-Proofpoint-GUID: OeWmFzlPL1P5GRe5AxveWuqBo-wMqEdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270043
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
Cc: "dianders@chromium.org" <dianders@chromium.org>,
 "vpolimer@quicinc.com" <vpolimer@quicinc.com>,
 Abhinav Kumar <abhinavk@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "kalyant@quicinc.com" <kalyant@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAy
NiwgMjAyMiAyOjExIFBNDQo+IFRvOiBWaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1aWNfdnBvbGlt
ZXJAcXVpY2luYy5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGlu
dXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyByb2JkY2xhcmtAZ21haWwuY29tOw0KPiBkaWFuZGVyc0BjaHJvbWl1bS5v
cmc7IHZwb2xpbWVyQHF1aWNpbmMuY29tOyBzd2JveWRAY2hyb21pdW0ub3JnOw0KPiBrYWx5YW50
QHF1aWNpbmMuY29tDQo+IFN1YmplY3Q6IFJlOiBbdjJdIGRybS9tc206IGFkZCBudWxsIGNoZWNr
cyBmb3IgZHJtIGRldmljZSB0byBhdm9pZCBjcmFzaA0KPiBkdXJpbmcgcHJvYmUgZGVmZXINCj4g
DQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNv
bW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRv
IG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4gT24gMTUvMDYvMjAyMiAxNToyMywgRG1pdHJ5IEJh
cnlzaGtvdiB3cm90ZToNCj4gPiBPbiAwMy8wNi8yMDIyIDEyOjQyLCBWaW5vZCBQb2xpbWVyYSB3
cm90ZToNCj4gPj4gRHVyaW5nIHByb2JlIGRlZmVyLCBkcm0gZGV2aWNlIGlzIG5vdCBpbml0aWFs
aXplZCBhbmQgYW4gZXh0ZXJuYWwNCj4gPj4gdHJpZ2dlciB0byBzaHV0ZG93biBpcyB0cnlpbmcg
dG8gY2xlYW4gdXAgZHJtIGRldmljZSBsZWFkaW5nIHRvIGNyYXNoLg0KPiA+PiBBZGQgY2hlY2tz
IHRvIGF2b2lkIGRybSBkZXZpY2UgY2xlYW51cCBpbiBzdWNoIGNhc2VzLg0KPiA+Pg0KPiA+PiBC
VUc6IHVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2
aXJ0dWFsDQo+ID4+IGFkZHJlc3MgMDAwMDAwMDAwMDAwMDBiOA0KPiA+Pg0KPiA+PiBDYWxsIHRy
YWNlOg0KPiA+Pg0KPiA+PiBkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bisweDQ0LzB4MTQ0DQo+
ID4+IG1zbV9wZGV2X3NodXRkb3duKzB4MmMvMHgzOA0KPiA+PiBwbGF0Zm9ybV9zaHV0ZG93bisw
eDJjLzB4MzgNCj4gPj4gZGV2aWNlX3NodXRkb3duKzB4MTU4LzB4MjEwDQo+ID4+IGtlcm5lbF9y
ZXN0YXJ0X3ByZXBhcmUrMHg0MC8weDRjDQo+ID4+IGtlcm5lbF9yZXN0YXJ0KzB4MjAvMHg2Yw0K
PiA+PiBfX2FybTY0X3N5c19yZWJvb3QrMHgxOTQvMHgyM2MNCj4gPj4gaW52b2tlX3N5c2NhbGwr
MHg1MC8weDEzYw0KPiA+PiBlbDBfc3ZjX2NvbW1vbisweGEwLzB4MTdjDQo+ID4+IGRvX2VsMF9z
dmNfY29tcGF0KzB4MjgvMHgzNA0KPiA+PiBlbDBfc3ZjX2NvbXBhdCsweDIwLzB4NzANCj4gPj4g
ZWwwdF8zMl9zeW5jX2hhbmRsZXIrMHhhOC8weGNjDQo+ID4+IGVsMHRfMzJfc3luYysweDFhOC8w
eDFhYw0KPiA+Pg0KPiA+PiBDaGFuZ2VzIGluIHYyOg0KPiA+PiAtIEFkZCBmaXhlcyB0YWcuDQo+
ID4+DQo+ID4+IEZpeGVzOiA2MjNmMjc5Yzc3OCAoImRybS9tc206IGZpeCBzaHV0ZG93biBob29r
IGluIGNhc2UgR1BVDQo+IGNvbXBvbmVudHMNCj4gPj4gZmFpbGVkIHRvIGJpbmQiKQ0KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9saW1lckBxdWljaW5jLmNvbT4N
Cj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgfCA2ICsrKysr
LQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jDQo+
ID4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMNCj4gPj4gaW5kZXggNDQ0ODUzNi4u
ZDYyYWM2NiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMN
Cj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMNCj4gPj4gQEAgLTE0Miw2
ICsxNDIsOSBAQCBzdGF0aWMgdm9pZCBtc21faXJxX3VuaW5zdGFsbChzdHJ1Y3QgZHJtX2Rldmlj
ZQ0KPiAqZGV2KQ0KPiA+PiAgICAgICBzdHJ1Y3QgbXNtX2RybV9wcml2YXRlICpwcml2ID0gZGV2
LT5kZXZfcHJpdmF0ZTsNCj4gPj4gICAgICAgc3RydWN0IG1zbV9rbXMgKmttcyA9IHByaXYtPmtt
czsNCj4gPj4gKyAgICBpZiAoIWlycV9oYXNfYWN0aW9uKGttcy0+aXJxKSkNCj4gPj4gKyAgICAg
ICAgcmV0dXJuOw0KPiA+DQo+ID4gQXMgYSBzZWNvbmQgdGhvdWdodCBJJ2Qgc3RpbGwgcHJlZmVy
IGEgdmFyaWFibGUgaGVyZS4gaXJxX2hhc19hY3Rpb24NCj4gPiB3b3VsZCBjaGVjayB0aGF0IHRo
ZXJlIGlzIF9hbnlfIElSUSBoYW5kbGVyIGZvciB0aGlzIElSUS4gV2hpbGUgd2UgZG8NCj4gPiBu
b3QgaGF2ZSBhbnlib2R5IHNoYXJpbmcgdGhpcyBJUlEsIEknZCBwcmVmZXIgdG8gYmUgY2xlYXIg
aGVyZSwgdGhhdCB3ZQ0KPiA+IGRvIG5vdCB3YW50IHRvIHVuaW5zdGFsbCBvdXIgSVJRIGhhbmRs
ZXIgcmF0aGVyIHRoYW4gYW55IElSUSBoYW5kbGVyLg0KPiANCj4gVmlub2QsIGRvIHdlIHN0aWxs
IHdhbnQgdG8gcHVyc3VlIHRoaXMgZml4PyBJZiBzbywgY291bGQgeW91IHBsZWFzZQ0KPiB1cGRh
dGUgaXQgYWNjb3JkaW5nIHRvIHRoZSBjb21tZW50Lg0KPg0KSSBoYXZlIGxvb2tlZCB1cCBhbmQg
Zm91bmQgbWFueSBrZXJuZWwgZHJpdmVycyBhcmUgdXNpbmcgSXJxX2hhc19hY3Rpb24gdG8gc2Vl
IGlmIHRoZSBpbnRlcnJ1cHQgaXMgcmVxdWVzdGVkLCBpdCBhcHBlYXJzIHRvIG1lIGFzIGFuIGFn
Z3JlZ2FibGUgd2F5IG9mIGRvaW5nIGl0LiBIYXZpbmcgYSB2YXJpYWJsZSB0byB0cmFjayB0aGUg
c3RhdGUgc2VlbXMgdW5uZWNlc3NhcnkgYXMgaXQgbmVlZHMgdG8gYmUgbWFuYWdlZCByYWNlIGZy
ZWUuIGxldCBtZSBrbm93IHlvdXIgdmlld3Mgb24gaXQuDQo+ID4NCj4gPj4gKw0KPiA+PiAgICAg
ICBrbXMtPmZ1bmNzLT5pcnFfdW5pbnN0YWxsKGttcyk7DQo+ID4+ICAgICAgIGlmIChrbXMtPmly
cV9yZXF1ZXN0ZWQpDQo+ID4+ICAgICAgICAgICBmcmVlX2lycShrbXMtPmlycSwgZGV2KTsNCj4g
Pj4gQEAgLTI1OSw2ICsyNjIsNyBAQCBzdGF0aWMgaW50IG1zbV9kcm1fdW5pbml0KHN0cnVjdCBk
ZXZpY2UgKmRldikNCj4gPj4gICAgICAgZGRldi0+ZGV2X3ByaXZhdGUgPSBOVUxMOw0KPiA+PiAg
ICAgICBkcm1fZGV2X3B1dChkZGV2KTsNCj4gPj4gKyAgICBwcml2LT5kZXYgPSBOVUxMOw0KPiA+
PiAgICAgICBkZXN0cm95X3dvcmtxdWV1ZShwcml2LT53cSk7DQo+ID4+IEBAIC0xMTY3LDcgKzEx
NzEsNyBAQCB2b2lkIG1zbV9kcnZfc2h1dGRvd24oc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gPj4gICAgICAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+PiAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0g
cHJpdiA/IHByaXYtPmRldiA6IE5VTEw7DQo+ID4+IC0gICAgaWYgKCFwcml2IHx8ICFwcml2LT5r
bXMpDQo+ID4+ICsgICAgaWYgKCFwcml2IHx8ICFwcml2LT5rbXMgfHwgIWRybSkNCj4gPj4gICAg
ICAgICAgIHJldHVybjsNCj4gPj4gICAgICAgZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oZHJt
KTsNCj4gPg0KPiA+DQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0KDQot
IFZpbm9kIFAuDQoNCg==
