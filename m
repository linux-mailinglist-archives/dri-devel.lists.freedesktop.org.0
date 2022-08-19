Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239BC599DEB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 17:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEF810E526;
	Fri, 19 Aug 2022 15:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4474E10E0A9;
 Fri, 19 Aug 2022 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660921338; x=1692457338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tUhKQsDEqmpXoEdkqhQ39ZlYTLBWnq1hZdoOfH1pLNU=;
 b=ZZhedUzdCA6LSOqw6EBYJKBoqB/2rdbLnOVRYJvhrPzQv8dSxcXHUkum
 Lvkz/h2p3/PYKuH7nSThHdQP3dKZ/mfCgsqWryx/zt8dlWo6zSmSRTqL9
 URTVezOO1AjyCuQ8pbaouHpNcS8WfRuUy1IZw9zdoPYEVvL9vyELVRtUR
 g05tJ48D7sdA/g8GxIJusNr0vfTs04LAI04sNT40zBjTpyjYfrnoiDbwC
 PygAtTq6Y5ox/BY07vjRYpycQAljkTjxJCIyRruij9a5jBDzGrvRpVC+c
 1LfHB2db2u+6FLHR3TrraoiBvkLC77Lf5dv1E847PIzrJUBnm6JFNkxW/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="354767848"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="354767848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 08:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="637306140"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2022 08:02:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 08:02:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 08:02:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 08:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTu6dCVSox/FQOFrVibCijJDo6afTYivPcIwq7MOzi+FdwoIYUKwam7H2gFswQFlfWFHpHDcuALXDlZ8bubYL/9A2TqjSHXaPgh+lalRq3vkRLEVEALWulLfofzi4khmYHqbSUWM8ouiuQkGv9j545YwcIVo2EYQ84/t9HMQGnd4qhgRmLo7hd8K6cUkQlOdz4WMbAHpty/F5VQcQPjk0tidzZsRKNILzYoiUFcdAjy0GTGEFtbboa+gptH+NwDQ/55CxVSELzYftxgfMOcVkgRKUlGeIC7L8vIVcJbvbJpSFnCW9bYY9fyZQWwg85Ijm0lRuGc8tCUIvvuZczSquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=375VQ8R0FAHRPbBZIOmZmHHXih4lIYvp+NYoYq23yak=;
 b=IUbUA1w/zn3QAYdALNLjl/7Vxms+W+DJgaMEEch0cRTtl8ce1yQdLHZ8XhoG7VpKe+eCk5jB3b7PRivqn5PcSfG67ckvrU0GiZpV2jJoVBjj5raY6ujg+R54ewq9K515Phnu6uKY7O0MbFd0rgCEzwLqiV4riCLarO6C25enOnGm9UfeTq9IXgJMU/6fhbRPiuFw9InwXy+U3hIR47OqtqRroSI9NQQQ8fuP5sKuEdYvOrCX6Kjs0w+j3xMeIVQFYfuxfXSmF5trs8HLBXvKBwgBTr8zDfu/tFT+M+01CL2FafnSo0n4ANBhAqPucAxcAE/Ruko6vGbKs+O86vxAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY4PR11MB1575.namprd11.prod.outlook.com (2603:10b6:910:10::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Fri, 19 Aug 2022 15:02:01 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%8]) with mapi id 15.20.5546.019; Fri, 19 Aug 2022
 15:02:01 +0000
Message-ID: <080de532-e31f-0cfc-a507-8080ccc82085@intel.com>
Date: Fri, 19 Aug 2022 08:01:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 00/15] drm/i915: HuC loading for DG2
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
 <Yv853PiPcf+gaIf0@kroah.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Yv853PiPcf+gaIf0@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9170c9e4-fd50-4940-a0e4-08da81f3c56c
