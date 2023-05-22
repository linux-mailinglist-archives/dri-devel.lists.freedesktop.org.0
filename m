Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB92170D6DB
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B8710E3DE;
	Tue, 23 May 2023 08:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C8710E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684774885; x=1716310885;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=2EEMucg7fF8Ctdoe+sUWHcG7wVR/YJrake9onHGoaaM=;
 b=Ho3fG7PmK9D1paowI59gYQMCcYDCE1K7Z8I1mfb9Xpb7RKYMKGU+1eS7
 Ua0veU7vj7b6DS4eBrIHjiVf83JMYy/7neCwnEbs9WTq5MRlgjbk9oojN
 hIVx9NTLk/wrRG7KEVonz9I0/TlptLRbELp+DZpKDKwag3HqXf/oDdI+Y
 FLJpg9jKaL7xGPfmbSjnYivl5amgCaZ7NhwYa9UTtF2pctcxYNtUa0NRA
 6alwXU8JrVXR7s4UwiGqqL50Gt+G5FcuNOwhIH0l77/Qu+bD4ej6f8JFl
 9wyyWIO8146UHM0RDzioowmk4c0nolFFGeknZHF/yk05dovmO4ZPRVAj8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="416443565"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
 d="xz'341?scan'341,208,341";a="416443565"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 10:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="773438718"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
 d="xz'341?scan'341,208,341";a="773438718"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 22 May 2023 10:01:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 10:01:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 10:01:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 10:01:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 10:01:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=herQJBD136/fSOq2iVwDYzG+nNwhDd0f7tq3ZBuBo5l4Ftx7/hmf4Hz57rYa/BwQpnF9Dr7dtlUTiFGToLcjmNgJnssGpHglrbBjk2aVd7LbgUnIXEB/SybFJ65sBmJzI/nKEzSq8vq68VIoJutEdZDkjJD5MW8QhOjti7enriDd8C0eU3MravcJxl0hLFodSICjfmA+b09PZMQ9FNbYiOGKnnB5kN00ckm3AW4wUxs6SDi8t9weIk+xlnZzaRRyG4WeXFqn/UWF4FkEU58atRDfA1ChMBU83cEqhjDO8MYwD+Z72c89bawlOnltkIMj5cr8U788z57GWZxtZGG0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrEy8vE8SY2QFwgfd2oG1GI8BcTO4vIobAk1rNdbsL0=;
 b=P8glvGhBEUGfcWLujn0/jmFUNXCwhCzfl9wUpDU/k+FxBnp4WA9+MAt5Sdl6DsX1LYQyIlkI2jx0eU7GBb/Q8Tj2fP7ok1iK3o0J6Fj/GjnFGJgGgleLaZFZeP5y+X8eXRW45UYstbrJzJm9co93Hc54WiJnUNjNgtJtftIbzg6yC51ff6IPTs6/4IakzEKBOd/3Sl5k22Y19lUfBbpnglrdcPf8aFpM5/76X54jSqGYNHhPXp042ESTSpKKVyH2Jh9E2GixMapTYSz4lG26aOb5JosKibTleWv+ZjfXQ2a1NIGG9i9W8RrxCfslppGC87TMK6g2OAVMO95osHm7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Mon, 22 May
 2023 17:01:06 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 17:01:05 +0000
