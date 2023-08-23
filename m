Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DEA7863E1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 01:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4653D10E484;
	Wed, 23 Aug 2023 23:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D4B10E086;
 Wed, 23 Aug 2023 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692832446; x=1724368446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yJ782XwdVC1Dj8mWfGdkjHQfgfAFsbVIPXqwglER0A8=;
 b=cIWWkW4+gg7OnC4R1G9vsKF7Qyl/DIYmusZ11Tw4AlDN4VDYBuVeJ93d
 Qz6XjAotcM8Y2Jr+fPGaS3u00Hpp4QGVXTsMh0oCmujVpZVldst6Mhxns
 J/tGIvCbhbUWWL5P5i766dGKWL/LJ/1Z9SLJSrpeROd1XwIjm6UCm0LlE
 p++cgYmEsjQERAnbAGFTrFMRVAWEBZSIs84p9Bn9+MwpJ7xWElpWmic7J
 NyXf+gFhIlPJ78lUueIZigsuIq9Z9Cd1L0COIus3iR7rVG8h8aly0stnQ
 taQGp+WkcVad1N+HF69eF5eqc6K9rhu3hgVSi22oePzjWpHXn8TOfyIx0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353841746"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="353841746"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 16:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="806870094"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="806870094"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2023 16:14:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 16:14:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 16:14:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 16:14:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 16:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9T42eQD9Iss4e/29uB90MgSAFL/FFGK1SMAgV5OxMoxoNx3MB5UEqQG/OwjrTT3UI0npIikYZK1oJNHxQGFDWZEUCOz/t4VFPT9ghBz3eLclOkJVZVD4knP0BcnOdQK4MmxNdTEn2AFij4ilws000BH2IN/Tp0Mus4d8q7QLgtlkMXn1XgPJdYoy90Oqmw6DRtXchxHJ20dw0b3fLCLYnTiUXsvBiOGsCo5+/Ag0rYngWsXplk4W9ZdBqowjYKukmcGlYgPsQqNWKBMnCsOiVAw+mFLHpcm2fmWUIW+BE5o5tmL5neQtaJXBadhoKkuPIFZnERpciw8MzE+/lgrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb5ur3f5sOHPMdU+NESkuA6HBGEtCK4RCKXQNIPviOI=;
 b=M/gtddQ86rW6RxefypKPtAPWgvhuvgVCA1kZwAqUe8BnnHHIVHYhHngczhO2crLh3RYdrx6qFEJmD6pQfU8DgLsVUKP6lqqNv3Xfa9IL94Dmm1/lJI59fmUO+QzQYuMnxaOh9wUUAHFll17TLx9j58Ltgj6KAokYazRrOsAyVTGg+ee00SehGb2zlyT4BKZSzbx4sEfvKCzEXsKjuKOfh2FWcF3lOv4nkT35EdYGJMqTYVPaxaQHsTwQW7vvPSfQHOlbUGMDoY8rGpsWWP0RFNFAxQKQttjOzS48PX6N0wjOWUVihMy1KEpalsL1GYQaJexe4UlwUw4ZwmnsQ7Iixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8721.namprd11.prod.outlook.com (2603:10b6:408:203::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 23:13:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 23:13:59 +0000
Date: Wed, 23 Aug 2023 23:12:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 4/9] drm/sched: Split free_job into own
 work item
