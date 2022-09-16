Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D45BAD82
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 14:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9C10ED29;
	Fri, 16 Sep 2022 12:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DBA10ED27;
 Fri, 16 Sep 2022 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663331741; x=1694867741;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UThx+jXWxQTojmRQ5GDIgRK6lXFsxoXWTtwAIn1qbaA=;
 b=EyBOEOoKdJIeTlcWybw3gfEDcAgG82dGVYCf9HZXnUaUNTQ++vr0eCky
 IHbNo3cpg49ifkl3tqCqMUfZFSEdJ4gQr41moJC3IozPly/WMjIPMe6IP
 85baNxCuQaotfiYrMOuAJR1Htvl1UfIvfM0MsRpV7AJD5XpwCTY643of4
 6isPfFg8tcH5Rm+sDtsMBCQl2vyzkWxB1PFXEHBIQYIn9yumf0Z27WWgX
 uFoczrPIJNRBfBNrT096bibU8HDTb9DemcZyZelW5wd9dxEx2fp2qR9Ae
 KdqZfWPwvfUpQKrJNpriXLIrNJFsJDO3Zb+pRWMITF1p/xX5AQOmxQLAy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="282008866"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="282008866"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="617654179"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 16 Sep 2022 05:35:37 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:35:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:35:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 05:35:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 05:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlcEP9hvkxz8aXuMHkYfg2sHcN0bmeekhnt5Eo/5XSMkjda2lbGUO7VRTmkovwkC/IOF+PjkYwaOJQ6zvyflNGJyLfucclOCtgyPHq0xsCD6EZ2EDuzQYd78x5RXUJNelpOfmFpLU1dTbpERd7LBCOhsoCwF+MjZ3VYOjV4xuGVN/UXUTBrLp5FbAv5+U5y8VK81tUwLpHDBBHRcwSY6pAJNh9FSZEgDlps2+KjU5WlUa0Mvf/B/CY/43gug8NwnIMNTZRy1HTgXe/ymiWz0LCllwL/7c6uST7U8YmtTQcqDeo9CQJIbW1HvyNXeQwDrECCGMi1P9S17YvC2hVHroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L5JptA2JULO+amrzbexjPnGRLxhDx6AxWkaM+WkVkE=;
 b=lZKK75gAp10dmjBAnlSnveQB7NygJUv+LbMJu4OejXR0HWPANl3iFet5Ig8+YA+mGTxKoPppG5P6YmfAqiEJmgrwP23Liyhg5UMarjZJ2HXWkK/Ebc+XuguoMUDTxqohdUhcofL9Q9A7IYBAuIoOkfWVKctM7pv9JH38WVqqSEGwExGy2kMgsM4X8emsLzvxIq5oDAnidoZ5RoLJy9XAUNnXkH1Mr9Hb0xi3XwqEkwMNb7/BrEIxDm6W/2lfbPZ8+Szm2Z5w/d1mdQnCRrV/wCax0qu6Cnypo6WTmjpL9lf7qvSSs1fwuR09wrF9ZQM9CKXQsJgKW2beGplmP45WLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 16 Sep
 2022 12:35:33 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 12:35:33 +0000
