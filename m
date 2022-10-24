Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D4B60BC41
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 23:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B3F10E052;
	Mon, 24 Oct 2022 21:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194D110E052;
 Mon, 24 Oct 2022 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666647191; x=1698183191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RLQa52zTf1PjPQK2u1zCDo6NXhAUmZxZIDke4NR4w1M=;
 b=cdZzqViPKyS6QgqGYXngXGF9qvH9CnaHvcizJcuFt2zZHKgxRaln8Djx
 5olbvfzJy67GD/o0kBHWQoTALHDEmcOfIORZ2YklscJHXcoOm9FMguxYV
 nCshAxRMoe5s+FN25YBRyhPtbjwnJ9sGJalWN/9ji2Yjis5nKSxNX/gOp
 36efFrbyIqPDE2mfb2pAyntVTFbMaGtsvG8en0Rr9lNE9x0v8X1uISGou
 K4W3pJHHrDeGLKeAdpYJixINc0BaNK3XYtP8VxiY/pnB9JiDoueYIHmJs
 LfaBfjqUJLEraCGs7pwyMJxt+dVlHM502J4HvPF96jF1s51uHNuAs3UGo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308620434"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="308620434"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 14:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="720626097"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="720626097"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2022 14:33:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 14:33:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 14:33:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 14:33:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 14:33:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwlCd2/hU27P8khJkpA1PVgFeKmDaUTyVtdSWxon1Ih3a81SDZx2Rm6GsB2/l3u6ghWs+VgKTWdjWe+01gcfLbMakOvv3R39oIGPkfOwN/lMvYBo6vo78mMWInYVFkmEfw4Q/N1Lu8RAuHYMrXlZjHdbC4p3QIl/Xa3q6fXPk6P3Bag/zGWPSD0DuCAg3caRFdM2uTHqq4ASJi546dHKE/KP4ftuD6FxWRCBFeRtIwRcfP0UzncT1P7PsoXmgGlK+UQGU/ELJm1NJjM1RZUBxg7V18SKqWx6vY6HAyVkGpvHUuyGmND0D5fXYyp2iitKH5+uXcnmEB9Kf6PCzPoO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14eu8VObVb1PkQ3tYKe1T5TspNYb7vy/+eO4oy0THXw=;
 b=cAma51HvwZWWzANVwzNP1WlXMfvVVCNmQje4vXdfmI2i47jhCHbtAgSe+/W/CT9wHP+AUW+d9AKY2I+26D6T/YzI0XmRYRtEk6dRcvHFzXQ/wIOOoqcd/A4cpYIlsO/KQgZeb/ZJnkbTgV0o7E7A4O13LmwVVf+Q9Te0qc/BQ+6Q0B7q+SUOu4HGN2HRLxFLfH0OoRlh08iQx/8kAmLo6lcDLtwvkg/aNp58iKniziEhY//eCqzdZUyH+Yv2zYuztLKJbEzkHTofH7NG/ZMkmoj3mIfUDcu38X07UZjcRmRufJe/Y4b0GHlP+/d2cwtF/f0IBvSHNlZUshMmf/83yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5443.namprd11.prod.outlook.com (2603:10b6:610:d2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 24 Oct
 2022 21:33:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5746.027; Mon, 24 Oct 2022
 21:33:05 +0000
