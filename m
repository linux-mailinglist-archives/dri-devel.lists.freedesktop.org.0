Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF9B32381E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 08:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ADF6EA27;
	Wed, 24 Feb 2021 07:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 806 seconds by postgrey-1.36 at gabe;
 Wed, 24 Feb 2021 07:02:03 UTC
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F736EA5F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 07:02:03 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11O6jYkN015264; Wed, 24 Feb 2021 06:48:36 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 36w0ymturc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 06:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlRE1MUzd9854R8VT8Wbfkwlp5SrQY54nSCqIhFID6bM8p2gbPJJkNAxQaU+nSRfXABol3tNxgx/WIIvNumm75WnN2yIJCCxwNyD1FYyoXSvYMgCMM/B8wcUB8evQV1AApPnUil6kXEdMZpHthMT8wLhxjvexUeUaNjO2ej0q7rHj7MRM6r16QzkQ1GnherrLA7iJ/9nv771SwjKFfMNG9WhF0fD/sr1gPOaeSCRFzW9SqZjhK4m/zUAnarydj7hKe4twQjhiTrzPEQ1JpFQWMY25XNabvvAeHi4kn6VYYpXYImid2LAxywKfKiq/drspTIi2bKNStDIm4chBn0wsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N37LfyqeB/Y7Hov9jr3gImj5owT3IzbTNE6qWyTXww4=;
 b=E664vYgd02Fte/UoAZsMysx5Z2CvsI9eSnNCN462ughM2Cs0VVvZIeaKaJK3sekYfccebw/JDezVO+PJxaTa+NAk3kj5p0lXSRSOpCMZE4L1StFFNjLXHqKyoHml5vO+NmG7cG05W13E799azFfPEDmcWiwKqkL0K5TtDo7aPlnrYmcku9UkjhdozrTRPYexAxLTazff7hDv3q+Gc4qWg5266DHQVTXhsqpFyP2HtXYuygKqz5jaIznHBYX9ELcs3SBnfpZBonJWju8OqQ9wWQ7a6gxsTzWb/pxYb9CkYKKo80kzkBtYK81dVaKWk7rE88rcdM3rEMbgznbFf/tMug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N37LfyqeB/Y7Hov9jr3gImj5owT3IzbTNE6qWyTXww4=;
 b=uJl8u93Cp0ebGS0legVVEAaU2ec4K6n9RnR39UtMM5AsJETjUaqlZbzTa79fV7VIL4pmpRTx3v58HBn0BxDu0lnoyzQcXdapj8q1k+5m0LGtLxVO9FmJ90eBMzohwdQVaizK4AnSw7NKxvhoMKxqtQMwD4fxdAfAuUEacrLRFTy1+L2jtrCzRfK1IydBi1pA1a3eOrLQeoKEYMHedOTKSLIjlLTO00Zyo8Uu7tMN0iUa4LXbxldyCw7x6U80tNM+RxHRP/TQN8zptH766xIsH6nqp2hRAGLWDZBdDaakrz42zd8OIFz33TxuZ5HZM5YosGd2jBQO+2ICLF/WN17lCA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3588.eurprd03.prod.outlook.com (2603:10a6:208:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 06:48:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6156:8f40:92f3:de55%8]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 06:48:30 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] drm/xen: adjust Kconfig
