Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049845FC134
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 09:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0F810E14A;
	Wed, 12 Oct 2022 07:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9445610E12B;
 Wed, 12 Oct 2022 07:23:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C4l1Yt007875;
 Wed, 12 Oct 2022 07:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=Dxm9STDlZYgiI8dmTfFIj5bT30PEnmMJ0VYUpEpp/C4=;
 b=ZT7FcaI8xxqmRLsyqei/8w4hcjMJoDC664eThsTjJgcZ/qBEch0191EjNuP4KlWzSffp
 nsXBJKNIx56miIhLQ0OO/6xgfUKgPauMk0KzBg3aD8nRwqnCZeCkjQpbBeTGx4ICEja7
 +ugNGUyfpF4jancOzK0gvPVRB7YTrVB1DQ4PC8zmsI7aXYOM4JgzzKkc6TppUTcqUhdd
 O5YWjj+v03yBMLcE/SpfryxBf9OPCjOv2X4r+Psi3rhz933xqWo+PvRbhaDuUJ/37RdL
 zxLnXb4rKc54ewSoJYOhgbWo+Oo3CH8OqAA/q+BfIlvBYqxhsyhw9oY7YpjUWMPN5Ki7 rg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rx5veuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 07:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPk5bHtV0I/T3jSKxszvjcByqPDZROX5YzMi2cNBVNsOOsB0T/1RaolWVgoqQVhdb8G5XLkop2IBAOqkMMtjYCAcV3cXrGKUDZTM9h1cJ/sS9nq+ulScSEysZOghA78KZdap4Qe7fNBEyykN0OEEgNAnMr2UIFbF81/Mf/o9mexB4m1mzUubMFgijqNHwPE1A/h70gUKRGcKB4SBaLqBU99ytXbMsIoZGmfbADmrqU2yclqR9u5lp2BEWrLp5DgIDZ2FgrEREzDW8V/ca+mJ1alHxqJeDBe+V2tGuLexeiFTwrLR3Ljt2MC5sRWG9aT7RMVLCRlwBEIU6pMNa6o/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dxm9STDlZYgiI8dmTfFIj5bT30PEnmMJ0VYUpEpp/C4=;
 b=WhrUBy3Hqn6uZ19syn3X2XzelriRWdSBxa6JUiVd0CCimD1kuoPAsE57/17xBjwbiW2u+lCtCVDBRxtYgNorprmXmz0HbWvRBMwNNJ8rnzto5+5683JivdShE8NHlnM4GzAr6Dq6T8E+zTjxANAmKDWvyhqMpgoaMBtZAdxUgFXPY5XhOtDcQUVeGUYIfP9WXbVwNWP3ZD49x4Y2FQrWzUNBfPCD6XT8UiDH0manI53XFOn0VGgbzPW0E3aaHZoN3b/6oCC8HqJcKFOM7uo6aMlg1OxMcS7/l7UP4yxBYUtOi5o9TSL+KzYEGeUJL8zFRdFc0riEc9zuNNmHQ/K2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CY8PR02MB9083.namprd02.prod.outlook.com (2603:10b6:930:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 07:23:08 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::d759:bc28:880:a631]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::d759:bc28:880:a631%5]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 07:23:08 +0000
From: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, "Vinod Polimera (QUIC)"
 <quic_vpolimer@quicinc.com>
