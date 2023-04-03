Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B86D43F9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CE410E43E;
	Mon,  3 Apr 2023 12:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A48110E41B;
 Mon,  3 Apr 2023 12:01:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 333AUcqv000936; Mon, 3 Apr 2023 12:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=oKC+z/vsgd9nK6ZAdlYqZIsqHfju2k6905n/7eXOxQ0=;
 b=jAzGoPYsSizKIWrDAmmtGn6VkpZgv6m3yiyV/QVNhGpBEwPKOk1hnK1FNl9VO4yYDtj1
 4eZjq1TOfamNpLQnccO4hf9elWI8B/VPAJHPUVyHr4bSyYgIN23m5X2PRxP3HP0q6bsJ
 pybtG3um6Z1fgx9u2Hai0nndeYOwSti69sWi+y/WS9IXngc1nvDTmfFMhn+8UM6e8edm
 9DnCdV0FOV/w3wP/q4WsJTVOzfX4eNJuUV/psrQm4PiwhhzZKdmDGlmiBuUOtngzz+vm
 z7Vr3Av5j7p3fhLWMWns0HpyVLto1x6Yx2s71tgVSQsFQPYJwDG8r9k1YOo8AcXuYlLe Ig== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqw36r5qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 12:01:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/SOaxuUCPR8JLoi3LAJ8QP5ERPJULLwdQLcjSIzc/+PttS7ytl46be3Y6r7f6CxYzPru0GZvQILygYtdDj8rOUA3LIoep8UIfoWzsjuqMRTWHNC2l2uARxo4U7WenjeEx2yn+3WAyVhYwDenKu+Eok1Q2nQ/CL2gHJ7eUPqBSUbqrzDl2GMtciiLCAiedBP9zqTIObAtlm9wCatDAEHbca+Pn0ljqIrBOfwzsLz8c8ZCGQWqpVYiRFkhvgAQ6tanXoGpTVBKVKmy6KnUn2HtHN+BbyETmRN7VGVUDFcwa7gbO7Jhmd6aEgWuwURylP8Lus8ujemoelN581ZPHARNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKC+z/vsgd9nK6ZAdlYqZIsqHfju2k6905n/7eXOxQ0=;
 b=R2B3QEmGO9NX/t4ymNRahjUoxPtOnaTJdrK/Kj4L2ppx0pGqY0JGiGjhoSZnzYVl/oN2oz5OiAKTEBI6wKFjEkX0HbSmaZwvpTzyNwtOkqnVzjQhyikArKp1F2gFplUxe1qmDb/mLW9beTfBofDWoY5xYmYcQmOX/FHJUUR8pWuPpWViLLRh1oTlXWtKF5gIL+x32WRMVpbx1MVcyOQYy0cahCAxbsPFP+rLDB17fAerjqYT10fxt7OJJPyRA3HmrDs2vFCdJPphwfraWPyFxo+raX2z8nTMinXdPsIw4GlyRP5lap9h2agX5gX5rMNEM9Cvn4riktGfFezgIZ4qSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by CO6PR02MB8723.namprd02.prod.outlook.com (2603:10b6:303:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 12:01:11 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::5c51:5ca0:fa24:f4f5%2]) with mapi id 15.20.6222.035; Mon, 3 Apr 2023
 12:01:11 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Vinod
 Polimera (QUIC)" <quic_vpolimer@quicinc.com>
Subject: RE: [PATCH v1 3/3] msm: skip the atomic commit of self refresh while
 PSR running
Thread-Topic: [PATCH v1 3/3] msm: skip the atomic commit of self refresh while
 PSR running
