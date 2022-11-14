Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A2D627ECB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEE710E0A4;
	Mon, 14 Nov 2022 12:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DEF10E0A0;
 Mon, 14 Nov 2022 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668430302; x=1699966302;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6iOsI7PDhrs+uN+0jgtAUWgKNSOeLFjTfDhwWcg3qcU=;
 b=gfAlqQxhutTtQJAEWDoW9jrV1Z6ygeUx06zKYijErlks2eTETJu2ASQh
 GnWS0+BASXhUqjYWhdC/AzY9EO0IAcm56VOjD2Cedf2YYdXZeVfRM18I8
 WPGTNw+TNlPUVs+V1If3tzxTXINGb7Ol5aFeYd3WGRvZttCPeJZ0N/QJp
 dr+v+WvsMQDyCoHpP3fJzED2+CuHTvvwPWIZ4s/LyCyaDVriJ6nGxxwQz
 PjqviQS3bkZLcHsPlK5JIS2GL7GnlUv4/zTNEftkP1B8bPIREeOjikKDt
 L8B5sHUgn6oSgPiJ6eLTY1P1gqPoNOGStIZis1F5djsTJcJWHt7V6J9xv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="292358097"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="292358097"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:51:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="707303574"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="707303574"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2022 04:51:41 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 04:51:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 04:51:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 04:51:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy/llYMOko/AqTEGLvfRCgzechA6darRlTv8ibu6cW/O254U2GkiTk76Ni7REkU5CUYB0O/85LUVRQOHSc0T+s52/8pUm2pVtF+0YRFdlz1vX/iyHILHnvzYsQuxUf5sdhKb33CCmCj7mSZnBR1qYS+D/n9qkA+qRGQRSlgFjuyDBquEpoyI7Y2XnKiq9qPJkiDvpJSMIXPC7vaiaOXhXnSihzisCEL5oWFIvniSSKqi1JmuX8kxqxh9vwpkM1lpKC0s9e4y9G+IXN4TVSV2Ob1v0EX8UIaVRPVXQDO6kbJPl3bOXZCUeHEs70WIO0AanS0UJWTdVkC3513FM2ENkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A3MgGirgKGhRBxyaNBuoOAsjHii5DVHNda/k6dTzU0=;
 b=V8rUMdAVtEE5v5oLVBk6+TXdtLyiQW1VUk9z0tfAyYvdJKEvYQKbjIMYOWabhQ6PI8sRpeZK3v2WcFbpMEbEzkd/LzqS5uvWJzqFAN5Ct9UIX4mXfJs2LpgwBM9OYNL4SDjSlbPlTd+vfp2CARuzoK6lVjdaSB3Snqwr09CMEwBgi7s8Xhwq7tiL+7W3JeYYlxUKVb133T7yFsK5y9jcfhpG2EdLd6kYKFjB/4Aw4uKGizWPb0DVGi1iiq7ASKIVq3rZ7uxS4c85onpBWEEPY8KTM4bLlwIls+OYh81On9zmI185HSF+chNBDdZWEXZ9gYAULdtl1YMP/gYuiyIn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:51:33 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%9]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 12:51:33 +0000
