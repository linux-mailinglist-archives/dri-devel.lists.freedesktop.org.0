Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B2631A08
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668D010E131;
	Mon, 21 Nov 2022 07:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C154410E131
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669014661; x=1700550661;
 h=message-id:date:subject:to:cc:from:
 content-transfer-encoding:mime-version;
 bh=8aolYYXmbx+DBjPbg8iFFZJoVC9kO7Z1juAJu0QWnf0=;
 b=XnozICClYW+aKbIN6YxMsf92ldE2xmIA27Kw5SdKa5XzB0LVA5umIk2a
 +1zLeMarVlBo8zkmbh7Pd7zSiKg9Pku/RhgQAhw9soAqrL1/NH4aMQytJ
 CFuAWazDv7lu+Ci44Y5O9a9rh/fbso42ZwuVJYGfU1pnFngRblJ0f4dd7
 dwo446EYVg/o/i4Qi6cVCTQ253cA2p4Dm7T6YEQfepwqVgh92xDjtafDh
 pPJKxUP7luqJDF0vAEfpEaGCWju2yDnKM8fgriT3VDR8IRe41PlJwbDCw
 5aiejXsuDKAbnu6H+Pzi4HPYZb1a5bKw7bXa6DQvstHXCrK6GRa2nBLup w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="315308853"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="315308853"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2022 23:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="640916476"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; d="scan'208";a="640916476"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 20 Nov 2022 23:10:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 20 Nov 2022 23:10:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 20 Nov 2022 23:10:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 20 Nov 2022 23:10:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAAGCwEe6bgx/KQfw1IY/Q19wP5P5BDKGfMlY8zYL8Jns1zndky1a9d2RwKrEwH9I8dtNx9+NRxB+O2MQV+kJr4ABusYbHab0Kg1hHN6xwJgiwIH4SkXFNznyAUnQpNl9niDPNh8FCzco8zD+7txpAiEGM/VytKCTX7AGFE7iLZMuF4VlJqoWaNBvf5ITlBlIKfgQ4GRu4HeTYc0T1q03Lt7A5KWH7Q68f4uobWEnaYg1Pil/hrWhnH0Vgnzvu5Rzawj1Rw4/xJL0S6dJkT9d/VtYHbSGhNHlroSjN8QwSbB8mg/Fcro+/elOek5yMGPvoAxrPMXeSVc5Quixtsd4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9f/JMEczjkT/ZLjYi7565z/R8Jmvt0LM13du6z7eS7o=;
 b=T3YQ+iS8yhJhqTtx95ayPahVAiA27tiDL0Un0R6sJtdy+PHHSkqvs9y6Lpda/7oSad5mJAiFf0SVF1UL+Vretmklmq9LEaHRsN67jOiBWm0ILF4P5nrXspSno84elkVNrEh4tmU57IG17O47QShYX0AAW02IGY3SjlGqTBFguJzxPzMi4q4QRiJm9vcik+hoUio9cwZMk6qRCAaG8Moam+C3My6UIlxu7qB6lJea0CsE2fOhk88rTWh10moF25VHtaiPyeDremaYeMZ4SgGOyhM0vAvnN+kCE/PDcCffTjc3JYeyHKJzAp5/70tyF2L2G8b9QJrOpLyhSAMVcI4tAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB6876.namprd11.prod.outlook.com (2603:10b6:806:2a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 07:10:56 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::513a:f91a:b65c:be1d%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:10:56 +0000
Message-ID: <5db7b850-18eb-50a7-6a4c-2ee0acd07632@intel.com>
Date: Mon, 21 Nov 2022 15:10:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: [drm:drm-next 741/803]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more than
 once.
Content-Language: en-US
To: Ben Skeggs <bskeggs@redhat.com>
From: kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa23bfa-542c-443a-c91e-08dacb8f8871
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mG4Jj45jOZXDU3wH7VAn6i/yyfiKIaWuRPUm2Kbs60mkZtl79gBKbImM8OVdN8nxU4rBqlU3oYFdCDsfrEzEXXmVByDe16myOZHmYUzBozfPU7qoNfv4S2hrrQJbrX9H6Z+v7/Cl+qVv3HkixMxfMlK9DO/UeIsFiIlf+7MPSyKKW5FItTw4/VeiiYY2qvT7xWACgCC/2jW6hdTnxMHitXh3vkPeTg0NiV8fkqX9IR0rWqrgYtbVIOXdhdWeLlQNjxIcUrgVDQTJck5oi4WoOqs4LVO4mC2eNngzwKfQT31OrV9lUlMktgv/Tes2x21TuxEzpAOs9wkvjuRVsti59wj0xRQauWgc2wJusY3hP7a55iwrmvt/itt9vc8LVzs7yNJcJ8KxjOcai+r0gWuLjXpqVdb1ZIradLtL9Ztbha3Vf0HCjp2PE7+OgB1rhRJjN4Bp1KE3rtgFvbGEExLJ0neyjx9XaH/nbqueWza26LBXSCMkbf7UMkBlVp66MhwrT4RPMN0ifV8hK/WQLL+axTgRcB2QDoZ4e5Zbbbi5PfTyjSH7lwlHszqL9oKFYt/E3VRGAgT+8Q0hsu4ZuOJh7znldr1eJa5InNyKGznyIu1GVmpd9SxspAHF86fBql9djCaHdDxUU1+c/Y6XtOaDDCBRS+LP5XqBzM3zHVt6ajmwc/EbYxdHKgQi52bKyHvCXkEm9yxB24t9+MMVd3ppbw7u46S89Z/Sah3l00J9syW6dosBEirmf9vUOFUj/VQMEqgVZ6ZI/EgwF1CAZ5jJdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6392.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(36756003)(31686004)(31696002)(86362001)(8676002)(5660300002)(2906002)(2616005)(6512007)(83380400001)(82960400001)(26005)(186003)(38100700002)(6506007)(966005)(6486002)(66946007)(66556008)(8936002)(66476007)(41300700001)(478600001)(316002)(6916009)(4326008)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUU1cjY0TTM4a0F3NVJKUWZBQmplWmpaOUExWTZKY1l6L21VUVZJUnZnTW5v?=
 =?utf-8?B?Mzh2S2ZPR0ZsTXRpUHROOEJ2dFEvNmowV1VaRk51djZBWFo2T1VNV3J4OVli?=
 =?utf-8?B?VE1ZU0pmWkpzalovaTZDbmM2S1V6SnBBT0VpdU5HMHdONzRiRWVTLy9Yd3JL?=
 =?utf-8?B?SzVzZnM1d0F5ZndGQnJid3FwVTBnTjduaHhQbGF3b2pQUkRMTkNrY2FqSHdL?=
 =?utf-8?B?N3V2cE5QcmY2TEprUlZmaFVWMFFQVlE0d2g4SHpFbE9CWWQzSDRZakJOVEVJ?=
 =?utf-8?B?YklVNXA5VFJZdkhsc1FvSndVM2kvUkdQcnFNS2dUZGQwVHNoc2NVbnNDU1JX?=
 =?utf-8?B?dlZIemNMZkppSW43OXE0ejl0WFg2NGI2T295ZVFsZjVuT1lhM1V2UVJSck9E?=
 =?utf-8?B?OXB4dUZtVVRqeXZJdG05VHh1cDBxSytHanNTbmg1WDRuS0g3Mys1SGdHQVdq?=
 =?utf-8?B?ME50RUxvbWR2eVN6eS83MzhwSkNDNE9yeGh4UjJNQkNQcGYvQlIyRDVkWUls?=
 =?utf-8?B?eFJpV2lSTC9xNG9oOEU1OGYrVmdsRVFGWTZGRDFVNEl1UEdadVBFb0hwSzdJ?=
 =?utf-8?B?M2loc2NDVUJaSGFzR0hTWjBwWi9jb2dyNnJBKzg5OGZENy9rT0lWSDhKVXJT?=
 =?utf-8?B?U1NCQTZtMUk0ZHBIOElONmNwUzM4U2Znc0lCZkRRS2l6ZU96d2Q4dlREREsv?=
 =?utf-8?B?U0VJUmZla2RoclNWUE5LMUtHb01POTYwbEZVWU12TnJBNDhRMzMwKy9hSTNm?=
 =?utf-8?B?cDI4amRXaWxTVStRVUxlOURUK2JlZ3lPS29HS1VpbjZNS3BwcFJHK2NVOFRE?=
 =?utf-8?B?UCtEREpkS1BCUHNtT3NnRXRGM0JlUkxTY3JsMmcyTmtKclBEcGRqUzFCSi9m?=
 =?utf-8?B?RnYyZlRrdmRSWmNjd2JCY3FVa3BianRUVHk3OGZKNmNtSFF6LzRvVFB0WCsw?=
 =?utf-8?B?S2xZWkFSTHBLOUVUUXpJaTJnemp1aE8wR2c2aU1FS1ZDeWM3NlowSUFhc1dw?=
 =?utf-8?B?cldqZ2tUTFByeFVNeFQwVmtCSFY2YW9KUGdGbElsNjFzL0hzQ2dROWFhaFgx?=
 =?utf-8?B?UjlyVmJaNHI5a3ZMSkJWWWxnUHFhamUxam9IcmZlcngvWDdDZ0NYNUxsSlQ0?=
 =?utf-8?B?WVFPdzJrWWhtZW5Kb1ZCNWczdUVaWXVkb0UwU1AxSmo4ckVJSCtSdFJ0NFpk?=
 =?utf-8?B?blVGZHBSem1ZUHQwckhwQXQvenhVUVBQU0dLQzJyVFlsUSs0N3BsQ1lhRlBQ?=
 =?utf-8?B?TjhPR2RQdCtudUpuRHhwS0VyVzVqMDlxbXZWTmFHSSs0QmRwZnBBTHZWcHU2?=
 =?utf-8?B?bFdGRDU0MkNUYXNJK1V6RGh6SVFqUU1kdElwcGdzZTRVaTdadERNMGREOGFW?=
 =?utf-8?B?ZlNTNUk3blEzQ2hydlFrSmt3T3A1N3RVWW8xWWVZSWxWc2tac0ZuWEhMbHpS?=
 =?utf-8?B?Z3RSem10ZWxSQk1FVFNuL0dYVDVmcEhWSE9PSlVvZzJxTGdneHZYNXV3K1Rq?=
 =?utf-8?B?OVM3MGdKbHVwUTVKYk5JWm0wMXdLU3RYR3NVVFZ4d2IwZzM0OVhjTnlRZ2hl?=
 =?utf-8?B?Y0ZQOHprdFZxUzZ4Z3lRS1c2c0RFc1U1MWZhelJkdk1GT0VjWCtOakQwcTJi?=
 =?utf-8?B?QTJ0V3BtQ1ZjSXRibUF2VWhiUG5zaGo2K2VueXI0VC9TK3F1ZTNtRVJYNGdM?=
 =?utf-8?B?Y3BtT1d6bEorakNsR0JWRlFicDlzYVd5ZmZRZDdQNVFGWTNCQ1FyNUk4WXAy?=
 =?utf-8?B?VDZsajNNSFlpa3ZhMEJlZHpVQ1JnMFZGM0ZhbHFaUFpvUUd2UHpYWm1lRHZx?=
 =?utf-8?B?SVlxdFdtdVVNblZRVnBjUTV1SlZHTWlmOWFhZjdBUU1SenAzWnVlRllOQndt?=
 =?utf-8?B?R2VZZW5NZDdNVmlkQ2hRYzFUQy9UY0JsTDRzdjBTRTlnTkVLTnVvb3FyMmRN?=
 =?utf-8?B?eVYyZDNab2JQT0owZmRqYUt1ZUhaSUxVeW8xbjB4VUFJaW4xTExnM0FvZks0?=
 =?utf-8?B?bHVwRElDUyswaUhmUVNkRVAwalBKZ1dMSStsR3ZDOC9SU0xBMzMrZ05YK3FO?=
 =?utf-8?B?L21rQ2tCc3dnN0d4eDJ1b0liM01wdTJ4WVNpYW9TVEtOVktEd1BoMnVKZjV3?=
 =?utf-8?B?Mk5kWnJlVmhmQzQ5TTZKWnlkU2FGdmRJaGhZeFV4M3pCSWI0djhCVHgvelNh?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa23bfa-542c-443a-c91e-08dacb8f8871
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:10:55.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIUeq+87WFTgZ6E3qV5sAinwTaamErgj/4CVoHALDYsm7lUltB7Clcr1Auyvczx8vNOCC46S27AmRBIOc81dHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876
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
Cc: dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm drm-next
head:   a143bc517bf31c4575191efbaac216a11ec016e0
commit: 67059b9fb8997f3d4515d72052c331503b00274b [741/803] drm/nouveau/fifo: add chan start()/stop()
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

includecheck warnings: (new ones prefixed by >>)
 >> drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more than once.

$ git blame drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c

9a65a38c456eb (Ben Skeggs 2015-08-20 14:54:19 +1000  24) #include "chan.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000 @25) #include "chid.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000  26) #include "cgrp.h"
67059b9fb8997 (Ben Skeggs 2022-06-01 20:47:32 +1000 @27) #include "chid.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000  28) #include "runl.h"
f5e4568991f60 (Ben Skeggs 2022-06-01 20:47:21 +1000  29) #include "priv.h"


If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>


-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
