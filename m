Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E56711CD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D572D10E657;
	Wed, 18 Jan 2023 03:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD3A10E1C4;
 Wed, 18 Jan 2023 03:24:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30I3OV0M016232; Wed, 18 Jan 2023 03:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=P/sNJLA2iFDxfVWE5nt7wVyqwOM6l44nmyJYRhYw404=;
 b=kdsJWwRs0V+738lF4lWcHSDvpgXzemXKpQPinMrwECq/tE6IywSoeIbmsPX2X10Atbvq
 JoUl7V26tyzXcAiAwN1t7XDmwQc20S3/oo2hHa9tIznWDcsNrXyH1EIWvAtbFNrs5Wh+
 X2dzvkvqMW0JDGe1a1d2b0TnqYvdCVKpBficOtRKU4kXDRkNg3FiQN5IIE24g1TpvEp3
 5ZkPSo6aqZg37F8u/kjPsSpOHcMAbEGm8I3r/EkB3mYr+o9UQa8QNI+gJPPEzNQ9/2vA
 HoWPVQLBX9bq2DmL4uBhPFEoPKD1SCL54NSzJmtsMSbtKzShbANVg2aW8JfokYi/mF7P CA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n60bx10g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 03:24:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCvU5znYHxTK+NDqKkc+sny9LtyRJuc9xsrSbGkFv+UCLw2sZQ+g84Kl4hjRk0XWtBteCXpZRuHc6n+HwvC/UlEa0E+EcZODDn+HaXgdX+oAz034EfVumWNrTThp7jxw92ZrGUvz485glo8nl+744X837chpiCDHz7+E1HQxd8981Fzby0sqg8UbPbE8MAx0FV/mJDF6xVt9Cbgzwi/lYfizZNW6jnnqcUEb8lNET7Xyf/6gylypa9o6erOe5bZuEZi9jAy3dwkL66PB0HOVyhcnJdp1QnykYhMnlBLmY2n9bEFi8p7yZ482zygJJq5tAHaRITxxIc4U2/yePpXaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/sNJLA2iFDxfVWE5nt7wVyqwOM6l44nmyJYRhYw404=;
 b=F1drPNSNvWX8nfdcOH7TEHlPE7/RiRR2Q0go0Ngaj1KBlA0pStu9pSJa8Mk2UWVreOnDwr1e9EqYDv7av9fc4Rp7rScCOVhiYsPn//SweKrH8pMwmFF2T1vxjKYEOCPn8f2vPf8z7boA9hX157C1cH1rX4RvHWNaV07hCLM11dtgLuifhE62XGK5kphS6RHAqQKbLJJXsW8LvkOk57bG0USW7XI9gdhPw4fscKeh4V6wpMGQRxAY+3TyWgBN1RruQs7/8XUcEBBCL8Wkfhk/PQGziYxSwVeDT1wqDGjJfcQf5MO0fCBQ7ZVDhRU7/Lz/2oi9/fltqsXWFBqkUzK+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by SA1PR02MB8608.namprd02.prod.outlook.com (2603:10b6:806:1ff::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 03:24:28 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::da70:7200:c727:d1ab]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::da70:7200:c727:d1ab%9]) with mapi id 15.20.6002.013; Wed, 18 Jan 2023
 03:24:28 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Kalyan Thota
 (QUIC)" <quic_kalyant@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/3] drm/msm/disp/dpu1: allow reservation even if dspps
 are not available.
Thread-Topic: [PATCH 1/3] drm/msm/disp/dpu1: allow reservation even if dspps
 are not available.
Thread-Index: AQHZKo/KEYwQWS24mEm5kP+75QVLXq6izjiAgAABY4CAALAvcA==
Date: Wed, 18 Jan 2023 03:24:28 +0000
Message-ID: <BN0PR02MB8142227B547A2BEA43B5B86896C79@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
 <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
 <84849b99-93ab-bc10-39ff-ac46328ede47@linaro.org>
