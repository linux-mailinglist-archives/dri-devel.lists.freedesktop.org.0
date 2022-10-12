Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052065FC4A4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A61110E3E4;
	Wed, 12 Oct 2022 12:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038B810E3E4;
 Wed, 12 Oct 2022 12:01:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CBdVXa018209;
 Wed, 12 Oct 2022 12:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=xmOcjWcmYFeIOFAL20B4gK1vUDwcZrLKPOvWCBNAHDY=;
 b=meEJkLh+wd1rVvCo+AUFfpgFU/Jy10ICxvpO2cnwM9uTkkbteACbiN/aNeqFQgtdrA91
 ZasNm3NUjhpe7RaSrN53tBckUwDzQFCt8gLYNBy8pFswplq2hWXzpGoUfw9M1bvyWDgL
 lVY3DDXb1sS+bYjwYUnIIxgUPc3bqRrK7gdeUXYKeQmwUMGpsKJ9ydRUSqrZvEOcBq3P
 jVpTj8ILiZAb1lgFcQDDCz28kl5mPFlN6wHK4vdz7wQU0g2ah01WQCMfI5VsHh6QLIpM
 R0MWLIJttC77FnvRCrXjGbyJtf4hQeiayRUonitgbMoJPD2NT/gJs9wLA5fa5c9WDNqu dQ== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5eh31wt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/4flFDlO58/60vZATdg/AxTdE5EOOoellDEG7OEA3lEYg+AmIPrwL3jYu0+7HTuYUTRXnvuuelZ/lb7ZeLbsm/gZbXAHS5mdBgWC7xavpZxTUjBz/Dz5qgt7jr14U1TR536nT1NYEx5mvT2TTyDJmobzJ+dtygvxHsW1c2UiIQjokUZRPPqsFNdjkLXuSxkd45Dp3c66iQUq67MtrjIXu9RCmyhugkwfTMbJjOICrHrkeoATnCYe0m6P9j1FYwpAdaUxGbLTT3qlSknFyIet6ttHZHQuvlBSUc9smSFS3SvR2+AEk4c0XTISo6+OlEW230+padCQakpjsrI7m2tXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmOcjWcmYFeIOFAL20B4gK1vUDwcZrLKPOvWCBNAHDY=;
 b=h4ZPbXOo+0SaHG94QbBodiG7/SXmSisOYlg+rT/vVC0dR8WGPC6ZMc+QY7CONYiVH9uJRLdgASLXFWGpAFDCHu59OPqgNfuzWINj7ZH9GR5c80l39XpytTWso0YeuVwcqo4Q5rdPjUbjMwen65wlPBJcXxVH00e1g6cWq1JFXmkZFNRPSGXjVF6RA7IGmyF72ImeGV5M5peVxAF/w7Ojres0wJiuFLtNDJA/9Kx0DubXMQbcG7t39j2FYyNLtGYeiDkHzhVQIGBOvlyg8ZZrJP70sguNGyoosUhskt9TX+buJpAHDmtXTGTD9z3A8VkpOSHtvyS+lq5xMkgeLkrpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by SJ0PR02MB7117.namprd02.prod.outlook.com (2603:10b6:a03:2a1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 12:01:21 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e6e5:a4bb:f98a:9be6]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e6e5:a4bb:f98a:9be6%2]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 12:01:20 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v7 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Topic: [PATCH v7 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Index: AQHYx4BcwOHxJwdFT0u3tQ+R97Vh2K3dltyAgAAAN4CALT4L8A==
Date: Wed, 12 Oct 2022 12:01:20 +0000
Message-ID: <BN0PR02MB8173A8C4775B8B96798C172FE4229@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
 <1663080676-12936-2-git-send-email-quic_vpolimer@quicinc.com>
 <fc45b986-99ae-b63d-9ed4-0ca622b16a8f@linaro.org>
 <8fcfaf60-6886-bd6b-67a5-0f42b967a6fa@linaro.org>
In-Reply-To: <8fcfaf60-6886-bd6b-67a5-0f42b967a6fa@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|SJ0PR02MB7117:EE_
x-ms-office365-filtering-correlation-id: 73feb1ec-aa4b-4809-fb5d-08daac497a34
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /+1bxxkrtY8Yx7o5iUeaSwwu6y8uWIpEldbVWk9h0HDMiBVGACGzDkh1NVtYsJeQ2OP5z5l81ZnsExtI21wpIXHs0eGIjUs04fyNwWqfn/eRYIvcgL5miXSd3kFHff621JakoJAtEEIx8a2J2LnAEDQbssoAv/WSi+2dKw8tXqE9j+qVcd5LQ4Ts6vmD5KlYcXG/73wTE6BeK2dj6KxNx0E0PUqEKwbvRwu81CYaocGgAYmpfkmgsLEedlznNnokI8rnMkNHCzayFvXE7BXqxtpbFu+citS2PGTUooxw44N3WQA8Vm9a/l5nwyMcgIaQogPILB4lbwGltd460nC61wgut597jeoyQl/E6UdjqWCDe6zlbOQmsVP7NtuImoyA+j1PAqcYGMwWDIWORMnBltENm2VdOs0Yagli9jFljmtYMQxi8XYbhWGu6BXzkG9SSi+ir8UQO4Fceq9dlN958dWgTeRL3Rdws9AF1C13AiotfUK/LArdsoHGzmyfnxLcdq7FRTyDYSw/YZA4qE9x2m8BYFqJt5TxfagbsIHdoA3pxxADTJKAUXHMAxEo5w4/R/OdCb96ZihOJSJXWkVC9vZWnbYArt0V0congF2K6XV7+sAtWiQfvMuEMiIyWRNrBUw2ZKDYd+LSphS/gFJmUr90kQWTMtPmn/KasR2QTfUyl2ZghcjX8HBYaQJc75CprBPg0ELLjkCv5h6JQlXwSGw5g28CYwF7s32txRoLC2EMZkOw8Nk7GEpojSNdaAk8UdnoBHcqBCVf6z5YWy9yxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199015)(55016003)(38070700005)(71200400001)(33656002)(38100700002)(122000001)(54906003)(86362001)(8676002)(110136005)(66476007)(8936002)(2906002)(316002)(64756008)(66446008)(66556008)(41300700001)(4326008)(76116006)(66946007)(83380400001)(7696005)(478600001)(6506007)(5660300002)(52536014)(186003)(107886003)(53546011)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTEySStiZmJRQnhQbjEyQVhOMk5VZDB4cGVXK09iRndCWXFmd0FMTVVWNEZV?=
 =?utf-8?B?TFZmRVc1SlNlenVkZlo1azlMQVovWXpla3NCd2tIc0MveTVvakVVL3VIV3pu?=
 =?utf-8?B?WEJuM2NaZmdSRitsR3ZTaGd5QXFjTzV2ZFRJR2NVS0R1b3dvQy8zQVp1ZmVu?=
 =?utf-8?B?WThvUkRoNG5xd3h5TVQyT3R3c3J4OVVmcHh1TFhGTm9YWlhlTzZYR3BweDh1?=
 =?utf-8?B?Q3hIa25yd1hEdy9tU3diZHlIc1lSQVM2c1Mra2pOMkVCd08xOFphWC9hb0FS?=
 =?utf-8?B?T2lLWnl0a2o0VzBGd0o4aWxZeFVWTDNJMTRtQlZGcFhTYXd5MXpKeGdYM0kx?=
 =?utf-8?B?MFlnMzA1bENqM2t6MVdqaWRSUmVPV3NENjlqSDM2aWo0RXdJVXZLSFI2eXNY?=
 =?utf-8?B?MldLN3FOM1ZwWHlDNGZTWHIzQVl4dWxvNlhqSDg5WGIwdlppdkJJNitGWWRw?=
 =?utf-8?B?TFZsWGV1V1FkNGtlYXdSYUU3aThBRjk0UjJCR04zUlh3VktPRlRvSUx5YlZB?=
 =?utf-8?B?YmVqTktnMUJtaTBjNkE4b080dkhRZDZGa3NiMWxFNEZUUUs1bjV5SlBXcG85?=
 =?utf-8?B?NEt3UEFjNzVXTTZwc0VwaEZFMXcwTmIwamEvZitGOFVaYnVxUXhaQ1hFU21n?=
 =?utf-8?B?d1ZZSWFoTlBFeE5vcW9RYlpyakhvMjNRci9SckhCMUxvQ3RBWVI2VzNMWUZs?=
 =?utf-8?B?and6OElQU1AxK3c1dmEyWEUweFBKREFmVFlwcUtsVGdzb2RIaHVwZ2YwM3hs?=
 =?utf-8?B?Vk9rajB5bHdCMXBzdnlMR1RieW1yb1FMbzlPWjRkQ21iN1ZrVVNGZ2FhT2lF?=
 =?utf-8?B?Wnh6YnBvaTgwVlJROFVpWExjdnVwUVg4OGFqVnNiMjI2NWZOZTFHdnQ5aFVV?=
 =?utf-8?B?Y1lBeTdHUmJRVDR6dURjaWZMUVJDZ3VNZkprcHl1TEx4ZEVQTVBuOUM3TWk4?=
 =?utf-8?B?TFErTHJtMDl1QWNpMXU0NU43SzVaNnVyYVVvczNSUVNXS2VuVzkySktHeTk4?=
 =?utf-8?B?V1lML25IMkE1Zlg2V3ZJeTM4V2ZkTjVCRlR4U09xcFdsczJsSlp3NXVTUjcr?=
 =?utf-8?B?OUlFTm01dmhHekpmS2F6N2NsL3FvcEt2LzdKZjBkdjlDUWdrdWgza2FEZGpp?=
 =?utf-8?B?K0xSTmlmUlE2QWZOck9qY3N1U3RhVWpYQjQ0TTN5V3FFNjZrZmFSY2J0V2JP?=
 =?utf-8?B?YWFOV0dSck5TWTRmMWVlTHVCWG44RDZncjc0V05IVmJYRnFYVUZYM0owcWFE?=
 =?utf-8?B?R2NtclZjbG9vMWNOeG0zRi9waE90ZldOWXRtWjJFZVA3cDhpblZmbEVjVWUx?=
 =?utf-8?B?RkUrYW1sdXZDYks3VGxHb0VjZ24rTzl1Tmp6Vmx1cVNESFkxbkthL0tvejJq?=
 =?utf-8?B?dzJCaWtVc2ZVbnZ4Q1pnVFl6SjQvZUU4UUdDempPaVErNlJqdkh6dnpLUGkr?=
 =?utf-8?B?S1ZXd0IvVXR4dm5YcUpaWFh0eGlvOW5wUjBHTTVrT3pKN0kzbVF5Uk1aYVdP?=
 =?utf-8?B?TE1wUUdYcHg1MnpDck9jdndmT0NCajRVRkZUK0RWTmhkb1V3UWh0L3A3ci92?=
 =?utf-8?B?Qjg0SW00MnRVN3lzeDEyL0xjMFp6NVlUYU1JRDBEMG55dENmRFd1RThVSXkx?=
 =?utf-8?B?MFhPQ0RHMlZEeXJEaXZZOFB0SFh5di82aFdTc0xnZ0pjbzJ6bDB5NzJKVVdW?=
 =?utf-8?B?RVNiWU1pVVU3UVprWEZUSVFIclc1NjFITUhoUnRlWGRob0J5S3NHdG83SW9o?=
 =?utf-8?B?eng3c084U3JVSk5sOXhJVHpKb1NjdVlhTCtOMzRQdWRsS0xEK01pQ3NsazRF?=
 =?utf-8?B?elI3blFIY3FlS080YmV6MzF1WURWVHdOeFRlKzVoUGlLcXlEWHhkYWthcC9F?=
 =?utf-8?B?SDROZEM3QTEyOFM0T0UzWUJucGZWNnVFcWxKVm55dHIyRk0vekw1aUIxT29u?=
 =?utf-8?B?ZGJvS0J5YTZhVjFqTGZodFNPVitIUTBOeXJXUTZiOUtBRnhQeFBsblFXMW5D?=
 =?utf-8?B?QzZQTlhEWVFJWEdJYTVtaVhuQVg1RmtYQXhKMWtZNnZmRTNvaGtqbzVnOWJw?=
 =?utf-8?B?SWgxcE9ta05lS0p1NDVzdHozRHR3eXBZTStwbHZFeHRhaTlWTDRaTVA2Qytv?=
 =?utf-8?B?dENMWkdTbnkzS3A5MmJQQ0hHd2xiSlhCNEVOcVpmdUwyZGZmUFRVMzY3QUxP?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73feb1ec-aa4b-4809-fb5d-08daac497a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 12:01:20.9073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7AvEiWGCN2W0jIzfu959seQctvDFR24VZQN9zcpXGTn7PiHCbUm2XtnTqtXhWWbzQ1OJNhpEpjxt0GGyD4/sWS1FjWqxB4kdQYCyIQD7VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7117
