Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930514FC94D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC37910E13E;
	Tue, 12 Apr 2022 00:36:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4722110E13E;
 Tue, 12 Apr 2022 00:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649723797; x=1681259797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TqfGbe2fPWpP8wEYHK+NXc4UT16QhAjOFjWHqZ4PbzI=;
 b=WsTvzY/o6su3ZWpMyl6f4YqjPNRkqCK3shq6pOBp3EEPcyh1MkV/W7Vc
 3oyadTjL9DvrbEGXivWAs8arGGhv+9CE4TzhuTaS+Zw3usiOIteGmK0lK
 Y5oG70L2SvxB/598l53LhSBs9gS1PcBnFgi/+M7I+eJ9PNHuexCPskujT
 LhzNMVlsNQhtKyNnq+HSxzNKEKj49mhk6AYHyphsnBqK3ITkTrdxnhArE
 FgiR3i+TF4b8R4ixPJtum+tAzt+7llyDvugG5h2h+fmP6Bu7UaJEcjs0n
 ME4YH1KT3Fzjh4fJLcrYk3KvsuHtMSc36ZmfVBpMqAMnvZ/qHHUEI1yjx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261684903"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261684903"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="644497280"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2022 17:36:36 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 17:36:36 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 17:36:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Apr 2022 17:36:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Apr 2022 17:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4LHb6Q9fMuL2n9FZvaMkZhre1GwSqGfQM7WpA9I6n595M+aj/L+qCIK/a0Gzw63OiDCTG4hbRrH8zUlYDrKTe6VcQsDybc3Z2cHVN/6TpwOv+ihaCtM4TbUpmAloyNWAerm8nJauQMOfwBZZijHTjHrez64nwSuPb6Dm40jZ1S3z5Q9dutqKPcSR7FtyuhtBAtm7iD6fcFuEuJ/AdoiKS5J0s3bRCDira/CBjRYOfMDn4GwnIhlB7LKniaKZR0uR6O/ErsPTbFfd1rhYhMwT1625TMe9JxOZ7SXKNnMON1X4p4UE8Yux7qJSeEmqbZ6TY7LZetKHJBTSMUhTyFCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esZH3ecT7B+ItGZRvoHw3RtFTOHnr4/USXQE9dJ61KU=;
 b=PDXPSXPVaWD42rJFKs+V4Kqxp8kpsyw/kMhdRnzHQ8thrNp45cgu1w7fnfyc6H6al+DgO1WkfPPxcDx6+3jLvrcDjFuYk1ku2oWw60odt9FAIeBxWJV3H3b18z6HUqCQVBtqabnN27zhAR1ksJhn6JoXE00iCtp0iTo8tX1HdjRDLvI8D1eNVRhdQlMw10G7FtAIqmli310+tKmSci1k+xannM1nR+Gu9moIZUltlKICpZ3gVpP5JRzS2nGG/POKYFKmXN4ciZrQWmiCxS55tfU53Peoz/F2KyL7hm3/YgoClhDBDpNwd4AGSvF1TwnYFSixitPMuzPuWkO9F9UnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 00:36:27 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f%7]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 00:36:27 +0000
Message-ID: <240cd202-319d-2b8e-0d32-2f037b332028@intel.com>
Date: Mon, 11 Apr 2022 17:36:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/guc: Update to GuC version 70.1.1
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
 <20220408180326.1454951-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220408180326.1454951-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:74::44) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 849b4a64-7983-4f50-daae-08da1c1c7b03