Subject: RE: [PATCH v6 04/10] drm/msm/dp: Add basic PSR support for eDP
Thread-Topic: [PATCH v6 04/10] drm/msm/dp: Add basic PSR support for eDP
Thread-Index: AQHYlSXZ94Wvq3PikkKqdqdqdAlBla2Ul5uAgHZQxJA=
Date: Wed, 12 Oct 2022 07:23:08 +0000
Message-ID: <MW4PR02MB7186D86E8CACA0CCF738EDE9E1229@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAD=FV=UN2tFNL=T+eXE4j7bnp6zWgCN4Nz8Q=qgu7y67yRPpdA@mail.gmail.com>
In-Reply-To: <CAD=FV=UN2tFNL=T+eXE4j7bnp6zWgCN4Nz8Q=qgu7y67yRPpdA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR02MB7186:EE_|CY8PR02MB9083:EE_
x-ms-office365-filtering-correlation-id: e6def520-ac2f-485b-405b-08daac229cb5
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7ZxukaLnGCujiQvQKQ0J6M4VAKiRlsSa1N5pw7YmIxhxXzhpKt1q5Q+P0UVvGCBuWyalZuv5c+qysE3wG/GOI/MUMrWBzR1LlgI/D+bjJ5z0MU937DO//YPZyl/Itk1tfd4mbzE2DFXUHIRW57uP6iHWgAesXbGxftQf/3DPc7nHWCWPb0q5FCqhxgCzI0EDgu29T1nKklkeNO66vZEZgna5Qdf59A5lhp+wJ2d77JVEwLdZvDyzlX3G1MrmpOoDtmThicSnQYtjXAXhwkPS5Gbb8L0suu8VIvuWEyDnJZzKEU2DJ94MCa4qbGAdO3TovA4Fv0xgEyG/2TV25bkRxkIoZlbFeh2ct8kyqDk8rQgE0+nHPyxY12qTqRib+ny3457XVW+cst9rGQoD5XS94zIPY9X4NW2JV1i0zAoocNhFz+S/caYt428ZyjvnXjmM+4IGqy3nwABGE28/udY+eo+EaW9WfW86ZgjxtZjlMrjwckysjujPTkffLJW36kevSyn/8ozLNmg9Mx5OroXJUFh9593uGQvPmDREredIKjxLX+IawJa6zc2QkXOnZjYubJbCBIVj+rFnR4rzNMPVnXO7YoxD3xrDdM6BrdmTsUH7JnVJp4H3T/Pv90YIMk08Tpp+C/lGXiKoDd0BKZRABrolLZDZDOfFNjKdWkkPJ//AZrYGfZOgqBRvZ+fa1xsE5P9lh4j1bnDsoyfAaue6P06nxavkxU6GJ6Dh2Z0LIRI75S+8DrEWmhukkSnTxtiFfk+Fk9D4QGwqJOmqd5BAgWBnwBe+0tjEhN4Uo3d4SIg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199015)(55016003)(38070700005)(71200400001)(33656002)(38100700002)(122000001)(54906003)(86362001)(8676002)(110136005)(66476007)(8936002)(2906002)(316002)(64756008)(66446008)(66556008)(41300700001)(4326008)(76116006)(66946007)(83380400001)(7696005)(478600001)(6506007)(5660300002)(52536014)(186003)(107886003)(26005)(7416002)(9686003)(309714004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkJaUDdHUUY5MVJaUVRHMzdydnBUbnh1ZmI2eEg2MzhsY0pzNUZKZHVtRVhS?=
 =?utf-8?B?RWtCUHRsUzN2bG9SdVpXd1FsTjd0cmx3cFFSNHhNUi93TXBpOVY4OEhtUERN?=
 =?utf-8?B?V3ZRWkNZMmFOejJKeHZtTHRBZ2lDbm9aU2RKeVZqZ2w4U0lYbTdoS0hINXVD?=
 =?utf-8?B?ZzVWdVhCT1UwWThuYzU2L2pqTElyUTlSWjlTQTdqdmsrWEc4bXNhL1FIc0ll?=
 =?utf-8?B?OEdRZ3gwdytUNEhNekM3cmJWVml4ZEt0aVQ1alJtVlRXSFhzQnk4YUFMRUw4?=
 =?utf-8?B?L1hkWmdIUkhNQS9lZ3FYUStKSklrVlpiZmRsUzhsdzEvNjBkbXVveW9FeFRq?=
 =?utf-8?B?Q096NGJ4S2dGQUNyRVEyTkR6S3FaeU9WeGRNazdRS3JnaXNFODlsZ3pwYkU1?=
 =?utf-8?B?bWFqSDJGaG9aSmw3Z3NZZ0ZZY1MyT0FpSHZBSS9QbjRKSW91aXA0UU9sZ0Jk?=
 =?utf-8?B?ZUFyUktsR2dSZmdsZlRxRGFpWDZEVDZRVFJvUHh3dkV2Z0xFM0s3RHpwaGxj?=
 =?utf-8?B?ZFlCR1hraDRtSkk4L0YrZWw5SEpFbjlJSVZCTkpnSzY1b1FJZCt1eC90VVpP?=
 =?utf-8?B?QWlQeGY2a2xFT0pHRmczRWVvL1NsK21hSEpnSU1vT0M3Q1F1dFp0WWtEZGxr?=
 =?utf-8?B?SGV1ek5iL05hUmZ5UVU0ZTBzYmNJWGlFbWtDY0dkK0ZJaVhXQ0NpbWoyVXAv?=
 =?utf-8?B?d29UalA4d2hzS2hrMVpvdE1oN0JvcC80N1ZOdWxBL3pHMHN2dlJpbTZxaGhl?=
 =?utf-8?B?NlQxSkNBRDdQVzQxVFBGQ1lMMkpWSkJCdlNiTWdyOWFBWk1VM0lGTXBOajZa?=
 =?utf-8?B?RGVVQVhCUVdGam1lbEhlMlV0QjVlUWtxVlJsSUhjSVFLamNjVkpUUjgvZmw1?=
 =?utf-8?B?ZzBBRHhCdi9rWEVhZ3VIRkV5dTBkZXk2cjJLYmgrRDZ1b2NZcjJ5amNoWnBX?=
 =?utf-8?B?aDFZWFh6UW40OTVuV2RQb3pwRXpMY0kxRGtVNW5wRlZNMDFKUU90WEZjV2hH?=
 =?utf-8?B?dDVNdEVNTTJVWTBJTU5nbjk3Wjk0Y0o4bU1zQm81WkRob1BmWU1wTU5Jdm5J?=
 =?utf-8?B?bzVMclRTTG10VC9hUzVsN0M4T1B4L3lwQ0Z5UlpiLzAzNTFXdWYrdVkzZHdv?=
 =?utf-8?B?RDh6TFo1MGdGV25HSXlBcHBaKzBrbmx0d1krVDFGOXFxMENZdUVYdFdMWHlB?=
 =?utf-8?B?OVFld3hOV213QXJ1cHBrcVowbktmQmRocjIzdHdhNUQzVFN6RHFDUVB3eUNF?=
 =?utf-8?B?QmxJaFU4UUd1WEtVa3pjOHBFcE5EbGxmSm9aRWowRlZyRWplVEkxL0xGamls?=
 =?utf-8?B?WlpIZEJNVmIxZzlRUnBpSHMzQUNadlBxVmJHQWNBVEdqcGlvNkRaR2ZBQ2JG?=
 =?utf-8?B?VDVrclJLSlpZYXBPSHlHakRHdnVaRXF3eXpXbVFhMGpERzNFTHN6MUZuSmRR?=
 =?utf-8?B?SHVRTFBxME0zK1JxbXVmUDdFdHFvdncwYVhrb2VCbGVORko4Z3VkRTIrK2xX?=
 =?utf-8?B?ZXpuaHRFRHZyaSs5cXFwYWg4Sm1uODZIdTNIVkVPOHdtc0k5UlJFL042NGpp?=
 =?utf-8?B?eGd4bmpHT3RrdVFqc3ROdDIvd3pkc1RRZFJPMDM4WXZzVFRnSXR3MXZJTU5K?=
 =?utf-8?B?cU5aOU4vbkpXZ1VEMzNMdHloSGR6WVg0cVArcnNvWEcxVFVmQkJ5WnkweDAz?=
 =?utf-8?B?eG5TUm1hbW43dDNacmR4Z0phRnZDdUFPUnBqZHc1dXcyVlZLMmVod2pTTnIw?=
 =?utf-8?B?MFhwb1pyWmJUMitSS0x5bDJ2Slc2OGhCOVh6dW9tVXVSNmxiSmNxY0wzSjJh?=
 =?utf-8?B?UGZuUEFnUjNSUmduZEJYWmkzUUNQQ3J3Z2F0QXZ1MlVPei9SS1kxczlKSXky?=
 =?utf-8?B?SldHRVJxdkc4dERzS2ljRzAzdFhiUm5mZmRsUzRibC9oZzY4VkRXbFdBU3l5?=
 =?utf-8?B?UnlxaDQzOTBPeWM1RzdYUDE0VzRyMjF4NlNhc3hYTGp3M1BhTHhrVmN1QUd5?=
 =?utf-8?B?K21Hd0NtdHRwRDZhRUdERExGWm5JZGFVT05KVUQ0TzUwT1k3WGJSODJpNC9T?=
 =?utf-8?B?SDlhSjZWazYzbGlaNlR2RmlIYUVZOFZEbUxzOGo3QWpJdTU0VnptWGRyMVYr?=
 =?utf-8?B?cGtlUXRaL2NxelArWnpwTldvbmtGbitsa2pyaWJXZmVSUTByTXRzSzdqQ0Qy?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6def520-ac2f-485b-405b-08daac229cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 07:23:08.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RT1/MntA55qB+hu3zW74GpcucSrZb5wYfgzBfInixEe9bToPjsY3PzWFxXYtZQAB4sfY8N/cVcQiTAN9u3ZzYJuYq6kLBXKoWj2AbBmTFGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9083