X-Proofpoint-GUID: bc2y557dH-6JiFEC20KANuHNUJJiYQR3
X-Proofpoint-ORIG-GUID: bc2y557dH-6JiFEC20KANuHNUJJiYQR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_05,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120078
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1i
ZXIgMTMsIDIwMjIgMTA6MzYgUE0NCj4gVG86IFZpbm9kIFBvbGltZXJhIChRVUlDKSA8cXVpY192
cG9saW1lckBxdWljaW5jLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IHJvYmRjbGFya0BnbWFpbC5jb207DQo+IGRpYW5kZXJzQGNocm9t
aXVtLm9yZzsgc3dib3lkQGNocm9taXVtLm9yZzsgS2FseWFuIFRob3RhIChRVUlDKQ0KPiA8cXVp
Y19rYWx5YW50QHF1aWNpbmMuY29tPjsgS3VvZ2VlIEhzaWVoIChRVUlDKQ0KPiA8cXVpY19raHNp
ZWhAcXVpY2luYy5jb20+OyBWaXNobnV2YXJkaGFuIFByb2RkdXR1cmkgKFFVSUMpDQo+IDxxdWlj
X3Zwcm9kZHV0QHF1aWNpbmMuY29tPjsgQmpvcm4gQW5kZXJzc29uIChRVUlDKQ0KPiA8cXVpY19i
am9yYW5kZUBxdWljaW5jLmNvbT47IEFyYXZpbmQgVmVua2F0ZXN3YXJhbiAoUVVJQykNCj4gPHF1
aWNfYXJhdmluZGhAcXVpY2luYy5jb20+OyBBYmhpbmF2IEt1bWFyIChRVUlDKQ0KPiA8cXVpY19h
YmhpbmF2a0BxdWljaW5jLmNvbT47IFNhbmtlZXJ0aCBCaWxsYWthbnRpIChRVUlDKQ0KPiA8cXVp
Y19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAwMS8xNV0g
ZHJtL21zbS9kaXNwL2RwdTogY2xlYXIgZHB1X2Fzc2lnbl9jcnRjIGFuZA0KPiBnZXQgY3J0YyBm
cm9tIGNvbm5lY3RvciBzdGF0ZSBpbnN0ZWFkIG9mIGRwdV9lbmMNCj4gDQo+IFdBUk5JTkc6IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3
YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFj
cm9zLg0KPiANCj4gT24gMTMvMDkvMjAyMiAyMDowNCwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToN
Cj4gPiBPbiAxMy8wOS8yMDIyIDE3OjUxLCBWaW5vZCBQb2xpbWVyYSB3cm90ZToNCj4gPj4gVXBk
YXRlIGNydGMgcmV0cmlldmFsIGZyb20gZHB1X2VuYyB0byBkcHVfZW5jIGNvbm5lY3RvciBzdGF0
ZSwNCj4gPj4gc2luY2UgbmV3IGxpbmtzIGdldCBzZXQgYXMgcGFydCBvZiB0aGUgZHB1IGVuYyB2
aXJ0IG1vZGUgc2V0Lg0KPiA+PiBUaGUgZHB1X2VuYy0+Y3J0YyBjYWNoZSBpcyBubyBtb3JlIG5l
ZWRlZCwgaGVuY2UgY2xlYW5pbmcgaXQgYXMNCj4gPj4gcGFydCBvZiB0aGlzIGNoYW5nZS4NCj4g
Pj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVp
Y2luYy5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9jcnRjLmMgICAgfMKgIDQgLS0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9lbmNvZGVyLmMgfCAzNQ0KPiA+PiArKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmgg
fMKgIDggLS0tLS0tLQ0KPiA+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MzMgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2NydGMuYw0KPiA+PiBpbmRleCAxM2NlMzIxLi44ZWM5YTEzIDEwMDY0NA0KPiA+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPj4gQEAgLTEw
MjksNyArMTAyOSw2IEBAIHN0YXRpYyB2b2lkIGRwdV9jcnRjX2Rpc2FibGUoc3RydWN0IGRybV9j
cnRjDQo+ICpjcnRjLA0KPiA+PiAgICAgICAgICAgICovDQo+ID4+ICAgICAgICAgICBpZiAoZHB1
X2VuY29kZXJfZ2V0X2ludGZfbW9kZShlbmNvZGVyKSA9PSBJTlRGX01PREVfVklERU8pDQo+ID4+
ICAgICAgICAgICAgICAgcmVsZWFzZV9iYW5kd2lkdGggPSB0cnVlOw0KPiA+PiAtICAgICAgICBk
cHVfZW5jb2Rlcl9hc3NpZ25fY3J0YyhlbmNvZGVyLCBOVUxMKTsNCj4gPj4gICAgICAgfQ0KPiA+
PiAgICAgICAvKiB3YWl0IGZvciBmcmFtZV9ldmVudF9kb25lIGNvbXBsZXRpb24gKi8NCj4gPj4g
QEAgLTEwOTksOSArMTA5OCw2IEBAIHN0YXRpYyB2b2lkIGRwdV9jcnRjX2VuYWJsZShzdHJ1Y3Qg
ZHJtX2NydGMNCj4gKmNydGMsDQo+ID4+ICAgICAgIHRyYWNlX2RwdV9jcnRjX2VuYWJsZShEUk1J
RChjcnRjKSwgdHJ1ZSwgZHB1X2NydGMpOw0KPiA+PiAgICAgICBkcHVfY3J0Yy0+ZW5hYmxlZCA9
IHRydWU7DQo+ID4+IC0gICAgZHJtX2Zvcl9lYWNoX2VuY29kZXJfbWFzayhlbmNvZGVyLCBjcnRj
LT5kZXYsDQo+ID4+IGNydGMtPnN0YXRlLT5lbmNvZGVyX21hc2spDQo+ID4+IC0gICAgICAgIGRw
dV9lbmNvZGVyX2Fzc2lnbl9jcnRjKGVuY29kZXIsIGNydGMpOw0KPiA+PiAtDQo+ID4+ICAgICAg
IC8qIEVuYWJsZS9yZXN0b3JlIHZibGFuayBpcnEgaGFuZGxpbmcgKi8NCj4gPj4gICAgICAgZHJt
X2NydGNfdmJsYW5rX29uKGNydGMpOw0KPiA+PiAgIH0NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4gPj4gYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+ID4+IGluZGV4IDljNjgxN2IuLjBj
N2Q4YjUgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9lbmNvZGVyLmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYw0KPiA+PiBAQCAtMTMyLDExICsxMzIsNiBAQCBlbnVtIGRwdV9lbmNfcmNfc3Rh
dGVzIHsNCj4gPj4gICAgKiBAaW50ZnNfc3dhcHBlZDogICAgV2hldGhlciBvciBub3QgdGhlIHBo
eXNfZW5jIGludGVyZmFjZXMgaGF2ZQ0KPiA+PiBiZWVuIHN3YXBwZWQNCj4gPj4gICAgKiAgICAg
ICAgICAgIGZvciBwYXJ0aWFsIHVwZGF0ZSByaWdodC1vbmx5IGNhc2VzLCBzdWNoIGFzIHBpbmdw
b25nDQo+ID4+ICAgICogICAgICAgICAgICBzcGxpdCB3aGVyZSB2aXJ0dWFsIHBpbmdwb25nIGRv
ZXMgbm90IGdlbmVyYXRlIElSUXMNCj4gPj4gLSAqIEBjcnRjOiAgICAgICAgUG9pbnRlciB0byB0
aGUgY3VycmVudGx5IGFzc2lnbmVkIGNydGMuIE5vcm1hbGx5IHlvdQ0KPiA+PiAtICogICAgICAg
ICAgICB3b3VsZCB1c2UgY3J0Yy0+c3RhdGUtPmVuY29kZXJfbWFzayB0byBkZXRlcm1pbmUgdGhl
DQo+ID4+IC0gKiAgICAgICAgICAgIGxpbmsgYmV0d2VlbiBlbmNvZGVyL2NydGMuIEhvd2V2ZXIg
aW4gdGhpcyBjYXNlIHdlIG5lZWQNCj4gPj4gLSAqICAgICAgICAgICAgdG8gdHJhY2sgY3J0YyBp
biB0aGUgZGlzYWJsZSgpIGhvb2sgd2hpY2ggaXMgY2FsbGVkDQo+ID4+IC0gKiAgICAgICAgICAg
IF9hZnRlcl8gZW5jb2Rlcl9tYXNrIGlzIGNsZWFyZWQuDQo+ID4+ICAgICogQGNvbm5lY3Rvcjog
ICAgICAgIElmIGEgbW9kZSBpcyBzZXQsIGNhY2hlZCBwb2ludGVyIHRvIHRoZSBhY3RpdmUNCj4g
Pj4gY29ubmVjdG9yDQo+ID4+ICAgICogQGNydGNfa2lja29mZl9jYjogICAgICAgIENhbGxiYWNr
IGludG8gQ1JUQyB0aGF0IHdpbGwgZmx1c2ggJiBzdGFydA0KPiA+PiAgICAqICAgICAgICAgICAg
ICAgIGFsbCBDVEwgcGF0aHMNCj4gPj4gQEAgLTE4MSw3ICsxNzYsNiBAQCBzdHJ1Y3QgZHB1X2Vu
Y29kZXJfdmlydCB7DQo+ID4+ICAgICAgIGJvb2wgaW50ZnNfc3dhcHBlZDsNCj4gPj4gLSAgICBz
dHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+ID4+ICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3I7DQo+ID4+ICAgICAgIHN0cnVjdCBkZW50cnkgKmRlYnVnZnNfcm9vdDsNCj4gPj4g
QEAgLTEyODgsNiArMTI4Miw3IEBAIHN0YXRpYyB2b2lkIGRwdV9lbmNvZGVyX3ZibGFua19jYWxs
YmFjayhzdHJ1Y3QNCj4gPj4gZHJtX2VuY29kZXIgKmRybV9lbmMsDQo+ID4+ICAgICAgICAgICBz
dHJ1Y3QgZHB1X2VuY29kZXJfcGh5cyAqcGh5X2VuYykNCj4gPj4gICB7DQo+ID4+ICAgICAgIHN0
cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVfZW5jID0gTlVMTDsNCj4gPj4gKyAgICBzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGM7DQo+ID4+ICAgICAgIHVuc2lnbmVkIGxvbmcgbG9ja19mbGFnczsNCj4g
Pj4gICAgICAgaWYgKCFkcm1fZW5jIHx8ICFwaHlfZW5jKQ0KPiA+PiBAQCAtMTI5OCw5ICsxMjkz
LDE0IEBAIHN0YXRpYyB2b2lkDQo+IGRwdV9lbmNvZGVyX3ZibGFua19jYWxsYmFjayhzdHJ1Y3QN
Cj4gPj4gZHJtX2VuY29kZXIgKmRybV9lbmMsDQo+ID4+ICAgICAgIGF0b21pY19pbmMoJnBoeV9l
bmMtPnZzeW5jX2NudCk7DQo+ID4+ICsgICAgaWYgKCFkcHVfZW5jLT5jb25uZWN0b3IgfHwgIWRw
dV9lbmMtPmNvbm5lY3Rvci0+c3RhdGUpDQo+ID4+ICsgICAgICAgIHJldHVybjsNCj4gPj4gKw0K
PiA+PiArICAgIGNydGMgPSBkcHVfZW5jLT5jb25uZWN0b3ItPnN0YXRlLT5jcnRjOw0KPiA+PiAr
DQo+ID4+ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkcHVfZW5jLT5lbmNfc3BpbmxvY2ssIGxv
Y2tfZmxhZ3MpOw0KPiA+PiAtICAgIGlmIChkcHVfZW5jLT5jcnRjKQ0KPiA+PiAtICAgICAgICBk
cHVfY3J0Y192YmxhbmtfY2FsbGJhY2soZHB1X2VuYy0+Y3J0Yyk7DQo+ID4+ICsgICAgaWYgKGNy
dGMpDQo+ID4+ICsgICAgICAgIGRwdV9jcnRjX3ZibGFua19jYWxsYmFjayhjcnRjKTsNCj4gPj4g
ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrLCBsb2Nr
X2ZsYWdzKTsNCj4gPg0KPiA+IFN0ZXBoZW4ncyBjb21tZW50IGFib3V0IHJlYWRpbmcgdGhlIHN0
YXRlIGZyb20gb3V0c2lkZSBvZiB0aGUgbG9jayBhbmQNCj4gPiB0aGVuIHVzaW5nIGxvY2FsIHZh
cmlhYmxlIHVuZGVyIHNwaW5sb2NrIGlzIHN0aWxsIHZhbGlkLiBNb3Jlb3ZlciBJJ20NCj4gPiBu
b3Qgc3VyZSB0aGF0IGVuY19zcGlubG9jayBwcm90ZWN0cyBjb25uZWN0b3IncyBzdGF0ZS4gSSdk
IHNheSBvbmUgaGFzDQo+ID4gdG8gdGFrZSB0aGUgbW9kZXNldHRpbmcgbG9jayBoZXJlLg0KPiAN
Cj4gcy9TdGVwaGVuJ3MvRG91ZydzLw0KQXMgdGhpcyBpcyBpbiBpbnRlcnJ1cHQgY29udGV4dCAs
IHdlIGNhbm5vdCB1c2UgbW9kZXNldCBsb2NrIGhlcmUgYW5kIGNvbm5lY3RvciBkb2VzIG5vdCBo
YXZlIHRoZSBzcGlubG9jayB0byBwcm90ZWN0IHN0YXRlLg0Kc2luY2Ugc3RhdGUgc3dhcCBoYXBw
ZW5zIGFmdGVyIGNvbW1pdCB0byBodyBkb25lLCB3aGljaCBpcyBhZnRlciB2YmxhbmsgcHJvY2Vz
c2luZywgaSB3YXMgdGhpbmtpbmcgaXQgc2hvdWxkIGJlIG9rYXkgdG8gZHJvcCB0aGUgc3Bpbmxv
Y2sgIHdoaWxlIGFjY2Vzc2luZyBjb25uZWN0b3Igc3RhdGUuDQpJIGhhdmUgdXBkYXRlZCB0aGUg
cGF0Y2ggd2l0aCB0aGUgY2hhbmdlcyBpbiB2OCwgcGxlYXNlIGRvIHJldmlldy4NCj4gDQo+IC0t
DQo+IFdpdGggYmVzdCB3aXNoZXMNCj4gRG1pdHJ5DQpUaGFua3MNClZpbm9kIFAuDQoNCg0KDQo=
