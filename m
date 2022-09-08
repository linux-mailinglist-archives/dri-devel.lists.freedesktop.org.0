Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56115B1831
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004BA10E9E3;
	Thu,  8 Sep 2022 09:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF19010E9E3;
 Thu,  8 Sep 2022 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662628626; x=1694164626;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iNfMwGSCrZDuaUcbeV4s2bPUPsmn3T4W/MvojtBtDpA=;
 b=k3ZT6wUhVQaFxljtnexLJIA8JtPoYWA3Rq9qesDXqt3BVl6KpjSNXg/q
 jlomsU9lbw13VaX6EKg+wHnjbgxKoLwbBSQeThkOr0f9jkfe5dRWJyskf
 dNQUt2fQQzWanrojU/NUur3F8F9G1tYIke1qVyQBz3TlT4HnlqSYHKl/R
 lvQeWTrCkdOXHo7a+y/Ix5xOi7+ZiWTI/E/7H8GTlNgHQBzDc157YgJ27
 Iya9S1V385qgMwrcEf8qB3tLOg2/mYsDVVoXfNMAS4sglYpqfWlY+gJKx
 oAXafAdY4Ol65L1NjCy3U0GLj+PX6HdhrQaCTW4svWAicZ6TQxNYwfGK5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="294703762"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="294703762"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 02:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="592091257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2022 02:17:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 02:17:05 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 02:17:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 02:17:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 02:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3nBIuA7L4kK00qAEHNwWt7nWcyv+QQEYLp5W+3tNTwRpQMNjCO1GcFSS+J4nzCtDwq1SlBRYR9olXNkzB87D/Ojhi8TIsFIbMTpBdmapRSmD4pKyb1rs28/WWE8effu47EcjZT7ajkEuVFWtMBbAYkfi5SyrmuGN98l+EBjw56Yw1MmBMWHKbgb2Wq7d7jkrcZsgtx/Bmg2Z2JluCkxbuEGntHCJeVucXc7i7K3ZGgRMzgTOAd26SRly7SIYYCTlEo0LjiTtKrm9zuRYw1MaASpwRpvPntVy84IyWW9AeF2JS8y/TUi91V9JzmOXsJMH04Zx1e2P2JMRyaNKgsumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqPPF10M8z4n0tI72DG7mtFg5MMrIb5jRQkJ4zJiQZY=;
 b=NszjmwlRm3Vr9Svcr7FBWOz1xwDBr0qef3tymAdwbhCY142DjeLN9tUzqWkEx6hbLOSW7myhYYA17MPJeImiZnV5wMmcPOqHkILxyibI6RvRcJ5/0yHiFR1bAGtsg2We5k3m384c8+m5tf4hjk56h+nRE8C9CpSCz2XqdGCpNAhycizCgZgmETwRN7XUI48nCyDJYsRsO0TmnZwD0JzfHMbXOuJofjHH03siZnM5nwEGMiPgEVl0YNEE09NDxCTCvQWqmg1uff8Cr8S/ryj8EvDGCFWFHmhL1BUPCTd6j2a9mPWmaALORuFzd85WxNBPyJTDp1uM+0rS4fgwnh9Ytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 8 Sep
 2022 09:17:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::ec63:ab11:c80d:be4d]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::ec63:ab11:c80d:be4d%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 09:17:00 +0000
Message-ID: <546463b8-54fa-2071-6a9a-e4087eb8bb2c@intel.com>
Date: Thu, 8 Sep 2022 17:17:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 15/15] vfio: Add struct device to vfio_device
Content-Language: en-US
To: <eric.auger@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger
 <freude@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Longfang Liu <liulongfang@huawei.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Abhishek Sahu <abhsahu@nvidia.com>,
 <intel-gvt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <kvm@vger.kernel.org>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-16-kevin.tian@intel.com>
 <50d82b01-86a3-e6a3-06f7-7f98e60131eb@redhat.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <50d82b01-86a3-e6a3-06f7-7f98e60131eb@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed2c901e-506e-4b6a-1bff-08da917ae2a2
