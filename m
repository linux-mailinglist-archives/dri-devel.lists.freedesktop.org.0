Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38E4CAAED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 17:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD510EC85;
	Wed,  2 Mar 2022 16:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E6010EC86;
 Wed,  2 Mar 2022 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646240239; x=1677776239;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3cpFTwZP6MUgbv8jKMDNBhKfYhG/zR/El8sznRLCsM=;
 b=CZy9qtikzFBhrIZwwpIeKJBcIknwg20P5kl2B6XLAhwi+hfV23AFR5ql
 /Er2O9qJ50I3I/F29qcVvSGGOHuTu9EtlYApVC7+nSFubxOwRYQT85MLF
 +/VJbW/h/aWqSNGEK/I1+AR4ET7UomJQpUVaGpkgkXhqs3w2+lXP5Q+bD
 xzCBA35BT/bayXUz1q5MJrhejE3y2se+rm6dzOsfVlL5HYOpn4B5sm0P8
 3Rh1GvRvB4kzc7MKx9RxXUE+n3xSA1zrfPmc/qmui6FMjrkgloS04vjFH
 EMsqLmfFjluAdMBQHRWnISOpSFUmFmOj+9eRdkXsstaLgl77yoycXOvGi A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="314169686"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="314169686"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 08:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="493603672"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 02 Mar 2022 08:57:18 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 08:57:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 08:57:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 2 Mar 2022 08:57:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwjkA3szJjb8Ma1usfsT9CVNZIQkg3X3cnddKrNrxNB2krezJA3dyQJdFJKjelLPnIdx87eOCvRVihm4YnS2pIquOZN9WD5o1rhWIdz9ZVP5/Izwd8Quesgb0jmmukA/ozJYj82yw7bu8vcfzw1ip4iSlX9kq+/9UBSv+PIxs0ISESGY2KQAMxblq1F5ozbrq3LVEb8+f3iI+KhGI7IXes1IZokr+GDvKzHmp+lTOj7DKbvhro/DtHn684LBePFcPfUYKp3Ve7zcHCMqGRSw6A+ys7pfiKXkfVNzgWY0H/U8N769HrI0jHcDApPOHObsO5KtcQbmH1EBL6kh5CeMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SO2VGxohuOrOJ+ltdT/vZz1cD5hCWrSxj74zIZThwE=;
 b=hIeZH/Wsz+MDe5MykoTA40lkzVM1S29wuUXXCL8e59DORguJ707nFYMEWEdlipbDsnXBCy8WHUFhFC0qDuLVxpeykqTWiZesXBSYab3b/MLeGIQCIN8ByKj9e7LRxvFWwHyKe69l78Y8qPp99gXs3T/Xfqwg6Qx70NAekN+Hi9OHieOWUR6bJ2eURB+XG6v30LTiLuKP9TAGK9NJMi+teu++ZlWse4MHsjypdnHOwn+Xrro+zH0Excbs+7OQyOIkogPShHUYkaNA7JRFMgexIhJ74m/fjSLwlPOLW9tcQAZg9NNhaarccr1d7FIdYbbPLlLYB/oVgdbVmWFhQ9cotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BN6PR11MB1569.namprd11.prod.outlook.com (2603:10b6:405:11::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.13; Wed, 2 Mar 2022 16:57:14 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:57:14 +0000
Message-ID: <e096ed88-ec87-b45c-22ba-80d48f480808@intel.com>
Date: Wed, 2 Mar 2022 17:57:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 4/7] drm/i915/gt: create per-tile sysfs interface
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-5-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220217144158.21555-5-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0161.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::11) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a2cf8ba-056a-4e87-a72e-08d9fc6db347
X-MS-TrafficTypeDiagnostic: BN6PR11MB1569:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB156954CE15A80A1199D63EEEEB039@BN6PR11MB1569.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBaKZ27ucYFyq7cjCy/usQxQx0PF6DDbZf772AGUdxwCiM27O7jftdSEk3OXS6au2X1dPZsCy31PLrUqE5roLBq9rUh/4Sjg7vcgVXvRI4YMW7Gw/BiCIU0rc54RvOFk1vyTBqzkzHITXA9EB17mTHPeuJxZnCg4b+xrB/0cHq1DvVRulDQWMPVjOh4YvYJdaWF8EbpOkKhRXWSptLQaU7+aJCx2vWauoM3m2DTJ7y6btg+CNbkMkpV2c3XdMNTSf+fnn5Geom3syK42C2gltuFXW2HjZyypN5zM8nplwj+a4IQSGALXyYtoEPy4k4nMIO6jx+sR+ZdRzYgV0Hz0U21CJPofiQU2G860GXLZkyS7Ek2SbuU3hpzvzd3KgZAN9TiwfUfbYhu3N+ONwh4fLff2WdKDMOFK4cuZco7QpyTfyIoKWzq1GXc/0saIPsEKLIMYckPSzM1F/LW0OlWLVPYNu1pJOdH3voxT4N4xsda2d24EXqZ8tpbk63EsvTgEpf6S7iQ1aXrWUHxq0g3DmblbzWMqTOG2kNiMtJilQ8Wngg3lhq+3sC8b3HRI3Ln4lhQWGtQy6DilObkFUTgRuymrBqas5e3H0BDpqW1dcRoGNIsCeVcaKjl4172vR/h37/hPY1K69QLjU/GHxMFj6qlMA/R93IYj9VPZxtiqT4mb9vITU1no25Uuy68nSw/W2xCKoNldnv4S4uJlee+oel6gyc+q2deq4puJSFwibBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(66556008)(66946007)(4326008)(6486002)(26005)(38100700002)(186003)(66476007)(316002)(2616005)(36756003)(54906003)(110136005)(82960400001)(83380400001)(8936002)(6512007)(6666004)(86362001)(6506007)(44832011)(53546011)(31686004)(36916002)(2906002)(508600001)(5660300002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU5ZME9WU2FCa3pzOFR2QkNtWDlMMUtEWkcwdHJVbkhBK05kS2F2S25ERVh0?=
 =?utf-8?B?OHQ5QVQ4OHlkbUpSODNnUjFWM21PQWN5Z0FUVHdLQ3lvcTNJSUNrWWpYZ1Nz?=
 =?utf-8?B?clRDWkRYSS9USmRkMGloUUdjcEMvWk9XcTNnZXVTYmRtV1Bxd3RWL0NLNjNu?=
 =?utf-8?B?YzlEOE5hNythQXNOdk9jUEZQaXJMZElaemh4Zk5EVTR6cHBiQU9HOHNUY0VD?=
 =?utf-8?B?eUpBTS9VcEo1NUNkbm1zbmtvbzNqbTh2MVMwTUtxc042a1htYlA1V0Vab0RJ?=
 =?utf-8?B?emM0dmlnQ1p3d21xSlBKUGF5eFhiMXNxWWk2dGU0SUVGVk1GU0J6bEZ6RjFB?=
 =?utf-8?B?Q3F5NzYrRU0xaThMYWplMm4zczBmcCtMNnUvU1pUSzZpQ3F0cG9qZGw0aU1I?=
 =?utf-8?B?Y1Exc0hrTlZJUnBVaFQxOFZyYWtVL1NWOFZPdE9kN2I4SlJMMmlkVHpNZXZF?=
 =?utf-8?B?ZHRUN0dZN0x6S3FCa2NBREpSUkRYV29qNmxPcU1OckhtWVRvVTNjb0dFSzJv?=
 =?utf-8?B?aEV6cDBMbmxCelJJeFlSZEFmYkdWSVpwWVIzWmlDb216YU44VDJDZHJXa2t4?=
 =?utf-8?B?N3lYWkU0NFM4aStkMTdvSkh2amw5d0R6YTJsNzNqVUhKQ0toTU1sVU5QQnFh?=
 =?utf-8?B?RFFQUVhQUVNVOEh3eFJoaGM2ZGRhZ0FPd1lkR0ZXb0xYeVViK1lCSHZoNDA1?=
 =?utf-8?B?SWsxRCs2TmZKSCtoOEQwYTB0eDlvTCtzYkZ3a1lPbHF2VW5Rbit1QnpMU0pF?=
 =?utf-8?B?d0Nka21WQ0pHWEt6eVZXMEhUNlRRdXVneHVvUHJGd1VnR3BiQlQ5VzluV1BC?=
 =?utf-8?B?SDBqU2ZJMDdLVFNvY2hIR095R1RNalpOWGNvY2puZkVhRlpFb3J2U1BtRGR2?=
 =?utf-8?B?Yzgzc0NjbmRsMDViQUdlUUw5YmE4eEo2MVppL2grL2piWFlKR1NuVlpDNUN1?=
 =?utf-8?B?VXJGTzE3ZmZTM2MyUU5wbll5ZWtSUVB1QVlQYnpzSGoxa2wrZlVDZUdjT3Nx?=
 =?utf-8?B?V2dlc3oyajI5bEtNMHJ2bHhVOUhuZHk2MEdPNFhRL3NPMlhXU1QvSmZqNkRw?=
 =?utf-8?B?NHk5WEdOZzNIUlJZazRWM0tjakY4OG0wWFdWMWdPRHZMNExaTDFZc0xQYnox?=
 =?utf-8?B?K0FOUW4vZkZjbm1JNTJETVl0TFZyd3JvbkdkaGlSNzdYeG5hN2prRWZUb0Fx?=
 =?utf-8?B?ZzRwK2dMUm1TdFpFT2VBZXJiYnp2cDRvdDVNZ2tQd1FwM0p3cjhsd2wydnN6?=
 =?utf-8?B?UnpmdHJtSXczWW9vYWRIaXhwVDVIclFkTUsrcWZwVGFWbThTUWNoZytTaTBQ?=
 =?utf-8?B?b0wrZFBFQnZKanQvZXU5d0ViMEFYMjVLMGVybVBLU3hPWmdVU3lpNUlSdmJu?=
 =?utf-8?B?TVVDQy9ScE1MWEt4MmNrUG15V1FtYVZLQTJiV2lYang0TUMwcVZYVE9hNlh6?=
 =?utf-8?B?ZThUUitCNXZDYnE3bUs1cWd4N1BkMHRxRzdjd016dDVSRHE1ZWdBWUM1SFdE?=
 =?utf-8?B?ODBSV1pULzJKbmQ3L0dBK0x3QWhBaFJlalkveGthdUtIVlVCaUJZaEh4dFdu?=
 =?utf-8?B?dHYxQjJ6NzBrdWRVKzlnRGcxQjVtYkdlUTRMNm52eThSVHBsVmRTaUYzMzN1?=
 =?utf-8?B?V3h6RWlMQTQ5cDJybndQVEFVRDZDSG9ROFBtUGIzcklYcEk4OFpwM1dXRTRZ?=
 =?utf-8?B?OEJCdGQxZEwxRnIvS1RReGVuSlJQUzJXMFYzbFl6TjYzN25ONll1azhnTlJ1?=
 =?utf-8?B?RXpMRDIzZVljOUV6djJMZUpzbUxEV2Erc25xaUV4T1RXSDMrLzMxSCtxQmpk?=
 =?utf-8?B?L1o4WW5IaDA1WTcwS2N4eFI2dW1WUGRRdHFkVE5na3JGWjh3dGV3TDFwT0M4?=
 =?utf-8?B?akxCbDBET2c4SXg4Z1FSdWFrU0RtditBQkNQeUM2ZHA0ZlJPd1NjL0FrcHVB?=
 =?utf-8?B?aWZKRmM4a2FTNDdYM0kwTlhFcXFybXNTQWhUOXpMSUdoRmNOeU4zZjZHTWZN?=
 =?utf-8?B?TWpjQ3ZSOWxCdUUyRXpTdXJwUzlsY1EvYTdldklWYkJMelhReWcwbGkyVCs4?=
 =?utf-8?B?dTBwdnU4cE5uMFVsMnA3VXA4U3pramQrS1U1UGVHUVhIcmdxa1lGaWdtN082?=
 =?utf-8?B?UmsxbGpCM2RyQlltdUpZclYyUTdUOHFnVjZ6SENhV3ZJSFpYeWpLbTFoVDBv?=
 =?utf-8?Q?afyhhIZMJjjp4o1kS2EepyQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2cf8ba-056a-4e87-a72e-08d9fc6db347
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:57:14.5494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxgRKdO3Li/6y97SLYyi+Ax4WKUmuI+6PevpggbPphPYvmGdbQhaU7Cd7Fb/ptt8hs52ZwJVefl9ETDA3ceYvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1569
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
> Now that we have tiles we want each of them to have its own
> interface. A directory "gt/" is created under "cardN/" that will
> contain as many diroctories as the tiles.
>
> In the coming patches tile related interfaces will be added. For
> now the sysfs gt structure simply has an id interface related
> to the current tile count.
>
> The directory structure will follow this scheme:
>
>      /sys/.../card0
>               └── gt
>                   ├── gt0
>                   │   └── id
>                   :
> 		 :
> 		 └─- gtN
>                       └── id
>
> This new set of interfaces will be a basic tool for system
> managers and administrators when using i915.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile            |   1 +
>   drivers/gpu/drm/i915/gt/intel_gt.c       |   2 +
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 118 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs.h |  34 +++++++
>   drivers/gpu/drm/i915/i915_drv.h          |   2 +
>   drivers/gpu/drm/i915/i915_sysfs.c        |  12 ++-
>   drivers/gpu/drm/i915/i915_sysfs.h        |   3 +
>   7 files changed, 171 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 9d588d936e3d..277064b00afd 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -105,6 +105,7 @@ gt-y += \
>   	gt/intel_gt_pm_debugfs.o \
>   	gt/intel_gt_pm_irq.o \
>   	gt/intel_gt_requests.o \
> +	gt/intel_gt_sysfs.o \
>   	gt/intel_gtt.o \
>   	gt/intel_llc.o \
>   	gt/intel_lrc.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 8c64b81e9ec9..0f080bbad043 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -26,6 +26,7 @@
>   #include "intel_rc6.h"
>   #include "intel_renderstate.h"
>   #include "intel_rps.h"
> +#include "intel_gt_sysfs.h"
>   #include "intel_uncore.h"
>   #include "shmem_utils.h"
>   
> @@ -458,6 +459,7 @@ void intel_gt_driver_register(struct intel_gt *gt)
>   	intel_rps_driver_register(&gt->rps);
>   
>   	intel_gt_debugfs_register(gt);
> +	intel_gt_sysfs_register(gt);
>   }
>   
>   static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
> new file mode 100644
> index 000000000000..0206e9aa4867
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <drm/drm_device.h>
> +#include <linux/device.h>
> +#include <linux/kobject.h>
> +#include <linux/printk.h>
> +#include <linux/sysfs.h>
> +
> +#include "i915_drv.h"
> +#include "i915_sysfs.h"
> +#include "intel_gt.h"
> +#include "intel_gt_sysfs.h"
> +#include "intel_gt_types.h"
> +#include "intel_rc6.h"
> +
> +bool is_object_gt(struct kobject *kobj)
> +{
> +	return !strncmp(kobj->name, "gt", 2);
> +}