Message-ID: <ZOaSaKA+LrEglY+G@DUT025-TGLU.fm.intel.com>
References: <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
 <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
 <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
 <ZOV8l08PZ/lqfGx9@DUT025-TGLU.fm.intel.com>
 <eb95b02f-7ffa-0cff-eac4-2bd8d12da730@amd.com>
 <ZOYkmAbzRFZzzQKK@DUT025-TGLU.fm.intel.com>
 <CADnq5_N9tn+iBbeGDBu5GMVEzrBA5zzZfEKizp=T21OvowtNhw@mail.gmail.com>
 <ZOZBMcP/TW5mSbwj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZOZBMcP/TW5mSbwj@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bf5c07-3642-4402-f789-08dba42ea1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38gdA5PwKc7bLwo2Cs71SLTokfC+jvP+tTrDEthO093qSS+ma916TZjixdGECtiAJtvIwp4O+B/zcWaByYGUH1V4WcgZYSxIFCQGTirAr4nvtSzkUVm+OqW1n0s6B29ChxVnQefshHdXrPyVgaKUoExZr1tGsffuNStENSS7x0xPuCQT/m7ocLwtOLyn07mFr2TFMJ5Nl6ajW2c9S+pjKs9/XXGSwUpt3dUv3S0LE/qrVQ71hzvfP7T0mQ7Uy+vjGLRwnMnNXbGd5PAVpRYH3uPK5XblWCRZtA3oV6cGIUbshPh5O8yDJXcZgOSs1GeZuf7EqAQxSDRBwGbFW1X2213zV1UsLJTKkSmcGY+uzZUjwx9tk5YOLw1mAKu1yW0SN0WnaM0pijgRJ412IBfK2cBcgJ5TPE4zR1OJZtggmtvXVnhKXWXYM7FmfoDHDb9F/GGXphfVxkO5krjus00vqX4jngmMO2fEAAjNM95Q7Yy76i3Snsm4kd+P26rXzQUNzt7hPfon0hEji6aYrlDq+TQ2zUeTXXFr39De4VRlkpThv94Y8EtNbvlZLn3vYrzNgt9ElPSJdcw0kSAONYduTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(136003)(346002)(186009)(451199024)(1800799009)(6506007)(6486002)(6636002)(316002)(53546011)(6862004)(8676002)(8936002)(4326008)(54906003)(66556008)(66946007)(66476007)(6512007)(41300700001)(966005)(7416002)(26005)(44832011)(5660300002)(6666004)(478600001)(83380400001)(30864003)(66574015)(86362001)(82960400001)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHRyY2tpSkxJamJFb2pWaW1wRjhnc3lCWm5NVlR5cE85TTYvK2loN2dCdlJp?=
 =?utf-8?B?R250SHFKWDFhV2lRRktKV3VKZXJaTUFBTGIxVHgxNWtMN2xPWEtNSXcvVS8z?=
 =?utf-8?B?anVuclRKSlNEdk1oN1FlN2x6TlpEcFhXVnVEK0dEWEFmT01kR1lnSXJtdlVw?=
 =?utf-8?B?akJHNTg1LzgrTDYzWVFBQ3NCRDE2c2U1ZHJWcVQwTVhTTEV3TkxoODVxdlJI?=
 =?utf-8?B?bDkzUWlFTTNqcjZLa2VlN1M1Q0RqV3RXS0U5cTNUMlpUUTZ5TWhDY2lCZGd2?=
 =?utf-8?B?N05VSCtaZUw4RGgxTmR1WXU3SXJxWk0zdUgvSlg2SlVNL2xXd3p5WGEvL21R?=
 =?utf-8?B?OUJXUnNNWE1naS9kb0hwS0RudERuR09hMEwvVmRBOGJYbmJ1N1ZHM1JROVph?=
 =?utf-8?B?bHhHai9DTUFMRkVvNHl3dWdwUkZOWjJqcGlobm91MkVscWFVb1g3ZlV3czhN?=
 =?utf-8?B?YnNCVlB4YVA3WitaVCtqTnoyUGFGMUs5YXhROGFaQmMrNGZUUmJSM1JNbzZ0?=
 =?utf-8?B?VzNvek5NS3B3eVFRTTFDaVdmaDg5ZU0xckRML01FbE5kdXV4K0lVV2tPY3Zt?=
 =?utf-8?B?SkdyY1pIYnVFN1ppOVRjN1ZmMXB4NitGN1VMMGNZQVhEK1VPUlFvOEpTeU4y?=
 =?utf-8?B?TWk3b0cyc2JEVU9JazNGaEd1S3NnQjNubVJ0UkkvUnJ6NXZZQ3pCVnd2UzJX?=
 =?utf-8?B?akxIUzd1Nm9rbmhqUUR5V1pta04yc2h4d3ZaeGZsRTRJeXFNNXdHQ09hbTdr?=
 =?utf-8?B?eklrZXVLa1BHMWxaZ083cmRXQkxESVA1RXhaMDJ2RVRhM3Zacmdic3dEaDRp?=
 =?utf-8?B?eUFWQ2pyeW9rYW9EZ2lmWWMzZ1gvQnhCTHNkOVM1cTVKQVJ5MEhvRS9WdnVj?=
 =?utf-8?B?enh4NE5rWTd5aFNIcHFRS3BTR1orT2hYR05RTHpDcEZPOSt4N2Y2dE15Y00z?=
 =?utf-8?B?ZXEwZWpLb1FzTThGc05qemdPQ1VvNFlyYktOWWgvNGtDTnFraGlZbDhic2hT?=
 =?utf-8?B?U0ZmUm1TaW4zRHdXcmY1SlFZcVJrTUNuYWJGczhsSGhXNTVOYkN3QUhRNzUy?=
 =?utf-8?B?dXVRUTM0MFpaZnhsOHV3M3FnVEpKdzYwVGk5MDhUcFFWNExqdU9RV1krRlpW?=
 =?utf-8?B?N3U1SHBLRWpITGJYMDl1cUdXaWYzSFVCZEtpMTR3cHk2RkwyRFVBQlgrZnVk?=
 =?utf-8?B?K0V0Vko0RkNZZ2QvWWx1S0JPQjVwUWRNMFcvZlJRYjNZS3VzcTlKY3U2K0Jx?=
 =?utf-8?B?SkZjUlZBelBiY01LUVhkNnY2YTVQTWV3Z0xJZkhqUnhHMVlOVWlLbHlSMndU?=
 =?utf-8?B?M210bXlVU1ppdkFTTXlVR1JFODJyU1lRYU1vVFpxMmJ1TXNGUDZibEpXcjFB?=
 =?utf-8?B?ZFlNV0pyYVJCZCswbHlFRHJjM2RDWURWOU9IdncrdXFXekhsRWdpNnpCQ0x0?=
 =?utf-8?B?RUU1YTRuSCtrMHB6d3NITDdCYlYrdjQ3bkxvWFAyTmdoYVRTVEFSY3dhNVp1?=
 =?utf-8?B?NmxCZFFYUlhubnBtT0ZwUTNYL3ZTcnFNTitzTW1mT1FGZ1Y0THViRHpyVWlm?=
 =?utf-8?B?Nkg4Nk45cXRBbWo4bWZEQVhpMjdmZnhNQkNmSVhzUG5ZaVhsYnhRdW5kN3NY?=
 =?utf-8?B?WDFaeGRvMEhPRW1lc2dnQzVmbm5SQUgvZTR5TWFSRGNtMEFjT3gxT25YTGg5?=
 =?utf-8?B?QklNVHRtemxNYVlSZmtzSVNyWTFuT2JxNm1Ia2FZTlRhaStRTTJnOGxPMCtt?=
 =?utf-8?B?ZXBoRlMyY0J1YlNNMHIvZVhld0hjY0hpNDFzekFpYU5VMlpoUFZEL1lWK21m?=
 =?utf-8?B?NGw4bkxFVFNxWEZjVzNGMi93NG5jLzJXU25ERlVZbHcvRDBSYlFZZjNzL2dP?=
 =?utf-8?B?Z2lOYTc0RUtCOHFvazhsSmxMalhKbyt4Y2lhL0Z4aG54UllvQzlTcDQ0dU8r?=
 =?utf-8?B?Q0ovbk4vS0pGdkxvVU9Ra2dNV2ZQdC9XY1VMMHVNK0dyVEthUE5pVmNNQUQy?=
 =?utf-8?B?RG5mZTZOVWxSaXJsS2x3QlNVSUg3cGE4R3oyT3hzVXNtN1NnQ3lFMWhNeDIx?=
 =?utf-8?B?TDBCeG1DVGh4Sk5YYjhyeWtac3RZVW1qYXd1N3Z6K3VZQVdQTGlxMjJNY09n?=
 =?utf-8?B?dmlyM2pJWnRvZTVaTFRYNlpGUHJ0SUxjMVRSci8wRVF4Y1lEZisrbkFiTXdT?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bf5c07-3642-4402-f789-08dba42ea1e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 23:13:59.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJtmDQy1P0pNSqzHkAUUHtXbvKpyj/qeFxGR3FlE2axsnmEGMEOHpFyVJnLihrEZaQpwFaF8QXwAvzZYWH6DrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8721
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 01:26:09PM -0400, Rodrigo Vivi wrote:
> On Wed, Aug 23, 2023 at 11:41:19AM -0400, Alex Deucher wrote:
> > On Wed, Aug 23, 2023 at 11:26 AM Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > On Wed, Aug 23, 2023 at 09:10:51AM +0200, Christian König wrote:
> > > > Am 23.08.23 um 05:27 schrieb Matthew Brost:
> > > > > [SNIP]
> > > > > > That is exactly what I want to avoid, tying the TDR to the job is what some
> > > > > > AMD engineers pushed for because it looked like a simple solution and made
> > > > > > the whole thing similar to what Windows does.
> > > > > >
> > > > > > This turned the previous relatively clean scheduler and TDR design into a
> > > > > > complete nightmare. The job contains quite a bunch of things which are not
> > > > > > necessarily available after the application which submitted the job is torn
> > > > > > down.
> > > > > >
> > > > > Agree the TDR shouldn't be accessing anything application specific
> > > > > rather just internal job state required to tear the job down on the
> > > > > hardware.
> > > > > > So what happens is that you either have stale pointers in the TDR which can
> > > > > > go boom extremely easily or we somehow find a way to keep the necessary
> > > > > I have not experenced the TDR going boom in Xe.
> > > > >
> > > > > > structures (which include struct thread_info and struct file for this driver
> > > > > > connection) alive until all submissions are completed.
> > > > > >
> > > > > In Xe we keep everything alive until all submissions are completed. By
> > > > > everything I mean the drm job, entity, scheduler, and VM via a reference
> > > > > counting scheme. All of these structures are just kernel state which can
> > > > > safely be accessed even if the application has been killed.
> > > >
> > > > Yeah, but that might just not be such a good idea from memory management
> > > > point of view.
> > > >
> > > > When you (for example) kill a process all resource from that progress should
> > > > at least be queued to be freed more or less immediately.
> > > >
> > >
> > > We do this, the TDR kicks jobs off the hardware as fast as the hw
> > > interface allows and signals all pending hw fences immediately after.
> > > Free jobs then is immediately called and the reference count goes to
> > > zero. I think max time for all of this to occur is a handful of ms.
> > >
> > > > What Linux is doing for other I/O operations is to keep the relevant pages
> > > > alive until the I/O operation is completed, but for GPUs that usually means
> > > > keeping most of the memory of the process alive and that in turn is really
> > > > not something you can do.
> > > >
> > > > You can of course do this if your driver has a reliable way of killing your
> > > > submissions and freeing resources in a reasonable amount of time. This
> > > > should then be done in the flush callback.
> > > >
> > >
> > > 'flush callback' - Do you mean drm_sched_entity_flush? I looked at that
> > > and think that function doesn't even work for what I tell. It flushes
> > > the spsc queue but what about jobs on the hardware, how do those get
> > > killed?
> > >
> > > As stated we do via the TDR which is rather clean design and fits with
> > > our reference couting scheme.
> > >
> > > > > If we need to teardown on demand we just set the TDR to a minimum value and
> > > > > it kicks the jobs off the hardware, gracefully cleans everything up and
> > > > > drops all references. This is a benefit of the 1 to 1 relationship, not
> > > > > sure if this works with how AMDGPU uses the scheduler.
> > > > >
> > > > > > Delaying application tear down is also not an option because then you run
> > > > > > into massive trouble with the OOM killer (or more generally OOM handling).
> > > > > > See what we do in drm_sched_entity_flush() as well.
> > > > > >
> > > > > Not an issue for Xe, we never call drm_sched_entity_flush as our
> > > > > referencing counting scheme is all jobs are finished before we attempt
> > > > > to tear down entity / scheduler.
> > > >
> > > > I don't think you can do that upstream. Calling drm_sched_entity_flush() is
> > > > a must have from your flush callback for the file descriptor.
> > > >
> > >
> > > Again 'flush callback'? What are you refering too.
> > >
> > > And why does drm_sched_entity_flush need to be called, doesn't seem to
> > > do anything useful.
> > >
> > > > Unless you have some other method for killing your submissions this would
> > > > give a path for a deny of service attack vector when the Xe driver is in
> > > > use.
> > > >
> > >
> > > Yes, once th TDR fires is disallows all new submissions at the exec
> > > IOCTL plus flushes any pending submissions as fast as possible.
> > >
> > > > > > Since adding the TDR support we completely exercised this through in the
> > > > > > last two or three years or so. And to sum it up I would really like to get
> > > > > > away from this mess again.
> > > > > >
> > > > > > Compared to that what i915 does is actually rather clean I think.
> > > > > >
> > > > > Not even close, resets where a nightmare in the i915 (I spend years
> > > > > trying to get this right and probably still completely work) and in Xe
> > > > > basically got it right on the attempt.
> > > > >
> > > > > > >    Also in Xe some of
> > > > > > > things done in free_job cannot be from an IRQ context, hence calling
> > > > > > > this from the scheduler worker is rather helpful.
> > > > > > Well putting things for cleanup into a workitem doesn't sounds like
> > > > > > something hard.
> > > > > >
> > > > > That is exactly what we doing in the scheduler with the free_job
> > > > > workitem.
> > > >
> > > > Yeah, but I think that we do it in the scheduler and not the driver is
> > > > problematic.
> 
> Christian, I do see your point on simply get rid of free job callbacks here
> then use fence with own-driver workqueue and house cleaning. But I wonder if
> starting with this patch as a clear separation of that is not a step forward
> and that could be cleaned up on a follow up!?
> 
> Matt, why exactly do we need the separation in this patch? Commit message tells
> what it is doing and that it is aligned with design, but is not clear on why
> exactly we need this right now. Specially if in the end what we want is exactly
> keeping the submit_wq to ensure the serialization of the operations you mentioned.
> I mean, could we simply drop this patch and then work on a follow-up later and
> investigate the Christian suggestion when we are in-tree?
> 

