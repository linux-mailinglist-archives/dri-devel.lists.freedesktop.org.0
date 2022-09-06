Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C55AEFE9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCF510E6EC;
	Tue,  6 Sep 2022 16:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC39B10E04B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662480496; x=1694016496;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ca6NbBdrQ2L5RUxbgTGH7PYWraiBQvfG7Q9aL1w9Jf8=;
 b=b0EOa9eppgoEpJ/NwQRJLEimQKOxZ7yKljh0fotiXeSuCTt86aBUCZ7E
 srEm0dL7p2qSLFB0CPi7Z2leaGx7CHmWwpv+OAyJL1DJ2AWDJZqrxp7DQ
 cT7YLH90AhqBQW8JzzJcDQzO5f8+UXK1myoTzLtmWaK44TCGrZWntLMG7
 3kYzulMGO1xRI0IfSUFNlf9BxIDWlzVg8UbWYhYOZO2RklYfP92exijfv
 LQBxF0bzSOqPrBC/i6QhQ8PPpLxRdmlDQSKl4i9dh2eRvhkOpVOAz8GQ4
 yK0Z5cnwTn7vUEyfJz4cWIQhQD16BRFNAcTLL30i7dpCLgYjNYIkXOFZi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="296635016"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="296635016"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 09:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="644226846"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 06 Sep 2022 09:08:14 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 09:08:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 09:08:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 09:08:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 09:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5cIrf2wHWs9btFobxnbVJMm+6s9gKDwuwoNyrMct40ehWmmI1GywOZKscYL8UX11y+pBfKsTGr6BFG1XwdCMKnPCBCwnaDMypqv88THyTWvSQM/I7nnoaE7siM3PK+Ktk/KWITxUCNsFYWyuRm/RgiKbnOkEGOJq4IxzGAyzr9JpfNDFEpfTkrF186JHZLgu/+Vu/OhKNMguHLOmT4m/FLpW7QStKatEUG0BvRHRn9gZ5v1+/yXdZ/05DBESKnIJStWR0LFjE89XYmn09H9yad59FRC6dsc6OLkJTHOhdUs2KXopuGmCB7xt/viJNb44S3NBpN78KWIVlRo/rQ1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umtLwiF/qcULQ4Ls3394A0vLY3M2r4LkHCAlaohXunY=;
 b=MOUp9nI2c7qZpgsP/T97q0kWP3FoEa5SoZ+iTrSU8jktGUa7YsMDjF6WWxGiexzGYjwirHTQOGBrCBftwhbB9+QKydBewty0y0qWc0OlJ/Nt9JEPMueYm3B7e3NpmNATIPrBkz4u0o8O5uxUoKV1OPD0trou4DzrhaTWRqXq0cA8x6n9P21JX7kzHPaq5rinFRk3V+gVp2f5bZ3xMCaORy+FKLFtHM5Sq0oif6JP9caA3H2ZYdxK5UR36Tc7usGWOLKpVWVvsdQeDGlJR7CcdNM9jdX5CzBLLVUqFEV5kiP5uaXgG/JFZp81k/7kSyomQmO6hDpuqjHFy2V5Khh/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM5PR11MB1820.namprd11.prod.outlook.com (2603:10b6:3:111::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.16; Tue, 6 Sep 2022 16:08:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 16:08:10 +0000
Date: Tue, 6 Sep 2022 18:08:04 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 0/4] drm: Use full allocated minor range for DRM
Message-ID: <20220906160804.wvuioiya33df7jnj@nostramo>
References: <20220906140117.409852-1-michal.winiarski@intel.com>
 <YxdXZbFBHIevYwRz@casper.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxdXZbFBHIevYwRz@casper.infradead.org>
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d5f3b5c-cf6c-4046-a2b8-08da9021feab
X-MS-TrafficTypeDiagnostic: DM5PR11MB1820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTPaUARwacFqd+usJo2jHkQAvunk28Us6q4EbvkeyTbOtvDeZEgB3Oj8oS7GxRZNH9wCAIhsK0SRXJUC0MK2QrFJegGgDbnzYy4j2dZl5Glgez/x1htgu+BlIaPLsmLumA9Z07iNkAnFU14Zwm/DsOvf9Dn5dzDljlkTcPADa5AdJGwdZSh03Ez3y2gtQkdT/CEQhjn84Bbwn2YVFMzaST3uafiIWMm9aSJSlL60aG0uCUf0gdHekXNHH6fJmdXAoWl7tZXM4uC1DFsv6jEnzrJX8W8Ed97fuJn51KoyrU/yiG8kEgXcMs3MxMhUX+LMsjlSjo2AlWdXA3HtyrCgbx4AmBIOKY9WwtdmJUrA9lH8eW52QfHwm7fSOQCwGwpgk/HrRgSkNgJLgQqZRoguU9KGHQk26sudiV01Nvj5IDnp9vrQJMNlsSVE1ly1m9ZKM8GYADtLuIQ6NNU/LsfpUxer6ig5D5rUKtxulxpnafJj68ubs6n6Az4ZI835tomGeY+b1GXs+YZI4/95BThMeEQKRR2LvDOTeyZc1W4apGohb/YQRJ0hBWsNG7bp/vBo6m7cbr86apQjhBdJtj1HAIOCvCkfUgMFZRQn+AnLjsac9K1bdxbw85lXqM8YCmDCWxhUgHrHT4xbvtSjvAPdPmu2pAhqk8hqyq8/eJpUplPfBqk9x9SmwirKtFTYBMPkpwk3BFJ/DwkRHxzE+nmUjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(376002)(366004)(39860400002)(346002)(136003)(186003)(38100700002)(82960400001)(8936002)(83380400001)(5660300002)(1076003)(66476007)(66556008)(66946007)(4744005)(33716001)(2906002)(6666004)(8676002)(478600001)(6512007)(6506007)(9686003)(26005)(6916009)(41300700001)(54906003)(6486002)(316002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnl3Z1EveWdsZ2ZHU040SW12K2dJRk1nOXRockk4cUcvMStpcnNqczZ3N0U2?=
 =?utf-8?B?U3FoZ2I2KzNaWnRaSFNUY29GWXJpQml4OTBMTTVaTURVeWNtb0puL1Z0Q1Qr?=
 =?utf-8?B?cW5jTDJaZ25Ua0dncGVIeCsxRzAxMWx2ODBWUzFka0VxWFN0bWhneTlaSmZP?=
 =?utf-8?B?dWRkcnRlb3pkQXRzT29uZTdMUzY0YWRCdEpFVlhjV1N1dW0xV0ZVSTc1YTVx?=
 =?utf-8?B?b1hIcjdMQUVrdDlWY0QveVRWUVpwSlc4RGZZbGZhVzlLa2UwZlFmYUNKdS94?=
 =?utf-8?B?WUZwMVZMU1pLdW1nZFVTMVR6Y1U3L2VLWnFBOXVYYWdSMFZlZWlNZ2JsekRa?=
 =?utf-8?B?Z094WjAwekxUc0haTE15TDUzcEJXZUJkMmlSbXpOMTEybXdnUDkxTHByOHl0?=
 =?utf-8?B?ckN2STB5VktBS1lkbGg5Ly9rSWc1eEtHVi9pd0ViVFRJZ3RFMWhtaEtwT1NK?=
 =?utf-8?B?RTU4M21hQUwrN3c3R1B4RXZMT1QyZi9Oc2hjMXlYdjhjU3lkbjd5QjRBVWJM?=
 =?utf-8?B?SDNMbUxuYlpXUlhSR1ZuY2NZb0x1R2dwaCszU0gvRitrNVNFWjlmUTE3cmYr?=
 =?utf-8?B?ZkZrOTA1TDNOa2ZxQkJFcmNlK3VnM0lYRlNUTzlxWHdmazNHd1lYdEVwU0Er?=
 =?utf-8?B?WDYwWVphTzh6NTJnQ2xVdldmNjNsdXJQUnJZT05pUllLN3Nzb0Q4Wjk1QUpa?=
 =?utf-8?B?UkZWMHZUa05qWTNzTGpqQnp0b05PaGF0VmJlV2FURjk5MnhQL3VQd1puZlNs?=
 =?utf-8?B?SVpNSXRTSTB1RHY0SmFxdGpFRWsxMEZLMHRMSTBST2RzTkZzYlcwZFJHNkhJ?=
 =?utf-8?B?TUVQL04vd3VTYzJXNFV4MXNib3c0SzJVNGxzYXByMVE2L0NqcjFjWS9uTjdC?=
 =?utf-8?B?VmlVWE5IWnFmeHdOYm43ckErWVg1UmRqMnBzalBLN3pWRVVkdzFGL1JsTWNq?=
 =?utf-8?B?WkVjYWhsOXZIRTE2UUVQYXcvdCtXT2s0V1RFbDh3TWc1ZXFlTFN0N2ZneGV5?=
 =?utf-8?B?QW4xd0dZMHRZRnVneDB0Zm1kQk9VTDdGVnl0MUJYUFpEYThNdHMyVGRIUGlL?=
 =?utf-8?B?bzdNQ285TGYyc2s3NnE5MHVDOEJiWlh2SlVud1Y0c0xrV2tPUSsxR1VZdFRm?=
 =?utf-8?B?T2M1bUhaRExHVlZUeVlCK2p5SmlqN1RvQi9XQjFVazlvMWpkTnFlaXBnL29E?=
 =?utf-8?B?TVBkUkdMSVpVc0JDb2xDVEw2anAxV0J5aVJINU1vSTJKdGMranhjZmJGcjBO?=
 =?utf-8?B?R3BQUlZnTi93T05lcXYwWUJHcHhXWkVaaDluNzV1dFlUa3BuWnN4Zk02N3Bx?=
 =?utf-8?B?eGlPUjROLzI0OWYwWFBoYWJpOWtPZXQ1WW1ScDVBNkdmamxIWGNRc0JoeFR3?=
 =?utf-8?B?MWVhU00wOWFOWlQyZFFNa2JuaFVhM2gyN25teDZWNFd4NHE3bzdZM0NNRWRr?=
 =?utf-8?B?ZnpuUWgwSU1qSVM0UDQrMWorUk93SnRmUzArbkw5dWNjQ1VRNmR1TXRWZVIr?=
 =?utf-8?B?MUQ0aGNBNjVRTWRHSHZJZ1p3VDBDaWlhSFM0SFkrSXV2SmFXeDdrTkZDdlU1?=
 =?utf-8?B?bUJoTWRORGJmaE9SUTJLRGNXdkpMRzRZQmN6eWs2QzNjZnUxbENPNFBJOWds?=
 =?utf-8?B?QVh2bEtSUU54cks1WWtCbU5sbjZOKzFydFJ0Qi9LbGhMRjN5Si90SE1nMWxh?=
 =?utf-8?B?MjBvamcvWGVtK2JBRmJiR2NlSy82RkhiT1c1NDRIOEhscjJzOTJkWVMrTnE4?=
 =?utf-8?B?MDJrVTFLaURCTERsUkxVeG5MSUg2L0xvZHQ2N3hvR0Rra3ZVdjE4R1M4alVW?=
 =?utf-8?B?aUY1dmZGTVdjRi9PajVlRE4wQ3l0L1lKSUZmSjRtVzllT2l3YTRsWWc3MEhh?=
 =?utf-8?B?cGFLZXJOVFA5TUtSOTloR3VrdEtBYW9hYXB4eHp5cFhCRXlqelZnRmFlaHlh?=
 =?utf-8?B?Qm1qQ3NXUnUzYmphWDBmdDRjanpYYjFZQ3dYM1FqMzh6TFhVRFZmbHdjWkE3?=
 =?utf-8?B?bXBZQ1poVkpYMHhSLzZHWjlRZ01GZ2xDS1RRMlRqcDJURlBkQ21kck5Handl?=
 =?utf-8?B?Y1diRnRrZnQzS3pGY0xZWlZFNi96bTNIMXlZZ0RONUtHY2hYaE56cS9GT002?=
 =?utf-8?B?d0tIT3k3Nk50ajJhY2puYk81bjdVdGpYWmVlTmM1UXEyOEVzNCs0b0JFbERE?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5f3b5c-cf6c-4046-a2b8-08da9021feab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 16:08:10.8734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTJdjz5fNfhXXWg20OQn4cmMEmgTQ1qmc/twScgKnQ8BZeHq8V1qiPNnY3MsLhzp9WqRh0Svtx/osBpJJfGO+INp/V6LNQ7mFEmfsIO6SLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1820
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 03:21:25PM +0100, Matthew Wilcox wrote:
> On Tue, Sep 06, 2022 at 04:01:13PM +0200, Michał Winiarski wrote:
> > 64 DRM device nodes is not enough for everyone.
> > Upgrade it to ~512K (which definitely is more than enough).
> > 
> > To allow testing userspace support for >64 devices, add additional DRM
> > modparam (skip_legacy_minors) which causes DRM to skip allocating minors
> > in 0-192 range.
> > Additionally - one minor tweak around minor DRM IDR locking and IDR lockdep
> > annotations.
> 
> The IDR is deprecated; rather than making all these changes around
> the IDR, could you convert it to use the XArray instead?  I did it
> once before, but those patches bounced off the submissions process.

Sure. The IDR annotation can still be useful for existing users though,
are you saying I should drop it as well?

-Michał
