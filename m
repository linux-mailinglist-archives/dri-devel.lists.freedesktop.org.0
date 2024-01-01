Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4887821317
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 06:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B010E03A;
	Mon,  1 Jan 2024 05:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4F610E03A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 05:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704086815; x=1735622815;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=qLURjs9VsOgWTIQXsi9fLYUTBKBj3g5y3VbKWQiJOYM=;
 b=ALNgQ5wYFzI6SCpe31OYSmOjanq2KLai22TvKb/A51nHOQBbYY7WRQaD
 fX1D26gNxBSaN3KnY8Hn/9n3GkbGdFxe4zwpwuGBA2BTBcfkjRWqCBKa3
 F1BXx6b7fKo/2/T8WCaMREODF3Ic0i6/wzS24AkCQcEvhdTm9TvTvLHhG
 rblIIbj5QL+Ut4FLEmhBfHuJ25Uby8RWj3j5f1jW7+lwzy55NlC9Hz81u
 H0buInSz1MU77tSN4eqmQp4do/l+DnuXrNCZ8aIhv7jhlpBqkhqmIoNNd
 DHGTSPumPQC4t/ZWPO8h7XkbzvOQ/RYoYB0Ds+cAo4AtQv1Hugolqwhz7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="10164763"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; d="scan'208";a="10164763"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2023 21:26:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="782853483"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; d="scan'208";a="782853483"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Dec 2023 21:26:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Dec 2023 21:26:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 31 Dec 2023 21:26:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 31 Dec 2023 21:26:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+rk1scmPECuDBn7Co6Z2wWMrRAggNcBOVXVLQML7j1GIeLlAXy+QHodzpnO37dTj+hdo8cveU4Ehdsf0MKSEpI6iXNgAn9uHH8o3D6b2pnQ9D9NvzOISX6+OJfj1I3Bhu6EyMyBgSi0nfCTZ9K2/crni9mZ12JIgmzdTejSVLkefLHyW3Cm8ZdjoDFUYVntDxaNKFotyUN/vsibWppVJXlgkf+aynj5g/MD3/0Dtagb83bed9uDtvXbYgMpgr+YFZ65oSz0Y2uUzq1QveLjY65lSbO7kV5Md24HQzxKGi9Ko/8fJ/BVyXc9giT+JOZxB+ZCX/UlEDya+yqDGTA/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ipcx829yYdrtbbvDruxhsfyK6tGqfzTq/dzFcmsG0F0=;
 b=PGhKXn3zVBs7Q5gR1EoetbFl0EW0hJbBjWrkLYiqU9bMngqEnVnHohpfhOWKDsrfBTIsDoM54ZHud8SV0Ju04si8HhRTJ5uBN32Jso2goAT0c3msuU3c/q3FGsEVh1RfItoki2Huq+77eEQXwwBxXiecHxjM1pCtpVvW70n7OBC/5G+i8bHMcTV89DRrNRJWOOae4rc4aYCMKo4Kb5elCbQWY/soaT6VEbR0UVd67bLL2fsQS3dTorrtFvMUYIOhe31Bkl0C46g+gb/m0OgPU9SlEBxzD2qk8igWGzsmdMauW0kJyqV0ZtLiIgFz5Lcy4vrlEnhc9OF3+DBi+9PLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 05:26:45 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::a0ff:c576:dd44:3f12]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::a0ff:c576:dd44:3f12%5]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 05:26:45 +0000
