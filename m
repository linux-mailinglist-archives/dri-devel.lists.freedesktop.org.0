Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8148E9D2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 13:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C3610E12D;
	Fri, 14 Jan 2022 12:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91E110E12D;
 Fri, 14 Jan 2022 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642163408; x=1673699408;
 h=subject:from:to:cc:references:message-id:date:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=awuG6n7ug0BL9bM6Z3KtKxLUgG8lVcVUbWJtcfiY9Bg=;
 b=Hmg4X8SSUsYdZrzLQ9osuALri/0QT30nwTp4/OxUCOR1zVil1o+a8aP6
 o484if8PQ2ljwmUxfwqB4rcN68Ie3CHs+Nir1TE5JrhatjlJbInAWFoCu
 F1Rq/TC5xjfdLN42IPTKxrenmLRVVZMoeaTJoJgU4aFGrspBtmOcQaBfx
 aEvlKzubgk03rLMX17IgeRqiXwT8t60uvXEmqSBZoBpxwe9urkZ11JRIk
 ap+uFB2g6tLoYaEv/lLkypROhXja4OijsF/YfFnXYPhfOVH1DMKV9+WoQ
 fDki0lLVfFFQ0knSipzEAC6NkeVij2CgreDaPUmJ3R2mfFQKzysnPut45 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="268599277"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="268599277"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 04:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="516355223"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 14 Jan 2022 04:30:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 04:30:07 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 04:30:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 14 Jan 2022 04:30:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 14 Jan 2022 04:29:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BST743hYmTmugXZ4JzvB3BNBBv33InVpicW0cBtW2rYWNScHImPiS163D1dmg2YL/XWCPzPgnJvaa42Ayteun0KOKBw3TsObEjC2OiBrCnRHLtAs9hCDp42PiiMjhXx1afqNVQtDpHtBkhcWmbjVMYpBv94JpjpMqqve7DGr9RnhVt0y+SjBM7T0LnB4QawHybYy6iSQ0G8Fp5XFx7oVTSm3tcyALs99NNzB26TUkQvLshaNUZu6X1O5Rnh22nFFLypQ/ykrDAkl/Xhopjfd0+BbDf6EGhvtEVgup88eXjfv2qDjDrjQhwf0Q1h0Sh7V6I0/QBcNcsMRuWgyR0MP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y//JvA3hiMnnycSagW6s9cX+tuNgbDgtAQ1TRg4ga04=;
 b=M8/j24OAu/PQyE3AMag7++aSdsXiGcxv1H/bCiEgqvzlo3GfujRviXgmbgL6jpHEh1actZPrP9/Ui3eEQEE3K1ye2rPkcb3ryTZEGbnRyEQUB+iyv2j7Vj3rM6gDcLtwkTSOv5VuFYLm+5FsDfhMKlwjOXKMvQsR5GaCvLt46v2jvGYLbdSNGknLyVqbHuM/VGYzOihl4ZkI78vcFLV2ja67wtBzx2Pkh6gocZNtBnn1UJEzb6tQuoXwRI0jYKW7URMr8Vb+OL76XozCcOi/8j2uvgA1KeF5aZRVYqLPHy2seL5v7vsCc57s9Ldz5fIXens2DbVQL4fnMx7+GEaxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BN6PR11MB4098.namprd11.prod.outlook.com (2603:10b6:405:7f::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 12:29:13 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::e504:eb88:49e1:fec5]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::e504:eb88:49e1:fec5%7]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 12:29:13 +0000
Subject: Re: [RE]: [PATCH v3 10/10] vfio/ccw: Move the lifecycle of the struct
 vfio_ccw_private to the mdev
From: Liu Yi L <yi.l.liu@intel.com>
To: Eric Farman <farman@linux.ibm.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <PH0PR11MB5658A7BB11922E5B6267892AC3619@PH0PR11MB5658.namprd11.prod.outlook.com>
 <595bba117f20742dd581fd951555b0e1f630264e.camel@linux.ibm.com>
 <PH0PR11MB565874CB787A1ACFB12CFF6CC3679@PH0PR11MB5658.namprd11.prod.outlook.com>
