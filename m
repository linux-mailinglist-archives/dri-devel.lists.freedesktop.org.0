Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61E68E72D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 05:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24410E6BB;
	Wed,  8 Feb 2023 04:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F7E10E6BB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 04:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675830795; x=1707366795;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4QmZhzMksrA9ELa12kahXjzF01hlOR3zSsKZP9KJObY=;
 b=RKsrH2CRmRUlJh3UpzxyME/h+H/xOm8wlRL8L1DJUOuwsederj3IiwvH
 lRyQcELjtLyTTcOpXDmLCkCrZ2z3WJSE7R5kCTke2gkfS2hiRm3DW3Olw
 yBgEq+cSRB44us7GJuQ5vbwfAQhW5YAnkDzLGkvhM2UtlnWq0TPT52vqn
 UQWy7aAVuR5qK66vmqt0VowY16Kdtn1QSouUljZ4As3U01EQbCdkRQkYD
 7WsFESKCKUjF0HBS81H00zgmcBAafFYMLqQefg7KSUcLSTrEyOGd9HZlE
 /H9Wkxl1vaheVXF5aCg+MtWBktQho6SnJ5OFCUBJZWDV15MbU26PXLskl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="392106071"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
 d="xz'341?scan'341,208,341";a="392106071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 20:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="730709636"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
 d="xz'341?scan'341,208,341";a="730709636"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 07 Feb 2023 20:33:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 20:33:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 20:33:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 20:33:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 7 Feb 2023 20:33:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCix6k5gHwKSRAGdsRlOOkb3Jwo+cn/KJunimoSOhvJgx5dRa38xWySEGe4LUGNOWCrc3XNfHooKca96kEucGgMJIYEyE0qol8YfrwkwiJWMXlwHxqvs1IvhbR13O1FyVzxwc1ZFpt3+CIqrZ8/8KjwNPoV/LzczvlFwxc5vlHKMOSf3ikn6Rd46m+TFMRO6YBughsqaTnBuFUlLgCIUays5GPe4rHRG+gCKu8Ywp+vxeS3k7lHKPLAaNNJDCI6zq5UZSk38pSms8b1ldgOkoN98z28qkgcJd7KwBOOvSCTMwqGwgv1zxX9p0ZW4atA2emgRNw9PgDLBW+t/fwq5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEBwHFC0l5hdQBTku8piJAEbLLchmt2KGIQp4Zk1CDY=;
 b=W6daWj9kMIgy7vo68vxUHsXeaY3KwSPjK8Lgn/3+aXaL6j21eTdBvW2TSRJV4h48uZQjIsrE4U9tJ+kuffrjykqgSUpipbOuGVXIhhQkfu0FYubBUXl3w5JloMGb/SD8AjdE7/WVFe1xjDUtOBTt/RYj3k6BTtvBl4mHbAZWHtXkUNnKBDMVnpoQZCl2DRNkIMJcLrs0DDCsJZjcr3bG6mUF+MdNNkj4KAKwG6y4jnI1NEjytVDK59ks3CyZEHzEc1v3CTq859r+LVM+jD3F5V8RfOrLCdOup8wz0FSF6fMjgQaQZw2/agh1aATr4Dymxlh1pzoxjtMCqH+ykrUZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Wed, 8 Feb
 2023 04:33:08 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e783:1ee2:e6e2:e1e4]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::e783:1ee2:e6e2:e1e4%7]) with mapi id 15.20.6064.035; Wed, 8 Feb 2023
 04:33:08 +0000
Date: Wed, 8 Feb 2023 12:32:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [drm-misc:drm-misc-next] [drm/ttm]  1802537820:
 WARNING:at_drivers/gpu/drm/drm_gem_vram_helper.c:#drm_gem_vram_offset
Message-ID: <202302081038.984b8c1-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="idMweqa4vLs6WIRZ"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 68695216-985d-48af-b7a4-08db098d936a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atNuoDAyisX9UCoQ9dugH5V01zR6Ol69y9sJdTFvbb1Z9dvmd+pCbDa+uRRspm1LCkCGXCmRNKDjL9T0BXJj+mSrX0550KCFupD7U9eQHVraorNQX5wLeoWexNIUnzrK1zktcw7a7/ZL2GwGzzs052nFgEeqiBmz05629+9NzFBJ96QGjklWPi/rltMPyHqcE3dtwlyWKQJX9YkPtiH29esqBtxBIGTfUVPPXW5c8xt8KTBBOhyW+fjpbqMAziqNAMdsozBvTgtJvRPb1Wszxo0mAZ+Oa7quPLvcV82YIaddL74H5jLSEANvvThgGWFZIMNsutDng7rBLnRwosJn/jDlenE5hx87E9NR79P/jYutPucSOyIgA8SeBOex991v4pl/AOutAO33U/X6zzPQSkRgBRGsO4s8JrQMLQc/Z1gqrizfarSGo3w/WgFe7MVckuRKS/Zmuk/GQifE9fNp68PKkDoF/YWDhV1n/8lsvDeEhfe72vuAFjuka9SsOXoz0af0bMFtFopp+/SOzf8LxMYPtQtFo+2F7xswI9Omt4k26FhKwbDazGHWt3ESafWdvKka/iQ4dlCOMiT7FYgpBB8N/kBTil79iugPbQB7mEm/R0zFeZGvrmEfZ3gZVtPw2ZIOVamNn4yaFVaYiBhIAMQOy1DSB9mMTBRaEOSyA3tlYGQJAyJ0ATo97aBnnFJEtBM1ULuZr3sC0vkzCR0JmT8f/AoVYecWbZOBYvYo5Y/R5fNCHKcY3IjQkrrg8VydWBCpgIQ5hjlEGQQT859mCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(478600001)(6486002)(2616005)(36756003)(66556008)(966005)(2906002)(6666004)(6916009)(66476007)(107886003)(45080400002)(66946007)(4326008)(44144004)(6506007)(38100700002)(1076003)(26005)(83380400001)(186003)(235185007)(41300700001)(8936002)(54906003)(8676002)(6512007)(5660300002)(316002)(86362001)(82960400001)(2700100001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vn81iO2fcZbLrV6hm9WnbRUg9y3d2WrwAcgAoU3IdlcT8a1QkXxuK6+U37d/?=
 =?us-ascii?Q?m9mwRr76snRK6Hn2LOeBLgwcRi7CExoLS79/ZG8yPnIlo96Pd2OID1YA8sOs?=
 =?us-ascii?Q?pjogoZvBSBo7NR1k9yfR6/H4XwVaSjx/CFozcbqDcLn/ZGDRUoD2LNUfE8t5?=
 =?us-ascii?Q?NqtJe0I3ic7qnp4drbD0ynaSu9v2dxskQKedEZ/TIOgw5M7lX+tPoz9WcjL5?=
 =?us-ascii?Q?n9XhJMg1QGnA8RSV3fQHkCjlnm4YJBtTObhOnYq8ULqLzOS9Yem+l2afmfDj?=
 =?us-ascii?Q?5h07lhsC9RUwsafeBoRmKV3jSGQJ8Kc5WtpkxWrRO8cW4haiLx1rYcDme31z?=
 =?us-ascii?Q?7uuAEvHRQPn+hTuLez1+59BwFRc8NYXB7wHMKOkcayeusOpUhZ9xpi7zRZSs?=
 =?us-ascii?Q?h/eGZBV55WaAiPWZERIukKl2xdTfgzBAxvqKN39tFMg6DVtlDjwJjknFszOK?=
 =?us-ascii?Q?a/Z4NVfl52Am6ccuTlgYEStIpI0ZqSSjGsUXGkhO5JkyKzcHmFQIImz2f99A?=
 =?us-ascii?Q?4hnWGcPYZeI5675Lto3gMFGRQm0dQd2yLaSK/s4kpKfxFKmj8w90RF67hFdC?=
 =?us-ascii?Q?oSvPoc2YOfN+Cf/WHIvoCipGj+JG1ffRH9TaEziDgnk1gX8AwPLFYWv7GcxO?=
 =?us-ascii?Q?tAIADLEJJV4zXvXeGLuaBkuSGvMQVFAjIs6fXpSKFMUfw9KsBEblwNA3lWLd?=
 =?us-ascii?Q?kq0B8UF35l/gKu9DiWzaNYn8xYiAgIZ5TScrGlL+VQ0mzSmbYJnFdMJet0n3?=
 =?us-ascii?Q?VShj2SBhk+662bdW7/+eURDw4/fdmH1DzvIESqj7ILYiYW4Ytd+Xn6vw/Arq?=
 =?us-ascii?Q?gOLeQVJPU9nwn0ZhJkjKp4fQU17ihoUa0tS2uSHNmFIEQHa+C0P2c0iJL7BC?=
 =?us-ascii?Q?WkiQ1fU7xsHjNCzVozyf+NP+dr/03SdHiGAAfEET0K5OGfPk0c5+z81BzCb5?=
 =?us-ascii?Q?d0O4K1otqC/KhLlMqriCq3Ermnx5nFam4BtqZRvu5/gouHBLIpwcm3OgpyK5?=
 =?us-ascii?Q?H8DsFi3qBpU+kDLR9zCPD14Sqmrh1CU1yaEJVEgCpvZYEgeMqX95DbiMw3Bv?=
 =?us-ascii?Q?6qU7b+a+1Eyp3R4l8TU1NJHHiaC7Ysr1+2YPies6MuMxxPq2GR5bjW/hTMdq?=
 =?us-ascii?Q?Hjsis2M8QQnEDapFofXhi7LP061+eArOIuZ6oOdjxDYK9gdKtc3N31UPoOHE?=
 =?us-ascii?Q?ixRA0omcQCy+ECE/JB601soo0txkPsfjl1rUR8rLHI0hoOOsG2Ui4htBrXZJ?=
 =?us-ascii?Q?Njg/7gxXznncHjuVkLgOSiaIM818nqSQPQerFf5kckzGAMpvn16gMAH8i7rP?=
 =?us-ascii?Q?3k8GAyJpp1Ulc1Azv5B0UbHiElSrls/thm3u4K9hSZMzs1Sc8SIdNhBg3bhn?=
 =?us-ascii?Q?VvgiE5vRnJccaksrDJD8WGMeOHl22pIBbwZ8fsNUd54exFnmCOdCqjBJ8jlo?=
 =?us-ascii?Q?6vvgc4LXbhOes2HXsKtfB1Ui3P0YNV/eofd0C9JckcrrYFVLKfsujBC4bmik?=
 =?us-ascii?Q?Lrn/BHfsAHUAVntEwBm9fYrteD8CslEHepE68tUq4DKMsk2kUCb4o4zhtltL?=
 =?us-ascii?Q?fs/fwMSVg4frDlu+MxLusWedPyA2J6vEZaMwjpdgIPGXYsqZRl6rgzfDDLvn?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68695216-985d-48af-b7a4-08db098d936a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 04:33:07.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/C3ohFocJr9LtPkRDFC9yqoRxU/BRtAKxGl+rD7heYGIC9NwOGfUINOgO7WHF53mE5IQaC3HVDmzIb6nnJbyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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
Cc: oe-lkp@lists.linux.dev, Nirmoy Das <nirmoy.das@intel.com>, lkp@intel.com,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--idMweqa4vLs6WIRZ
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Greeting,

FYI, we noticed WARNING:at_drivers/gpu/drm/drm_gem_vram_helper.c:#drm_gem_vram_offset due to commit (built with gcc-11):

commit: 1802537820389183dfcd814e0f6a60d1496a75ef ("drm/ttm: stop allocating dummy resources during BO creation")
git://anongit.freedesktop.org/drm/drm-misc drm-misc-next

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):


If you fix the issue, kindly add following tag
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Link: https://lore.kernel.org/oe-lkp/202302081038.984b8c1-oliver.sang@intel.com


[   25.994992][    T1] ------------[ cut here ]------------
[ 25.995050][ T1] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem_vram_helper.c:255 drm_gem_vram_offset (??:?) 
[   25.995080][    T1] Modules linked in:
[   25.995100][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T  6.2.0-rc6-01191-g180253782038 #1 a8db67375c3ac749313dafaec43f39836e38fae9
[   25.995117][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[ 25.995128][ T1] RIP: 0010:drm_gem_vram_offset (??:?) 
[ 25.995144][ T1] Code: 02 00 00 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 80 3c 02 00 74 05 e8 7f 1f eb fe 48 8b 9b 20 02 00 00 48 85 db 75 06 <0f> 0b 31 c0 eb 4b 48 8d 7b 10 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a
All code
========
   0:	02 00                	add    (%rax),%al
   2:	00 b8 ff ff 37 00    	add    %bh,0x37ffff(%rax)
   8:	48 89 fa             	mov    %rdi,%rdx
   b:	48 c1 e0 2a          	shl    $0x2a,%rax
   f:	48 c1 ea 03          	shr    $0x3,%rdx
  13:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  17:	74 05                	je     0x1e
  19:	e8 7f 1f eb fe       	callq  0xfffffffffeeb1f9d
  1e:	48 8b 9b 20 02 00 00 	mov    0x220(%rbx),%rbx
  25:	48 85 db             	test   %rbx,%rbx
  28:	75 06                	jne    0x30
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	31 c0                	xor    %eax,%eax
  2e:	eb 4b                	jmp    0x7b
  30:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
  34:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  39:	48 89 fa             	mov    %rdi,%rdx
  3c:	48 c1 e0 2a          	shl    $0x2a,%rax

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	31 c0                	xor    %eax,%eax
   4:	eb 4b                	jmp    0x51
   6:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   a:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
   f:	48 89 fa             	mov    %rdi,%rdx
  12:	48 c1 e0 2a          	shl    $0x2a,%rax
[   25.995156][    T1] RSP: 0000:ffffc9000001f028 EFLAGS: 00210246
[   25.995174][    T1] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   25.995186][    T1] RDX: 1ffff11026dee544 RSI: ffff8881372d4b10 RDI: ffff888136f72a20
[   25.995196][    T1] RBP: ffffc9000001f030 R08: 0000000000000000 R09: 0000000000000000
[   25.995206][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881372d4b00
[   25.995215][    T1] R13: ffff888136e9ee00 R14: ffff888136f4a060 R15: 0000000000000500
[   25.995225][    T1] FS:  0000000000000000(0000) GS:ffff8883aee00000(0000) knlGS:0000000000000000
[   25.995236][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   25.995247][    T1] CR2: 00000000f7fa1cd4 CR3: 0000000006015000 CR4: 00000000000406b0
[   25.995262][    T1] Call Trace:
[   25.995271][    T1]  <TASK>
[ 25.995287][ T1] bochs_plane_update (bochs.c:?) 
[ 25.995308][ T1] ? rcu_read_lock_bh_held (??:?) 
[ 25.995337][ T1] ? bochs_pci_probe (bochs.c:?) 
[ 25.995352][ T1] ? srcu_read_unlock (blk-mq.c:?) 
[ 25.995396][ T1] bochs_pipe_enable (bochs.c:?) 
[ 25.995410][ T1] ? drm_dev_printk (??:?) 
[ 25.995435][ T1] ? bochs_pipe_update (bochs.c:?) 
[ 25.995454][ T1] ? bochs_plane_update (bochs.c:?) 
[ 25.995473][ T1] ? bochs_pipe_update (bochs.c:?) 
[ 25.995487][ T1] ? bochs_pipe_update (bochs.c:?) 
[ 25.995507][ T1] drm_simple_kms_crtc_enable (drm_simple_kms_helper.c:?) 
[ 25.995533][ T1] drm_atomic_helper_commit_modeset_enables (??:?) 
[ 25.995570][ T1] drm_atomic_helper_commit_tail (??:?) 
[ 25.995591][ T1] commit_tail (drm_atomic_helper.c:?) 
[ 25.995631][ T1] drm_atomic_helper_commit (??:?) 
[ 25.995652][ T1] ? commit_work (??:?) 
[ 25.995670][ T1] drm_atomic_commit (??:?) 
[ 25.995689][ T1] ? drm_atomic_nonblocking_commit (??:?) 
[ 25.995703][ T1] ? __drm_atomic_helper_set_config (??:?) 
[ 25.995716][ T1] ? malformed_message+0xe0/0xe0 
[ 25.995741][ T1] ? update_output_state (??:?) 
[ 25.995757][ T1] ? malformed_message+0xe0/0xe0 
[ 25.995804][ T1] drm_client_modeset_commit_atomic (drm_client_modeset.c:?) 
[ 25.995836][ T1] ? kmalloc_array (core.c:?) 
[ 25.995894][ T1] ? mutex_trylock (mutex.c:?) 
[ 25.995910][ T1] ? mark_lock+0x67/0x227 
[ 25.995951][ T1] ? drm_fb_helper_lastclose (??:?) 
[ 25.995966][ T1] drm_client_modeset_commit_locked (??:?) 
[ 25.995988][ T1] drm_client_modeset_commit (??:?) 
[ 25.996008][ T1] __drm_fb_helper_restore_fbdev_mode_unlocked (drm_fb_helper.c:?) 
[ 25.996032][ T1] drm_fb_helper_set_par (??:?) 
[ 25.996054][ T1] set_con2fb_map (fbcon.c:?) 
[ 25.996090][ T1] do_fb_registered (fbcon.c:?) 
[ 25.996119][ T1] fbcon_fb_registered (??:?) 
[ 25.996138][ T1] do_register_framebuffer (fbmem.c:?) 
[ 25.996158][ T1] ? get_fb_info+0xaa/0xaa 
[ 25.996218][ T1] register_framebuffer (??:?) 
[ 25.996241][ T1] __drm_fb_helper_initial_config_and_unlock (drm_fb_helper.c:?) 
[ 25.996268][ T1] ? __drm_fb_helper_find_sizes (drm_fb_helper.c:?) 
[ 25.996321][ T1] drm_fb_helper_initial_config (??:?) 
[ 25.996341][ T1] drm_fbdev_client_hotplug (drm_fbdev_generic.c:?) 
[ 25.996363][ T1] drm_fbdev_generic_setup (??:?) 
[ 25.996389][ T1] bochs_pci_probe (bochs.c:?) 
[ 25.996413][ T1] ? bochs_hw_init (bochs.c:?) 
[ 25.996429][ T1] ? trace_hardirqs_on (??:?) 
[ 25.996456][ T1] ? bochs_hw_init (bochs.c:?) 
[ 25.996477][ T1] local_pci_probe (pci-driver.c:?) 
[ 25.996507][ T1] pci_call_probe (pci-driver.c:?) 
[ 25.996520][ T1] ? rcu_read_lock_bh_held (??:?) 
[ 25.996543][ T1] ? local_pci_probe (pci-driver.c:?) 
[ 25.996563][ T1] ? __kasan_check_read (??:?) 
[ 25.996830][ T1] ? pci_match_id (??:?) 
[ 25.996854][ T1] ? pci_match_device (pci-driver.c:?) 
[ 25.996882][ T1] pci_device_probe (pci-driver.c:?) 
[ 25.996904][ T1] really_probe (dd.c:?) 
[ 25.996933][ T1] __driver_probe_device (dd.c:?) 
[ 25.996955][ T1] ? __device_attach_driver (dd.c:?) 
[ 25.996970][ T1] driver_probe_device (dd.c:?) 
[ 25.996992][ T1] __driver_attach (dd.c:?) 
[ 25.997014][ T1] ? __device_attach_driver (dd.c:?) 
[ 25.997030][ T1] bus_for_each_dev (??:?) 
[ 25.997050][ T1] ? next_device (core.c:?) 
[ 25.997069][ T1] ? do_raw_spin_unlock (??:?) 
[ 25.997107][ T1] driver_attach (??:?) 
[ 25.997127][ T1] bus_add_driver (??:?) 
[ 25.997158][ T1] driver_register (??:?) 
[ 25.997182][ T1] __pci_register_driver (??:?) 
[ 25.997202][ T1] ? etnaviv_init (bochs.c:?) 
[ 25.997221][ T1] bochs_pci_driver_init (bochs.c:?) 
[ 25.997240][ T1] do_one_initcall (??:?) 
[ 25.997260][ T1] ? rcu_lock_acquire (??:?) 
[ 25.997277][ T1] ? lock_is_held (signal.c:?) 
[ 25.997293][ T1] ? rcu_read_lock_sched_held (??:?) 
[ 25.997311][ T1] ? rcu_read_lock_bh_held (??:?) 
[ 25.997325][ T1] ? ____kasan_kmalloc (common.c:?) 
[ 25.997348][ T1] ? __kasan_check_read (??:?) 
[ 25.997376][ T1] do_initcalls (main.c:?) 
[ 25.997419][ T1] kernel_init_freeable (main.c:?) 
[ 25.997434][ T1] ? rest_init (main.c:?) 
[ 25.997461][ T1] kernel_init (main.c:?) 
[ 25.997481][ T1] ret_from_fork (??:?) 
[   25.997537][    T1]  </TASK>
[   25.997547][    T1] irq event stamp: 177845
[ 25.997555][ T1] hardirqs last enabled at (177851): console_trylock_spinning (printk.c:?) 
[ 25.997573][ T1] hardirqs last disabled at (177856): console_trylock_spinning (printk.c:?) 
[ 25.997589][ T1] softirqs last enabled at (176444): __do_softirq (??:?) 
[ 25.997608][ T1] softirqs last disabled at (176437): __irq_exit_rcu (softirq.c:?) 
[   25.997623][    T1] ---[ end trace 0000000000000000 ]---
[   26.013462][   T14] general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN
[   26.013480][   T14] KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
[   26.013490][   T14] CPU: 0 PID: 14 Comm: kworker/0:1 Tainted: G        W       T  6.2.0-rc6-01191-g180253782038 #1 a8db67375c3ac749313dafaec43f39836e38fae9
[   26.013503][   T14] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[   26.013509][   T14] Workqueue: events drm_fb_helper_damage_work
[ 26.013528][ T14] RIP: 0010:ttm_mem_io_reserve (??:?) 
[ 26.013544][ T14] Code: f6 31 ff 45 31 c0 c3 55 b8 ff ff 37 00 48 c1 e0 2a 48 89 e5 41 55 49 89 fd 48 8d 7e 20 48 89 fa 41 54 49 89 f4 48 c1 ea 03 53 <80> 3c 02 00 74 05 e8 05 60 e5 fe 49 83 7c 24 20 00 74 07 31 c0 e9
All code
========
   0:	f6 31                	divb   (%rcx)
   2:	ff 45 31             	incl   0x31(%rbp)
   5:	c0 c3 55             	rol    $0x55,%bl
   8:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
   d:	48 c1 e0 2a          	shl    $0x2a,%rax
  11:	48 89 e5             	mov    %rsp,%rbp
  14:	41 55                	push   %r13


To reproduce:

        # build kernel
	cd linux
	cp config-6.2.0-rc6-01191-g180253782038 .config
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



--idMweqa4vLs6WIRZ
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.2.0-rc6-01191-g180253782038"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.2.0-rc6 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23990
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23990
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
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
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
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
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
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
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
CONFIG_CONTEXT_TRACKING_USER_FORCE=y
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# CONFIG_BPF_JIT is not set
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
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
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
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_NOCB_CPU=y
CONFIG_RCU_NOCB_CPU_DEFAULT_ALL=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
CONFIG_RCU_LAZY=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_PRINTK_INDEX=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
# CONFIG_NUMA_BALANCING is not set
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
# CONFIG_RT_GROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_TIME_NS is not set
# CONFIG_IPC_NS is not set
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
CONFIG_RD_LZ4=y
# CONFIG_RD_ZSTD is not set
# CONFIG_BOOT_CONFIG is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
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
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
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

CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_X2APIC is not set
# CONFIG_X86_MPPARSE is not set
# CONFIG_GOLDFISH is not set
CONFIG_X86_CPU_RESCTRL=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
CONFIG_IOSF_MBI_DEBUG=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_BOOT_VESA_SUPPORT=y
# CONFIG_MAXSMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=512
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
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

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
CONFIG_X86_CPA_STATISTICS=y
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
# CONFIG_X86_64_ACPI_NUMA is not set
# CONFIG_NUMA_EMU is not set
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_MEMORY_PROBE=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
# CONFIG_X86_PMEM_LEGACY is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_EFI=y
# CONFIG_EFI_STUB is not set
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_MAP=y
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_KEXEC=y
# CONFIG_KEXEC_FILE is not set
# CONFIG_CRASH_DUMP is not set
# CONFIG_KEXEC_JUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_COMPAT_VDSO=y
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_STRICT_SIGALTSTACK_SIZE=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
# CONFIG_SUSPEND is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
# CONFIG_HIBERNATION_SNAPSHOT_DEV is not set
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_USERSPACE_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
# CONFIG_PM_WAKELOCKS_GC is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
CONFIG_ACPI_DEBUGGER_USER=y
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=y
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=y
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
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_NFIT is not set
CONFIG_ACPI_NUMA=y
CONFIG_ACPI_HMAT=y
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_TPS68470_PMIC_OPREGION=y
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=y
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_P4_CLOCKMOD=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_CPU_IDLE_GOV_MENU is not set
CONFIG_CPU_IDLE_GOV_TEO=y
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
# CONFIG_PCI_MMCONFIG is not set
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
CONFIG_X86_X32_ABI=y
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

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
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
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
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
CONFIG_GCC_PLUGIN_LATENT_ENTROPY=y
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
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
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_RQ_ALLOC_TIME=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_DEV_THROTTLING is not set
# CONFIG_BLK_WBT is not set
CONFIG_BLK_CGROUP_IOLATENCY=y
CONFIG_BLK_CGROUP_IOCOST=y
CONFIG_BLK_CGROUP_IOPRIO=y
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
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
CONFIG_BFQ_GROUP_IOSCHED=y
CONFIG_BFQ_CGROUP_DEBUG=y
# end of IO Schedulers

CONFIG_PADATA=y
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
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
CONFIG_SLUB_STATS=y
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
# CONFIG_MEMORY_HOTREMOVE is not set
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MAPPING_DIRTY_HELPERS=y
CONFIG_SECRETMEM=y
CONFIG_ANON_VMA_NAME=y
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
# CONFIG_PTE_MARKER_UFFD_WP is not set
CONFIG_LRU_GEN=y
CONFIG_LRU_GEN_ENABLED=y
# CONFIG_LRU_GEN_STATS is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_VADDR=y
# CONFIG_DAMON_PADDR is not set
# CONFIG_DAMON_SYSFS is not set
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
CONFIG_PCIEPORTBUS=y
# CONFIG_HOTPLUG_PCI_PCIE is not set
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=y
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
CONFIG_PCIEASPM_PERFORMANCE=y
CONFIG_PCIE_PME=y
# CONFIG_PCIE_DPC is not set
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_ACPI is not set
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
# CONFIG_VMD is not set

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
CONFIG_PCI_MESON=y
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=y
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
CONFIG_PD6729=y
CONFIG_I82092=y
CONFIG_PCCARD_NONSTATIC=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_HMEM_REPORTING=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_PCI_GENERIC=y
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

# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_DMIID is not set
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_ISCSI_IBFT_FIND=y
CONFIG_ISCSI_IBFT=y
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_BOOTLOADER_CONTROL=y
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
CONFIG_EFI_RCI2_TABLE=y
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
CONFIG_EFI_EMBEDDED_FIRMWARE=y
# end of EFI (Extensible Firmware Interface) Support

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=y
CONFIG_GNSS_MTK_SERIAL=y
# CONFIG_GNSS_SIRF_SERIAL is not set
CONFIG_GNSS_UBX_SERIAL=y
CONFIG_GNSS_USB=y
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
# CONFIG_FTL is not set
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y
CONFIG_SSFDC=y
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
CONFIG_MTD_SWAP=y
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
CONFIG_MTD_PCI=y
# CONFIG_MTD_PCMCIA is not set
CONFIG_MTD_INTEL_VR_NOR=y
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
CONFIG_MTD_PMC551_BUGFIX=y
# CONFIG_MTD_PMC551_DEBUG is not set
# CONFIG_MTD_SLRAM is not set
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
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
# CONFIG_MTD_NAND_DENALI_PCI is not set
CONFIG_MTD_NAND_CAFE=y
CONFIG_MTD_NAND_MXIC=y
# CONFIG_MTD_NAND_GPIO is not set
CONFIG_MTD_NAND_PLATFORM=y
CONFIG_MTD_NAND_ARASAN=y

#
# Misc
#
CONFIG_MTD_SM_COMMON=y
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_MTD_NAND_RICOH=y
# CONFIG_MTD_NAND_DISKONCHIP is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
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
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_UBI_BLOCK is not set
CONFIG_MTD_HYPERBUS=y
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
CONFIG_PARPORT_PC_FIFO=y
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_PC_PCMCIA=y
CONFIG_PARPORT_AX88796=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
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
CONFIG_NVME_COMMON=y
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=y
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_VERBOSE_ERRORS=y
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=y
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=y
CONFIG_NVME_TARGET_FC=y
# CONFIG_NVME_TARGET_TCP is not set
CONFIG_NVME_TARGET_AUTH=y
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_DUMMY_IRQ=y
CONFIG_IBM_ASM=y
CONFIG_PHANTOM=y
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_SMPRO_ERRMON=y
# CONFIG_SMPRO_MISC is not set
CONFIG_HP_ILO=y
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_SRAM is not set
CONFIG_DW_XDATA_PCIE=y
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=y
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=y
# CONFIG_INTEL_MEI_TXE is not set
CONFIG_INTEL_MEI_GSC=y
# CONFIG_INTEL_MEI_HDCP is not set
CONFIG_INTEL_MEI_PXP=y
# CONFIG_VMWARE_VMCI is not set
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
CONFIG_ECHO=y
CONFIG_BCM_VK=y
CONFIG_BCM_VK_TTY=y
CONFIG_MISC_ALCOR_PCI=y
CONFIG_MISC_RTSX_PCI=y
CONFIG_MISC_RTSX_USB=y
CONFIG_PVPANIC=y
CONFIG_PVPANIC_MMIO=y
CONFIG_PVPANIC_PCI=y
CONFIG_GP_PCI1XXXX=y
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
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=y
CONFIG_SCSI_ENCLOSURE=y
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
# CONFIG_SCSI_SAS_HOST_SMP is not set
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
CONFIG_ISCSI_BOOT_SYSFS=y
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
CONFIG_BLK_DEV_3W_XXXX_RAID=y
CONFIG_SCSI_HPSA=y
CONFIG_SCSI_3W_9XXX=y
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=y
# CONFIG_SCSI_AIC7XXX is not set
CONFIG_SCSI_AIC79XX=y
CONFIG_AIC79XX_CMDS_PER_DEVICE=32
CONFIG_AIC79XX_RESET_DELAY_MS=5000
# CONFIG_AIC79XX_BUILD_FIRMWARE is not set
CONFIG_AIC79XX_DEBUG_ENABLE=y
CONFIG_AIC79XX_DEBUG_MASK=0
CONFIG_AIC79XX_REG_PRETTY_PRINT=y
CONFIG_SCSI_AIC94XX=y
# CONFIG_AIC94XX_DEBUG is not set
# CONFIG_SCSI_MVSAS is not set
CONFIG_SCSI_MVUMI=y
CONFIG_SCSI_ADVANSYS=y
CONFIG_SCSI_ARCMSR=y
CONFIG_SCSI_ESAS2R=y
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=y
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=y
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
CONFIG_SCSI_HPTIOP=y
CONFIG_SCSI_BUSLOGIC=y
CONFIG_SCSI_FLASHPOINT=y
CONFIG_SCSI_MYRB=y
# CONFIG_SCSI_MYRS is not set
CONFIG_VMWARE_PVSCSI=y
CONFIG_SCSI_SNIC=y
# CONFIG_SCSI_SNIC_DEBUG_FS is not set
# CONFIG_SCSI_DMX3191D is not set
CONFIG_SCSI_FDOMAIN=y
CONFIG_SCSI_FDOMAIN_PCI=y
# CONFIG_SCSI_ISCI is not set
CONFIG_SCSI_IPS=y
CONFIG_SCSI_INITIO=y
# CONFIG_SCSI_INIA100 is not set
CONFIG_SCSI_PPA=y
CONFIG_SCSI_IMM=y
# CONFIG_SCSI_IZIP_EPP16 is not set
# CONFIG_SCSI_IZIP_SLOW_CTR is not set
CONFIG_SCSI_STEX=y
# CONFIG_SCSI_SYM53C8XX_2 is not set
CONFIG_SCSI_IPR=y
# CONFIG_SCSI_IPR_TRACE is not set
CONFIG_SCSI_IPR_DUMP=y
CONFIG_SCSI_QLOGIC_1280=y
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_DC395x is not set
CONFIG_SCSI_AM53C974=y
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
CONFIG_SCSI_VIRTIO=y
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
# CONFIG_PCMCIA_AHA152X is not set
# CONFIG_PCMCIA_FDOMAIN is not set
# CONFIG_PCMCIA_QLOGIC is not set
# CONFIG_PCMCIA_SYM53C500 is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
# CONFIG_ATA_ACPI is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
CONFIG_SATA_ACARD_AHCI=y
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=y
CONFIG_SATA_QSTOR=y
CONFIG_SATA_SX4=y
# CONFIG_ATA_BMDMA is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
CONFIG_PATA_MPIIX=y
CONFIG_PATA_NS87410=y
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_PCMCIA is not set
CONFIG_PATA_RZ1000=y

#
# Generic fallback / legacy drivers
#
CONFIG_PATA_LEGACY=y
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
# CONFIG_MD_AUTODETECT is not set
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
CONFIG_MD_RAID456=y
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=y
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
CONFIG_DM_DEBUG_BLOCK_STACK_TRACING=y
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
CONFIG_DM_UNSTRIPED=y
CONFIG_DM_CRYPT=y
CONFIG_DM_SNAPSHOT=y
CONFIG_DM_THIN_PROVISIONING=y
CONFIG_DM_CACHE=y
# CONFIG_DM_CACHE_SMQ is not set
# CONFIG_DM_WRITECACHE is not set
CONFIG_DM_EBS=y
# CONFIG_DM_ERA is not set
CONFIG_DM_CLONE=y
CONFIG_DM_MIRROR=y
# CONFIG_DM_LOG_USERSPACE is not set
CONFIG_DM_RAID=y
# CONFIG_DM_ZERO is not set
CONFIG_DM_MULTIPATH=y
CONFIG_DM_MULTIPATH_QL=y
# CONFIG_DM_MULTIPATH_ST is not set
CONFIG_DM_MULTIPATH_HST=y
CONFIG_DM_MULTIPATH_IOA=y
# CONFIG_DM_DELAY is not set
# CONFIG_DM_DUST is not set
CONFIG_DM_INIT=y
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=y
CONFIG_DM_VERITY=y
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=y
CONFIG_DM_LOG_WRITES=y
CONFIG_DM_INTEGRITY=y
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=y
CONFIG_TCM_FILEIO=y
CONFIG_TCM_PSCSI=y
# CONFIG_TCM_USER2 is not set
# CONFIG_LOOPBACK_TARGET is not set
# CONFIG_ISCSI_TARGET is not set
# CONFIG_SBP_TARGET is not set
CONFIG_FUSION=y
# CONFIG_FUSION_SPI is not set
# CONFIG_FUSION_SAS is not set
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_LOGGING=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# CONFIG_FIREWIRE_OHCI is not set
# CONFIG_FIREWIRE_SBP2 is not set
# CONFIG_FIREWIRE_NET is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
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
# CONFIG_PCMCIA_3C574 is not set
# CONFIG_PCMCIA_3C589 is not set
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
# CONFIG_ENA_ETHERNET is not set
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
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
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
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_IXGBEVF is not set
# CONFIG_I40E is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
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
# CONFIG_PCMCIA_SMC91C92 is not set
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
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
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
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
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
# CONFIG_PCMCIA_RAYCS is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_USB4_NET is not set
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
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADI=y
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
CONFIG_JOYSTICK_GRIP=y
# CONFIG_JOYSTICK_GRIP_MP is not set
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=y
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_USB is not set
CONFIG_JOYSTICK_IFORCE_232=y
CONFIG_JOYSTICK_WARRIOR=y
# CONFIG_JOYSTICK_MAGELLAN is not set
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
CONFIG_JOYSTICK_TWIDJOY=y
CONFIG_JOYSTICK_ZHENHUA=y
# CONFIG_JOYSTICK_DB9 is not set
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=y
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
CONFIG_JOYSTICK_XPAD_LEDS=y
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=y
# CONFIG_JOYSTICK_SENSEHAT is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
# CONFIG_TABLET_USB_AIPTEK is not set
CONFIG_TABLET_USB_HANWANG=y
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=y
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_ATMEL_MXT=y
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
CONFIG_TOUCHSCREEN_CHIPONE_ICN8505=y
CONFIG_TOUCHSCREEN_CY8CTMA140=y
CONFIG_TOUCHSCREEN_CY8CTMG110=y
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP_I2C=y
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_CYTTSP5 is not set
CONFIG_TOUCHSCREEN_DA9052=y
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
# CONFIG_TOUCHSCREEN_EXC3000 is not set
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
CONFIG_TOUCHSCREEN_HIDEEP=y
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX=y
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_ILITEK=y
# CONFIG_TOUCHSCREEN_S6SY761 is not set
CONFIG_TOUCHSCREEN_GUNZE=y
CONFIG_TOUCHSCREEN_EKTF2127=y
CONFIG_TOUCHSCREEN_ELAN=y
# CONFIG_TOUCHSCREEN_ELO is not set
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=y
CONFIG_TOUCHSCREEN_MCS5000=y
CONFIG_TOUCHSCREEN_MMS114=y
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=y
# CONFIG_TOUCHSCREEN_MTOUCH is not set
# CONFIG_TOUCHSCREEN_IMAGIS is not set
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=y
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
CONFIG_TOUCHSCREEN_PIXCIR=y
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
CONFIG_TOUCHSCREEN_USB_3M=y
CONFIG_TOUCHSCREEN_USB_ITM=y
CONFIG_TOUCHSCREEN_USB_ETURBO=y
CONFIG_TOUCHSCREEN_USB_GUNZE=y
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
CONFIG_TOUCHSCREEN_USB_ELO=y
CONFIG_TOUCHSCREEN_USB_E2I=y
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
CONFIG_TOUCHSCREEN_USB_NEXIO=y
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
CONFIG_TOUCHSCREEN_TSC2007=y
CONFIG_TOUCHSCREEN_RM_TS=y
CONFIG_TOUCHSCREEN_SILEAD=y
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
CONFIG_TOUCHSCREEN_STMFTS=y
# CONFIG_TOUCHSCREEN_SX8654 is not set
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=y
CONFIG_TOUCHSCREEN_ZFORCE=y
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_TOUCHSCREEN_IQS5XX=y
CONFIG_TOUCHSCREEN_ZINITIX=y
CONFIG_TOUCHSCREEN_HIMAX_HX83112B=y
CONFIG_INPUT_MISC=y
CONFIG_INPUT_AD714X=y
# CONFIG_INPUT_AD714X_I2C is not set
CONFIG_INPUT_ATC260X_ONKEY=y
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
# CONFIG_INPUT_PCSPKR is not set
CONFIG_INPUT_MAX8925_ONKEY=y
CONFIG_INPUT_MC13783_PWRBUTTON=y
# CONFIG_INPUT_MMA8450 is not set
# CONFIG_INPUT_APANEL is not set
CONFIG_INPUT_GPIO_BEEPER=y
CONFIG_INPUT_GPIO_DECODER=y
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_ATLAS_BTNS is not set
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_RETU_PWRBUTTON=y
# CONFIG_INPUT_AXP20X_PEK is not set
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PALMAS_PWRBUTTON=y
CONFIG_INPUT_PCF50633_PMU=y
CONFIG_INPUT_PCF8574=y
CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
# CONFIG_INPUT_DA7280_HAPTICS is not set
CONFIG_INPUT_DA9052_ONKEY=y
CONFIG_INPUT_DA9063_ONKEY=y
CONFIG_INPUT_ADXL34X=y
CONFIG_INPUT_ADXL34X_I2C=y
CONFIG_INPUT_IBM_PANEL=y
# CONFIG_INPUT_IMS_PCU is not set
CONFIG_INPUT_IQS269A=y
# CONFIG_INPUT_IQS626A is not set
CONFIG_INPUT_IQS7222=y
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
CONFIG_INPUT_DRV260X_HAPTICS=y
# CONFIG_INPUT_DRV2665_HAPTICS is not set
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_INPUT_RAVE_SP_PWRBUTTON=y
CONFIG_INPUT_RT5120_PWRKEY=y
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=y
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=y
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
# CONFIG_LEGACY_TIOCSTI is not set
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
CONFIG_SERIAL_8250_DMA=y
# CONFIG_SERIAL_8250_PCI is not set
CONFIG_SERIAL_8250_CS=y
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=y
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_MEN_Z135 is not set
CONFIG_SERIAL_SPRD=y
CONFIG_SERIAL_SPRD_CONSOLE=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_N_GSM is not set
CONFIG_NOZOMI=y
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_IPMB=y
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=y
CONFIG_SSIF_IPMI_BMC=y
CONFIG_IPMB_DEVICE_INTERFACE=y
# CONFIG_HW_RANDOM is not set
CONFIG_APPLICOM=y

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=y
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
# CONFIG_SCR24X is not set
# CONFIG_IPWIRELESS is not set
# end of PCMCIA character devices

CONFIG_MWAVE=y
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
# CONFIG_HPET_MMAP is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_I2C=y
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
# CONFIG_TCG_NSC is not set
CONFIG_TCG_ATMEL=y
CONFIG_TCG_INFINEON=y
CONFIG_TCG_CRB=y
CONFIG_TCG_VTPM_PROXY=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_TELCLOCK=y
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_PCIE is not set
CONFIG_XILLYUSB=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
# CONFIG_I2C_MUX is not set
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
CONFIG_I2C_ALI1535=y
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
CONFIG_I2C_ISCH=y
CONFIG_I2C_ISMT=y
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_NFORCE2_S4985=y
CONFIG_I2C_NVIDIA_GPU=y
CONFIG_I2C_SIS5595=y
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=y
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_AMDPSP is not set
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_OCORES=y
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_DLN2=y
CONFIG_I2C_CP2615=y
# CONFIG_I2C_PARPORT is not set
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
CONFIG_I2C_TAOS_EVM=y
# CONFIG_I2C_TINY_USB is not set
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
CONFIG_DW_I3C_MASTER=y
CONFIG_SVC_I3C_MASTER=y
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
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set

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
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# CONFIG_PTP_1588_CLOCK_OCP is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_CY8C95X0=y
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_ALDERLAKE=y
CONFIG_PINCTRL_BROXTON=y
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=y
CONFIG_PINCTRL_DENVERTON=y
CONFIG_PINCTRL_ELKHARTLAKE=y
CONFIG_PINCTRL_EMMITSBURG=y
CONFIG_PINCTRL_GEMINILAKE=y
# CONFIG_PINCTRL_ICELAKE is not set
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
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
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_MAX730X=y
CONFIG_GPIO_IDIO_16=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=y
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MENZ127 is not set
# CONFIG_GPIO_SIOX is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH=y
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=y
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ARIZONA is not set
CONFIG_GPIO_BD9571MWV=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DLN2=y
# CONFIG_GPIO_JANZ_TTL is not set
CONFIG_GPIO_KEMPLD=y
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_TPS65086=y
CONFIG_GPIO_TPS65910=y
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TPS68470=y
CONFIG_GPIO_WHISKEY_COVE=y
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
CONFIG_GPIO_ML_IOH=y
CONFIG_GPIO_PCI_IDIO_16=y
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_ATC260X is not set
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_TPS65086 is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_PDA_POWER=y
CONFIG_IP5XXX_POWER=y
# CONFIG_MAX8925_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=y
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9052=y
# CONFIG_BATTERY_DA9150 is not set
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_PCF50633=y
CONFIG_CHARGER_ISP1704=y
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MAX8998=y
CONFIG_CHARGER_MT6360=y
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_BQ25980 is not set
CONFIG_CHARGER_BQ256XX=y
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_CHARGER_TPS65090 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=y
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_BD99954=y
CONFIG_BATTERY_UG3105=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
# CONFIG_SENSORS_ABITUGURU3 is not set
# CONFIG_SENSORS_SMPRO is not set
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=y
# CONFIG_SENSORS_ADM1021 is not set
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
# CONFIG_SENSORS_ADT7410 is not set
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_AHT10=y
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=y
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=y
# CONFIG_SENSORS_K10TEMP is not set
# CONFIG_SENSORS_FAM15H_POWER is not set
CONFIG_SENSORS_APPLESMC=y
CONFIG_SENSORS_ASB100=y
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_CORSAIR_PSU=y
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_DA9052_ADC=y
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_IBMAEM is not set
CONFIG_SENSORS_IBMPEX=y
CONFIG_SENSORS_I5500=y
# CONFIG_SENSORS_CORETEMP is not set
CONFIG_SENSORS_IT87=y
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_POWR1220 is not set
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
CONFIG_SENSORS_LTC2990=y
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=y
CONFIG_SENSORS_LTC4215=y
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31730=y
CONFIG_SENSORS_MAX31760=y
CONFIG_SENSORS_MAX6620=y
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6642=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=y
CONFIG_SENSORS_MR75203=y
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM73=y
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775=y
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
CONFIG_SENSORS_NPCM7XX=y
CONFIG_SENSORS_NZXT_KRAKEN2=y
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
# CONFIG_SENSORS_OXP is not set
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_SENSORS_PECI_CPUTEMP is not set
# CONFIG_SENSORS_PECI_DIMMTEMP is not set
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
CONFIG_SENSORS_ADM1266=y
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_BEL_PFE=y
CONFIG_SENSORS_BPA_RS600=y
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
CONFIG_SENSORS_FSP_3Y=y
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_DPS920AB=y
# CONFIG_SENSORS_INSPUR_IPSPS is not set
CONFIG_SENSORS_IR35221=y
CONFIG_SENSORS_IR36021=y
CONFIG_SENSORS_IR38064=y
# CONFIG_SENSORS_IR38064_REGULATOR is not set
# CONFIG_SENSORS_IRPS5401 is not set
CONFIG_SENSORS_ISL68137=y
CONFIG_SENSORS_LM25066=y
# CONFIG_SENSORS_LM25066_REGULATOR is not set
CONFIG_SENSORS_LT7182S=y
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX15301=y
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX16601=y
# CONFIG_SENSORS_MAX20730 is not set
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX31785=y
CONFIG_SENSORS_MAX34440=y
CONFIG_SENSORS_MAX8688=y
CONFIG_SENSORS_MP2888=y
CONFIG_SENSORS_MP2975=y
CONFIG_SENSORS_MP5023=y
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
CONFIG_SENSORS_PXE1610=y
CONFIG_SENSORS_Q54SJ108A2=y
CONFIG_SENSORS_STPDDC60=y
CONFIG_SENSORS_TPS40422=y
CONFIG_SENSORS_TPS53679=y
# CONFIG_SENSORS_TPS546D24 is not set
# CONFIG_SENSORS_UCD9000 is not set
CONFIG_SENSORS_UCD9200=y
CONFIG_SENSORS_XDPE152=y
# CONFIG_SENSORS_XDPE122 is not set
# CONFIG_SENSORS_ZL6100 is not set
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SBRMI=y
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=y
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
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
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=y
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=y
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=y
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=y
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
# CONFIG_SENSORS_W83795 is not set
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=y
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=y
CONFIG_SENSORS_ATK0110=y
CONFIG_SENSORS_ASUS_WMI=y
CONFIG_SENSORS_ASUS_EC=y
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=y
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=y
CONFIG_INTEL_SOC_DTS_IOSF_CORE=y
CONFIG_INTEL_SOC_DTS_THERMAL=y

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=y
CONFIG_ACPI_THERMAL_REL=y
# CONFIG_INT3406_THERMAL is not set
CONFIG_PROC_THERMAL_MMIO_RAPL=y
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_BXT_PMIC_THERMAL=y
CONFIG_INTEL_PCH_THERMAL=y
CONFIG_INTEL_TCC_COOLING=y
CONFIG_INTEL_MENLOW=y
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
# CONFIG_SSB_PCIHOST is not set
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
# CONFIG_SSB_PCMCIAHOST is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_SFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_SMPRO=y
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_HTC_PASIC3=y
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
# CONFIG_INTEL_SOC_PMIC is not set
CONFIG_INTEL_SOC_PMIC_BXTWC=y
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
CONFIG_INTEL_SOC_PMIC_CHTDC_TI=y
CONFIG_INTEL_SOC_PMIC_MRFLD=y
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
CONFIG_MFD_INTEL_PMC_BXT=y
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=y
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
CONFIG_MFD_MAX77693=y
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
# CONFIG_MFD_CS47L24 is not set
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_RAVE_SP_CORE=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_ATC260X is not set
CONFIG_REGULATOR_AXP20X=y
# CONFIG_REGULATOR_BD9571MWV is not set
# CONFIG_REGULATOR_DA9052 is not set
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_ISL9305 is not set
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=y
# CONFIG_REGULATOR_LP8755 is not set
# CONFIG_REGULATOR_LTC3589 is not set
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8925=y
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX8997 is not set
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=y
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MP8859 is not set
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=y
CONFIG_REGULATOR_MT6360=y
CONFIG_REGULATOR_PALMAS=y
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCF50633=y
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=y
# CONFIG_REGULATOR_RC5T583 is not set
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4831=y
# CONFIG_REGULATOR_RT5033 is not set
# CONFIG_REGULATOR_RT5120 is not set
CONFIG_REGULATOR_RT5190A=y
CONFIG_REGULATOR_RT5759=y
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6190 is not set
# CONFIG_REGULATOR_RT6245 is not set
CONFIG_REGULATOR_RTQ2134=y
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_SKY81452=y
# CONFIG_REGULATOR_SLG51000 is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
# CONFIG_REGULATOR_TPS65090 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65910=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_TPS68470=y
CONFIG_REGULATOR_WM8994=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
CONFIG_CEC_SECO=y
CONFIG_USB_PULSE8_CEC=y
CONFIG_USB_RAINSHADOW_CEC=y
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=y
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_USE_DYNAMIC_DEBUG is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=y
CONFIG_DRM_BUDDY=y
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
CONFIG_DRM_I2C_NXP_TDA998X=y
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=y
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
# CONFIG_DRM_I915_COMPRESS_ERROR is not set
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_PXP=y
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=7500
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
CONFIG_DRM_VGEM=y
CONFIG_DRM_VKMS=y
CONFIG_DRM_VMWGFX=y
CONFIG_DRM_VMWGFX_MKSSTATS=y
CONFIG_DRM_GMA500=y
CONFIG_DRM_UDL=y
CONFIG_DRM_AST=y
CONFIG_DRM_MGAG200=y
CONFIG_DRM_QXL=y
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=y
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_BOCHS=y
CONFIG_DRM_CIRRUS_QEMU=y
# CONFIG_DRM_GM12U320 is not set
CONFIG_DRM_SIMPLEDRM=y
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=y
CONFIG_FB_PM2=y
CONFIG_FB_PM2_FIFO_DISCONNECT=y
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
CONFIG_FB_ASILIANT=y
CONFIG_FB_IMSTT=y
# CONFIG_FB_VGA16 is not set
CONFIG_FB_VESA=y
# CONFIG_FB_EFI is not set
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
CONFIG_FB_NVIDIA=y
CONFIG_FB_NVIDIA_I2C=y
# CONFIG_FB_NVIDIA_DEBUG is not set
# CONFIG_FB_NVIDIA_BACKLIGHT is not set
CONFIG_FB_RIVA=y
# CONFIG_FB_RIVA_I2C is not set
# CONFIG_FB_RIVA_DEBUG is not set
CONFIG_FB_RIVA_BACKLIGHT=y
CONFIG_FB_I740=y
CONFIG_FB_LE80578=y
CONFIG_FB_CARILLO_RANCH=y
CONFIG_FB_MATROX=y
# CONFIG_FB_MATROX_MILLENIUM is not set
# CONFIG_FB_MATROX_MYSTIQUE is not set
CONFIG_FB_MATROX_G=y
CONFIG_FB_MATROX_I2C=y
# CONFIG_FB_MATROX_MAVEN is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=y
# CONFIG_FB_ATY128_BACKLIGHT is not set
CONFIG_FB_ATY=y
CONFIG_FB_ATY_CT=y
CONFIG_FB_ATY_GENERIC_LCD=y
CONFIG_FB_ATY_GX=y
# CONFIG_FB_ATY_BACKLIGHT is not set
CONFIG_FB_S3=y
CONFIG_FB_S3_DDC=y
CONFIG_FB_SAVAGE=y
# CONFIG_FB_SAVAGE_I2C is not set
# CONFIG_FB_SAVAGE_ACCEL is not set
CONFIG_FB_SIS=y
CONFIG_FB_SIS_300=y
CONFIG_FB_SIS_315=y
CONFIG_FB_VIA=y
# CONFIG_FB_VIA_DIRECT_PROCFS is not set
CONFIG_FB_VIA_X_COMPATIBILITY=y
# CONFIG_FB_NEOMAGIC is not set
CONFIG_FB_KYRO=y
CONFIG_FB_3DFX=y
CONFIG_FB_3DFX_ACCEL=y
# CONFIG_FB_3DFX_I2C is not set
CONFIG_FB_VOODOO1=y
CONFIG_FB_VT8623=y
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
CONFIG_FB_SM501=y
CONFIG_FB_SMSCUFX=y
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
# CONFIG_FB_MB862XX is not set
CONFIG_FB_SSD1307=y
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
CONFIG_BACKLIGHT_CARILLO_RANCH=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_MAX8925 is not set
CONFIG_BACKLIGHT_APPLE=y
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_RT4831=y
CONFIG_BACKLIGHT_SAHARA=y
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=y
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
CONFIG_LOGO_LINUX_VGA16=y
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=y
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_CTL_FAST_LOOKUP=y
CONFIG_SND_DEBUG=y
CONFIG_SND_DEBUG_VERBOSE=y
CONFIG_SND_PCM_XRUN_DEBUG=y
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
# CONFIG_SND_CTL_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
# CONFIG_SND_SEQUENCER_OSS is not set
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
# CONFIG_SND_DRIVERS is not set
# CONFIG_SND_PCI is not set

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=y
# CONFIG_SND_USB_UA101 is not set
CONFIG_SND_USB_USX2Y=y
# CONFIG_SND_USB_CAIAQ is not set
# CONFIG_SND_USB_US122L is not set
CONFIG_SND_USB_6FIRE=y
CONFIG_SND_USB_HIFACE=y
CONFIG_SND_BCD2000=y
CONFIG_SND_USB_LINE6=y
CONFIG_SND_USB_POD=y
CONFIG_SND_USB_PODHD=y
# CONFIG_SND_USB_TONEPORT is not set
CONFIG_SND_USB_VARIAX=y
# CONFIG_SND_FIREWIRE is not set
# CONFIG_SND_PCMCIA is not set
# CONFIG_SND_SOC is not set
CONFIG_SND_X86=y
# CONFIG_HDMI_LPE_AUDIO is not set
# CONFIG_SND_VIRTIO is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
CONFIG_HID_BETOP_FF=y
CONFIG_HID_BIGBEN_FF=y
CONFIG_HID_CHERRY=y
# CONFIG_HID_CHICONY is not set
CONFIG_HID_CORSAIR=y
# CONFIG_HID_COUGAR is not set
CONFIG_HID_MACALLY=y
CONFIG_HID_PRODIKEYS=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CREATIVE_SB0540=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELAN=y
CONFIG_HID_ELECOM=y
CONFIG_HID_ELO=y
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
CONFIG_HID_GFRM=y
CONFIG_HID_GLORIOUS=y
CONFIG_HID_HOLTEK=y
CONFIG_HOLTEK_FF=y
CONFIG_HID_VIVALDI_COMMON=y
CONFIG_HID_VIVALDI=y
CONFIG_HID_GT683R=y
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=y
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=y
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
CONFIG_HID_LENOVO=y
CONFIG_HID_LETSKETCH=y
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_HIDPP=y
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
CONFIG_LOGIG940_FF=y
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=y
CONFIG_HID_MEGAWORLD_FF=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=y
CONFIG_HID_NTRIG=y
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PENMOUNT=y
# CONFIG_HID_PETALYNX is not set
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=y
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=y
CONFIG_HID_SAITEK=y
CONFIG_HID_SAMSUNG=y
CONFIG_HID_SEMITEK=y
# CONFIG_HID_SIGMAMICRO is not set
CONFIG_HID_SONY=y
# CONFIG_SONY_FF is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=y
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
CONFIG_HID_THRUSTMASTER=y
# CONFIG_THRUSTMASTER_FF is not set
CONFIG_HID_UDRAW_PS3=y
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
CONFIG_HID_ALPS=y
CONFIG_HID_MCP2221=y
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=y
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID_ACPI=y
# end of I2C HID support

CONFIG_I2C_HID_CORE=y

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=y
CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER=y
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

#
# Surface System Aggregator Module HID support
#
CONFIG_SURFACE_KBD=y
# end of Surface System Aggregator Module HID support

CONFIG_SURFACE_HID_CORE=y
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
CONFIG_USB_FEW_INIT_RETRIES=y
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
CONFIG_USB_OTG_PRODUCTLIST=y
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_OTG_FSM=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
# CONFIG_USB_EHCI_HCD is not set
# CONFIG_USB_OXU210HP_HCD is not set
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_OHCI_HCD=y
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_U132_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS_HOST=y
CONFIG_USB_CDNS3=y
CONFIG_USB_CDNS3_GADGET=y
CONFIG_USB_CDNS3_HOST=y
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=y
# CONFIG_USB_SERIAL_CONSOLE is not set
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
CONFIG_USB_SERIAL_ARK3116=y
# CONFIG_USB_SERIAL_BELKIN is not set
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=y
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=y
CONFIG_USB_SERIAL_CP210X=y
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
CONFIG_USB_SERIAL_EMPEG=y
CONFIG_USB_SERIAL_FTDI_SIO=y
# CONFIG_USB_SERIAL_VISOR is not set
CONFIG_USB_SERIAL_IPAQ=y
# CONFIG_USB_SERIAL_IR is not set
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
CONFIG_USB_SERIAL_GARMIN=y
CONFIG_USB_SERIAL_IPW=y
CONFIG_USB_SERIAL_IUU=y
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=y
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
# CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
CONFIG_USB_SERIAL_NAVMAN=y
# CONFIG_USB_SERIAL_PL2303 is not set
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=y
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
CONFIG_USB_SERIAL_SYMBOL=y
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=y
# CONFIG_USB_SERIAL_OPTICON is not set
CONFIG_USB_SERIAL_XSENS_MT=y
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_XR=y
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=y
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_FTDI_ELAN=y
CONFIG_USB_APPLEDISPLAY=y
CONFIG_APPLE_MFI_FASTCHARGE=y
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_TAHVO_USB=y
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
CONFIG_USB_ISP1301=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
# CONFIG_U_SERIAL_CONSOLE is not set

#
# USB Peripheral Controller
#
# CONFIG_USB_GR_UDC is not set
CONFIG_USB_R8A66597=y
CONFIG_USB_PXA27X=y
# CONFIG_USB_MV_UDC is not set
CONFIG_USB_MV_U3D=y
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=y
CONFIG_USB_NET2272=y
CONFIG_USB_NET2272_DMA=y
CONFIG_USB_DUMMY_HCD=y
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_AUDIO=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_MASS_STORAGE=y
CONFIG_USB_F_UAC1=y
CONFIG_USB_F_UAC1_LEGACY=y
CONFIG_USB_F_UAC2=y
CONFIG_USB_F_MIDI=y
CONFIG_USB_F_HID=y
CONFIG_USB_F_PRINTER=y
CONFIG_USB_F_TCM=y
CONFIG_USB_CONFIGFS=y
CONFIG_USB_CONFIGFS_SERIAL=y
# CONFIG_USB_CONFIGFS_ACM is not set
# CONFIG_USB_CONFIGFS_OBEX is not set
# CONFIG_USB_CONFIGFS_NCM is not set
# CONFIG_USB_CONFIGFS_ECM is not set
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
# CONFIG_USB_CONFIGFS_RNDIS is not set
# CONFIG_USB_CONFIGFS_EEM is not set
# CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
# CONFIG_USB_CONFIGFS_F_LB_SS is not set
# CONFIG_USB_CONFIGFS_F_FS is not set
CONFIG_USB_CONFIGFS_F_UAC1=y
CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
CONFIG_USB_CONFIGFS_F_UAC2=y
# CONFIG_USB_CONFIGFS_F_MIDI is not set
CONFIG_USB_CONFIGFS_F_HID=y
CONFIG_USB_CONFIGFS_F_PRINTER=y
# CONFIG_USB_CONFIGFS_F_TCM is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
# CONFIG_USB_ZERO_HNPTEST is not set
CONFIG_USB_AUDIO=y
CONFIG_GADGET_UAC1=y
# CONFIG_GADGET_UAC1_LEGACY is not set
# CONFIG_USB_ETH is not set
# CONFIG_USB_G_NCM is not set
CONFIG_USB_GADGETFS=y
# CONFIG_USB_FUNCTIONFS is not set
CONFIG_USB_MASS_STORAGE=y
CONFIG_USB_GADGET_TARGET=y
CONFIG_USB_G_SERIAL=y
CONFIG_USB_MIDI_GADGET=y
CONFIG_USB_G_PRINTER=y
# CONFIG_USB_CDC_COMPOSITE is not set
CONFIG_USB_G_ACM_MS=y
# CONFIG_USB_G_MULTI is not set
CONFIG_USB_G_HID=y
CONFIG_USB_G_DBGP=y
# CONFIG_USB_G_DBGP_PRINTK is not set
CONFIG_USB_G_DBGP_SERIAL=y
CONFIG_USB_RAW_GADGET=y
# end of USB Gadget precomposed configurations

# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_USB_ROLES_INTEL_XHCI=y
# CONFIG_MMC is not set
CONFIG_SCSI_UFSHCD=y
# CONFIG_SCSI_UFS_BSG is not set
# CONFIG_SCSI_UFS_CRYPTO is not set
CONFIG_SCSI_UFS_HPB=y
CONFIG_SCSI_UFS_HWMON=y
CONFIG_SCSI_UFSHCD_PCI=y
# CONFIG_SCSI_UFS_DWC_TC_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=y
CONFIG_SCSI_UFS_CDNS_PLATFORM=y
CONFIG_SCSI_UFS_DWC_TC_PLATFORM=y
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=y
# CONFIG_LEDS_LT3593 is not set
# CONFIG_LEDS_MC13783 is not set
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX8997=y
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_MENF21BMC is not set
CONFIG_LEDS_IS31FL319X=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_MLXCPLD is not set
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
CONFIG_LEDS_NIC78BX=y
# CONFIG_LEDS_TI_LMU_COMMON is not set
# CONFIG_LEDS_TPS6105X is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_DISK is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
CONFIG_LEDS_SIEMENS_SIMATIC_IPC=y
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_DEBUG=y
# CONFIG_EDAC_E752X is not set
CONFIG_EDAC_I82975X=y
CONFIG_EDAC_I3000=y
# CONFIG_EDAC_I3200 is not set
CONFIG_EDAC_IE31200=y
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
CONFIG_EDAC_I5100=y
CONFIG_EDAC_I7300=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
# CONFIG_INTEL_IDMA64 is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=y
# CONFIG_PLX_DMA is not set
# CONFIG_AMD_PTDMA is not set
CONFIG_QCOM_HIDMA_MGMT=y
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
# CONFIG_DW_DMAC_PCI is not set
CONFIG_DW_EDMA=y
CONFIG_DW_EDMA_PCIE=y
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
CONFIG_INTEL_LDMA=y

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

CONFIG_DCA=y
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
# CONFIG_HD44780 is not set
# CONFIG_KS0108 is not set
CONFIG_IMG_ASCII_LCD=y
# CONFIG_HT16K33 is not set
CONFIG_LCD2S=y
# CONFIG_PARPORT_PANEL is not set
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
# CONFIG_PANEL is not set
CONFIG_UIO=y
CONFIG_UIO_CIF=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
CONFIG_UIO_SERCOS3=y
CONFIG_UIO_PCI_GENERIC=y
CONFIG_UIO_NETX=y
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=y
# CONFIG_UIO_DFL is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=y
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_SURFACE_3_POWER_OPREGION=y
# CONFIG_SURFACE_ACPI_NOTIFY is not set
CONFIG_SURFACE_AGGREGATOR_CDEV=y
CONFIG_SURFACE_AGGREGATOR_HUB=y
# CONFIG_SURFACE_AGGREGATOR_REGISTRY is not set
# CONFIG_SURFACE_AGGREGATOR_TABLET_SWITCH is not set
CONFIG_SURFACE_DTX=y
# CONFIG_SURFACE_GPE is not set
CONFIG_SURFACE_HOTPLUG=y
CONFIG_SURFACE_PRO3_BUTTON=y
CONFIG_SURFACE_AGGREGATOR=y
CONFIG_SURFACE_AGGREGATOR_BUS=y
# CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=y
# CONFIG_WMI_BMOF is not set
# CONFIG_HUAWEI_WMI is not set
CONFIG_MXM_WMI=y
CONFIG_PEAQ_WMI=y
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
CONFIG_XIAOMI_WMI=y
CONFIG_GIGABYTE_WMI=y
CONFIG_YOGABOOK_WMI=y
CONFIG_ACERHDF=y
CONFIG_ACER_WIRELESS=y
# CONFIG_ACER_WMI is not set
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_HSMP is not set
CONFIG_ADV_SWBUTTON=y
CONFIG_APPLE_GMUX=y
CONFIG_ASUS_LAPTOP=y
CONFIG_ASUS_WIRELESS=y
CONFIG_ASUS_WMI=y
CONFIG_ASUS_NB_WMI=y
CONFIG_ASUS_TF103C_DOCK=y
CONFIG_MERAKI_MX100=y
# CONFIG_EEEPC_LAPTOP is not set
CONFIG_EEEPC_WMI=y
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
# CONFIG_FUJITSU_LAPTOP is not set
CONFIG_FUJITSU_TABLET=y
CONFIG_GPD_POCKET_FAN=y
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
CONFIG_WIRELESS_HOTKEY=y
CONFIG_IBM_RTL=y
# CONFIG_SENSORS_HDAPS is not set
# CONFIG_THINKPAD_ACPI is not set
CONFIG_THINKPAD_LMI=y
CONFIG_INTEL_ATOMISP2_PDX86=y
CONFIG_INTEL_ATOMISP2_LED=y
CONFIG_INTEL_ATOMISP2_PM=y
# CONFIG_INTEL_IFS is not set
CONFIG_INTEL_SAR_INT1092=y
CONFIG_INTEL_SKL_INT3472=y
CONFIG_INTEL_PMC_CORE=y
CONFIG_INTEL_PMT_CLASS=y
CONFIG_INTEL_PMT_TELEMETRY=y
# CONFIG_INTEL_PMT_CRASHLOG is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

# CONFIG_INTEL_TELEMETRY is not set
CONFIG_INTEL_WMI=y
CONFIG_INTEL_WMI_SBL_FW_UPDATE=y
CONFIG_INTEL_WMI_THUNDERBOLT=y

#
# Intel Uncore Frequency Control
#
CONFIG_INTEL_UNCORE_FREQ_CONTROL=y
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=y
# CONFIG_INTEL_VBTN is not set
CONFIG_INTEL_INT0002_VGPIO=y
# CONFIG_INTEL_BXTWC_PMIC_TMU is not set
CONFIG_INTEL_CHTDC_TI_PWRBTN=y
CONFIG_INTEL_ISHTP_ECLITE=y
# CONFIG_INTEL_MRFLD_PWRBTN is not set
CONFIG_INTEL_PUNIT_IPC=y
CONFIG_INTEL_RST=y
CONFIG_INTEL_SDSI=y
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_VSEC=y
# CONFIG_MSI_WMI is not set
# CONFIG_PCENGINES_APU2 is not set
CONFIG_BARCO_P50_GPIO=y
CONFIG_SAMSUNG_LAPTOP=y
# CONFIG_SAMSUNG_Q10 is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
CONFIG_TOSHIBA_HAPS=y
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=y
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=y
CONFIG_SYSTEM76_ACPI=y
# CONFIG_TOPSTAR_LAPTOP is not set
CONFIG_MLX_PLATFORM=y
CONFIG_TOUCHSCREEN_DMI=y
CONFIG_FW_ATTR_CLASS=y
# CONFIG_INTEL_IPS is not set
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
CONFIG_INTEL_SCU_PCI=y
CONFIG_INTEL_SCU_PLATFORM=y
CONFIG_INTEL_SCU_IPC_UTIL=y
CONFIG_SIEMENS_SIMATIC_IPC=y
CONFIG_WINMATE_FM07_KEYS=y
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI544=y
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_TPS68470=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
CONFIG_COMMON_CLK_PALMAS=y
CONFIG_XILINX_VCU=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_PCC is not set
# CONFIG_ALTERA_MBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
CONFIG_REMOTEPROC_CDEV=y
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
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

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

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

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
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
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
# CONFIG_EXTCON_AXP288 is not set
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_INTEL_INT3496=y
# CONFIG_EXTCON_INTEL_MRFLD is not set
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77693=y
# CONFIG_EXTCON_MAX8997 is not set
# CONFIG_EXTCON_PALMAS is not set
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=y
CONFIG_NTB_MSI=y
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
CONFIG_NTB_SWITCHTEC=y
CONFIG_NTB_PINGPONG=y
CONFIG_NTB_TOOL=y
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_MSI_TEST is not set
# CONFIG_NTB_TRANSPORT is not set
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
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_USB_LGM_PHY=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=y
# CONFIG_INTEL_RAPL is not set
# CONFIG_IDLE_INJECT is not set
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
# CONFIG_MCB_LPC is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_USB4=y
CONFIG_USB4_DEBUGFS_WRITE=y
# CONFIG_USB4_DEBUGFS_MARGINING is not set
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
# CONFIG_ANDROID_BINDERFS is not set
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

# CONFIG_LIBNVDIMM is not set
# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_RAVE_SP_EEPROM=y
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_SPMI_SDAM=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_FPGA_MGR_ALTERA_CVP=y
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=y
CONFIG_FPGA_DFL=y
# CONFIG_FPGA_DFL_FME is not set
CONFIG_FPGA_DFL_AFU=y
# CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
# CONFIG_FPGA_DFL_PCI is not set
# CONFIG_TEE is not set
CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
CONFIG_INTERRUPT_CNT=y
CONFIG_INTEL_QEP=y
# CONFIG_MOST is not set
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
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=y
# CONFIG_F2FS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
# CONFIG_ZISOFS is not set
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
CONFIG_NTFS3_FS=y
# CONFIG_NTFS3_64BIT_CLUSTER is not set
# CONFIG_NTFS3_LZX_XPRESS is not set
# CONFIG_NTFS3_FS_POSIX_ACL is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# CONFIG_EFIVAR_FS is not set
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
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
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=y
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
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
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_BIG_KEYS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_KEY_NOTIFICATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

# CONFIG_RANDSTRUCT_NONE is not set
CONFIG_RANDSTRUCT_FULL=y
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
CONFIG_RANDSTRUCT=y
CONFIG_GCC_PLUGIN_RANDSTRUCT=y
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
CONFIG_CRYPTO_PCRYPT=y
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
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
# CONFIG_CRYPTO_DES is not set
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
# CONFIG_CRYPTO_TWOFISH is not set
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
# CONFIG_CRYPTO_XTS is not set
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
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
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=y
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
# CONFIG_CRYPTO_ZSTD is not set
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
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
# CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
CONFIG_CRYPTO_CAST6_AVX_X86_64=y
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=y
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=y
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=y
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
CONFIG_CRYPTO_NHPOLY1305_AVX2=y
CONFIG_CRYPTO_BLAKE2S_X86=y
CONFIG_CRYPTO_POLYVAL_CLMUL_NI=y
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
# CONFIG_CRYPTO_SHA256_SSSE3 is not set
CONFIG_CRYPTO_SHA512_SSSE3=y
CONFIG_CRYPTO_SM3_AVX_X86_64=y
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32_PCLMUL=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=y
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PADLOCK is not set
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CRYPTO_DEV_CCP is not set
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
CONFIG_CRYPTO_DEV_QAT_C62X=y
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
CONFIG_CRYPTO_DEV_NITROX=y
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=y
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_SAFEXCEL=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
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
CONFIG_CRC4=y
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
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
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
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

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
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
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
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
CONFIG_OBJTOOL=y
CONFIG_STACK_VALIDATION=y
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
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
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
CONFIG_PAGE_TABLE_CHECK=y
# CONFIG_PAGE_TABLE_CHECK_ENFORCED is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
CONFIG_DEBUG_WX=y
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
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

CONFIG_DEBUG_TIMEKEEPING=y

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
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
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
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
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
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_SYNTH_EVENTS is not set
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
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_EFI_PGT_DUMP=y
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
# CONFIG_DEBUG_BOOT_PARAMS is not set
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
# CONFIG_UNWINDER_ORC is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
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
CONFIG_TEST_DYNAMIC_DEBUG=y
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--idMweqa4vLs6WIRZ
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
	export queue_cmdline_keys='branch
commit'
	export queue='bisect'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='linux-review/Imre-Deak/drm-i915-dgfx-mtl-Disable-display-functionality-if-it-s-globally-fused-off/20230207-003633'
	export commit='1802537820389183dfcd814e0f6a60d1496a75ef'
	export kconfig='x86_64-randconfig-a011-20230206'
	export nr_vm=300
	export submit_id='63e1df13fddd57a59d616114'
	export job_file='/lkp/jobs/scheduled/vm-meta-18/boot-1-debian-11.1-i386-20220923.cgz-1802537820389183dfcd814e0f6a60d1496a75ef-20230207-42397-ihgqla-0.yaml'
	export id='8697311341dd0baff17d96db25add5cd301fa9ca'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='gcc-11'
	export enqueue_time='2023-02-07 13:18:11 +0800'
	export _id='63e1df13fddd57a59d616114'
	export _rt='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a011-20230206/gcc-11/1802537820389183dfcd814e0f6a60d1496a75ef'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a011-20230206/gcc-11/1802537820389183dfcd814e0f6a60d1496a75ef/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/x86_64-randconfig-a011-20230206/gcc-11/1802537820389183dfcd814e0f6a60d1496a75ef/3
BOOT_IMAGE=/pkg/linux/x86_64-randconfig-a011-20230206/gcc-11/1802537820389183dfcd814e0f6a60d1496a75ef/vmlinuz-6.2.0-rc6-01191-g180253782038
branch=linux-review/Imre-Deak/drm-i915-dgfx-mtl-Disable-display-functionality-if-it-s-globally-fused-off/20230207-003633
job=/lkp/jobs/scheduled/vm-meta-18/boot-1-debian-11.1-i386-20220923.cgz-1802537820389183dfcd814e0f6a60d1496a75ef-20230207-42397-ihgqla-0.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-randconfig-a011-20230206
commit=1802537820389183dfcd814e0f6a60d1496a75ef
initcall_debug
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
	export modules_initrd='/pkg/linux/x86_64-randconfig-a011-20230206/gcc-11/1802537820389183dfcd814e0f6a60d1496a75ef/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export schedule_notify_address=
	export meta_host='vm-meta-18'
	export kernel='/pkg/linux/x86_64-randconfig-a011-20230206/gcc-11/1802537820389183dfcd814e0f6a60d1496a75ef/vmlinuz-6.2.0-rc6-01191-g180253782038'
	export dequeue_time='2023-02-07 13:49:16 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-18/boot-1-debian-11.1-i386-20220923.cgz-1802537820389183dfcd814e0f6a60d1496a75ef-20230207-42397-ihgqla-0.cgz'

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

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--idMweqa4vLs6WIRZ
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--idMweqa4vLs6WIRZ--
