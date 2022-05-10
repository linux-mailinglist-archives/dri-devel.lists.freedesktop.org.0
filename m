Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FBC520E50
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 09:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFA810F514;
	Tue, 10 May 2022 07:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B6710F511
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652167206; x=1683703206;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1oUzNl2kKxZxIV2MU2eVqII16unBBqXxxaYXqeHjiIA=;
 b=au9CZbOvaGZnzkHTJtwDu/hHiZg3hj0h6PuqAC0CfpnbU3yEX6kzoh8x
 IyEKHDwHBcFhsMPakGu4i+NvZCqcV+3sVh1dwHLX/JsRuYejnr8Ee1nuq
 YvIMXdpFcJoTZctM5kY3NVWdtj4XHDXgdryf5YU3wU9vD9gTZdjN5uoWq
 Uoj0EVMJORxDVWYcvXeE3SvpuHh/CViFDWBlAjQYxvCDGDLkENzgIiN4l
 Z/Ak8q4sotwzn2ZENbn5+JcO1iQ55H5D9ZIB5PYeFm6g3GeAryh2FPWHJ
 b15pE/JwYTtboqO/yYqRB0fHvoDByf1MIydSX6mVKZ0AzC9fBBBvsdBxZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="329885589"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="329885589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 00:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="565502557"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2022 00:20:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 00:20:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 00:20:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 00:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQGQb2D1iKZ0S4jmykmEd7tlWrVN9Po55pQADjUed6GjrnGhU53W38FZyIHV7lmZdsgxdHfh+Ifp/DGtY9k6kw7knLoE5cKmZWK40NO1tcpSh+dCK4FXBc+3tFRoh16z2j4o82+0exm9W8UPYiZLVLab7HyFllphOzCKUjGcVrZgq5D/UXXAP5kviSCsqnk8A5v1MIzjJYHf1Mgr6ZNn4i/yNmwUki9JSrz+EftQ7qvt1qiKF7SsVxTibA/fAfRuZ+iQFAqXYYHQFpGpEYgPr7z3rkWFByA1xzl4lZfvgeEilos44VZcC2GmRlUdtAv+u2Ck+Wg3W5uAwt1J2Cvj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1IE7I/AmGtLNrLYQL90ND8SWIWPiZvIspdtsY/QTeU=;
 b=T+8cVycc+bT+50+PelsuHlqyCQqPaRhuvOE5YJ91BChLbqkNRtbvEaGdTkYAHvaiJfphXVN+FdPCt16bpFC5Y4wNpVe4m4/NGk0UGBKjzjXehkQjQfEwNuJih7mPXmkToKqNDBfYvTC6z+i1oVuWs+kYGfCJwRfcfjQTq0OVhh2P4ZP8f868joUNYxxFLAu6A0eiHucJXIY7eucUTw4jvnw28d+UNQrfCMlDwKDubBsxrM1r70oJrxtgvHQUKV+wCxktTk/+cBAFlkkaR1AEsy4bmp46cevi9r3HueKSp6Xx+6eTSF3Mir8Zjn+OD42AG3Kk6CJ3FUFUljS/boVMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Tue, 10 May 2022 07:20:03 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 07:20:03 +0000
Message-ID: <8401c328-ed67-8d5e-4ba2-b487f256e139@intel.com>
Date: Tue, 10 May 2022 09:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0444.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::17) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a059ad8d-8d9a-4a38-90e3-08da32558002
X-MS-TrafficTypeDiagnostic: PH0PR11MB5144:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB514487221247EADA285B2C27EBC99@PH0PR11MB5144.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ph6a6FzJfiW93ew8hSkhYlegwmMO+uiuMOUklOzmmKtXWS5XwEeVdpyvudqLaVsLWJoJAFuhdYh57Y54/R3XlKgpx+y+tnCBgZFHGQI7oA4fLthNUls1eht80QqeLT7Q2Mr5tkEeEm+Yoynscn1yC0sLDbmny6hLGWgibxlRvXHjQB7qQyPmquqH+dHRGVMLUHRhJsvt2Y14Ymm5TppP8hL/wG+SGz//HRl6tSyf0rzAH3NutagPVTjtk5nUm23vO+XB+ytMRj3oBUgLBEr5EWi5H0iAh6etAqIyjgmcuX0+9iEbQs+O1DpoHZIZauHVngJcswJAsR6yXHvVRX02tfWcm7qIiff58Sc9uVddnBglYqfvSh5ypFjPPFlLCFG211UN/R+Ff5IJuIQ4NvtrdfE7xSgQmFxJZ6Xq0G+Yteh+/5Aw/QNRpzYBC/j7tEWOSqy6BEbH5WYYRd4vdLiFvqbJFJr/H+mfTPmBh4j2zoQe2QgszDX9SRRB+Oycjb5BhyIPVYabdtE2X+caSwsgmXsYplIoBdKsQcjOr6qi+JsYOTDLuFxYsoURrUGNamFkPLNrfWr2NSjtsupS9sewzn/D6CpYYTG9QQOrjQ1pDkRQ3dNQM+0tPBklIjDrUmWt1r8Av8KiJn5wuphBZzWpyzawbuREVJzsQrA7PelFclY+9lNfKO8g71/tk40hcPHeGMneGjOckns74phPz9nP0OMQALFn0ojBiuAxY7pl5tpYmi7DkXaF8NzEqxPV9OegvgoQ+CtDIHiYXSCqU+MFyFB1uDCoT8Nf78+tyY5ShcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(6666004)(36756003)(316002)(54906003)(2616005)(31686004)(6506007)(186003)(83380400001)(107886003)(82960400001)(4326008)(8676002)(66946007)(6512007)(31696002)(66476007)(66556008)(26005)(8936002)(86362001)(53546011)(38100700002)(36916002)(508600001)(2906002)(44832011)(6486002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEhIaHozeFlNMmhKRTRGb2FkMzcrVE1UdUp6QndIMDgrUWFHSWp0MExveW5S?=
 =?utf-8?B?bExIZUc0bVVOTmV6VVZOMldzclQ0THhtUG5GMXJ5dXV2UGE4L3pEOEU5amtp?=
 =?utf-8?B?NEpoQlZ5a2UxOUs1dStrb0o2WXhJRlBXN1p5Wk4zZGFHbzl5Vmg2QmM5Y0hG?=
 =?utf-8?B?T0JVeU1qWE5QenVuTU85b3A2OHBBZDhzSWZvVHJ2WEgrNW5zOURObWthd3dO?=
 =?utf-8?B?TFZIMzIzK0JXNy9Gd3AxbEtLUkxteU0xR3FFQ3ZKczZsYktJdW9vSFpGbGJY?=
 =?utf-8?B?Q2FGNVZVaVhQTmlEaFBkaWhiOUlKVXZxODEvbGpxbWk0WVZBRDB2N00rY29a?=
 =?utf-8?B?Qi9GbzhxUHBUOU44YU5pbXkyTVpvcWgxUStPbmx5bDlYQ3FRdXBFdG9qUHh5?=
 =?utf-8?B?aExnMkRsVTJ2NE56RkRkK2phdG5ZQlZqcHllTDM5alFTOUJwazAvMExYUUpP?=
 =?utf-8?B?TkF2QkpMSTc1QXJkTHV2U3Rua2JlcTdPZlF1MU4zUjg5ZENqcEk0eVhlajVJ?=
 =?utf-8?B?cGxPSFl2YThHTFhJTnN3YzhFOTErRitkS3VUME1EZW1NaE5rcDA4YWlueUcx?=
 =?utf-8?B?VzFYTysraDNpdzFLQUxTdVdqa3VVY1VLS1MxcHZTaUU5V0FxZDc2dHpsZDFJ?=
 =?utf-8?B?eERDWit5S0N1ZS9qWUE5dms0bkY1cTFpSFFXS0hiRmhUNU9pbVc4Wmd0aElk?=
 =?utf-8?B?NGUwd0hZZ3FWOG1mY3FsRzg2b1AzOUlobDRrYzJyUjcxVEJDUFl1VzkrQ1RC?=
 =?utf-8?B?UUl5VFVPcVRHMDFJbkQyZVgraDEzQlM2WjF0b2pKS25zSmFYc0Z4WW9qL0Fp?=
 =?utf-8?B?RlZRbSt2cGZCbGxyeGdDbjEwZTVzWnMrNkx6RlZ5Y1RnaklDNE9PVFNyRFhq?=
 =?utf-8?B?Zjk0NnVQeHRrcjBmb0tmTkZ6NDdPRVlXR2VTTkFBS3FSWUVDeE14ZnJCNUJh?=
 =?utf-8?B?bGx2UGZDUWYvVVgxZUE1YUp4bzM3RURON1JuS05DZ2tSRW9ldVozaXZNbU96?=
 =?utf-8?B?SFd5Q1NqR1FqWkVTRXFZVDgzdUd4eUpwZS9SakhTbXJacFdTSDZhbytlUkhH?=
 =?utf-8?B?Y1RCUkE1UFA2em1MSkU0MzRxbVd3RXBNUTlzZjZZUzU2c1Fod0gyeVpyOThK?=
 =?utf-8?B?UFhKaWVqTnY2QzQ2bnhHME54Rld0YUFRM2p2eFQybW9ZdUY1NXVKQ21vZTRm?=
 =?utf-8?B?blUxSHBSTnQyTDBxbzR3TmpycGVVeTJVcWlyU0R5TWlqMDNzekdmTVZqRTIw?=
 =?utf-8?B?dC90alVQeEpqSGZPTGlMdkRDMzFYYjM3QjgwWFcvVWRvUVA0RisrYTMzMVFo?=
 =?utf-8?B?bDgyU3BoZDgwRHRmSjZBL1VDNFE2czkwUnlja1kzY205ZVk3Q1R4SmVrOWVu?=
 =?utf-8?B?YWx6bDBOcktpeldWS3puaHpWMVorZkxQQkNya2M1SVYrY3JxbGl5M3crVE5L?=
 =?utf-8?B?Q1ZiZStqeUNvMUZ2V1gyY29WZDlPRktCS2lDdGxHbVV3OE90QzRIdnNWeWt1?=
 =?utf-8?B?TGRXd0R2Uy9XZTFZYU04TzZIM2pMdTNIV1RjYzYyZnZadjBUNW5ERG1vb2ll?=
 =?utf-8?B?THN6eFBsN2xQbTBaRnYwVU9TOEZud1JvZXpWbjg1U1JGS0JPT0xzRGszV0Zi?=
 =?utf-8?B?TXgyNzVOS1NyaUljL0FYdkNVRUttUFZhQStwN1FjTWlVaEVhc0IyTnJrRklW?=
 =?utf-8?B?YVBYQWN6Nll6RXJDZkgzTW5GdFA4Sk5rNFZDVGtOaWloZXpkZU92N3JFR1hW?=
 =?utf-8?B?TTREQnpUdWFGOGEwT1ZoOTZFTzduR05jSXc0VXRNeDQva1duMkdGbHFuTFg5?=
 =?utf-8?B?eFdpVlNyMHAxd1dCaW5GTmhxbElsdlV1cGxBaU1tU0RodGlIMkFPYTVJdGp0?=
 =?utf-8?B?Tm5yVEFQMW1ZMGJhNmpXcTRMdHFDcEZYZW13SzRET25wK1Rab1Yzb1JQdnUw?=
 =?utf-8?B?RVgxSEpkeTBwSTRMZXo1REwwcm4wbGNFVElvd2NKd09XY1pRb0xKNmVvbno2?=
 =?utf-8?B?aHNac2J1QXlCRjRPOUx1VW1zOVk2ZDNINnpyMjBmZ2Y0eDZ0VEdHdXVUaW1N?=
 =?utf-8?B?UEgrenNEWFo3N1k4dkZ0cTlPdEJqZkVyWTZyemJVanowcW5Od3crY2JDa2w5?=
 =?utf-8?B?dlBxSVdURG52a0VSL0RlQ1h1RWpWY1c2Sm13cXY3eXRZTXgxaThmNWd3OU9Y?=
 =?utf-8?B?czFOR2FmclVIMTVLWis4UHRlOVVBUFhUR1pCZE1HOTE2NGh3TEhoMmMzRTg2?=
 =?utf-8?B?L1llU1AzTVpGamRQYVppY2ZWMDlyUE4zM3BHanQ1RWtGQlBkejlTUWU3bEVP?=
 =?utf-8?B?blVFdE45NzVseWRxZVBlK1NFS1hBTkFwQ3RmQjRPeFUrQWd2Nkg3TThoYlpT?=
 =?utf-8?Q?F49DQZ+6YDFSB3vE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a059ad8d-8d9a-4a38-90e3-08da32558002
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 07:20:03.0263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRUXWRo74ykg5Y91rHXWHHbilROf+/V+XDEoZ3+3EbcqWSiY9j0S/4bvG/pr+cej21WBUuGxja0uXAuMfoWMkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.05.2022 00:42, Javier Martinez Canillas wrote:
> On 5/10/22 00:22, Andrzej Hajda wrote:
>
> [snip]
>
>>>    static void drm_fbdev_fb_destroy(struct fb_info *info)
>>>    {
>>> +       if (info->cmap.len)
>>> +               fb_dealloc_cmap(&info->cmap);
>>> +
>>>           drm_fbdev_release(info->par);
>>> +       framebuffer_release(info);
>> I would put drm_fbdev_release at the beginning - it cancels workers
>> which could expect cmap to be still valid.
>>
> Indeed, you are correct again. [0] is the final version of the patch I've
> but don't have an i915 test machine to give it a try. I'll test tomorrow
> on my test systems to verify that it doesn't cause any regressions since
> with other DRM drivers.
>
> I think that besides this patch, drivers shouldn't need to call to the
> drm_fb_helper_fini() function directly. Since that would be called during
> drm_fbdev_fb_destroy() anyways.
>
> We should probably remove that call in all drivers and make this helper
> function static and just private to drm_fb_helper functions.
>
> Or am I missing something here ?

This is question for experts :)
I do not know what are user API/ABI expectations regarding removal of 
fbdev driver, I wonder if they are documented somewhere :)
Apparently we have some process of 'zombification'  here - we need to 
remove the driver without waiting for userspace closing framebuffer(???) 
(to unbind ops-es and remove references to driver related things), but 
we need to leave some structures to fool userspace, 'info' seems to be 
one of them.
So I guess there should be something called on driver's _remove path, 
and sth on destroy path.