Date: Tue, 23 May 2023 00:57:45 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
Message-ID: <202305221659.6504ded7-yujie.liu@intel.com>
Content-Type: multipart/mixed; boundary="eRvIaNMHa3fk5o5F"
Content-Disposition: inline
In-Reply-To: <20230515134133.108780-1-mcanal@igalia.com>
X-ClientProxiedBy: SG2PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::12) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: cff7c537-e2c7-4b3e-479b-08db5ae62095
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tG1/pm/E2/TmUECnp0Kc7UjHIUjNE5vQfx0lsC+AlbQmhcPpzArqEZX+9Si+jwG27JVNAx6NP0T68XNGdSYhoKLcZFa+0+W/rAfzSeCXHHD8vbAsmE+8Y3QvgJxxf3M19dypPRu65aiklBjFoEufGGLk4th/8iscg/JQxsinUHOsszDtGMcC/mIzZKvnO1GKLNxCdwKM/7DKBcmH2PhI2P2ESKIkjXZ04YwRfFNGA60no3bsqzV/9tJGfS+Flt81jxRYXv/Z47ela/roIA9pejvbWQiPhgOS6ma4tcAR2jY3UO53AWnpzHoeia2JAAbmZZFDfaWbsL4a8RWq7c1H9nUCpfN8UEKCOx7a1N4JrXy95spQvuk36VESINHwmQjavaMr4GhB026WsW5vmubVA79I8PwXNv8kBiVwB6E5f/K9oknYL/RmdVhvjwNSrZZU3ppl703CmmSu23MwoQAF4Km7A/mfHQWYCZK/cyHrjnt+PpAu+X3v4qqKyd7yVpCXfFWOIWWISjZ5nvFrZa1i/nPedZhuAPDy64ICDTCt9Dzrwt9OW0ZjHUyaTEzju9+6SvCMAz2Y17Sz84zoXwdXoYCd4tWcddbB2tOXlxJHgMRR2LZzhx7n1l7O321b+/DnkR0W4FvP0kwNJTMOHu5XrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6392.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(82960400001)(38100700002)(86362001)(36756003)(1076003)(6512007)(6506007)(478600001)(8936002)(8676002)(2616005)(2906002)(54906003)(235185007)(4326008)(6916009)(316002)(26005)(41300700001)(66476007)(5660300002)(186003)(966005)(6666004)(44144004)(6486002)(66556008)(66946007)(83380400001)(2700100001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GKakcpU+KCmAfA0Z1LykWWykcWD7GSY1BVQDFS+of9V2zYKrmFJ+UL1vHBhY?=
 =?us-ascii?Q?X08DfyFKhw/INWU6xE7yJiDXQeI0PzFttJ0tJOWHOLi/eh0/RTOjMZx0OHyt?=
 =?us-ascii?Q?5qPeliQKsL7O0dplaJfBHl/v7TLJ0YLb/p4eGhhz5+HBQMGydmzKP8iv6tVD?=
 =?us-ascii?Q?BHcwOCfvTbfDvQ7jUuzS8onzzOiaMnStblMxYhemoao+T5fxKhGSRVofTC/t?=
 =?us-ascii?Q?5ciZERSAN8dauEaa0pXCXWnWiVhXqZAdEXAixImKl4/sBZRrA6xRnU0tiE7e?=
 =?us-ascii?Q?YBt9JnIKuydif9MpDwJR1PVx9Dh89ssn+DwRhrpoAPBor3W3jJjZE6WalKgf?=
 =?us-ascii?Q?fCs2E3AW7Pyp9O7KHmYCRpic2LEqoNj4qoEZbu2GjwB7uofuk6ujg9lA6wBh?=
 =?us-ascii?Q?3LeRHPmkMV8W//pMGasGtLBI0qE2+EiKpgAFYnVXdxPzdxJf20wsRvMI/6dR?=
 =?us-ascii?Q?5Hl3Qb7QcvFON/jJ1DUcUewIhxA4Mu0wRbeLAXqUiooKUe2XvKnwvCTCjC3o?=
 =?us-ascii?Q?HcjZW9j4UCnOA64xdQdSNiT0VY10QyiX6iJGswN+B3U2FKMMScVqhXvcI3Q3?=
 =?us-ascii?Q?BUns3b183cp6leeZvs56U80V/4o6++n+iGRgm3AbLk/rFlf3PsSJeIEqaFw5?=
 =?us-ascii?Q?UHcE78c34F3Lq0/twlWZB3ix4+nqze1vV77SBVfMXpRkJ0PVJaU9zd1cNQEx?=
 =?us-ascii?Q?qN9NAoNmgEjQPC0VdbGlR3MrSRkaiKUd1MZSCwyF2oiDNsXzajwk7iktroGo?=
 =?us-ascii?Q?ApS2xuXcAbPaZYdd695Y6fXiEYpxWmUK8FN/lvIAxi4nf4d6ZEixgsP4lHRm?=
 =?us-ascii?Q?RQYPuYb740xtjgbxfV7pT1foKE2FtegCx+TSt5IJUwzV0SzCZUFZFVUZNCCb?=
 =?us-ascii?Q?wuJi+jHflRkuByS5SLJ4R8wAmDY6mJgFzaHMp/S7hbO/KogKZnwNnhrAgiNb?=
 =?us-ascii?Q?d76tTmwERqrHS9euV8R+QMm61wXTPP9E/vH10gIN6M3weNRWEXU4MBuK0n8c?=
 =?us-ascii?Q?ZSPWjmQDywS9lsE5cxLtD6PIbtzb0Vsg37BKGYc4Cig5Ch3KAG31vZ/1TIyH?=
 =?us-ascii?Q?l9jxK90XoeUqhM8SZ+DP8k7dHCmldy8YD1THg6yZslXWrPVeIJKpGQzUDxHM?=
 =?us-ascii?Q?leNFzJ7E8VGxnvFWblvK1Gcg5ydR1pc1YQGGXB7cz+gZypdv4ISTXBXdOPI6?=
 =?us-ascii?Q?Fhvu8Wd58HvyS00N1Hgkz9675KhXNXzLR3P0GpL9g3VCig7+ENHb8qvYoRLk?=
 =?us-ascii?Q?K7UtxujyALygECye3gAtYy7/fpt1eg/W0nKXreRIeMsMoAkPQPUIBZgmIfEN?=
 =?us-ascii?Q?Jo2quXgzm1xB5mpY9ZGPVPS+EjZ5WuL0mE9Qpug8cvJ5C8OhB8Puf4FE5GWl?=
 =?us-ascii?Q?CI4m+HF8FQedFETz6YJ0yC56x4v5Hr8tsO3IxN51n6cFURpBzn8ZL6ki0cCw?=
 =?us-ascii?Q?T1hasFMKI5FEBCajg7iOTHLUYecVcogcWfC+ShecxMrQSnzOv+uykylXGGib?=
 =?us-ascii?Q?suuBAu0JQxDnGS6cJeR/d3kH28sh8YNZFb40SOI1pxKgRgvZmW4h2hMCajRx?=
 =?us-ascii?Q?HmJu+vujtkNpuzPr24FKpovQPDp3CphJ9PgtBig/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cff7c537-e2c7-4b3e-479b-08db5ae62095
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 17:01:05.8141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHw5fyNcfe7Hde95dWwGekfjMoIvt+KdrjcutWxB5D13xpmJ76/u/iu42xowV9rwvyUT2EG2uMqnx5Zffec8rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, lkp@intel.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 oe-lkp@lists.linux.dev, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--eRvIaNMHa3fk5o5F
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hello,

kernel test robot noticed "WARNING:inconsistent_lock_state" on:

commit: 82ef6a95c29b55f39cf65ac6a29926fca6025161 ("[PATCH] drm/vkms: Fix race-condition between the hrtimer and the atomic commit")
url: https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-vkms-Fix-race-condition-between-the-hrtimer-and-the-atomic-commit/20230515-214326
base: git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link: https://lore.kernel.org/all/20230515134133.108780-1-mcanal@igalia.com/
patch subject: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the atomic commit

in testcase: boot

compiler: clang-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------+------------+------------+
|                                                 | 812562b8d8 | 82ef6a95c2 |
+-------------------------------------------------+------------+------------+
| boot_successes                                  | 10         | 0          |
| boot_failures                                   | 0          | 10         |
| WARNING:inconsistent_lock_state                 | 0          | 10         |
| inconsistent{HARDIRQ-ON-W}->{IN-HARDIRQ-W}usage | 0          | 10         |
| EIP:default_idle                                | 0          | 10         |
+-------------------------------------------------+------------+------------+


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202305221659.6504ded7-yujie.liu@intel.com


[    9.581561][    C0] WARNING: inconsistent lock state
[    9.581563][    C0] 6.4.0-rc1-00152-g82ef6a95c29b #1 Not tainted
[    9.581565][    C0] --------------------------------
[    9.581567][    C0] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
[    9.581569][    C0] swapper/0/0 [HC1[1]:SC0[0]:HE0:SE1] takes:
[ 9.581574][ C0] c88bc220 (&dev->event_lock){?.+.}-{2:2}, at: drm_handle_vblank (drivers/gpu/drm/drm_vblank.c:?) 
[    9.581591][    C0] {HARDIRQ-ON-W} state was registered at:
[ 9.581593][ C0] lock_acquire (kernel/locking/lockdep.c:5691) 
[ 9.581599][ C0] _raw_spin_lock (include/linux/spinlock_api_smp.h:133 kernel/locking/spinlock.c:154) 
[ 9.581605][ C0] vkms_crtc_atomic_flush (drivers/gpu/drm/vkms/vkms_crtc.c:255) 
[ 9.581610][ C0] drm_atomic_helper_commit_planes (drivers/gpu/drm/drm_atomic_helper.c:2765) 
[ 9.581615][ C0] vkms_atomic_commit_tail (drivers/gpu/drm/vkms/vkms_drv.c:75) 
[ 9.581618][ C0] commit_tail (drivers/gpu/drm/drm_atomic_helper.c:?) 
[ 9.581621][ C0] drm_atomic_helper_commit (drivers/gpu/drm/drm_atomic_helper.c:?) 
[ 9.581623][ C0] drm_atomic_commit (drivers/gpu/drm/drm_atomic.c:1504) 
[ 9.581628][ C0] drm_client_modeset_commit_atomic (drivers/gpu/drm/drm_client_modeset.c:?) 
[ 9.581633][ C0] drm_client_modeset_commit_locked (drivers/gpu/drm/drm_client_modeset.c:1148) 
[ 9.581636][ C0] drm_client_modeset_commit (drivers/gpu/drm/drm_client_modeset.c:1174) 
[ 9.581640][ C0] __drm_fb_helper_restore_fbdev_mode_unlocked (drivers/gpu/drm/drm_fb_helper.c:?) 
[ 9.581645][ C0] drm_fb_helper_set_par (drivers/gpu/drm/drm_fb_helper.c:?) 
[ 9.581648][ C0] fbcon_init (drivers/video/fbdev/core/fbcon.c:?) 
[ 9.581651][ C0] visual_init (drivers/tty/vt/vt.c:1025) 
[ 9.581654][ C0] do_bind_con_driver (drivers/tty/vt/vt.c:3643) 
[ 9.581656][ C0] do_take_over_console (drivers/tty/vt/vt.c:4222) 
[ 9.581658][ C0] do_fbcon_takeover (drivers/video/fbdev/core/fbcon.c:530) 
[ 9.581661][ C0] do_fb_registered (drivers/video/fbdev/core/fbcon.c:3002) 
[ 9.581664][ C0] fbcon_fb_registered (drivers/video/fbdev/core/fbcon.c:3022) 
[ 9.581666][ C0] register_framebuffer (drivers/video/fbdev/core/fbmem.c:1499) 
[ 9.581673][ C0] __drm_fb_helper_initial_config_and_unlock (drivers/gpu/drm/drm_fb_helper.c:2053) 
[ 9.581676][ C0] drm_fb_helper_initial_config (drivers/gpu/drm/drm_fb_helper.c:?) 
[ 9.581679][ C0] drm_fbdev_generic_client_hotplug (drivers/gpu/drm/drm_fbdev_generic.c:?) 
[ 9.581682][ C0] drm_fbdev_generic_setup (drivers/gpu/drm/drm_fbdev_generic.c:344) 
[ 9.581685][ C0] vkms_init (drivers/gpu/drm/vkms/vkms_drv.c:?) 
[ 9.581690][ C0] do_one_initcall (init/main.c:1246) 
[ 9.581694][ C0] do_initcall_level (init/main.c:1318) 
[ 9.581699][ C0] do_initcalls (init/main.c:1332) 
[ 9.581701][ C0] do_basic_setup (init/main.c:1355) 
[ 9.581704][ C0] kernel_init_freeable (init/main.c:1575) 
[ 9.581706][ C0] kernel_init (init/main.c:1464) 
[ 9.581713][ C0] ret_from_fork (arch/x86/entry/entry_32.S:770) 
[    9.581716][    C0] irq event stamp: 127808
[ 9.581717][ C0] hardirqs last enabled at (127807): do_idle (kernel/sched/idle.c:?) 
[ 9.581726][ C0] hardirqs last disabled at (127808): sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1106) 
[ 9.581731][ C0] softirqs last enabled at (127802): do_softirq_own_stack (arch/x86/kernel/irq_32.c:57 arch/x86/kernel/irq_32.c:147) 
[ 9.581735][ C0] softirqs last disabled at (127791): do_softirq_own_stack (arch/x86/kernel/irq_32.c:57 arch/x86/kernel/irq_32.c:147) 
[    9.581738][    C0]
[    9.581738][    C0] other info that might help us debug this:
[    9.581739][    C0]  Possible unsafe locking scenario:
[    9.581739][    C0]
[    9.581740][    C0]        CPU0
[    9.581741][    C0]        ----
[    9.581742][    C0]   lock(&dev->event_lock);
[    9.581745][    C0]   <Interrupt>
[    9.581746][    C0]     lock(&dev->event_lock);
[    9.581748][    C0]
[    9.581748][    C0]  *** DEADLOCK ***
[    9.581748][    C0]
[    9.581750][    C0] no locks held by swapper/0/0.
[    9.581751][    C0]
[    9.581751][    C0] stack backtrace:
[    9.581754][    C0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.4.0-rc1-00152-g82ef6a95c29b #1 714d45c675a05052bf3771f9fbc7c7e12a497b74
[    9.581758][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    9.581760][    C0] Call Trace:
[ 9.581764][ C0] dump_stack_lvl (lib/dump_stack.c:107) 
[ 9.581769][ C0] dump_stack (lib/dump_stack.c:113) 
[ 9.581773][ C0] print_usage_bug (kernel/locking/lockdep.c:?) 
[ 9.581778][ C0] mark_lock_irq (kernel/locking/lockdep.c:?) 
[ 9.581781][ C0] ? stack_trace_save (kernel/stacktrace.c:122) 
[ 9.581787][ C0] ? save_trace (kernel/locking/lockdep.c:582) 
[ 9.581791][ C0] mark_lock (kernel/locking/lockdep.c:4651) 
[ 9.581794][ C0] __lock_acquire (kernel/locking/lockdep.c:4537) 
[ 9.581799][ C0] ? __lock_acquire (kernel/locking/lockdep.c:4572) 
[ 9.581803][ C0] ? __lock_acquire (kernel/locking/lockdep.c:4572) 
[ 9.581808][ C0] lock_acquire (kernel/locking/lockdep.c:5691) 
[ 9.581812][ C0] ? drm_handle_vblank (drivers/gpu/drm/drm_vblank.c:?) 
[ 9.581816][ C0] ? ktime_get (kernel/time/timekeeping.c:846 kernel/time/timekeeping.c:846) 
[ 9.581823][ C0] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:110 kernel/locking/spinlock.c:162) 
[ 9.581826][ C0] ? drm_handle_vblank (drivers/gpu/drm/drm_vblank.c:?) 
[ 9.581829][ C0] drm_handle_vblank (drivers/gpu/drm/drm_vblank.c:?) 
[ 9.581833][ C0] drm_crtc_handle_vblank (drivers/gpu/drm/drm_vblank.c:2050) 
[ 9.581836][ C0] vkms_vblank_simulate (drivers/gpu/drm/vkms/vkms_crtc.c:29) 
[ 9.581839][ C0] __run_hrtimer (kernel/time/hrtimer.c:?) 
[ 9.581843][ C0] ? vkms_get_vblank_timestamp (drivers/gpu/drm/vkms/vkms_crtc.c:13) 
[ 9.581847][ C0] __hrtimer_run_queues (kernel/time/hrtimer.c:1749) 
[ 9.581851][ C0] ? _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:110 kernel/locking/spinlock.c:162) 
[ 9.581855][ C0] hrtimer_interrupt (kernel/time/hrtimer.c:1811) 
[ 9.581860][ C0] __sysvec_apic_timer_interrupt (arch/x86/include/asm/jump_label.h:41 include/linux/jump_label.h:207 arch/x86/include/asm/trace/irq_vectors.h:41 arch/x86/kernel/apic/apic.c:1113) 
[ 9.581867][ C0] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1106) 
[ 9.581871][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1106) 
[ 9.581875][ C0] ? do_idle (kernel/sched/idle.c:?) 
[ 9.581880][ C0] handle_exception (arch/x86/entry/entry_32.S:1076) 
[ 9.581888][ C0] EIP: default_idle (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:72 arch/x86/kernel/process.c:711) 
[ 9.581893][ C0] Code: cd 56 68 30 6e 42 c3 e8 10 91 69 ff 83 c4 08 eb cf 00 00 cc cc 00 00 cc cc 00 00 cc 55 89 e5 eb 07 0f 00 2d 0c f8 18 c2 fb f4 <fa> 5d c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 89 e5 e8
All code
========
   0:	cd 56                	int    $0x56
   2:	68 30 6e 42 c3       	push   $0xffffffffc3426e30
   7:	e8 10 91 69 ff       	call   0xffffffffff69911c
   c:	83 c4 08             	add    $0x8,%esp
   f:	eb cf                	jmp    0xffffffffffffffe0
  11:	00 00                	add    %al,(%rax)
  13:	cc                   	int3
  14:	cc                   	int3
  15:	00 00                	add    %al,(%rax)
  17:	cc                   	int3
  18:	cc                   	int3
  19:	00 00                	add    %al,(%rax)
  1b:	cc                   	int3
  1c:	55                   	push   %rbp
  1d:	89 e5                	mov    %esp,%ebp
  1f:	eb 07                	jmp    0x28
  21:	0f 00 2d 0c f8 18 c2 	verw   -0x3de707f4(%rip)        # 0xffffffffc218f834
  28:	fb                   	sti
  29:	f4                   	hlt
  2a:*	fa                   	cli		<-- trapping instruction
  2b:	5d                   	pop    %rbp
  2c:	c3                   	ret
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	55                   	push   %rbp
  3d:	89 e5                	mov    %esp,%ebp
  3f:	e8                   	.byte 0xe8