X-MS-TrafficTypeDiagnostic: SA2PR11MB5146:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEg07dl3/3pVG15nWAdiY4bpRjksMLWQZ59Mca3bvw7uFl7tqZfNmUZquMZNJr7b2YvkP3mtwiRWOpHuNuzf6wNN1wdkcrwtAheFFHSa8mbri9h+JIolLnUFe1gZJdTQ7MeL5rX/Xtr0mNgALy3lh2RfRbLLEWSKRDW1xkTRuGeYfb4pusE99c99BLN5aYOTcKLH3ilftgawqPQZSmtd+UJK3bubKm709AEHjKmeoNQdrZTK4VjxOUOghJzQ0nRpTeRXKPh+zysUfOA6MxAIo8Ys0/7PPubfm0Z8nGJTgSpntIBge/T+CO92cdGA4WTYUGc6WeLAoWtTDpO1/wf/ZAP4oJ2OuHoKwbGeH3xLzF5RtLLgTZSLDP21iqLdoPEOt1Zt9WjbT3+gIiDhx3s+TMKHqHQlxOC6VmaLApuFJ7cHJNcHc/IPgMxq147754QRBWK7KfltsISyYWftvoTN1moIji8E838PVn5U0JI3KajPXaXJJ6KwPkAPrvLno1dREuCeWSaqi3Ltd3WCbILRZJiXV/qgnOu0EC7XC+MqBTOnJv9lSAOO6NQ2IWg/8Bjtkgv6vyl4Bsc/XZFAoUpzADXsBLuVYZj5bJO3e7bwjxKtL/sLY7c15tezX1+ITVWx/yt/3NP1trCEZNUEd/jY39rCKEr57fl2qpZaZ+IUcM0Cr+G/QTQgxfGRoGD56U768y8JYHZeDMlDWkuHcxz7eUiX5ekfhpSDinam6N9WmAGDYCkrlIrhA9bVZFyHIBb2MmIk7gEBntTkwZaCbT5ru3XRg8kLWTxCRggbiBy54m3EwcB22Vhptn8vcF48X/73
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(346002)(376002)(136003)(366004)(38100700002)(53546011)(5660300002)(82960400001)(2616005)(921005)(26005)(41300700001)(6506007)(86362001)(6512007)(83380400001)(186003)(31696002)(8676002)(8936002)(36756003)(7406005)(110136005)(66476007)(66556008)(7416002)(2906002)(66946007)(478600001)(31686004)(6486002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1p4dHI3VnZCK0tRL2ZoV2hNZ052b04vYzFaL2syVXhreGNzekxGaUV0bGZ6?=
 =?utf-8?B?N1J3ZnNPYWlDNWV5cWk4d2xkZWFCSjRERlAyWCtneUJUTUpoa3pjc3NGYm1E?=
 =?utf-8?B?dVd2RUJiUTR3Y2plbU4va012NVFsbmo2cDhiZm15dFBrL2o4K3RsTXQ3Um1R?=
 =?utf-8?B?eDVPWW1tcmRKSVQ0TUxQRVdXcEZrUUc2ZkFJUzB4VHREUEsvUmVCQXQwdnMw?=
 =?utf-8?B?d2FDSGRKNHMwN2NwanNoN25ySVh5UFkzQjVsZnVIMllOb1Rrb3VsS0F0M21k?=
 =?utf-8?B?YU1rNG90cm1FbkoySXdyUElneTIzYnY1QlZMeERpSG1IUWNBT3lqaDEzNUg5?=
 =?utf-8?B?V2Q2YmlxbUtMaDQ5VldoNEp5cFh1NmxNeVhsWmZTWDFuQUZ4WDVoQ1YxNElI?=
 =?utf-8?B?NmorMjJ0b3JYNUE5Qm5lS3NidXBPbzBiTEpqV1NuMHhWeUpwc0dYTXhWdGNU?=
 =?utf-8?B?VnpxaCtUajI4ejYybEJjT05XbmFmWG9tQURMR3lqTVFNK2VOUHU0TDRjSnk5?=
 =?utf-8?B?VDFqRjE1cDVUZGFPbTNqdjd4L0grUHVYWFVZRUpJNldDUHZLUEhlRmdHVStM?=
 =?utf-8?B?Y2E1ZHBUQm5jaEVaRHU4cnVzd1ZyTnJjSExTMVc5TGJvbC9EMVdsWmlvWmFW?=
 =?utf-8?B?OStmZCtnTTFqUzRHRXRjUm9uMTJhcUM0aDlROGRpOGZOcUFMYUtSTjN6bWFT?=
 =?utf-8?B?OVAzNm1qbFJvaHB4bnpEeU9KakhDUDdmemhKKzRDWVZzOXlPbFdrYm5IcUxx?=
 =?utf-8?B?OUJmSFRxUk9MYXRIVEJTSUpRWmNKdlpIaVhDbHR1a3FLc3V0dkNiQWd5WFhl?=
 =?utf-8?B?TjZCRXcvMUorZjRoRkdRMWtBSm9ZL25mQ054c2F2WVdScFpUYi8xM2JPaDd3?=
 =?utf-8?B?V1N2Z096TkhzZXRFOEV5Y2ZXYkU2eWtEbU9EcElQTHdlRmFFRlZRQ3lvRzZM?=
 =?utf-8?B?L3BPM01mRDZtSEJiUjRPYXRhOUJJY2MzdU1TT3NZUSs4dFEvT05GWVpmbnV1?=
 =?utf-8?B?YkJDb1VoWDdQa0g2RjE5em9JMlBFa0t4cnc0RjhadEQvSUI2ZHE0VXZIbTB5?=
 =?utf-8?B?dTJUbWk2MHB0SG0xTTZjQTZ4QnM3UXVzS1JnWjdMK0V5b1dSb0tOSVc0U01I?=
 =?utf-8?B?TlhuVnppcytqSG5FbGQ0YTBKNjkrMVBxWlBQKzJqMTEwVXdnaHZtcEN0Y3hH?=
 =?utf-8?B?VlJqOGV2RGwzQzVUU0xQUUVTaXpyMVBBcnB5dDJwL0xveXpBRlFIU2wwZzc4?=
 =?utf-8?B?WXVXQVRmSGtTckZPbjdPbXMySDFucjhHZWxJZG01bEJBN2ErYThjYS9uUWxU?=
 =?utf-8?B?ZXMzSE1EOVIyWXhJMU4ydngzSXFSMXZ0M01Hb3BqQUR1eC9YWmdwQ2loRnRY?=
 =?utf-8?B?eHAxWWZDSGhBY24yeDBqNmxMZForSXJ5MkdZdy9kT2ZIR0RYOUJPcWlsaVlQ?=
 =?utf-8?B?Mjkwa3g5REhHek1XVUlEYVhhUHNjbUVFTFoweE0xWG9qb2xDUC9RSVdubUxu?=
 =?utf-8?B?L25qaEdVaEZZWW1aVTZlam9NMU53K2Z6M3dla3RISUUzNFQ2bEZNVjZkVFdu?=
 =?utf-8?B?VGpPMWFwNlRCank5ZHlmNlE5bHVaek04WlcrejJTeHBCdy9IWTF0M25sYUZV?=
 =?utf-8?B?SVN5dTdYVnpDSDc2cEh4dHBROFRjNkVod3NPTUFTWWxXN2U2V2toMnF3aXRl?=
 =?utf-8?B?dkhDVzRkR3VRS2hDUDZZSXlBWmtDTG41VUlVaVd1Qm9DbDkwcXVUNjFhVFhM?=
 =?utf-8?B?cTB1VE4rUVZKT0hWd3QrdytKdk1BYmR6d0NGZEhOZ3g1RWpjRlh3d3NqRGtB?=
 =?utf-8?B?ek9jN3RTZnQ4WEROVStLSWNXT1pKdno3clpvdVhpZHdCczl3WUlJYzVRZHVJ?=
 =?utf-8?B?cEROSlh2cUg0MDk2cExEZ1hOc2cxQmtkZWsvY2poNmZSZnIvV3Zwdm1WUUlH?=
 =?utf-8?B?cEJFMHYxS0JHVXlWdE5NUVdmNENkN29CblMxcFVqa241cFFxYUtuY2VCejdM?=
 =?utf-8?B?cXhuYTJ2a290TDV5RFFiSlJoV2FtdU1WbXF3ZlNqNWdsaWNpQkNOYWpLNnJZ?=
 =?utf-8?B?WnJrdkwxSUdsazFqZlhOVjBZcEFiQWI4ME9sMEtTU2UxVGxLT3NrSkY4c09Q?=
 =?utf-8?Q?9tdM4Uf8/oE+CEVe06pBW+XeY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2c901e-506e-4b6a-1bff-08da917ae2a2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:17:00.3470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0K1d3Yb2go3U6QtFI7EVbcoD40D5w5kFepxZQPHjig4ZLWrIDZ2x4xmm5d9mmDWs9uBpHsnt+IwxuDr8q34myQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/9/8 17:06, Eric Auger wrote:
> Hi Kevin,
> 
> On 9/1/22 16:37, Kevin Tian wrote:
>> From: Yi Liu <yi.l.liu@intel.com>
>>
>> and replace kref. With it a 'vfio-dev/vfioX' node is created under the
>> sysfs path of the parent, indicating the device is bound to a vfio
>> driver, e.g.:
>>
>> /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
>>
>> It is also a preparatory step toward adding cdev for supporting future
>> device-oriented uAPI.
>>
>> Add Documentation/ABI/testing/sysfs-devices-vfio-dev.
>>
>> Also take this chance to rename chardev 'vfio' to 'vfio-group' in
>> /proc/devices.
>>
>> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> ---
>>   .../ABI/testing/sysfs-devices-vfio-dev        |  8 +++
>>   drivers/vfio/vfio_main.c                      | 67 +++++++++++++++----
>>   include/linux/vfio.h                          |  6 +-
>>   3 files changed, 66 insertions(+), 15 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-devices-vfio-dev
>>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev b/Documentation/ABI/testing/sysfs-devices-vfio-dev
>> new file mode 100644
>> index 000000000000..e21424fd9666
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
>> @@ -0,0 +1,8 @@
>> +What:		 /sys/.../<device>/vfio-dev/vfioX/
>> +Date:		 September 2022
>> +Contact:	 Yi Liu <yi.l.liu@intel.com>
>> +Description:
>> +		 This directory is created when the device is bound to a
>> +		 vfio driver. The layout under this directory matches what
>> +		 exists for a standard 'struct device'. 'X' is a unique
>> +		 index marking this device in vfio.
>> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
>> index bfa675d314ab..141f55c3faf5 100644
>> --- a/drivers/vfio/vfio_main.c
>> +++ b/drivers/vfio/vfio_main.c
>> @@ -46,6 +46,8 @@ static struct vfio {
>>   	struct mutex			group_lock; /* locks group_list */
>>   	struct ida			group_ida;
>>   	dev_t				group_devt;
>> +	struct class			*device_class;
>> +	struct ida			device_ida;
>>   } vfio;
>>   
>>   struct vfio_iommu_driver {
>> @@ -483,12 +485,13 @@ static struct vfio_device *vfio_group_get_device(struct vfio_group *group,
>>    * VFIO driver API
>>    */
>>   /* Release helper called by vfio_put_device() */
>> -void vfio_device_release(struct kref *kref)
>> +static void vfio_device_release(struct device *dev)
>>   {
>>   	struct vfio_device *device =
>> -			container_of(kref, struct vfio_device, kref);
>> +			container_of(dev, struct vfio_device, device);
>>   
>>   	vfio_release_device_set(device);
>> +	ida_free(&vfio.device_ida, device->index);
>>   
>>   	/*
>>   	 * kvfree() cannot be done here due to a life cycle mess in
>> @@ -498,7 +501,6 @@ void vfio_device_release(struct kref *kref)
>>   	 */
>>   	device->ops->release(device);
>>   }
>> -EXPORT_SYMBOL_GPL(vfio_device_release);
>>   
>>   /*
>>    * Alloc and initialize vfio_device so it can be registered to vfio
>> @@ -546,6 +548,13 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
>>   {
>>   	int ret;
>>   
>> +	ret = ida_alloc_max(&vfio.device_ida, MINORMASK, GFP_KERNEL);
>> +	if (ret < 0) {
>> +		dev_dbg(dev, "Error to alloc index\n");
>> +		return ret;
>> +	}
>> +
>> +	device->index = ret;
>>   	init_completion(&device->comp);
>>   	device->dev = dev;
>>   	device->ops = ops;
>> @@ -556,11 +565,15 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
>>   			goto out_uninit;
>>   	}
>>   
>> -	kref_init(&device->kref);
>> +	device_initialize(&device->device);
>> +	device->device.release = vfio_device_release;
>> +	device->device.class = vfio.device_class;
>> +	device->device.parent = device->dev;
>>   	return 0;
>>   
>>   out_uninit:
>>   	vfio_release_device_set(device);
>> +	ida_free(&vfio.device_ida, device->index);
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(vfio_init_device);
>> @@ -657,6 +670,7 @@ static int __vfio_register_dev(struct vfio_device *device,
>>   		struct vfio_group *group)
>>   {
>>   	struct vfio_device *existing_device;
>> +	int ret;
>>   
>>   	if (IS_ERR(group))
>>   		return PTR_ERR(group);
>> @@ -673,16 +687,21 @@ static int __vfio_register_dev(struct vfio_device *device,
>>   		dev_WARN(device->dev, "Device already exists on group %d\n",
>>   			 iommu_group_id(group->iommu_group));
>>   		vfio_device_put_registration(existing_device);
>> -		if (group->type == VFIO_NO_IOMMU ||
>> -		    group->type == VFIO_EMULATED_IOMMU)
>> -			iommu_group_remove_device(device->dev);
>> -		vfio_group_put(group);
>> -		return -EBUSY;
>> +		ret = -EBUSY;
>> +		goto err_out;
>>   	}
>>   
>>   	/* Our reference on group is moved to the device */
>>   	device->group = group;
>>   
>> +	ret = dev_set_name(&device->device, "vfio%d", device->index);
>> +	if (ret)
>> +		goto err_out;
>> +
>> +	ret = device_add(&device->device);
>> +	if (ret)
>> +		goto err_out;
>> +
>>   	/* Refcounting can't start until the driver calls register */
>>   	refcount_set(&device->refcount, 1);
>>   
>> @@ -692,6 +711,12 @@ static int __vfio_register_dev(struct vfio_device *device,
>>   	mutex_unlock(&group->device_lock);
>>   
>>   	return 0;
>> +err_out:
>> +	if (group->type == VFIO_NO_IOMMU ||
>> +	    group->type == VFIO_EMULATED_IOMMU)
>> +		iommu_group_remove_device(device->dev);
>> +	vfio_group_put(group);
>> +	return ret;
>>   }
>>   
>>   int vfio_register_group_dev(struct vfio_device *device)
>> @@ -779,6 +804,9 @@ void vfio_unregister_group_dev(struct vfio_device *device)
>>   	group->dev_counter--;
>>   	mutex_unlock(&group->device_lock);
>>   
>> +	/* Balances device_add in register path */
>> +	device_del(&device->device);
>> +
>>   	if (group->type == VFIO_NO_IOMMU || group->type == VFIO_EMULATED_IOMMU)
>>   		iommu_group_remove_device(device->dev);
>>   
>> @@ -2145,6 +2173,7 @@ static int __init vfio_init(void)
>>   	int ret;
>>   
>>   	ida_init(&vfio.group_ida);
>> +	ida_init(&vfio.device_ida);
>>   	mutex_init(&vfio.group_lock);
>>   	mutex_init(&vfio.iommu_drivers_lock);
>>   	INIT_LIST_HEAD(&vfio.group_list);
>> @@ -2160,12 +2189,20 @@ static int __init vfio_init(void)
>>   	vfio.class = class_create(THIS_MODULE, "vfio");
>>   	if (IS_ERR(vfio.class)) {
>>   		ret = PTR_ERR(vfio.class);
>> -		goto err_class;
>> +		goto err_group_class;
>>   	}
>>   
>>   	vfio.class->devnode = vfio_devnode;
>>   
>> -	ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1, "vfio");
>> +	/* /sys/class/vfio-dev/vfioX */
>> +	vfio.device_class = class_create(THIS_MODULE, "vfio-dev");
>> +	if (IS_ERR(vfio.device_class)) {
>> +		ret = PTR_ERR(vfio.device_class);
>> +		goto err_dev_class;
>> +	}
>> +
>> +	ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1,
>> +				  "vfio-group");
>>   	if (ret)
>>   		goto err_alloc_chrdev;
>>   
>> @@ -2181,9 +2218,12 @@ static int __init vfio_init(void)
>>   err_driver_register:
>>   	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
>>   err_alloc_chrdev:
>> +	class_destroy(vfio.device_class);
>> +	vfio.device_class = NULL;
>> +err_dev_class:
>>   	class_destroy(vfio.class);
>>   	vfio.class = NULL;
>> -err_class:
>> +err_group_class:
>>   	misc_deregister(&vfio_dev);
>>   	return ret;
>>   }
>> @@ -2195,8 +2235,11 @@ static void __exit vfio_cleanup(void)
>>   #ifdef CONFIG_VFIO_NOIOMMU
>>   	vfio_unregister_iommu_driver(&vfio_noiommu_ops);
>>   #endif
>> +	ida_destroy(&vfio.device_ida);
>>   	ida_destroy(&vfio.group_ida);
>>   	unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
>> +	class_destroy(vfio.device_class);
>> +	vfio.device_class = NULL;
>>   	class_destroy(vfio.class);
>>   	vfio.class = NULL;
>>   	misc_deregister(&vfio_dev);
>> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
>> index f03447c8774d..5c13f74da1bb 100644
>> --- a/include/linux/vfio.h
>> +++ b/include/linux/vfio.h
>> @@ -45,7 +45,8 @@ struct vfio_device {
>>   	struct kvm *kvm;
>>   
>>   	/* Members below here are private, not for driver use */
>> -	struct kref kref;	/* object life cycle */
>> +	unsigned int index;
>> +	struct device device;	/* device.kref covers object life circle */
>>   	refcount_t refcount;	/* user count on registered device*/
>>   	unsigned int open_count;
>>   	struct completion comp;
> I am not totally clear about remaining 'struct device *dev;' in
> vfio_device struct. I see it used in some places. Is it supposed to
> disappear at some point?

no, Eric. *dev will not disappear, it stores the dev pointet passed in by
caller of vfio_init_device().

>> @@ -154,10 +155,9 @@ struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
>>   int vfio_init_device(struct vfio_device *device, struct device *dev,
>>   		     const struct vfio_device_ops *ops);
>>   void vfio_free_device(struct vfio_device *device);
>> -void vfio_device_release(struct kref *kref);
>>   static inline void vfio_put_device(struct vfio_device *device)
>>   {
>> -	kref_put(&device->kref, vfio_device_release);
>> +	put_device(&device->device);
>>   }
>>   
>>   int vfio_register_group_dev(struct vfio_device *device);
> 
> Thanks
> 
> Eric
> 

-- 
Regards,
Yi Liu
