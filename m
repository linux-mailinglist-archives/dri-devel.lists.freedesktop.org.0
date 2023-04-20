Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2D6E9C3F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 21:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BC010E305;
	Thu, 20 Apr 2023 19:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4F10E305
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682017784; x=1713553784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/rSwT408x8H1Bw6KNf+lmbhhbbl/0omMvTmeyKCYC3s=;
 b=fLXDBqWlGmQtvBXRRYlFCN5J/77lc6Btr97H75Zt1OxtoXAI4xMaeyWv
 FveQ6oqXwWD6bX82mZafy8Q3zonuZyqP0HUbTn7eQi4eYzAhzq8osSrIW
 Ngslg1Qz/5jkAg6oTCOi9Z7svaKYWDkPHU9pQJGcc/Xbhjp8ZYbqpz+C5
 gJUBJ1IvFg5hOcyt07GMFf8JZvhRuakx9OXf/+YparsQVnXXLs4+Xwwa8
 a0nxePtvpfGdmNSl1LYSEMOdRJu68O9SeX/Rju61FsT2fK42aVk1ni4r5
 KUKGG39hJDWhG/j611W70USf3JUryjh/987YGVbCVtE31yh8XbarButil A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325432613"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="325432613"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 12:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="642242526"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="642242526"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 20 Apr 2023 12:09:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 12:09:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 12:09:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 12:09:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BX0g73QleGNgs5wcpfIHnL8HcU45CViKnqLnW4xYz8who2dCEb0i/iXX6fpuAnDadTNS6HTCB0DtFrrvBhF/rK79rvW1JiLcgd1/x3+d/KbbNQGvfZylRikRWwgPwwx8dy150jhuBSW29P1ljSsjgmX08OxvoxbjEx2e0b5Y9G4unvACO1ax3pcwmC76e3xJK9wdssczVS2Kt8hOy4GMyZk8nXDvuLcFV4YOx4mPVtMzxdNSGQa1N06gP8cB/HqVsD4/15vUTNs7rElX+lHcBcA1FAYWRO7IWQiTSTIFc8O3uaUWhtcLBNkMFY9PygYWQnMJ4PqriGUXcKUdVarcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhESdXTg/hxEbDaFVDB22cZGrj+DGDlsj/f6mB+OQVg=;
 b=JBWQ1dc5sJYbuYJyMoe/wFHb0yMNQdB6KxaOOAwM8/XihVPtncNgbyrBFD8YXEEtOSVEqZqwwoQVKqMOmxgcNkKETTDtFcU6jazSMfkNBVBGMXHs7PdWDwvJFRKPUZel4Z2RhS0K47My0bLIc+uvI1lcz/oQiH8hXATrI/w1dYpleKPO3Et6l53yWQN4eIIuRHpR3D6VjOOTuMuiUstDCphnL1oez8G+behXqxUDOTDLrQucdDuOqtZDqhdaoNTcvzcpBWScdgvIoNWP7U1e2GxoTIb077pCo4l8hkI0DHFQXe0JknfP1hcz3d6hriTnozwHxFa3Ax8N8VT+jmLEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 19:09:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 19:09:40 +0000