Thread-Index: AQHZY9j6eXup0EW52Ui7OLHjVldwx68U+rsAgASA5YA=
Date: Mon, 3 Apr 2023 12:01:10 +0000
Message-ID: <BN0PR02MB8173E9FF869F7EEFCE1F5410E4929@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJppc3LDQy2RgVZbWki4Y-_FOTK67Y8RfK5Bm9gqdfqMjqQ@mail.gmail.com>
In-Reply-To: <CAA8EJppc3LDQy2RgVZbWki4Y-_FOTK67Y8RfK5Bm9gqdfqMjqQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8173:EE_|CO6PR02MB8723:EE_
x-ms-office365-filtering-correlation-id: d17df0c9-d832-48d8-4836-08db343b1dcf
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H9x2fRMQL6MU57InefbZMCFo/f5oU7LpRNLEq6fV5zIo3LZBFiQfWnOsbZOfahhGZHcLz5Bsd17iLiJpPkxbvkkxnCjmqICXW2xq8fjIVlet2a5P3fdP1J3f6co9iYvoPjIaNqo9KPKKBVrn7zJcZuEEg4jmExyDN1kJ2irs5KKau6mkexnN2DI+8J65vuM6SQGjKx+8DAh5n0kTk+q7Y5c1K9GQtljlhv/rZBWpdhnr+8qaYOhHjhnDnDPc4QMaQR/suR7iEtYwJOp+M578Db6U4/ThBuDFH2PeGU41O+tUfaPllT41zv19hgN5Dd4C/Ny4s8AxOGZ/4LzBgLPFB+y36ljK96CJx15xe0kDMk84Uz9QCFQuO8MIpiOrIfBqo7w15PI6DFcWp4rAkezuJqkcv7AUYu7ul8ZtsWIP1tNg4IlXadIPPrpq5+NmRDdcCNFMQMWTxZre7NPTuq68C1i4PP5J2WtknmR4OJZOjOAeUsBE4yr8Qc+pEvDmzxWegeOmIGp+114SSLCATRdBzHvYOaTeIum2IIhcL1kW3ho5G/ShtK1mudg9aOGiC/NQH39a8jo1vIqOxR7rQvs0JSA14e7CqNSoosNDIS+MTaI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(38100700002)(966005)(122000001)(55016003)(6506007)(9686003)(186003)(107886003)(26005)(52536014)(2906002)(33656002)(5660300002)(8936002)(478600001)(54906003)(38070700005)(71200400001)(64756008)(66476007)(7696005)(66556008)(66446008)(66946007)(4326008)(76116006)(41300700001)(316002)(86362001)(110136005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWtwVi8zWjhGa2FLUkQ3WEw5Snh0bmJubWNTcG9XcDhNTDBoZm9xTFZoMVpw?=
 =?utf-8?B?T2ZQaDNwSlY0ck9XZU5PV3plOENnQmZocXVOc3ZqSXNNbzRvOUx6M2IxRXRP?=
 =?utf-8?B?M1N4NXVUbmozNnJjaE9tZEFKWU5TNTgxQmtaaG1hcEpmclk2T3J2WUNrOVdn?=
 =?utf-8?B?QjF4UzlMVENYVXQxYXY4TWxYaWZNOWNsSy9NVUFCc29CK3pJMWpJQ0JjS1BS?=
 =?utf-8?B?cWNubXZYN0VMY3hzSWJWYVR1ZFBxVU0zNVBxYndIZ1RmZUNNcHRKQTNnbkcx?=
 =?utf-8?B?V2d5VUdIMCtlR0JXQ2tNejVQN3N2NGRxa2cwd09RWjlMYTM0SzhIQllubHFV?=
 =?utf-8?B?ZW5taDVwWlk4eFFCa1lrK1oxOVg2STNna0kxTm9LU1J4NHBXWTNUblRnS3JH?=
 =?utf-8?B?TFN4YSsybm1BUUUrT2FhV25SOVhlYk5wbHhWSm9jeFZhOTlqbE1qK2tmZWpT?=
 =?utf-8?B?ZUNCSG03cE1VSVJ1Q1pnNFVvdzREV1BxNEplSDBickhlR1A4anpQd3Y4Q28y?=
 =?utf-8?B?V0w0RzRZY29XUkhGbGU3dGlRSGlCQUg1SG9NS21kdG9KQjRINUpGL2xwOVdZ?=
 =?utf-8?B?YUdudDZYaTRKOTdwSS9UdHJpMjJqeEx5N3hQaUN5dlBOemtlbVgzSzRwZDZP?=
 =?utf-8?B?REN3UGFoMjUwbGpCNnBWS2g0SEpveXZpY0RVMkpWem1RY25Wc2tLeGZTeU0v?=
 =?utf-8?B?TTlSdHJjSStYejRRai9pUGlhSUVyLzNoS2JGZGpFeDZWYVlmY0pSdzUrb0ti?=
 =?utf-8?B?OVpMclpHRDl6QWJReWZWcmdYQkJxcXJsVHBEMXBEWkVXR0U1YkNvc1RLY0pZ?=
 =?utf-8?B?enR2ZHZOZEJ3RFhmRjNlRzFKMW5HNlovT3NRamVKbk9CbUZGZnNMeHhMcHlE?=
 =?utf-8?B?QjBibzJnSGhYenhTMnBZZTVGSHRZbjQ1dXNCL0ZGdDl2VGZkVnNYMkhLL0lG?=
 =?utf-8?B?ZzB3bks4bmxmMHpZNGc3UTUwa3FETitzZllnS1M0SDk5dHVyUktXTmZmaUtL?=
 =?utf-8?B?Y2RXeDkrOWhlQ0J3QzUzblc5VGRwVXVNZFFPNHhIY1Z5VklWSURZNXlZaFo5?=
 =?utf-8?B?MDlldHoyYWdHTzVRVFFBYUpOenB0S09JaVZ5c2k4c09OSktkRDZKOEpiQ01o?=
 =?utf-8?B?OEdIWXYrbzFSSFRMNXJBVWM0UWQ0VlBqZW9RUjNnMloxZ01LUGhvenVZUGQy?=
 =?utf-8?B?MThieDBTUFZXZ0h4QWthNVhBUmNFY2hiQnZCUHFlSGpBc0NBM1I3MVlCbmlu?=
 =?utf-8?B?eVFKejNEeXFOMFBna3B6dk1wUmJHOUJzRysvT3l4aTc5eTIrYUcxeldXemxH?=
 =?utf-8?B?RzE4c3NONzBnKzBmTnZpMUhNVFZCZ29CcWd4ZVdVaVN0dzVsOHhBYkVNQldU?=
 =?utf-8?B?eUtFMjhUL3JIZzE4UzBCRkxUVGo5Y1pnN2haR0ExeVR5SWZqdm44TWxWYzZy?=
 =?utf-8?B?Y0ZSaWF6emt5a0hseC9SY1hEd2RRcis2MmR4R28xYkRCYmZKQ3ROUUcyL1c5?=
 =?utf-8?B?VGRRckZVWFF4MXkzZG5BaEtlaURuY1dNeVNBWXk0UzBDNTVENlZlUmUxMXgx?=
 =?utf-8?B?MmZQdTEwajZ4TXNVWi85alptakZCU2oxb0NtemFHVkhOM1ZvcFd5MEpUaDZ0?=
 =?utf-8?B?SjdFU29SUjhtTTZQZVZyYjhhRis2dzE1RWNvY2xiNlRQeUhzblJUOVJoVFpw?=
 =?utf-8?B?TnFoRVNMNkNJc2YrcXpiWUVHVDNBaysvNHE1c05BNWNWTFUzMHVNM0puczVy?=
 =?utf-8?B?b1g4N2lhS3RNOXZ6SitGZW9YOCt1bDBGV1ZsTnBmbExKM0lyQnQraG5aNUNG?=
 =?utf-8?B?YW1rS292L003SzZNUHVFb0oxWFNaQy9BTGdXQVJ6K0RxTUdYeCtIZ05lKytk?=
 =?utf-8?B?V1VYWjllQnhtTndCQWd5ZE1zZG45OHgrOGpncWZhVDlLSkF5Y09uOXdjS0dv?=
 =?utf-8?B?TXRVTXNWdmR4Tk02MGVuc1hKQktNOFFDdSt0UTF0Vkp0UFowTUk5R3MvOSt6?=
 =?utf-8?B?UEVnYVd1bFcrUXRtU0VrME00b0Qzc1M5TUtCZWdMUXRQVnFybEh6TXFadDU0?=
 =?utf-8?B?Nkg1SlQ4NWVBcDBPRlhzVnVhZ2c1QjNLbkxxVVQrdXZtcUFCNDdTK09MS1pI?=
 =?utf-8?Q?5yfxXkl1Yh4FSYu1y9UZ3qb3j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1N/T6j86p2OgEutA+YoxPMfgZWPz9a+EzSizAlV76euLBehq6gRtey2eHDeObUaCsAwRwx/DCi7Xtukw0OWWh+xq0AKJ5n4M7Ks0oObbwZ4ptUsbgO87qXYFsZgGUjGLd7mkRkRq0fEe4UKd08qvhMV7v7gsCRIqKynW22dNlwWM8ql+bPqf6kZ4xpNQ7i7GhtUyEvmscYwA5cmcfteng9KHTYBRE0WQDTG5hCqcActk5pL0blMWMmgdxSrDOCA6+GnmR5sz9smWAwjtTXjruiKKIVGJ6WL3TGEopVWvP6E4e3+lJIWKKvEAno1JtJHXO5bSzvIy+KyObomy+/JArT32STPPUWE4whpolK/9WvQGnjtcWhuhXyBRmPXtEYtlUbgL+AYKmE2vdmWdDkDJWYTumYg5Duaa20etHax0cRiiHo8JvWAkNaROl3N5PzU8v/szo0mRqwhXGKObHC+ED0FbRPnyS7l9DSuWfD+tRQdHcoWfQY3iloDINE2fQ/+JDA8SPpERxaW2KqLP2a+i8gtCF+FnbxyDXyVe4vNH/gg1pzm8DZrhUL+yX9SP9WZAaNdJ8iodU2JqZOCuWJjXFJUPtKf6TyOogayVMYl7+6UL1nfW18czDbTSjLCFyUIahudjIt1E/ZN37gml2N2eJCVyPxomFGsaBcx6ci3fTElGCBmoSnA+fl+ESszSRPGcBXgXijqiMNAVWM38w1dy28z+IFi1xVuHNH7ZthiskJ2KyY7aFwPUEMVcH8p2PMewlYrO0gX9+vC0OIT3ZJKUiaTsGz4SGs/Ur/1JRZr3ib5PZGhIq7M99zdoSJcOPUbo9EPKkilJEwNaHbOOWOf/5cv8iGb/HH7/GnHpTG1hgHgirJTVuYdh0/anfghsGt4yhmEoe6YQr4/+FeE1DlruYWKhwz2uVM/+GXSUfU2Jkwg=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17df0c9-d832-48d8-4836-08db343b1dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 12:01:11.0398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwNRxlko5befV3WdrzWh0IH6R3geio0khkrx3iKaSxKNSXjrws12ACsgTnhibZc60JgSohdVEBEVyM/0TMGOXb0fPqNj7LAFrzGLC/IXiII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8723
X-Proofpoint-ORIG-GUID: t9is_NCaUWuXlBIV5h4qHy48KnPVnNTr
X-Proofpoint-GUID: t9is_NCaUWuXlBIV5h4qHy48KnPVnNTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_08,2023-04-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030090
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBGcmksIDMxIE1hciAyMDIzIGF0IDE2OjU5LCBWaW5vZCBQb2xpbWVyYSA8cXVpY192cG9s
aW1lckBxdWljaW5jLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBJbiBjZXJ0YWluIENQVSBzdHJl
c3MgY29uZGl0aW9ucywgdGhlcmUgY2FuIGJlIGEgZGVsYXkgaW4gc2NoZWR1bGluZyBjb21taXQN
Cj4gPiB3b3JrIGFuZCBpdCB3YXMgb2JzZXJ2ZWQgdGhhdCBQU1IgY29tbWl0IGZyb20gYSBkaWZm
ZXJlbnQgd29yayBxdWV1ZQ0KPiB3YXMNCj4gPiBzY2hlZHVsZWQuIEF2b2lkIHRoZXNlIGNvbW1p
dHMgYXMgZGlzcGxheSBpcyBhbHJlYWR5IGluIFBTUiBtb2RlLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jIHwgMyArKysNCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
YXRvbWljLmMNCj4gPiBpbmRleCA2NDVmZTUzLi5mODE0MWJiIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fYXRvbWljLmMNCj4gPiBAQCAtMTkyLDYgKzE5Miw5IEBAIGludCBtc21fYXRvbWlj
X2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBuZXdfY3J0Y19zdGF0ZS0+bW9k
ZV9jaGFuZ2VkID0gdHJ1ZTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0ZS0+YWxs
b3dfbW9kZXNldCA9IHRydWU7DQo+ID4gICAgICAgICAgICAgICAgIH0NCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgIGlmIChvbGRfY3J0Y19zdGF0ZS0+c2VsZl9yZWZyZXNoX2FjdGl2ZSAmJiBu
ZXdfY3J0Y19zdGF0ZS0NCj4gPnNlbGZfcmVmcmVzaF9hY3RpdmUpDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBFSU5WQUwgaGVyZSBtZWFucyB0aGF0
IGF0b21pY19jaGVjayB3aWxsIGZhaWwgaWYgYm90aCBvbGQgYW5kIG5ldw0KPiBzdGF0ZXMgYXJl
IGluIFNSIG1vZGUuIEZvciBleGFtcGxlLCB0aGVyZSBtaWdodCBiZSBhIG1vZGUgc2V0IGZvcg0K
PiBhbm90aGVyIENSVEMgKHdoaWxlIGtlZXBpbmcgdGhpcyBvbmUgaW4gU1IgbW9kZSkuIEkgZG9u
J3QgdGhpbmsgdGhpcw0KPiBpcyBjb3JyZWN0LiBXZSBzaG91bGQgc2tpcC9zaG9ydGN1dCB0aGUg
Y29tbWl0LCB0aGF0J3MgdHJ1ZS4gQnV0IEkNCj4gZG91YnQgdGhhdCByZXR1cm5pbmcgYW4gZXJy
b3IgaGVyZSBpcyBhIHByb3BlciB3YXkgdG8gZG8gdGhpcy4gUGxlYXNlDQo+IGNvcnJlY3QgbWUg
aWYgSSdtIHdyb25nLg0KDQpJZiB0aGVyZSBpcyBhIG1vZGVzZXQgb24gc2FtZSBjcnRjIHdpdGgg
YSBkaWZmZXJlbnQgY29ubmVjdG9yLiBUaGUgbmV3X2NydGNfc3RhdGUgd2lsbCBub3QgaGF2ZSBz
ZWxmX3JlZnJlc2hfYWN0aXZlIHNldC4NClNlbGZfcmVmcmVzaF9hY3RpdmUgaXMgc2V0IGZyb20g
dGhlIGhlbHBlciBsaWJyYXJ5LCB3aGljaCB3aWxsIGR1cGxpY2F0ZSB0aGUgb2xkX3N0YXRlIGFu
ZCBqdXN0IGFkZHMgc2VsZl9yZWZyZXNoX2FjdGl2ZSB0byB0cnVlIGFuZCBhY3RpdmUgdG8gZmFs
c2UuDQpzbyB3ZSBjYW4gYmUgY29uZmlkZW50IHRoYXQgaWYgd2UgYXJlIGNoZWNraW5nIGZvciBz
ZWxmX3JlZnJlc2hfYWN0aXZlIHN0YXR1cyB0aGVuIGl0IHNob3VsZCBiZSBjb21pbmcgZnJvbSB0
aGUgbGlicmFyeSBjYWxsLg0KDQpBbHNvIHRoZSBFSU5WQUwgaXMgcmV0dXJuZWQgdG8gdGhlIHNl
bGZfcmVmcmVzaCBsaWJyYXJ5IEFQSSBhbmQgdGhlIGZ1bmN0aW9uIHdpbGwgYmUgcmV0aXJlZC4N
CkFuZCBzZWxmX3JlZnJlc2hfYWN0aXZlIGlzIGNsZWFyZWQgb24gZXZlcnkgY29tbWl0IDogaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1u
ZXh0LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jI24x
NTgNCg0KVGhlIGFib3ZlIGlzIHRydWUgZm9yIGRpZmZlcmVudCBjcnRjIGFzIHdlbGwuDQpwbGVh
c2UgbGV0IG1lIGtub3cgeW91ciBjb21tZW50cy4NCg0KVGhhbmtzLA0KVmlub2QuDQogDQo=