Date: Mon, 1 Jan 2024 13:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
Message-ID: <ZZJNCgy8yD8/l6P8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231229135154.675946-6-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: ea603302-fab1-4fc0-cae1-08dc0a8a3e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cf26toquSGfty3mwixklK7DORq2WG+JJQJrSLxBJYlRMuJgfEieBp8SDHDRNABO/7aWBWsyysCmO35FFtq2tOMnx0K19dqCDxuPuTsYB1kUids4RaQLQaf9WUbpy0/HqRgU4ISDpfGHfwNOn94Zbeq5uCLfjFXvne9afK/YeQvyuMowkvp1agQozDE0J4RVQfxEZF1H/ZIN9HcSQpVfUaB193MF7crxr0D1g8Khx8gpV2sUfUQV6X2uXfcmya+Ata2qe85ms7fBTd4+EkVvzUdYiJfzDWMSF4twrN58fip2dPvrdD+KxCvdxSRh8V4AgEfHjL5B83RQpSH+uRBkkD2TSRRfg100RoUgWXRnH63nqyldoaGkq92YgSq0YMmX2Q7XtV8uk1wNc8RX5cBGkUNIpAupr1ORGZqkxB7Wg4j5Km2rm17mNxye/56mPtzPgKVNF7tawq7qNnacKtLgpS6enE+4EQ6pS9TudNTf2iVKjoJsmOQDLZQW15E1dGuX8bC5D6Eq/5rX9N5J5BsrkKiGZBNMm1cfXSIEdZ8h9Mumau6FllBTsRUidk6f2XDA12EY+oOj+LYPL9Ff13gAj5Vx4TuXrRR9Pk7e11RZMWJiHbX5xIsV5Gpe+XdZQx9xB8y+F6bBJ83mmPUNap9gO+BWhUyqFFIvaKeu6mFr86J0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8414.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(38100700002)(316002)(54906003)(66476007)(66556008)(66946007)(966005)(6486002)(478600001)(5660300002)(4001150100001)(2906002)(7416002)(4326008)(8936002)(8676002)(33716001)(26005)(41300700001)(9686003)(6506007)(6512007)(6666004)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vVcn/bGfdYHfNm5Gtq8QAPJyxUQLp530p4wN5OpYly/6e6HXEc2+2jgqYwtZ?=
 =?us-ascii?Q?xbI7gUiS8LTLryJMAGo2uBWz6KqnaRc3wKYMUzT6K4S4Y7QJubu1TJE0JQfr?=
 =?us-ascii?Q?fwzGRB0V88Ip+po8HTxCk9cqlffY765gCvA56sHEdChilXwqXLDX048Vno4J?=
 =?us-ascii?Q?NambmIIW35TFPm84FuLb70fRHGYel2oJ/BAMtG+eq8ZfZdAX3Q9CFp/jXqzA?=
 =?us-ascii?Q?fdHAhm8XILu7ZQSo3CCvzjLUSajAs8B9chY3aXHaVf7Jj/i8heV0OZb/lMO7?=
 =?us-ascii?Q?eSas3N08SoVEhSoSeOSwZfTnuHIziNAV00++5o/A+TH1ExHhAqRy+QSvVWUx?=
 =?us-ascii?Q?BjROgPgihqViDyxw0c3cQPtm7ziTyrI2mJhd8N0Qf3iKwqcRRe2q3Im/dGpg?=
 =?us-ascii?Q?/bPZKbIIqlYNijlRfFqsL7+tUxZGhxJ6MmNREcAYJZZRfTGLdNDNMMr+N+Dw?=
 =?us-ascii?Q?6E7YcFfhXwdj7UEavjNtvFrWA3WFzvWHl0MveEwiX1oFMWp74okLMH4mDtkE?=
 =?us-ascii?Q?N/j4baHsDNFBjz4IbupYhZDhgsNRsLIYY50dnrX0MADt7+3lUlcoZ3CSCv2s?=
 =?us-ascii?Q?psjDaUhgfvlOKtyI2DwCOIlYnrAd3dLx15fED8QkTFjm3p4uxsl9xfiiE3gp?=
 =?us-ascii?Q?R6tr3u7gvQtTYeX9cfWiyw+BX9SJ7y8E/RQDFX4UupJ3bAhOh6yf9jYH8poE?=
 =?us-ascii?Q?7ZNqszEjTeWao1YIu48pANqjP0cQGFrQ+U77gWZQlqQ+CBJMmktYfVlzfrEs?=
 =?us-ascii?Q?41oba0cWm7NBeXB9RBcRZhrAy7eusq16lWa8KLGOHr/ODlbFnDdBlyz6Lzer?=
 =?us-ascii?Q?oQYI6HcS8hGLmuzLkcXgXPxAO/XEi0OCqtWjfpT0XfRM0qIebjAs74CyqzgZ?=
 =?us-ascii?Q?VezDNT9Pqfs3yDAJ3xeDJU9TJr0WU7fJ+KhV34e9aevCL+g8O71NykjDjHUx?=
 =?us-ascii?Q?YxkAYTi8N3JjBvG8yKtNlrC7JciJ5zumZL4NWRvIg82YbKC+yZ4jes1Hdvoj?=
 =?us-ascii?Q?NUQDNzZxSOtZrGKUwQYd4kG51XeqwAQiUA6+RD0Zzn0KX7QleMtYDbJ30yBQ?=
 =?us-ascii?Q?nMqiQ6VTRnZz7LIAMHrpoaLAtBdjGmtM6hu7kmONtMrRQvHyDWjS2M8IBPZF?=
 =?us-ascii?Q?kerwPHMqTkXKxNiE9O7UGbZoYLZRBs75fBVNkvR2ujL+sn3s6bRaTC+LwEoO?=
 =?us-ascii?Q?dBnl96wC2JFSEPAtDzbswwmySnnlRMrz7Ndl9xNIjibJ02nxwjCz+lAneY0Y?=
 =?us-ascii?Q?4XVnR7Vj9bZ0YpdQ16tHChRQTOZiafwwK7b3InIo9NGkoxBydf8PPpoFREBv?=
 =?us-ascii?Q?BMxjSKKkHWCF4vlyA00B4AckiYcMRiCntR116dpZwBHKabXuQ3Dc+TqERJSn?=
 =?us-ascii?Q?B4wadwfHDVd7ha047s8uZxWGZ9Zxnn+kZZuu1VraToLIxWEImjPKREMzyaaH?=
 =?us-ascii?Q?a50xxByG6sh6HvzNcKLYkAc9t6LltVsfMtyBoNJCpbIkmsu83e0ZOctW1DkW?=
 =?us-ascii?Q?m5I6XpiQT4ESlJD63uikBDpN/nYqhC+8VnALitproFO6FRzIMLlSSyylbhuj?=
 =?us-ascii?Q?MINBYjP6OMhWeTififuy8Rgw62U1xHUhQ0Eg47FzIXnD9NPjMTHkSS12ZoI8?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea603302-fab1-4fc0-cae1-08dc0a8a3e5d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 05:26:45.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w6sRYgfXsbdfAOk33CSrBpR9uOHAKfAHxtJ9smsrwXoMC0ivqsRZTiYNGJixC0GSBEXeSC2L7UWiHBpFgkFTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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
