Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01151DDDF
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511AB10F208;
	Fri,  6 May 2022 16:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC16410F208;
 Fri,  6 May 2022 16:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651855826; x=1683391826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rfWlhIe6jAmf9w/TxVihh96ej5t5IXpLRJfG9kHpgto=;
 b=gVLd61QltV9TtaULzL7gxGx5tcjcn7sQsWXckQoS1onaE/VvqpMwvO48
 0tRA+ip1XlY0COala+nOdRJvFEFA1phAKr9e9ruVqM5AQjYyM/yx7IMyt
 VKnQobvbwyw+sHKrvS1/jsa6A+KEAaeQLP53ilp2v0XGydAzN2Xk65LiE
 xClQSI6/4O6ihinhEs/NP6lHF0OGwrQy02aDtZVpiUgpjKBqhxAU9MGNq
 fJCLVAgmCqQpn3ZN7iojTmoS7a6CeIEe4Saj+bRdr/2nAC9j/ePazAqyS
 38CsBAXBA9s+W2XMY6MTa2WS42vAkpQ4h7uVKfyzuad9/9NjGrA7Gd3d7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="249049991"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="249049991"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 09:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="735826759"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga005.jf.intel.com with ESMTP; 06 May 2022 09:50:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 09:50:24 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 09:50:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 09:50:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 09:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItHjvl31D4vb7lhuopcP39WtyRBrv6Bri9NP1ax405Th2dNLexcIzgWOgE+bf0ZJouCDSFVcMM3rq7igddft8iq5gx8IoP7WXk6q3NnBRCCW+9qAkEsdKT1lpnDE5/SDIpmOg3uAh/SNOXirhJOlaWf1ih+eZzSd9x4XPEjEnaUa4p5L7tZrUBqhCJ/kXfUrCECD/b8br+44J1Jcb+2gd2kIdafj8gBW5mYAGUW05e/HcODan47x5JAJZksMsQHIbLIYIt5daPE7iJOz5+/hjDvHRgi9B0DWGlc9BqHRtD6u6gvQ+2EV8TgWCEEGnvze2Ykvh+WkQ8mF06j4iSd7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc7ul9aPo3xIF1gpU9kymMY6zMBXKYAlNEUuBTuw9YA=;
 b=brFbQg1iNJO4VciGx9IxFDWun6SrJF1yDX+IXVCDbJ/JBjDZmszexM1AiRU2zqmCigAjJPakNcgU49dfxKNOHQ3RAC5myRTx2DkAAu9Lf70DqHyJplnvULFeLk5un3Ju1uLfrzhmDjGyC2fF9bVvn+z5200eB9KfXu2VRXhrq4tdob0OIq6wQbzViwlCtxtRCC7yIphlFxDFTkv0IdT70FGV8jXJhZUTgw4RVFh1lp8G/tD9BefjRBWYEz+HDRFqwuRe9Mu8h3iX7S92tjaWygUKirdG1rPj1AIBtohIkkgtx/ApnENij6B2RoIKYB2/1QRrZpkPI9cCMnCRqKrkEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 CY4PR1101MB2165.namprd11.prod.outlook.com (2603:10b6:910:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 16:50:22 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 16:50:22 +0000
Message-ID: <6b6318ed-cd45-203c-d05d-2b5437213656@intel.com>
Date: Fri, 6 May 2022 18:50:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH] fbdev: efifb: Fix a use-after-free due early fb_info
 cleanup
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>
References: <20220506132225.588379-1-javierm@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220506132225.588379-1-javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::14) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c43c9d53-4e0a-4bef-d2cf-08da2f8082de
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2165:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR1101MB21653F308F4D7248056D79B1EBC59@CY4PR1101MB2165.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OPZkAShiWLPgjj18YlZ9yOoos7sRljlsDMLskbj/LGTaB1ezdmUSFs7KeJtjxvgl/jtszcppq7QcnOC2F9pZGaZGEyacOmQYwQcl10AY2lxKEB0CuaZQ+dCjPxRjAZUL3Dwy12aS4oJokvxQNjgaRgHhmxHnDh+j9SaG3/n23mol2cOEwUsSouz9T7YYxFr7PY3nHAmYYKYs123w7bKdeM784Ng1n4haZh6uRWqUJxTzj6yyDZHN5JAKy6IaNGF6X4EGXD/6Vc+IjihsHOW0lohPTCLk1w5GIjSZsD54RCJ2s6vptCEqV1t8Te/ZBRgla/MBHS8VhfidaAK8VFG3HCrES6kxJrXw6sl1/al5EKuIYgmDAuT7GaaQb/Isgy5M5HgqGMcL9g4ze4G0rSFwIHd2fJze/Rv3quAfaXmiZr2T1RwwTNYwjvfS8k3OlVrWw95BruDXlbemOXjO19hvjHkNoBXA+iznN8vY1tLmLTaTjLCrWzA3qUlB+xPWIUEZQnY2VHH4n2lG6X1GIkNAWCYtDUlwFl83lfDlj91F8TXP7AAfX0ltLrrSgvC0B75ljz9KvJyEboQkCyw+e/vDY/bIKXV6F8vpb47ACTC2vOTyRno/II/18Xq3/F7NIslxPaIho//ueLPxp9awon4VTULqEdO2HVgL3ccsofCqM0xmJQzJHolmPKhXH6ec2rUH+xaI78/DNaAXHsX+X7UdrIBG96qi/WbjPOSjYyLDM/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(54906003)(5660300002)(2616005)(26005)(508600001)(82960400001)(6486002)(6512007)(66476007)(66556008)(36756003)(8676002)(4326008)(38100700002)(316002)(66946007)(66574015)(31686004)(186003)(44832011)(53546011)(31696002)(6506007)(83380400001)(8936002)(36916002)(6666004)(86362001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVVhMVcvYjhMa0RlRjZxVmRoeUJ3NGZjMEVzamZ1RmJxMm9BUHBkOEJoS1Fn?=
 =?utf-8?B?MFVhMGNsa2ZoRTU5WUdJK3VEbjBRMlFTOXVGSXA5NTJRYUpPR0tCUkIyV0g3?=
 =?utf-8?B?ajdIcmZJME9DWVQ1SE9EYXU5VTE2cithTUJJN295YlFOVWRaUlVVQnZaNnQ0?=
 =?utf-8?B?ZkU1ZTVBOG5KMzJvNzQ3QnpCbTRiblo2SnhLVnJ3RDdyNTg4N2xRYXUrKy9l?=
 =?utf-8?B?aEV0cS8rNFdWYm9GcjhuaktVWlRrRHBvZ293cVVlZk5BRjUvVndaeFdwYjd0?=
 =?utf-8?B?dXU5enhRWmFPUHRlZVdhZ1dTSWdKZ0dzWUNjU1lOamM1QWJBUE1Xb2J0UUo5?=
 =?utf-8?B?dnl4T2RwZlhOYUlYR2JKOUNQaWp6empXT1QrZkhVTDY3QVJ6dVJFY0VMMW1H?=
 =?utf-8?B?Q1daWU5iV21CU0pEOGlwbHFHcU1yeUxuN1kyc3VyQXE4R0FJWnJYZ1NZWTNt?=
 =?utf-8?B?R1dQbTREdUsrV1ZJYnAvUEFRQkQ3OEluL0tyekF4UDRhTDhhTmx5Q3d6Zzl3?=
 =?utf-8?B?dExrTllVM1VRZWtIZWhZd0oyVEM1c1RMa0JlMS9sZVRCTjRtYkY0elFhdDRL?=
 =?utf-8?B?RXQ1bEppcVZhOHp1U3AzR21NandqbVVFcnljNldEQ2NSSW9jeXVsNnlCYjFz?=
 =?utf-8?B?ZjMrbytWQ1dmK1F3RHF3aFNxQ3VzYTZNY0IzaUxuQlRzemhOQ3pvcWVOSkYw?=
 =?utf-8?B?TGN4V3kwWmh4dXVXK1dscGpVRDNncTArWXM1THh4WS92SzJndXZPeHdNb2Qv?=
 =?utf-8?B?aWVEUUpGY3JWQnVmeFJOMzhreitvUUFTUVlYSkFXVnF1YjVXMU1WYzVRcW1r?=
 =?utf-8?B?YVdMT093MjYrOFVFT01zY3d1YWcvQUZYNlNzRGFBWkx1bjg5T2NhY093UWhG?=
 =?utf-8?B?RDNlcVVVWG9CUXlQYTZlcEJ3TVJ0Z2szV1JWQi9BL0lzd09MVEplc2pCc0Q3?=
 =?utf-8?B?V0hWRUROY1ltQ0NFbjQwdzdGMm1YRzV4QkN2akFLODFNMzZHM1FsWXFjNGJz?=
 =?utf-8?B?U3E5ajFmL1d2S1RhS2dqWUhYYmNsazduNVpXWmR3clY4OCtqcGxPNGVVVWF2?=
 =?utf-8?B?Rzl3bnphUnZpUUlRZkJ5V0h5QjhBTVVFamhWTzhjMGVwYTRYb1MxUzZacFJ2?=
 =?utf-8?B?ZDQ4amNnazlaeHdsYlNFNDF1QXQwR3BHRkl5TVc1TEZFK1hhQy8za05ncUtI?=
 =?utf-8?B?Q3V1aEVHVmxxbGI2T1MraDBQTi9uYi8wSFJsZXNBY1Q1S2pjbHZkSnVRTjNu?=
 =?utf-8?B?ekF4MVBOcThEZEFmcHZ0ZEo5SUk0MUhzeFVNRjF5S0lLQTMvcTZubllyUEdJ?=
 =?utf-8?B?TEZOVFlOMXFoMFpveHV3TXU4dzZlOTNlMVhkYVhMZkJtbkE3Wm1UdStyaFRP?=
 =?utf-8?B?WUM5Z013UnVyYzJ3NTVmNjFqell6ejZSR3doVUM4VFdyOVRvbUNONGhCSG9E?=
 =?utf-8?B?M1Z1TklUek93bEZLZmo4Rll4OVN0bU9GODg3dUpnSWJyZUJwL0pyaSsreGJC?=
 =?utf-8?B?YjNtanRkUGdLT25GaXVRdVpPZ2hEWGJyZWRNY2VOSndZLzVZL2JkYVRMNUxQ?=
 =?utf-8?B?ekNERVMyNzFvemJLZE5mcDNuZmx3Q2pGSVFwS2JQMGFKYjNWMlg1R1ZVS1Zn?=
 =?utf-8?B?aVZJeStwVEEwSW1LY01rRlFvL2Z4UElRazZwTkYyWmo4dFUrWHUwTytiYmJJ?=
 =?utf-8?B?ZDJ3TDVIbzAxNnRRZms2RnZKRXF0a3F1eXVvRWhUejVXZ2ZVdXpiRFczNitF?=
 =?utf-8?B?U1cxQzI2QWlsNXFScUJqMjRHQi91cVBEOGM4aUdWR1BPTTgyN2h5VW9xSy9R?=
 =?utf-8?B?Q1lTOFR5QW9kNFNwazdQb1hyQzNzR0prbnZ1Nm9CVWsyb3ZXUjY3Q3pEdXpW?=
 =?utf-8?B?VUJyS1VDcjhIWTh3UE4vdG1rUU9xUFRTZE9FVUt2V1k4ZmVSM2FzRG9RcnBS?=
 =?utf-8?B?OGU1KzZuUWcwK3NUeHdhTU8wRzlQWG8vZVEweW83MkVvblhIQ0c1Ylk1dkNh?=
 =?utf-8?B?aVhNRm1sMUtNcUR4b3VESHRvNUZRNis2dVlHTjVycEtQZEtUU3Q3MjFRcjZY?=
 =?utf-8?B?bE9XYTZBZDRQaitNNVZCR2VFMERtaXdWODZjc3VNVGM0VElJVi9NZ3hCQkhI?=
 =?utf-8?B?Vys5S1huaUk2NTU1RXV0ZkIzZExJdzFMTGVaamtFbXNHREVWUFhTc2U2Z0E4?=
 =?utf-8?B?VWlpOVVnWlAvQVpFVlErYXlBaDgvUVVaM0orOUcybk5hQnBNRDVuZEhlYUlQ?=
 =?utf-8?B?Ym9nUk9CZ3JLUjlPVVQ0UFhaMDNQbldWQWs4aFBnSjlBOTVRNkd5UGtqQ01x?=
 =?utf-8?B?S25BTHA2OVcyOHk3UWdnNHpJaFVYWHlRSC9Ba3V2ZmhFRjI1amNNS3NpRlQ2?=
 =?utf-8?Q?1JTXTY1iJTrp0vj4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c43c9d53-4e0a-4bef-d2cf-08da2f8082de
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 16:50:22.6494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PD29C9YmJxeUslKX/nx73FqluUj/cR5+mSYDv/womnRuccB2w4BTvSn2Qj3DROQiS9mcB8ymzzIkcnTPGQRtLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2165
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.05.2022 15:22, Javier Martinez Canillas wrote:
> Commit d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather
> than .remove") attempted to fix a use-after-free error due driver freeing
> the fb_info in the .remove handler instead of doing it in .fb_destroy.
>
> But ironically that change introduced yet another use-after-free since the
> fb_info was still used after the free.
>
> This should fix for good by freeing the fb_info at the end of the handler.
>
> Fixes: d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reported-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
>
>   drivers/video/fbdev/efifb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index cfa3dc0b4eee..b3d5f884c544 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -259,12 +259,12 @@ static void efifb_destroy(struct fb_info *info)
>   			memunmap(info->screen_base);
>   	}
>   
> -	framebuffer_release(info);
> -
>   	if (request_mem_succeeded)
>   		release_mem_region(info->apertures->ranges[0].base,
>   				   info->apertures->ranges[0].size);
>   	fb_dealloc_cmap(&info->cmap);
> +
> +	framebuffer_release(info);
>   }
>   
>   static const struct fb_ops efifb_ops = {

