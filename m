Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893465B71D5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9997D10E749;
	Tue, 13 Sep 2022 14:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3641D10E738;
 Tue, 13 Sep 2022 14:53:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DDuajv023113;
 Tue, 13 Sep 2022 14:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=6hAdH1gm3FdKZDolU/MZQ+1+PiA3CcGCjvGd3n2G/CY=;
 b=fgakO4VFxnXLk00SpeplzYNj9OUfx8FRRN81l2sheBGfaN+HVs0bIeaDIWUrYa9OAz8Y
 fMOjUZq/FEzSV2KjKOAMW4YU1AMAORKN4lZDlSVc5EuuIq3FWg+aQ8Q3O7nBaFAJmsIm
 B/5xVCvmPc9lhaLBh3NcdorkP91wJGzDHB54HUkfuYeOsAyK4Nz++0PRdT2bKBNYS0Kh
 9SO/b/LT614+A9qzuZ5ieHK8rfOFRHbVoV6AEamk6Ynol9qJm8yH1iqTBM629OqmHk9u
 CgTTHLQ15I2XBWpsu6tNjwwIbcpN7QzUPEY0f7ciF2GpIZBzsH+Yw24Lw721OcXuzUG1 Sg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjnju9upg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 14:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig4jYwDj16Si0Tl6+UcDVpAqX3FyOtIU2xXnx+in2oSPNNsK8MnCc6UFtG8lcjnJyz0mTFQ22bsv9CJiRXHzPgrgxWsdz7omBHFpUK3IlHabwAKOo4NPWojfkz9VpZ0cjGs3Q5q5jAxdFlXYodEE97O3gEy2jmDWDA8pFfF4IvEcS79r8luY2Jipn7JEY9k0/FdjAG4TbrL7z7TF6Ib9w6wjf4yyqUVMMSgsnEwq5PgJhvU4yKj6gBudM3Ud59GGgT/el7L43Z97Cp50dJU2T+PWT7g6S7D0JXDUJ1s6+L0GO674TbXKFzNHbFGBTmvRA3qT2iJX7kAlsNtUfjAFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hAdH1gm3FdKZDolU/MZQ+1+PiA3CcGCjvGd3n2G/CY=;
 b=fTH/Es0+w0F56Vf1DZkCWZzDN0HCzq2MLtrJ9ZGKS02RxACBsc1hAEvrDngBBYfbPyDi5detneGjFtUN8nxLWnoeD1LTgVY+5lZTtUSE2wszNPl/HxU5K8+RfQaoILDgOb9VfgAYEx90iZc3e77kd5atCK/1rYydjM2zuf6Jyi2lckq6JWRirZrINgX3VHG3FLJ5irdJjbR9V3nfR0lK5Sr+S398qCpuwoOosUfeYM3FmQU/O7Q971b50QUq61Z4YlUAyhb9jUVFU65ANS2SFrtjvFtYT9ye+ux2X+nzv7bw8Ip14hV7K7UjfQIkyBXAdXcsYjn98Uo9MXkXP3R1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by PH0PR02MB8780.namprd02.prod.outlook.com (2603:10b6:510:f3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 14:52:56 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::6801:c07:e618:b195]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::6801:c07:e618:b195%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 14:52:56 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, "Vinod Polimera (QUIC)"
 <quic_vpolimer@quicinc.com>