Code starting with the faulting instruction
===========================================
   0:	fa                   	cli
   1:	5d                   	pop    %rbp
   2:	c3                   	ret
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	55                   	push   %rbp
  13:	89 e5                	mov    %esp,%ebp
  15:	e8                   	.byte 0xe8


To reproduce:

        # build kernel
	cd linux
	cp config-6.4.0-rc1-00152-g82ef6a95c29b .config
	make HOSTCC=clang-14 CC=clang-14 ARCH=i386 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=clang-14 CC=clang-14 ARCH=i386 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--eRvIaNMHa3fk5o5F
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc1-00152-g82ef6a95c29b"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 6.4.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 14.0.6 (git://gitmirror/llvm_project f28c006a5895fc0e329fe15fead81e37457cb1d1)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=140006
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=140006
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=140006
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_KERNEL_ZSTD=y
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
CONFIG_SCHED_CORE=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_INDEX=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
CONFIG_RT_GROUP_SCHED=y
CONFIG_SCHED_MM_CID=y
# CONFIG_CGROUP_PIDS is not set
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_TIME_NS is not set
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_FORCE=y
# CONFIG_BOOT_CONFIG_EMBED is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_X86_32_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_MPPARSE is not set
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
# CONFIG_X86_BIGSMP is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
# CONFIG_X86_RDC321X is not set
# CONFIG_X86_32_NON_STANDARD is not set
CONFIG_X86_32_IRIS=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_M486SX is not set
# CONFIG_M486 is not set
CONFIG_M586=y
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_X86_GENERIC=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_F00F_BUG=y
CONFIG_X86_ALIGNMENT_16=y
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_MINIMUM_CPU_FAMILY=4
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_CYRIX_32=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_CPU_SUP_VORTEX_32=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=8
CONFIG_NR_CPUS_DEFAULT=8
CONFIG_NR_CPUS=8
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

CONFIG_X86_LEGACY_VM86=y
CONFIG_VM86=y
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX32=y
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_TOSHIBA=y
CONFIG_X86_REBOOTFIXUPS=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
# CONFIG_MICROCODE_AMD is not set
# CONFIG_MICROCODE_LATE_LOADING is not set
# CONFIG_X86_MSR is not set
# CONFIG_X86_CPUID is not set
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
CONFIG_PAGE_OFFSET=0xC0000000
CONFIG_HIGHMEM=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_HIGHPTE=y
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
CONFIG_X86_INTEL_TSX_MODE_ON=y
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_COMPAT_VDSO=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
# end of Processor type and features

CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_RETPOLINE=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
CONFIG_PM_USERSPACE_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ENERGY_MODEL=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
# CONFIG_ACPI_DEBUGGER_USER is not set
# CONFIG_ACPI_SPCR_TABLE is not set
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=y
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=y
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=y
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_TABLE_UPGRADE is not set
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=y
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_EINJ=y
CONFIG_ACPI_APEI_ERST_DEBUG=y
CONFIG_ACPI_DPTF=y
CONFIG_DPTF_POWER=y
CONFIG_DPTF_PCH_FIVR=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_FFH is not set
CONFIG_PMIC_OPREGION=y
# CONFIG_TPS68470_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y
CONFIG_X86_APM_BOOT=y
CONFIG_APM=y
CONFIG_APM_IGNORE_USER_SUSPEND=y
# CONFIG_APM_DO_ENABLE is not set
# CONFIG_APM_CPU_IDLE is not set
# CONFIG_APM_DISPLAY_BLANK is not set
# CONFIG_APM_ALLOW_INTS is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=y
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=y
# CONFIG_X86_ACPI_CPUFREQ_CPB is not set
# CONFIG_X86_POWERNOW_K6 is not set
CONFIG_X86_POWERNOW_K7=y
CONFIG_X86_POWERNOW_K7_ACPI=y
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_SPEEDSTEP_ICH=y
CONFIG_X86_SPEEDSTEP_SMI=y
CONFIG_X86_P4_CLOCKMOD=y
CONFIG_X86_CPUFREQ_NFORCE2=y
CONFIG_X86_LONGRUN=y
CONFIG_X86_LONGHAUL=y
# CONFIG_X86_E_POWERSAVER is not set

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_CPU_IDLE_GOV_MENU is not set
CONFIG_CPU_IDLE_GOV_TEO=y
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_SCx200=y
CONFIG_SCx200HR_TIMER=y
# CONFIG_OLPC is not set
# CONFIG_ALIX is not set
# CONFIG_NET5501 is not set
CONFIG_GEOS=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_HAS_LTO_CLANG=y
CONFIG_LTO_NONE=y
# CONFIG_LTO_CLANG_FULL is not set
# CONFIG_LTO_CLANG_THIN is not set
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
CONFIG_BLK_SED_OPAL=y
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
# CONFIG_ACORN_PARTITION_EESOX is not set
# CONFIG_ACORN_PARTITION_ICS is not set
CONFIG_ACORN_PARTITION_ADFS=y
CONFIG_ACORN_PARTITION_POWERTEC=y
# CONFIG_ACORN_PARTITION_RISCIX is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
CONFIG_ATARI_PARTITION=y
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
CONFIG_LDM_PARTITION=y
# CONFIG_LDM_DEBUG is not set
# CONFIG_SGI_PARTITION is not set
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
CONFIG_KARMA_PARTITION=y
# CONFIG_EFI_PARTITION is not set
CONFIG_SYSV68_PARTITION=y
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
# CONFIG_MQ_IOSCHED_KYBER is not set
CONFIG_IOSCHED_BFQ=y
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
# CONFIG_SWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_BOUNCE=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_SECRETMEM=y
CONFIG_ANON_VMA_NAME=y
CONFIG_USERFAULTFD=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
CONFIG_FW_CACHE=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SOUNDWIRE=y
CONFIG_REGMAP_SOUNDWIRE_MBQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_PCI_GENERIC is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_FW_CS_DSP=y
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=y
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
# CONFIG_FTL is not set
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
CONFIG_SSFDC=y
# CONFIG_SM_FTL is not set
CONFIG_MTD_OOPS=y
# CONFIG_MTD_PSTORE is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
CONFIG_MTD_CFI_BE_BYTE_SWAP=y
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
CONFIG_MTD_MAP_BANK_WIDTH_8=y
CONFIG_MTD_MAP_BANK_WIDTH_16=y
CONFIG_MTD_MAP_BANK_WIDTH_32=y
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_I4=y
CONFIG_MTD_CFI_I8=y
CONFIG_MTD_OTP=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_SBC_GXX=y
CONFIG_MTD_SCx200_DOCFLASH=y
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=y
# CONFIG_MTD_ESB2ROM is not set
# CONFIG_MTD_CK804XROM is not set
# CONFIG_MTD_SCB2_FLASH is not set
# CONFIG_MTD_NETtel is not set
CONFIG_MTD_L440GX=y
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SLRAM=y
CONFIG_MTD_PHRAM=y
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
CONFIG_MTD_ONENAND_GENERIC=y
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
# CONFIG_MTD_NAND_DENALI_PCI is not set
# CONFIG_MTD_NAND_CAFE is not set
CONFIG_MTD_NAND_CS553X=y
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_GPIO=y
# CONFIG_MTD_NAND_PLATFORM is not set
# CONFIG_MTD_NAND_ARASAN is not set

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=y
# CONFIG_MTD_NAND_RICOH is not set
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_UBI_BLOCK is not set
CONFIG_MTD_HYPERBUS=y
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_SERIAL is not set
CONFIG_PARPORT_PC_FIFO=y
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
# CONFIG_ISAPNP is not set
# CONFIG_PNPBIOS is not set
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_VERBOSE_ERRORS=y
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_DUMMY_IRQ=y
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_SMPRO_ERRMON=y
# CONFIG_SMPRO_MISC is not set
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_PCH_PHUB is not set
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_C2PORT=y
CONFIG_C2PORT_DURAMAR_2150=y

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
CONFIG_ECHO=y
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
CONFIG_BLK_DEV_BSG=y
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_ENCLOSURE=y
CONFIG_SCSI_CONSTANTS=y
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_HOST_SMP=y
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

# CONFIG_ATA is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
# CONFIG_MD_RAID1 is not set
CONFIG_MD_RAID10=y
CONFIG_MD_RAID456=y
CONFIG_MD_MULTIPATH=y
CONFIG_MD_FAULTY=y
CONFIG_BCACHE=y
# CONFIG_BCACHE_DEBUG is not set
# CONFIG_BCACHE_CLOSURES_DEBUG is not set
# CONFIG_BCACHE_ASYNC_REGISTRATION is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
# CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=y
CONFIG_DM_SNAPSHOT=y
CONFIG_DM_THIN_PROVISIONING=y
CONFIG_DM_CACHE=y
CONFIG_DM_CACHE_SMQ=y
CONFIG_DM_WRITECACHE=y
CONFIG_DM_ERA=y
CONFIG_DM_CLONE=y
CONFIG_DM_MIRROR=y
# CONFIG_DM_LOG_USERSPACE is not set
# CONFIG_DM_RAID is not set
CONFIG_DM_ZERO=y
CONFIG_DM_MULTIPATH=y
CONFIG_DM_MULTIPATH_QL=y
# CONFIG_DM_MULTIPATH_ST is not set
CONFIG_DM_MULTIPATH_HST=y
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=y
# CONFIG_DM_DUST is not set
CONFIG_DM_INIT=y
# CONFIG_DM_UEVENT is not set
# CONFIG_DM_FLAKEY is not set
CONFIG_DM_VERITY=y
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
CONFIG_DM_VERITY_FEC=y
CONFIG_DM_SWITCH=y
CONFIG_DM_LOG_WRITES=y
CONFIG_DM_INTEGRITY=y
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=y
# CONFIG_TCM_IBLOCK is not set
# CONFIG_TCM_FILEIO is not set
# CONFIG_TCM_PSCSI is not set
CONFIG_LOOPBACK_TARGET=y
# CONFIG_ISCSI_TARGET is not set
# CONFIG_REMOTE_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
# CONFIG_MAC_EMUMOUSEBTN is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_3C515 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0_ISA is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2000 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_ULTRA is not set
# CONFIG_WD80x3 is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_PCH_GBE is not set
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC9194 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
CONFIG_KEYBOARD_ADP5589=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=y
# CONFIG_KEYBOARD_QT1070 is not set
CONFIG_KEYBOARD_QT2160=y
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=y
CONFIG_KEYBOARD_GPIO=y
# CONFIG_KEYBOARD_GPIO_POLLED is not set
CONFIG_KEYBOARD_TCA6416=y
CONFIG_KEYBOARD_TCA8418=y
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
CONFIG_KEYBOARD_MAX7359=y
CONFIG_KEYBOARD_MCS=y
# CONFIG_KEYBOARD_MPR121 is not set
CONFIG_KEYBOARD_NEWTON=y
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_PINEPHONE=y
CONFIG_KEYBOARD_SAMSUNG=y
CONFIG_KEYBOARD_STOWAWAY=y
CONFIG_KEYBOARD_SUNKBD=y
# CONFIG_KEYBOARD_IQS62X is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
CONFIG_KEYBOARD_CYPRESS_SF=y
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=y
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
CONFIG_MOUSE_ELAN_I2C=y
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
# CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
CONFIG_MOUSE_INPORT=y
CONFIG_MOUSE_ATIXL=y
# CONFIG_MOUSE_LOGIBM is not set
CONFIG_MOUSE_PC110PAD=y
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=y
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=y
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=y
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=y
CONFIG_JOYSTICK_IFORCE_232=y
CONFIG_JOYSTICK_WARRIOR=y
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=y
# CONFIG_JOYSTICK_STINGER is not set
CONFIG_JOYSTICK_TWIDJOY=y
CONFIG_JOYSTICK_ZHENHUA=y
CONFIG_JOYSTICK_DB9=y
# CONFIG_JOYSTICK_GAMECON is not set
CONFIG_JOYSTICK_TURBOGRAFX=y
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
CONFIG_JOYSTICK_WALKERA0701=y
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_JOYSTICK_SENSEHAT=y
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=y
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
# CONFIG_RMI4_F30 is not set
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PARKBD=y
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DFL=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_LANTIQ=y
# CONFIG_SERIAL_LANTIQ_CONSOLE is not set
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=y
# CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
CONFIG_SERIAL_MEN_Z135=y
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
# CONFIG_SYNCLINK_GT is not set
# CONFIG_N_HDLC is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=y
CONFIG_RPMSG_TTY=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
# CONFIG_VIRTIO_CONSOLE is not set
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
# CONFIG_IPMI_IPMB is not set
# CONFIG_IPMI_WATCHDOG is not set
# CONFIG_IPMI_POWEROFF is not set
# CONFIG_SSIF_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=y
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_GEODE=y
CONFIG_HW_RANDOM_VIA=y
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_XIPHERA=y
CONFIG_DTLK=y
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set
CONFIG_MWAVE=y
CONFIG_SCx200_GPIO=y
CONFIG_PC8736x_GPIO=y
CONFIG_NSC_GPIO=y
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_I2C=y
# CONFIG_TCG_TIS_I2C_CR50 is not set
# CONFIG_TCG_TIS_I2C_ATMEL is not set
# CONFIG_TCG_TIS_I2C_INFINEON is not set
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
# CONFIG_TCG_NSC is not set
CONFIG_TCG_ATMEL=y
CONFIG_TCG_INFINEON=y
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_TELCLOCK=y
# CONFIG_XILLYBUS is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
# CONFIG_ACPI_I2C_OPREGION is not set
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
CONFIG_I2C_SCMI=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PARPORT is not set
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_PCA_ISA=y
# CONFIG_SCx200_ACB is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
# CONFIG_CDNS_I3C_MASTER is not set
# CONFIG_DW_I3C_MASTER is not set
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=y
# CONFIG_SPI is not set
CONFIG_SPMI=y
# CONFIG_SPMI_HISI3670 is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_PCH is not set
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# CONFIG_PTP_1588_CLOCK_OCP is not set
# CONFIG_PTP_DFL_TOD is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_CY8C95X0=y
# CONFIG_PINCTRL_DA9062 is not set
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L90=y

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_ALDERLAKE=y
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=y
CONFIG_PINCTRL_DENVERTON=y
CONFIG_PINCTRL_ELKHARTLAKE=y
CONFIG_PINCTRL_EMMITSBURG=y
# CONFIG_PINCTRL_GEMINILAKE is not set
CONFIG_PINCTRL_ICELAKE=y
CONFIG_PINCTRL_JASPERLAKE=y
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
CONFIG_PINCTRL_METEORLAKE=y
# CONFIG_PINCTRL_SUNRISEPOINT is not set
CONFIG_PINCTRL_TIGERLAKE=y
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=y
CONFIG_GPIO_SIOX=y
CONFIG_GPIO_TANGIER=y
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH311X=y
# CONFIG_GPIO_WINBOND is not set
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_FXL6408=y
CONFIG_GPIO_MAX7300=y
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ARIZONA is not set
CONFIG_GPIO_BD9571MWV=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_ELKHARTLAKE=y
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS6586X is not set
CONFIG_GPIO_TPS65912=y
# CONFIG_GPIO_TPS68470 is not set
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_WM831X=y
CONFIG_GPIO_WM8350=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_LATCH=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
# CONFIG_W1_SLAVE_DS250X is not set
# CONFIG_W1_SLAVE_DS2780 is not set
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_ATC260X=y
# CONFIG_POWER_RESET_MT6323 is not set
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_RESET_TPS65086=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_IP5XXX_POWER=y
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
CONFIG_WM8350_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=y
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=y
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
# CONFIG_BATTERY_DA9030 is not set
# CONFIG_BATTERY_DA9052 is not set
# CONFIG_BATTERY_DA9150 is not set
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_88PM860X=y
# CONFIG_CHARGER_PCF50633 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_MAX77693=y
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MT6360 is not set
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_BQ25980 is not set
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65090=y
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_RT9467 is not set
CONFIG_CHARGER_RT9471=y
# CONFIG_CHARGER_BD99954 is not set
CONFIG_BATTERY_UG3105=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=y
CONFIG_SENSORS_ABITUGURU3=y
CONFIG_SENSORS_SMPRO=y
CONFIG_SENSORS_AD7414=y
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=y
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_K8TEMP is not set
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=y
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
# CONFIG_SENSORS_DELL_SMM is not set
# CONFIG_SENSORS_DA9052_ADC is not set
# CONFIG_SENSORS_DA9055 is not set
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_IBMAEM is not set
CONFIG_SENSORS_IBMPEX=y
# CONFIG_SENSORS_I5500 is not set
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2990=y
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX31760=y
# CONFIG_SENSORS_MAX6620 is not set
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
# CONFIG_SENSORS_MC34VR500 is not set
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_MLXREG_FAN=y
CONFIG_SENSORS_TC654=y
# CONFIG_SENSORS_TPS23861 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=y
CONFIG_SENSORS_MR75203=y
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
# CONFIG_SENSORS_LM77 is not set
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT6775_I2C=y
# CONFIG_SENSORS_NCT7802 is not set
CONFIG_SENSORS_NPCM7XX=y
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
# CONFIG_SENSORS_OXP is not set
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_SENSORS_PECI_CPUTEMP=y
# CONFIG_SENSORS_PECI_DIMMTEMP is not set
CONFIG_SENSORS_PECI=y
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
# CONFIG_SENSORS_ACBEL_FSG032 is not set
CONFIG_SENSORS_ADM1266=y
CONFIG_SENSORS_ADM1275=y
CONFIG_SENSORS_BEL_PFE=y
CONFIG_SENSORS_BPA_RS600=y
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=y
CONFIG_SENSORS_DPS920AB=y
CONFIG_SENSORS_INSPUR_IPSPS=y
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
CONFIG_SENSORS_IR38064=y
CONFIG_SENSORS_IR38064_REGULATOR=y
CONFIG_SENSORS_IRPS5401=y
CONFIG_SENSORS_ISL68137=y
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LT7182S=y
CONFIG_SENSORS_LTC2978=y
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=y
CONFIG_SENSORS_MAX15301=y
# CONFIG_SENSORS_MAX16064 is not set
# CONFIG_SENSORS_MAX16601 is not set
CONFIG_SENSORS_MAX20730=y
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX31785=y
CONFIG_SENSORS_MAX34440=y
CONFIG_SENSORS_MAX8688=y
# CONFIG_SENSORS_MP2888 is not set
CONFIG_SENSORS_MP2975=y
CONFIG_SENSORS_MP5023=y
CONFIG_SENSORS_MPQ7932_REGULATOR=y
CONFIG_SENSORS_MPQ7932=y
CONFIG_SENSORS_PIM4328=y
# CONFIG_SENSORS_PLI1209BC is not set
CONFIG_SENSORS_PM6764TR=y
CONFIG_SENSORS_PXE1610=y
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TDA38640 is not set
CONFIG_SENSORS_TPS40422=y
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_TPS546D24=y
CONFIG_SENSORS_UCD9000=y
CONFIG_SENSORS_UCD9200=y
CONFIG_SENSORS_XDPE152=y
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=y
CONFIG_SENSORS_SBTSI=y
CONFIG_SENSORS_SBRMI=y
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHT4x=y
# CONFIG_SENSORS_SHTC1 is not set
# CONFIG_SENSORS_SIS5595 is not set
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=y
CONFIG_SENSORS_EMC2305=y
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_STTS751=y
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA238=y
CONFIG_SENSORS_INA3221=y
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=y
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_TMP464=y
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_WM8350=y
# CONFIG_SENSORS_INTEL_M10_BMC_HWMON is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=y
CONFIG_SENSORS_ATK0110=y
# CONFIG_SENSORS_ASUS_WMI is not set
CONFIG_SENSORS_ASUS_EC=y
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=y
CONFIG_THERMAL_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_GOV_STEP_WISE is not set
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
# CONFIG_DEVFREQ_THERMAL is not set
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=y
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_SMPRO=y
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
# CONFIG_MFD_CS47L85 is not set
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_INTEL_SOC_PMIC_MRFLD=y
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_INTEL_PMC_BXT is not set
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_INTEL_M10_BMC_CORE=y
CONFIG_MFD_INTEL_M10_BMC_PMCI=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_88PM8607=y
# CONFIG_REGULATOR_ACT8865 is not set
# CONFIG_REGULATOR_AD5398 is not set
# CONFIG_REGULATOR_ARIZONA_LDO1 is not set
# CONFIG_REGULATOR_ARIZONA_MICSUPP is not set
CONFIG_REGULATOR_ATC260X=y
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BCM590XX=y
CONFIG_REGULATOR_BD9571MWV=y
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9055=y
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_GPIO is not set
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8997 is not set
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX20411=y
CONFIG_REGULATOR_MAX77693=y
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
# CONFIG_REGULATOR_MC13892 is not set
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MT6311=y
# CONFIG_REGULATOR_MT6315 is not set
# CONFIG_REGULATOR_MT6323 is not set
CONFIG_REGULATOR_MT6331=y
CONFIG_REGULATOR_MT6332=y
# CONFIG_REGULATOR_MT6357 is not set
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6359=y
CONFIG_REGULATOR_MT6360=y
CONFIG_REGULATOR_MT6370=y
CONFIG_REGULATOR_MT6397=y
CONFIG_REGULATOR_PALMAS=y
CONFIG_REGULATOR_PCA9450=y
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_QCOM_SPMI=y
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4803=y
CONFIG_REGULATOR_RT5033=y
CONFIG_REGULATOR_RT5120=y
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5739 is not set
CONFIG_REGULATOR_RT5759=y
# CONFIG_REGULATOR_RT6160 is not set
CONFIG_REGULATOR_RT6190=y
CONFIG_REGULATOR_RT6245=y
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
# CONFIG_REGULATOR_SLG51000 is not set
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65090=y
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS6586X=y
# CONFIG_REGULATOR_TPS65912 is not set
CONFIG_REGULATOR_TPS68470=y
# CONFIG_REGULATOR_WM831X is not set
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
# CONFIG_VIDEO_DEV is not set
# CONFIG_MEDIA_CONTROLLER is not set
CONFIG_DVB_CORE=y
# end of Media core support

#
# Digital TV options
#
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
CONFIG_SDR_PLATFORM_DRIVERS=y
# CONFIG_DVB_PLATFORM_DRIVERS is not set

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#

#
# Microchip Technology, Inc. media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#

#
# MMC/SDIO DVB adapters
#
CONFIG_SMS_SDIO_DRV=y
# CONFIG_DVB_TEST_DRIVERS is not set
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_SMS_SIANO_MDTV=y
# end of Media drivers

CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_MEDIA_TUNER=y

#
# Tuner drivers auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y

#
# DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Multistandard (satellite) frontends
#

#
# Multistandard (cable + terrestrial) frontends
#

#
# DVB-S (satellite) frontends
#

#
# DVB-T (terrestrial) frontends
#

#
# DVB-C (cable) frontends
#

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#

#
# ISDB-T (terrestrial) frontends
#

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#

#
# Digital terrestrial only tuners/PLL
#

#
# SEC control devices for DVB-S
#

#
# Common Interface (EN50221) controller drivers
#

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
# CONFIG_DRM_I2C_SIL164 is not set
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
CONFIG_DRM_VGEM=y
CONFIG_DRM_VKMS=y
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_QXL is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_DRM_VBOXVIDEO is not set
CONFIG_DRM_SSD130X=y
CONFIG_DRM_SSD130X_I2C=y
CONFIG_DRM_LEGACY=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_PRIVACY_SCREEN=y

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_ARC=y
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_VESA=y
# CONFIG_FB_N411 is not set
CONFIG_FB_HGA=y
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_GEODE is not set
CONFIG_FB_IBM_GXT4500=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
# CONFIG_FB_MB862XX is not set
CONFIG_FB_SIMPLE=y
CONFIG_FB_SSD1307=y
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
CONFIG_BACKLIGHT_KTZ8866=y
CONFIG_BACKLIGHT_DA903X=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_MT6370 is not set
# CONFIG_BACKLIGHT_APPLE is not set
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_WM831X is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=y
CONFIG_BACKLIGHT_PCF50633=y
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_MDA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
# end of Console display driver support

# CONFIG_LOGO is not set
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
CONFIG_SND_PCM_OSS=y
CONFIG_SND_PCM_OSS_PLUGINS=y
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
# CONFIG_SND_VERBOSE_PROCFS is not set
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_CTL_FAST_LOOKUP=y
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_CTL_DEBUG=y
# CONFIG_SND_JACK_INJECTION_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
# CONFIG_SND_SEQUENCER_OSS is not set
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_AC97_CODEC=y
# CONFIG_SND_DRIVERS is not set
# CONFIG_SND_ISA is not set
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ASIHPI is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CS5530 is not set
# CONFIG_SND_CS5535AUDIO is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SE6X is not set
# CONFIG_SND_SIS7019 is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
# CONFIG_SND_HDA_INTEL is not set
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
# CONFIG_SND_SOC_ADI is not set
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_SOC_AMD_RENOIR is not set
# CONFIG_SND_SOC_AMD_ACP5x is not set
# CONFIG_SND_SOC_AMD_ACP6x is not set
# CONFIG_SND_AMD_ACP_CONFIG is not set
# CONFIG_SND_SOC_AMD_ACP_COMMON is not set
# CONFIG_SND_SOC_AMD_RPL_ACP6x is not set
# CONFIG_SND_SOC_AMD_PS is not set
CONFIG_SND_ATMEL_SOC=y
# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
CONFIG_SND_DESIGNWARE_I2S=y
CONFIG_SND_DESIGNWARE_PCM=y

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=y
CONFIG_SND_SOC_FSL_SAI=y
CONFIG_SND_SOC_FSL_MQS=y
# CONFIG_SND_SOC_FSL_AUDMIX is not set
CONFIG_SND_SOC_FSL_SSI=y
CONFIG_SND_SOC_FSL_SPDIF=y
CONFIG_SND_SOC_FSL_ESAI=y
# CONFIG_SND_SOC_FSL_MICFIL is not set
CONFIG_SND_SOC_FSL_EASRC=y
CONFIG_SND_SOC_FSL_XCVR=y
CONFIG_SND_SOC_FSL_UTILS=y
CONFIG_SND_SOC_FSL_RPMSG=y
CONFIG_SND_SOC_IMX_AUDMUX=y
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=y
CONFIG_SND_SOC_IMG=y
# CONFIG_SND_SOC_IMG_I2S_IN is not set
# CONFIG_SND_SOC_IMG_I2S_OUT is not set
CONFIG_SND_SOC_IMG_PARALLEL_OUT=y
CONFIG_SND_SOC_IMG_SPDIF_IN=y
# CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
# CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
# CONFIG_SND_SOC_INTEL_AVS is not set
CONFIG_SND_SOC_MTK_BTCVSD=y
CONFIG_SND_SOC_SOF_TOPLEVEL=y
# CONFIG_SND_SOC_SOF_PCI is not set
CONFIG_SND_SOC_SOF_ACPI=y
# CONFIG_SND_SOC_SOF_AMD_TOPLEVEL is not set
# CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

CONFIG_SND_SOC_XILINX_I2S=y
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=y
CONFIG_SND_SOC_XILINX_SPDIF=y
CONFIG_SND_SOC_XTFPGA_I2S=y
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
CONFIG_SND_SOC_WM_ADSP=y
CONFIG_SND_SOC_AC97_CODEC=y
CONFIG_SND_SOC_ADAU_UTILS=y
# CONFIG_SND_SOC_ADAU1372_I2C is not set
CONFIG_SND_SOC_ADAU1701=y
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
CONFIG_SND_SOC_ADAU7002=y
# CONFIG_SND_SOC_ADAU7118_HW is not set
# CONFIG_SND_SOC_ADAU7118_I2C is not set
CONFIG_SND_SOC_AK4118=y
CONFIG_SND_SOC_AK4375=y
CONFIG_SND_SOC_AK4458=y
CONFIG_SND_SOC_AK4554=y
# CONFIG_SND_SOC_AK4613 is not set
# CONFIG_SND_SOC_AK4642 is not set
CONFIG_SND_SOC_AK5386=y
CONFIG_SND_SOC_AK5558=y
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_AW8738 is not set
CONFIG_SND_SOC_AW88395_LIB=y
CONFIG_SND_SOC_AW88395=y
# CONFIG_SND_SOC_BD28623 is not set
CONFIG_SND_SOC_BT_SCO=y
CONFIG_SND_SOC_CS35L32=y
CONFIG_SND_SOC_CS35L33=y
CONFIG_SND_SOC_CS35L34=y
# CONFIG_SND_SOC_CS35L35 is not set
CONFIG_SND_SOC_CS35L36=y
CONFIG_SND_SOC_CS35L41_LIB=y
CONFIG_SND_SOC_CS35L41=y
CONFIG_SND_SOC_CS35L41_I2C=y
CONFIG_SND_SOC_CS35L45=y
CONFIG_SND_SOC_CS35L45_I2C=y
CONFIG_SND_SOC_CS35L56=y
CONFIG_SND_SOC_CS35L56_SHARED=y
CONFIG_SND_SOC_CS35L56_I2C=y
CONFIG_SND_SOC_CS35L56_SDW=y
CONFIG_SND_SOC_CS42L42_CORE=y
CONFIG_SND_SOC_CS42L42=y
# CONFIG_SND_SOC_CS42L42_SDW is not set
# CONFIG_SND_SOC_CS42L51_I2C is not set
# CONFIG_SND_SOC_CS42L52 is not set
CONFIG_SND_SOC_CS42L56=y
# CONFIG_SND_SOC_CS42L73 is not set
CONFIG_SND_SOC_CS42L83=y
# CONFIG_SND_SOC_CS4234 is not set
CONFIG_SND_SOC_CS4265=y
CONFIG_SND_SOC_CS4270=y
CONFIG_SND_SOC_CS4271=y
CONFIG_SND_SOC_CS4271_I2C=y
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
CONFIG_SND_SOC_CS43130=y
# CONFIG_SND_SOC_CS4341 is not set
CONFIG_SND_SOC_CS4349=y
# CONFIG_SND_SOC_CS53L30 is not set
CONFIG_SND_SOC_CX2072X=y
CONFIG_SND_SOC_DA7213=y
# CONFIG_SND_SOC_DMIC is not set
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=y
CONFIG_SND_SOC_ES8316=y
CONFIG_SND_SOC_ES8326=y
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
CONFIG_SND_SOC_GTM601=y
# CONFIG_SND_SOC_HDA is not set
CONFIG_SND_SOC_ICS43432=y
CONFIG_SND_SOC_INNO_RK3036=y
CONFIG_SND_SOC_MAX98088=y
CONFIG_SND_SOC_MAX98090=y
CONFIG_SND_SOC_MAX98357A=y
CONFIG_SND_SOC_MAX98504=y
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=y
# CONFIG_SND_SOC_MAX98520 is not set
CONFIG_SND_SOC_MAX98363=y
CONFIG_SND_SOC_MAX98373=y
CONFIG_SND_SOC_MAX98373_I2C=y
# CONFIG_SND_SOC_MAX98373_SDW is not set
CONFIG_SND_SOC_MAX98390=y
# CONFIG_SND_SOC_MAX98396 is not set
# CONFIG_SND_SOC_MAX9860 is not set
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=y
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
# CONFIG_SND_SOC_PCM1681 is not set
CONFIG_SND_SOC_PCM1789=y
CONFIG_SND_SOC_PCM1789_I2C=y
# CONFIG_SND_SOC_PCM179X_I2C is not set
CONFIG_SND_SOC_PCM186X=y
CONFIG_SND_SOC_PCM186X_I2C=y
CONFIG_SND_SOC_PCM3060=y
CONFIG_SND_SOC_PCM3060_I2C=y
CONFIG_SND_SOC_PCM3168A=y
CONFIG_SND_SOC_PCM3168A_I2C=y
# CONFIG_SND_SOC_PCM5102A is not set
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
CONFIG_SND_SOC_RK3328=y
CONFIG_SND_SOC_RT1308_SDW=y
CONFIG_SND_SOC_RT1316_SDW=y
CONFIG_SND_SOC_RT1318_SDW=y
# CONFIG_SND_SOC_RT5616 is not set
CONFIG_SND_SOC_RT5631=y
# CONFIG_SND_SOC_RT5640 is not set
# CONFIG_SND_SOC_RT5659 is not set
# CONFIG_SND_SOC_RT5682_SDW is not set
CONFIG_SND_SOC_RT700=y
CONFIG_SND_SOC_RT700_SDW=y
# CONFIG_SND_SOC_RT711_SDW is not set
# CONFIG_SND_SOC_RT711_SDCA_SDW is not set
# CONFIG_SND_SOC_RT712_SDCA_SDW is not set
# CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW is not set
CONFIG_SND_SOC_RT715=y
CONFIG_SND_SOC_RT715_SDW=y
CONFIG_SND_SOC_RT715_SDCA_SDW=y
CONFIG_SND_SOC_RT9120=y
CONFIG_SND_SOC_SGTL5000=y
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_I2C=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
CONFIG_SND_SOC_SIMPLE_MUX=y
CONFIG_SND_SOC_SMA1303=y
CONFIG_SND_SOC_SPDIF=y
CONFIG_SND_SOC_SRC4XXX_I2C=y
CONFIG_SND_SOC_SRC4XXX=y
# CONFIG_SND_SOC_SSM2305 is not set
# CONFIG_SND_SOC_SSM2518 is not set
CONFIG_SND_SOC_SSM2602=y
CONFIG_SND_SOC_SSM2602_I2C=y
# CONFIG_SND_SOC_SSM4567 is not set
CONFIG_SND_SOC_STA32X=y
CONFIG_SND_SOC_STA350=y
CONFIG_SND_SOC_STI_SAS=y
CONFIG_SND_SOC_TAS2552=y
# CONFIG_SND_SOC_TAS2562 is not set
CONFIG_SND_SOC_TAS2764=y
CONFIG_SND_SOC_TAS2770=y
CONFIG_SND_SOC_TAS2780=y
# CONFIG_SND_SOC_TAS5086 is not set
CONFIG_SND_SOC_TAS571X=y
CONFIG_SND_SOC_TAS5720=y
CONFIG_SND_SOC_TAS5805M=y
CONFIG_SND_SOC_TAS6424=y
CONFIG_SND_SOC_TDA7419=y
CONFIG_SND_SOC_TFA9879=y
CONFIG_SND_SOC_TFA989X=y
CONFIG_SND_SOC_TLV320ADC3XXX=y
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
# CONFIG_SND_SOC_TLV320AIC31XX is not set
# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
CONFIG_SND_SOC_TLV320AIC3X=y
CONFIG_SND_SOC_TLV320AIC3X_I2C=y
# CONFIG_SND_SOC_TLV320ADCX140 is not set
CONFIG_SND_SOC_TS3A227E=y
CONFIG_SND_SOC_TSCS42XX=y
CONFIG_SND_SOC_TSCS454=y
# CONFIG_SND_SOC_UDA1334 is not set
# CONFIG_SND_SOC_WCD938X_SDW is not set
# CONFIG_SND_SOC_WM8510 is not set
CONFIG_SND_SOC_WM8523=y
# CONFIG_SND_SOC_WM8524 is not set
# CONFIG_SND_SOC_WM8580 is not set
CONFIG_SND_SOC_WM8711=y
CONFIG_SND_SOC_WM8728=y
CONFIG_SND_SOC_WM8731=y
CONFIG_SND_SOC_WM8731_I2C=y
# CONFIG_SND_SOC_WM8737 is not set
CONFIG_SND_SOC_WM8741=y
CONFIG_SND_SOC_WM8750=y
CONFIG_SND_SOC_WM8753=y
# CONFIG_SND_SOC_WM8776 is not set
CONFIG_SND_SOC_WM8782=y
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
CONFIG_SND_SOC_WM8903=y
CONFIG_SND_SOC_WM8904=y
# CONFIG_SND_SOC_WM8940 is not set
CONFIG_SND_SOC_WM8960=y
CONFIG_SND_SOC_WM8961=y
CONFIG_SND_SOC_WM8962=y
# CONFIG_SND_SOC_WM8974 is not set
# CONFIG_SND_SOC_WM8978 is not set
CONFIG_SND_SOC_WM8985=y
CONFIG_SND_SOC_WSA881X=y
CONFIG_SND_SOC_WSA883X=y
CONFIG_SND_SOC_MAX9759=y
CONFIG_SND_SOC_MT6351=y
CONFIG_SND_SOC_MT6358=y
CONFIG_SND_SOC_MT6660=y
CONFIG_SND_SOC_NAU8315=y
CONFIG_SND_SOC_NAU8540=y
# CONFIG_SND_SOC_NAU8810 is not set
CONFIG_SND_SOC_NAU8821=y
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=y
CONFIG_SND_SOC_TPA6130A2=y
CONFIG_SND_SOC_LPASS_MACRO_COMMON=y
CONFIG_SND_SOC_LPASS_WSA_MACRO=y
CONFIG_SND_SOC_LPASS_VA_MACRO=y
CONFIG_SND_SOC_LPASS_RX_MACRO=y
# CONFIG_SND_SOC_LPASS_TX_MACRO is not set
# end of CODEC drivers

