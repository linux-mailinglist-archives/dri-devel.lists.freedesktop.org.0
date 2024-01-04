Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300C8240F7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802D910E464;
	Thu,  4 Jan 2024 11:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF8B10E43D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:43:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 404BLbPp017850; Thu, 4 Jan 2024 11:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 qcppdkim1; bh=FIUep8K78VQb1E2VoN+rWC1KNPN5O0uwATm8HtQ7n6U=; b=Ky
 d6Gf1dJqAQoMvl7go9I8O3c9Ny5FBQjVkOaJU45kS/ozzTQC2ZcI2aYtSNUnuzns
 ihPSPQzJ4GEuc6gm0azyncMeDPAnqJl92rY17j90KtbELwehil+rHEDaBcsyBTvK
 ssAtOz5vA9KhUzv0rPfXWcnO8G+czk8uwIJZNgGZ5IXtmWbExYwK5Sv8xFHVucyR
 O4pyf6P2RUzUxz3P3n2EF63fa7DJQ/GSseclkj3ir+gJ5+PxPgbBRsdfvoYUpEvM
 dWknNWMg+mMDF7uz/1Jc5jDBAcLGBwDdhyDqjrNRSLQHsaKqhru+2d+HfrW8KWRc
 GeYMaowIuqhE5Zx56VwA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vdev61t7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 11:42:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBQQh1xEjPpPn7SiNIgrnRz7lq/hGDr008ygYgmgd8+x1Mh6OM//PVMKlwTVDtwzBEVuTSFBHIHqkSWd7blkElJB2hm39CyeXAv/TtrnjwoipJ1liUX/uCZksdog8H8slg7yzwBpN1KSmEXxjKUK+b0oyxsheszkUHdi4Bwh7SC5iwvik/uuODuTfqRUNHNtbA93H10+MpCDIG39vFhkk356pGFWsPc+ocwpRz9JGKxv8nahct9VTVVffAJlThH7OHfWi6QADCFlqkdJL28DU04kC0CYyKlGPKx6OwY+TQPMtPN1KlIe+G7ABBQazgPhAanXi6hqRvqP68F6yPNCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIUep8K78VQb1E2VoN+rWC1KNPN5O0uwATm8HtQ7n6U=;
 b=ACp7ZK+PJWwr/rWmDQIT2kUaVQn3CTTfT0e/TZERr2PVO+Owtoc6l2Tb07QK5CZ4iI7OkNEOVmj1c+U2aGohsPIFT0mIoc/FE7xgR472nR2iy+TrUHmdyzb3B0M6t0WRCGRo2p23Zw4203wJX8Yaen8fzCPXlOCipPk7Dm14IK7uw8SHlOYRjTWGARsdHwnf5mRvwIgpk5hOfk84GdnYWFFx+OyNDZgPJmkjdVSVq3w+ai8JxKFeMNM7rzj1zB52o8oSHovi6pB4R1mJk+WuPmZU4mrH3QOC3v1RdD3DGbgm8PrceJXkGXJbuKKGLixYBsasiwLR19BxhccxpfV4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL3PR02MB8234.namprd02.prod.outlook.com (2603:10b6:208:341::13)
 by SA2PR02MB7771.namprd02.prod.outlook.com (2603:10b6:806:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 11:42:38 +0000
Received: from BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013]) by BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013%5]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 11:42:38 +0000
From: Ritesh Kumar <riteshk@qti.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Ritesh Kumar
 (QUIC)" <quic_riteshk@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [v1 2/2] drm/panel: Add support for Truly NT36672E panel driver
Thread-Topic: [v1 2/2] drm/panel: Add support for Truly NT36672E panel driver
Thread-Index: AQHaNMcTZ+6asId+jkuhqdiedTMDALC1bxYAgBQtTgA=
Date: Thu, 4 Jan 2024 11:42:38 +0000
Message-ID: <BL3PR02MB82345A9E94DC7C6642BFEBB488672@BL3PR02MB8234.namprd02.prod.outlook.com>
References: <20231222110710.19397-1-quic_riteshk@quicinc.com>
 <20231222110710.19397-3-quic_riteshk@quicinc.com>
 <46526faf-5789-442d-9fb1-ca80a8cadde9@linaro.org>