Subject: RE: [PATCH v6 01/10] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Topic: [PATCH v6 01/10] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Index: AQHYlSXRWmdFe8sHw06OlQE5JVBCS62Ulw0AgEk/c0A=
Date: Tue, 13 Sep 2022 14:52:56 +0000
Message-ID: <BN0PR02MB81732A3672B07571BA346F80E4479@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=WW1BxjW9B9Vg99UOeTBePE32J++O24unnddecXXcaZ+Q@mail.gmail.com>
In-Reply-To: <CAD=FV=WW1BxjW9B9Vg99UOeTBePE32J++O24unnddecXXcaZ+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|PH0PR02MB8780:EE_
x-ms-office365-filtering-correlation-id: 75c1992d-0888-40c6-3943-08da9597a4db
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3IpbOSgZQVLU0ajecwG8lDodw9G0IWbZnrT3voFMS4DHYgT1tJTKeoOfvdqeIQK7jZ6ZVXb4BsBlspC3xHbmap4/YZupw7RlUd6rHRbWO+mVC3F/IYsy9GtRvbwljl/9CysVYKyLBHsz7/YzsQoXZkFOWM8DkvChfXfTKxYhKK+Zzeo1ejreXsh7E2TiQ6Ipy1R5qAd6sPk52y3Wojh7qPFcKZz0P1UuDEfGYXsoq3a5jocPmBmWjv0S+2rLgUsiK+xueB3FnksllUb3w8Vlct7bcp/J64hYWi2zAN4WDdAd0c+1TD+9RBidxOpRMkxW2eqV5tL+gRaFtGxhjAB9FD18msS4kBmU9Rn9YzaqXLyQlfytWQSMdkApWklSzYcUFapzoxpWRdfX7HqkiVzuzc7T6xvXLBNH8Geb6BNNWWNCgoXbs/okfnepoy7AdFsWE8sLACYqY9b1ME7v0fte9zsyF2ONEamsi+mRwFq+dbTI03zBRGAupYOOwe1xBrl3K8XQMxz0obQqMTKX4nhnu1KiHWcYAkiZPw9PuePxJd2Np0PZwQJTLd+2ZPXQlN1ksCRB9v4JdaUZjCkQt8HtdclRtMNylinOYDnb5vxQsM3+KGKZYx3mjMu09sLGVu2lql70JHh03K2iRo5NTVyOuYeV0FnT2VwqVgv5ESPBMKF3g3HgeQgZOyKeiT0zwFZpqKCHonAQdJmsSoWDbDdim77s0pDZqF7hTZ15VXZ54kMROurs/XMWYhCkuqsBtmU+HZ2NqtcEjRWPd/WVLUl+5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(66556008)(186003)(66476007)(8676002)(66446008)(71200400001)(52536014)(8936002)(5660300002)(107886003)(9686003)(316002)(76116006)(7416002)(478600001)(64756008)(6506007)(2906002)(55016003)(54906003)(110136005)(26005)(33656002)(4326008)(122000001)(38070700005)(83380400001)(66946007)(7696005)(38100700002)(41300700001)(86362001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWUva3A4N0VGSTFSN3UvcUNCVFdNbzlUcFA4bitNZ2huWDJXMEMzNGJEOExp?=
 =?utf-8?B?OStqT1N1bkVrZjZiTFR0WXdWdUFjZGFtVUVRcG4vMjJ5QnU2ZkZuQnJWSGZ5?=
 =?utf-8?B?ek1tMHRicmZSc2VEbzNXbzFHWUFRZ0F3aWRjNVZ3ekMxRGM5V0xCY1ZUd01I?=
 =?utf-8?B?a1BRUXNXeGVyYlhxOVd2Z3VVQVUrRWwvVmhJdFROYXczeHF4NkRmZmRpOSt5?=
 =?utf-8?B?ek81SFFzY3FoV2RiRmgrS3Y4aEx4S1BwNDVXTklUNGN1dGdLbzNqUWVVM2xV?=
 =?utf-8?B?M0o4THVEaHFRQ054YTRIOEg5S0EwTVhGOGMzQzB5R2tDTklRenFyMWtpbW1o?=
 =?utf-8?B?TXZqYjJjQk5lTHltU01OQ2VMbVV3R1B1VEFUbmI1NDhhYmEzTnFhYWllV0pP?=
 =?utf-8?B?SG42OUhSTGRlY3AxMUxPdGliSmZEb0g5bTNaTUF3Q2UvaEhISHMzVXh3RFVj?=
 =?utf-8?B?cU1PVEx3aG52VDJaOU5oL0IrL3NGczhsSEhSdWh4OFVyeUQzcUtZeFhjOU8v?=
 =?utf-8?B?WDk1YjlRR05rMGNVeWN6YllBOHVaQ3d3VHZmZ1ZzRmJ1SzVWWGdKVnlJY3F2?=
 =?utf-8?B?MFhWWXhJc3ErSmYwZW9YRzRUMysreHN3NDRGZUpFUG1LcCthLzRpV0lwRXpo?=
 =?utf-8?B?WEV5Wmx3QkcrQ0tuaDMzTnZiZ0IyVExySThFaTNlaG9oNlBiTFluU2gvcDVN?=
 =?utf-8?B?U3NndVhITFZwU3ZUSFVKWGtPZTQ0amNNZWZDdE80NlV4S25FTURURE9tQVdN?=
 =?utf-8?B?WW5haXhlWlNodldpMGp0N3FIeDdSK2RtZTFyN0dJT1J6N3FBVnh1aVlxM1lU?=
 =?utf-8?B?cmVBVDZHNi9GVmpvMmJYV2xPWlJOTHM1V2FFZzNYcmhyZkhlMjJYK2NvcEgv?=
 =?utf-8?B?T2ZEZ3NuWW9GVlZrWThwT003dTZpYTlYN2RWSFJ2aVF3dGlPZzQ4Q0pBUEw2?=
 =?utf-8?B?UEJkRTdmMFVQUEcxZXhYY2xRcWI3b0pwL25pYUZDc21nRnFHZjZVSkd3ZWVG?=
 =?utf-8?B?ajNYSFRjbUFQQmZDOGkwNEhVQWV4dlc3YmhGUy9sQnNDNGh6OXBCcW9lQUY1?=
 =?utf-8?B?Q09KbU0rL1RuNjVpbHlmMmlTVnVicXpYVFFYR1h2cms4U1pyOFpJeHlJN1Fm?=
 =?utf-8?B?dFhjWG5kRjdzQ1IzKy9DRHBoSS84aDZjVi9jMjBsazFLSVBpT2l2R0RoaXRy?=
 =?utf-8?B?dXRnekRjYVlqQ1hEcEhJa3F5NnhacGY4aytCL2N2VVB6Vk9laEZUc3BwZ0s5?=
 =?utf-8?B?Yzd0RDNSNXFmQmNEbWV4U2tEL2Q1MmErNkszNWpSa0lsS3dzUDl0ZW9rVG9R?=
 =?utf-8?B?NEtKbHorOEtRc2c4SWhkZkJNYUpCb0Fad0RxblFjdEFMRVh5MTNCMFNFUFdF?=
 =?utf-8?B?aWpCVWM4SFB2YVRxN0lDOTBhUTZZRTlzQU9pTVlyVkpGcXV3YjMzN09tdjl6?=
 =?utf-8?B?NzF6OVFZZFM2NVhMajRVV2JzRzBRZFlqNnE0UU9UQmZNZVFCc0VMbmxTMWN0?=
 =?utf-8?B?OHZqVEhwYTF6MU9Uei90TlRZYk05VzlBOXZuZjZkazJOcGpabzFxMUJwQ3pN?=
 =?utf-8?B?YUNxM01zVitBTUp5SWdkTHpmWUMwMGVuNXk3aEt4VVRKVkRVVEs1cXFWR3Zx?=
 =?utf-8?B?VEZyMWpzRzJpM2cxUnEvNDFqWE9DVDRGbkl1eHo2R3dTVjRuMEZnbWZUN2kv?=
 =?utf-8?B?TjRpTjN2NkFsV3ZGZ2dLeE9XV2J4T0g5Z0VadlA5Y0hVcWlVV2dtdHRXeStk?=
 =?utf-8?B?cEt6S1B1K3ZrQUtxa0JjMjdyRFpKd1hHQ0U3MXAwdUQ1R3VVU0VRb2QxUUdp?=
 =?utf-8?B?YnIxb1EzL0VMdU5ZK2Z4VTE0ckd2Zmk5TzZ6bmN1cFlJMlU3M1dUUXprdlZn?=
 =?utf-8?B?aUJtblQ5YktzM1d5N3VZd0RLdlZPS2RrM2ZaYVh0c1JVcVU5THFmMkhRODFx?=
 =?utf-8?B?NlB2N2NCVU9YdHVFck1hU3Y3dVpmMTNOMXM3SE9sWDZnWkxHaTNZeE4zc25Y?=
 =?utf-8?B?b0lXUFVXa3NyZEZmTGErTHROTGJiWmgvRS9wNXlvWmdrYzlPRDVTYTJjNWZ4?=
 =?utf-8?B?S1g3c25PRnBjQzBLSUJvYVFROURzNzYveEt6dXJnZXRsTzZIUmNSNnZ4SEtZ?=
 =?utf-8?B?T0NFNlFzUkMxRU9pUlJ0R21pUDYzdS9UbXNEM016bTFuYW1qRXowR2R1MW91?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c1992d-0888-40c6-3943-08da9597a4db
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 14:52:56.4308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W87jtui7S+pSBmiZDW4GSWfgqfzbUwTldYPBQ2VuMiqCq7S+alEh5PHJyCIJwmK/YzomzRyL9m9IJMCwiVC6wmHkM70oG+oDtsabfnrMQwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8780
X-Proofpoint-ORIG-GUID: WYrs8Jed2vyqwB4aNSMVCQrQJOD6oS97
X-Proofpoint-GUID: WYrs8Jed2vyqwB4aNSMVCQrQJOD6oS97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_07,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130067
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG91ZyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgMjksIDIwMjIgNTo0
OCBBTQ0KPiBUbzogVmlub2QgUG9saW1lcmEgKFFVSUMpIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMu
Y29tPg0KPiBDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsg
bGludXgtYXJtLW1zbSA8bGludXgtYXJtLQ0KPiBtc21Admdlci5rZXJuZWwub3JnPjsgZnJlZWRy
ZW5vIDxmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsNCj4gb3BlbiBsaXN0Ok9QRU4g
RklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUw0KPiA8ZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc+OyBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsg
Um9iDQo+IENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPjsgU3RlcGhlbiBCb3lkIDxzd2JveWRA
Y2hyb21pdW0ub3JnPjsNCj4gS2FseWFuIFRob3RhIChRVUlDKSA8cXVpY19rYWx5YW50QHF1aWNp
bmMuY29tPjsNCj4gZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnOyBLdW9nZWUgSHNpZWggKFFV
SUMpDQo+IDxxdWljX2toc2llaEBxdWljaW5jLmNvbT47IFZpc2hudXZhcmRoYW4gUHJvZGR1dHVy
aSAoUVVJQykNCj4gPHF1aWNfdnByb2RkdXRAcXVpY2luYy5jb20+OyBiam9ybi5hbmRlcnNzb25A
bGluYXJvLm9yZzsgQXJhdmluZA0KPiBWZW5rYXRlc3dhcmFuIChRVUlDKSA8cXVpY19hcmF2aW5k
aEBxdWljaW5jLmNvbT47IEFiaGluYXYgS3VtYXINCj4gKFFVSUMpIDxxdWljX2FiaGluYXZrQHF1
aWNpbmMuY29tPjsgU2Fua2VlcnRoIEJpbGxha2FudGkgKFFVSUMpDQo+IDxxdWljX3NiaWxsYWth
QHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzEwXSBkcm0vbXNtL2Rp
c3AvZHB1OiBjbGVhciBkcHVfYXNzaWduX2NydGMgYW5kDQo+IGdldCBjcnRjIGZyb20gY29ubmVj
dG9yIHN0YXRlIGluc3RlYWQgb2YgZHB1X2VuYw0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBv
cmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkNCj4gb2Yg
YW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0K
PiBIaSwNCj4gDQo+IE9uIE1vbiwgSnVsIDExLCAyMDIyIGF0IDU6NTcgQU0gVmlub2QgUG9saW1l
cmENCj4gPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVXBkYXRl
IGNydGMgcmV0cmlldmFsIGZyb20gZHB1X2VuYyB0byBkcHVfZW5jIGNvbm5lY3RvciBzdGF0ZSwN
Cj4gPiBzaW5jZSBuZXcgbGlua3MgZ2V0IHNldCBhcyBwYXJ0IG9mIHRoZSBkcHUgZW5jIHZpcnQg
bW9kZSBzZXQuDQo+ID4gVGhlIGRwdV9lbmMtPmNydGMgY2FjaGUgaXMgbm8gbW9yZSBuZWVkZWQs
IGhlbmNlIGNsZWFuaW5nIGl0IGFzDQo+ID4gcGFydCBvZiB0aGlzIGNoYW5nZS4NCj4gDQo+IEkg
ZG9uJ3Qga25vdyB0aGlzIGRyaXZlciB0ZXJyaWJseSB3ZWxsLCBidXQgX3doeV8gaXMgaXQgbm8g
bG9uZ2VyDQo+IG5lZWRlZD8gQWNjb3JkaW5nIHRvIHRoZSBrZXJuZWwtZG9jIGZvciB0aGUgImNy
dGMiIHZhcmlhYmxlIHlvdSdyZQ0KPiByZW1vdmluZyBpdCB3YXMgYmVjYXVzZSB3ZSB1c2VkIHRv
IG5lZWQgaXQgYWZ0ZXIgdGhlIGRpc2FibGUoKQ0KPiBjYWxsYmFjay4gTWF5YmUgdGhhdCdzIG5v
IGxvbmdlciB0aGUgY2FzZSBhZnRlciBjb21taXQgYTc5NmJhMmNiM2RkDQo+ICgiZHJtL21zbTog
ZHB1OiBTZXBhcmF0ZSBjcnRjIGFzc2lnbm1lbnQgZnJvbSB2YmxhbmsgZW5hYmxlIik/DQoNCmRy
bSBlbmNvZGVyIGFscmVhZHkgaGFzIGNydGMgYW5kIHRoZSBzYW1lIGxpbmsgaXMgY29waWVkIGlu
dG8gZHB1IGVuY29kZXIgd2hpY2ggYXBwZWFycyByZWR1bmRhbnQuIERtaXRyeSBhbHNvIHBvaW50
ZWQgb3V0IHRoZSBzYW1lIHRoaW5nIGluIGVhcmxpZXIgY29tbWVudHMuIEhlbmNlIGl0IHdhcyBy
ZW1vdmVkLg0KPiANCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNf
dnBvbGltZXJAcXVpY2luYy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9jcnRjLmMgICAgfCAgNCAtLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgfCAzMCArKysrKysrKysrKysrKy0NCj4gLS0tLS0t
LS0tLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIu
aCB8ICA4IC0tLS0tLS0tDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MjggZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2NydGMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9jcnRjLmMNCj4gPiBpbmRleCBiNTZmNzc3Li5mOTFlM2QxIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jDQo+ID4gQEAgLTk3Miw3ICs5NzIs
NiBAQCBzdGF0aWMgdm9pZCBkcHVfY3J0Y19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywN
Cj4gPiAgICAgICAgICAgICAgICAgICovDQo+ID4gICAgICAgICAgICAgICAgIGlmIChkcHVfZW5j
b2Rlcl9nZXRfaW50Zl9tb2RlKGVuY29kZXIpID09IElOVEZfTU9ERV9WSURFTykNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZWxlYXNlX2JhbmR3aWR0aCA9IHRydWU7DQo+ID4gLSAgICAg
ICAgICAgICAgIGRwdV9lbmNvZGVyX2Fzc2lnbl9jcnRjKGVuY29kZXIsIE5VTEwpOw0KPiA+ICAg
ICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICAvKiB3YWl0IGZvciBmcmFtZV9ldmVudF9kb25lIGNv
bXBsZXRpb24gKi8NCj4gPiBAQCAtMTA0Miw5ICsxMDQxLDYgQEAgc3RhdGljIHZvaWQgZHB1X2Ny
dGNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gPiAgICAgICAgIHRyYWNlX2RwdV9j
cnRjX2VuYWJsZShEUk1JRChjcnRjKSwgdHJ1ZSwgZHB1X2NydGMpOw0KPiA+ICAgICAgICAgZHB1
X2NydGMtPmVuYWJsZWQgPSB0cnVlOw0KPiA+DQo+ID4gLSAgICAgICBkcm1fZm9yX2VhY2hfZW5j
b2Rlcl9tYXNrKGVuY29kZXIsIGNydGMtPmRldiwgY3J0Yy0+c3RhdGUtDQo+ID5lbmNvZGVyX21h
c2spDQo+ID4gLSAgICAgICAgICAgICAgIGRwdV9lbmNvZGVyX2Fzc2lnbl9jcnRjKGVuY29kZXIs
IGNydGMpOw0KPiA+IC0NCj4gPiAgICAgICAgIC8qIEVuYWJsZS9yZXN0b3JlIHZibGFuayBpcnEg
aGFuZGxpbmcgKi8NCj4gPiAgICAgICAgIGRybV9jcnRjX3ZibGFua19vbihjcnRjKTsNCj4gPiAg
fQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5j
b2Rlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0K
PiA+IGluZGV4IDUyNTE2ZWIuLjBmZGRjOWQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4gPiBAQCAtMTgxLDcgKzE4MSw2IEBAIHN0
cnVjdCBkcHVfZW5jb2Rlcl92aXJ0IHsNCj4gPg0KPiA+ICAgICAgICAgYm9vbCBpbnRmc19zd2Fw
cGVkOw0KPiA+DQo+ID4gLSAgICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+IA0KPiBUaGlz
IHN0cnVjdHVyZSBpcyBkb2N1bWVudGVkIGJ5IGtlcm5lbC1kb2MuIFRoYXQgbWVhbnMgeW91IG5l
ZWQgdG8NCj4gcmVtb3ZlIHRoZSBkb2N1bWVudGF0aW9uIGZvciAiY3J0YyIuDQo+IA0KPiANCj4g
PiAgICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7DQo+ID4NCj4gPiAgICAg
ICAgIHN0cnVjdCBkZW50cnkgKmRlYnVnZnNfcm9vdDsNCj4gPiBAQCAtMTI0NSw2ICsxMjQ0LDcg
QEAgc3RhdGljIHZvaWQgZHB1X2VuY29kZXJfdmJsYW5rX2NhbGxiYWNrKHN0cnVjdA0KPiBkcm1f
ZW5jb2RlciAqZHJtX2VuYywNCj4gPiAgICAgICAgICAgICAgICAgc3RydWN0IGRwdV9lbmNvZGVy
X3BoeXMgKnBoeV9lbmMpDQo+ID4gIHsNCj4gPiAgICAgICAgIHN0cnVjdCBkcHVfZW5jb2Rlcl92
aXJ0ICpkcHVfZW5jID0gTlVMTDsNCj4gPiArICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsN
Cj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG9ja19mbGFnczsNCj4gPg0KPiA+ICAgICAgICAg
aWYgKCFkcm1fZW5jIHx8ICFwaHlfZW5jKQ0KPiA+IEBAIC0xMjUzLDkgKzEyNTMsMTQgQEAgc3Rh
dGljIHZvaWQgZHB1X2VuY29kZXJfdmJsYW5rX2NhbGxiYWNrKHN0cnVjdA0KPiBkcm1fZW5jb2Rl
ciAqZHJtX2VuYywNCj4gPiAgICAgICAgIERQVV9BVFJBQ0VfQkVHSU4oImVuY29kZXJfdmJsYW5r
X2NhbGxiYWNrIik7DQo+ID4gICAgICAgICBkcHVfZW5jID0gdG9fZHB1X2VuY29kZXJfdmlydChk
cm1fZW5jKTsNCj4gPg0KPiA+ICsgICAgICAgaWYgKCFkcHVfZW5jLT5jb25uZWN0b3IgfHwgIWRw
dV9lbmMtPmNvbm5lY3Rvci0+c3RhdGUpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsNCj4g
DQo+IEZXSVc6IHlvdXIgcGF0Y2ggZG9lc24ndCBhcHBseSBjbGVhbmx5IHRvIG1zbS1uZXh0LiBJ
dCBjb25mbGljdHMgd2l0aA0KPiBjb21taXQgYzI4ZDc2ZDM2MGY5ICgiZHJtL21zbS9kcHU6IElu
Y3JlbWVudCB2c3luY19jbnQgYmVmb3JlIHdha2luZw0KPiB1cCB1c2Vyc3BhY2UiKS4NCj4gDQo+
IEkgc3VzcGVjdCB0aGF0IHlvdSdsbCB3YW50IHlvdXIgY2hhbmdlcyB0byBjb21lIF9hZnRlcl8g
dGhlIGluY3JlbWVudA0KPiAoQUtBIHlvdSB3YW50IHRvIGluY3JlbWVudCBldmVuIGlmIHRoZSBj
b25uZWN0b3IgaXMgTlVMTCksIGJ1dCBkdW5ubw0KPiBmb3Igc3VyZS4NCj4gDQo+IA0KPiA+ICsN
Cj4gPiArICAgICAgIGNydGMgPSBkcHVfZW5jLT5jb25uZWN0b3ItPnN0YXRlLT5jcnRjOw0KPiA+
ICsNCj4gPiAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkcHVfZW5jLT5lbmNfc3BpbmxvY2ss
IGxvY2tfZmxhZ3MpOw0KPiA+IC0gICAgICAgaWYgKGRwdV9lbmMtPmNydGMpDQo+ID4gLSAgICAg
ICAgICAgICAgIGRwdV9jcnRjX3ZibGFua19jYWxsYmFjayhkcHVfZW5jLT5jcnRjKTsNCj4gPiAr
ICAgICAgIGlmIChjcnRjKQ0KPiA+ICsgICAgICAgICAgICAgICBkcHVfY3J0Y192YmxhbmtfY2Fs
bGJhY2soY3J0Yyk7DQo+IA0KPiBFZmZlY3RpdmVseSB5b3UgYXJlIGNoZWNraW5nIGZvciBOVUxM
bmVzcyBhdCAzIGxldmVsczoNCj4gDQo+IDEuIGRwdV9lbmMtPmNvbm5lY3Rvcg0KPiAyLiBkcHVf
ZW5jLT5jb25uZWN0b3ItPnN0YXRlDQo+IDMuIGRwdV9lbmMtPmNvbm5lY3Rvci0+c3RhdGUtPmNy
dGMNCj4gDQo+IFlvdSBjaGVjayB0d28gb2YgdGhvc2UgdGhpbmdzIG91dHNpZGUgb2YgdGhlIHNw
aW5sb2NrIGFuZCBvbmUgb2YgdGhvc2UNCj4gdGhpbmdzIGluc2lkZSB0aGUgc3BpbmxvY2suIFdo
eT8gU2hvdWxkIHRoZXkgYWxsIGJlIGluc2lkZSB0aGUNCj4gc3BpbmxvY2ssIG9yIGNhbiB0aGV5
IGFsbCBiZSBvdXRzaWRlIG9mIHRoZSBzcGlubG9jaywgb3IgaXMgdGhlcmUgc29tZQ0KPiByZWFz
b24gaXQgaXMgdGhlIHdheSBpdCBpcz8NCj4gDQo+IA0KPiA+ICB2b2lkIGRwdV9lbmNvZGVyX3Rv
Z2dsZV92YmxhbmtfZm9yX2NydGMoc3RydWN0IGRybV9lbmNvZGVyDQo+ICpkcm1fZW5jLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsIGJvb2wgZW5hYmxlKQ0KPiA+ICB7DQo+ID4gICAgICAgICBzdHJ1Y3QgZHB1X2VuY29k
ZXJfdmlydCAqZHB1X2VuYyA9IHRvX2RwdV9lbmNvZGVyX3ZpcnQoZHJtX2VuYyk7DQo+ID4gKyAg
ICAgICBzdHJ1Y3QgZHJtX2NydGMgKm5ld19jcnRjOw0KPiA+ICAgICAgICAgdW5zaWduZWQgbG9u
ZyBsb2NrX2ZsYWdzOw0KPiA+ICAgICAgICAgaW50IGk7DQo+ID4NCj4gPiAgICAgICAgIHRyYWNl
X2RwdV9lbmNfdmJsYW5rX2NiKERSTUlEKGRybV9lbmMpLCBlbmFibGUpOw0KPiA+DQo+ID4gKyAg
ICAgICBpZiAoIWRwdV9lbmMtPmNvbm5lY3RvciB8fCAhZHB1X2VuYy0+Y29ubmVjdG9yLT5zdGF0
ZSkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsNCj4gPiArICAgICAgIG5ld19j
cnRjID0gZHB1X2VuYy0+Y29ubmVjdG9yLT5zdGF0ZS0+Y3J0YzsNCj4gPiAgICAgICAgIHNwaW5f
bG9ja19pcnFzYXZlKCZkcHVfZW5jLT5lbmNfc3BpbmxvY2ssIGxvY2tfZmxhZ3MpOw0KPiA+IC0g
ICAgICAgaWYgKGRwdV9lbmMtPmNydGMgIT0gY3J0Yykgew0KPiA+ICsgICAgICAgaWYgKCFuZXdf
Y3J0YyB8fCBuZXdfY3J0YyAhPSBjcnRjKSB7DQo+ID4gICAgICAgICAgICAgICAgIHNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJmRwdV9lbmMtPmVuY19zcGlubG9jaywgbG9ja19mbGFncyk7DQo+IA0K
PiBFdmVuIGlmIHRoZXJlIHdhcyBzb21lIHJlYXNvbiBmb3IgeW91ciBjaG9pY2Ugb2Ygd2hlcmUg
eW91IGRpZCB0aGUNCj4gc3BpbmxvY2sgaW4gdGhlIHByZXZpb3VzIGNhc2UsIEknbSA5NSUgc3Vy
ZSB0aGF0IHRoaXMgb25lIGlzIGFic3VyZC4NCj4gWW91J3JlIGxvY2tpbmcgYSBzcGlubG9jayBh
cm91bmQgYSB0ZXN0IG9mIGxvY2FsIHZhcmlhYmxlcz8gSSdtIHByZXR0eQ0KPiBzdXJlIG5vYm9k
eSBlbHNlIGNvdWxkIGJlIG1lc3Npbmcgd2l0aCB5b3VyIGxvY2FsIHZhcmlhYmxlcy4uLg0KPiAN
Cj4gDQo+IC1Eb3VnDQoNClRoYW5rcywNClZpbm9kIFAuDQo=
