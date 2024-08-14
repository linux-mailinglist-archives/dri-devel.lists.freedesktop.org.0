Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4199951D03
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11F610E4A5;
	Wed, 14 Aug 2024 14:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lF9kiknj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE110E4A4;
 Wed, 14 Aug 2024 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723645478; x=1755181478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+36OygPV03iO6Pc5CGSdF/9H5J9oCw4SrnZrQfrc5nI=;
 b=lF9kiknjQHI8ktXe80BzlOG5Z70QAG24C7CwwzfW4XYuMpVKPY59A0zF
 bkdE7Vi/uKUnLKVZGZLfAUJXCXZGxBUVnBzFT6vdFsl5ciO4nIXG6zJKa
 AO0fQvQ6fL3yP10sa/OwsVxH5nvOER3vDPfs116s9TI93aa+lL0zftL7n
 mqfe+FLqrVMwky55iuQhHHqUqmmeESqmi18lllUZG8708iZ2BpTAzPUwS
 dcfCo702CfgPRxnU8hzwCkqGjeSR9T0Sdb1uXPGjkaEud9Nmdj0nqPsP0
 w+PZIybMwdzaEzTi3hsj/GvAG7rKvl9UecO03AZpG6pqfkwe9e+91Rl+c A==;
X-CSE-ConnectionGUID: OmhOxR3cQAqY2neJEdCb5Q==
X-CSE-MsgGUID: 9q5jalaUQY2iROOYXlIxmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32442151"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="32442151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 07:24:37 -0700
X-CSE-ConnectionGUID: fra1uoSJQ1Kk42i11vNcmQ==
X-CSE-MsgGUID: eTQe6fe+RRCxyQLy6T5lnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="58999708"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 07:24:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 07:24:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 07:24:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 07:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD+6UR2THrsicyURezB+ZeSm2GSFr2bX03mWPzRvHBOyqgwg1NkqVTX/sNwqBh/hk5g6l9BV4tW1ILnUL0X4WDeXNwPVhWAi1GI96F+J8reoZ/5s5mJDPVygrvsO09DCEHAPcWJ4Z1QXLvlAp+1qt+SFSarsHxSG8PsugmJmvUMyyzBurJOcPHWjoNVns7LSXNqPNdnBAfR/Fo9F8Msx6v2GTMBtDYvKOxPw6X2vIN2NPOxeiCvOw8qXL4rw1+7k3u1z9pxtlkSWBD6boK0H81gffcOH9+V1SmlU3TwwOEeXITWpUe9t6MXRwZVqxEGFcJv68N4D5UWZ0b1sO/5pNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6z/DlOgOk33KqYIbWZVxzPwozs/PCnsvkecvwXtsiw=;
 b=Rktb5XhDj+rr68OWS6x5Jx1KVuGhBIXvShRMZzsBYvfFBkkOnLB02OKOcTBstD06tgkKI04LKzoRwqzBPFBuSCNVAov16WOIZO5Tzy7DhW93QU8uYgodDa6NXghJiGY+qyXe+TrC1LRDB8ZsI8eLR+Z5++FXJZMmu6k9CyPzMsabnQtMnbEGD9px8XBe1W7lCMEaGhBMYb457HaUNHB0H9+ttXphibU8ElkRqdmzbmRcWNdcVlnNBLfPWj67/eNsDbF+6ryAePtNJXjR7Bx2OlRPjAkS0Pk1XKT/p1nXr/xyB3a4y5VrHTpwuXCPZ7juYNA2G9j8kdwHfoO0dKuxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Wed, 14 Aug
 2024 14:24:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 14 Aug 2024
 14:24:26 +0000