X-Proofpoint-GUID: S5ZDudm2jWH3YPXkTAJsRoV9JiLWyuz1
X-Proofpoint-ORIG-GUID: S5ZDudm2jWH3YPXkTAJsRoV9JiLWyuz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_03,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120047
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

SGkgRG91ZywNCkkgaW5jb3Jwb3JhdGVkIHRoZSBjb21tZW50cyBpbiB2Ny4NCg0KPkhpLA0KPg0K
Pk9uIE1vbiwgSnVsIDExLCAyMDIyIGF0IDU6NTcgQU0gVmlub2QgUG9saW1lcmENCj48cXVpY192
cG9saW1lckBxdWljaW5jLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQEAgLTM1OSw2ICszNjcsMjQgQEAg
dm9pZCBkcF9jYXRhbG9nX2N0cmxfbGFuZV9tYXBwaW5nKHN0cnVjdA0KPmRwX2NhdGFsb2cgKmRw
X2NhdGFsb2cpDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBsbl9tYXBwaW5nKTsNCj4+ICB9
DQo+Pg0KPj4gK3ZvaWQgZHBfY2F0YWxvZ19jdHJsX3Bzcl9tYWlubGlua19lbmFibGUoc3RydWN0
IGRwX2NhdGFsb2cgKmRwX2NhdGFsb2csDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBib29sIGVuYWJsZSkgew0KPj4gKyAgICAgICB1MzIgdmFsOw0K
Pj4gKyAgICAgICBzdHJ1Y3QgZHBfY2F0YWxvZ19wcml2YXRlICpjYXRhbG9nID0gY29udGFpbmVy
X29mKGRwX2NhdGFsb2csDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkcF9jYXRhbG9nX3ByaXZhdGUsDQo+PiArZHBfY2F0YWxvZyk7DQo+PiArDQo+PiArICAgICAg
IHZhbCA9IGRwX3JlYWRfbGluayhjYXRhbG9nLCBSRUdfRFBfTUFJTkxJTktfQ1RSTCk7DQo+PiAr
ICAgICAgIHZhbCAmPSB+RFBfTUFJTkxJTktfQ1RSTF9FTkFCTEU7DQo+DQo+bml0OiB0aGUgbGlu
ZSBhYm92ZSBpcyB1c2VsZXNzLiBSZW1vdmUuIEluIHRoZSBjYXNlIHRoYXQgeW91J3JlIGVuYWJs
aW5nIHlvdSdyZQ0KPmp1c3QgYWRkaW5nIHRoZSBiaXQgYmFjayBpbi4gSW4gdGhlIGNhc2UgdGhh
dCB5b3UncmUgZGlzYWJsaW5nIHlvdSdyZSBkb2luZyB0aGUNCj5leGFjdCBzYW1lIG9wZXJhdGlv
biBiZWxvdy4NCj4NCg0KSW5jb3Jwb3JhdGVkIHRoZSBjaGFuZ2VzIGluIHY3DQoNCj4NCj4+IEBA
IC02MTAsNiArNjM2LDQ3IEBAIHZvaWQgZHBfY2F0YWxvZ19jdHJsX2hwZF9jb25maWcoc3RydWN0
IGRwX2NhdGFsb2cNCj4qZHBfY2F0YWxvZykNCj4+ICAgICAgICAgZHBfd3JpdGVfYXV4KGNhdGFs
b2csIFJFR19EUF9EUF9IUERfQ1RSTCwNCj4+IERQX0RQX0hQRF9DVFJMX0hQRF9FTik7ICB9DQo+
Pg0KPj4gK3N0YXRpYyB2b2lkIGRwX2NhdGFsb2dfZW5hYmxlX3NkcChzdHJ1Y3QgZHBfY2F0YWxv
Z19wcml2YXRlICpjYXRhbG9nKQ0KPj4gK3sNCj4+ICsgICAgICAgLyogdHJpZ2dlciBzZHAgKi8N
Cj4+ICsgICAgICAgZHBfd3JpdGVfbGluayhjYXRhbG9nLCBNTVNTX0RQX1NEUF9DRkczLCBVUERB
VEVfU0RQKTsNCj4+ICsgICAgICAgZHBfd3JpdGVfbGluayhjYXRhbG9nLCBNTVNTX0RQX1NEUF9D
RkczLCAhVVBEQVRFX1NEUCk7DQo+DQo+IVVQREFURV9TRFAgaXMgYSByZWFsbHkgY291bnRlci1p
bnR1aXRpdmUgd2F5IHRvIHNheSAweDAuDQo+DQoNCkNoYW5nZWQgdG8gMHgwIGluIHY3DQoNCj4N
Cj4+IEBAIC02NDUsNiArNzEyLDIwIEBAIHUzMiBkcF9jYXRhbG9nX2hwZF9nZXRfaW50cl9zdGF0
dXMoc3RydWN0DQo+ZHBfY2F0YWxvZyAqZHBfY2F0YWxvZykNCj4+ICAgICAgICAgcmV0dXJuIGlz
ciAmIChtYXNrIHwgfkRQX0RQX0hQRF9JTlRfTUFTSyk7ICB9DQo+Pg0KPj4gK2ludCBkcF9jYXRh
bG9nX2N0cmxfcmVhZF9wc3JfaW50ZXJydXB0X3N0YXR1cyhzdHJ1Y3QgZHBfY2F0YWxvZw0KPj4g
KypkcF9jYXRhbG9nKQ0KPg0KPldoeSBpcyB0aGUgcmV0dXJuIHR5cGUgImludCIgYW5kIG5vdCAi
dTMyIi4gSXQncyBhIGhhcmR3YXJlIHJlZ2lzdGVyLg0KPkl0J3MgdTMyIGhlcmUuIFRoZSBjYWxs
ZXIgYXNzaWducyBpdCB0byBhIHUzMi4NCj4NCg0KQ2hhbmdlZCB0byB1MzINCg0KPg0KPj4gK3Zv
aWQgZHBfY3RybF9zZXRfcHNyKHN0cnVjdCBkcF9jdHJsICpkcF9jdHJsLCBib29sIGVudGVyKSB7
DQo+PiArICAgICAgIHN0cnVjdCBkcF9jdHJsX3ByaXZhdGUgKmN0cmwgPSBjb250YWluZXJfb2Yo
ZHBfY3RybCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcF9jdHJsX3ByaXZh
dGUsIGRwX2N0cmwpOw0KPj4gKw0KPj4gKyAgICAgICBpZiAoIWN0cmwtPnBhbmVsLT5wc3JfY2Fw
LnZlcnNpb24pDQo+PiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPj4gKw0KPj4gKyAgICAgICAv
Kg0KPj4gKyAgICAgICAgKiBXaGVuIGVudGVyaW5nIFBTUiwNCj4+ICsgICAgICAgICogMS4gU2Vu
ZCBQU1IgZW50ZXIgU0RQIGFuZCB3YWl0IGZvciB0aGUgUFNSX1VQREFURV9JTlQNCj4+ICsgICAg
ICAgICogMi4gVHVybiBvZmYgdmlkZW8NCj4+ICsgICAgICAgICogMy4gRGlzYWJsZSB0aGUgbWFp
bmxpbmsNCj4+ICsgICAgICAgICoNCj4+ICsgICAgICAgICogV2hlbiBleGl0aW5nIFBTUiwNCj4+
ICsgICAgICAgICogMS4gRW5hYmxlIHRoZSBtYWlubGluaw0KPj4gKyAgICAgICAgKiAyLiBTZW5k
IHRoZSBQU1IgZXhpdCBTRFANCj4+ICsgICAgICAgICovDQo+PiArICAgICAgIGlmIChlbnRlcikg
ew0KPj4gKyAgICAgICAgICAgICAgIHJlaW5pdF9jb21wbGV0aW9uKCZjdHJsLT5wc3Jfb3BfY29t
cCk7DQo+PiArICAgICAgICAgICAgICAgZHBfY2F0YWxvZ19jdHJsX3NldF9wc3IoY3RybC0+Y2F0
YWxvZywgdHJ1ZSk7DQo+PiArDQo+PiArICAgICAgICAgICAgICAgaWYgKCF3YWl0X2Zvcl9jb21w
bGV0aW9uX3RpbWVvdXQoJmN0cmwtPnBzcl9vcF9jb21wLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgUFNSX09QRVJBVElPTl9DT01QTEVUSU9OX1RJTUVPVVRfSklGRklFUykpIHsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiUFNSX0VOVFJZIHRpbWVkb3V0XG4iKTsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRwX2NhdGFsb2dfY3RybF9zZXRfcHNyKGN0cmwt
PmNhdGFsb2csIGZhbHNlKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4+
ICsgICAgICAgICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICAgICAgICAgZHBfY2F0YWxvZ19j
dHJsX3N0YXRlX2N0cmwoY3RybC0+Y2F0YWxvZywgMCk7DQo+PiArDQo+PiArICAgICAgICAgICAg
ICAgZHBfY2F0YWxvZ19jdHJsX3Bzcl9tYWlubGlua19lbmFibGUoY3RybC0+Y2F0YWxvZywgZmFs
c2UpOw0KPj4gKyAgICAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgICAgICAgIGRwX2NhdGFsb2df
Y3RybF9wc3JfbWFpbmxpbmtfZW5hYmxlKGN0cmwtPmNhdGFsb2csDQo+PiArIHRydWUpOw0KPj4g
Kw0KPj4gKyAgICAgICAgICAgICAgIGRwX2NhdGFsb2dfY3RybF9zZXRfcHNyKGN0cmwtPmNhdGFs
b2csIGZhbHNlKTsNCj4NCj5NeSBQU1Iga25vd2xlZGdlIGlzIG5vdCB2ZXJ5IHN0cm9uZywgYnV0
IEkgZG8gcmVtZW1iZXIgYSByZWNlbnQgY29tbWl0DQo+ZnJvbSBCcmlhbiBOb3JyaXMgZmx5IGJ5
IGZvciB0aGUgQW5hbG9naXggY29udHJvbGxlci4gU2VlIGNvbW1pdA0KPmM0YzZlZjIyOTU5MyAo
ImRybS9icmlkZ2U6IGFuYWxvZ2l4X2RwOiBNYWtlIFBTUi1leGl0IGJsb2NrIGxlc3MiKS4NCj4N
Cj5JbiB0aGF0IGNvbW1pdCBpdCBzb3VuZHMgYXMgaWYgd2UgbmVlZCB0byB3YWl0IGZvciBfc29t
ZXRoaW5nXyAocmVzeW5jIEkNCj5ndWVzcz8pIGhlcmUgYW5kIG5vdCBqdXN0IHJldHVybiBpbnN0
YW50bHkuDQo+DQoNCkluIG91ciBjYXNlLCB0aGUgSFcgYWJzdHJhY3RzIHRoZSBuZWNlc3Nhcnkg
c2V0dGluZ3MgZm9yIHJlZ3VsYXIgcHNyIGV4aXQuDQpIb3dldmVyLCB3ZSBkaXNjb3ZlcmVkIHNv
bWUgY29ybmVyIGNhc2VzIHJlbGF0ZWQgdG8gZGlzcGxheSBvZmYvc3VzcGVuZCB3aGlsZSBzaW5r
IGlzIGluIHBzciwNCkkgYW0gaW5jb3Jwb3JhdGluZyBhIHN0ZXAgdG8gZW5hYmxlIHZpZGVvIGFu
ZCB3YWl0IGZvciB2aWRlbyByZWFkeSBpbiB2Ny4NCg0KPg0KPj4gQEAgLTM4OCw2ICszODgsOCBA
QCBzdGF0aWMgaW50IGRwX2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGlnaChzdHJ1Y3QNCj4+IGRwX2Rp
c3BsYXlfcHJpdmF0ZSAqZHApDQo+Pg0KPj4gICAgICAgICBlZGlkID0gZHAtPnBhbmVsLT5lZGlk
Ow0KPj4NCj4+ICsgICAgICAgZHAtPmRwX2Rpc3BsYXkucHNyX3N1cHBvcnRlZCA9ICEhZHAtPnBh
bmVsLT5wc3JfY2FwLnZlcnNpb247DQo+PiArDQo+DQo+bml0OiByZW1vdmUgdGhlICIhISIuIFlv
dSdyZSBhbHJlYWR5IHN0b3JpbmcgdGhpcyBpbiBhICJib29sIiB3aGljaCB3aWxsIGhhbmRsZQ0K
PnRoaXMgZm9yIHlvdS4NCj4NCiANCk1hZGUgdGhpcyBjaGFuZ2UgaW4gdjcuDQoNCj4NCj4+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgZWRwX2JyaWRnZV9vcHMgPSB7DQo+
PiArICAgICAgIC5hdG9taWNfZW5hYmxlID0gZWRwX2JyaWRnZV9hdG9taWNfZW5hYmxlLA0KPj4g
KyAgICAgICAuYXRvbWljX2Rpc2FibGUgPSBlZHBfYnJpZGdlX2F0b21pY19kaXNhYmxlLA0KPj4g
KyAgICAgICAuYXRvbWljX3Bvc3RfZGlzYWJsZSA9IGVkcF9icmlkZ2VfYXRvbWljX3Bvc3RfZGlz
YWJsZSwNCj4+ICsgICAgICAgLm1vZGVfc2V0ID0gZHBfYnJpZGdlX21vZGVfc2V0LA0KPj4gKyAg
ICAgICAubW9kZV92YWxpZCA9IGRwX2JyaWRnZV9tb2RlX3ZhbGlkLA0KPj4gKyAgICAgICAuYXRv
bWljX3Jlc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX3Jlc2V0LA0KPj4gKyAgICAgICAu
YXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9DQo+ZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX2R1cGxp
Y2F0ZV9zdGF0ZSwNCj4+ICsgICAgICAgLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21p
Y19oZWxwZXJfYnJpZGdlX2Rlc3Ryb3lfc3RhdGUsDQo+PiArICAgICAgIC5hdG9taWNfY2hlY2sg
PSBlZHBfYnJpZGdlX2F0b21pY19jaGVjaywgfTsNCj4NCj5uaXQ6IHRoZSBsb2NhdGlvbiBvZiB5
b3VyIG5ldyBmdW5jdGlvbnMgaXMgYSBsaXR0bGUgd2VpcmQuIFlvdSd2ZSBnb3Q6DQo+DQo+MS4g
RFAgZnVuY3Rpb25zDQo+Mi4gZURQIGZ1bmN0aW9ucw0KPjMuIGVEUCBzdHJ1Y3R1cmUNCj40LiBE
UCBzdHJ1Y3R1cmUNCj4NCj5JJ2QgZXhwZWN0Og0KPg0KPjEuIERQIGZ1bmN0aW9ucw0KPjIuIERQ
IHN0cnVjdHVyZQ0KPjMuIGVEUCBmdW5jdGlvbnMNCj40LiBlRFAgc3RydWN0dXJlDQo+DQoNCkNo
YW5nZWQgdGhlIG9yZGVyIGluIHY3DQoNCj4tRG91Zw0K