Cc: Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on drm-misc/drm-misc-next lee-mfd/for-mfd-next robh/for-next linus/master v6.7-rc7 next-20231222]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-mfd-stm32f7-Add-binding-definition-for-DSI/20231229-215601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231229135154.675946-6-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 5/8] dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231230/202312301748.2BRGs7Xs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312301748.2BRGs7Xs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml:21:7: [error] duplication of key "items" in mapping (key-duplicates)
--
>> Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml:21:7: found duplicate key "items" with value "[]" (original value: "[]")
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
--
>> Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

vim +/items +21 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml

5ce96fe032f43e Linus Walleij  2020-02-23   8  
5ce96fe032f43e Linus Walleij  2020-02-23   9  maintainers:
5ce96fe032f43e Linus Walleij  2020-02-23  10    - Linus Walleij <linus.walleij@linaro.org>
5ce96fe032f43e Linus Walleij  2020-02-23  11  
5ce96fe032f43e Linus Walleij  2020-02-23  12  allOf:
5ce96fe032f43e Linus Walleij  2020-02-23  13    - $ref: panel-common.yaml#
5ce96fe032f43e Linus Walleij  2020-02-23  14  
5ce96fe032f43e Linus Walleij  2020-02-23  15  properties:
5ce96fe032f43e Linus Walleij  2020-02-23  16    compatible:
859f1d9e26606c Dario Binacchi 2023-12-29  17      oneOf:
5ce96fe032f43e Linus Walleij  2020-02-23  18        items:
5ce96fe032f43e Linus Walleij  2020-02-23  19          - const: hydis,hva40wv1
5ce96fe032f43e Linus Walleij  2020-02-23  20          - const: novatek,nt35510
859f1d9e26606c Dario Binacchi 2023-12-29 @21        items:
859f1d9e26606c Dario Binacchi 2023-12-29  22          - const: frida,frd400b25025
859f1d9e26606c Dario Binacchi 2023-12-29  23          - const: novatek,nt35510
5ce96fe032f43e Linus Walleij  2020-02-23  24        description: This indicates the panel manufacturer of the panel
5ce96fe032f43e Linus Walleij  2020-02-23  25          that is in turn using the NT35510 panel driver. The compatible
5ce96fe032f43e Linus Walleij  2020-02-23  26          string determines how the NT35510 panel driver shall be configured
5ce96fe032f43e Linus Walleij  2020-02-23  27          to work with the indicated panel. The novatek,nt35510 compatible shall
5ce96fe032f43e Linus Walleij  2020-02-23  28          always be provided as a fallback.
5ce96fe032f43e Linus Walleij  2020-02-23  29    reg: true
5ce96fe032f43e Linus Walleij  2020-02-23  30    reset-gpios: true
5ce96fe032f43e Linus Walleij  2020-02-23  31    vdd-supply:
5ce96fe032f43e Linus Walleij  2020-02-23  32      description: regulator that supplies the vdd voltage
5ce96fe032f43e Linus Walleij  2020-02-23  33    vddi-supply:
5ce96fe032f43e Linus Walleij  2020-02-23  34      description: regulator that supplies the vddi voltage
5ce96fe032f43e Linus Walleij  2020-02-23  35    backlight: true
5ce96fe032f43e Linus Walleij  2020-02-23  36  
5ce96fe032f43e Linus Walleij  2020-02-23  37  required:
5ce96fe032f43e Linus Walleij  2020-02-23  38    - compatible
5ce96fe032f43e Linus Walleij  2020-02-23  39    - reg
5ce96fe032f43e Linus Walleij  2020-02-23  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

