Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42466F4756
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA2410E2A0;
	Tue,  2 May 2023 15:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67C310E2A0;
 Tue,  2 May 2023 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683041743; x=1714577743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zxZi4QS3W/ZwuibjbdeU71bPAlxlcVXTCJ64czjwiBg=;
 b=Htb5XytY+RKkInOv+VtQWzHwEGLkHkiIrAUtuxc8exonixzFt9rHIU4A
 zqGinGQfawiCXRgUgSIJNAlzH84xcmjBx2C16w9fHF+aYVBcZp/C4HoSm
 OvizVopbI1oAiPix6nZVWDcvwmDWXshAGVZu3Dko9qNUQJ9S5Kf+iyxX8
 ILSPXcobZs1yqauS3N2r+nT6SSDt3PMrJI7t6Pw/JZ/fXHw+1bOOlHS3M
 1UUvyS+OfkNKbxIqE/87GlYbJWm9j69pD4IUhsvFk4uCniMZF2T7KI//u
 Ihm/He8hEBoddC63drjLYK/CxuHdfxjfUmYJXkGIQlkW81fGErCVETDZi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="337552963"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="337552963"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="728975900"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="728975900"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 02 May 2023 08:35:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:35:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:35:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 08:35:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 08:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1SW7k5Umi8BSoRd2CAcbX7MrvWI8217o5oMKpNEBtLp6Ytu43/d3O2tPhINn8tQL9DEE4iOxsCfIbTEwshWgxBMn99QweRpYmnIi8qWcE0u/3xzMxOQPEP92N4yXUQFfk10ePAJS8tdCYmkD3r7gff6QebaNCG2cbIzq0tz5t6QZ96QJClfs150/uH/j+3VfTSHhOD1xaGnNlgHFu2rgsFYcXYV2c9E9N8JW8/7BbiL8FsYlHg/7HywfkNcbTHBfKEwef1uJDkEhjknLOjSPpjXTRU+s7q4VCiSrZbpuP2sAZ8B8dphCzg/hz92f8474guiX9EGd2SFXLMWwXTx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAY5M4wwC8MIMMLvjBeynQW64sk05czk9K8L4nnlF7k=;
 b=mO/NCuaWq1X+oUN7KVWAzxqd6/fh1fP0ikMBdv9jDEYES9424bovWSAhThgXnk0KhT+8TcWEIhEwR/fdpMBBFFiUvlbhd5AmO2SQlMp2LXL6WMnY8KDHzibnSL5bTu7I8gTUKDBwypS+o226v/BzftLeVXS+RUdl88T8yLEdIfExocMdP/RE/vlUvma+Fx6wUeL6SUQ8unegQchEX9q7/pAopSH1jWq0yZskdBZoFL1NAg0za1hwCiG9tnUSchGVz3zVnv+oS9H+iwE354vQFByN29We3qF4Rz810epEWVIsUVUMfDxCgCs2gyhJVtQyukUNe5aL3wTEArKRvDo9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 15:35:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:35:39 +0000
Date: Tue, 2 May 2023 15:35:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 12/14] drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE
 to itself.