Message-ID: <127303b5-8753-f866-1811-a67ff4bc021b@intel.com>
Date: Mon, 14 Nov 2022 20:51:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
 <9b2bb9f2-fc82-dd01-84ff-c2fe45e1a48a@intel.com>
 <Y2vb4fuPZdYKR1M1@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y2vb4fuPZdYKR1M1@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b989935-dc1b-4220-84db-08dac63ef49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eusrvuk6O867Z2BxMSa1HXRujuXnr8FYbbSOACWLRLnpp10HxILfB2sDdbrY+dDwx93m56dZqrlLe1D9XnilI3WUZEFbbfRqtWx11sWN20KzeCM4ZLORFfsqZllvO3Y2FQsk8KCWoomFdIgvkGitBO7OwryHhGd+Clf+w9eoLFQQsgbMlYzOWH4AX5W41ECXj42wHyPzM8ujU+V9SkNueFwVIwT8gVCebT91lOfu/eNNO/ryPQsT5Fm7nLSorCGUQMNh6dV/hWGy47z1fuEX4JAHja0+kYkMexR2kdPaglyj+LB92iyJjYaFpxU+Sblk3wF1l7BSk0eibTek+UcwyCc+n3adp/SZDW6dSgrJB0+CdGJYOXYsJNbmNx3XPwB0eNgUGZq3cnxcKPw2x6kKaJ65B2cyQdatWtjEKmoNIeWSgJwk1KkeM9QkHnkJPOMovjlZSWPh2kbTDi8IMcXhM7m+FRtajMZtbSwPQBS06jyKAV2Z7oYR6F2WGezc6TcSKnes5kNcIbk82cK8IQQgoAp4iVgltOL4SLossROWT6ypUVExytCi0693cajDhKBTi5C43IrNH9wFqBpGbUQx93xpPeyogndbCHR7WaJ+n3mkeVpX3+G1LNeP3TuTvhXRC479EirHyZX9Q9O9AHbBdG8HTxykaKt4i5D5G4M6OkBjaBzifszXq0m4aPq2udNCPym8m1rxD+Kybij47hqU/ewIbrIWdWl8zJpAFATbnOzVCCnzxCshDlSQbBxDzU7flaX+5UGFDignY3Y+kZlAZ3Su0g8xlipRbHO20aAh/feKG/ljJlJtrNibcF+tAyBTr+vZI4/4m3NjTRVuo1jJrqI4gcEjmB05PBuO8/lYF0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(82960400001)(54906003)(6916009)(316002)(66476007)(7416002)(7406005)(5660300002)(66946007)(66556008)(38100700002)(8936002)(41300700001)(53546011)(8676002)(83380400001)(4326008)(6506007)(2616005)(26005)(6512007)(186003)(966005)(6486002)(478600001)(31696002)(86362001)(6666004)(31686004)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkJsOGtwZ0czN09EMTA1VW43NGdsZkh0ckR4WXFlbG9RSzRkMVU1alNNc2NI?=
 =?utf-8?B?azBxcXlaUjc2dW1GRXdnZEFyamF5Wm1LSVhlS0x1ZXVVNmZCREZRQ1J5WDBw?=
 =?utf-8?B?UXNjeEowOUdPYVFyQU1RRFo0YzlqUFdFcGRPYjhCRUlIWDl0azlWanM3VE93?=
 =?utf-8?B?N3l0WGhEdnZLTWEwU0p1azV3NThISXNZZ1N2LzRhZFJuOEpid0ZlbUFNWit3?=
 =?utf-8?B?RnNSYzlvVHJDbVFhNHcxVFEzRDlacmU1QmNvOXdOUzY3b1BkdnRXbkVXL1hX?=
 =?utf-8?B?RjhqVG94UkxhdGd2S1FkaEJlZzJreGJPY0ZxbVE5YmtUR1JZd2RxV2lzdjdW?=
 =?utf-8?B?RDZvQXVTUTZDRnI2YnB0VEtDblhLT2F2bXIrZHhUb1Y3ai9VeUxtb0ZuZkZZ?=
 =?utf-8?B?OTJxWjFIQXNaVitGVjFWejFDeDdMcHkwSXFFUUhIYW9uQkt5K0FobzFtbEtj?=
 =?utf-8?B?ellPRkpuNHdybjFpMnNIVC85aTc1L1RZdEg0cUFhVmtWdVpIL3BxQ2ZPYkpR?=
 =?utf-8?B?QlFsTlJlZUdWcEJsUTRRRVRhejh1VHhzMnZCUFpIeWo1QUt3WUp4Y3lRMEFn?=
 =?utf-8?B?NlhyR0k5cGVZQ0pLMjVyNVdUUVR5ZFV3NXJLcXhyOS9BdFlxUlpxRm1sdUw2?=
 =?utf-8?B?QlI2VWVsbFZidGZ2YnpNN2RnM0NZbGpMN2ZYNm9VMmxFUC9SaCswMVBBQ2tO?=
 =?utf-8?B?RlFiRmdHM1QraHRtd3k3QjJHMkdTSjZGcHlYT1FjK0RjbncvSzE1UlU2cnAv?=
 =?utf-8?B?TkFGeGJZLzZvTTlOdlVaQjRVdjVTSytSYmVaajJ4a01xVXJ5dlc1Z3JVdmVt?=
 =?utf-8?B?L1NON202MVZVUE1lemlZckRkZXdsTnpBR2RpWThIZkQ2QURoZ1hPamI1NS8v?=
 =?utf-8?B?YUl0S0VyZ095ZUwxLzNXcG9wdlN5U3pjNjAydDZCaUxUeFJCOG5tRDVNUitt?=
 =?utf-8?B?Wnh3cVhWbkdicmV6OEF4TGFNTSs4YXFzWDlScmkwTDcremxlaTI3Y0FRTnhZ?=
 =?utf-8?B?dlh5aHZFdlBJeUxGb0lVR25RSUVmNEFSc05FRDRMb3VYSm9vMUdkdVZ5MExn?=
 =?utf-8?B?STRUN21iUk5YNkdWbnp5eEc3U3AyeWt5YXFWM1B0ZjgzZEdTYmZNaGRyMUo5?=
 =?utf-8?B?bzZNYkZHeUkrSXlpVEZGOGRsNzRzNnlBT0U5UW5XbmlVOXBxQXdIQkpnUW5q?=
 =?utf-8?B?bFhHUFl5a3N4bVEwdUd2QVZrLzVYS3plZkR6WVgreDl6RlVFSG1EeU00dHZS?=
 =?utf-8?B?VS9aWXFlVmN2ZkpRQ3VoM2kzbmV4MmJ6M00wMmFIanZyU25XejFnU1pLMjJR?=
 =?utf-8?B?cjhRZXpkRkdzSU03UVZPV2wrVmRqNjhiYTJDOHROS29FL1kzWnJpYzk1NmYr?=
 =?utf-8?B?WnF6eXBYZ1dyOHYrdXRod0ZoSjFoMGdLZC92TDR6ajZLZFRBNkh6TzVVUk1l?=
 =?utf-8?B?NmNXcHFUNjFadlJ2ZWlCSXJMak9qUnpzWVQwUE12Wnl3UnprZEhXdGZLUlhj?=
 =?utf-8?B?bkVMVW00VlRTTEFXa29DdnV0bjZVOGpmZlYrbEZyaW9FNWV0eVdjSk1jdXVB?=
 =?utf-8?B?MHB3V0pTdll1NGRwS0YwR2xFM1ZKbGlSYWxCbloxNHFPY0RncURYRHJtZmZR?=
 =?utf-8?B?VXU1c0hDN2ltbE84Vm1xSFB1VkR1MTJ1MmZzUEprVm5LK0xsUk51WFU4SmdT?=
 =?utf-8?B?ck1LWHpRekVvdVNHWXgzN0UrZURUMmZZd0RlcHI2Mm9NOWlRM1JKWUVnb2JG?=
 =?utf-8?B?TjgwVUg2UTdOaFV6cmFEcFl4VjhneUcwNk5NOTFyOG1zY2tZVkQyVzM2dkVw?=
 =?utf-8?B?MXlwYmUySmZlWTA3VHkyN3BXM2pqTElMY3hENmp3RkZETzEraExOMHh0QW5n?=
 =?utf-8?B?ZTBkWFhHUlZuQTNGUzZibkowMHdIS1F5VHlld2NUVEVFNjlMVUdQTXRsclRK?=
 =?utf-8?B?WjVRaGNoY2l0dDFVZkkvNmtzNk9qOXp2SStrSHNFRzV4NTQrUzJ0ODE1VVhi?=
 =?utf-8?B?cVNpYUlHNStCeDY4eEwzcEI2TVNVVkVZdHFtTFc0MkVXRkRscTl2c3AzT1hy?=
 =?utf-8?B?TVNlUysxajFKS3FHa1ZTTlphZTN6NkpSUHVnMDNTT1VZOUI3N05yZmM4Y1pH?=
 =?utf-8?Q?VTsbMQbJk15oR/OrBl6KSrNXI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b989935-dc1b-4220-84db-08dac63ef49b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:51:33.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONZ01ezq4vMfy0nDNYCWi6ffW5UkqXKac4Lx7Ok6LCfJYPPCloWDEk79J6a1rcGYSOlQqOldqJPQeinwt0RhEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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
