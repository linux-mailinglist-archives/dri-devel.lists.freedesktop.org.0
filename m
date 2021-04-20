Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A663654B6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF08E89219;
	Tue, 20 Apr 2021 09:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com
 [185.132.183.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C789219
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:03:18 +0000 (UTC)
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K9192P014307; Tue, 20 Apr 2021 09:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=S1;
 bh=W97UwFrKOsg0HT4UFrJ4MCeX70b2tg+9O5VbwwrrfOU=;
 b=cD1WQtnL7VK19prmsA3OF3RfWDiGKPssjPfnt0UFUtSwzMqA+QunkqLBbEMLeuifwa5n
 GdbCJcPmU+MzL2cocjoC3wMc18gEghNqrCT8sZYjuSsbV61fb9Cg6I/fUTDWgeckkUsZ
 ArLGJRcGLwnVNVkH5R6rKdP7Fveiqx77gpnLKVTqLwPb7mt1NrqmvHWDAzXvWaBCvnLl
 MbjMAvItN5ThPsh912IkSRhlqTtvnzt+Qoi+ZspThBBwjMjw1DXDQRIhfgd3mskHuMGI
 sDgwiicQ5cC+edaBvEnkxtcb/6vC1aTv4DUOz9/RbZ/vBgVW8vjl2vj9Gjzkd4E+kwbd kw== 
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx08-001d1705.pphosted.com with ESMTP id 37ypj1sxtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 09:03:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjPbMnBq6GKLyO1pU7Zgh3R0TXuRbcuFyLBQMUr+81MmEvIZj5HtONFawBVg6sXCF8Qd1sZp97eGT5bT0ZijqAP8oFLMZIVsFs0s54CmMcZES+JorCkYgJVTsRYJsntMYXmy05EgD2W+xN+kZXivKSWvYM4oZQxrPIbFeqIUT1fkNqEzb8ikw3DeEE57fLkXZV8l7/n0TNSllS11E/C+wI11xiJ97SF+yg7SelLPpqTB8BohMSKhLA+LO4GSpk8Fpo4UYIljBZ1787qjUV75KKET0ZF5clTNvgThUkvBmtK6+qqqNQZUgC2h741YRTHNPrDMeHKMA6kcG8uZ2xa49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W97UwFrKOsg0HT4UFrJ4MCeX70b2tg+9O5VbwwrrfOU=;
 b=bPoX7kf31VMmw3YShVvxSyzUp8epwSgYT1w4Jm5HBMxAyrlBiy3E4RQm5NycpqcQNMgLPojrw+iRi/BuWmTHywqywsfJPVoWQxmDVQHS37ewVBToAgRDe7ZMZ+epEBIZFgnnDT92jeTQi3FhZ/mSoiPykaKS0LLx7ISAJw5RJwlCN/cyYenJL5t2ZIezbuT2Y9eDeRScgYZO6ikHKWdjVkotI08GCmCOFX/Z632TAIu3angEXU3/HSNshK7JPQTfb8nNyrq+or8uG9uOuDClJVwvB+hEjO2c/37x/FCfckNgz+nxMOmt+dWk7086aSHzhntPavo1gLHCkhEn674jSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:306::20)
 by AM9P193MB1048.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 09:02:57 +0000
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0]) by AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0%5]) with mapi id 15.20.4065.020; Tue, 20 Apr 2021
 09:02:57 +0000
From: <Peter.Enderborg@sony.com>
To: <mhocko@suse.com>, <christian.koenig@amd.com>
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Thread-Topic: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
Thread-Index: AQHXM3Yw6ll+UCWErEeaPUdSTn+rzaq7xNSAgAAG/YCAACafgIAABUyAgAAHCICAAAergIAABySAgADyaoCAAAenAIAAA+2AgAAVYwA=
Date: Tue, 20 Apr 2021 09:02:57 +0000
Message-ID: <5efa2b11-850b-ad89-b518-b776247748a4@sony.com>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <YH10s/7MjxBBsjVL@dhcp22.suse.cz>
 <c3f0da9c-d127-5edf-dd21-50fd5298acef@sony.com>
 <YH2a9YfRBlfNnF+u@dhcp22.suse.cz>
 <23aa041b-0e7c-6f82-5655-836899973d66@sony.com>
 <d70efba0-c63d-b55a-c234-eb6d82ae813f@amd.com>
 <YH2ru642wYfqK5ne@dhcp22.suse.cz>
 <07ed1421-89f8-8845-b254-21730207c185@amd.com>
 <YH59E15ztpTTUKqS@dhcp22.suse.cz>
 <b89c84da-65d2-35df-7249-ea8edc0bee9b@amd.com>
 <YH6GyThr2mPrM6h5@dhcp22.suse.cz>