Date: Thu, 20 Apr 2023 12:09:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
Message-ID: <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
X-Patchwork-Hint: comment
References: <20230419043652.1773413-1-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230419043652.1773413-1-airlied@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4052da37-1248-4b1d-68b3-08db41d2cad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbmKO9hHWyVSM04zI9zziZj5nSNRae2lzHauQ015oeW6nXuyNsHCcoi7kXgXj/0U0ekd3fTKYazDBOmJ/GXcKhW48yP7XvTN5Fu3rjsIAG43m7levjFo70MPlSjTNqOh90E9HngIrnYoqhUeVHyl7xyem5BZrJ5/Q8HkQMq7xzKuOx+Ya9mHcziui3iF+ryAXkgnt+GwinNTvUFnagXSDmXkYjZMlWdwGm+D1W6TyJ0u3PBX9B4ciCRvMwa+xhG6g//uWzAdJCrPT6DkJ2IX54ktsmZL/w5jxVH7LNtg4OJRjFTII+v0kesEpI6eTEggzdlp7tyqoslnRQ5sXly6LwTG+5gseW3PjtfxbIf20jEs4hXp7aJWMiiPxSFymw5anD3PR8Hwue0QFLSsSx84CHD8ezzK9WWjHSDZdY6t4Wj+NCsPwjrwqLPqlAOYvI3fA5vXNcX+c1oSlpEQGHJGAOeNrxbPP5ocLZIzQeyZyo25xJAQC5QAH2UD21BpUT0pczOaLBQ4+tnSd5qvLi4tlMoPPoE7whIMKJl9yZofLRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199021)(6916009)(4326008)(316002)(54906003)(66946007)(66556008)(66476007)(6506007)(9686003)(6512007)(186003)(38100700002)(83380400001)(5660300002)(41300700001)(8676002)(33716001)(8936002)(478600001)(6666004)(6486002)(86362001)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jobw2092TrFvaQqo5o3QJPXVTYIU4qOReWGmmirRmYViy0URA2J34DQQA0ri?=
 =?us-ascii?Q?KPt4gx6QkRnqLXGS8EM1/r1MzGhnGLeyZJozFVeCg0VtgvBDvbPvcxcdVEx1?=
 =?us-ascii?Q?8weSrylDyzsYRUC+CAAwNtkko1DbWQeBwSxzJzmGh0Wfu+az/eGGQfYctcdc?=
 =?us-ascii?Q?jZjJrMhobOVabys1B0SCuMK3thAqlBe9XAVtD0CAV6MelzhMpD+IYuZW1iPA?=
 =?us-ascii?Q?fUdF6599NRFsZKYqwjSax89EdjVXLF0YaeBUmtp1qd5nb4xsMU7JPMN+A16d?=
 =?us-ascii?Q?GaJcOT2xO/OBAs57gVefXIx1UMNBTdaPmwV/DCf/Ou1A5sLRa9bBWZXobTlU?=
 =?us-ascii?Q?JW18h2+v/kMEv+WiM7/RSCvevtBAlgmkFqAdj63RoR+o7UqlPVSKVXayga6S?=
 =?us-ascii?Q?MFJAMBqc+KICmwR0d6P1ZiG3XjSC+ElSJd1kP86VcPtHuVm+gU9R4PMw/5fp?=
 =?us-ascii?Q?gySKEbnHfO4eJ08r7xDe2pFIaZcsqpqt3Je37kD+qREfqKNY9WOJ+NrjyaWr?=
 =?us-ascii?Q?Y3tUzhYDzceXm4HBEodPLWlpyUQ3j9ZY8cudDmHJ4JYILoUqpoAgke8/e15m?=
 =?us-ascii?Q?jcw3RualQt0OhRd1ZIWTQg1IJp8sjl13ZH/T1wx3+j9jUk7aalhnJqXWB3vt?=
 =?us-ascii?Q?TIkxyrG+toTQN/Mq0SaKz3SzFUXkKCkbjMKhgOMobscNaT0E0WkQmfnz6Vwu?=
 =?us-ascii?Q?2nrUNqsMdVRPD+TntXoLhAdOXzstVxpyypZvLecR+zHRq7QZlzt2ehKnjPlQ?=
 =?us-ascii?Q?ctle5RDysC220DUVdHzfva/tvttywMMyj2E/kkRM2lKOBBBcwIsEKePy7tar?=
 =?us-ascii?Q?cXLkmK8JKZ1hmAmTtYIkaEFYQytjez2SuKkOzirywIpXF2XBlIQKzgJXlhS9?=
 =?us-ascii?Q?jBtvzuma3ceEFEpat+NU86ke4h4RsIQEG28kZSjUYKMKdj/FyX/9VO+O0ijB?=
 =?us-ascii?Q?2OFDtFRrf7B5b4YTCF1dRlPJNxLA+LX/LaMd+fYfZFYTaR2lvtOShUV4zpxX?=
 =?us-ascii?Q?uakM07tgkMikMiYYgov2pNcTRTqQGNtca3yusA+MLQ6UMldqyYJnwACP/6iD?=
 =?us-ascii?Q?mq0P/exTQHJ9KgStN6CQwSbWiZ43SBiVkECiKSGbfyPSubew6P0JBH3sE5Ri?=
 =?us-ascii?Q?ce+kpcmauolqeTikNRKTZHUV17NY15v/BcWDNtiPezrL9I5jfY/kbZcxIRDi?=
 =?us-ascii?Q?juz443fxkMGZKH5+kY39ut6gG1E3kPYL9mvbAVg2qaFgd4RrCBShzsIIPhu6?=
 =?us-ascii?Q?ntWnPqOUMkOtaNssXnfKhQrGbNiKzOrSb28+LTEPV5Mm8hrk+o1XBT9fXcA8?=
 =?us-ascii?Q?T4wDoPp5vyjiOskaoL1l/mZ/GefbjslVaPwVSQHJf76U/eJ2o+R0yzDHiy+Q?=
 =?us-ascii?Q?at857Dz4FFAFmLJzCcFBtAtRKvJVm7lFpFxbheFDAG1G8qolRzFefb00unmy?=
 =?us-ascii?Q?uITcfGFOf7nlJ7HXYeDmwg0DRUHkbRnud8aecjHgFerbNsaLrEK0qyU5xlGh?=
 =?us-ascii?Q?jPCXe8idTXz058KQkfH8bFZeUDyJYGLVx46ITBjkvpAZ8qUjBgApQrUewFOQ?=
 =?us-ascii?Q?epIcDtsyZ9foxRdAP75paJPUuAEUvxXw+7RXC/3ZqqKapngHWJhc0i3wonSd?=
 =?us-ascii?Q?CXb3muvlkIEFDmx41oEibRYQComDsnGm3ZRp/HJrk7JkBCEu5EkGtYJ4V+1o?=
 =?us-ascii?Q?uVx4RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4052da37-1248-4b1d-68b3-08db41d2cad3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 19:09:40.6956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: os9LgWfON6C63zuqmPOHEgttgOHi3jdzq6Vy6RZvTLLo/ss9IbNytlxl28PTFWI3IdcfMCWVzjn9XMzdqyreXSSUQDItv8lWDbZ210El4Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
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
Cc: Dave Airlie <airlied@redhat.com>, Luis
 Chamberlain <mcgrof@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 02:36:52PM +1000, Dave Airlie wrote:
>From: Dave Airlie <airlied@redhat.com>
>
>This adds a tag that will go into the module info, only one firmware from
>the group given needs to be available for this driver to work. This allows
>dracut to avoid adding in firmware that aren't needed.
>
>This just brackets a module list in the modinfo, the modules in the list
>will get entries in reversed order so the last module in the list is the
>preferred one.
>
>The corresponding dracut code it at:
>https://github.com/dracutdevs/dracut/pull/2309

it would be good to have the example usage in the commit message here so
it can be easily checked as reference for other drivers.

I don't think we ever had any ordering in modinfo being relevant for
other things. Considering the use case and that we could also use a
similar thing for i915 / xe modules wrt to the major version,
couldn't we do something like below?

	MODULE_FIRMWARE_GROUP("nvidia/ga106/gsp/gsp");
	MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5258902.bin");
	MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5303002.bin");

so the group is created by startswith() rather than by the order the
modinfo appears in the elf section. In i915 we'd have:

MODULE_FIRMWARE_GROUP("i915/tgl_guc")

There is still an order the kernel would probably like: latest version.
But then it's an order only among things with the same key.

Lucas De Marchi

>
>Cc: Luis Chamberlain <mcgrof@kernel.org>
>Cc: linux-modules@vger.kernel.org
>Cc: dri-devel@lists.freedesktop.org
>Signed-off-by: Dave Airlie <airlied@redhat.com>
>---
> include/linux/module.h | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/include/linux/module.h b/include/linux/module.h
>index 4435ad9439ab..f02448ed5e2b 100644
>--- a/include/linux/module.h
>+++ b/include/linux/module.h
>@@ -289,6 +289,8 @@ extern typeof(name) __mod_##type##__##name##_device_table		\
>  * files require multiple MODULE_FIRMWARE() specifiers */
> #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
>
>+#define MODULE_FIRMWARE_GROUP_ONLY_ONE(_grpname) MODULE_INFO(firmware_group_only_one, _grpname)
>+
> #define MODULE_IMPORT_NS(ns)	MODULE_INFO(import_ns, __stringify(ns))
>
> struct notifier_block;
>-- 
>2.39.2
>