Message-ID: <e444179e-c722-2a06-4fa9-3122dbd39966@intel.com>
Date: Mon, 24 Oct 2022 14:33:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH v3 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
 <20221022001008.2340224-6-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221022001008.2340224-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dda23c-8280-428f-64d6-08dab6075629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gTZ1Wrn6YaRJ0Qqit78GAVhoFERdSRIuIz0akHJQOqApPy1BCbRhobVMjgJ4hX+Pj3xZ6X0kD3UCWSOMWr/ttMNCrAILL8ploB4F3TpFWg3QrPEyJCgMwJncm4jVzU9Q7WdmdKfZen4apFj3I/Ilft/G7hc+rOMMqVSnRRRvf6+lnIrRile8PqWiis2Z58Rp3KuAUKLFu93gSf/6FZULh9cyxFGjyXONkTM23xWoz5o2/EAduxrhM51UV5pbndvidEK8p2xyDfwhflMtrDIpZJYCI6Y3v4oe/RiJ+wwq5Nw52864/nHB3xnCQ83SVeznDwUeifAoHc/XVqzZnWglZ2HBW9GOmHoJvurLNIzzQZDFdjDr/rDDdFVsYfH4nWx1aLZmCGI8RpnNGGVSwd5UZVfLdASAZ39EwG+kESItnEEu7YA0tm2rlbu2toGLPEWP7pmNB4YtUGRH1BnJltOB6XqaxHLUqdaWxP55qXQ8A+km2fjqtyoxe0LiJBpwa+GgSDfRrBiyrWjw8YXJIDvgXtNnQb4KCFPcIsY2KYbQ//M/i+maxpTaZzOdvVny5pqRZWh9rhLB5Cd8C8/Ty/ewujYmdmkBRczixqE2c3d6LQk4inLO/KPugRRF1Fu2CaWcHSE7ki2lNK42wAJzUiPlY8I0BsTNv3pdvaGxOrhgIgMXj1rQuzRH++WBCtEyqSdapLmH5PSFS/Wv9Tgntei69ToppuS3V0EDVgUGAcZbOBLQRWOqxvm5CuOLVCdTb2FD6Ow51K0u7148CSe9R+MM6+lPcO6sJqDlAwjUN3yu8rg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199015)(31686004)(38100700002)(54906003)(30864003)(6486002)(478600001)(66899015)(53546011)(8676002)(316002)(66556008)(2616005)(82960400001)(186003)(66476007)(66946007)(83380400001)(6512007)(5660300002)(2906002)(41300700001)(8936002)(26005)(36756003)(86362001)(31696002)(4326008)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWsyWm4xejIzR29SUjUzU1FPcmY2eS9vbHVGOHlSdVVLVFNxUUFLUnRGb1lH?=
 =?utf-8?B?WDFWclcwdHg3a09WR3pOSVZQMlZOVVR0bFBrVzVNblgvYm4vYkxiZ0JwL1Yx?=
 =?utf-8?B?TkN4S3pxNS9kNkJZT2t1Z25TTFIzeDFpWGsySUV2RlZGYTBVWW1YQWh6YkI1?=
 =?utf-8?B?YWlWMEUrRVB4ZnhGeHc3UW5TZVlEYVBMZExWRHFhMFh5cnZISXJFZjh1bmJY?=
 =?utf-8?B?N3VlVTJtTUFRTmYyUHhTSUpIVTA3TFR3blAyZFc1bmdZbW1OdXhVSTJydi9H?=
 =?utf-8?B?YS85blBPNFcrYlF6bTV4VWtOWTcvanR3R1BzM0VENHFkTi9rV0k4bFpWQUs2?=
 =?utf-8?B?YXBna1hNWHNDN2c1Wm14NmZWSVlobEI2bkRRZFVPTEEyQWFEa1d3NXhzcktr?=
 =?utf-8?B?a01XeEtWMmxLdWlNVGRQeU43Q1duNTVwb1JvWWZaOFFtZkd6b2xzMTVCa05o?=
 =?utf-8?B?ZG84RE1Ya0xlck5RWlBOMDFFQVFEYkNiejhWZFFkMVA5UEgzWTFibWJLQ0tO?=
 =?utf-8?B?ODc1RUdQR1hYMnI3UjhyVnl0WWYrbjZuQUMyVWNYUFZJNitsalRPcGhOUlh1?=
 =?utf-8?B?NVFvRHQ1YzR4SFJGTGNvUkFOUFJKcEx2SW5xQmxRNTNvRUkvdnl1TEdDZG5v?=
 =?utf-8?B?aUtaWXRiTFBlcW1Ia3dRelN4emUrNGNOeEgrT2Nld21HejhZTWxCd2FSdWFk?=
 =?utf-8?B?U3VZc3JkZkRYTTFSWEo1TVpWVXBiOUp3d0JENHJ6SWJkbWtrNFdBMzI1Titx?=
 =?utf-8?B?VzZJNEVUaTJVRHY2eHN3dHQyMnFUeW1HcVZJM0tiK3FlT3ozb2V3NG9zUVkz?=
 =?utf-8?B?MWJja0RIQ0ttVGNENFlHY3hvRWJxQUVsTVBaOTYxWmtJczhBRm5KYlZ0aEhm?=
 =?utf-8?B?djJLRmV0Y3k4UDJYVk5FV2N1QzAwUExvRUVGRks4cmZzcVc4MVZ5bE9tZW9a?=
 =?utf-8?B?ZGpXYm1TMHp1emxqbGhzbC9XSzJiRGM2VGg5QUpudzBmelZhb3NoQlpJbjNN?=
 =?utf-8?B?a09mZ2daYkZUYyt2QUJxN2wzS0NLL29PanNET05EQ1BacExkYzN2V1BvNHpI?=
 =?utf-8?B?a2xBYlgyeGZuYXp0T1J1NzhFUTVUdkNRR3FHSCt1MDBQMEpRSVpYbUdEM2ov?=
 =?utf-8?B?OUI4TGl0alg1N0FwWXFOTWt4RlltMldYMVZtSjMxY29KT3BrVVRGa3E5SnFK?=
 =?utf-8?B?ZkRuYXdzSkdETFVNRDlPc2ZPc1NTb2NHVHlGRXpya2RDczcwSFpmaUo2Unc3?=
 =?utf-8?B?ampOeWw5L0VtNDI4RVBJWjgwSzBKSTdPcHFrb2pNU0ZkTkwvWG4zQyswa3Uw?=
 =?utf-8?B?TUxya3dLaFdtRHJUYlJMMkxtQmFCUEYyZzlKWnl4aStHMis3Rkd6cWxXaWNI?=
 =?utf-8?B?WWpVaVdqUEpmL1ZrQVduOHRYOE9IbkpBVmdudFJMd2hEV0hRWW4xV0lXY1ZS?=
 =?utf-8?B?QzJIbWFKdENVUE56NWRXN3RPZUR2cWc1QUVmQWRYM3hCYUJWRTRhVFllb3lX?=
 =?utf-8?B?cjU5S0hUN3lYVHpsbUpaSU90TDFqSWtud1VBN0xmMW12Sm9maGo2K0pablFI?=
 =?utf-8?B?ZGZ1Um1qYVNRQ2Y1Y0JkUEY5ODdxVG1FMVBGOEdXdXFGNDFRM1JVcSszd29L?=
 =?utf-8?B?dm5tNHVwMnpHb2dVRkxJYkFqQnVTTWE1VWlKNXhEUzF0NTFWblJodzNXeVpr?=
 =?utf-8?B?ZkpBVXp3Y09xRnM0MllMbXRRV3ZpRkQ3enVYQUxQa2xVZ2hqTkVraDJjVEdS?=
 =?utf-8?B?WG9GSGllZ3lJeHk4K0I2SmVSZ1ZBelNzYWJJZWVnYmtMVzNKNmFBd0NGQkxF?=
 =?utf-8?B?SUJiUk12RFFTNTN2Qy9Vb1dTdVlhcTk2eXdhVkUxenRvelFwREliS09CK1Jt?=
 =?utf-8?B?bTJYaEt0UWExcFRCRG5ZTWhFQmdGcWNrekkrNUordG9TYXhGWFpxcXM0eHpr?=
 =?utf-8?B?Rll3K3JQQTVYNjZKc3JMT3ZzQmVJZm9xUzc4T0x1Z3B5VXJST1VqcjdmamRu?=
 =?utf-8?B?Q2VjWlFHdmdtYlZodDIvdUdLTE5vMWMxT1lRbTRzQjA1RVUwV2FiMlZ5d2U1?=
 =?utf-8?B?eXdNTFZsZEwweWRSWXh1RlZNeXdOREZlVFZtQTd3aVYvTzhHeXQ3QjFCajhI?=
 =?utf-8?B?YzRLUkxueEFVS2tCRERyNkkvMlhjclduSmhHSUZxVXk0cWY4YnJiSGNZRXQ0?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dda23c-8280-428f-64d6-08dab6075629
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 21:33:05.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pEQ0Hhzno79H9teZgUfy5UZ9+g5SnZgdi5utiLJjXO8hCMerlmfhL9YLkny82oxoafOyDWdgA8eM92QwQhsFOKJvclECN688loyR03ZX4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5443
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Alan
 Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/2022 17:10, Daniele Ceraolo Spurio wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>