X-MS-TrafficTypeDiagnostic: BY5PR11MB3992:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB3992234B82C42F3A78F4EE88F4ED9@BY5PR11MB3992.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYWvMIbxVKL8hqJl/0Ifg0RgnigHL9GKqxsR5APmTkuCOH+gP7oqMrFWH6QLxNZw0HD6211c+wqpT05IfoXuvasFG+jid4U3R8bwzbgSHKRu8ySCQHH84VTq7gKsU7UTWS1VUCfKbzeFwR94FTNvUGCPtkfjTzjT17IohPXFmvVuW4JcnoKvBVRdxM2DKJgH6Ej3uApyScB6kvujmyubbFAWpJw1riYIHrI2n+ByQTlnSm2LnlS5drUMGEnFb0ABJxzmjRdY/wLoLV5yi7tbTL8Js/IpaKN9GIzGHWzxHwg+DXk4Xi99kypKJmFg5Z7Z6zmMYuzvStISCQDO18kgb46E2/VHd6yQuOt5XJ+LeMLA8lMD8lx1P+QTpJ9yQNkdCsVB2UwjFFiJu0jCUwB/N/jLlAlBXDZAEOmL2mQbnYMSD29M1p9su3CwXGu5RhkgQBoae+bIWS/gz6VSkJacFVmFJoVUHkCuA0z75whzAeGrXQk+6UzHz4f05J8aQr6htzAvK23tPAzE1Wv55PkO3Ppz2zN1W3ss6/dY6OsV2tpaInFIjScKhvrHFGmXOR5LEMyxura04q+GUX4yRyv+ehIVRQPirYsq2O1Ih5CczvnrxazVPtXPJe01YdL2br0KqvFPS5wad9iFKgUmLGZNlAxzGuIXyf3qNyGfi1lAJDQgNtTBXZPBJNyRM2oRj6Es5rG8m2RjkTF9L7LF7fCmnuhc8epHwpjAWRXwpwjOsHI6t1L5TuMUG5cu7CGbdIox
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(31696002)(5660300002)(66946007)(82960400001)(2906002)(6486002)(8936002)(15650500001)(86362001)(6506007)(6512007)(53546011)(83380400001)(2616005)(450100002)(26005)(4326008)(316002)(186003)(38100700002)(66476007)(66556008)(508600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUluSnNNaXVzTVJUS2ZPdDUxaU5SNm9ZQmFUWjlmbkh0YmZ5U2lIVlRYRTE0?=
 =?utf-8?B?Nzh5RkVhUXhhNW9ZZ3plUlpJM3Y5UG5EYldyMjdEdnN6V3NZY0FzQWhBejhG?=
 =?utf-8?B?MFNrdDEzeWg4ZEpkbk4vYnRsY3M1R01hQk8xei9IaVBsQWk5NjV6OGpCdTVr?=
 =?utf-8?B?QWFhK1FQZWx2bHBNK2c0cGtaSlg0bm9VaGoycTRlN3FnUm9EY2JFekZEaE95?=
 =?utf-8?B?V0lpaERJSHZSSVR4di9FYStLMWNpOWRiMVZWSlBlbXYrSXhSL0t6KzBwZzJr?=
 =?utf-8?B?bEN2dDBaSEwvbkNBZm05b0xhL3ozUTU4Y3QrdkhmVVdSNDlwSDRHNW1DRFQw?=
 =?utf-8?B?WmgwV1BDakcrNmJtaDF1V3dvSzRsQVp1VEUyNDFLOURlV3pPTGd0YlZrWGo1?=
 =?utf-8?B?SFpmSHVFelMxV3JBMXphTE0wQVY2dDVQWE1zOUVXdzlUWmhYUlhmVEJpNVpm?=
 =?utf-8?B?ZXNTeEVvL3pFVTNDUUJnRnQxY2dOekdNWWt1NXd0ZWF3OTVLcU54TE1kVDBz?=
 =?utf-8?B?YjBoczB6TWh2YTQ4bWN2UWYrTHlYWUlOOFVGbnNjc1hhYi84NTJEWUJSODBD?=
 =?utf-8?B?MEJNd0tmUHZHc1VVUkwvcjhoMUtJOTRjME0rWU1jQXl6L1Z5YXd0WmdvTlln?=
 =?utf-8?B?VVUybElDT3JxOHI1SFgzaFMvT1oydjFNSDUzWGJYZEpxYXVjc2VzclpmRzR2?=
 =?utf-8?B?YzlrZVVSN1ZodC9scE9rcjRIOER3cUd1RHBqMVUxZjBQY21KZDFubU5jN0JH?=
 =?utf-8?B?a3Q3VEdFenVLSEVPTktXdGVPQllUU1NhZzBMdzZqd3hZV0VLZXdNNHB3M2Zr?=
 =?utf-8?B?SWhpUnFiUkZYeUV4bExoem43bWM1b1hodlVmWnY2MWcyZUNqbkhpNWVUNERw?=
 =?utf-8?B?R1UvOFhFS3d0OVRkMG45NjJMTmJESnpZTEg0dzc0eWRzbHhIMVBrcytMTmEw?=
 =?utf-8?B?c01CUGlXWVQ1cUpNaGVxSUY1WnlkbTR1a08yVnJLNW1qTW4wZzM3cVVQc3Fl?=
 =?utf-8?B?ei82YUN5UHk3RmpiWWhxWEtmUXAzc09SRHU1OGdRNkNRZzFNak9wUkdKaVNT?=
 =?utf-8?B?bXZDODA4VFNPem0xa1hYS1U3MEk0b0JETTFHdjBQOEl4elh6R3lxUmlyR1lv?=
 =?utf-8?B?QUxDM3hCMW50eDhob0tYRVBKTjBNZjF6a3Jtem9sd3U2NlhHL2xIQyswNHJj?=
 =?utf-8?B?dmxpSWRsKzBsb3JFMml5YllIaTRkcFZtWmZNTUZMZ2Vmc1BsRG1HMWJtRWZJ?=
 =?utf-8?B?ZnRudXZ4MUYyVXJ4M0xjN2oyZklmZ0lPbjJkeTRkdVl0SXdTY0kzeWdpNnFL?=
 =?utf-8?B?eEV1MVBGeGtKV3VYd2NxeWFYL1BOcWZjSjZLYkQ5RmtrdVFwUWk5Z2lDYnU4?=
 =?utf-8?B?dTNnTFRVRjFKL1pscllRMHlJOFBaeU5nckU5eEFDanNiS3J4Tm9OdlhGbVlX?=
 =?utf-8?B?VklxOEg2cXRlSytOeTg4M2lVMmV4MiszVXdlNVJLaFpCWVdkWGx5dndoUlFK?=
 =?utf-8?B?UVgvYTdodkRyM1BobkoxZ2ZDQ3F2VEtTd25zZmI5SjFVYUVYZFhRcUFydG9U?=
 =?utf-8?B?eDNaU0hvM1ptam41cTFiNlJKRStITWQ4UGNRUDBMQjlTVHk4aUV4emZYYmhv?=
 =?utf-8?B?YWk5ekgzbEV3dVZBVEhvMkJ0Vkk5cVBxQmMxM1l0T1M5RFZxZEV2dERHaTFx?=
 =?utf-8?B?Y0VYcDBka2lRdU1OWTJXWDNLaUhIQ3dyTElCK3NVcnRDbnJlZWFNYlZhODNU?=
 =?utf-8?B?Q2lmMzN4OEF2bWV2MGhYcGVhYzhjZi9SSjJ5NVp0MjlyL0FMM1lkY3FJOFhY?=
 =?utf-8?B?alJlamFQQWhWR0NXV1VFNjJ6NEJzeFZnNVdoc0xPbUdwRFRZek8wYnpkTDlY?=
 =?utf-8?B?YzRqcDhVSkM2bGFsYXMyNFNpSXpwdEZxcERFNjVScEhZSDA4SkpYNWUrdXdN?=
 =?utf-8?B?SnJjS2tYQ1dXSUtiMVBpVVZFRmUxUWM0WFQ2QXJ3ZGN6VEF4VEFaZ0x5Q3Z3?=
 =?utf-8?B?anhTS1lORmJESlB5YnRZMnAyeGdGQnA1aDlzbWZXZHRyYWNEN1A0bmtHd3VS?=
 =?utf-8?B?Z0xBdG9XMlhucjhUQUo1QnB6QUJGSTBMa2FwTW1zTHEwc09nZmdhQUNxSFVP?=
 =?utf-8?B?NUVsSllDZUcvSGFSLyswdjQwYWNObk5xdm9jNmZCM1JRbm1aeUJsOWEvUE5n?=
 =?utf-8?B?TGVjSUo4QW12eGVZakN3eGRhSTN0L1BVa1N4ME5jbTVpTXdDS2ZMdjJxUjhX?=
 =?utf-8?B?dzJmbXQyVHRWM0pCa3dZUklVblc4QmhhVGs3clJmVTU1bFdTU3VwTzZPbkJH?=
 =?utf-8?B?eTVSS3kzck8vNWlFZExSYXg0bk1DU1NCOGxTem50Tnc3VkJtcnBMc25pNmRD?=
 =?utf-8?Q?nd0Md3S+J31khd6yaXr35eWCG/5H0wA/bYze8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 849b4a64-7983-4f50-daae-08da1c1c7b03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 00:36:27.6319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kofSr8u6OBIEJb2v/JxAdXg5+QwhLk5QC/ao/rWbS1bkjaTi9YRkPVqWIkDd7U0xg8N8rhOfuUVOMeWQPosyTjHTSXrGL8iPbg0oV07yr6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3992
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/8/2022 11:03 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Update to the latest GuC firmware release.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 32 ++++++++++++------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index bb864655c495..cb5dd16421d0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -53,22 +53,22 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * firmware as TGL.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> -	fw_def(DG2,          0, guc_def(dg2,  69, 0, 3)) \
> -	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
> -	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
> -	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \
> -	fw_def(ROCKETLAKE,   0, guc_def(tgl,  69, 0, 3)) \
> -	fw_def(TIGERLAKE,    0, guc_def(tgl,  69, 0, 3)) \
> -	fw_def(JASPERLAKE,   0, guc_def(ehl,  69, 0, 3)) \
> -	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  69, 0, 3)) \
> -	fw_def(ICELAKE,      0, guc_def(icl,  69, 0, 3)) \
> -	fw_def(COMETLAKE,    5, guc_def(cml,  69, 0, 3)) \
> -	fw_def(COMETLAKE,    0, guc_def(kbl,  69, 0, 3)) \
> -	fw_def(COFFEELAKE,   0, guc_def(kbl,  69, 0, 3)) \
> -	fw_def(GEMINILAKE,   0, guc_def(glk,  69, 0, 3)) \
> -	fw_def(KABYLAKE,     0, guc_def(kbl,  69, 0, 3)) \
> -	fw_def(BROXTON,      0, guc_def(bxt,  69, 0, 3)) \
> -	fw_def(SKYLAKE,      0, guc_def(skl,  69, 0, 3))
> +	fw_def(DG2,          0, guc_def(dg2,  70, 1, 1)) \
> +	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
> +	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
> +	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
> +	fw_def(ROCKETLAKE,   0, guc_def(tgl,  70, 1, 1)) \
> +	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 1, 1)) \
> +	fw_def(JASPERLAKE,   0, guc_def(ehl,  70, 1, 1)) \
> +	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  70, 1, 1)) \
> +	fw_def(ICELAKE,      0, guc_def(icl,  70, 1, 1)) \
> +	fw_def(COMETLAKE,    5, guc_def(cml,  70, 1, 1)) \
> +	fw_def(COMETLAKE,    0, guc_def(kbl,  70, 1, 1)) \
> +	fw_def(COFFEELAKE,   0, guc_def(kbl,  70, 1, 1)) \
> +	fw_def(GEMINILAKE,   0, guc_def(glk,  70, 1, 1)) \
> +	fw_def(KABYLAKE,     0, guc_def(kbl,  70, 1, 1)) \
> +	fw_def(BROXTON,      0, guc_def(bxt,  70, 1, 1)) \
> +	fw_def(SKYLAKE,      0, guc_def(skl,  70, 1, 1))
>   
>   #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>   	fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \

