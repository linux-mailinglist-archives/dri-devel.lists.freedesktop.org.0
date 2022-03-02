Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E694C9E52
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 08:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5103010EDFB;
	Wed,  2 Mar 2022 07:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8964910EDFB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646205889; x=1677741889;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RdJ04ptl0N8QgdjwwyFkh9+lbN9DUZmBJpxPJxmQjqk=;
 b=GmTQ05IL06Gr96udJl39XWFFOKIy4PKtVe8IfnN8oJCNuEu7SoTRfO5K
 5j/qwVNIZo3EFPdGd7E6rgs/IRToB3P5jPKJ31jU0P9HdLWa3usLZKBDO
 UhB8NfPedG+lecU3ya3hg31mRRmARnKON5EE1z/gjD7XLxquwzSFNHxmL
 aRbDDQu7RIRfBHjCdutug7gE11ZtZzIUs+4JJPGBLQc4LG/InVlS8XLdg
 vgXU0JS1EX1ghjdBcr7kYPQDHmtdZa76TszOX9APfytRcxFgWOx2W9wXs
 LsjjeSoNnKB1VJVnH6KeQRuAvbJ8GL2ZRPNcrMcorR2HUYXIol9wRtAxu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316544798"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="316544798"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 23:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="630318767"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Mar 2022 23:24:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 23:24:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 23:24:44 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 23:24:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmJYGtSb5NTSzkbBiS/fCQGM1gGd92zHy2Z7DcDM58OvmgkUejsRhAPRtcunGjEolQJfK3WZ3ftZjf2+hR3IpDA9uHUuHpmGl87rWx8toy1gaP9gLDm2E+SAuyXRS6fF5wDF/CcMB14Hp7q21OQEcwFqQuQfT784YHsg/Chh7tirASX/VqnT0QFe0G07ab5wI2U+1JLV86JxJkzO2AQSZs5jAVN9mVy2ZETIuWT8MPkvY65NEq+e3OCQbp/ShoWyt0Gs+hnBgtSwXEbzUBfxcEWClgF+NZAmd9waYO34GGDUc3K8/9Z3O628AgU6tLVI0z3CuOpLYhUNYDTxa0vzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SACXheq0vAchKySRstvafC9hCb8uWp6FtRNtxmnFOE=;
 b=Ntl3azkeylhTSjyucqOxuogY4Owrep4xzKeotM929+zUoatLM9SVu07JX/jA/9SllEJYQTPBh+OK3/c/59Rqw5lJm89W5ZN4+G7lAlcJU7ymkrE01/jJ3T7HyCHomdZoP5A7pfGLawdNj0wYNuZtz1qpB7+GechIE+Q3/ZIsdJmOWV3xa2P2yWuwlFUPv2Oe+V1BZjdeMQODiVbuDgbrIzJOK6IJCLdFG5vgojEymdj7tMp4R8rTsmwZVr03adCh/F8+5TRgKxrSo3T8G/g2RHNJLgn33Z3pQAwGQQ2R1qkRK3b7L8+wvtt3mus11x+VzDU9ibAhGkMJ/D9i90x0Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by BYAPR11MB2821.namprd11.prod.outlook.com (2603:10b6:a02:c9::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Wed, 2 Mar
 2022 07:24:36 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d%9]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 07:24:36 +0000
Message-ID: <a3c8f556-dc5c-7a16-27e0-d445d9c63486@intel.com>
Date: Wed, 2 Mar 2022 15:24:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
From: kernel test robot <yujie.liu@intel.com>
Subject: Re: [PATCH 9/9] drm: mxsfb: Add support for i.MX8MP LCDIF variant
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <202203010150.L57Eax3W-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202203010150.L57Eax3W-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0202.apcprd02.prod.outlook.com
 (2603:1096:201:20::14) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ad06eec-5bb9-4298-6902-08d9fc1db4ab
X-MS-TrafficTypeDiagnostic: BYAPR11MB2821:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB2821172D33E24B02FE961AE6FB039@BYAPR11MB2821.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QaIhOHHMmRRDNJ6yL72pxgwzVlvL1e9//VNYTTS7a0fYhMGLSZ8nnXWx7N45mRZv6MWSHKCmuk4nRYxCSv+8wE721sswOI183SZjz/BlwhoWShEkvAgUoP3YUaXdYWx99NgQ6cwLaIgj6PW+5nZQmUi8AHEVK4sbL7I/xKbelg6800lZJGTbCFCs3eLCrqLJuNiEYbQjbXFfjmtpb+V16t2c6p53ZfN7GCsRrbYMws6i0nvGGCQROdkaHM7KlKvL4+brHt8P+eBwuOwaquyePw96kVGGen1oJx/StrrvshVf9LAm67AUtcw9uExPXem7FfR6Y4cMtlVzkOCoDOEVcDRvB22xcmv1BraVJlzUpU71VaF/CeWMOOS6LDG8XWh/8EQmusX6R9bv7TdkEbQBvHq3AQ5PnQHNffspjkC7ktpWWdtXAfh++MS8lQ0W3dMRTXERVM/eBFstgULS2xqgdZDTl+6Qi/kwk3EyNifp/cOjtEv9uPi3nuwc3Zq8JY2VdWGrDSfWE/M9j3Pdni4+DEX+X3QAwfAlOOgnmduNiTy0sgHwEYXaGHirRaPQ77IZmpawvrtwi/GGKP8bWL4FqdeOtahsbhxD22uKQtZu3oFkKsd0g4YNChLCouNptpJmhLHr9Jxzmj7qzGYeobP1EOlPpjQv4DrpkDw2EAAAQ4B3svteLJUK3f6wBzlJdR/oM2j7/pkPcQKs1/k5Dv64BP7SEG2tLFHSgfEGativcLi8unz0gBUE9qRtQPEBsq1zZ/MdbGDMwPHF7xY4ZmKmNYBGq2z0PDAKK5dsKmZcpxqvncSf9W4MokKqCtDI8+1V/RPdhiQv4/9Gku/clifmtedCGokxPejdsAJAt9y9hHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5598.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(38100700002)(8936002)(66476007)(6506007)(6512007)(4326008)(31696002)(83380400001)(5660300002)(8676002)(36756003)(31686004)(508600001)(66556008)(26005)(86362001)(186003)(2616005)(6486002)(6666004)(966005)(54906003)(66946007)(82960400001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmxxRDAza2huWjh2SDlEZ2g5RkZnY2NDa1BQcU9wVDZzV0xOSUVVVEc5WDBP?=
 =?utf-8?B?ZVdxazU4dW5iK2hQSUdGdUc2RVJZZGpHN1Ywc1FzZDhpbGtPczlhU3BxbEVm?=
 =?utf-8?B?c2NNT2daRFZabXNXSWhxZzR3ODdGOFFNU24xakJBNHkvQU5tUmFhWjJVVU1U?=
 =?utf-8?B?UnIyMmRDWGhWcGRnUWRncUtRQzlZOVVqM2lNNmY2WDFPOXNpdnhJOUZwNTdy?=
 =?utf-8?B?eTIrTkJPRlB6Tld6cnJrM3VSVEx1OTlkbW5jdit4RjRtbDVkNU1VQ0ZzSkNS?=
 =?utf-8?B?WXpUeGNBMzM5QXdPS3YweWRKMHFTR2NFOURZZXkybzlXa3ViTlY4b0VtRDZ2?=
 =?utf-8?B?eE9qaGt3WlNmVFRJY3RYeG1VQWttaElZNFVPd2U1ZDZLRys2aTFaS3dTOEFV?=
 =?utf-8?B?NjZabm5mUzdGM2N2RGtYVHZpL1E5L1BTUVNDaUNHTGw0eHVwaHdHT3FNaWsw?=
 =?utf-8?B?OHE2b3dLTFM2M28yaHFnTnlDZmhRLzRwWGdPMHQyaEFsOGZkdGUveE55UlBC?=
 =?utf-8?B?YzZ6cytwbXhOdVBVMFRGdXNyVmhGZENacDlOTkpnZlpnNHVOYWZHS1pZcnVD?=
 =?utf-8?B?VjF3bGhZT1V6SnUwWS9XM1JHUllIdmlidkZTN1UwV29CMFNuZ3hhdndBa3Av?=
 =?utf-8?B?M29qN2lCU1QzRGp1VmNmRUlGbkhydWhHeWg0M2NwWlUyNzdBUE1EUFpmcjlh?=
 =?utf-8?B?YXpETVV5U1VRS09YMDdaMnJpQW9uR05vQmtxeWQ0Tkl5YVcrekYwMkFRVnJS?=
 =?utf-8?B?eTQ5c0hJTTFLTGZyd2JsQldXbjFEM1AwZ01DdVBJVVl3Y01Ga2RXRitJdDFz?=
 =?utf-8?B?N3B2VE5ROE1qRThyTlRocTRIRDhPck13L2p3MlBqcFNpdlA3M3I4blRrLyti?=
 =?utf-8?B?Vi9BcUJNT1U3TndxbmFJbjNYc2grS0dQRlBOMThqa09hckQvQW5rRHJxbUFy?=
 =?utf-8?B?bk1yV0orSXhMN1VnMFdOTUpUS3haZEpVSTJ4cW42Y21Ba3h2d3UyVVcxdnF2?=
 =?utf-8?B?aXQxaUpTRTA1Z1VIQlExMFVCUEZ5bDhSQVA4TGpNSUNhckdMSDJ2RmFtR2JQ?=
 =?utf-8?B?dWRienpsUUYycWRsWXU1VkJjM1ZXYWFzTzE1TXJDR1FTYTdRTmxDMlBVbDQ0?=
 =?utf-8?B?L05HbVpjemFCYUFlakpqQW5iUElxTVRPUWJ5YmlnKzFGQlBieXJQRWdiazZ3?=
 =?utf-8?B?L1c4RVFRR2ZBU0pmTmlLeHl5clliVHUzTUF5a3hyQ2FEMzNjMzdFS2JXQW1j?=
 =?utf-8?B?VzlJb3ZaeXc0WmlKZ1NFYTQ5ZWVVUGZXSzVNOElHN0lLcms2UDlwRVpoZEVO?=
 =?utf-8?B?RmkzSFNTbjFlRjJNYzQ2RVhWWVd1TVVqWGF0cTJ3djBUQjFBZGhwdVB6OEJO?=
 =?utf-8?B?YXNWRVVHZEpON3dScytXVzlkUkt3am9JTzhhN01ESGhydzVEbXM1TU40aEJC?=
 =?utf-8?B?WUR3MGpaWXYwSHJGRk55WDlKSm9OMmVBemlSMVl0TzE1dDhIdlU0NjlVcTFx?=
 =?utf-8?B?RHpoSk5wMFMyTk9uYmpkMGhNWDFYYk95QkdQeEcyS0N1Nk1hR25ZZTAwWERS?=
 =?utf-8?B?ZFJkYm4yZmVjM1JRenBGS2w2TVhBQUttaTdVcWdKU2Q1VDBBalJOZG0zUzlh?=
 =?utf-8?B?cml4eXBUMFZyMnZTWFF3UkhKT0hqY29tQXkzVlI0U0t2d3F6cVFJN2N6TGN3?=
 =?utf-8?B?dFBwZmhUR1BWQ0ZWU3c5TjdZamt4WEx1b0wwd0hMWnpEL3h4SVIvdHZjWFhO?=
 =?utf-8?B?OXRWQ3pOaHdLNVhUK3RMUDhqWFREVlJSZk5mYmNZRFZPVm5KUnVNcDhQeHZP?=
 =?utf-8?B?NXVycEJtKzBlVkY2NHZUcHpncnhhZG1hTVlRWDdFSE1zWnZpUm90L2NhekMy?=
 =?utf-8?B?ZHZnaEdKVTh5RWV1bFlUUEl3TFg0cm4wbzAySkRlRXQwalMvSFJRcmZaQ0oy?=
 =?utf-8?B?Vlg2Sm96bGpjczhWVXJsZXEvNWdDeHY3Smk5Wm8xR3ZhWm4vQkRQb0s4b3pX?=
 =?utf-8?B?T1RoV09kOHkvVkc5TUNRYk9mK3NYeGN5QVdHYTRESDQwK21DbFdyV0JsQkFT?=
 =?utf-8?B?NDIrMW1UeW9wWU9pS3RaSUFXVHZBS0NyZEo0WmQxR2NHeWFXM2pVczBSZXFL?=
 =?utf-8?B?MlpXbzFMTHBPb1ZHamt2UDFtWHMyZk0xdERheU1tZnVYdjluaDloTnlna3h2?=
 =?utf-8?Q?eiF3VFCt0qQtXKzUz0LjlZ0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad06eec-5bb9-4298-6902-08d9fc1db4ab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 07:24:36.8315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRTb6wkOX2CX3vGIX0MYNoZASve6j3ah1m7tS7fxUQrKE0UpNRgnsIVkZq7HOx9/ubCE5KeYwIvUhjd6MgeW/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2821
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 kbuild-all@lists.01.org, Alexander Stein <alexander.stein@ew.tq-group.com>,
 llvm@lists.linux.dev, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-exynos/exynos-drm-next next-20220225]