In-Reply-To: <46526faf-5789-442d-9fb1-ca80a8cadde9@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB8234:EE_|SA2PR02MB7771:EE_
x-ms-office365-filtering-correlation-id: 2e059dca-785b-46fa-e9ae-08dc0d1a40c1
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +/SHENfMpk4CqU+d7YdOudtUv12LOIU0gV9qYhyu3jH2vSodhfQyxKaPwDbEdhfpGxKAchs4Xgz9F9UxEW2a0lz45UKWdj3W4qbRge8lXCCvjInTCpHSihS5zYYisrP8EdgDC6Ud1JcbgsOIEtBed77wqlrKTNfzsHABbISbNPmplMHO65X0ajRWsnRYEXkjIVBHAm/rcWQFWDOIDc4WU0rZEomPJfp7mkn6UdwyM8RO5CKKDu/goFeSXGQD0j+leOIGOLJQ6Rikzovj657k40YgaUCE4+6Kqelp7oOjVfmY6PbWED8PRFcAXj7g0+0rdzUh2eXglrXMT6vhuffuizvJVkaBahX1h+QLJPmC0fhO/VoMZfF4xxDvqdjO7FZ0za/8pdoRvbmoxp2Q1OcWRmlF7126Bao3vk9HQRMQButqAaqGNIYrW8/RpPSSRFlPbz7ws69Fbz9z7YvWm4yw1/pPNrykUy4B7Z7TCEBvhaGLPFcuUZ3QPX410o9GSJci3L2M9tgBtww3LajpNb0A8ja6nflEZ6ofmvSY6ZRIZPyvRGN/uubkpGSGJzLe42oQ1AvNeSsEbaoihsv5T5id03jUsuHNacyaMeex6ccTUVRvbehG9FIicEBnEwr5pJGKc+lX3vUDM6akhDPXXg4pJ+Yuiee0o4mrBorT0LfDepo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB8234.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(38070700009)(7416002)(2906002)(55016003)(52536014)(7696005)(122000001)(6506007)(9686003)(4326008)(8676002)(66556008)(66476007)(66946007)(76116006)(8936002)(478600001)(38100700002)(107886003)(83380400001)(71200400001)(86362001)(54906003)(64756008)(33656002)(110136005)(66446008)(41300700001)(26005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0lKSFF3d3M0Snk4eHlLREJxTHJFZWNTZHU2V25PWENMS2VGenNlaXROTlhz?=
 =?utf-8?B?cElWVzFFVmRVL09JM2ppck8zTjVWQ3JxN0J5czQvZHMreFJ4b3BYeFNuM2NO?=
 =?utf-8?B?WWhnb3krY0ZLWmZ5TkRmSFFHb2VxaldXbkFIdUM4Z09ZdFdtV1lvWEQ2WEJu?=
 =?utf-8?B?dGExdUcvUERNN3F0V253dnIzeHovRnJSdlJ6Yy9SSUZ3QzNRVDFhTmltcGg1?=
 =?utf-8?B?T2FRYk1uSjF0QUVkQnAwL29WQzFMZ0RkRnUxSHF2dnQrVjNhc2tjc0dQd0Zw?=
 =?utf-8?B?R1FkeVBYbEYzSi9ZVStwdWQ5WFFuNDk0SmZDMDFIYndqcGR3OE5seEI0SjZN?=
 =?utf-8?B?WW40WjZZWllCTjRnMSs2dUduNXU0RWpOK3U4TDFIUW5uM2dIbkNtcWE4RnZ0?=
 =?utf-8?B?endKWEpwSDR5U3U2Ymt4UFRVKzFJRFpQdDNDSmF5K2ZFdmZkU3AvSEN5M0d1?=
 =?utf-8?B?ekN4bS91UWlPRWFIYzQ1eCtoOE1RcEd5RmhCcnAxUnRaczU0K01vbmc3QmNP?=
 =?utf-8?B?V1RVeDRveENOV0JrMVJ6eW9DSU0zbTVWOWhRYkcybnBCRzlHVUFGbkNQcUdr?=
 =?utf-8?B?R0pEWldobW41MWhRZllBa0p3Q1hmck1ZU0NVN3FVNkYzYXZURHRVV2ZjampY?=
 =?utf-8?B?TGt5Zm5ORDVLdVZ1NVkrR1czVEJnd3hEVlZ6aFk2YTVMRXRYOU51RmNZdDNv?=
 =?utf-8?B?dmk2MXEzTTVCTWo5YVdaR011R1Z0cUFsNnQxcmdLSEJPbzgyTHVSMis0dElp?=
 =?utf-8?B?cmlrbE5ULy9XWFltaTJHYnFZUXJaM0U5NFd1S29LNkpHVjhFVFI1UWVWelIr?=
 =?utf-8?B?U2Q4YXhzQ3pWSE1LQ1lQaXIwYlhlTDcxRHlxMkdySW1nNzlJblVmY1J1OVBB?=
 =?utf-8?B?OU9taUp6RmhJcVFHU0VWaGRWekZxN0xldjBCaDhSYWxraDdaamZEdEhDeE5L?=
 =?utf-8?B?L2tnZ0l1K2hWNGpIYVREUGFONHI1T2VlVFdEVEZKMVVjSzVYNDdEWnhnMHMx?=
 =?utf-8?B?RkhnUlhseDVaaVZKSDVMTnk3OTJFaWVENUE0eWdmSVQrdlVsUGl6eG12RE9v?=
 =?utf-8?B?a2F0bStOcDc3MlhSZHk4RVFqZkdJOThEVjJncWhER3NLOTlmczl3dE5Lbmk4?=
 =?utf-8?B?YVVOa1BiTUtINU0rTUd0dHZYQ2tCTnZaY1RHcm51bkk4akhnSkJBUEg3N3Ez?=
 =?utf-8?B?UUNHeWtrS3Frc28rNG1aZjdGUUdzd0lhcXZyQ0hFNHpmc21iZWVlQXA2VW5V?=
 =?utf-8?B?amdGTlE3bWFkb1kxVVQ1eFpXQ0NaMjhMK2ViVzdJTXVza1huU1crbDVQQWl4?=
 =?utf-8?B?OFBMUmVMUFhicTJaR1VOMDV5dTJDYkFkZ01acjdMUUZZWW5YNjV6MFhRRU9O?=
 =?utf-8?B?SktsaC9KMVFIMHMwZnZpWU1UNTZKSWFlclJYaTZKdzBGSndmRERhV2FOTGt3?=
 =?utf-8?B?c1FBOTMrY3YvVjhFNFYvM3kvQ2RtUXJRUUlTV0x3djlZTlpFTEZRamhOeTZW?=
 =?utf-8?B?ZjMxRFJFSDVMZkJ2OFM3N2hZZUxKdjlNSStwTVN0bGRpSE5TcUJ3TVRCSWxH?=
 =?utf-8?B?bmN5cUF3dmMvNHkvNEx3WkpBYlJVSVp2RXhUaEdqMUE5Q0FlT3JweHQxeGlO?=
 =?utf-8?B?YVkvU3pTbVlGbGVhalJ4MDcxV284SEh4eHY5blMyV2g1b1VnL2pzN2tIU2Rv?=
 =?utf-8?B?dkE0V0FEcjUyZkRCOEE4RUZNWkFLUEY5NVdLd3Y2MWt1T2tSd0dHeXc3ZkNk?=
 =?utf-8?B?L0N1WVFaeG1xZ2ovMjJoa1lGcER6UFc2RXlMTm1lVjZIOUVZMmQ2dU1ZZ3BF?=
 =?utf-8?B?RDMzcFk0dHNqVWJrZGpaYS9xSHJ2Rmtjb0JndUhLSzVPWi9JL0dNUmNibEt2?=
 =?utf-8?B?RWhBYjd3RE1QYWtTTzBHNXRmTkdTMlJBSURIZmtxTmVYNS9tVlhUcHRNNW9X?=
 =?utf-8?B?Tmp2TXgxMFVaZHhDVGV6dGtsWU04d3ZUbktpdlkrMmVYcjlxcjdFS3NIVHVV?=
 =?utf-8?B?SUlha2toWE1vcG8rKytqeGdacVJ6RHlWWTdKMUFKRTZFbGtKaUVTMDFBeVhH?=
 =?utf-8?B?aHRrdmlsQjIrM0NRV3ZuaXRXTEJLQ0hXYnlzZWQ5VERsTUpZcmR1NVhwTFZk?=
 =?utf-8?Q?Jnzr3YDZOcTrwCSqfzaDNMEty?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: X55jgr15oJQ+cEcE/PnSSuprm0fz40XxkpfkvAqcqkUkuxuuhW4oRJ5Di03l3ex2VVEYuKSvlwT2k6aphs4Yzr5p+6cssgqy40GZDPMK7gfYO3xxVfThXJLNjQN2KMLhIbuVhu6BwjlkGww9sFtNKrxPLL8fjpR6WmleMnL6r9XDuvCwYQEhBAyyekwnVXVYnCG9BGNRyp80fJJreK5D6oWSSOcWs1/ktMGtS1IKwBSRUgGgsciDn35vk1GvyZ3vA2u0y4D4cPPm5iouRWrMSgS4ACujdgnqFJlPYFZH3Da2SZVTpZXlkp09rpO5QB2fj+WPB393hCxP2Nw5aeopzoITxK7To5u1dKrvopqbjtwxwEhCdfAzDvlsA2+H8qWWvqEoKLjvGBUX7x808oMNmy5Fb1I7tguGAjuPGTL/EHDB5/dbp1/Os8+iLkY7Xvth2Eu4E9Hl17uUm3g8IHDws7jTNEm0hHCca+LkBqM6/OcPl5ox9z8dr4ckFccpEvfqFavcpqPUrripdjo0/wucF4izQjKFISEVTO8FIaw/TX3JvQIE/l/CP7X68V4OhGFzBLb9wR8d2b6y7SAABZVMgR6a4xllrN0Y8dKz/ec07bAydKU5kflauhNmDbVIwxn4
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8234.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e059dca-785b-46fa-e9ae-08dc0d1a40c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 11:42:38.6318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uyvwx7qottoJAw2S3GIrjToZhw9iPk8IHYixwamErG/nniHfZg/cgVjbvJ71w/1+2SRjnuijU20zW6i03lCczQrF1VBFUfqJA+XGGjR3F/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7771
X-Proofpoint-ORIG-GUID: 2os3f4Qp0pIWQu_XJhndlQboW_Ear_nR
X-Proofpoint-GUID: 2os3f4Qp0pIWQu_XJhndlQboW_Ear_nR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040090
X-Mailman-Approved-At: Thu, 04 Jan 2024 11:50:06 +0000
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Rajeev Nandan \(QUIC\)" <quic_rajeevny@quicinc.com>, "Jessica Zhang
 \(QUIC\)" <quic_jesszhan@quicinc.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+U2VudDog
RnJpZGF5LCBEZWNlbWJlciAyMiwgMjAyMyA5OjA0IFBNDQo+VG86IFJpdGVzaCBLdW1hciAoUVVJ
QykgPHF1aWNfcml0ZXNoa0BxdWljaW5jLmNvbT47IGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj5rZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQo+Q2M6IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IEplc3NpY2EgWmhh
bmcgKFFVSUMpDQo+PHF1aWNfamVzc3poYW5AcXVpY2luYy5jb20+OyBzYW1AcmF2bmJvcmcub3Jn
Ow0KPm1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3Jn
Ow0KPnR6aW1tZXJtYW5uQHN1c2UuZGU7IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwu
Y2g7DQo+cm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+QWJoaW5hdiBLdW1hciAoUVVJQykgPHF1aWNfYWJo
aW5hdmtAcXVpY2luYy5jb20+OyBSYWplZXYgTmFuZGFuIChRVUlDKQ0KPjxxdWljX3JhamVldm55
QHF1aWNpbmMuY29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlDKQ0KPjxxdWljX3Zw
cm9kZHV0QHF1aWNpbmMuY29tPg0KPlN1YmplY3Q6IFJlOiBbdjEgMi8yXSBkcm0vcGFuZWw6IEFk
ZCBzdXBwb3J0IGZvciBUcnVseSBOVDM2NjcyRSBwYW5lbCBkcml2ZXINCj4NCj5XQVJOSU5HOiBU
aGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUg
d2FyeSBvZg0KPmFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFj
cm9zLg0KPg0KPk9uIDIyLzEyLzIwMjMgMTI6MDcsIFJpdGVzaCBLdW1hciB3cm90ZToNCj4+IEFk
ZCBzdXBwb3J0IGZvciB0aGUgMTA4MHgyNDA4IFRydWx5IE5UMzY2NzJFIHZpZGVvIG1vZGUgRFNJ
IHBhbmVsDQo+PiBkcml2ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUml0ZXNoIEt1bWFyIDxx
dWljX3JpdGVzaGtAcXVpY2luYy5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAgOSArDQo+PiAgZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKw0KPg0KPg0KPkludGVncmF0ZSBpdCB3
aXRoIGV4aXN0aW5nIE5vdmF0ZWsgZHJpdmVyIG9yIGF0IGxlYXN0IGNvbnN1bHQgaXRzIG1haW50
YWluZXJzIHdoYXQNCj50byBkby4NCg0KTm92YXRlayBudDM2NjcyZSBhbmQgbnQzNjY3MmEgZGlm
ZmVyIGluIHJlc29sdXRpb24sIHBvd2VyIG9uL29mZiBzZXF1ZW5jZSAoaW5pdCBzZXF1ZW5jZSwg
ZGVsYXlzKSwgcGFuZWwgcmVzZXQgc2VxdWVuY2UuDQpOVDM2NjcyRSBwYW5lbCBzdXBwb3J0cyBy
ZWZyZXNoIHJhdGVzIG9mIDYwSHosIDkwSHosIDEyMEh6IGFuZCAxNDRIei4gSXQgYWxzbyBzdXBw
b3J0cyBEU0MuDQpUbyBzdGFydCB3aXRoLCBJIGhhdmUgYWRkZWQgc3VwcG9ydCBmb3IgdW5jb21w
cmVzc2VkIDYwSHouIEluIHN1YnNlcXVlbnQgcGF0Y2hlcywgb3RoZXIgY29uZmlndXJhdGlvbnMN
CnN1cHBvcnQgd2lsbCBiZSBhZGRlZC4NCg0KSSBoYXZlIGFkZGVkIFN1bWl0IFNlbXdhbCwgbWFp
bnRhaW5lciBvZiBudDM2NjcyYSBwYW5lbCBpbiBjYy4gV2UgZmVlbCBpdCdzIGJldHRlciB0byBo
YXZlIGEgbmV3IHBhbmVsIGRyaXZlci4gUGxlYXNlIGxldCB1cyBrbm93IHlvdXIgdGhvdWdodC4N
Cg0KVGhhbmtzLA0KUml0ZXNoDQo=