I believe Christian suggested this change in a previous rev (free_job,
proccess_msg) in there own workitem [1].

Dropping free_job / calling run_job again is really a completely
different topic than this patch.

[1] https://patchwork.freedesktop.org/patch/550722/?series=121745&rev=1

> > > >
> > >
> > > Disagree, a common clean callback from a non-irq contexts IMO is a good
> > > design rather than each driver possibly having its own worker for
> > > cleanup.
> > >
> > > > For the scheduler it shouldn't care about the job any more as soon as the
> > > > driver takes over.
> > > >
> > >
> > > This a massive rewrite for all users of the DRM scheduler, I'm saying
> > > for Xe what you are suggesting makes little to no sense.
> > >
> > > I'd like other users of the DRM scheduler to chime in on what you
> > > purposing. The scope of this change affects 8ish drivers that would
> > > require buy in each of the stakeholders. I certainly can't change of
> > > these drivers as I don't feel comfortable in all of those code bases nor
> > > do I have hardware to test all of these drivers.
> > >
> > > > >
> > > > > > Question is what do you really need for TDR which is not inside the hardware
> > > > > > fence?
> > > > > >
> > > > > A reference to the entity to be able to kick the job off the hardware.
> > > > > A reference to the entity, job, and VM for error capture.
> > > > >
> > > > > We also need a reference to the job for recovery after a GPU reset so
> > > > > run_job can be called again for innocent jobs.
> > > >
> > > > Well exactly that's what I'm massively pushing back. Letting the scheduler
> > > > call run_job() for the same job again is *NOT* something you can actually
> > > > do.
> > > >
> > >
> > > But lots of drivers do this already and the DRM scheduler documents
> > > this.
> > >
> > > > This pretty clearly violates some of the dma_fence constrains and has cause
> > > > massively headaches for me already.
> > > >
> > >
> > > Seems to work fine in Xe.
> > >
> > > > What you can do is to do this inside your driver, e.g. take the jobs and
> > > > push them again to the hw ring or just tell the hw to start executing again
> > > > from a previous position.
> > > >
> > >
> > > Again this now is massive rewrite of many drivers.
> > >
> > > > BTW that re-submitting of jobs seems to be a no-go from userspace
> > > > perspective as well. Take a look at the Vulkan spec for that, at least Marek
> > > > pretty much pointed out that we should absolutely not do this inside the
> > > > kernel.
> > > >
> > >
> > > Yes if the job causes the hang, we ban the queue. Typcially only per
> > > entity (queue) resets are done in Xe but occasionally device level
> > > resets are done (issues with hardware) and innocent jobs / entities call
> > > run_job again.
> > 
> > If the engine is reset and the job was already executing, how can you
> > determine that it's in a good state to resubmit?  What if some