It looks quite fragile, at the moment I do not have better idea:) maybe 
after reviewing the rest of the patches.

> +
> +static struct intel_gt *kobj_to_gt(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_gt, base)->gt;
> +}
> +
> +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> +					    const char *name)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +
> +	/*
> +	 * We are interested at knowing from where the interface
> +	 * has been called, whether it's called from gt/ or from
> +	 * the parent directory.
> +	 * From the interface position it depends also the value of
> +	 * the private data.
> +	 * If the interface is called from gt/ then private data is
> +	 * of the "struct intel_gt *" type, otherwise it's * a
> +	 * "struct drm_i915_private *" type.
> +	 */
> +	if (!is_object_gt(kobj)) {
> +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> +
> +		pr_devel_ratelimited(DEPRECATED
> +			"%s (pid %d) is accessing deprecated %s "
> +			"sysfs control, please use gt/gt<n>/%s instead\n",
> +			current->comm, task_pid_nr(current), name, name);
> +		return to_gt(i915);
> +	}
> +
> +	return kobj_to_gt(kobj);

It took some time for me to understand what is going on here.
We have dev argument which sometimes can point to "struct device", 
sometimes to "struct kobj_gt", but it's type suggests differently, quite 
ugly.
I wonder if wouldn't be better to use __ATTR instead of DEVICE_ATTR* as 
in case of intel_engines_add_sysfs. This way abstractions would look 
better, hopefully.