In-Reply-To: <84849b99-93ab-bc10-39ff-ac46328ede47@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|SA1PR02MB8608:EE_
x-ms-office365-filtering-correlation-id: a57de445-9b26-4be8-1412-08daf903820d
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /762lBh00RzQ2CyTnT/KkqTO7rtVJHaw50YwBhQ83oGVHBfmVAYGNC7LaNOqC1MWoxTH/RViST23fUVXZy2SFGQySjbhhfIS5xQZB/YN9Gf7mzhCbG6lPH3NvSgp265AdCD1QCpUvlsBJr+2Hn6WtzF/24BhEDDgLMqpyUrWcumpOdKQsSap0dpupr4IwSv5yTvPtHBkOZZ895lnzfFkO8sS5bdamAvdFI60Aux6aa8sy1oRw8qWECnTAxpHkXC479kptUHlVy7BtSNU+YGxYXYHrjt/LDMFkZndf1/uPx3g+4kAwLAXmdOagVUlBN8GIZBrpCfePP3l/cg///WVEoqTCxB4SQW3p6zsXh7/4vM8jUOIu3xQm5qdJ/lB05rYkwjmH43r7Eed3njxC1MNSHMBjTpW/XlPBZalq+ORFHTnW8d3MhOEfpnxlWMFB1z2U0USkM8vSpl+QOChfayMVhA5gPdXF+Zrv4TmT0k+VcwHvsfzGOExVyMTVKOMAz9xW/3E313p/jrLg8n81+gaUfArv0d2OEzJgXumLIJlyF7xgLt0/IhSwBNgkGjzz6sDvlQzVTBgVnUwquKyPJuDTU0ZQlSi8L63J3RJgu/JZ0oThzmudfKkub32v2m0Rv0cIwbAEQcq1Jc+FS2Sy6hpfdPRc0PfiDvzziY5aFf0nPLF6NfSG6l7xBkbBZhMUPCTLU/TDaN/AGCLDsSGq37B6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199015)(86362001)(38070700005)(33656002)(2906002)(66946007)(66556008)(66476007)(55016003)(76116006)(52536014)(5660300002)(8936002)(122000001)(38100700002)(71200400001)(54906003)(7696005)(110136005)(107886003)(53546011)(6506007)(478600001)(316002)(41300700001)(8676002)(4326008)(66446008)(64756008)(186003)(26005)(83380400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDRpVktMaTBmamNoeVVJQXZPWFQydmFiNWNCR0UyamlqaUphcjJ5a1o0VGdP?=
 =?utf-8?B?OVkrUktORit2Y0JSK3dhM3R2cVFheVJKMWpGWFZ3TWVodUtxVUxMN0tvL3hw?=
 =?utf-8?B?Tjk1S21kZ2hlN1g4UVozK0JXcUpvNE4wSXplNDRISGFiTUJLUUcyNUZKTDhJ?=
 =?utf-8?B?K2s1V2p1K1FDQkpHanU2SEJlb21Vdkk0b0t4WlhRdnpEbVBoY0M0T3o2bWlJ?=
 =?utf-8?B?QXViVEhOOG1INEhFVHJGQ2h4aU5qS2dTdGIyaldHKzJwSFp1Vm5GTDJhamRa?=
 =?utf-8?B?eXFvOEJ4VlhQVlp3clp0ckxrZ1NXTENsZ21mZHJVcW1YdE1kdjFrWTRHdDVE?=
 =?utf-8?B?M3kzNjdzSjV5ZWdTWVhtYjNhZGRGdG84enR3ZHRkeGdPeGs3TmJWbGJ5ZzJt?=
 =?utf-8?B?ZlNNRWUzTUVsYUVhOVFDd3RwdkhnN1h2a1MxNURlK2pwRnlDUEtZSDdkVitV?=
 =?utf-8?B?aWxzaVhYbWNwMDc3eGFMSEp0WXFrWHUvL1lPWVRJa0ZJQk8rU05veEhQMVI2?=
 =?utf-8?B?dDZpZEZ0SU50T2ZFRTMvank3anI1R0JrcVlrUjMxQVJiWkJiNGRUVWdwSi9Y?=
 =?utf-8?B?Y1dCcUlFTDUxcDFseUNIUGFuTkJQT2FCZURTV0RYVDY4ZlAvTU5XbW13ZDBq?=
 =?utf-8?B?MWdVb2dYdHR5L2pwTFI2alhoa0MzNFlJLzRNVktod09qQ01CYkxJeWpueHpE?=
 =?utf-8?B?d0xhT0RLcE55elAwWHVrUVhsend5dXBvZFVOeFJKbG5zL2JvNUY1UkErSjRS?=
 =?utf-8?B?RWpPY3hkRm5RU1UxeTEraDhkcUhIQkVSVWhNNjRHay9DNDdEWFRZTnd3SmZw?=
 =?utf-8?B?T3MwSlc5cm9aZ016VTZVWE1ZWWJ3bjdxUGl4cXNXazY5N3FkYXVOWnRDUjhU?=
 =?utf-8?B?UlI5OEhUY3pHZUJHYjNsMDQwRzIwMzdzYTVhRTRiQ1E3RTFZT21KdHdleHlZ?=
 =?utf-8?B?cjdsVW1OUWtJR2VCZWM5Q21UQzBkcno4YzhjNUI4ZzFlQWFSTFVGdk5xTVN0?=
 =?utf-8?B?R0h0TEJCQ1AxV2c4SHlnSG5TZURZQnE3ckhCRWJqQWhYWW9vZmRJY3k5KzBy?=
 =?utf-8?B?WlV2MTJJVm44dGplYndyNmxrUHZxci8zVlQ4VzN0YWtGcHQrMjh1dlhBQ0li?=
 =?utf-8?B?blUzWVpGbEg5cTNOK3hVSWY3ZFVpUXZGbFQ5UEd4eHlxVmM1RmQxZWpjK1Ix?=
 =?utf-8?B?VEw3VituMmZzRkd3UjA1QzRBdXpNa2V1blM2RzhOWVZZK2NuYXVpU1VIWS8w?=
 =?utf-8?B?WUFWdndzcS9xL1EzVjJnK0R4akJ3UiswaFdwUERJbkVIUFkyWGIyWWlxc2N5?=
 =?utf-8?B?RUQ0ajN4UVA0MUdXRkdIbjFLSVRIMTN6dlg0ZlQ3MnJDc2NxMjZaOVQ0T3U1?=
 =?utf-8?B?MStFeC8vM1lnTEl6REhtOHExeGJtVlVTbVhVM0oxTy90cW1NQUhKdU55N1Jp?=
 =?utf-8?B?YzBYNjR4ZzRWZ1RMWG9zMTVxK09ucnBWbGR1UUI5dzUzYkNVN25YdGQ5Zjc3?=
 =?utf-8?B?UitWZmQwa2FBVzJzaDRnV3BLU1RGcXN6dldsVGJDTzJyZmFQLys1TFljWVVG?=
 =?utf-8?B?OGFYV1JZRFU1MGZzeFZiWWF6TEdONEFBczBuMGQzODdqYjVxdGF5dzVCYkNy?=
 =?utf-8?B?cFZkY1FzVmlUcG5MWW9lVitMOTdNalJ5NUhWMU1KQldyN3lTdlY1UEJPT2ZD?=
 =?utf-8?B?dlYxQVV4a0R6anZwc1hCeHBBVGRISi9MVDhlblFUOHNPV1llQzY1UVdFSUxY?=
 =?utf-8?B?a1NPeU02Z0kyQmlBNkUvdGRzM0lVcEx0aktmYmlicjMya0dSM0pYWXIvVThk?=
 =?utf-8?B?dU9oYzQyNUFZQVdYcFFiT0VBZ01XakR2UUd0ZXV6dlpaNGU0cEV0dUxvNENm?=
 =?utf-8?B?NE5lTFdKQ0U2a1hJMGVOWHdrODZxcWtaZG9reDZqWVVZYVJFUWNuWE1YR2xM?=
 =?utf-8?B?RnBNYmNtckREYTFyeWhTYVJTRk9KSEJNK0diL3Z5YUpVSTZIcFBZbGNuV2Q5?=
 =?utf-8?B?N0E4T1BLMTR2STZwTXpwRXdvWldERlpGMExvSkd1L2ZmUEhDemJFOHJIeEsy?=
 =?utf-8?B?YlY2blBPaFAyUGJOK2ZQRVBYYjl1MTAyc1VKYm9PWm4vZ2p1STBUOTlPblc1?=
 =?utf-8?Q?GIsH/c0vEBDwuc8EmmMov3WV+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: A+MU1k480l7QK//OFSREAdvfVGd/ltfk1Sxds4DonTwXJoCZyo6kINMoQ+QM40poMu8SNdXdOcFzHtEGrdbALhI4DXUdiQA/tmcHGyWY95ZbX5tJDyGBeg0jMqIsgo2xRfu7S+eA/UpXGR/Jm/HQdwV26BW9xXf4jwbUyzCVLyWF2rKJ4kdEGPKr9rg029D4GH53x0hzZriqN5MKUCfcqLmqG8ke1akrA/jTYhK7JpvKAAZ5SRt1+wFJuNAZfqrbBfZRSkaY7KfRTKIo1e8Ion90tM0nGqIvt/yc+8vy4nWFWRUTunNJd7siJUkQPg1iAti5MnDDNI5DRu/YsLJaDW+4gZSEDP+tODRgHZKMXyNfh4c8GPORgqV/sdvhJCClLIu5Mv9tuo9nhMtsZwAGv40R/GYZreLJYxYJ9zy6kedrgC0Bc1zQfhzC9DgZxpX702p9Vb5ZZkaYg2ExvRSf1HkDT5qtzCFPETArJKi9A04xnBxxAt2XL85IUJInGDYbpcc+qHBG4NC8vc/kxQhpixnjbEtSrhC3ZYwitdpcMw26U7cAiiOVENCNjC6cj1/FhPZYv3Mzbuq+sD93g2yjbr5XfrtYbdapHKDJESPuYO9FJAq162bXIDKeNRPR3L/7ikp3+PGE9F1poDpGHmbM0YkPeOtIj3nlIcMnxpIa59JxPqpJK63szDZP8msCKpci0hcK+srqtYhb1gHYFkG8X313S6yGd21EOcj+5VYvoKa361vX59lqw2yEPBxNDZEDwYQ0MgJYanRCtZfMjnE0ATfQTTPSGEBIEsCoy4Ap/FPCGhfS9VuLQ9LeY840gn0jCziCW0c7zBOjpvvTxrjZWhVbAXSWSM4FlWueirzzka4cGF1r8KI0IeKVOqmAjAcbFwCIb++obkBb1ayuocLPsg==
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57de445-9b26-4be8-1412-08daf903820d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 03:24:28.7991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUIyWt/QI09pbIsSh+qxRjNG3ldzxIfGwu1RvjztMIB7D0VOjTPXuOBwPvJsEsUNoGNb9rJ7jDq+f5JHEgn4Dx/JGaW7f+9BVPjh3DBaMPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8608
X-Proofpoint-GUID: 83soE_etwAwseDn2l4RI22P5ImetQE4t
X-Proofpoint-ORIG-GUID: 83soE_etwAwseDn2l4RI22P5ImetQE4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=716 impostorscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180026
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
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj5TZW50OiBUdWVzZGF5LCBKYW51YXJ5IDE3
LCAyMDIzIDEwOjEwIFBNDQo+VG86IEthbHlhbiBUaG90YSAoUVVJQykgPHF1aWNfa2FseWFudEBx
dWljaW5jLmNvbT47IGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFy
bS1tc21Admdlci5rZXJuZWwub3JnOw0KPmZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IHJvYmRjbGFya0BjaHJvbWl1bS5vcmc7DQo+ZGlhbmRlcnNAY2hyb21pdW0ub3JnOyBz
d2JveWRAY2hyb21pdW0ub3JnOyBWaW5vZCBQb2xpbWVyYSAoUVVJQykNCj48cXVpY192cG9saW1l
ckBxdWljaW5jLmNvbT47IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+PHF1aWNfYWJoaW5hdmtAcXVp
Y2luYy5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGRybS9tc20vZGlzcC9kcHUxOiBh
bGxvdyByZXNlcnZhdGlvbiBldmVuIGlmIGRzcHBzIGFyZQ0KPm5vdCBhdmFpbGFibGUuDQo+DQo+
V0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4g
UGxlYXNlIGJlIHdhcnkgb2YNCj5hbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3Qg
ZW5hYmxlIG1hY3Jvcy4NCj4NCj5PbiAxNy8wMS8yMDIzIDE4OjM1LCBEbWl0cnkgQmFyeXNoa292
IHdyb3RlOg0KPj4gT24gMTcvMDEvMjAyMyAxODoyMSwgS2FseWFuIFRob3RhIHdyb3RlOg0KPj4+
IGlmIGFueSB0b3BvbG9neSByZXF1ZXN0cyBmb3IgZHNwcHMgYW5kIGNhdGFsb2d1ZSBkb2Vzbid0
IGhhdmUgdGhlDQo+Pj4gYWxsb2NhdGlvbiwgYXZvaWQgZmFpbGluZyB0aGUgcmVzZXJ2YXRpb24u
DQo+Pj4NCj4+PiBUaGlzIGNhbiBwYXZlIHdheSB0byBidWlsZCBsb2dpYyBhbGxvd2luZyBjb21w
b3NlciBmYWxsYmFja3MgZm9yIGFsbA0KPj4+IHRoZSBjb2xvciBmZWF0dXJlcyB0aGF0IGFyZSBo
YW5kbGVkIGluIGRzcHAuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBLYWx5YW4gVGhvdGEgPHF1
aWNfa2FseWFudEBxdWljaW5jLmNvbT4NCj4+PiAtLS0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9ybS5jIHwgOCArKysrKysrLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9ybS5jDQo+Pj4gYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uYw0KPj4+IGluZGV4IDczYjM0NDIuLmM4ODk5YWUgMTAw
NjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3JtLmMNCj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uYw0KPj4+IEBAIC0z
NDMsNyArMzQzLDEzIEBAIHN0YXRpYyBib29sDQo+Pj4gX2RwdV9ybV9jaGVja19sbV9hbmRfZ2V0
X2Nvbm5lY3RlZF9ibGtzKHN0cnVjdCBkcHVfcm0gKnJtLA0KPj4+ICAgICAgICAgICByZXR1cm4g
dHJ1ZTsNCj4+PiAgICAgICBpZHggPSBsbV9jZmctPmRzcHAgLSBEU1BQXzA7DQo+Pj4gLSAgICBp
ZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlfU0laRShybS0+ZHNwcF9ibGtzKSkgew0KPj4+ICsN
Cj4+PiArICAgIGlmIChpZHggPCAwKSB7DQo+Pg0KPj4gVGhlIGNoYW5nZSBkb2Vzbid0IGNvcnJl
c3BvbmQgdG8gY29tbWl0IG1lc3NhZ2UuDQo+Pg0KPj4+ICsgICAgICAgIERQVV9ERUJVRygibG0g
ZG9lc24ndCBoYXZlIGRzcHAsIGlnbm9yaW5nIHRoZSByZXF1ZXN0ICVkXG4iLA0KPj4+IGxtX2Nm
Zy0+ZHNwcCk7DQo+Pj4gKyAgICAgICAgcmV0dXJuIHRydWU7DQo+Pj4gKyAgICB9DQo+Pj4gKw0K
Pj4+ICsgICAgaWYgKGlkeCA+PSBBUlJBWV9TSVpFKHJtLT5kc3BwX2Jsa3MpKSB7DQo+Pj4gICAg
ICAgICAgIERQVV9FUlJPUigiZmFpbGVkIHRvIGdldCBkc3BwIG9uIGxtICVkXG4iLCBsbV9jZmct
PmRzcHApOw0KPj4+ICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4gICAgICAgfQ0KPj4NCj4+
IElmIHlvdSdkIGxpa2UgdG8gcmVtb3ZlIGR1cGxpY2F0ZSBmb3IgdGhlIChpZHggPj0gQVJSQVlf
U0laRSkgY2hlY2ssDQo+PiBJJ2Qgc3VnZ2VzdCBkcm9wcGluZyB0aGUgc2Vjb25kIG9uZQ0KPj4N
Cj4NCj5JJ3ZlIG1pc3JlYWQgdGhlIHBhdGNoLiBIb3dldmVyIEkgZG9uJ3Qgc2VlLCB3aHkgd291
bGQgb25lIHJlcXVlc3QgRFNQUF9OT05FDQo+d2hpbGUgc3BlY2lmeWluZyB0b3BvbG9neS0+bnVt
X2RzcHAuIEkgdGhpbmsgdGhhdCB5b3UgYXJlIHRyeWluZyB0byBwdXQgYWRkaXRpb25hbA0KPmxv
Z2ljIGludG8gYSBmdW5jdGlvbiB0aGF0IHNob3VsZCBqdXN0IGNoZWNrIGZvciB0aGUgYXZhaWxh
YmxlIHJlc291cmNlcy4NCj4NCg0KVGhlIGxpbmsgaXMgc3BlY2lmaWVkIGluIHRoZSBjYXRhbG9n
dWUuIA0KRm9yIGV4YW1wbGU6DQoNCglMTV9CTEsoImxtXzAiLCBMTV8wLCAweDQ0MDAwLCBNSVhF
Ul9TQzcxODBfTUFTSywNCgkJJnNjNzE4MF9sbV9zYmxrLCBQSU5HUE9OR18wLCAwLCBEU1BQXzAp
LCAgICAgLS0+IFRoaXMgTE0gaGFzIERTUFAgYXR0YWNoZWQgDQoJTE1fQkxLKCJsbV8yIiwgTE1f
MiwgMHg0NjAwMCwgTUlYRVJfU0M3MTgwX01BU0ssDQoJCSZzYzcxODBfbG1fc2JsaywgUElOR1BP
TkdfMiwgTE1fMywgMCksICAtLT4gbm8gRFNQUCANCglMTV9CTEsoImxtXzMiLCBMTV8zLCAweDQ3
MDAwLCBNSVhFUl9TQzcxODBfTUFTSywNCgkJJnNjNzE4MF9sbV9zYmxrLCBQSU5HUE9OR18zLCBM
TV8yLCAwKSwgLS0+IG5vIERTUFAgDQoNCkZvciB0aGUgYWJvdmUgZXhhbXBsZSwgbnVtX2RzcHBz
IHdpbGwgYmUgMSB3aGljaCBpcyBub256ZXJvLiBCdXQgaWYgYSByZXF1ZXN0IGNvbWVzIG9uIHNl
Y29uZCBpbnRlcmZhY2UgYW5kIGlmIHRoZXJlIGFyZSBubyBkc3BwcyB0aGVuIHdlIGFyZSBub3Qg
ZmFpbGluZyB0aGUgcmVzZXJ2YXRpb24gb2YgZGF0YSBwYXRoIGFzIGNvbG9yIGZlYXR1cmVzIGNh
biBiZSBvZmZsb2FkZWQgdG8gR1BVLg0KSWR4IGZvciBMTV8yIGFuZCBMTV8zIHdpbGwgYmUgLTEg
Zm9yIGFib3ZlIGNhc2UgaGVuY2UgdGhlIGNoZWNrIG5vdCB0byBmYWlsIHJlc2VydmF0aW9uLg0K
DQp0b3BvbG9neS0+bnVtX2RzcHAgcHJldmlvdXNseSB3YXMgZmlsbGVkIGJhc2VkIG9uIGVuY29k
ZXIgdHlwZSwgc2luY2Ugd2Ugd2FudCB0byBtb3ZlIGF3YXkgZnJvbSBlbmNvZGVyIGNoZWNrcywg
d2UgYXJlIG5vdyBwYXNzaW5nIGl0IHNhbWUgYXMgTE0gbnVtYmVyLiBJZiB0aGVyZSBhcmUgZHNw
cHMgYXZhaWxhYmxlIHdlIHdpbGwgYWxsb2NhdGUsIA0KaW4gY2FzZSBvZiBub24tYXZhaWxhYmls
aXR5IHRoZW4gd2UgYXJlIG5vdCBmYWlsaW5nIHRoZSBkYXRhcGF0aCByZXNlcnZhdGlvbiBzbyB0
aGF0IGNvbXBvc2VyIGZhbGxiYWNrcyBjYW4gYmUgaW1wbGVtZW50ZWQuDQoNCj4tLQ0KPldpdGgg
YmVzdCB3aXNoZXMNCj5EbWl0cnkNCg0K