If a job has started but not completed we ban the queue during device
reset. If a queue have jobs submitted but not started we resubmit all
jobs on the queue during device reset.

The started / completed state can be determined by looking at a seqno in
memory.

> > internal fence or semaphore in memory used by the logic in the command
> > buffer has been signaled already and then you resubmit the job and it
> > now starts executing with different input state?
> 
> I believe we could set some more rules in the new robustness documentation:
> https://lore.kernel.org/all/20230818200642.276735-1-andrealmeid@igalia.com/
> 
> For this robustness implementation i915 pin point the exact context that
> was in execution when the gpu hang and only blame that, although the
> ressubmission is up to the user space. While on Xe we are blaming every
> single context that was in the queue. So I'm actually confused on what
> are the innocent jobs and who are calling for resubmission, if all of
> them got banned and blamed.

See above, innocent job == submited job but not started (i.e. a job
stuck in the FW queue not yet been put on the hardware). Because we have
a FW scheduler we could have 1000s of innocent jobs that don't need to
get banned. This is very different from drivers without FW schedulers as
typically when run_job is called the job hits the hardware immediately.

Matt

> 
> > 
> > Alex
> > 
> > >
> > > > The generally right approach seems to be to cleanly signal to userspace that
> > > > something bad happened and that userspace then needs to submit things again
> > > > even for innocent jobs.
> > > >
> > >
> > > I disagree that innocent jobs should be banned. What you are suggesting
> > > is if a device reset needs to be done we kill / ban every user space queue.
> > > Thats seems like overkill. Not seeing where that is stated in this doc
> > > [1], it seems to imply that only jobs that are stuck results in bans.
> > >
> > > Matt
> > >
> > > [1] https://patchwork.freedesktop.org/patch/553465/?series=119883&rev=3
> > >
> > > > Regards,
> > > > Christian.
> > > >
> > > > >
> > > > > All of this leads to believe we need to stick with the design.
> > > > >
> > > > > Matt
> > > > >
> > > > > > Regards,
> > > > > > Christian.
> > > > > >
> > > > > > > The HW fence can live for longer as it can be installed in dma-resv
> > > > > > > slots, syncobjs, etc... If the job and hw fence are combined now we
> > > > > > > holding on the memory for the longer and perhaps at the mercy of the
> > > > > > > user. We also run the risk of the final put being done from an IRQ
> > > > > > > context which again wont work in Xe as it is currently coded. Lastly 2
> > > > > > > jobs from the same scheduler could do the final put in parallel, so
> > > > > > > rather than having free_job serialized by the worker now multiple jobs
> > > > > > > are freeing themselves at the same time. This might not be an issue but
> > > > > > > adds another level of raceyness that needs to be accounted for. None of
> > > > > > > this sounds desirable to me.
> > > > > > >
> > > > > > > FWIW what you suggesting sounds like how the i915 did things
> > > > > > > (i915_request and hw fence in 1 memory alloc) and that turned out to be
> > > > > > > a huge mess. As rule of thumb I generally do the opposite of whatever
> > > > > > > the i915 did.
> > > > > > >
> > > > > > > Matt
> > > > > > >
> > > > > > > > Christian.
> > > > > > > >
> > > > > > > > > Matt
> > > > > > > > >
> > > > > > > > > > All the lifetime issues we had came from ignoring this fact and I think we
> > > > > > > > > > should push for fixing this design up again.
> > > > > > > > > >
> > > > > > > > > > Regards,
> > > > > > > > > > Christian.
> > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > > ---
> > > > > > > > > > >      drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> > > > > > > > > > >      include/drm/gpu_scheduler.h            |   8 +-
> > > > > > > > > > >      2 files changed, 106 insertions(+), 39 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > index cede47afc800..b67469eac179 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > > > > > > > > >       * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> > > > > > > > > > >       *
> > > > > > > > > > >       * @rq: scheduler run queue to check.
> > > > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > > > >       *
> > > > > > > > > > >       * Try to find a ready entity, returns NULL if none found.
> > > > > > > > > > >       */
> > > > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > > > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > > > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> > > > > > > > > > >      {
> > > > > > > > > > >         struct drm_sched_entity *entity;
> > > > > > > > > > > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > > >         if (entity) {
> > > > > > > > > > >                 list_for_each_entry_continue(entity, &rq->entities, list) {
> > > > > > > > > > >                         if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > > > -                               rq->current_entity = entity;
> > > > > > > > > > > -                               reinit_completion(&entity->entity_idle);
> > > > > > > > > > > +                               if (dequeue) {
> > > > > > > > > > > +                                       rq->current_entity = entity;
> > > > > > > > > > > +                                       reinit_completion(&entity->entity_idle);
> > > > > > > > > > > +                               }
> > > > > > > > > > >                                 spin_unlock(&rq->lock);
> > > > > > > > > > >                                 return entity;
> > > > > > > > > > >                         }
> > > > > > > > > > > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > > >         list_for_each_entry(entity, &rq->entities, list) {
> > > > > > > > > > >                 if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > > > -                       rq->current_entity = entity;
> > > > > > > > > > > -                       reinit_completion(&entity->entity_idle);
> > > > > > > > > > > +                       if (dequeue) {
> > > > > > > > > > > +                               rq->current_entity = entity;
> > > > > > > > > > > +                               reinit_completion(&entity->entity_idle);
> > > > > > > > > > > +                       }
> > > > > > > > > > >                         spin_unlock(&rq->lock);
> > > > > > > > > > >                         return entity;
> > > > > > > > > > >                 }
> > > > > > > > > > > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > > >       * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> > > > > > > > > > >       *
> > > > > > > > > > >       * @rq: scheduler run queue to check.
> > > > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > > > >       *
> > > > > > > > > > >       * Find oldest waiting ready entity, returns NULL if none found.
> > > > > > > > > > >       */
> > > > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > > > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > > > > > > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> > > > > > > > > > >      {
> > > > > > > > > > >         struct rb_node *rb;
> > > > > > > > > > > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > > > > > >                 entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> > > > > > > > > > >                 if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > > > -                       rq->current_entity = entity;
> > > > > > > > > > > -                       reinit_completion(&entity->entity_idle);
> > > > > > > > > > > +                       if (dequeue) {
> > > > > > > > > > > +                               rq->current_entity = entity;
> > > > > > > > > > > +                               reinit_completion(&entity->entity_idle);
> > > > > > > > > > > +                       }
> > > > > > > > > > >                         break;
> > > > > > > > > > >                 }
> > > > > > > > > > >         }
> > > > > > > > > > > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > > > > > >      }
> > > > > > > > > > >      /**
> > > > > > > > > > > - * drm_sched_submit_queue - scheduler queue submission
> > > > > > > > > > > + * drm_sched_run_job_queue - queue job submission
> > > > > > > > > > >       * @sched: scheduler instance
> > > > > > > > > > >       */
> > > > > > > > > > > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > > > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > > >      {
> > > > > > > > > > >         if (!READ_ONCE(sched->pause_submit))
> > > > > > > > > > > -               queue_work(sched->submit_wq, &sched->work_submit);
> > > > > > > > > > > +               queue_work(sched->submit_wq, &sched->work_run_job);
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +static struct drm_sched_entity *
> > > > > > > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> > > > > > > > > > > + * @sched: scheduler instance
> > > > > > > > > > > + */
> > > > > > > > > > > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > > > > > > > > +{
> > > > > > > > > > > +       if (drm_sched_select_entity(sched, false))
> > > > > > > > > > > +               drm_sched_run_job_queue(sched);
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * drm_sched_free_job_queue - queue free job
> > > > > > > > > > > + *
> > > > > > > > > > > + * @sched: scheduler instance to queue free job
> > > > > > > > > > > + */
> > > > > > > > > > > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > > > +{
> > > > > > > > > > > +       if (!READ_ONCE(sched->pause_submit))
> > > > > > > > > > > +               queue_work(sched->submit_wq, &sched->work_free_job);
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * drm_sched_free_job_queue_if_ready - queue free job if ready
> > > > > > > > > > > + *
> > > > > > > > > > > + * @sched: scheduler instance to queue free job
> > > > > > > > > > > + */
> > > > > > > > > > > +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > > > > > > > > +{
> > > > > > > > > > > +       struct drm_sched_job *job;
> > > > > > > > > > > +
> > > > > > > > > > > +       spin_lock(&sched->job_list_lock);
> > > > > > > > > > > +       job = list_first_entry_or_null(&sched->pending_list,
> > > > > > > > > > > +                                      struct drm_sched_job, list);
> > > > > > > > > > > +       if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > > > > > > > > > > +               drm_sched_free_job_queue(sched);
> > > > > > > > > > > +       spin_unlock(&sched->job_list_lock);
> > > > > > > > > > >      }
> > > > > > > > > > >      /**
> > > > > > > > > > > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> > > > > > > > > > >         dma_fence_get(&s_fence->finished);
> > > > > > > > > > >         drm_sched_fence_finished(s_fence, result);
> > > > > > > > > > >         dma_fence_put(&s_fence->finished);
> > > > > > > > > > > -       drm_sched_submit_queue(sched);
> > > > > > > > > > > +       drm_sched_free_job_queue(sched);
> > > > > > > > > > >      }
> > > > > > > > > > >      /**
> > > > > > > > > > > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > > >      void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > > >      {
> > > > > > > > > > >         if (drm_sched_can_queue(sched))
> > > > > > > > > > > -               drm_sched_submit_queue(sched);
> > > > > > > > > > > +               drm_sched_run_job_queue(sched);
> > > > > > > > > > >      }
> > > > > > > > > > >      /**
> > > > > > > > > > >       * drm_sched_select_entity - Select next entity to process
> > > > > > > > > > >       *
> > > > > > > > > > >       * @sched: scheduler instance
> > > > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > > > >       *
> > > > > > > > > > >       * Returns the entity to process or NULL if none are found.
> > > > > > > > > > >       */
> > > > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > > > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > > > > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> > > > > > > > > > >      {
> > > > > > > > > > >         struct drm_sched_entity *entity;
> > > > > > > > > > >         int i;
> > > > > > > > > > > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > > > > > > > >         /* Kernel run queue has higher priority than normal run queue*/
> > > > > > > > > > >         for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > > > > > > > > > >                 entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > > > > > > > > > > -                       drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > > > > > > > > > > -                       drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > > > > > > > > > > +                       drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > > > > > > > > > > +                                                       dequeue) :
> > > > > > > > > > > +                       drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > > > > > > > > > > +                                                     dequeue);
> > > > > > > > > > >                 if (entity)
> > > > > > > > > > >                         break;
> > > > > > > > > > >         }
> > > > > > > > > > > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > > > > > > > > >      EXPORT_SYMBOL(drm_sched_pick_best);
> > > > > > > > > > >      /**
> > > > > > > > > > > - * drm_sched_main - main scheduler thread
> > > > > > > > > > > + * drm_sched_free_job_work - worker to call free_job
> > > > > > > > > > >       *
> > > > > > > > > > > - * @param: scheduler instance
> > > > > > > > > > > + * @w: free job work
> > > > > > > > > > >       */
> > > > > > > > > > > -static void drm_sched_main(struct work_struct *w)
> > > > > > > > > > > +static void drm_sched_free_job_work(struct work_struct *w)
> > > > > > > > > > >      {
> > > > > > > > > > >         struct drm_gpu_scheduler *sched =
> > > > > > > > > > > -               container_of(w, struct drm_gpu_scheduler, work_submit);
> > > > > > > > > > > -       struct drm_sched_entity *entity;
> > > > > > > > > > > +               container_of(w, struct drm_gpu_scheduler, work_free_job);
> > > > > > > > > > >         struct drm_sched_job *cleanup_job;
> > > > > > > > > > > -       int r;
> > > > > > > > > > >         if (READ_ONCE(sched->pause_submit))
> > > > > > > > > > >                 return;
> > > > > > > > > > >         cleanup_job = drm_sched_get_cleanup_job(sched);
> > > > > > > > > > > -       entity = drm_sched_select_entity(sched);
> > > > > > > > > > > +       if (cleanup_job) {
> > > > > > > > > > > +               sched->ops->free_job(cleanup_job);
> > > > > > > > > > > +
> > > > > > > > > > > +               drm_sched_free_job_queue_if_ready(sched);
> > > > > > > > > > > +               drm_sched_run_job_queue_if_ready(sched);
> > > > > > > > > > > +       }
> > > > > > > > > > > +}
> > > > > > > > > > > -       if (!entity && !cleanup_job)
> > > > > > > > > > > -               return; /* No more work */
> > > > > > > > > > > +/**
> > > > > > > > > > > + * drm_sched_run_job_work - worker to call run_job
> > > > > > > > > > > + *
> > > > > > > > > > > + * @w: run job work
> > > > > > > > > > > + */
> > > > > > > > > > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > > > > > > > > > +{
> > > > > > > > > > > +       struct drm_gpu_scheduler *sched =
> > > > > > > > > > > +               container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > > > > > > > > +       struct drm_sched_entity *entity;
> > > > > > > > > > > +       int r;
> > > > > > > > > > > -       if (cleanup_job)
> > > > > > > > > > > -               sched->ops->free_job(cleanup_job);
> > > > > > > > > > > +       if (READ_ONCE(sched->pause_submit))
> > > > > > > > > > > +               return;
> > > > > > > > > > > +       entity = drm_sched_select_entity(sched, true);
> > > > > > > > > > >         if (entity) {
> > > > > > > > > > >                 struct dma_fence *fence;
> > > > > > > > > > >                 struct drm_sched_fence *s_fence;
> > > > > > > > > > > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > > > > >                 sched_job = drm_sched_entity_pop_job(entity);
> > > > > > > > > > >                 if (!sched_job) {
> > > > > > > > > > >                         complete_all(&entity->entity_idle);
> > > > > > > > > > > -                       if (!cleanup_job)
> > > > > > > > > > > -                               return; /* No more work */
> > > > > > > > > > > -                       goto again;
> > > > > > > > > > > +                       return; /* No more work */
> > > > > > > > > > >                 }
> > > > > > > > > > >                 s_fence = sched_job->s_fence;
> > > > > > > > > > > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > > > > >                 }
> > > > > > > > > > >                 wake_up(&sched->job_scheduled);
> > > > > > > > > > > +               drm_sched_run_job_queue_if_ready(sched);
> > > > > > > > > > >         }
> > > > > > > > > > > -
> > > > > > > > > > > -again:
> > > > > > > > > > > -       drm_sched_submit_queue(sched);
> > > > > > > > > > >      }
> > > > > > > > > > >      /**
> > > > > > > > > > > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > > > > > > > >         spin_lock_init(&sched->job_list_lock);
> > > > > > > > > > >         atomic_set(&sched->hw_rq_count, 0);
> > > > > > > > > > >         INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > > > > > > > > -       INIT_WORK(&sched->work_submit, drm_sched_main);
> > > > > > > > > > > +       INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > > > > > > > > > > +       INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > > > > > > > > >         atomic_set(&sched->_score, 0);
> > > > > > > > > > >         atomic64_set(&sched->job_id_count, 0);
> > > > > > > > > > >         sched->pause_submit = false;
> > > > > > > > > > > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> > > > > > > > > > >      void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> > > > > > > > > > >      {
> > > > > > > > > > >         WRITE_ONCE(sched->pause_submit, true);
> > > > > > > > > > > -       cancel_work_sync(&sched->work_submit);
> > > > > > > > > > > +       cancel_work_sync(&sched->work_run_job);
> > > > > > > > > > > +       cancel_work_sync(&sched->work_free_job);
> > > > > > > > > > >      }
> > > > > > > > > > >      EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > > > > > > > > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > > > > > > > >      void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> > > > > > > > > > >      {
> > > > > > > > > > >         WRITE_ONCE(sched->pause_submit, false);
> > > > > > > > > > > -       queue_work(sched->submit_wq, &sched->work_submit);
> > > > > > > > > > > +       queue_work(sched->submit_wq, &sched->work_run_job);
> > > > > > > > > > > +       queue_work(sched->submit_wq, &sched->work_free_job);
> > > > > > > > > > >      }
> > > > > > > > > > >      EXPORT_SYMBOL(drm_sched_submit_start);
> > > > > > > > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > > > > > > > > index 04eec2d7635f..fbc083a92757 100644
> > > > > > > > > > > --- a/include/drm/gpu_scheduler.h
> > > > > > > > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > > > > > > > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> > > > > > > > > > >       *                 finished.
> > > > > > > > > > >       * @hw_rq_count: the number of jobs currently in the hardware queue.
> > > > > > > > > > >       * @job_id_count: used to assign unique id to the each job.
> > > > > > > > > > > - * @submit_wq: workqueue used to queue @work_submit
> > > > > > > > > > > + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> > > > > > > > > > >       * @timeout_wq: workqueue used to queue @work_tdr
> > > > > > > > > > > - * @work_submit: schedules jobs and cleans up entities
> > > > > > > > > > > + * @work_run_job: schedules jobs
> > > > > > > > > > > + * @work_free_job: cleans up jobs
> > > > > > > > > > >       * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > > > > > > > > >       *            timeout interval is over.
> > > > > > > > > > >       * @pending_list: the list of jobs which are currently in the job queue.
> > > > > > > > > > > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> > > > > > > > > > >         atomic64_t                      job_id_count;
> > > > > > > > > > >         struct workqueue_struct         *submit_wq;
> > > > > > > > > > >         struct workqueue_struct         *timeout_wq;
> > > > > > > > > > > -       struct work_struct              work_submit;
> > > > > > > > > > > +       struct work_struct              work_run_job;
> > > > > > > > > > > +       struct work_struct              work_free_job;
> > > > > > > > > > >         struct delayed_work             work_tdr;
> > > > > > > > > > >         struct list_head                pending_list;
> > > > > > > > > > >         spinlock_t                      job_list_lock;
> > > >
