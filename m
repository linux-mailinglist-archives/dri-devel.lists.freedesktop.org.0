Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4089BD4AC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B68A10E602;
	Tue,  5 Nov 2024 18:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPsMIsCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECBE10E5FA;
 Tue,  5 Nov 2024 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730831718; x=1762367718;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V6kANBaUIYZf91LM6Avjo/jCCVPAnTycgfNANBcz5Ho=;
 b=PPsMIsCR+Kk5yPI7w7Hj5AyFZ3Yc0bmH5Q2ccReOqWC6JrhAzPOvmBCT
 7JiOUv1oUF1gPUXYvrav3bCg1HbSx/ahYnvg9GUn90z0DEwR7rg3Fdx62
 7bju3/uoi5WQQu+V9HiQnV5rYd2MhQtzVlP0TBggoTm3/pCTLK21Ccrb1
 D3I1nOwPIE1iBWjD+FT1IUczA+zan77CyIUSLKeucXKlupGjHysjfs6Eb
 Fw+69Bv1oq6xLS/7Rib5Ug5ZrQYaiH8LemE2eFKE3g1zBZhvnPNMldOzO
 BmWHI8RWd3tjarrhtucqcvCI13KLh+14bbTOCcE17s8T3KNRs9H7q8xFJ g==;