Message-ID: <24628dc7-c6b2-1287-b435-e12e7b3d59a8@intel.com>
Date: Fri, 14 Jan 2022 20:28:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <PH0PR11MB565874CB787A1ACFB12CFF6CC3679@PH0PR11MB5658.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK0PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:203:b0::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85c14048-1286-4701-29c0-08d9d75978cb
X-MS-TrafficTypeDiagnostic: BN6PR11MB4098:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB40987C8654A39279ECD70C53C3549@BN6PR11MB4098.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92TqLkTPb/RZ2j7VKEDSKl9RAKXtbY2AtB40FX7vnV4zTH0QVCZFJ26uzthNlN8fcggAPyf93/azUHtixT/y8XaNGnRdXPzjGGzkWjylHdbIN7cKDKaAAhJa+DiTnescMM+9HnPgo4GSycPSxlYyP1mG0fR+mEqBd2jEbLC6nFyEhzg1ZORuHYjhxNGY0RTVImDPUvuRspMjjSYKl297Za0UI58HEiNMwSP4EbuSIrxUDiUmQM+vt9kZy0PGq26qbn6bxwqiq0GrVFsNqEQiTaBWwOJeQOq9aa0iWcLOxqGG37mLBrWRkjbYjc+nXyqrrxsbxKbDEg9Bd+KXydAb8kyqq7fMR38tDIGjFqn7TbAR9duz3JIL3zJgN/mc6S9zRRJmlhS1V5WmaPPYzdmJEiff5vww65eqeXKOFwWeaRZnw1nVoDzcfyIhJx+p0fkZPBmi3kDn7jrt3lzK8Nd6tRsnlbEKjgx/WecT3Xr6s36sG+y1YSjSxl3q8FyfyUKmWBOmI59UnMVcfcuQwXM/jlk4el5lyIetWSZ21UBs7kfM23h8M5yzkdqMTrVI1rJo5TFedZehHyoVAB7yQdu5KPkKQD89jllENyJHMQWs4JDpdRfyEt+XLBYDoK8YEnnok7OTxTuf5erW957NjRWXBte1dBbWiNrA1sKzwKcvZNDYhzxU0rUNeoVn8oV4DkbRooBQTtCD8XlMDeGFx7xyeBRaAO78THgLyFKR7ut+DVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(7416002)(8936002)(6486002)(2906002)(36756003)(6666004)(5660300002)(186003)(6506007)(30864003)(31696002)(110136005)(6512007)(31686004)(508600001)(4001150100001)(54906003)(86362001)(8676002)(83380400001)(316002)(4326008)(2616005)(66476007)(66556008)(26005)(66946007)(82960400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU1MT1FMU3A2S1BPaUdsejY2eTg3cmJSTENRcU94MC8zUzNkQWx6QlJEVHc1?=
 =?utf-8?B?cFRYSWJDUDZ1bHdwR21ic0hqRjlOTmtSRHRKVzdRbitRb1pVWk9leTl0U25x?=
 =?utf-8?B?ZzdTQkFDNXV5akJRN1FDVmphL1JpSGk5YnhPcHRpWDJUNnJhT2F5dUtJbFVv?=
 =?utf-8?B?Nm5zTXAySHgwdSs4bHdFRWthSjVVWnhqNVArREloS25lejI5VnZrL1N3UE9U?=
 =?utf-8?B?eWh1Sy9ycEZ3SjhnMW5sRzZOczd6d1NSeC9sSGpRRkMzSWNjUlB2REhhQndl?=
 =?utf-8?B?ZWxBcjF6d01XbUNBMzlxbXd2dThIYzZqa09RVzNTZzk2ODBMSTJkeFZIQkdG?=
 =?utf-8?B?Z3dxckxlMEx4RXY3eWdFVmlJMU9reXFaMEQ4M1VKcGJ5TFM4dStpd0JPclgz?=
 =?utf-8?B?ZTNYelpUSzZFNW44elkyekpNSmxSVVpsZUxEN1duMlp1YWErYUQ4ZjM1ZEFG?=
 =?utf-8?B?N2l5OGlrVVpZbmZsanJtVE9GbEVDZFlzNUZSSWUxcnVGU0FJUE5pRFcxbDZr?=
 =?utf-8?B?TTNHaVlHNU84TWYrQ01WRlZuNlhLSHRhWlpSRTVHZnRPMzd0SFpVQ3FYS1hF?=
 =?utf-8?B?amRCelhhZ3l6cTQ3QjU1cUV5a0YzRGxha3JRWHArRDFNbUU1U0dXOTlJcHdM?=
 =?utf-8?B?M1c3dXBkK05yTEJZa09qSFBFQTN0RE5abzlwVTZ2enVla0M4RXA0WEtZbnhm?=
 =?utf-8?B?bWhTUXdoYldjZDQ0OEhGVmdFUm9EV003WElWVXJodXIwRnR3UEtodC83eU5N?=
 =?utf-8?B?a3BwVmk4Y3JrUGdOaVUzblZrbXdEb3JGbGZqejlydFZ3YjR6VkluNGlWNjRa?=
 =?utf-8?B?Y1h0elphWGdPYituUUxDU3d5aXVWeXlEelRMMG9yWWdvdmk5WEFueFBLWk81?=
 =?utf-8?B?VDI1NFJjUTFtUlFjZDA0U3BYVTNLK1cxV2VHYXpBZUswZGhid2kyRDNYNTBa?=
 =?utf-8?B?VXVBTGFTam1jT1BQWDhIZGkxNHFGTndIeTltSlZIWWR6eTkzSHJvZWZITWdO?=
 =?utf-8?B?VGs3Z2ZQTzdwT0NYZlZUU01MK1RGV2JESm03WGJ4UjU4Zk5aMmw1ekxVeDM1?=
 =?utf-8?B?QTJLTVF1WDRjai9XVytxeDBiSlY5dlp5WHV0OVVVOWNHc2pSbnlqa1V1YjRX?=
 =?utf-8?B?Qm1aY1lsZWdnNzdRK3VjZlcrVnd4dzV0YWIxVU84VDcxU29ybVhWSlh1VEZQ?=
 =?utf-8?B?eWlJR0hBM1g1ODBrT2pwV1Y5SDVXK0ZTS0lmODV4T016bk0zcSt6aGVlRmtZ?=
 =?utf-8?B?VytJcVJoeTdEdU8vTDJuYWRsbldVV2pmb0taN1dUbVhQS3hjMExYRjhOY2c0?=
 =?utf-8?B?SEZpK2Q2M2JQRm1CSmhjWk9PeDVNUi9FL0lMVGx3UGVWcTg0Vm9KQUp1S3F3?=
 =?utf-8?B?YWo2SFA5ejYzQTFJay8zMmNvejRQN3pWdFdPcGNXVWlsb3hHSUpyMUdHc3Rr?=
 =?utf-8?B?clF3QTN5d0IzR3k2VFlMc0ZjT2o4aGR1UW10czlYVU5BVFlaejkvM0dESmEr?=
 =?utf-8?B?MVVsWDg0U1FUbGszejlHa2JuT1Q5TFhIdTJBdWZuRzhFTUFCaFNyamFPcDF5?=
 =?utf-8?B?WjNUUVQ1UUNjcFJkZDlSVTEyV2tYWnhic0pURXhNanZvbWtZVmxIZ0huaGpq?=
 =?utf-8?B?VUYrSnNoUlJudUpiVCt0YXFCS2IzNEllY1A2VmhxS2s1VTFNVUwrR090eDZE?=
 =?utf-8?B?WFRUM1pTalpoNEFNRElPaVhYUTgrWGNoNWpic3dKTnlHMm54QnZzc0Jid1Nh?=
 =?utf-8?B?c1JQc0RDOTQxZzB0R1FKdFlEVzM5TnpibStQSlZGbGVNVjZiNzNVMWlYMHYv?=
 =?utf-8?B?N3ltYkJLRHRTSlEzVytqbGp0VGRJYit5NnJrcVBFL2hvd1ZGVER5T29nYmU4?=
 =?utf-8?B?L2pjSkhQb2FUMmJ4N0h3djczYjViVGtQQUllUE1TZ3Q3OEFqRW5TeHFYY0lt?=
 =?utf-8?B?Rm1mS3E4UUgyTlNMbTlnNTEybEx5STFsVC9mV0x1bVU0eSs0cWRJYlhNd2lG?=
 =?utf-8?B?eXR1cjZTMkVSRWVGOVdSU0YzbFY3TVNGVk1NSXpMN1ZWMHBmZWNEd1RaTkk3?=
 =?utf-8?B?NGtrRXE4RkNXdjBFNVhTWWwzNU5GZWdnTUNRTTZZNmhDeHJ1d3AxMmthSHdy?=
 =?utf-8?B?OFh6cDBicm1jQmNpbnpody8rVjVNTDBlQVgwdERPYWFHSitZc1ladjg0RHBC?=
 =?utf-8?Q?RnO2KootHM7XtyyEuXaunaU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c14048-1286-4701-29c0-08d9d75978cb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 12:29:13.3276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3TIPQ7JJw1MkBqvl2LFh0/gF1MHcPyx5UQh0R1hlJ61CQOlBUV+GVXOtCv6Idvqxy9PYgoNF7IxgSr/s3268w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4098
X-OriginatorOrg: intel.com
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
Cc: Matthew
 Rosato <mjrosato@linux.ibm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, Harald
 Freudenberger <freude@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eric,

Hope you are back from new year holiday.:-) Have you got chane to consider
this patch?