# CONFIG_SND_SIMPLE_CARD is not set
CONFIG_SND_X86=y
CONFIG_SND_VIRTIO=y
CONFIG_AC97_BUS=y
# CONFIG_HID_SUPPORT is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB dual-mode controller drivers
#

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set
# CONFIG_MMC_CRYPTO is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_SDHCI is not set
CONFIG_MMC_WBSD=y
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
# CONFIG_MMC_TOSHIBA_PCI is not set
CONFIG_MMC_MTK=y
CONFIG_SCSI_UFSHCD=y
CONFIG_SCSI_UFS_BSG=y
CONFIG_SCSI_UFS_CRYPTO=y
# CONFIG_SCSI_UFS_HPB is not set
CONFIG_SCSI_UFS_FAULT_INJECTION=y
CONFIG_SCSI_UFS_HWMON=y
# CONFIG_SCSI_UFSHCD_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=y
CONFIG_SCSI_UFS_CDNS_PLATFORM=y
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
# CONFIG_MSPRO_BLOCK is not set
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_88PM860X is not set
CONFIG_LEDS_APU=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_MT6323=y
CONFIG_LEDS_NET48XX=y
# CONFIG_LEDS_WRAP is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
# CONFIG_LEDS_LP8788 is not set
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=y
# CONFIG_LEDS_WM831X_STATUS is not set
# CONFIG_LEDS_WM8350 is not set
CONFIG_LEDS_DA903X=y
# CONFIG_LEDS_DA9052 is not set
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2606MVV=y
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_INTEL_SS4200 is not set
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_MC13783=y
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX8997=y
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=y
CONFIG_LEDS_IS31FL319X=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM36274=y
CONFIG_LEDS_TPS6105X=y

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AS3645A=y
# CONFIG_LEDS_LM3601X is not set
CONFIG_LEDS_MT6370_FLASH=y
# CONFIG_LEDS_RT8515 is not set
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_MTD is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y
CONFIG_A11Y_BRAILLE_CONSOLE=y

#
# Speakup console speech
#
# CONFIG_SPEAKUP is not set
# end of Speakup console speech

# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=y
CONFIG_RTC_DRV_88PM80X=y
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=y
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=y
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_LP8788=y
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8907 is not set
CONFIG_RTC_DRV_MAX8997=y
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
CONFIG_RTC_DRV_X1205=y
# CONFIG_RTC_DRV_PCF8523 is not set
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=y
CONFIG_RTC_DRV_M41T80=y
# CONFIG_RTC_DRV_M41T80_WDT is not set
CONFIG_RTC_DRV_BQ32K=y
# CONFIG_RTC_DRV_PALMAS is not set
CONFIG_RTC_DRV_TPS6586X=y
CONFIG_RTC_DRV_RC5T583=y
CONFIG_RTC_DRV_S35390A=y
CONFIG_RTC_DRV_FM3130=y
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8581=y
CONFIG_RTC_DRV_RX8025=y
CONFIG_RTC_DRV_EM3027=y
CONFIG_RTC_DRV_RV3028=y
CONFIG_RTC_DRV_RV3032=y
# CONFIG_RTC_DRV_RV8803 is not set
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=y
# CONFIG_RTC_DRV_RV3029_HWMON is not set
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
# CONFIG_RTC_DRV_DS1286 is not set
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=y
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
# CONFIG_RTC_DRV_DS1742 is not set
CONFIG_RTC_DRV_DS2404=y
# CONFIG_RTC_DRV_DA9052 is not set
# CONFIG_RTC_DRV_DA9055 is not set
# CONFIG_RTC_DRV_DA9063 is not set
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=y
CONFIG_RTC_DRV_M48T35=y
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=y
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
CONFIG_RTC_DRV_WM831X=y
CONFIG_RTC_DRV_WM8350=y
CONFIG_RTC_DRV_PCF50633=y

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_FTRTC010=y
CONFIG_RTC_DRV_MC13XXX=y
CONFIG_RTC_DRV_MT6397=y

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
# CONFIG_UIO is not set
CONFIG_VFIO=y
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
# CONFIG_VHOST_SCSI is not set
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
# CONFIG_COMEDI_BOND is not set
# CONFIG_COMEDI_TEST is not set
# CONFIG_COMEDI_PARPORT is not set
# CONFIG_COMEDI_SSV_DNP is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
# CONFIG_COMEDI_KCOMEDILIB is not set
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=y
CONFIG_MLXREG_IO=y
CONFIG_MLXREG_LC=y
CONFIG_NVSW_SN2201=y
CONFIG_SURFACE_PLATFORMS=y
CONFIG_SURFACE_3_POWER_OPREGION=y
CONFIG_SURFACE_GPE=y
CONFIG_SURFACE_HOTPLUG=y
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=y
CONFIG_WMI_BMOF=y
CONFIG_HUAWEI_WMI=y
CONFIG_MXM_WMI=y
CONFIG_NVIDIA_WMI_EC_BACKLIGHT=y
CONFIG_XIAOMI_WMI=y
CONFIG_GIGABYTE_WMI=y
# CONFIG_YOGABOOK_WMI is not set
# CONFIG_ACERHDF is not set
# CONFIG_ACER_WIRELESS is not set
# CONFIG_ACER_WMI is not set
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_PMC is not set
CONFIG_ADV_SWBUTTON=y
# CONFIG_APPLE_GMUX is not set
# CONFIG_ASUS_LAPTOP is not set
CONFIG_ASUS_WIRELESS=y
CONFIG_X86_PLATFORM_DRIVERS_DELL=y
CONFIG_ALIENWARE_WMI=y
CONFIG_DCDBAS=y
CONFIG_DELL_LAPTOP=y
# CONFIG_DELL_RBU is not set
CONFIG_DELL_SMBIOS=y
# CONFIG_DELL_SMBIOS_WMI is not set
CONFIG_DELL_SMBIOS_SMM=y
CONFIG_DELL_SMO8800=y
CONFIG_DELL_WMI=y
# CONFIG_DELL_WMI_PRIVACY is not set
# CONFIG_DELL_WMI_AIO is not set
CONFIG_DELL_WMI_DESCRIPTOR=y
CONFIG_DELL_WMI_DDV=y
CONFIG_DELL_WMI_LED=y
# CONFIG_DELL_WMI_SYSMAN is not set
CONFIG_FUJITSU_LAPTOP=y
CONFIG_FUJITSU_TABLET=y
CONFIG_GPD_POCKET_FAN=y
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
CONFIG_WIRELESS_HOTKEY=y
# CONFIG_IBM_RTL is not set
CONFIG_LENOVO_YMC=y
CONFIG_SENSORS_HDAPS=y
CONFIG_THINKPAD_ACPI=y
# CONFIG_THINKPAD_ACPI_ALSA_SUPPORT is not set
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
CONFIG_INTEL_ATOMISP2_PDX86=y
CONFIG_INTEL_ATOMISP2_LED=y
CONFIG_INTEL_SAR_INT1092=y
CONFIG_INTEL_SKL_INT3472=y
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
# CONFIG_INTEL_WMI_THUNDERBOLT is not set
CONFIG_INTEL_HID_EVENT=y
CONFIG_INTEL_VBTN=y
CONFIG_INTEL_INT0002_VGPIO=y
# CONFIG_INTEL_MRFLD_PWRBTN is not set
CONFIG_INTEL_PUNIT_IPC=y
CONFIG_INTEL_RST=y
CONFIG_INTEL_SMARTCONNECT=y
# CONFIG_INTEL_VSEC is not set
CONFIG_MSI_EC=y
# CONFIG_MSI_WMI is not set
# CONFIG_PCENGINES_APU2 is not set
CONFIG_BARCO_P50_GPIO=y
CONFIG_SAMSUNG_LAPTOP=y
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
CONFIG_TOSHIBA_HAPS=y
CONFIG_TOSHIBA_WMI=y
# CONFIG_ACPI_CMPC is not set
CONFIG_LG_LAPTOP=y
CONFIG_PANASONIC_LAPTOP=y
CONFIG_SYSTEM76_ACPI=y
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_MLX_PLATFORM is not set
# CONFIG_INTEL_IPS is not set
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
# CONFIG_INTEL_SCU_PCI is not set
CONFIG_INTEL_SCU_PLATFORM=y
CONFIG_INTEL_SCU_IPC_UTIL=y
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_SI5341=y
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_TPS68470=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
CONFIG_COMMON_CLK_PALMAS=y
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=y
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

CONFIG_IOMMU_DEBUGFS=y
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_IOMMUFD=y
# CONFIG_IOMMUFD_TEST is not set
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#
# CONFIG_SOUNDWIRE_AMD is not set
# CONFIG_SOUNDWIRE_INTEL is not set
CONFIG_SOUNDWIRE_QCOM=y

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