Date: Wed, 14 Aug 2024 09:24:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <francois.dugast@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
Message-ID: <xcfgszlk4fqraxpzpxhqsaz6zyyi27eojapl6wx4qtbgj2hk4m@6jppy3zg5ea3>
References: <20240812074812.1457164-1-raag.jadav@intel.com>
 <801bf720-6131-489c-8440-34d2267fe73b@linux.intel.com>
 <ZrtfgGY1YFr22Pg9@black.fi.intel.com> <ZruPtcniJzXOlumA@intel.com>
 <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:303:8f::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: 4882c781-46cf-4bad-c288-08dcbc6ccd4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5WNt28fWgKBKtgnA8nISMd4K0lyQiNm2n28oUiRmEixiC/opC5PezEKglHrQ?=
 =?us-ascii?Q?3AZwZIKPeScgQsjQ/bD7Wacj3J2wgjXx1iw5jj7ImT+wUGKamqpbmvYwkeEs?=
 =?us-ascii?Q?XO0fpTKxZzPT7T8of7kFPEaxAL2P5oOD2JdU701KSCvt+dSaej76TXmhym01?=
 =?us-ascii?Q?i6DI7C/kltHNSpdfCuSQYPUeFq7SthiMA9PbHWXGC1X1ZQETU8TDeauCGjxm?=
 =?us-ascii?Q?GaeMCyl8G+/NlnP9+vRtKAacEVn+TIHXeXkEauTQBjV6FkE8qOVm8OqAwrMu?=
 =?us-ascii?Q?LoFZLqESFgAzl5dmJMisAyqm8IDd0wn8Vf402D3xevei0PAr1eqkOI0PNaut?=
 =?us-ascii?Q?29GCcUAiEKBk8UzH5F9re8zP+c5Aht4s6oayvxLJE2dFbVK0F0SFYHYfQSjw?=
 =?us-ascii?Q?48zKg0XkAZLhGudHuIQEAR2XZlqu0qKNSwIo/zVaxFGd7eWRwQ4X5WAv3QgE?=
 =?us-ascii?Q?d0lZ2gOOUuT/Bs2k57sMD4M+jCiiI+zVKiUn/b19Gx3PuOPRvNiy+YZdwsKj?=
 =?us-ascii?Q?AqPgGwDsPcwXxbq5hMqlyZ13WoPwb7wFw5nw9a3kB/lVOHvRfgKmPZtMg5v+?=
 =?us-ascii?Q?v1hUQi7MUKJeG9Z+SCbabUGKzqewMquHHV5md6VcffkHHnb0rDywBnehcj1M?=
 =?us-ascii?Q?Cu3KFRWaH2UCO7GQazFIcTQnrHPWSCTZN4YogSaHZ2+eN/tJ1151Qo8aYyiF?=
 =?us-ascii?Q?91VfzCHPvyNFjDS3XG65NEgajyl/oGSPgKEL1KUc7hQZyANHtsJ8FZq1W8sl?=
 =?us-ascii?Q?EQIYOXIyTIAnea0kI1o4Pk60/IIGWBOvaeod3mptLjzvCXt2jGUI5u5WhpzX?=
 =?us-ascii?Q?HHNG7zZ3Olch3zFX76TS8pZTJuzWWVkH6EpNL/11xMCwU/0p9+prxVY+Ko+e?=
 =?us-ascii?Q?HD3i4+2Ze2wqDL+6rnvHDXl7+Qt1NNUANwQocInZaHcUOkMHovejYLyB+Ci8?=
 =?us-ascii?Q?Lf7g4BB9jhXODMyu5Y9j3yYBsYtwlyk2amn0z6g0QeZU63ugLA7HWU0F9cWw?=
 =?us-ascii?Q?9poC8W7xE2xVaCFZSuXnQDL9IZ730VrmYJ1xbGT0x02tXeMRHbXcyRsumjhH?=
 =?us-ascii?Q?C8zhaUB9CvpNIUwfzdpCd/DSmHhw13l6wwmc3zlZkYyfrNLcB9fZVtGqVJ9b?=
 =?us-ascii?Q?eUrDQo2X0H4ob6IkSbr/zjUl69FtNT6oZqjOt+qZGT1h1N7zbq4O6SraYl1G?=
 =?us-ascii?Q?9oUewB7EbKhSNTippOSGxEvkZPCDTK55CDuSW9dIYlvw8uRi/bEf6c0h+fZq?=
 =?us-ascii?Q?ePsR0Evr2V5vafqzVPL0KO/Z/zFKO2ASyATA26m5FriN3vnX84fsxWz+zMRw?=
 =?us-ascii?Q?lJDQn0Cxe2Ty8GE1ZTyGajGFtVNoJbLSrQ7JLEIdHOigww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jWROXmHa4RkE07vgpfWupYFXVr4B5Uzb3Guks5pG+G18LfjMA8BHLUCyO7YZ?=
 =?us-ascii?Q?B/+mwqM+sY1OlSjmqlY1MjENSzA5BPhRD6DZH7zVd8yL0oH199gNimQU7WS5?=
 =?us-ascii?Q?p0KIKOFRxH5YdMjQMbxhzQjEH8kfEU9ih6O3luogp+/ywRvXD551qsNLv9+c?=
 =?us-ascii?Q?guLSld/CVry61IzBwTvdziSlQd3zBzDYU7gg1khRx8ndDFpHMdAipkNG2OAV?=
 =?us-ascii?Q?QMuPpRZBpJVEd2yiJ2N3H3FQbifU/TnkLbN2vxZJEJXud93/4nTgUDDOEw1w?=
 =?us-ascii?Q?FkeaC/FJeMUrG2onjVM6T0yEwPx9+fBx8cUpDCkxm09R06/AV+ocy6Hre68b?=
 =?us-ascii?Q?xLZfCD6LiCgezsRMs/mb4vAO093MJ+sZTTYVyi96qq4GBtR4XuyV8PX+dLSG?=
 =?us-ascii?Q?9cmzi0ZMI9wJ0yjaLdB9Uou/+kw4sCRikQrksyvH7sq/Daj356n2FqXJRirj?=
 =?us-ascii?Q?5V2QsCelx0qcIgKvuHGYrcLEgFeAeokmzRMB+jITOuXY39Tx5v6pZ8Fg6Wh1?=
 =?us-ascii?Q?Y/c6/84lexxGTx7ic4e6I5+q03onE8sH3z3BwZKgnybRrtSvyXvclKV1j2jL?=
 =?us-ascii?Q?3Xs2Zdw/1Zdy5TmbeGOGD9qRAMDljOf6aAHoirp43L5AUWFJ6r4JkPnjBsBy?=
 =?us-ascii?Q?wD4Prn0ly2ODWaP50rpXZe7rpV6AYFy078AFjdF03IDZ2KKAqzzxoOhkRqap?=
 =?us-ascii?Q?fCb9wvWjqAGqzpz8xgb1wgHFbzOntAY86AiyeUdjkBJ/FoApCEq8RXP7D9YK?=
 =?us-ascii?Q?sbevz/OnHzxw1U5KtluehBPKMxmXfyFJqUmFvYUQ0i4QlZa7OoSkhIphwck4?=
 =?us-ascii?Q?QdcF6CEcJs6X6VBiR3Px/vCa3xwMv6DU/Ev1E4NvkFcPNwSy4GXkBDrhBilr?=
 =?us-ascii?Q?GNqUEGxCFeaD58Egtphv5hbuLbxZZaFqpKsJYKngJW13i7Z5vtrJ1QPCqML5?=
 =?us-ascii?Q?cRn7Wi6icQV/IJoyUiPjmnKpGaGm8UfHYtyHracg1c8s/ywO4Y7X/4VjaJu9?=
 =?us-ascii?Q?ZeMpLdzLPIQr/WgRZnSejdERZw0uVCCKK4EqX1U/ScIRNHvgt2HhQDX0iEuC?=
 =?us-ascii?Q?kI5cyoCHVJDXPEIwsPVuoiooV4KnkEqHc4wK/d/uUU+t12of+7vlm0j4Bjax?=
 =?us-ascii?Q?VgbYdJSWEmHzjZ9EJ3sXNs6isl7Wy1Pc1D29phUEu81DVo6+OYrUJysoD76G?=
 =?us-ascii?Q?VSf9I/JeleMRzA1NkWGXtedKrRXGe9fV27a6qYGF8w6/WhmY2Wqp9GxyhYvX?=
 =?us-ascii?Q?ps0Pt4RYHxsmg+P5H/D07YDlEAvwhXHwe3Brrlvdyrn3DUezPQJLUiisYfhZ?=
 =?us-ascii?Q?0zdqFSoeuk7Jx+PmSAd+bI4UK+f5INlyP0pmiYSiztarI/gmFSXOvWUi3rpf?=
 =?us-ascii?Q?LHjZc5RbNe8QA+Pauj/+SdM87htdma0nLy1D6rArLUKgawG0Xk7QxPM8DZmf?=
 =?us-ascii?Q?uIlEPyePuqdiJMBU+uPxan34dWFdQ9YiBKGLp9vuaUYlIzW7tqkX1CD6ySgh?=
 =?us-ascii?Q?3typ25FfO13XY7J2ENdTDOQRFN01f9FPLi0rnF7HHCQd1qL8isDoJMUBd9Xx?=
 =?us-ascii?Q?2sz2C/bLo6ocSrKxEinvpBwqrNv4s7PCnxzHOiHsuOIX7P9I1yDDDto51neE?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4882c781-46cf-4bad-c288-08dcbc6ccd4d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 14:24:26.8879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohW/vFgitccn+n3XDNCazJGxcRKIYSB8TOCTLwLpyd+dOqcc08fjL+sL7Trm8F/9MTQG5K7e9ImYHAYUdimJyxGzNGFiGyX2bH0fQKfLSQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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

On Wed, Aug 14, 2024 at 12:16:41PM GMT, Aravind Iddamsetty wrote:
>>>> i see that this is even called from xe_guc_exec_queue_lr_cleanup which is for long running queue
>>>> from various call paths need to check in what scenarios those happen.
>>> Should we add a reason for long running queue?
>> Both of your questions would probably be answered if this was getting developed
>> at the same time of the user space usage of these uevents.
>
>Can't we consider the generic Linux user as a consumer, via udevadm.

No, udevadm just confirms that there is an event being sent. Main thing
to understand here is "what is this event useful for? what can be done
as outcome of receiving this event?". From your other reply it seems
this is about "device is wedged/toast, and driver can't recover without
userspace intervention since userspace may have different policies"

What would be some examples of actions for userspace to take?

	- Unbind driver, kill clients, rebind?
	- FLR?
	- Something else?

Is this currently implemented somewhere?

Also, is it possible to make is a generic drm event handling so distros
don't have to setup udev rules for each vendor?


Lucas De Marchi

>
>Thanks,
>Aravind.
>>
>>> Raag