> With MTL standalone media architecture the wopcm layout has changed with
> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
Given that GCD is not a term used anywhere in the driver, I think it 
either needs to be either explained or dropped. Plus, Graphics Companion 
Die seems a confusing name for the root GT. Surely the media GT is the 
companion? Especially as the code seems to be written such that the 
'companion' is required but the media is optional.

While on the subject, the explanation of SA should be more explicit. 
E.g. "With MTL Stand Alone Media architecture, the wopcm...".

>
>      +=====+===> +====================+ <== WOPCM TOP
>      ^     ^     |                    |
>      |     |     |                    |
>      |    GCD    |   GCD RC6 Image    |
>      |    GuC    |    Power Context   |
>      |    WOPCM  |                    |
>      |    Size   +--------------------+
>      |     |     |   GCD GuC Image    |
>      |     |     |                    |
>      |     v     |                    |
>      |     +===> +====================+ <== SA Media GuC WOPCM Top
>      |     ^     |                    |
>      |   SA Media|                    |
>      |    GuC    | SA Media RC6 Image |
>      |   WOPCM   |    Power Context   |
>      |    Size   |                    |
>    WOPCM   |     +--------------------+
>      |     |     |                    |
>      |     |     | SA Media GuC Image |
>      |     v     |                    |
>      |     +===> +====================+ <== GuC WOPCM base
>      |           |     WOPCM RSVD     |
>      |           +------------------- + <== HuC Firmware Top
>      v           |      HuC FW        |
>      +=========> +====================+ <== WOPCM Base
>
> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
> by the bios. Therefore, we can skip all the math for the partitioning
> and just limit ourselves to sanity checking the values.
>
> v2: fix makefile file ordering (Jani)
> v3: drop XELPM_SAMEDIA_WOPCM_SIZE, check huc instead of VDBOX (John)
>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>   Documentation/gpu/i915.rst                  |  2 +-
>   drivers/gpu/drm/i915/Makefile               |  5 ++-
>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 44 +++++++++++++++------
>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 ++++---
>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>   12 files changed, 52 insertions(+), 32 deletions(-)
>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 4e59db1cfb00..60ea21734902 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -494,7 +494,7 @@ WOPCM
>   WOPCM Layout
>   ~~~~~~~~~~~~
>   
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_wopcm.c
>      :doc: WOPCM Layout
>   
>   GuC
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 2535593ab379..cf3a96b3cd58 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -127,9 +127,11 @@ gt-y += \
>   	gt/intel_sseu.o \
>   	gt/intel_sseu_debugfs.o \
>   	gt/intel_timeline.o \
> +	gt/intel_wopcm.o \
>   	gt/intel_workarounds.o \
>   	gt/shmem_utils.o \
>   	gt/sysfs_engines.o
> +
>   # x86 intel-gtt module support
>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>   # autogenerated null render state
> @@ -183,8 +185,7 @@ i915-y += \
>   	  i915_trace_points.o \
>   	  i915_ttm_buddy_manager.o \
>   	  i915_vma.o \
> -	  i915_vma_resource.o \
> -	  intel_wopcm.o
> +	  i915_vma_resource.o
>   
>   # general-purpose microcontroller (GuC) support
>   i915-y += gt/uc/intel_uc.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 6b58c95ad6a0..9263f10ecd28 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>   	 * why.
>   	 */
>   	ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
> -			       intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
> +			       intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>   
>   	ret = intel_vgt_balloon(ggtt);
>   	if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 27dbb9e4bd6c..8c751314df3d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>   	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>   	intel_gt_pm_init_early(gt);
>   
> +	intel_wopcm_init_early(&gt->wopcm);
>   	intel_uc_init_early(&gt->uc);
>   	intel_rps_init_early(&gt->rps);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 64aa2ba624fc..2d18fd9ab11f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -30,6 +30,7 @@
>   #include "intel_migrate_types.h"
>   #include "intel_wakeref.h"
>   #include "pxp/intel_pxp_types.h"
> +#include "intel_wopcm.h"
>   
>   struct drm_i915_private;
>   struct i915_ggtt;
> @@ -100,6 +101,7 @@ struct intel_gt {
>   
>   	struct intel_uc uc;
>   	struct intel_gsc gsc;
> +	struct intel_wopcm wopcm;
>   
>   	struct {
>   		/* Serialize global tlb invalidations */
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> similarity index 87%
> rename from drivers/gpu/drm/i915/intel_wopcm.c
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
> index 322fb9eeb880..c91f234adc55 100644
> --- a/drivers/gpu/drm/i915/intel_wopcm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> @@ -64,9 +64,9 @@
>   #define GEN9_GUC_FW_RESERVED	SZ_128K
>   #define GEN9_GUC_WOPCM_OFFSET	(GUC_WOPCM_RESERVED + GEN9_GUC_FW_RESERVED)
>   
> -static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>   {
> -	return container_of(wopcm, struct drm_i915_private, wopcm);
> +	return container_of(wopcm, struct intel_gt, wopcm);
>   }
>   
>   /**
> @@ -77,7 +77,8 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
>    */
>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>   {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>   
>   	if (!HAS_GT_UC(i915))
>   		return;
> @@ -157,14 +158,16 @@ static bool check_hw_restrictions(struct drm_i915_private *i915,
>   	return true;
>   }
>   
> -static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>   			   u32 guc_wopcm_base, u32 guc_wopcm_size,
>   			   u32 guc_fw_size, u32 huc_fw_size)
>   {
> +	struct drm_i915_private *i915 = gt->i915;
This is no longer required now that the MEDIA_VER check is gone?
>   	const u32 ctx_rsvd = context_reserved_size(i915);
>   	u32 size;
>   
>   	size = wopcm_size - ctx_rsvd;
> +
Likewise, is this blank line still intended?

John.

>   	if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, size))) {
>   		drm_err(&i915->drm,
>   			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
> @@ -181,12 +184,14 @@ static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
>   		return false;
>   	}
>   
> -	size = huc_fw_size + WOPCM_RESERVED_SIZE;
> -	if (unlikely(guc_wopcm_base < size)) {
> -		drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> -			intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> -			guc_wopcm_base / SZ_1K, size / SZ_1K);
> -		return false;
> +	if (intel_uc_supports_huc(&gt->uc)) {
> +		size = huc_fw_size + WOPCM_RESERVED_SIZE;
> +		if (unlikely(guc_wopcm_base < size)) {
> +			drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
> +				intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
> +				guc_wopcm_base / SZ_1K, size / SZ_1K);
> +			return false;
> +		}
>   	}
>   
>   	return check_hw_restrictions(i915, guc_wopcm_base, guc_wopcm_size,
> @@ -228,8 +233,8 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
>    */
>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>   {
> -	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
> -	struct intel_gt *gt = to_gt(i915);
> +	struct intel_gt *gt = wopcm_to_gt(wopcm);
> +	struct drm_i915_private *i915 = gt->i915;
>   	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>   	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>   	u32 ctx_rsvd = context_reserved_size(i915);
> @@ -274,6 +279,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>   		goto check;
>   	}
>   
> +	/*
> +	 * On platforms with a media GT, the WOPCM is partitioned between the
> +	 * two GTs, so we would have to take that into account when doing the
> +	 * math below. There is also a new section reserved for the GSC context
> +	 * that would have to be factored in. However, all platforms with a
> +	 * media GT also have GuC depriv enabled, so the WOPCM regs are
> +	 * pre-locked and therefore we don't have to do the math ourselves.
> +	 */
> +	if (unlikely(i915->media_gt)) {
> +		drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
> +		return;
> +	}
> +
>   	/*
>   	 * Aligned value of guc_wopcm_base will determine available WOPCM space
>   	 * for HuC firmware and mandatory reserved area.
> @@ -295,7 +313,7 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>   		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>   
>   check:
> -	if (__check_layout(i915, wopcm_size, guc_wopcm_base, guc_wopcm_size,
> +	if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>   			   guc_fw_size, huc_fw_size)) {
>   		wopcm->guc.base = guc_wopcm_base;
>   		wopcm->guc.size = guc_wopcm_size;
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h b/drivers/gpu/drm/i915/gt/intel_wopcm.h
> similarity index 100%
> rename from drivers/gpu/drm/i915/intel_wopcm.h
> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index dbd048b77e19..4cd8a787f9e5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>   {
>   	struct intel_gt *gt = uc_to_gt(uc);
>   	struct intel_uncore *uncore = gt->uncore;
> -	u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
> -	u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
> +	u32 base = intel_wopcm_guc_base(&gt->wopcm);
> +	u32 size = intel_wopcm_guc_size(&gt->wopcm);
>   	u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
>   	u32 mask;
>   	int err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 81e06d71c1a8..0c80ba51a4bd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct firmware *fw,
>   	return 0;
>   }
>   
> -static int check_ccs_header(struct drm_i915_private *i915,
> +static int check_ccs_header(struct intel_gt *gt,
>   			    const struct firmware *fw,
>   			    struct intel_uc_fw *uc_fw)
>   {
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct uc_css_header *css;
>   	size_t size;
>   
> @@ -523,10 +524,10 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   
>   	/* Sanity check whether this fw is not larger than whole WOPCM memory */
>   	size = __intel_uc_fw_get_upload_size(uc_fw);
> -	if (unlikely(size >= i915->wopcm.size)) {
> +	if (unlikely(size >= gt->wopcm.size)) {
>   		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
>   			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> -			 size, (size_t)i915->wopcm.size);
> +			 size, (size_t)gt->wopcm.size);
>   		return -E2BIG;
>   	}
>   
> @@ -554,7 +555,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
>    */
>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   {
> -	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_uc_fw_file file_ideal;
>   	struct device *dev = i915->drm.dev;
>   	struct drm_i915_gem_object *obj;
> @@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	bool old_ver = false;
>   	int err;
>   
> -	GEM_BUG_ON(!i915->wopcm.size);
> +	GEM_BUG_ON(!gt->wopcm.size);
>   	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>   
>   	err = i915_inject_probe_error(i915, -ENXIO);
> @@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (uc_fw->loaded_via_gsc)
>   		err = check_gsc_manifest(fw, uc_fw);
>   	else
> -		err = check_ccs_header(i915, fw, uc_fw);
> +		err = check_ccs_header(gt, fw, uc_fw);
>   	if (err)
>   		goto fail;
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index ffff49868dc5..ba4b71aedc40 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -371,8 +371,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		goto err_ttm;
>   
> -	intel_wopcm_init_early(&dev_priv->wopcm);
> -
>   	ret = intel_root_gt_init_early(dev_priv);
>   	if (ret < 0)
>   		goto err_rootgt;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 9453fdd4205f..66aa2cd9aefe 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -62,7 +62,6 @@
>   #include "intel_runtime_pm.h"
>   #include "intel_step.h"
>   #include "intel_uncore.h"
> -#include "intel_wopcm.h"
>   
>   struct drm_i915_clock_gating_funcs;
>   struct drm_i915_gem_object;
> @@ -235,8 +234,6 @@ struct drm_i915_private {
>   
>   	struct intel_gvt *gvt;
>   
> -	struct intel_wopcm wopcm;
> -
>   	struct pci_dev *bridge_dev;
>   
>   	struct rb_root uabi_engines;
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 9093d2be9e1c..7a9ce81600a0 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		return ret;
>   
> -	for_each_gt(gt, dev_priv, i)
> +	for_each_gt(gt, dev_priv, i) {
>   		intel_uc_fetch_firmwares(&gt->uc);
> -	intel_wopcm_init(&dev_priv->wopcm);
> +		intel_wopcm_init(&gt->wopcm);
> +	}
>   
>   	ret = i915_init_ggtt(dev_priv);
>   	if (ret) {