> +}
> +
> +static ssize_t id_show(struct device *dev,
> +		       struct device_attribute *attr,
> +		       char *buf)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +
> +	return sysfs_emit(buf, "%u\n", gt->info.id);
> +}
> +static DEVICE_ATTR_RO(id);
> +
> +static struct attribute *id_attrs[] = {
> +	&dev_attr_id.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(id);
> +
> +static void kobj_gt_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type kobj_gt_type = {
> +	.release = kobj_gt_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +	.default_groups = id_groups,
> +};
> +
> +struct kobject *
> +intel_gt_create_kobj(struct intel_gt *gt, struct kobject *dir, const char *name)
> +{
> +	struct kobj_gt *kg;
> +
> +	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> +	if (!kg)
> +		return NULL;
> +
> +	kobject_init(&kg->base, &kobj_gt_type);
> +	kg->gt = gt;
> +
> +	/* xfer ownership to sysfs tree */
> +	if (kobject_add(&kg->base, dir, "%s", name)) {
> +		kobject_put(&kg->base);
> +		return NULL;
> +	}
> +
> +	return &kg->base; /* borrowed ref */
> +}
> +
> +void intel_gt_sysfs_register(struct intel_gt *gt)
> +{
> +	struct kobject *dir;
> +	char name[80];
> +
> +	snprintf(name, sizeof(name), "gt%d", gt->info.id);
> +
> +	dir = intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
> +	if (!dir) {
> +		drm_warn(&gt->i915->drm,
> +			 "failed to initialize %s sysfs root\n", name);
> +		return;
> +	}
> +}

Squashing intel_gt_create_kobj into intel_gt_sysfs_register would 
simplify code and allows drop snprintf to local array.

> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
> new file mode 100644
> index 000000000000..9471b26752cf
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __SYSFS_GT_H__
> +#define __SYSFS_GT_H__
> +
> +#include <linux/ctype.h>
> +#include <linux/kobject.h>
> +
> +#include "i915_gem.h" /* GEM_BUG_ON() */
> +
> +struct intel_gt;
> +
> +struct kobj_gt {
> +	struct kobject base;
> +	struct intel_gt *gt;
> +};
> +
> +bool is_object_gt(struct kobject *kobj);
> +
> +struct drm_i915_private *kobj_to_i915(struct kobject *kobj);
> +
> +struct kobject *
> +intel_gt_create_kobj(struct intel_gt *gt,
> +		     struct kobject *dir,
> +		     const char *name);
> +
> +void intel_gt_sysfs_register(struct intel_gt *gt);
> +struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
> +					    const char *name);
> +
> +#endif /* SYSFS_GT_H */
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 88a83cd81ddd..e8c729f2ae00 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -811,6 +811,8 @@ struct drm_i915_private {
>   #define I915_MAX_GT 4
>   	struct intel_gt *gt[I915_MAX_GT];
>   
> +	struct kobject *sysfs_gt;
> +
>   	struct {
>   		struct i915_gem_contexts {
>   			spinlock_t lock; /* locks list */
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index a4d1759375b9..3643efde52ca 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -39,7 +39,7 @@
>   #include "i915_sysfs.h"
>   #include "intel_pm.h"
>   
> -static inline struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
> +struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
>   {
>   	struct drm_minor *minor = dev_get_drvdata(kdev);
>   	return to_i915(minor->dev);
> @@ -487,6 +487,11 @@ static void i915_setup_error_capture(struct device *kdev) {}
>   static void i915_teardown_error_capture(struct device *kdev) {}
>   #endif
>   
> +static struct kobject *i915_setup_gt_sysfs(struct kobject *parent)
> +{
> +	return kobject_create_and_add("gt", parent);
> +}
> +
>   void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>   {
>   	struct device *kdev = dev_priv->drm.primary->kdev;
> @@ -538,6 +543,11 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
>   
> +	dev_priv->sysfs_gt = i915_setup_gt_sysfs(&kdev->kobj);

Why not directly kobject_create_and_add("gt", parent) ? up to you.

Regards
Andrzej

> +	if (!dev_priv->sysfs_gt)
> +		drm_warn(&dev_priv->drm,
> +			 "failed to register GT sysfs directory\n");
> +
>   	i915_setup_error_capture(kdev);
>   
>   	intel_engines_add_sysfs(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.h b/drivers/gpu/drm/i915/i915_sysfs.h
> index 41afd4366416..243a17741e3f 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.h
> +++ b/drivers/gpu/drm/i915/i915_sysfs.h
> @@ -6,8 +6,11 @@
>   #ifndef __I915_SYSFS_H__
>   #define __I915_SYSFS_H__
>   
> +struct device;
>   struct drm_i915_private;
>   
> +struct drm_i915_private *kdev_minor_to_i915(struct device *kdev);
> +
>   void i915_setup_sysfs(struct drm_i915_private *i915);
>   void i915_teardown_sysfs(struct drm_i915_private *i915);
>   