CONFIG_WPCM450_SOC=y

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=y
# CONFIG_EXTCON_GPIO is not set
CONFIG_EXTCON_INTEL_INT3496=y
CONFIG_EXTCON_INTEL_MRFLD=y
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_FPGA_DFL_EMIF=y
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_MADERA_IRQ=y
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_IDLE_INJECT=y
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
# CONFIG_MCB_LPC is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
# CONFIG_NVMEM_SYSFS is not set

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
# end of Layout Types

CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_SPMI_SDAM=y

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=y
CONFIG_STM_SOURCE_CONSOLE=y
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_STM_SOURCE_FTRACE=y
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_PCI is not set
# CONFIG_INTEL_TH_ACPI is not set
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_STH=y
# CONFIG_INTEL_TH_MSU is not set
CONFIG_INTEL_TH_PTI=y
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=y
CONFIG_FPGA_DFL=y
CONFIG_FPGA_DFL_FME=y
CONFIG_FPGA_DFL_FME_MGR=y
# CONFIG_FPGA_DFL_FME_BRIDGE is not set
CONFIG_FPGA_DFL_FME_REGION=y
CONFIG_FPGA_DFL_AFU=y
# CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
# CONFIG_FPGA_DFL_PCI is not set
CONFIG_FPGA_M10_BMC_SEC_UPDATE=y
CONFIG_TEE=y
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
CONFIG_COUNTER=y
# CONFIG_INTEL_QEP is not set
CONFIG_INTERRUPT_CNT=y
CONFIG_MOST=y
# CONFIG_MOST_CDEV is not set
CONFIG_MOST_SND=y
CONFIG_PECI=y
CONFIG_PECI_CPU=y
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
# CONFIG_EXT4_USE_FOR_EXT2 is not set
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
CONFIG_REISERFS_CHECK=y
# CONFIG_REISERFS_PROC_INFO is not set
CONFIG_REISERFS_FS_XATTR=y
# CONFIG_REISERFS_FS_POSIX_ACL is not set
# CONFIG_REISERFS_FS_SECURITY is not set
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_ZONEFS_FS=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=y
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
CONFIG_ADFS_FS=y
CONFIG_ADFS_FS_RW=y
CONFIG_AFFS_FS=y
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
CONFIG_BEFS_FS=y
# CONFIG_BEFS_DEBUG is not set
CONFIG_BFS_FS=y
CONFIG_EFS_FS=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_FS_WBUF_VERIFY=y
CONFIG_JFFS2_SUMMARY=y
CONFIG_JFFS2_FS_XATTR=y
# CONFIG_JFFS2_FS_POSIX_ACL is not set
# CONFIG_JFFS2_FS_SECURITY is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
# CONFIG_UBIFS_FS_LZO is not set
# CONFIG_UBIFS_FS_ZLIB is not set
# CONFIG_UBIFS_FS_ZSTD is not set
CONFIG_UBIFS_ATIME_SUPPORT=y
# CONFIG_UBIFS_FS_XATTR is not set
# CONFIG_UBIFS_FS_AUTHENTICATION is not set
# CONFIG_CRAMFS is not set
CONFIG_SQUASHFS=y
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
CONFIG_SQUASHFS_DECOMP_MULTI=y
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT=y
CONFIG_SQUASHFS_MOUNT_DECOMP_THREADS=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
# CONFIG_SQUASHFS_LZO is not set
# CONFIG_SQUASHFS_XZ is not set
CONFIG_SQUASHFS_ZSTD=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
CONFIG_MINIX_FS=y
# CONFIG_OMFS_FS is not set
CONFIG_HPFS_FS=y
# CONFIG_QNX4FS_FS is not set
CONFIG_QNX6FS_FS=y
CONFIG_QNX6FS_DEBUG=y
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
CONFIG_PSTORE_LZ4HC_COMPRESS=y
CONFIG_PSTORE_842_COMPRESS=y
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lz4hc"
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_RAM=y
CONFIG_PSTORE_ZONE=y
CONFIG_PSTORE_BLK=y
CONFIG_PSTORE_BLK_BLKDEV=""
CONFIG_PSTORE_BLK_KMSG_SIZE=64
CONFIG_PSTORE_BLK_MAX_REASON=2
CONFIG_PSTORE_BLK_CONSOLE_SIZE=64
CONFIG_SYSV_FS=y
# CONFIG_UFS_FS is not set
CONFIG_EROFS_FS=y
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
CONFIG_EROFS_FS_POSIX_ACL=y
CONFIG_EROFS_FS_SECURITY=y
CONFIG_EROFS_FS_ZIP=y
# CONFIG_EROFS_FS_ZIP_LZMA is not set
# CONFIG_EROFS_FS_PCPU_KTHREAD is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_RPCSEC_GSS_KRB5=y
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_BIG_KEYS is not set
# CONFIG_TRUSTED_KEYS is not set
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
CONFIG_SECURITY_LOADPIN=y
# CONFIG_SECURITY_LOADPIN_ENFORCE is not set
CONFIG_SECURITY_LOADPIN_VERITY=y
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
# CONFIG_IMA_NG_TEMPLATE is not set
CONFIG_IMA_SIG_TEMPLATE=y
CONFIG_IMA_DEFAULT_TEMPLATE="ima-sig"
# CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
CONFIG_IMA_DEFAULT_HASH_SHA256=y
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
# CONFIG_IMA_DEFAULT_HASH_SM3 is not set
CONFIG_IMA_DEFAULT_HASH="sha256"
# CONFIG_IMA_WRITE_POLICY is not set
CONFIG_IMA_READ_POLICY=y
# CONFIG_IMA_APPRAISE is not set
CONFIG_IMA_DISABLE_HTABLE=y
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=y
CONFIG_ASYNC_MEMCPY=y
CONFIG_ASYNC_XOR=y
CONFIG_ASYNC_PQ=y
CONFIG_ASYNC_RAID6_RECOV=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ARIA=y
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_SERPENT_SSE2_586=y
CONFIG_CRYPTO_TWOFISH_586=y
# CONFIG_CRYPTO_CRC32C_INTEL is not set
CONFIG_CRYPTO_CRC32_PCLMUL=y
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=y
# CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
CONFIG_CRYPTO_DEV_PADLOCK_SHA=y
# CONFIG_CRYPTO_DEV_GEODE is not set
# CONFIG_CRYPTO_DEV_HIFN_795X is not set
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
# CONFIG_CRYPTO_DEV_CCP is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_SAFEXCEL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
# CONFIG_CRC4 is not set
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_INTERVAL_TREE=y
CONFIG_INTERVAL_TREE_SPAN_ITER=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
CONFIG_CMA_SIZE_SEL_MAX=y
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
# CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_DEBUG_KMAP_LOCAL=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_KMSAN_COMPILER=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_NMI_CHECK_CPU=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
# CONFIG_DEBUG_KOBJECT_RELEASE is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_USER_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
CONFIG_FAIL_FUTEX=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
CONFIG_FAIL_MMC_REQUEST=y
# CONFIG_FAULT_INJECTION_CONFIGFS is not set
# CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_TEST_DHRY=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--eRvIaNMHa3fk5o5F
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys='rootfs
compiler
force_latest_head'
	export queue='vip'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='linux-devel/devel-hourly-20230515-172405'
	export commit='82ef6a95c29b55f39cf65ac6a29926fca6025161'
	export kconfig='i386-randconfig-i093-20230515'
	export repeat_to=2
	export nr_vm=300
	export submit_id='6465bf0982011ea8ed6610b8'
	export job_file='/lkp/jobs/scheduled/vm-meta-249/boot-1-debian-11.1-i386-20220923.cgz-82ef6a95c29b55f39cf65ac6a29926fca6025161-20230518-895213-10h2qwf-0.yaml'
	export id='cac15ff443a4f9d9a6fa6019617522a432e81a65'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='clang-14'
	export force_latest_head=1
	export enqueue_time='2023-05-18 14:00:41 +0800'
	export _id='6465bf0982011ea8ed6610b8'
	export _rt='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i093-20230515/clang-14/82ef6a95c29b55f39cf65ac6a29926fca6025161'
	export user='lkp'
	export meta_host='vm-meta-249'
	export LKP_SERVER='internal-lkp-server'
	export kernel='/pkg/linux/i386-randconfig-i093-20230515/clang-14/82ef6a95c29b55f39cf65ac6a29926fca6025161/vmlinuz-6.4.0-rc1-00152-g82ef6a95c29b'
	export result_root='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i093-20230515/clang-14/82ef6a95c29b55f39cf65ac6a29926fca6025161/0'
	export dequeue_time='2023-05-18 14:01:07 +0800'
	export scheduler_version='/lkp/lkp/.src-20230517-200353'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i093-20230515/clang-14/82ef6a95c29b55f39cf65ac6a29926fca6025161/0
BOOT_IMAGE=/pkg/linux/i386-randconfig-i093-20230515/clang-14/82ef6a95c29b55f39cf65ac6a29926fca6025161/vmlinuz-6.4.0-rc1-00152-g82ef6a95c29b
branch=linux-devel/devel-hourly-20230515-172405
job=/lkp/jobs/scheduled/vm-meta-249/boot-1-debian-11.1-i386-20220923.cgz-82ef6a95c29b55f39cf65ac6a29926fca6025161-20230518-895213-10h2qwf-0.yaml
user=lkp
ARCH=i386
kconfig=i386-randconfig-i093-20230515
commit=82ef6a95c29b55f39cf65ac6a29926fca6025161
initcall_debug
mem=4G
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/i386-randconfig-i093-20230515/clang-14/82ef6a95c29b55f39cf65ac6a29926fca6025161/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export job_initrd='/lkp/jobs/scheduled/vm-meta-249/boot-1-debian-11.1-i386-20220923.cgz-82ef6a95c29b55f39cf65ac6a29926fca6025161-20230518-895213-10h2qwf-0.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper kmemleak
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper kmemleak

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--eRvIaNMHa3fk5o5F
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--eRvIaNMHa3fk5o5F--