X-MS-TrafficTypeDiagnostic: CY4PR11MB1575:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUTTOCXDv5nrBb9TOsMAy+0L9dLGxxcLxxXNz+kZEQKBkpYcWVif8xfLxLb2RwU2LxBCbAOr/qBwydnuEYycTmQPEDAIkWqbHVR4SebIjOkaZCdP2H3yvnePhKLz3M7dltjYfkiNAYksPKPkQrkWBXG8NUm8JvlIMkEQD9zObeA6ZaX6PV46LfeSf/UX58fyvXNefXFstXzhWZU/+YW32ywkMHJMpvXvHMnlsTjIxwORGFCz6ZFGW2MJ9N/FCMCjfv96i9f+w//lE6Eq5qwwjrsS/ydlnfLHueVfYX7qLxpoMDYnPxpF+hj4ZEgHEtsBJOs7/n8IsDz2hpaOyvqcd2cSST89Efq2Dcig7XIamZ1/a3MDNOZIqvzSR+bno6UyYwLiucMTg3RPJ2zGlq36Q70kC0SkLUFd8XHC6aHDx8wHn1Vz5VZjgTxQK5EOAQFsI/5fQzIJ9SJ3qKCvvwXVgIbHUQmkndz6syKAR32JMBWps+COW5PIQAZFrmgAZ2xUuKO+nQGHZ4f8guOvoza45wKHKZyZK6vC0nnX/LIwxL1VIMZLPeNPLTiI7Dyb5SbV3JnAk0W7E78hPJzJ8BPY1x6EmR8i0N/gsiHqj1DI6RQGO/YNlpjdQe1YLG7+1D6mRsIt4nMqAEcpU7StUz2Sp1S5De09DGycxWJz3BoeCnxoCAMNL3G8vxx+IsFaVLmvh1rnaEIKQsb74RYJqI3rX1Igf0i6m26KJ7UxY5FEHHB5MUAJdKpUsvZX1WjVNz2okpYVVMjY7i9zOrW8q09Bm8kkEgzfoxzNhurZyGxqKTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(39860400002)(136003)(346002)(376002)(82960400001)(2906002)(107886003)(41300700001)(66556008)(66946007)(4326008)(8676002)(66476007)(36756003)(316002)(54906003)(6916009)(6486002)(31686004)(26005)(6512007)(6506007)(478600001)(53546011)(86362001)(6666004)(31696002)(8936002)(5660300002)(38100700002)(186003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dUbkxpdnVOT1JianNQNHNFb3VhWHVET3JJUjUyM3JtTnBWcnZCMmp4VVFu?=
 =?utf-8?B?NDZCTUp1SE1QbTY4ZXVUOHRJR2tWL2lSYXp1R1BBREltaHlFZEdrWmtmM0Qx?=
 =?utf-8?B?Qkh0NjBXd0cvZ2M1QjNMTzdjMkFubW1lWFhoL3VIQlVTd0h1aVB5ZTRpcjhp?=
 =?utf-8?B?K242UVBlTGxOekQzOFo5a3g4SEtvdks5K2gyZmRRZHd6MDdCYjNsODFYK3N5?=
 =?utf-8?B?UnBPd3NkekNhTmZBL1VCekZMQ0NFUXk2eWx0R0xTaTBZTUhYR04xa21BQjBC?=
 =?utf-8?B?STNRZC83cDFXaFBSK0hmZnRPRzVieGtQeXg0dndneTZta2w3M2NkRHZWWnZo?=
 =?utf-8?B?SmsyNHFyODJBdVFabTA1Q1ZOVndxQjRNTnZFZ21Sc3BqbUVQV0t2N3YxR1Nw?=
 =?utf-8?B?VGVGODNSZHBRaTFrMzRUMSt2RURsdmtmWXNJdGRiQ0xlUkJaTEJHT0dJa0cw?=
 =?utf-8?B?clFqdmg5SDBSblhtM0R0K1l5RTQxWkZQLzdjcnE2SlJPdkhEMFM0ZHVCVEFK?=
 =?utf-8?B?eDdPT3JHZDNUWWsvNk5jYnRzRzYzKzZjVzlhNzdSY2Ntd2hJbzhEa0hBZ0k4?=
 =?utf-8?B?RldhbUtZd0loNTdSZU1pTFRHbEI1cnZFcjdLclhSUFlKSWczakFzY2RBbnhq?=
 =?utf-8?B?aGx0elg3Z0RESFdKRXVHMTFISU0zUWk2blI4RDZraEVPaTlBVWV3ZEorcWhs?=
 =?utf-8?B?c2hZSHFCNGtVV24wa3ZpelNwd3pGMlZQTVM2cHpuTDNHc3JYWUVvSkVYemI2?=
 =?utf-8?B?MWFpbW9aUm5RNGdmT1NGcUcvRGZkNUYxOGYxS3VJN2EwdzBtRHBMVDNGYzJH?=
 =?utf-8?B?RHQyWHFaRWRxcklNMjNpRHRLa3pmMUJhSWx2N242eG9HVTdUZkkyaUkwdmJD?=
 =?utf-8?B?ZUF4S25La0FoTFVCeUxYdWVMRUR5NkcrOWtLTjN1dVZSNW9iM005STY2L3FM?=
 =?utf-8?B?Ry9jai8xZzJQTzJjM1JwWmgrdzJpcE9BaWZIc0NUaHNBbHJWS2NzQ21qRXBl?=
 =?utf-8?B?eElsTS9MNndiYlFYOEtoZ1VxanRGcUdObmZsT0E5WnhMWlZjT2t1N1B4TEZL?=
 =?utf-8?B?MVhsa04xN0pYMld4R01pblBZUUtIMVhNU0gyaURrZUFCb3JRY1dxNWZGMjdR?=
 =?utf-8?B?Q295N2ZxWmwxWXgwemlCZTFNMlpVUXd4Z0pKb0FwdzJ6N2xDamd3ejNyV3dC?=
 =?utf-8?B?eGxQTWVmcmJSQUpITWNodml5RXV2Q1RmV1VYdGxrZ05iM3pwV3dFeTQ0WVI2?=
 =?utf-8?B?WlU5UllPTFhlbndXb2lpQ1FUZDJNNEY2Q0dqTlM5QWZyMGFjK2RIR3VuRTUy?=
 =?utf-8?B?SFpUUStKK0Y5TlY1ZlVrMG9KQTJOWFMxVDhJMktsdmFZYmF3djVHRkFSdW5m?=
 =?utf-8?B?S2ZXTGxQeGQ0UFRmZkFJcXB1cTVLQmFXMEk4QUZuL25HWGRZYndULzI1K1gz?=
 =?utf-8?B?S3BkRHZzSHZxVEdHdm9YR1lnVjJYUG5aOWxJeVBPU0s5TUhsNGpuSHhESnVp?=
 =?utf-8?B?bG9CNXg4VjVpNkpjNlZuM2ZPYXVUSFFDeW5rdjBML0Q4MTk5dUYrbU1FT1B0?=
 =?utf-8?B?UUsxMXZMK2MzbDhoblpyTmt2V21LYjg1VzlsUUs1OE9LV2Jlb0NlWHNMMjJr?=
 =?utf-8?B?MTZkRC9KZFl4djR3U1RoNy9TSFh1RUYwKzMrekw4NXk3TFNnOVM3YmFaUGFw?=
 =?utf-8?B?U1VaTTkxeVllZEZ0SlFDU3VoWlgxVnRadXAweTFWaDZzdHd2blpGZmtmNmE0?=
 =?utf-8?B?ZkREaXVwd1UrVndRb3hWeFZuMkdwZFcxc0MzanBTOHkrZkpIMHNtNDE3KzBE?=
 =?utf-8?B?WmdNNWRVV2h0dkFyRVpOR01lN1JEY0NzbnhsN0RDOTdTUGxYR3VtR3k0YUNC?=
 =?utf-8?B?VWdkSW0xQldmWVk4UTVRNCtaSDBiYkpwYm1hcFROeXJweDhsZ1A0RFNDVDl1?=
 =?utf-8?B?WmliMmx4TUxyTUhUK2JDZWh3WHMrNEY4cVFTOHBGT1dKR2J5eUFqNzJCbnFV?=
 =?utf-8?B?UmxnK2gyeWg3NWlzSnl4VG1GMU1FWjJ3WGVLU2pWRnVuRmVSZkNMMXNQbTBG?=
 =?utf-8?B?MHlTOHJ4QnUxY2dTazNrMEwyT0FQTEowaG9EYmRPdW0vN0dIUWtEYzhhQnFj?=
 =?utf-8?B?aWYrQVV0Q1ZHZTdRZnVkV1lucUJqd3RuRDJ0UHl4STdUbm9ReEVBcDRGclRk?=
 =?utf-8?Q?R3ePC1TO/Wqmovp7xWgF3YY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9170c9e4-fd50-4940-a0e4-08da81f3c56c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 15:02:01.7331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7codooRhxGDVZQ32vVtgh8RyKzLYhNYbPbu/u4UoDljQaI9wKsGsPYk8lHPk3tBJP0Mto/ZXblm9tmbthyw13HtlqsQu6Wv1JzpzHcYmp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1575
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
Cc: Tony Ye <tony.ye@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/19/2022 12:21 AM, Greg Kroah-Hartman wrote:
> On Thu, Aug 18, 2022 at 04:02:28PM -0700, Daniele Ceraolo Spurio wrote:
>> Note that this series includes several mei patches that add support for
>> sending the HuC loading command via mei-gsc. These patches depend on the
>> GSC support for DG2 [1], which has been included squashed in a single
>> patch to make the series apply and allow CI to run. We plan to merge
>> those patches through the drm tree because i915 is the sole user.
> Doesn't look like you cc:ed me on any of the mei patches, which is odd,
> and ensure I can't review them :(

My bad, will re-send the series and properly CC you on the mei patches.

> And why are mei changes needed only for drm?

Simplifying a bit here: the GSC is on the discrete graphics card and 
only performs operations that are related to it; we have the mei driver 
take control of the GSC because its interface is mostly the same as the 
ME, so we can re-use the flows that are already implemented in mei with 
some tweaks.

Daniele

> thanks,
>
> greg k-h