Thread-Topic: [PATCH] drm/xen: adjust Kconfig
Thread-Index: AQHXCgKuZuE2hAvl4Eu58Fslz5uDM6pm3hiA
Date: Wed, 24 Feb 2021 06:48:30 +0000
Message-ID: <a9597f1a-39a6-3664-8617-90338e7943d0@epam.com>
References: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
In-Reply-To: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32ca0dee-2568-4c6d-6088-08d8d8903248
x-ms-traffictypediagnostic: AM0PR03MB3588:
x-microsoft-antispam-prvs: <AM0PR03MB3588CDE7EBA6038AD0B0D461E79F9@AM0PR03MB3588.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dYyI48JUuw3EBXEsQei+n7tSAq0RXBVfEqyGDjp3skOEm6pGPNvEL8g44mAogvsJdV4fidqk3brXxLHCHv3ld6wdiN0BvV/pJTseuUNMr/uzQlbxJNuACoz4DrDj6NQpj9wP34nd3KNUGUZ22MaugXUhVXoO3gGObsi4YcRnJlu5I03SR5oy1LePS8SlrdgEMr45PJHAbwOBZHRAB4ikCZdFFA4qm5nhXWpk8NqsQucao1nC+UdosorsrmE5lZ9oRZ0OxZhvDEQQK4TH55w0I2EGmepwyUoLHXzLp0LbUx48lUJ8+0mTJL6AjlBChcF1VyQ04bJSdjXkXKOsSRnbK2XGpNEg9qkxT0RPl7vMLiEDkT9XsDZFDfWIufCVvz4W5JCHhANwNcNk1C2wqR4yUZ49NdVTogOMM2zbZatVjUziH4aDiA4oaHdbPs4vJl0owPwMSeLhBWYwTdDcaP95kq4pGTfVKrNdOkcFZzYUq2HM0JDp/NX1H9moRheMW/ZLh/3hOlehlnaTCtZrEbc9n+CQ2VCxa+SYFOTNfiAa1Cm5aNagWKVS8seBCOswHd3uiVstR+aZPN35YE6SyDVyPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(26005)(5660300002)(36756003)(6512007)(54906003)(8936002)(186003)(64756008)(76116006)(66446008)(4326008)(478600001)(71200400001)(86362001)(83380400001)(66946007)(316002)(66556008)(66476007)(31686004)(31696002)(8676002)(6486002)(2906002)(6506007)(6916009)(53546011)(4744005)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R21ZdVFobFFoWUdFcGJvN2RJb3RjWFptdnhueXRVRTZZdFhsdUxIYkV2OUNX?=
 =?utf-8?B?T3dTbDJ5MFJXZXlwcmt5RDVTdVBMTHJoRGVZL0t3R2w1OWl0RlJucE5FNnRG?=
 =?utf-8?B?d0hJVFY0bFgrQXFGbWJVQ2huWmE1ZmxmUGxyMUt3M1UvZHo1dWFWQUtyWVQr?=
 =?utf-8?B?Qkx1THp0aXkyNVdNN3RndCtDTDBqZjZQWmR4WW0yMDUxVk16SXhkYkdDS2cw?=
 =?utf-8?B?ZE9PekJBbSthWGRyQngvQXk2M2ZMZ2s5TGIrQzFlVEE3YU5nTVM2WFg5SjMz?=
 =?utf-8?B?S2NiQmJwQXF6RGMwOENYT2pzdCtNdEg5VUtRaVIzVW12QzZ2eTRHNjVGM2Fv?=
 =?utf-8?B?OWJzaUFSV09nbTdzYlVZakxkeFY0NlFqY1N3SmE0dlA2S1RuTHI4SS85Q2w5?=
 =?utf-8?B?L0x3Y00zZXlzT2tjeEF5QjVvcTdxd1pyMFJMdlBKd0xHWFQ2Y0RmUXBuckNU?=
 =?utf-8?B?SUZvUndkRmdoUVpGUm1ZMVJiMUd3c0R4ekltYUlreXdBWG53YUpwa3kxWHFz?=
 =?utf-8?B?b0pHRkJYUlZ5WEtXOW5ma3R5ZGxIK3hNdlBpREtBdko4MWdLN2Fjc09MUlZr?=
 =?utf-8?B?aCt5eDYrTVorSjd4aDh1a0l5ekRTZFkrVnNaVCtFb2Z0cU04SUFNcE9hOTF6?=
 =?utf-8?B?UDBNYWpVU2c3N3ZQQ1JFTkN4UUFoeHdXNWcwL3JGYW81MDduS29FOHQxekpE?=
 =?utf-8?B?dXFDZVRVSWQxWjNPV3hGMTVXYkFUOVg1bnZMaCtwNmZBNU1iSDRCQUpWT3lV?=
 =?utf-8?B?Z0YwK2FIenZuZUZRK0loNXFrNm9SdUZSNk5NWnBnZUduRjNkNmswR2x0eTRJ?=
 =?utf-8?B?UU1Bd0tBeWUrOFlGM0VrMm1wODRNck8wTGpwWkVxUFNrVFdFWmVlTm1wL3RV?=
 =?utf-8?B?ZVdLQXByWG5mYkdmWkJwSVhUaXlGSWZOb0hTS01RS3l4eUo5Y2ZZN3N2SEt6?=
 =?utf-8?B?ZE4rdUcwREJrTWo0R1NudzR1V3JQbUpzYWt1T2hFaTBZMDJhVElObms4WWhG?=
 =?utf-8?B?R1gyQmFmRXZTdUJOUzBqL1JLaFRjYUxMd2tVeGVXbUExMVhLUUlDU055ZFRq?=
 =?utf-8?B?Tk91cWxYaUswTXR1UVkxUk5GTzUrOW1HTW5zbEFoc0lKemFhVGlSM3VMdUdU?=
 =?utf-8?B?OTJWckRsK1JSK0I3V0JGdlRRcUN6d2hVakpLaXpwNHpVL1NuN0NjQThkbE9S?=
 =?utf-8?B?UUJpRlVPMGw2bGUwSVlKaE9uVUgvdVgyYnNlQ2J6NjJNdzJJVklpVW10Q2M4?=
 =?utf-8?B?NHlaQjB4dDd2cGpObVNJU0RMWGJqVk9NSkFDS3RrM0hDR0U3aTh6dndpSklQ?=
 =?utf-8?B?QUVnMmpKVXV5ODQvWExPZUJsSWlCY1dqL1RDUlpmcUpJVVB6OVQxMk80MllN?=
 =?utf-8?B?aksyZ1lTdTRLdTEyZ1l5RHdMN25uQTBRa0ZCSWt1d015VnZUTStRZVBEYzEr?=
 =?utf-8?B?dTN5YkFjcmZ5UFhibExXdXNWTFJHYkQyTjhxZkZLYWlyVU9YLy96R1o4YWNl?=
 =?utf-8?B?cnYzYlVMc3FOOGhkNHp4dnNFaHA3TmpTbFdOUkFHem1kcWJ6QktEckVCRno1?=
 =?utf-8?B?MDFocXNvT3N1b0ZVWkRxZC9Yd1ZvVW1ubnJkUWdQTVUzc0xoa1hzdThiLzl2?=
 =?utf-8?B?N1dlOWlIVS8xVHFSTUliMGlvTGZ5WWVoVWNEZGpxaHBJZkRaaFBlMHVHU2Jj?=
 =?utf-8?B?OHN6QWVBUEMxRTF2WkxHbXFPMWFVdHdnUHpJM3drTGxWemNJNklaeXRiRUxK?=
 =?utf-8?Q?5pcj/TMM05u8WVzlS649VF58P9Gm89dzLOpC1W2?=