Regards
Andrzej

>
> [0]:
>  From 5170cafcf2936da8f1c53231e3baa7d7a2b16c61 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javierm@redhat.com>
> Date: Tue May 10 00:39:55 2022 +0200
> Subject: [RFT PATCH] drm/fb-helper: Don't deallocate fb colormap and free fb info
>   too early
>
> Currently these are done in drm_fb_helper_fini() but this helper is called
> by drivers in their .remove callback, which could lead to a use-after-free
> if a process has opened the emulated fbdev node while a driver is removed.
>
> For example, in i915 driver the call chain during remove is the following:
>
> struct pci_driver i915_pci_driver = {
> ...
>          .remove = i915_pci_remove,
> ...
> };
>
> i915_pci_remove
>    i915_driver_remove
>      intel_modeset_driver_remove_noirq
>        intel_fbdev_fini
>          intel_fbdev_destroy
>            drm_fb_helper_fini
>              framebuffer_release
>
> Later the process will close the fbdev node file descriptor leading to the
> mentioned use-after-free bug in drm_fbdev_fb_destroy(), due the following:
>
> drm_fbdev_fb_destroy
>    drm_fbdev_release(info->par); <-- info was already freed on .remove
>
> To prevent that, let's move the framebuffer_release() call to the end of
> the drm_fbdev_fb_destroy() function.
>
> Also, the call to fb_dealloc_cmap() in drm_fb_helper_fini() is too early
> and is more correct to do it in drm_fbdev_fb_destroy() as well. After a
> call to drm_fbdev_release() has been made.
>
> Reported-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d265a73313c9..7288fbd26bcc 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -627,12 +627,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>   	cancel_work_sync(&fb_helper->resume_work);
>   	cancel_work_sync(&fb_helper->damage_work);
>   
> -	info = fb_helper->fbdev;
> -	if (info) {
> -		if (info->cmap.len)
> -			fb_dealloc_cmap(&info->cmap);
> -		framebuffer_release(info);
> -	}
>   	fb_helper->fbdev = NULL;
>   
>   	mutex_lock(&kernel_fb_helper_lock);
> @@ -2112,6 +2106,9 @@ static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
>   static void drm_fbdev_fb_destroy(struct fb_info *info)
>   {
>   	drm_fbdev_release(info->par);
> +	if (info->cmap.len)
> +		fb_dealloc_cmap(&info->cmap);
> +	framebuffer_release(info);
>   }
>   
>   static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)