Regards,
Yi Liu

On 2021/11/30 19:32, Liu, Yi L wrote:
>> From: Eric Farman <farman@linux.ibm.com>
>> Sent: Tuesday, November 30, 2021 1:18 AM
>>
>> On Wed, 2021-11-24 at 12:25 +0000, Liu, Yi L wrote:
>>>> From: Jason Gunthorpe <jgg@nvidia.com>
>>>> Sent: Fri, 1 Oct 2021 14:52:51 -0300
>>>>
>>>> The css_driver's main purpose is to create/destroy the mdev and
>>>> relay the
>>>> shutdown, irq, sch_event, and chp_event css_driver ops to the
>>>> single
>>>> created vfio_device, if it exists.
>>>>
>>>> Reframe the boundary where the css_driver domain switches to the
>>>> vfio
>>>> domain by using rcu to read and refcount the vfio_device out of the
>>>> sch's
>>>> drvdata. The mdev probe/remove will manage the drvdata of the
>>>> parent.
>>>>
>>>> The vfio core code refcounting thus guarantees that when a
>>>> css_driver
>>>> callback is running the vfio_device is registered, simplifying the
>>>> understanding of the whole lifecycle.
>>>>
>>>> Finally the vfio_ccw_private is allocated/freed during probe/remove
>>>> of the
>>>> mdev like any other vfio_device struct.
>>>
>>> Hi Eric,
>>>
>>> how about the status of this patch?
>>
>> Hi YiLiu,
>>
>> To be honest I never got this far in the series, as the middle of the
>> series got into some more involved rework than I had the bandwidth to
>> consider. Not sure I'll be able to do anything with it before the year
>> end holiday, but I've noted your interest in getting this in line with
>> the rest of vfio_device so I don't drop it too far down the list.
> 
> thanks. look forward to your further thoughts on it. e.g. the rework
> things and gaps in this cleanup.
> 
> Regards,
> Yi Liu
> 
>> Thanks,
>> Eric
>>
>>> I found it is a good clean up to make
>>> vfio ccw behave same with other vfio_device users. Also, I'd like to
>>> do a clean up to consolidate the vfio_device allocation which needs the
>>> vfio ccw private allocation happen in the mdev probe. So it would be nice
>>> to build the cleanup based on this patch.
>>>
>>> Regards,
>>> Yi Liu
>>>
>>>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>>> ---
>>>>   drivers/s390/cio/vfio_ccw_drv.c     | 67 ++++++++++++++-----------
>>>> ----
>>>>   drivers/s390/cio/vfio_ccw_ops.c     | 40 +++++++----------
>>>>   drivers/s390/cio/vfio_ccw_private.h | 23 +++++++++-
>>>>   3 files changed, 69 insertions(+), 61 deletions(-)
>>>>
>>>> diff --git a/drivers/s390/cio/vfio_ccw_drv.c
>>>> b/drivers/s390/cio/vfio_ccw_drv.c
>>>> index 18ad047811d111..c5582fc9c46c9e 100644
>>>> --- a/drivers/s390/cio/vfio_ccw_drv.c
>>>> +++ b/drivers/s390/cio/vfio_ccw_drv.c
>>>> @@ -86,13 +86,19 @@ static void vfio_ccw_crw_todo(struct
>>>> work_struct *work)
>>>>    */
>>>>   static void vfio_ccw_sch_irq(struct subchannel *sch)
>>>>   {
>>>> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
>>>> +	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
>>>> +
>>>> +	/* IRQ should not be delivered after the mdev is destroyed */
>>>> +	if (WARN_ON(!private))
>>>> +		return;
>>>>
>>>>   	inc_irq_stat(IRQIO_CIO);
>>>>   	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
>>>> +	vfio_device_put(&private->vdev);
>>>>   }
>>>>
>>>> -static struct vfio_ccw_private *vfio_ccw_alloc_private(struct
>>>> subchannel *sch)
>>>> +struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device
>>>> *mdev,
>>>> +						struct subchannel *sch)
>>>>   {
>>>>   	struct vfio_ccw_private *private;
>>>>
>>>> @@ -100,6 +106,8 @@ static struct vfio_ccw_private
>>>> *vfio_ccw_alloc_private(struct subchannel *sch)
>>>>   	if (!private)
>>>>   		return ERR_PTR(-ENOMEM);
>>>>
>>>> +	vfio_init_group_dev(&private->vdev, &mdev->dev,
>>>> +			    &vfio_ccw_dev_ops);
>>>>   	private->sch = sch;
>>>>   	mutex_init(&private->io_mutex);
>>>>   	private->state = VFIO_CCW_STATE_CLOSED;
>>>> @@ -145,11 +153,12 @@ static struct vfio_ccw_private
>>>> *vfio_ccw_alloc_private(struct subchannel *sch)
>>>>   	kfree(private->cp.guest_cp);
>>>>   out_free_private:
>>>>   	mutex_destroy(&private->io_mutex);
>>>> +	vfio_uninit_group_dev(&private->vdev);
>>>>   	kfree(private);
>>>>   	return ERR_PTR(-ENOMEM);
>>>>   }
>>>>
>>>> -static void vfio_ccw_free_private(struct vfio_ccw_private
>>>> *private)
>>>> +void vfio_ccw_free_private(struct vfio_ccw_private *private)
>>>>   {
>>>>   	struct vfio_ccw_crw *crw, *temp;
>>>>
>>>> @@ -164,14 +173,14 @@ static void vfio_ccw_free_private(struct
>>>> vfio_ccw_private *private)
>>>>   	kmem_cache_free(vfio_ccw_io_region, private->io_region);
>>>>   	kfree(private->cp.guest_cp);
>>>>   	mutex_destroy(&private->io_mutex);
>>>> -	kfree(private);
>>>> +	vfio_uninit_group_dev(&private->vdev);
>>>> +	kfree_rcu(private, rcu);
>>>>   }
>>>>
>>>>   static int vfio_ccw_sch_probe(struct subchannel *sch)
>>>>   {
>>>>   	struct pmcw *pmcw = &sch->schib.pmcw;
>>>> -	struct vfio_ccw_private *private;
>>>> -	int ret = -ENOMEM;
>>>> +	int ret;
>>>>
>>>>   	if (pmcw->qf) {
>>>>   		dev_warn(&sch->dev, "vfio: ccw: does not support QDIO:
>>>> %s\n",
>>>> @@ -179,15 +188,9 @@ static int vfio_ccw_sch_probe(struct
>>>> subchannel *sch)
>>>>   		return -ENODEV;
>>>>   	}
>>>>
>>>> -	private = vfio_ccw_alloc_private(sch);
>>>> -	if (IS_ERR(private))
>>>> -		return PTR_ERR(private);
>>>> -
>>>> -	dev_set_drvdata(&sch->dev, private);
>>>> -
>>>> -	ret = vfio_ccw_mdev_reg(sch);
>>>> +	ret = mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
>>>>   	if (ret)
>>>> -		goto out_free;
>>>> +		return ret;
>>>>
>>>>   	if (dev_get_uevent_suppress(&sch->dev)) {
>>>>   		dev_set_uevent_suppress(&sch->dev, 0);
>>>> @@ -198,22 +201,11 @@ static int vfio_ccw_sch_probe(struct
>>>> subchannel *sch)
>>>>   			   sch->schid.cssid, sch->schid.ssid,
>>>>   			   sch->schid.sch_no);
>>>>   	return 0;
>>>> -
>>>> -out_free:
>>>> -	dev_set_drvdata(&sch->dev, NULL);
>>>> -	vfio_ccw_free_private(private);
>>>> -	return ret;
>>>>   }
>>>>
>>>>   static void vfio_ccw_sch_remove(struct subchannel *sch)
>>>>   {
>>>> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
>>>> -
>>>> -	vfio_ccw_mdev_unreg(sch);
>>>> -
>>>> -	dev_set_drvdata(&sch->dev, NULL);
>>>> -
>>>> -	vfio_ccw_free_private(private);
>>>> +	mdev_unregister_device(&sch->dev);
>>>>
>>>>   	VFIO_CCW_MSG_EVENT(4, "unbound from
>> subchannel %x.%x.%04x\n",
>>>>   			   sch->schid.cssid, sch->schid.ssid,
>>>> @@ -222,10 +214,14 @@ static void vfio_ccw_sch_remove(struct
>>>> subchannel *sch)
>>>>
>>>>   static void vfio_ccw_sch_shutdown(struct subchannel *sch)
>>>>   {
>>>> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
>>>> +	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
>>>> +
>>>> +	if (!private)
>>>> +		return;
>>>>
>>>>   	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
>>>>   	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
>>>> +	vfio_device_put(&private->vdev);
>>>>   }
>>>>
>>>>   /**
>>>> @@ -240,14 +236,14 @@ static void vfio_ccw_sch_shutdown(struct
>>>> subchannel *sch)
>>>>    */
>>>>   static int vfio_ccw_sch_event(struct subchannel *sch, int process)
>>>>   {
>>>> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
>>>> +	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
>>>>   	unsigned long flags;
>>>>   	int rc = -EAGAIN;
>>>>
>>>> -	spin_lock_irqsave(sch->lock, flags);
>>>> -	if (!device_is_registered(&sch->dev))
>>>> -		goto out_unlock;
>>>> +	if (!private)
>>>> +		return -EAGAIN;
>>>>
>>>> +	spin_lock_irqsave(sch->lock, flags);
>>>>   	if (work_pending(&sch->todo_work))
>>>>   		goto out_unlock;
>>>>
>>>> @@ -260,7 +256,7 @@ static int vfio_ccw_sch_event(struct subchannel
>>>> *sch, int process)
>>>>
>>>>   out_unlock:
>>>>   	spin_unlock_irqrestore(sch->lock, flags);
>>>> -
>>>> +	vfio_device_put(&private->vdev);
>>>>   	return rc;
>>>>   }
>>>>
>>>> @@ -294,7 +290,7 @@ static void vfio_ccw_queue_crw(struct
>>>> vfio_ccw_private *private,
>>>>   static int vfio_ccw_chp_event(struct subchannel *sch,
>>>>   			      struct chp_link *link, int event)
>>>>   {
>>>> -	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
>>>> +	struct vfio_ccw_private *private = vfio_ccw_get_priv(sch);
>>>>   	int mask = chp_ssd_get_mask(&sch->ssd_info, link);
>>>>   	int retry = 255;
>>>>
>>>> @@ -307,8 +303,10 @@ static int vfio_ccw_chp_event(struct
>>>> subchannel *sch,
>>>>   			   sch->schid.ssid, sch->schid.sch_no,
>>>>   			   mask, event);
>>>>
>>>> -	if (cio_update_schib(sch))
>>>> +	if (cio_update_schib(sch)) {
>>>> +		vfio_device_put(&private->vdev);
>>>>   		return -ENODEV;
>>>> +	}
>>>>
>>>>   	switch (event) {
>>>>   	case CHP_VARY_OFF:
>>>> @@ -338,6 +336,7 @@ static int vfio_ccw_chp_event(struct subchannel
>>>> *sch,
>>>>   		break;
>>>>   	}
>>>>
>>>> +	vfio_device_put(&private->vdev);
>>>>   	return 0;
>>>>   }
>>>>
>>>> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
>>>> b/drivers/s390/cio/vfio_ccw_ops.c
>>>> index 68aae25a0a4be0..414b11ea7eebf9 100644
>>>> --- a/drivers/s390/cio/vfio_ccw_ops.c
>>>> +++ b/drivers/s390/cio/vfio_ccw_ops.c
>>>> @@ -17,8 +17,6 @@
>>>>
>>>>   #include "vfio_ccw_private.h"
>>>>
>>>> -static const struct vfio_device_ops vfio_ccw_dev_ops;
>>>> -
>>>>   static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
>>>>   {
>>>>   	/*
>>>> @@ -88,26 +86,27 @@ static struct attribute_group
>>>> *mdev_type_groups[] = {
>>>>
>>>>   static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
>>>>   {
>>>> -	struct vfio_ccw_private *private = dev_get_drvdata(mdev-
>>>>> dev.parent);
>>>> +	struct subchannel *sch = to_subchannel(mdev->dev.parent);
>>>> +	struct vfio_ccw_private *private;
>>>>   	int ret;
>>>>
>>>> -	memset(&private->vdev, 0, sizeof(private->vdev));
>>>> -	vfio_init_group_dev(&private->vdev, &mdev->dev,
>>>> -			    &vfio_ccw_dev_ops);
>>>> +	private = vfio_ccw_alloc_private(mdev, sch);
>>>> +	if (IS_ERR(private))
>>>> +		return PTR_ERR(private);
>>>>
>>>>   	VFIO_CCW_MSG_EVENT(2, "mdev %s, sch %x.%x.%04x: create\n",
>>>> -			   dev_name(private->vdev.dev),
>>>> -			   private->sch->schid.cssid, private->sch-
>>>>> schid.ssid,
>>>> -			   private->sch->schid.sch_no);
>>>> +			   dev_name(private->vdev.dev), sch-
>>>>> schid.cssid,
>>>> +			   sch->schid.ssid, sch->schid.sch_no);
>>>>
>>>>   	ret = vfio_register_emulated_iommu_dev(&private->vdev);
>>>>   	if (ret)
>>>> -		goto err_init;
>>>> +		goto err_alloc;
>>>>   	dev_set_drvdata(&mdev->dev, private);
>>>> +	dev_set_drvdata(&sch->dev, private);
>>>>   	return 0;
>>>>
>>>> -err_init:
>>>> -	vfio_uninit_group_dev(&private->vdev);
>>>> +err_alloc:
>>>> +	vfio_ccw_free_private(private);
>>>>   	return ret;
>>>>   }
>>>>
>>>> @@ -120,8 +119,9 @@ static void vfio_ccw_mdev_remove(struct
>>>> mdev_device *mdev)
>>>>   			   private->sch->schid.cssid, private->sch-
>>>>> schid.ssid,
>>>>   			   private->sch->schid.sch_no);
>>>>
>>>> +	dev_set_drvdata(&private->sch->dev, NULL);
>>>>   	vfio_unregister_group_dev(&private->vdev);
>>>> -	vfio_uninit_group_dev(&private->vdev);
>>>> +	vfio_ccw_free_private(private);
>>>>   }
>>>>
>>>>   static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
>>>> @@ -595,7 +595,7 @@ static unsigned int
>>>> vfio_ccw_get_available(struct mdev_type *mtype)
>>>>   	return 1;
>>>>   }
>>>>
>>>> -static const struct vfio_device_ops vfio_ccw_dev_ops = {
>>>> +const struct vfio_device_ops vfio_ccw_dev_ops = {
>>>>   	.open_device = vfio_ccw_mdev_open_device,
>>>>   	.close_device = vfio_ccw_mdev_close_device,
>>>>   	.read = vfio_ccw_mdev_read,
>>>> @@ -615,19 +615,9 @@ struct mdev_driver vfio_ccw_mdev_driver = {
>>>>   	.get_available = vfio_ccw_get_available,
>>>>   };
>>>>
>>>> -static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
>>>> +const struct mdev_parent_ops vfio_ccw_mdev_ops = {
>>>>   	.owner			= THIS_MODULE,
>>>>   	.device_driver		= &vfio_ccw_mdev_driver,
>>>>   	.device_api		= VFIO_DEVICE_API_CCW_STRING,
>>>>   	.supported_type_groups  = mdev_type_groups,
>>>>   };
>>>> -
>>>> -int vfio_ccw_mdev_reg(struct subchannel *sch)
>>>> -{
>>>> -	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
>>>> -}
>>>> -
>>>> -void vfio_ccw_mdev_unreg(struct subchannel *sch)
>>>> -{
>>>> -	mdev_unregister_device(&sch->dev);
>>>> -}
>>>> diff --git a/drivers/s390/cio/vfio_ccw_private.h
>>>> b/drivers/s390/cio/vfio_ccw_private.h
>>>> index 67ee9c624393b0..852ff94fc107d6 100644
>>>> --- a/drivers/s390/cio/vfio_ccw_private.h
>>>> +++ b/drivers/s390/cio/vfio_ccw_private.h
>>>> @@ -24,6 +24,8 @@
>>>>   #include "css.h"
>>>>   #include "vfio_ccw_cp.h"
>>>>
>>>> +struct mdev_device;
>>>> +
>>>>   #define VFIO_CCW_OFFSET_SHIFT   10
>>>>   #define VFIO_CCW_OFFSET_TO_INDEX(off)	(off >>
>>>> VFIO_CCW_OFFSET_SHIFT)
>>>>   #define VFIO_CCW_INDEX_TO_OFFSET(index)	((u64)(index) <<
>>>> VFIO_CCW_OFFSET_SHIFT)
>>>> @@ -69,6 +71,7 @@ struct vfio_ccw_crw {
>>>>   /**
>>>>    * struct vfio_ccw_private
>>>>    * @vdev: Embedded VFIO device
>>>> + * @rcu: head for kfree_rcu()
>>>>    * @sch: pointer to the subchannel
>>>>    * @state: internal state of the device
>>>>    * @completion: synchronization helper of the I/O completion
>>>> @@ -91,6 +94,7 @@ struct vfio_ccw_crw {
>>>>    */
>>>>   struct vfio_ccw_private {
>>>>   	struct vfio_device vdev;
>>>> +	struct rcu_head rcu;
>>>>   	struct subchannel	*sch;
>>>>   	int			state;
>>>>   	struct completion	*completion;
>>>> @@ -115,10 +119,25 @@ struct vfio_ccw_private {
>>>>   	struct work_struct	crw_work;
>>>>   } __aligned(8);
>>>>
>>>> -extern int vfio_ccw_mdev_reg(struct subchannel *sch);
>>>> -extern void vfio_ccw_mdev_unreg(struct subchannel *sch);
>>>> +struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device
>>>> *mdev,
>>>> +						struct subchannel
>>>> *sch);
>>>> +void vfio_ccw_free_private(struct vfio_ccw_private *private);
>>>>
>>>>   extern struct mdev_driver vfio_ccw_mdev_driver;
>>>> +extern const struct mdev_parent_ops vfio_ccw_mdev_ops;
>>>> +extern const struct vfio_device_ops vfio_ccw_dev_ops;
>>>> +
>>>> +static inline struct vfio_ccw_private *vfio_ccw_get_priv(struct
>>>> subchannel *sch)
>>>> +{
>>>> +	struct vfio_ccw_private *private;
>>>> +
>>>> +	rcu_read_lock();
>>>> +	private = dev_get_drvdata(&sch->dev);
>>>> +	if (private && !vfio_device_try_get(&private->vdev))
>>>> +		private = NULL;
>>>> +	rcu_read_unlock();
>>>> +	return private;
>>>> +}
>>>>
>>>>   /*
>>>>    * States of the device statemachine.
>>>> --
>>>> 2.33.0
> 

-- 
Regards,
Yi Liu