Cc: kvm@vger.kernel.org, "Hao, Xudong" <xudong.hao@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "Yang,
 Lixiao" <lixiao.yang@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, "He, Yu" <yu.he@intel.com>,
 Harald
 Freudenberger <freude@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/11/10 00:57, Jason Gunthorpe wrote:
> On Tue, Nov 08, 2022 at 11:18:03PM +0800, Yi Liu wrote:
>> On 2022/11/8 17:19, Nicolin Chen wrote:
>>> On Mon, Nov 07, 2022 at 08:52:44PM -0400, Jason Gunthorpe wrote:
>>>
>>>> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd
>>> [...]
>>>> v2:
>>>>    - Rebase to v6.1-rc3, v4 iommufd series
>>>>    - Fixup comments and commit messages from list remarks
>>>>    - Fix leaking of the iommufd for mdevs
>>>>    - New patch to fix vfio modaliases when vfio container is disabled
>>>>    - Add a dmesg once when the iommufd provided /dev/vfio/vfio is opened
>>>>      to signal that iommufd is providing this
>>>
>>> I've redone my previous sanity tests. Except those reported bugs,
>>> things look fine. Once we fix those issues, GVT and other modules
>>> can run some more stressful tests, I think.
>>
>> our side is also starting test (gvt, nic passthrough) this version. need to
>> wait a while for the result.
> 
> I've updated the branches with the two functional fixes discussed on
> the list plus all the doc updates.
> 