Message-ID: <c97f34a6-8929-1ca3-00db-3926c3229920@intel.com>
Date: Fri, 16 Sep 2022 15:35:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 02/37] drm/i915: display: fix kernel-doc
 markup warnings
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
 <7e3429ae63900ede4ac2c95f281e2e0221e6946f.1662708705.git.mchehab@kernel.org>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <7e3429ae63900ede4ac2c95f281e2e0221e6946f.1662708705.git.mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|MW4PR11MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 6798b839-a478-45a0-f52f-08da97dff273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEc+jxVx46FConSoNZVAlMmtacUTZh+YiSTO7su7m4Y11gqevTK0EEAtdwHlwb0lfLWeralpAE9OCeL9JuOme5vDHeq3mmZF+pdt6JAB71dD53fDa6yMpvyQZofYRQxtoodecMfSlz8C6l7T4SI6icbUZNtVmsHxvKl4/EIpkCiLH2ziPenJteGFc/lyNir2U0F2N/o6GXVUlQBaBAykPsepLgam2JK38xg2DWpmPdtMrJwdeDqG3xk3Y1rxEe2+34Xk6vh7iGmvztNLs0hB0106hZvJX4b+M/fq0xv4ffDmo3aekEDeZeAm9QOuRWjelV02aigp0Bq4Jqn63e/G82wHPP5gDXef3Bo1BsTG6A8IFKpw0RC0KB3MVPVFiYoiPyKFoMyVdTgwmPPnUBM/3+NAcI8Sfc4v01RFlK4pa8zgMbuyEfeJ3+G2cIJcVLerfyJHJPf3sPm4oLrfW41cmTuWHy/wD1fyk+Q/w69UmGDaXRpSbW0HYxl740hZa3ycXGDC+VJum0f7TcuxWmZo165JHgfZN604m3ZYs6zqR6Ev1fUQKJHb5U+UusoytXmZkPu/9qGXQ66uVaNs38Z5n71CWELMRbE+t8sN2zqAe9FwkEIoFeCwiBHXdLZR3TGNAX+CUxNRcHZLJRlrbeEyDN0u0WiuxL+F2z3Tz3aTMDSIOBQlRp5zrRFrpp/WKbtCxPYwpJj+ng60URc69McQJo91/njFBXhpuL4PsXMRtc1yNbqNIPobzHF9sRQv9uF0u+8qho89zUDMtTvxIP8+okSOvnfcF4uilj9C3LX+EcPy/2DU35oiBvcKIuGPvDYw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199015)(86362001)(6506007)(53546011)(31696002)(478600001)(2906002)(316002)(8676002)(4326008)(6666004)(66556008)(82960400001)(8936002)(54906003)(6486002)(41300700001)(6916009)(186003)(2616005)(966005)(66946007)(31686004)(36756003)(5660300002)(26005)(6512007)(38100700002)(83380400001)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0k2K0JUTzFyczNheVEwLzBoM2ZqbEYzSDM4Z0dLSjc3UzJsMmIzMFRNY00x?=
 =?utf-8?B?ZlcxM0p5amlWdG5kMmZoNXdhSnlER0hrMXZ5WFl5Q0xCT3hDTDVyR2VHdjZZ?=
 =?utf-8?B?UXozSVRmLzJqaytia0tXRmNPQXJpQlNPZUF4RGhpL1dsZ2VPbWkwWEhyeis3?=
 =?utf-8?B?NjlUa2tFSis5aGhib09GQWhoeUtwcGNtM0pLNjBYUWZ1SkZ0aTM3QlBCN1NZ?=
 =?utf-8?B?a1gvVlQzOVJsOGZtZmU4WlA5c0ZGK2I4aWxMREdhSS9WSjArL2x3S01FYWNi?=
 =?utf-8?B?QTh0RE1NaFVUeHNBaGxFcE9RNXBvV3hOV3hmUFNTVXVWSzNoMkJUMFBwMlRz?=
 =?utf-8?B?K2lpT0lmbjFFOEMvUG5LM2pmc1pPSndYc0hpSGN6NVQ0MXZFY24rQWhzTFZl?=
 =?utf-8?B?QW9iSVhUZU1kOThGaW8waytJdmxqeVIrSUxQSkxuTHFTdVNhNkVLRWR2V0Vu?=
 =?utf-8?B?a01Qbnd2cy8xVHFzUHcxWWdzRTJBVGRJcCtYS3REK2JlOHROV0xTelhkRDBX?=
 =?utf-8?B?YUdLeFpYQjQ4L1lLY1dWLy9aaC9la1ZUTStSSHFaZDg1K0I5WWFJMDQ0bTZI?=
 =?utf-8?B?ZFdwaTlNTzE1NUZxRFhoSGZNbEYxRjV3M3k2R2ZqUFdkTU90RFdrYkRZUHJx?=
 =?utf-8?B?bjJDVk5MTFo5bHd5NjlLdGlvM1VrS3hrSStyaFRjQ3RxaW05VVhxSGg1ajg1?=
 =?utf-8?B?aVlGSnRLMnZRMnJtR3JyUTdEa0xEQ1N6UXlwdEJwaG90SHlKMWVtL1FqcGRN?=
 =?utf-8?B?ZkY4NUU5dGtuZDV0a3FJaEpKd1UyTnlVT3Z1bXlUQitqQ0Nxd3NOMnNZNytl?=
 =?utf-8?B?eGV6YWVBa1VNK0ZDbFQvS2k3cDlUSDFvM0xpS2FnY2dhOXl5TCtyeHZVbmVX?=
 =?utf-8?B?RFh5S1lYTzU5TTM3QmE0cHpxVEFaRmZFczI5MitSS0pkR2xxZk51UHVlOE8r?=
 =?utf-8?B?VHlsWWFMVFJtZDBIK1BOeVpPdkNDM3dPUk5GcjR2ZTUvT1pSd3V3UU1XaExE?=
 =?utf-8?B?S2pMKzl4R2hLekVFUHh2RHdmeEpuTWpKV1lVTWpsMUJlcWM2Um9zajU0TDZZ?=
 =?utf-8?B?cU1WUHppU20rZ1BWeEZ6WktwM3ZjamZKWkFsaTd1MXAvQW9rTWl6UGx0Ri92?=
 =?utf-8?B?SEdrUkpCSTZ0b0NNODk2TlhVRXZrb0lyWEFranJLcFUrMWN4TTU4NVE3NWto?=
 =?utf-8?B?b2hBbElINmtwSzVQOFI2VFQ1NEFoZC9wWWNtUmV5cEZURzJ5UlpTbkQ2TEY2?=
 =?utf-8?B?TVYvTUt3RzZWc2hEMzlGa3A0SHdIMWJwdmVkdVBFYmZ3L0tmZDJ2Qm5JQStF?=
 =?utf-8?B?Wld0RUM2aGs1RWZnUzRhTXdhejJ5SnM0MjRVZFg3ZWR5M2xUVW5iekNlSmpB?=
 =?utf-8?B?ellrWUxzK3RKT1pldW5sSll4QXdyS1ZFblBVZHNZZDdBejF6cW5oK2lteVM0?=
 =?utf-8?B?WkhqR0ZBdjlDS1o3dzQvdU9tNmxlODM4L09qV1FwSGFjNndLa0JEWVVMRkN2?=
 =?utf-8?B?MHpaWjM0VmY2TmhWbTBuVkIyZnhDcCt4MmlFakViLzdhWnpRNmNuZVNRVlJx?=
 =?utf-8?B?U05MTnJWUGhBM05mb2F4VVBXM1dmRG9kazZJMXdYZ1ArdjJ0WEJmbE1Idjg4?=
 =?utf-8?B?ZFdLelNuODd4Z0thR0ZVdjQxbzFiR2MyRkh6RGlVVTY5SkhCeXBUSkNFU2NO?=
 =?utf-8?B?c3JOWTJNeTNzWEdCc1UrcHI4cnNxQ0JkdDhodklScnd2VW1IZDAwWWpZRmpF?=
 =?utf-8?B?U0M1OE9KcGNTcDdYNURySE85VEVxRGRuRXRzYkVNT3FuTjlNaWkvTWRFSFlS?=
 =?utf-8?B?WU1wUzJXOThXZ3A5UnVxRGYyRkVKUEhiN3l5UUhMZWp6eXdwY2ZRVSsrU3Zp?=
 =?utf-8?B?R1lhcnNJQjhkMURGNURTUW5SVzZTNU04YmtMdW1iVDYxVTZEamV3RDkxeFVH?=
 =?utf-8?B?QWpaZHFGeU9XdlFZZTZrMFhCRDlyQnlWSkZoeUcxNnU3bzFqYTFuKzZLYWtH?=
 =?utf-8?B?d2o3M1dMK3hsQ3V6V1hHb3ZtQWpHZ3g4clBKWUdYU292QXE1NXpabnJlYXF0?=
 =?utf-8?B?N0hzOHo5N2JITUNuVkxPclhHVDVDMDJQQWZxbS9YYVM2MHArTWlpM3lwaUgr?=
 =?utf-8?B?SjRQQVduTG92dFZDT01xTU4xVmwrVkZjV1lKSFBYME9KdkJUam05VFVMYytM?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6798b839-a478-45a0-f52f-08da97dff273
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:35:33.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plDpS2adVZXF63fK3sruxQlTrlNlPLUhKz6l9WZV/zRKUFWJYM6bBExIPStVZxDRc0zU+OIt1gag94rFk5OtHE6xqIurCBYE8R/hUONZZ4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 9/9/22 10:34 AM, Mauro Carvalho Chehab wrote:
> There are a couple of issues at i915 display kernel-doc markups:
> 
> 	drivers/gpu/drm/i915/display/intel_display_debugfs.c:2238: warning: Function parameter or member 'intel_connector' not described in 'intel_connector_debugfs_add'
> 	drivers/gpu/drm/i915/display/intel_display_debugfs.c:2238: warning: Excess function parameter 'connector' description in 'intel_connector_debugfs_add'
> 	drivers/gpu/drm/i915/display/intel_display_power.c:700: warning: expecting prototype for intel_display_power_put_async(). Prototype was for __intel_display_power_put_async() instead
> 	drivers/gpu/drm/i915/display/intel_tc.c:807: warning: Function parameter or member 'work' not described in 'intel_tc_port_disconnect_phy_work'
> 	drivers/gpu/drm/i915/display/intel_tc.c:807: warning: Excess function parameter 'dig_port' description in 'intel_tc_port_disconnect_phy_work'
> 
> Those are due to wrong parameter of function name. Address them.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
>   drivers/gpu/drm/i915/display/intel_display_power.c   | 2 +-
>   drivers/gpu/drm/i915/display/intel_tc.c              | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 5dc364e9db49..e8433aa50905 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -2232,7 +2232,7 @@ DEFINE_SHOW_ATTRIBUTE(i915_current_bpc);
>   
>   /**
>    * intel_connector_debugfs_add - add i915 specific connector debugfs files
> - * @connector: pointer to a registered drm_connector
> + * @intel_connector: pointer to a registered drm_connector
>    *
>    * Cleanup will be done by drm_connector_unregister() through a call to
>    * drm_debugfs_connector_remove().
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 1af1705d730d..b080d65d4461 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -686,7 +686,7 @@ intel_display_power_put_async_work(struct work_struct *work)
>   }
>   
>   /**
> - * intel_display_power_put_async - release a power domain reference asynchronously
> + * __intel_display_power_put_async - release a power domain reference asynchronously
>    * @i915: i915 device instance
>    * @domain: power domain to reference
>    * @wakeref: wakeref acquired for the reference that is being released
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index e5af955b5600..10cda362537e 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -797,7 +797,7 @@ void intel_tc_port_lock(struct intel_digital_port *dig_port)
>   
>   /**
>    * intel_tc_port_disconnect_phy_work: disconnect TypeC PHY from display port
> - * @dig_port: digital port
> + * @work: workqueue struct
>    *
>    * Disconnect the given digital port from its TypeC PHY (handing back the
>    * control of the PHY to the TypeC subsystem). This will happen in a delayed
