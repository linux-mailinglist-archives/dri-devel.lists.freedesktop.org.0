Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11760CD63
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 15:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E6C10E135;
	Tue, 25 Oct 2022 13:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3B710E135
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 13:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666704425; x=1698240425;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=paJuRxb8cHz0iMxsHe+/vqiB6rJqoXTMBYh/netPU1g=;
 b=fZkI8u/FVtNesXbg5zeGqmNXWaH0OOanpYusPuMIZTTiwL5M/xhVqTZ5
 z9Or7/exmSco+gh92qn8iD9MMYzh1wrHB8g/42UbaREoIJtUTm5Gk5H2U
 Q1nm5KxtN+38f06RDlzZR+0dyjdFAuSVIMBOfUzicZ7nBvWXnLjeR/YTp
 06Ao88JaymKbtyjfbOeoMkgPPyxNO0PNgnxgu00zQ/+rHvWUAuxvZ2iHe
 xaz1aFRz6dpFJB3YTLnwxRRAXZG46Uw9Wla5koOYPiCNTAe/OpVid5xR6
 q3QnXYYALCgCq8tHhlwswGf4SBqUugh1VfuHubDXcjDHWAy2xyfP/+6Eh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287391015"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="287391015"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 06:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609568786"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="609568786"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 25 Oct 2022 06:27:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 06:27:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 06:27:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 25 Oct 2022 06:27:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 25 Oct 2022 06:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFuA/Va8vnbin4G0qf1rDTYhoVmyhLz/q+iuExxSpFV47Y0GbAgoGRCfLLGayMWpLYo2ognWS99AXhmTeCwRkVM0A/DywhGATCu6Mpv1PO+rXj84rvgfyW8YlNcB3RAJYEZU2wD4lNPSybUgsay3lVrTcjIxcB2Ug+FaUlsi8IBGAOZMHTb/dDFWK1+CRTpR3nxCvsnCl6H6Tu//op/dw2j4/iIsk1J5lqze2lr+WPZqn5vTy9EvjZGF8f0OFKLnDVSSzaOFQr5toD14ujET41Eal546Mjv9xhaMgQ8JJ/jYeCLbjNVbZk8NG74FAXfEcsZSOTxhulZBHsP04LL/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrBIwgknhTUrIXVEoak0qOcYlk1vXSyCCDnl0CkGMX8=;
 b=K7RIGfIIeCv4/DfzD0xn9Vgg66m0/+s2XJh7RH3E0ZvvkUwkmz6cJO2nKYWbaqM5INAV4P9VXXNSYyN5O0NOUMKE+Zw0E2Wf9g/Eh6Dp2+upLyImmiN8JCHhHcKd8/rNm2IwgIRzlPZfd9D/wlhm3p6fe0ui5J+VJYM8i5cDUlrAwGJM4leYC5wx9RFNQ6CMv8Czs18xDODTd9HQYqBg+oyeAmHFTgqY80ag66pAHEauTA+ESMzMZH3VOi7B02MwveCLd30C3imfG18LUoIOfILeRl5ivGo0jD35hD2ADEsW2OOKzvjhiV8/+6kLxra28v9il9i+xligNZylSlGFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Tue, 25 Oct
 2022 13:26:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505%6]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 13:26:58 +0000