In-Reply-To: <YH6GyThr2mPrM6h5@dhcp22.suse.cz>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=sony.com;
x-originating-ip: [37.139.156.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 796f73d5-f06d-4f36-2d32-08d903db1779
x-ms-traffictypediagnostic: AM9P193MB1048:
x-microsoft-antispam-prvs: <AM9P193MB10487D40556B954484AA228B86489@AM9P193MB1048.EURP193.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hri75q6awjHA6vV8JTD6qfaawfKFpY5MuJQgMES9BColOkiCn4Qbh9E41R699PhRga6gwMM6RMeogY9nGEJmrms5/NL1M6PwDbrml6Kc/eo9ZFGeTkXahYLBvXHueKpcygs6SCT1XM7WB38vmFHI74UrGcpYAPlr7mM3cGMRYKlUxreulxbitc5NTvUgDhrikHlu0nxBb3mGN75SOTVtH1C7a44F/GsyJE9BKZHhTHYYnTuFSwZ4HgEw58X+zDlmz2bJEJQ1HYmQ973qNU2JcXZe+k0toucaVOwpFDvewlFBovfdU42nx4Hh2wMLrGRNzt1ewORlwX90G+7quvvogRWLG5Ia4Qpp+fEJE09sWsXyhU3fuWr8WOTvzPKcY3QmDT7imM5+XbYOASvYy1fPvf0GnELFtF238GjBNoUH3yM8UALuC8yttDfyWQk/siuvcLVW8xMXDhHstTEVMS3vUBRV7XjN3zoSOQyZJ1gJzRu75S2y/L1h9/qaGAKQX7ju9BbIXBF3cOuLnR/Y5r4bzadTjdHdjwRQJnDAQ/OKMt6EY7ErXs6QfOVwd2Uuv5xUWVqVyQi+3dWUR6HR/7Coq3vwM9Zr0bBu9zQfnl0BW531XMZKR+/8FFzbC1QzzKGiJaPrDJ40rukoFxlcJj4VEchK4hJgfP3UKIPaloKB3WDNdZJz2NEpnJcLdwwWpclj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P193MB1491.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(54906003)(76116006)(38100700002)(86362001)(31686004)(36756003)(186003)(83380400001)(122000001)(31696002)(6486002)(478600001)(4326008)(7416002)(26005)(6512007)(71200400001)(316002)(66946007)(66476007)(64756008)(91956017)(66446008)(8676002)(110136005)(4744005)(2906002)(5660300002)(2616005)(6506007)(8936002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QW9QTXo3NFI2Q0c5QWE0SEZBaXAyS2c5Ny8wOHB1R0hmMnZrbk56UDkzcUhl?=
 =?utf-8?B?eG9GOU93eFg3Z3RtaVlBbkc1d25GRmZkcGhDZWE5SHpsUExTOUU5b294Qzlp?=
 =?utf-8?B?RG1MVVlYUnpkUlcrcTF3N0lySFZSZnVVRDgxWEhNTDFXRUYvRGYxV0Y1NVgy?=
 =?utf-8?B?NzgyNDFoRmpiUEF6RGQ0WWtRNlB6V0xmRi9QT1g5eERMZFF6Z25DOGpGT29X?=
 =?utf-8?B?SU9LeGhpRlVOUlRBVHR2SzFHYTRJZVdhM0syeWl6VSsxU1V4WHdHck5sc0Rv?=
 =?utf-8?B?c3c0bnJsMWhWa1pPdjcvR1paaEJpWjBXc1BFTUxQNnd5UVF6cis3WnpjTm9a?=
 =?utf-8?B?b3lieFpMTU9uVFFndVdYc2h4MGpXK3o1T0s1cHBvRmk4R0tObmNiYmxmMzNG?=
 =?utf-8?B?VGVDZ2l0ZEpMdWUxVzR5VlhuL2o0RENkUlFVbzlFL3gzMUZVOVFlRHZhejQ3?=
 =?utf-8?B?N1BHSm1IaEJpczdjSEpKanUyZ3dON0grUzJ6Z3NkcEJqOHAxVTQwckRiUzF6?=
 =?utf-8?B?a1BjQXlGZ1BGQUlqaHJlM1ZCMzJFUEJsU2trVHgwT0FGUEdxZ1hJbDAwVEpw?=
 =?utf-8?B?U0ZZTlhFOXArWG9RZzhNdXdDb2FwWmhXS0Q2bUZRQ0JJdmszV3Z6akFGb2VO?=
 =?utf-8?B?RHA0QVpaanFlNm1LV0NzMXl6VUhGTzFlVU4vTERCYnpkQWlzb1hXejh6Yndt?=
 =?utf-8?B?c0tLWmhSZVp3MStLUld2R3NoRnRxL0NncTcxcTlabk4wR3ZUZlhheVFUWmZp?=
 =?utf-8?B?SDA3Zmt5S3BlV3JMNlFjRFdLWmtSdEpaOEIvYTM1WFE3SkFGNzZ2NzRNc0hm?=
 =?utf-8?B?RWRTeVJIOVBZT0FZNytpOFovRVRJRC9HaEd1WkpYUHZCQVRCQ1lES2sxS2hm?=
 =?utf-8?B?cWtrQnV2UndOY3dtSVU4TTFlTTNpMGtWUElNYnVUbkxMM3NkME1wUE9GVCt6?=
 =?utf-8?B?dVpjMHZYRFlzcVAyS2ZMZVFSUjljbnl5QVlZc0g5OEk4SDdMeXoyK3paNi9t?=
 =?utf-8?B?QnFnK3A3elBCdTl5NytBeWR4SlJUWTd0SnJDUUdJUnFGR2RRbUViOEVKWmlS?=
 =?utf-8?B?ZmZMbEFXUW5GaUFFcEhoR2N6Zm95RFlyNEhVWC9Ic1JXcW1IbmdqREYzY1oz?=
 =?utf-8?B?V0hmSmpzSTVhYWRSazZ6QVZNcG9FaGtOMzhiWVU1QjlSM1lDNEtXUUxGS3pj?=
 =?utf-8?B?bUpLdTQ3K2FMSjR3LzY2bDBtbitjWFFVdzBTNGNPTWk5SFkwUjZsY2ZNRURr?=
 =?utf-8?B?LzdyWElhdnMzNFVFTFRmVW10MDVIN29rMnVxNU5oMXgvNm91a1N0Yy8yVldH?=
 =?utf-8?B?SmpiRG5JaForRGdiNzcxc2NaT3YyZUNUTFYxNnN1NjdoUXl4eitqZDROby90?=
 =?utf-8?B?c3dPOVdXektoWTBUbmJ5UTNaV3F0d01NVEJIS3poSS8yQWl3UmJOVlBHb3o5?=
 =?utf-8?B?QU5xcmRMYlhUZ2JKd2ZnbklTTWV5QjdlQ1lVY1NvR2VYWE1wYTdVcWtXMHEr?=
 =?utf-8?B?TDJWWW1pQ3B3ZVg2eS90Z1dZQllReVppaXU4NjRYMU1BMDd6MXZNSENRWlRo?=
 =?utf-8?B?NVNjSDFRTGIydnZqbWovcE13RFk4MUllSVVSK2MrTXQ3a2RweGM2U1FteVFt?=
 =?utf-8?B?V3FnTlBXejZVUVRHTndwdXVVem9YNTIyUEE5MTU3dmpkNjBUM3VreWZwUGlT?=
 =?utf-8?B?a0NnejlhSG00eFU2U2tCdzRPdkx0ZHVvbDU5bkFMeU56RlNsaFNSUUdpRWlu?=
 =?utf-8?Q?I2h47/IMFEjtGDac5N+QK+MlK5DWEwWxeI+guwn?=
x-ms-exchange-transport-forked: True
Content-ID: <315B595006F4F84C9866F86429B314C0@EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 796f73d5-f06d-4f36-2d32-08d903db1779
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 09:02:57.5457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /YrwRyzJTV0tUceUaZPjrtF133lurlvfj+D+CfwpN5FN1xzWCyw8N8ONf+w0pxV+vk3tAO465YrxPO9P//G8gNhbzb21BTRnnzY+PXqsj6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1048
X-Proofpoint-GUID: cdbTQqXEFf1Nn1Upu3WCUurwiCSrGMgt
X-Proofpoint-ORIG-GUID: cdbTQqXEFf1Nn1Upu3WCUurwiCSrGMgt
X-Sony-Outbound-GUID: cdbTQqXEFf1Nn1Upu3WCUurwiCSrGMgt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_02:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200067
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
Cc: willy@infradead.org, neilb@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 shakeelb@google.com, rppt@kernel.org, samitolvanen@google.com,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, adobriyan@gmail.com, guro@fb.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>> But that isn't really system memory at all, it's just allocated device
>> memory.
> OK, that was not really clear to me. So this is not really accounted to
> MemTotal? If that is really the case then reporting it into the oom
> report is completely pointless and I am not even sure /proc/meminfo is
> the right interface either. It would just add more confusion I am
> afraid.
>  

Why is it confusing? Documentation is quite clear:

"Provides information about distribution and utilization of memory. This
varies by architecture and compile options."

A topology with VRAM fits very well on that. The point is to have an
overview.


>>> See where I am heading?
>> Yeah, totally. Thanks for pointing this out.
>>
>> Suggestions how to handle that?
> As I've pointed out in previous reply we do have an API to account per
> node memory but now that you have brought up that this is not something
> we account as a regular memory then this doesn't really fit into that
> model. But maybe I am just confused.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