Message-ID: <ZFEtu9QAh098FVJA@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-13-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-13-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ee6c49-b247-4a49-9b3a-08db4b22e1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYjo68Qc/dCzxmYq1sJss88xsL1SkvSMZ0oeYlnIRMxPp4c3+kDdzUwa9txRPCe1aj95Ny1wxOladYlANAWCn4wtXETYIW6bEExUCGEr006yCT9Jm2oo/xlkwLGd5yQjvb+E6wYSULafvSeiBsgm03qBXhaO61qpfEVFs/kXsC+kv0VgM0LXoD0s4b7THlMBf6kzk+cpFFWDlExxURgo5z0LxlwD6MSgMyDIUEvfzz/lna6jEXAG9TVC7HG++ZGyV+n6yN6nUHmsvU6GWn5KrN1RQ+OvH+XTtHfCztpQ2ZUDM5iVQYFL3ICN8qo0oDuVHhs0u3sRLLCoevscQvQqIaU0xqw5+kVg8ja4d96Qjb7qA0uipnKC+b1lXK6X60p2Z6i52hCnKDjhOD2D+vaaw19p+ZxutwBCb7AYwns50J3y0FRJCi6BJ6+jQL0p/ukvk4b91rrBw3w0ibsjEsaZLrL8K97hL8fAcGkrTPEGQPfSaltVRDYmO0l0JJItthdqKCAOKbqQguzTa31zG6AuzaZzKKJvKXPBYzSrd1YLzCM1McyrujQcQRqaQGdqGxkn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(478600001)(450100002)(316002)(66476007)(4326008)(6636002)(66946007)(6506007)(26005)(6512007)(66556008)(66899021)(6666004)(6486002)(186003)(2906002)(8676002)(8936002)(41300700001)(5660300002)(6862004)(44832011)(86362001)(38100700002)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zPWsDDHpU5t5t+z0A/E+WRK8PgYD6vl+xxbRc1dgBMA8y/H/nFIjjIFbc+kN?=
 =?us-ascii?Q?wR3ULVAenVZs+X28IlNvgYjNi13vRsulAwl3j5V+GN40Tcql6W4rK2005nGT?=
 =?us-ascii?Q?0Tpyyxx7A2NY9lxnQRyx3r8YH89F2mT5ZPo0v0ZTRd/LyuWn4vCr1XiiEeCp?=
 =?us-ascii?Q?yewx9DgH6e6L/xNpA5ffUwimFDACwe2oTf4yDmHv22auTE8T97BNXQFISioO?=
 =?us-ascii?Q?i374Fdf9LGy6kFkMuPQJ+SHi7ODudmFbkTsX1+XWHHz34IQZO8IfrBiBwKE0?=
 =?us-ascii?Q?AzfE1dzeMuFTSzBWwzQcvWTLH9dMPpeb4GUwFpPWHneyCklRcgX58BczHji3?=
 =?us-ascii?Q?wp68MPHSuYzT2PCsgKLKX46Lau5yUZp6lTKsPzlNgwYD2v4i+KMGR57as056?=
 =?us-ascii?Q?CyJ6yK2+LqI2fe/bGA/FzFGBkgUhgIswOL535DorYzFvXVhjd9JYZinIrcHF?=
 =?us-ascii?Q?2Kf9wKVYkmcwAsPGQX6FV+WLc1B0g+RRv3SGXUHMOoENtNfnn4y8xu6817Cs?=
 =?us-ascii?Q?7PyW2INd3a/iQo/3Q2eTVxufyY16rcfaWPHS+WC6mqEzFmVd62nrbrFsXlej?=
 =?us-ascii?Q?rwHu+O7smVs3LCYKekJEokiYITYRyYTyVX3cfIrZ24RqIch44puwnGUFUys7?=
 =?us-ascii?Q?fd/4n2OWR0gBIxB9AspvrcJjPev5veGbsRtF9aeyb5bXIF4V8h+Bb4yqwXsk?=
 =?us-ascii?Q?OVlTo6+X56mB59RnYJQVMTzVZ/g3IQXN+1vK82eDEchCtGxTsYp/c1+/4DUX?=
 =?us-ascii?Q?uJgLSivuaDXcIo3GVyktAhNGCgim74rgn7OHfH9DIpTGDV+yaDGnPt/tRHAZ?=
 =?us-ascii?Q?2NEs5K2QxdPPfQn0PHVJp15vrCatNLVh7lmi7fD5k6gl1kC5CX/h7AnCIuzg?=
 =?us-ascii?Q?x5FVV5RI0EpMZr8a5V6qlGo46LBlI14LLF7BDsmaNbp00z2yBLgcJ0pVAJlg?=
 =?us-ascii?Q?8inKNvf3C8p9wjwag8nQ7E+9bGV0NdR6STg5cCIf1KUZnVVcLZEOfLUHrisC?=
 =?us-ascii?Q?VZ3hYCmd4rTJmK4O9oTo3q6TqRfIVRovINugyzu9hzH82UHSRZDahFbtqHsw?=
 =?us-ascii?Q?GZNIoq38be/dkPg8FgdgqqFrCLBihrXtAoYCAgeh50jN1HMp6SldHhL7Mtyi?=
 =?us-ascii?Q?DHpkdqE1CvKVhpBPrML0GmpOxb/gRvQmz77TI4ToOS+CSwI5sKVfeXitkGbw?=
 =?us-ascii?Q?zfq+vEz6W04gJkvt4QC9N6xKPHWtI5gpIqO8XiJFPBfMl1zUhRsaModQlbvf?=
 =?us-ascii?Q?R2PCTWUV32bWQuUlLwsWmAkmx2AlnKp5YVtvv8DB/fpF1OoZ84ixI2HPqNAq?=
 =?us-ascii?Q?oxd4WDJaFHOifcp6KAipLoDwSOzz5kJQs6QjrfthzjaSxCiGFDUWQ2YlNLxg?=
 =?us-ascii?Q?WRm9OMYRXRJxtYW5abpMqq4imvYQ1C8tIfO94YEROk8x/oOgJTnF/gpEKmkH?=
 =?us-ascii?Q?zbUJMM7r7W8svw4WFW/gJOVDB+kH3XPiW6i/MKzgavsWXcFprHi132BvGRo5?=
 =?us-ascii?Q?2d7Yio66vBLFM6LTWR+ehy+D5RvAlMC8OQN09m7q1ZrNpn+2WfNkIticwSlx?=
 =?us-ascii?Q?3UjDMEhNeEw8Tv6760RD88bMpyngeo+qlcBUcmhoF3zstG5ydBtpZME7Rb/t?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ee6c49-b247-4a49-9b3a-08db4b22e1cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:35:39.3805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENfL6gbba5G7Uf7/+Fk9jC8i90m9XCHFOSX1eQRmXBIMnYg6FqJL82VbqC/8YcS0vR5Jy6kJwPz4HGt5qdfczQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:11PM -0400, Rodrigo Vivi wrote:
> There are multiple kind of config prints and with the upcoming
> devcoredump there will be another layer. Let's limit the config
> to the top level functions and leave the clean-up work for the
> compilers so we don't create a spider-web of configs.
> 
> No functional change. Just a preparation for the devcoredump.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Again will conflict with GPUVA, not that big of a deal, I'll leave it up
to you.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..4cffdb84680a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3369,7 +3369,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  	return 0;
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
>  int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  {
>  	struct rb_node *node;
> @@ -3405,9 +3404,3 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  
>  	return 0;
>  }
> -#else
> -int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> -{
> -	return 0;
> -}
> -#endif
> -- 
> 2.39.2
> 