Date: Tue, 25 Oct 2022 15:26:54 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
Message-ID: <20221025132654.fcbw7xvl7pu3yp6c@nostramo>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-4-ogabbay@kernel.org>
 <bf8df463-3413-3027-0f4b-3977e6860404@quicinc.com>
 <CAFCwf12R1CWz8GdJ0sNsVL+_5b+G5Wqf5qwZ8ixtoXLOr2-obg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf12R1CWz8GdJ0sNsVL+_5b+G5Wqf5qwZ8ixtoXLOr2-obg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0597.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2ac2c3-510b-46d3-27bc-08dab68c96ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyUKUG6s71VfrKWCPuRE5qa1v+Uk1CycSaxePDEqS6kAVcrq0x0T16VETIJcRnNRan8Jm0EnYI1OUkMiutrGXJY8wEGPy+ykvK6erY5i/gh0rSNo7rfp81xZLSxCt2yom9xVmZoE3Yg1oxwdn7xsyx/WxOPNyp/XtsHglbZG5EiCUbTIaxuMqh39K6kcIbrpIsWHCAI16wC6i2PB0ENDM2PPThTzNydnuALoPCHr9WSUsb+o9tZb83mI2fmPPwrdDCHKyvMOJHnYW/oWVsGlzcoHs5+LLSR0EhqHETuMyjXUSwLch4esIcLGhc+I6IiHFYSZDnbw9Fw+yIuS0VEGYtlVYekQG6WBQIIETbKkc/O5wAaHe/wII2xY6jIbxUMu2LC5GfpjqLEmSDooGuk6wO31rMZj7jfD5YHcVpdEo5QXxTrsX4AAvfvZCnAVVAVudQAUS29vAn8mzsQgLPmSAUHSzj8VguucXsAuDh3WezFzQoarpQxopx7sN19+M36suv6l+VQ7s0OQiRmiW/Q3KBowKuxveeFSLIP7TtZyQmiaJQL5hlHDXT0UAXHWIx0w7Ck0QOJKvIe30/oac5yVwU49U2Hjt9WRW/PAQ6N8+ZJS9FJc5WROCIwoe0rgXfCL74CdQJlTfFG6x4l4++1axo8T6g+SlsTNGI5aRgsi62U3t+5w2GUcSwoQ1WsffsqLtQPD5jYpr6qGXBTwXwqIqWRyzFA1dGzOmOqZPjw932Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(6666004)(33716001)(41300700001)(53546011)(6506007)(38100700002)(82960400001)(7416002)(5660300002)(6916009)(316002)(54906003)(8936002)(66946007)(478600001)(8676002)(66476007)(966005)(6486002)(66556008)(4326008)(86362001)(9686003)(83380400001)(6512007)(2906002)(26005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlA3MTV3UUN0VEQxVk4wL2x0bUxFcm9rUERCc3FZVldRWHIwb3k4STdFNWJ4?=
 =?utf-8?B?RWhvVDF2OXladWN3R0dOeEQ0QmhMVFhndTNuZkpKOXNwdE9paXdWRlJHWkxN?=
 =?utf-8?B?QWpRUkd5R1ZidkFUUUlSNjdlSzNPY1J6OExZTkxKWGV0NDVwZXpjS0RZZjcv?=
 =?utf-8?B?Sk1ZTmZSMW9tenppaWtRbGVXSlZ3QUlJV21Kcm1MK0xuMFlpdElPWksyaTZC?=
 =?utf-8?B?TzNGdFdsTkJKdjE4TWh0NllxYWlXYVlTR1RtTlQraFNCSEwxWGRjaTBYdVRa?=
 =?utf-8?B?SmdCZnNDeDRSQUU0bWNzc1JHaDRvTGJhTVJvc2FPcEhQb1lsbzJVb2VlTTdo?=
 =?utf-8?B?b2c4Ri96bnNpZmxSSS9PVVAzTHNPTXJkWVRkakFYOVZjMlRZSHpaV01nYmxj?=
 =?utf-8?B?SVBCMndDM3Q2d2todUU5WDdTZXI1VWFaMTM1ZUZtUzBjN0JMWWRPZGdkdGxR?=
 =?utf-8?B?dWczclc1by9zWUJjRHZsK1VzOWY5U255bXdlUWdhUThSMlRZWnlqTkNQQ0Vs?=
 =?utf-8?B?UHlRTG43dW04OEY4WE5qOGRzVm9KbjJObXIzY2M2VVB3NUxsV3FhRVRJTk90?=
 =?utf-8?B?M1lqb0Y0K2VGYnBOS1RVS0lMbnJDOWJBRGJWREFHMmNqVnk2L2ZLeGs5dXRp?=
 =?utf-8?B?ZUx6d2JMY284MTVZYUMxK3Zqa2JQekJnV1RVYk50ZFVLYTV4YWF5ZUhCN3FZ?=
 =?utf-8?B?TnI5bCtwSFo4b2tNMGJweCtPb2ZWT0JIMzlsUjFuM3ZEbkl3R3dzZHdrWWlC?=
 =?utf-8?B?SzhMZ2h3R3c1TlZ6MVJ1aVhEUG5YbU9NbWlpSk5oWjRCTWEvM25wZ21VQ2VJ?=
 =?utf-8?B?RGcrQ0ZuWmg0RlJLZ2JjSHI5Mm02MnJONUtQZFg5UEJvaFhnM291VTZBU3pF?=
 =?utf-8?B?by9sblBCcU9PcXJkNUhwZmlka0ZYNWZPbk1ncDFDRm50SXZwMEkvNjJHbElZ?=
 =?utf-8?B?VFA5Tm9YbHlncHFwWEFnRkJySjBDT1lpNHB4dkpqUnJCcjZDMTB1NWNoZUVs?=
 =?utf-8?B?SUc3clltYzlrRXNTOWYwNVhkZEJsNjZlRVh0NmhNRlNlT0l2OEQwdVlOczdw?=
 =?utf-8?B?cTlINTdML0l6eWpzZzMxR0x4NXkxVjR3bDdZOXg5MGJIWU1xMmlDbFlRMnRS?=
 =?utf-8?B?UFZvUGlWWnVhVjEvZWJETDdPYUhDeCtBd25sd3YwMXJQU3liRUxMY3Y5RXB5?=
 =?utf-8?B?d0hrMUhqOUlJTlZ1WkpuOSsycEdGeGFuQUczVXJZNVJNaHNBdzMvQXBiYkJZ?=
 =?utf-8?B?WFlYR3JNTkNHTG85VFliWDJMRHJqY3NSMTRGaVZQT2ZGZXZHREFQMUc1SmRF?=
 =?utf-8?B?SUt1dTdHRkl0TUVuVGJrcVdHcnBPQk9vNUVoRlBhdUhUNVZSZ21makgxejI1?=
 =?utf-8?B?SDBURkVIMXBhT080QkNNaG1uM0VOa2J3czR4L2QzZzM1NlZlaU1IMWtqaXVQ?=
 =?utf-8?B?cERMS1VNNU5WNFpwMkxBUEd5NFNpMlUvOUkvOXRtZ0dUV3F2OFE0ZCtnUGtn?=
 =?utf-8?B?Z1lwNmR0d0R4WFVSTzVGWnp5OEZ0dHNQcDhMVFJIRVFaQ0JlQjN3eE53REJM?=
 =?utf-8?B?SE1uQ3ROVnJXelJtTndZR09qdVVYNVQ0ZjlrUWl3NVZVck5wM3I2bXB4NTBW?=
 =?utf-8?B?YWFmOXNNSVpsTGJTa0xqZVRhTUNyQkExeU9pVzNWNE10YVU4Mjk5VWdDQk15?=
 =?utf-8?B?NHlYcHROc2VMNlMzMWl5Wk9GWitIeFQyUGxSdk1lbnhPZlY5QllRWldjM0ZX?=
 =?utf-8?B?TUh6RFBsU3NBV0hKMGJsT1JMWDBpdVlEV3BMN0N0enlUY3FlUE83bVppNk1t?=
 =?utf-8?B?VzJ2TDQwZWxmQXdRamFKZHZTOVhnZjdlaFI4Y0JhMElqeHZ5VnkrbXNJbnFq?=
 =?utf-8?B?cmlxTFlMS1h2UEY5U1lpekdvWmpZYy9aeTRJWjBQRFh1U1F6YlI5MGQ2STNy?=
 =?utf-8?B?eElxNEdoQTN5cW8xRTNzL2tkUmRqWUpQeEc4QlAwOVgvWHV5ZjliR2YreW85?=
 =?utf-8?B?TzNYT2psWHNHdWptQmVwUmlKOE5rREphTFM5TkNFdmdlTEFmbExkMzVkTDlK?=
 =?utf-8?B?V25GVHVRUmtCMCtxb3VjVHNrZVhIZmFzTS9pSUxZK1FaZ01VTGx5dHBTZjdx?=
 =?utf-8?B?Mmdza2g5RnJRSzhteXFESC9PRHk1UFk2Nm5ML2kvVVJhaHQ2SDNYTDdVdENn?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2ac2c3-510b-46d3-27bc-08dab68c96ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 13:26:58.0088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZ3O/DLScKOQcN2L0TGjEXbMkT/clImYGi/gDt/atFXSg1ah/1yYoWp8q3/HguuPPnY66LTX+LAWyWqums55zAHdGDO/DzFlfJMd08qfM1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 08:43:58PM +0300, Oded Gabbay wrote:
> On Mon, Oct 24, 2022 at 6:21 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> >
> > On 10/22/2022 3:46 PM, Oded Gabbay wrote:
> > > The accelerator devices are exposed to user-space using a dedicated
> > > major. In addition, they are represented in /dev with new, dedicated
> > > device char names: /dev/accel/accel*. This is done to make sure any
> > > user-space software that tries to open a graphic card won't open
> > > the accelerator device by mistake.
> > >
> > > The above implies that the minor numbering should be separated from
> > > the rest of the drm devices. However, to avoid code duplication, we
> > > want the drm_minor structure to be able to represent the accelerator
> > > device.
> > >
> > > To achieve this, we add a new drm_minor* to drm_device that represents
> > > the accelerator device. This pointer is initialized for drivers that
> > > declare they handle compute accelerator, using a new driver feature
> > > flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
> > > driver feature is mutually exclusive with DRIVER_RENDER. Devices that
> > > want to expose both graphics and compute device char files should be
> > > handled by two drivers that are connected using the auxiliary bus
> > > framework.
> > >
> > > In addition, we define a different idr to handle the accelerators
> > > minors. This is done to make the minor's index be identical to the
> > > device index in /dev/. In most places, this is hidden inside the drm
> > > core functions except when calling drm_minor_acquire(), where I had to
> > > add an extra parameter to specify the idr to use (because the
> > > accelerators minors index and the drm primary minor index both begin
> > > at 0).
> > >
> > > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > > ---
> > >   drivers/gpu/drm/drm_drv.c      | 171 +++++++++++++++++++++++++--------
> > >   drivers/gpu/drm/drm_file.c     |  69 +++++++++----
> > >   drivers/gpu/drm/drm_internal.h |   2 +-
> > >   drivers/gpu/drm/drm_sysfs.c    |  29 ++++--
> > >   include/drm/drm_device.h       |   3 +
> > >   include/drm/drm_drv.h          |   8 ++
> > >   include/drm/drm_file.h         |  21 +++-
> > >   7 files changed, 235 insertions(+), 68 deletions(-)
> >
> > Can we please add something to Documentation?  I know this leverages DRM
> > a lot, but I believe that a new subsystem should not be introduced
> > without documentation.  A lot of the info in the commit message is very
> > good, but should not be buried in the git log.
> >
> > Besides, imagine this has been in mainline for N years, and someone
> > completely new to the kernel wants to write an accel driver.  They
> > should be able to get started with something from Documentation that
> > at-least gives that person some insight into what to grep the code for.
> Agreed. The only reason I haven't done it at this stage was because I
> wanted to get an initial reaction to the code itself, see if the
> direction is accepted.
> I didn't want to write documentation and then completely re-write it.
> So I will do it for the next patch-set, once I collect everyone's
> feedback and I see there is a majority agreement.
> >
> > >
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index b58ffb1433d6..c13701a8d4be 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
> > >   static DEFINE_SPINLOCK(drm_minor_lock);
> > >   static struct idr drm_minors_idr;
> > >
> > > +static DEFINE_SPINLOCK(accel_minor_lock);
> > > +static struct idr accel_minors_idr;
> >
> > IDR is deprecated.  XArray is the preferred mechanism.
> > Yes, there already is IDR here, but I believe we should not be adding
> > new uses.  Maybe at some point, the current IDR will be converted.  Also
> > with XArray, I think you don't need the spinlock since XArray has
> > internal locking already.
> ok, I wasn't aware. I don't have any problem replacing the idr to xarray.

The conversion is sitting on the mailinglist for a while now
(unfortunately, without much interest).
Perhaps you could help with reviewing it?
https://lore.kernel.org/dri-devel/20220911211443.581481-2-michal.winiarski@intel.com/

-Michał

> 
> Thanks,
> Oded
> 