x-ms-exchange-transport-forked: True
Content-ID: <4CE83E0FC65F6A4C9D0C37EA96107146@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ca0dee-2568-4c6d-6088-08d8d8903248
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 06:48:30.1975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CLzEbpxFBAPZQfLE7uYk7NfEybKbxHwztu2T1HVUMSF/SmztboX8BnUJ+0AjkRun0w0IrJ+rIwjwxCkV+dEblbINrdZGKG8wD9lbL30gNHhCo3mtx6CXa802pvqNXFst
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3588
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240053
X-Mailman-Approved-At: Wed, 24 Feb 2021 07:55:32 +0000
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Jan!

On 2/23/21 6:41 PM, Jan Beulich wrote:
> By having selected DRM_XEN, I was assuming I would build the frontend
> driver. As it turns out this is a dummy option, and I have really not
> been building this (because I had DRM disabled). Make it a promptless
> one, moving the "depends on" to the other, real option, and "select"ing
> the dummy one.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> --- a/drivers/gpu/drm/xen/Kconfig
> +++ b/drivers/gpu/drm/xen/Kconfig
> @@ -1,15 +1,11 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_XEN
> -	bool "DRM Support for Xen guest OS"
> -	depends on XEN
> -	help
> -	  Choose this option if you want to enable DRM support
> -	  for Xen.
> +	bool
>   
>   config DRM_XEN_FRONTEND
>   	tristate "Para-virtualized frontend driver for Xen guest OS"
> -	depends on DRM_XEN
> -	depends on DRM
> +	depends on XEN && DRM
> +	select DRM_XEN
>   	select DRM_KMS_HELPER
>   	select VIDEOMODE_HELPERS
>   	select XEN_XENBUS_FRONTEND
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