X-CSE-ConnectionGUID: qTrQyMFASzi6bu5peTltbw==
X-CSE-MsgGUID: 5kHf+EDcSf65PzOngXX01w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30707974"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30707974"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 10:35:17 -0800
X-CSE-ConnectionGUID: rfvhqWh/RVWX1CRw4TIrYQ==
X-CSE-MsgGUID: 0Ih7fVLARNqFezjNbnIAYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84947028"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 10:35:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 10:35:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 10:35:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 10:35:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wysayiuGy6A55l4tRiuoOKXWKeHs87TS2u3TYmp6ZRXqA4noZon3CGrCKGAbAdUx8om0t6TjNOrZsHEj8US5naPS+1QQRI2WX6R5QC9gzcydlvDmGR3IRnmchqUvCAM2DHgWrwWU661/B2Z7SqVouAH0llO3CB1WBb8xXoxdtDOM9YNrQCRu2Lmmh/NPoTxmQWcc4mM9lQCsaf87MVyT3MO1PNVauxGE0fOlxRJZ+iqMZ2CKgg2l/f32vrJt7a8mMjazFOddO+6JvWdhFdvvlyRTZIz8ZTt4fsfGtUbuMluwHcPZRGrvLxBhKAFcQLfsOdBrRuSeLEHR/sbwumRomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy8fgxrTut4HUNxzm/Q1vJtVcr/zdo7CVfdFjgaiU6U=;
 b=Wk83W2Hlw+gLs9LT/6E42id3JOwzxlQhGpJP/4N0ZqZrV0o3UlC+z0s714VK4p5bhzM8YfoR8pm0c0TU/8O5AUiUlYleccb7js7wXZyJAOlodUZ8nQ2rkKFrzngqzfZ6oS7O/pX8fDSiagncZiJhOn6a8nmidqr7KxTDE7kUHN+HtAkYDcE8ZEv/qYDHLvDzZ+cZ5a8stzPYWerZU9dOUguAJVrC1EQGK4XEB7M+kEVZenaSpyKHqN140cX8NjajGau+f8iIfKxYoJBEyXIXcA9q+QgoLAK94122ZIH2cHtYOUH80bKwFmZ3QFKgebTAcidpS9J2FUVUsa9f7nmTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6687.namprd11.prod.outlook.com (2603:10b6:806:25a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 18:35:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 18:35:13 +0000
Date: Tue, 5 Nov 2024 10:35:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
 <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: b411d71e-45c7-40eb-30de-08dcfdc8963f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?REPBS0cq0s1utV+uq9DdzVQrZQM2UJedhq/SXxH88fn5Qh4Kdb64bWTV9o?=
 =?iso-8859-1?Q?35oR4he/SLETADGVrHsp53cYSnL8CRJWFRQRaoB0AnKLTaRQKs5NYi+wXV?=
 =?iso-8859-1?Q?KM2oEXet2MQ+G6y4feD9D+cNQfQUzjpTK4UfTt/rxMvh75J38WBCP6ocbV?=
 =?iso-8859-1?Q?h0eI5X1r42+qWQKHf0DWUYxC4AtVHhRkusmQ/LGhPzOzAHw/s8N/bkinRs?=
 =?iso-8859-1?Q?+/EYJR7qtzyIM0QoLq+ySYEnlmr1aeNRZ7eEGXHdmlI/BtLekFZCsr9tCu?=
 =?iso-8859-1?Q?ttufNlOq9XHjZvjDSNGlqxRJ4//5ku6V9N+11UFZjrrUZjXDbrg/l60crS?=
 =?iso-8859-1?Q?yahk02YJ/DsV0lA2XfrvXJUHp6XDqqUhIwbyTJTU4yflk7TadoKnkBNdIy?=
 =?iso-8859-1?Q?IrmKJ/G6dk/9SOAWtpoGAZJkECfACJOOee987N5jUvHa5Pvb0C9uHF2AAJ?=
 =?iso-8859-1?Q?iSHL6qUjbsAPiNlTo747/kLrFwBKbokP3ler/8h5ICpiCBtXC+wM+BPAA6?=
 =?iso-8859-1?Q?1GzwAyOsngZqgu+pp87FxHnnnG4vU4y/xS3XTswSjAdUeY/54cRIhFPlFg?=
 =?iso-8859-1?Q?w1sevRqtX/Au+iqCK2v26P8He/ZK6XAsp52Ex8Diu+SLhNQfpi1N6PH0fC?=
 =?iso-8859-1?Q?o/uhYfVrRUpVSOGW6sNzHm62hp/w9gviOZeYNOZ72ef++AFGa2HYnnV+nf?=
 =?iso-8859-1?Q?RMaP9ePsFzJ0FljL/RABxWqUDSJmnmzhkYuSIbwhjHiFqXbXHuwYiyLVry?=
 =?iso-8859-1?Q?uiNfANtED3vy856IZZk00GiwV4Uk7VWASmIfAOVwaJczTeuIxVuXvsG6Lj?=
 =?iso-8859-1?Q?h+aR/OXSn8duJzGdp4rIRBPi6BxpKOZpSg542LY1SEU0l8GNz1wxc336BR?=
 =?iso-8859-1?Q?pRCqMVMgbrGxxs0sj08jOBeFLxjW1qe5aapkOkazHOMbK0DUcMjZORdwzj?=
 =?iso-8859-1?Q?zc76RAEQAf7pF9CrgniJ8Hy+TG+pWVyOC/fXU1DhCDOpla8UbwW0GJTiZZ?=
 =?iso-8859-1?Q?dT+1QqWiW3XClHK+v0eCKLoFhQU+aw450cEu33Js5FwqE+dBGgYtz0Iw/o?=
 =?iso-8859-1?Q?40vqbXfyw6IZTLiGMoYW/MMVhTCnclzF4nBYS8j4UDOkgp33MgdAHU0Me3?=
 =?iso-8859-1?Q?54YYYpW7cT9s4TrfLqrh6w3iKsoJLOvFWadYRN9aFyP9lF41kNE/XnQ9pb?=
 =?iso-8859-1?Q?1dCZP2LBDP5s+kVQaQa7cdVUmFFjmfAL8IUvMjB2W/UA7gwlpVicJq8VU6?=
 =?iso-8859-1?Q?ZCkLt0yVt/ZFJX8sIPTwiFx6rqRXhAGWQiQAwygqNsj/EhKUVoOZK31+GV?=
 =?iso-8859-1?Q?/xGivRH7ThMIHv/i0ulaHEj4bGL1McAHABhfIqrmCFExb8g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?22HONg/jaS1IKubASgNreNTl3DkDfx0TEW3aT8GziQvC7fPfBdv+fLEGrw?=
 =?iso-8859-1?Q?djXXLosdP560oWUTGHS4sP/C/XAmWEQW70A7CqdvpNAXIi/GXxa28LHeoC?=
 =?iso-8859-1?Q?rdrT4Et2lEVjXBBomRIxkkfWI9tlpkOBYRIWA94TfrG5097XCtvWoQyIfA?=
 =?iso-8859-1?Q?+VxLcmzCFbtEIQJOvGR8kTGHXRMPJJyioUGPtx6Nce5j1SAbozDnwhswMc?=
 =?iso-8859-1?Q?h7ElLeEAHunlJjUooMIwAH3/KB5uPhwplpDuV25LU4v2n4ck32DCJkajaT?=
 =?iso-8859-1?Q?pxVkpt82pX4fnaPheCS7SI9aWq9w1qIWhktxg6SQfxvYE9rzKUtyOl+sn+?=
 =?iso-8859-1?Q?NlPQ/lNlFa/0jKNVUu8XcNGebWpwjuVRntL/I3fDKHcOFkCOCnuFuzev+k?=
 =?iso-8859-1?Q?rO62TliIfjPU81EIKUXVflcHqQ+7wcIi+6WPi1RMQZ/D9fLawEqvGD+Iai?=
 =?iso-8859-1?Q?8QEzkms8f6bJELBXFKZlT9lOkotKNocrKaXC7UUpGMmX8a7Ck209fsUJTF?=
 =?iso-8859-1?Q?TB6fo9zFWjqEdTguZ2rNmpz/pRHIAPxtL7ZaW+5I20giMvm2vjm0pWxuYv?=
 =?iso-8859-1?Q?I0DMMtb6CQCGkLcy9ChGrQjZGaswo6sV8q/S3PfH5QLH0HT0zoAtgXDyD5?=
 =?iso-8859-1?Q?vVDQbEMP5L3rj9lSoXQOqbWH4LH+HDlqgFLUNuZPQG32g3rT2LXnuaLdq/?=
 =?iso-8859-1?Q?QjuuRFIG2rWiakBF5ZNiH3cn/uUtH/DQzhVZCdT95diupWV1uUHOXRMM5K?=
 =?iso-8859-1?Q?fOrEwc+bCWo50+fbTVy6Sgo0zsKSYIe6a8ICnjigsBtYa/+vfyqTZ2ZXyp?=
 =?iso-8859-1?Q?lPRpCKraKH3MO5Y7lPC3VddNkHgWPXpEXZ68J7bIycNI/6xl5pmeTXOx6l?=
 =?iso-8859-1?Q?CYKp5Al40+TbJwc/xL80BfNNSmgo0Nh1lji/Lb/g0PsuuSEizUV5ATggL/?=
 =?iso-8859-1?Q?lSqaGGiCjVG0jZm28b35Zacehsg70qpAIDLZzIxNvaJ73tznk5DnAhBOUN?=
 =?iso-8859-1?Q?7qv4knrFHkwKfcEdxk0oGR8nXLTlAKRLFNM0d8pHLKP6cWT5+a2vVRt1GX?=
 =?iso-8859-1?Q?tcfSmnAJ5XTONA7Sp6H3YaUFmJxrpTnHLi2vAP3FYV32BbjPEAGsqhNvMd?=
 =?iso-8859-1?Q?VT+ETF1vnwm8NgJGTY4qOhr2IqXcJVxh4bubH14Qp0JFcbwXGX7ZKE9mEo?=
 =?iso-8859-1?Q?c1lm/wn68GBb1jurDOK+sW7vo2R0GFqb/luEIPFh5xEsG+ff7xTFdiYQ44?=
 =?iso-8859-1?Q?9LweoQnJiIK2CDgWNvqWnRTj56OfkTV4JcGCBJYELTZZYVpYMNNMvqr1Da?=
 =?iso-8859-1?Q?GCSR7gXnI16OfudXfbZds8MWeoXrx5kzBabZ+DCFEqqrk1RCAUVZvKV818?=
 =?iso-8859-1?Q?HBUlJ67nbMipf293qJX/bYIkhoYOE5gXtfUs+Pnv5vlJCg9PVC8Ub5mIce?=
 =?iso-8859-1?Q?RmHSQYu9wS/AFbtBPLvqBt7j9IJCTutSi7uK535VWM0qPVDfKKMonQ+/ZP?=
 =?iso-8859-1?Q?z+RATiqzxv7dZfRX0O80wn+v5bGLO9r+JAEWWqIXg/1w9JwYdSBkZOMOBK?=
 =?iso-8859-1?Q?eGwpwS7El8Cd/6Fxzfj6z3xU+GLXy7caM2EEfDNYoFjrCVjfW1Hh+KQZUG?=
 =?iso-8859-1?Q?jSl9f0p8hALybkG4s3vg/ukvLTGhJiaLYapGbXGM278lyGXXW+tf1jwQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b411d71e-45c7-40eb-30de-08dcfdc8963f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:35:13.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO2cf9ff5bz2oxVsYvcLGhf68pVFrH8remGWy0Cfwj+8lKMz94s6yzEItFvtCIUT/qxh9MQ8xt8tkaQKU70CfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6687
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 05, 2024 at 08:41:07AM +0100, Christian König wrote:
> Am 04.11.24 um 22:49 schrieb Matthew Brost:
> > On Mon, Nov 04, 2024 at 08:28:34PM +0100, Christian König wrote:
> > > Am 04.11.24 um 18:34 schrieb Rodrigo Vivi:
> > > > On Thu, Oct 31, 2024 at 04:43:19PM -0700, Matthew Brost wrote:
> > > > > On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
> > > > > > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > > > > > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > > > > > ttm_bo_vm_access, to access such memory.
> > > > > > 
> > > > > > v4:
> > > > > >    - Fix checkpatch warnings (CI)
> > > > > > v5:
> > > > > >    - Fix checkpatch warnings (CI)
> > > > > > v6:
> > > > > >    - Fix kernel doc (Auld)
> > > > > > 
> > > > > Christian - Do you mind if I merge patch along with the rest of the
> > > > > series to drm-xe-next?
> > > > Ray, Christian,
> > > > 
> > > > ack on getting this patch to drm-xe-next?
> > > No, we actually spend quite some time removing the single page mapping
> > > functionality for BOs.
> > > 
> > I don't understand this statement. This patch just adds a TTM BO helper
> > for access - it doesn't change anything wrt to single page mapping.
> 
> Well we spend quite some time removing single page mappings from device
> drivers.
> 
> The only remaining use case of ttm_bo_kmap() with just one page is the
> ttm_bo_vm_access_kmap() function and I was really hoping to make that one
> TTM internal at some point.
> 

This is still static, right? I suppose this exposes this to the outside
world though in another place. I asume there is a reason we can't use
vmap in ttm_bo_vm_access?

> > > You need a really good justification to bring that back.
> > > 
> > The use case is EuDebugger requires essentially the same functionality
> > as ptrace -> vm_access.
> 
> Then why don't you use ptrace in the first place?
> 

I think the debugger speaks in GPU address space thus needs to access
via the GPU VM -> BO, userptrs.

> > TTM mapping non-contiguous VRAM doesn't work unless I'm blind. User BOs
> > which the EuDebugger accesses can be non-contiguous, hence the new
> > helper.
> 
> Then why don't you handle that inside the driver in the first place instead
> of going through a TTM midlayer?
> 

Well common code always seems like a good idea to me. Can do this if you
insist though.

What if I change my new helper ttm_bo_access to be based on vmap for
SYSTEM / TT but honestly that seems wasteful too for a temporary
access mapping.

With this, I strongly prefer the code as is.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > > Matt
> > > > > 
> > > > > > Reported-by: Christoph Manszewski<christoph.manszewski@intel.com>
> > > > > > Suggested-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
> > > > > > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > > > > > Tested-by: Mika Kuoppala<mika.kuoppala@linux.intel.com>
> > > > > > Reviewed-by: Matthew Auld<matthew.auld@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> > > > > >    drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> > > > > >    include/drm/ttm/ttm_bo.h          |  2 +
> > > > > >    3 files changed, 89 insertions(+), 64 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > index d939925efa81..77e760ea7193 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > > > > >    	return progress;
> > > > > >    }
> > > > > > +
> > > > > > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > > > > > +			      unsigned long offset,
> > > > > > +			      void *buf, int len, int write)
> > > > > > +{
> > > > > > +	unsigned long page = offset >> PAGE_SHIFT;
> > > > > > +	unsigned long bytes_left = len;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	/* Copy a page at a time, that way no extra virtual address
> > > > > > +	 * mapping is needed
> > > > > > +	 */
> > > > > > +	offset -= page << PAGE_SHIFT;
> > > > > > +	do {
> > > > > > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > > > +		struct ttm_bo_kmap_obj map;
> > > > > > +		void *ptr;
> > > > > > +		bool is_iomem;
> > > > > > +
> > > > > > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > > > +		if (ret)
> > > > > > +			return ret;
> > > > > > +
> > > > > > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > > > +		WARN_ON_ONCE(is_iomem);
> > > > > > +		if (write)
> > > > > > +			memcpy(ptr, buf, bytes);
> > > > > > +		else
> > > > > > +			memcpy(buf, ptr, bytes);
> > > > > > +		ttm_bo_kunmap(&map);
> > > > > > +
> > > > > > +		page++;
> > > > > > +		buf += bytes;
> > > > > > +		bytes_left -= bytes;
> > > > > > +		offset = 0;
> > > > > > +	} while (bytes_left);
> > > > > > +
> > > > > > +	return len;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_bo_access - Helper to access a buffer object
> > > > > > + *
> > > > > > + * @bo: ttm buffer object
> > > > > > + * @offset: access offset into buffer object
> > > > > > + * @buf: pointer to caller memory to read into or write from
> > > > > > + * @len: length of access
> > > > > > + * @write: write access
> > > > > > + *
> > > > > > + * Utility function to access a buffer object. Useful when buffer object cannot
> > > > > > + * be easily mapped (non-contiguous, non-visible, etc...).
> > > > > > + *
> > > > > > + * Returns:
> > > > > > + * @len if successful, negative error code on failure.
> > > > > > + */
> > > > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > > > +		  void *buf, int len, int write)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	if (len < 1 || (offset + len) > bo->base.size)
> > > > > > +		return -EIO;
> > > > > > +
> > > > > > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	switch (bo->resource->mem_type) {
> > > > > > +	case TTM_PL_SYSTEM:
> > > > > > +		fallthrough;
> > > > > > +	case TTM_PL_TT:
> > > > > > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > > > > > +		break;
> > > > > > +	default:
> > > > > > +		if (bo->bdev->funcs->access_memory)
> > > > > > +			ret = bo->bdev->funcs->access_memory
> > > > > > +				(bo, offset, buf, len, write);
> > > > > > +		else
> > > > > > +			ret = -EIO;
> > > > > > +	}
> > > > > > +
> > > > > > +	ttm_bo_unreserve(bo);
> > > > > > +
> > > > > > +	return ret;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL(ttm_bo_access);
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > index 2c699ed1963a..20b1e5f78684 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> > > > > >    }
> > > > > >    EXPORT_SYMBOL(ttm_bo_vm_close);
> > > > > > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > > > > > -				 unsigned long offset,
> > > > > > -				 uint8_t *buf, int len, int write)
> > > > > > -{
> > > > > > -	unsigned long page = offset >> PAGE_SHIFT;
> > > > > > -	unsigned long bytes_left = len;
> > > > > > -	int ret;
> > > > > > -
> > > > > > -	/* Copy a page at a time, that way no extra virtual address
> > > > > > -	 * mapping is needed
> > > > > > -	 */
> > > > > > -	offset -= page << PAGE_SHIFT;
> > > > > > -	do {
> > > > > > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > > > -		struct ttm_bo_kmap_obj map;
> > > > > > -		void *ptr;
> > > > > > -		bool is_iomem;
> > > > > > -
> > > > > > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > > > -		if (ret)
> > > > > > -			return ret;
> > > > > > -
> > > > > > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > > > -		WARN_ON_ONCE(is_iomem);
> > > > > > -		if (write)
> > > > > > -			memcpy(ptr, buf, bytes);
> > > > > > -		else
> > > > > > -			memcpy(buf, ptr, bytes);
> > > > > > -		ttm_bo_kunmap(&map);
> > > > > > -
> > > > > > -		page++;
> > > > > > -		buf += bytes;
> > > > > > -		bytes_left -= bytes;
> > > > > > -		offset = 0;
> > > > > > -	} while (bytes_left);
> > > > > > -
> > > > > > -	return len;
> > > > > > -}
> > > > > > -
> > > > > >    int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > >    		     void *buf, int len, int write)
> > > > > >    {
> > > > > > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > >    	unsigned long offset = (addr) - vma->vm_start +
> > > > > >    		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > > > > >    		 << PAGE_SHIFT);
> > > > > > -	int ret;
> > > > > > -
> > > > > > -	if (len < 1 || (offset + len) > bo->base.size)
> > > > > > -		return -EIO;
> > > > > > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > > > -	if (ret)
> > > > > > -		return ret;
> > > > > > -
> > > > > > -	switch (bo->resource->mem_type) {
> > > > > > -	case TTM_PL_SYSTEM:
> > > > > > -		fallthrough;
> > > > > > -	case TTM_PL_TT:
> > > > > > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > > > > > -		break;
> > > > > > -	default:
> > > > > > -		if (bo->bdev->funcs->access_memory)
> > > > > > -			ret = bo->bdev->funcs->access_memory(
> > > > > > -				bo, offset, buf, len, write);
> > > > > > -		else
> > > > > > -			ret = -EIO;
> > > > > > -	}
> > > > > > -
> > > > > > -	ttm_bo_unreserve(bo);
> > > > > > -
> > > > > > -	return ret;
> > > > > > +	return ttm_bo_access(bo, offset, buf, len, write);
> > > > > >    }
> > > > > >    EXPORT_SYMBOL(ttm_bo_vm_access);
> > > > > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > > > > index 5804408815be..8ea11cd8df39 100644
> > > > > > --- a/include/drm/ttm/ttm_bo.h
> > > > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > > > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > > > > >    int ttm_bo_evict_first(struct ttm_device *bdev,
> > > > > >    		       struct ttm_resource_manager *man,
> > > > > >    		       struct ttm_operation_ctx *ctx);
> > > > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > > > +		  void *buf, int len, int write);
> > > > > >    vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> > > > > >    			     struct vm_fault *vmf);
> > > > > >    vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > > > > > -- 
> > > > > > 2.34.1
> > > > > > 