I see, due to timzone, the kernel we grabbed is 37c9e6e44d77a, it has
slight diff in the scripts/kernel-doc compared with the latest commit
(6bb16a9c67769). I don't think it impacts the test.

https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git/log/?h=for-next 
  (37c9e6e44d77a)

Our side, Yu He, Lixiao Yang has done below tests on Intel platform with
the above kernel, results are:

1) GVT-g test suit passed, Intel iGFx passthrough passed.

2) NIC passthrough test with different guest memory (1G/4G), passed.

3) Booting two different QEMUs in the same time but one QEMU opens
legacy /dev/vfio/vfio and another opens /dev/iommu. Tests passed.

4) Tried below Kconfig combinations, results are expected.

VFIO_CONTAINER=y, IOMMUFD=y   -- test pass
VFIO_CONTAINER=y, IOMMUFD=n   -- test pass
VFIO_CONTAINER=n, IOMMUFD=y , IOMMUFD_VFIO_CONTAINER=y  -- test pass
VFIO_CONTAINER=n, IOMMUFD=y , IOMMUFD_VFIO_CONTAINER=n  -- no 
/dev/vfio/vfio, so test fail, expected

5) Tested devices from multi-device group. Assign such devices to the same
VM, pass; assign them to different VMs, fail; assign them to a VM with 
Intel virtual VT-d, fail; Results are expected.

Meanwhile, I also tested the branch in development branch for nesting,
the basic functionality looks good.

Tested-by: Yi Liu <yi.l.liu@intel.com>

-- 
Regards,
Yi Liu