[cannot apply to drm/drm-next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/dt-bindings-mxsfb-Add-compatible-for-i-MX8MP/20220228-084809
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/archive/20220301/202203010150.L57Eax3W-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install mips cross compiling tool for clang build
         # apt-get install binutils-mips-linux-gnu
         # https://github.com/0day-ci/linux/commit/d6832d6fb879aabce18d9b451ed1ead1da38c333
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Marek-Vasut/dt-bindings-mxsfb-Add-compatible-for-i-MX8MP/20220228-084809
         git checkout d6832d6fb879aabce18d9b451ed1ead1da38c333
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/mxsfb/mxsfb_kms.c:258:8: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
                    ctrl |= CTRL_INV_HS;
                         ^

vim +258 drivers/gpu/drm/mxsfb/mxsfb_kms.c

56c727244a47cf Marek Vasut 2022-02-28  251
d6832d6fb879aa Marek Vasut 2022-02-28  252  static void mxsfb_v8_set_mode(struct mxsfb_drm_private *mxsfb, u32 bus_flags)
d6832d6fb879aa Marek Vasut 2022-02-28  253  {
d6832d6fb879aa Marek Vasut 2022-02-28  254  	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
d6832d6fb879aa Marek Vasut 2022-02-28 @255  	u32 ctrl;
d6832d6fb879aa Marek Vasut 2022-02-28  256
d6832d6fb879aa Marek Vasut 2022-02-28  257  	if (m->flags & DRM_MODE_FLAG_PHSYNC)
d6832d6fb879aa Marek Vasut 2022-02-28 @258  		ctrl |= CTRL_INV_HS;
d6832d6fb879aa Marek Vasut 2022-02-28  259  	if (m->flags & DRM_MODE_FLAG_PVSYNC)
d6832d6fb879aa Marek Vasut 2022-02-28  260  		ctrl |= CTRL_INV_VS;
d6832d6fb879aa Marek Vasut 2022-02-28  261  	/* Make sure Data Enable is high active by default */
d6832d6fb879aa Marek Vasut 2022-02-28  262  	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
d6832d6fb879aa Marek Vasut 2022-02-28  263  		ctrl |= CTRL_INV_DE;
d6832d6fb879aa Marek Vasut 2022-02-28  264  	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
d6832d6fb879aa Marek Vasut 2022-02-28  265  		ctrl |= CTRL_INV_PXCK;
d6832d6fb879aa Marek Vasut 2022-02-28  266
d6832d6fb879aa Marek Vasut 2022-02-28  267  	writel(ctrl, mxsfb->base + LCDC_CTRL);
d6832d6fb879aa Marek Vasut 2022-02-28  268
d6832d6fb879aa Marek Vasut 2022-02-28  269  	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
d6832d6fb879aa Marek Vasut 2022-02-28  270  	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  271  	       mxsfb->base + LCDC_V8_DISP_SIZE);
d6832d6fb879aa Marek Vasut 2022-02-28  272
d6832d6fb879aa Marek Vasut 2022-02-28  273  	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
d6832d6fb879aa Marek Vasut 2022-02-28  274  	       HSYN_PARA_FP_H(m->hsync_start - m->hdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  275  	       mxsfb->base + LCDC_V8_HSYN_PARA);
d6832d6fb879aa Marek Vasut 2022-02-28  276
d6832d6fb879aa Marek Vasut 2022-02-28  277  	writel(VSYN_PARA_BP_V(m->vtotal - m->vsync_end) |
d6832d6fb879aa Marek Vasut 2022-02-28  278  	       VSYN_PARA_FP_V(m->vsync_start - m->vdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  279  	       mxsfb->base + LCDC_V8_VSYN_PARA);
d6832d6fb879aa Marek Vasut 2022-02-28  280
d6832d6fb879aa Marek Vasut 2022-02-28  281  	writel(VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
d6832d6fb879aa Marek Vasut 2022-02-28  282  	       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
d6832d6fb879aa Marek Vasut 2022-02-28  283  	       mxsfb->base + LCDC_V8_VSYN_HSYN_WIDTH);
d6832d6fb879aa Marek Vasut 2022-02-28  284
d6832d6fb879aa Marek Vasut 2022-02-28  285  	writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
d6832d6fb879aa Marek Vasut 2022-02-28  286  	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  287  	       mxsfb->base + LCDC_V8_CTRLDESCL0_1);
d6832d6fb879aa Marek Vasut 2022-02-28  288
d6832d6fb879aa Marek Vasut 2022-02-28  289  	writel(CTRLDESCL0_3_PITCH(mxsfb->crtc.primary->state->fb->pitches[0]),
d6832d6fb879aa Marek Vasut 2022-02-28  290  	       mxsfb->base + LCDC_V8_CTRLDESCL0_3);
d6832d6fb879aa Marek Vasut 2022-02-28  291  }
d6832d6fb879aa Marek Vasut 2022-02-28  292

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
