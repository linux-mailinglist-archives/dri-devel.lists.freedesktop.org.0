Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B069052C6A9
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 00:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B376A10E562;
	Wed, 18 May 2022 22:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F66F10EA27
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 22:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652914437; x=1684450437;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H/32rCPNNqpFXyvqr9y9eQzQaW8lFflZWjkE11d0MDQ=;
 b=jqxWoQ8wUPOT8hkgL+kzCNlkYTrtuDbx/PoM8wqKeimaIAuy/x1MMPeo
 v9wu5795HkSclTT8xCbpDjQGWwwHnxJNBcqiJZa5Tt8bNenbdjUFG7hLp
 ostezuCgD0p7mCRPVCLrU3C+pcXUoUFMfNJJ6WXlNYvSfxoFC//vbQJnF
 kqxFg7HmqAQtMC5vS/SWVpDvVShT4QkgpzQ4MbCFejo0FULY/fk2jSEb8
 5Sz1Z3lIKvc1L0axQpU+YJhQpstG6FWXk6H2pVt9iR0YHCw5haTzxlru7
 e8G5BiZf6EGqoHRZmR3LxMG70w4oM8u8C28Xxgs2J/hvnbbfA+47ythHL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="259494575"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="259494575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 15:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="817676301"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga006.fm.intel.com with ESMTP; 18 May 2022 15:53:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 18 May 2022 15:53:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 18 May 2022 15:53:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 18 May 2022 15:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/JMA/oGGwr1jHCejA6m5LBCEB8LvPkFvcYLGVp7i8SNOXhfHxC2s4/JiSDWPEJyCxOMCeoq9Er08TWmLb/a98tqA2hZ76KeKCTaRtCTNfbQH7nFZVNdtVttL+vu4hti6ufN0rvxXRElyMRb0zEfgKbFeAfhOVty5dK7JZixjAogxX+oGstkPGvbG6O8NG/L4Ca8Gdq7S3Grt3k6MIEleUBctEWXoNbv0ljPhA+BkPkYIeWzRWmuX6x6b6nxMOV7W1R/VeyuHTna7qPf/jZ9UfZrcJbwAcdaeN4TN5pST82FmQUoQ7FpFFECzL0mW2fNlMlrx9t/rBbpAawFK/8Txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67TkLXt1q9MQVdAeMJOvRq2gO9mvG8AiFJ32TYndwqY=;
 b=PXmbdIzDezFQzyLWRSm2WWtYia5V6CMVilLNAk3zIZIGPtti5qTzBwgg64YYpaKpITLPVQY1ssfiVlIqhW5tAEFruX6qawkvesZF+I+EomEsqfS/kUKF0GoLqcPPlbTRVnMZ7a5cmSBjQHG3RDvpk6k+6ull2iq/vhgf+5aBIACbIQ+baz5iGJvUUfZCl250sC9OcAjCwLr7tXt0wQ/ymZdjc5dn76R/SdV0Qzy+G4mCyyj9vjVQZay+0pQVk3808X8umkNbKiUbLGrojmcgW6aZK0zIC4jYjlxEWMiY+Mx1xw0ZNGNygiS4iztax6DiXZdza6AdJHuA+l3fefUDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 MWHPR11MB1869.namprd11.prod.outlook.com (2603:10b6:300:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 22:53:53 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 22:53:53 +0000
Message-ID: <e7750409-d09e-e182-c400-75dae2343169@intel.com>
Date: Thu, 19 May 2022 00:53:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <CAPY8ntDR54vaBuwQN2F_j4_rxYgkFmsxc+mKYBn0YLe8=CtxtQ@mail.gmail.com>
 <b4eb6670-79a9-eec0-bbd1-6c5a0e31ff08@samsung.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b4eb6670-79a9-eec0-bbd1-6c5a0e31ff08@samsung.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::15) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8328f1b-277f-4589-c6d1-08da392147f9
X-MS-TrafficTypeDiagnostic: MWHPR11MB1869:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB18698A1925497A5E456C651DEBD19@MWHPR11MB1869.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WpsFUbBbkRm9g4c3EDU2Q5x1i0TTqdtPiMdtmlLkSnyggQ8kmsMvjcD4asHA018O63gQD4z/tzJH0UaCMRhXaDjhZbhpsMU3DZZFcDf6D0fZH/NXFSCUJ14gtTz79fMwE9BHmJ9FgPR2108htNYpGFSA5WquEhh8nQn6Lwa7VHFtujextQ/I5pIgPsIvAKMWe51l/0BENWjMc2vbhjUEWuOS728MLiH9MJfMSFPrGHph5Nn3HYhZDnUhdRn5A4TLl+hEibqS90JJC3rgHcatZNq0M8x17Pn9welG0Xxpu9jdQd2TV5h1MKXVeA2VtewoQXxYcOn9IRh3xuy+QTWwq4zwwed9bcp29/b4mUyQKjb+zokyqwYrSASyfrkm8I8cTiIx4RdOo6TlJbssHiGHFA6gaqvStNKrxYq0CjE/jZM35WCpYvMF9dVHaA8Gce909BP/Gem2dgIWrHCNwfvqcB/kVEj+nEm8pJTTm29hhvAKndMxQWjNkyTFQdoUFH5XcN22qRPMTf6P8C7UeJ581sB98g6CmlKn/bnz3au8obwWAaL514ST3F09DIsnF/z+NnXSheCRt5dmV962JN8qJgkmEW8nOsSYhGLUcUuxOHWJjCuIFDfRd1BLzmX5mZRKbXRjG+FLxZbxtiwGix68/EZHi/W8iuYU4sTEGzISone6FlHv8m/lD7jSx2ky3i98EbI0blHV7Vqgu4BndfmIh4XdTwSqdzKGOfj4XYSqJHJCHJvJUeHXq91T3CnfISnSiE/+yPmNwbFVZFEBwPdD5wrnzw30/9hcvHRF39LQt1VLAItWsILnuq498c3VSAufjXd0zYZlzU4Jw6CYW8NmThN0BElhe2XokI19DZ5VLTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(966005)(2906002)(6666004)(508600001)(4326008)(8676002)(36916002)(31696002)(54906003)(110136005)(86362001)(316002)(31686004)(66946007)(6506007)(82960400001)(44832011)(7416002)(83380400001)(66476007)(5660300002)(8936002)(66556008)(36756003)(53546011)(186003)(2616005)(26005)(38100700002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmswVlpWOGxVa1lBSk55T2lJQXFoOEtVYUtyWVNOYVZjNDNCQkdPbFFnb3Fl?=
 =?utf-8?B?K1p3dnZPR3huTG1aQkdRMjBiVS9wbnhxb1dBNHBud2Z2SUpUVFNCZk80NGVH?=
 =?utf-8?B?ZjBwUmdMZGZCRmdUK2VsQWdXTVRNTmFSb1NYamJweStZOUlXenZDVkVOUjJq?=
 =?utf-8?B?NUR5bHBhbzhJaXdzajB3WTVBeCt6NVp0cEZlSDVpNXhuRzh6NXFGM2plYUl1?=
 =?utf-8?B?WGZYSzdFQTk0RWtubStuWi84bExZbFFibUVUYmsrWTA5cGY3YXlUbUE2dVVE?=
 =?utf-8?B?OWtQeEtLUytWUnJSUjB4elA1Zll1TFBQdXlwWUFZMldUeGZSTy91YWhHR0ov?=
 =?utf-8?B?a0EzT2Y4aEJ1R09YTms2dWtTNFIyeFlxM1E5dW1kTDcwQVkxZkhzd3ZXczli?=
 =?utf-8?B?bDNXNXEyUkYwaXJScmdnNStDcWtldlQ0eXdsUmNBWXplUEdZR3dYcmE1dHZS?=
 =?utf-8?B?YW50S2pnaHRoVGhrT1VpdG5hc251T2NhcS92SG9HL1VOZldBd3hUczA2U24x?=
 =?utf-8?B?d1lsNmk3VUNlTVAvY0xwekZLTjBOVncyem00R0ZGTzdUZ1VDMjJlTXozeHZH?=
 =?utf-8?B?ZTNTblU5YWw5OHZJc2VJb09QeTh4SU9FTFVqZXFqV01rdkx4cjFjUE1wNWsz?=
 =?utf-8?B?Y0ZPTjVpZTJjTFBvSWtXL3M0WWIxLytybHVxalpqTU15SlJIa1BrcmVYQmkx?=
 =?utf-8?B?TjY2NGtUTThONzhzekZ0bkVDOTBGcWFTdjVsQmRodlJtejFybDNjcVhMY3RU?=
 =?utf-8?B?UU14QldlK0VzN2lwYms0UnVURFhualpHT001YXZ4Zkxza29pTDRxTVdBaEFv?=
 =?utf-8?B?T3ZDNEZ5TmtIUU1zb0l1Z3EzTGJieW1vMm5NSTZxQk1vT2Jyc281YmZyQ0U4?=
 =?utf-8?B?L1BXc0NCUjBFUVEzTkR6V2RkQ01sNWJIWFR4elhiL2hRZU1mbGJabTg2R3FF?=
 =?utf-8?B?U3ZaSllnTlJrcGp2SnVPOUhDTmNESko2dFlhdzVkRVZBSEg1dUVjQVcxL0ll?=
 =?utf-8?B?QkgwQjdOQXBzd0JWam1hQS9iL1ZnWm1wWUp0OXhsTGF0OUdIMm1wVUFTR2Nw?=
 =?utf-8?B?MEdJZk0vQ0lyRFp0cDI4cDZLd0diZWtYVU83WG9VMXAwZmhHalROclJ2ZGVz?=
 =?utf-8?B?cU03WjBRUFowYVdYWmE2RkZLSFpDS0pjMDY1NEk3NXdkc25uSXhFbzh0M0VO?=
 =?utf-8?B?eXdjQ3FYWEtNMGtSTjRaYmoyZkxVcmdCVklGUTZCUTAxZTdkcFBlMGpZTS9Q?=
 =?utf-8?B?TUdGN0xuSVVpUkxVUFRtV01kQjMzTUdUdktzd2xKMFhTd2RSY2dJODkraHVi?=
 =?utf-8?B?N0lFVDBNV2VDWllQRzE4cU5lN010eGhJaEViUTVPUGdlM2NBdkxTYlA4R2Uz?=
 =?utf-8?B?OTdLNVJqeUF6cnhJcmhRTHR3T3ZUTFFLa1h0OC9zbXBpSTlqUHpUU0hhSjJC?=
 =?utf-8?B?WWkwdkEzU0xad0RidkxIVTVxY09xalVBbElDTHBDMXdGSkd6ZEtSWUIxK1Bp?=
 =?utf-8?B?WFROY29kSHpzdEpNZDU3OS9mMG85NG82cDhkMHpLeTBObDhCc1BkZloxSWsv?=
 =?utf-8?B?d1h6TWdKMExSUE1VS0lhVysvU3B1enF2Um5sRjA5KysvZ1BuejFZdmVKeXBM?=
 =?utf-8?B?VndFUlloOHZlRUhGQjV0VmtBeWd2bmIxYzRsMnA2VVZ1eXJDNW9sbENYU3J0?=
 =?utf-8?B?aVdKVHh4dHdDK0t6djZ6Sm9EODR2WVRNamUwUWN6Qzcyc3htb012N3pzSmdI?=
 =?utf-8?B?WS9BRGdId3dyZDJPOHF3MDJ2OWQzdE9sM2hIS3A2cTdEUjd3dytkZ2lEb05h?=
 =?utf-8?B?ajAwMGJFVE40QnZUcDA2NlhJYWpCcjNGams5bE9IZ3phZzJPMG0rRmVLNHpV?=
 =?utf-8?B?VnBMR2lXVmNIbURWWDYwRVRtMHRhckdQeWVPbUJUeGYybUFWRlVJNnJlSXZm?=
 =?utf-8?B?dWlOZk1McEI2VFhLMGxjNVp5YkMydmRnak1LSXg0NStRWEVhZXprWFZPQWFj?=
 =?utf-8?B?MDZaMm1ScTh2VEF3UkMySlZwOU4wVWpzeWc1Rm9pRStvRFU3K0RQRWlPTTdi?=
 =?utf-8?B?NVQ1VjkrMVhsSXpJcDlhQ29yTmRVTXF4Z1E0eTlPQ0lBWUd3dkxrNWNqMVNs?=
 =?utf-8?B?bU85MW5EeEdha0FCQitXS1VFUFVNZHNoMlZ1ODNxSklQZFIvZ2hGTWs3Y25u?=
 =?utf-8?B?QkhhMmxUMDdFUkh0a1FON2VQeG1oTVcxRDZVSWh3OTNyTU5kLzcxNC9ueGph?=
 =?utf-8?B?Wmc3ODNHRTlpc1I0QW03aXBnakZGSXptbHIvZEt5T1UrTUVUcjg0QkpkSml5?=
 =?utf-8?B?RThyQmJVRVpaQkR4aDJ1TXhqRTArZ2pucXdvRFF1YktSb1BoYURsV2RSdm5k?=
 =?utf-8?Q?ZoogVZ+2TtdrS4S8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8328f1b-277f-4589-c6d1-08da392147f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 22:53:53.3570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6toz4J9t+iY9GjHrtOKrvcfdpjWb8hVD9ktZ0x3qTN0OxwyYe8K/7ABfrOheoVBs/8Bg3A4A5sw15GnXc+BO3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1869
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Andrzej
 Hajda <andrzej.hajda@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.05.2022 16:05, Marek Szyprowski wrote:
> Hi Dave,
>
> On 11.05.2022 17:47, Dave Stevenson wrote:
>> On Wed, 11 May 2022 at 15:58, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>> On 05.04.2022 13:43, Dave Stevenson wrote:
>>>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
>>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
>>>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>>>> Hi All
>>>>> A gentle ping on this series. Any comments on the approach?
>>>>> Thanks.
>>>> I realise the merge window has just closed and therefore folks have
>>>> been busy, but no responses on this after a month?
>>>>
>>>> Do I give up and submit a patch to document that DSI is broken and no one cares?
>>> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
>>> DSIM bridge' thread, otherwise I would miss it since I'm not involved
>>> much in the DRM development.
>>>
>>> This resolves most of the issues in the Exynos DSI and its recent
>>> conversion to the drm bridge framework. I've added the needed
>>> prepare_upstream_first flags to the panels and everything works fine
>>> without the bridge chain order hacks.
>>>
>>> Feel free to add:
>>>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Thanks for testing it. I was almost at the stage of abandoning the patch set.
>>
>>> The only remaining thing to resolve is the moment of enabling DSI host.
>>> The proper sequence is:
>>>
>>> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
>>> video enable.
>>>
>>> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
>>> far done in the first host transfer call, which usually happens in
>>> panel's prepare, then the #4 happens. Then video enable is done in the
>>> enable callbacks.
>> What's your definition of host power on and host init here? What state
>> are you defining the DSI interface to be in after each operation?
> Well, lets start from the point that I'm not a DSI specialist nor I'm
> not the exynos-dsi author. I just played a bit with the code trying to
> restore proper driver operation on the various Exynos based boards I have.
>
> By the host/device power on I mean enabling their power regulators. By
> host init I mean executing the samsung_dsim_init() function, which
> basically sets the lp-11 state if I understand it right.
>
>
>>> Jagan wants to move it to the dsi host pre_enable() to let it work with
>>> DSI bridges controlled over different interfaces
>>> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
>>> ).
>> I think I'm in agreement with Jagan.
>> As documented in patch 4/4:
>> + * A DSI host should keep the PHY powered down until the pre_enable
>> operation is
>> + * called. All lanes are in an undefined idle state up to this point, and it
>> + * must not be assumed that it is LP-11.
>> + * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
>> + * clock lane to either LP-11 or HS depending on the mode_flag
>> + * %MIPI_DSI_CLOCK_NON_CONTINUOUS.
> Right, this theory makes sense.
>
> However Exynos DSI for some reasons did the host initialization in the
> first call of the samsung_dsim_host_transfer().

It was a way to fit exynos DSI order of initialization to the frameworks 
present at the time it was written:
exynos_dsi was an drm_encoder, and it was connected to drm_panel (DSI 
controlled panel).
1. In exynos_dsi_enable host was powered on then drm_panel_prepare was 
called.
2. drm_panel_prepare called .prepare callback of the panel, which 
powered on the panel and then requested dsi transfers to initialize panel.
3. 1st dsi transfer performed dsi host init (LP-11), after that all 
transfers started by panel performed panel initialization.
4. after that control goes back to exynos_dsi_enable.
5. exynos_dsi_enable starts video transfer and notify panel about it via 
drm_panel_enable.
6. .enable callback of the panel starts displaying frames (after some 
delay).

This construction allowed to keep proper order of hw initialization: 
host power on, panel power on, host init, panel init, start video 
transmission, start display frames.
Almost all elements of this sequence are enforced by DSI specification 
(at least for devices controlled via dsi).
The only thing which I am not sure is placement of "panel power on". It 
does not seem to be a part of DSI spec, but I am not 100% sure.
It could be specific to platform (mis)configuration (regulators, level 
shifters, ...), or just dsi host init sequence tries to do too much.
I wonder if dropping checking stop state in exynos_dsi wouldn't solve 
the mystery [1], or moving it to 1st transfer, maybe with(or w/o) 
subsequent code.
Does IMX have some 'vendor code' of DSI host to compare with?

[1]: 
https://elixir.bootlin.com/linux/v5.15.1/source/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L860

Regards
Andrzej

> If I moved the host
> initialization to pre_enable (before powering the panel on), executing
> DSI commands failed (timeout). This issue happens on all boards I have
> access (Trats, Trats2, Arndale, TM2e), so this must be an issue with
> Exynos DSI host itself not related to particular panel/bridge.
>
> If I call samsung_dsim_init() once again, before issuing the first DSI
> command, then everything works fine. I've tried to check which part of
> that function is needed to be executed before transferring the commands,
> but it turned out that the complete host reset and (re)configuration is
> necessary. It looks that the initialization will need to be done twice,
> first time in the pre_enable to satisfy Jagan case, then on the first
> dsi transfer to make it work with real DSI panels.
>
> Here is a git repo with such change:
> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework-v2
>
>
>>> This however fails on Exynos with DSI panels, because when dsi's
>>> pre_enable is called, the dsi device is not yet powered.
>> Sorry, I'm not following what the issue is here? DSI lanes being at
>> LP-11 when the sink isn't powered, so potential for leakage through
>> the device?
> I also have no idea why sending DSI commands fails if host is
> initialized without device being powered up first. Maybe powering it
> later causes some glitches on the lines? However it looks doing the
> initialization again on the first transfer is enough to fix it.
>
>> In which case the device should NOT set pre_enable_upstream first, and
>> the host gets powered up and down with each host_transfer call the
>> device makes in pre_enable.
> Doing the initialization on each host_transfer also is not an option,
> because in such case the panel is not initialized properly. I get no
> errors, but also there is no valid display on the panel in such case.
>
>> (Whilst I can't claim that I know of every single DSI device, most
>> datasheets I've encountered have required LP-11 on the lanes before
>> powering up the device).
>
>>> I've discussed
>>> this with Andrzej Hajda and we came to the conclusion that this can be
>>> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
>>> Then DSI client (next bridge or panel) would call it after powering self
>>> on, but before sending any DSI commands in its pre_enable/prepare functions.
>> You may as well have a mipi_dsi_host_ops call to fully control the DSI
>> host state, and forget about changing the pre_enable/post_disable
>> order. However it involves even more changes to all the panel and
>> bridge drivers.
> True. Although setting prepare_upstream_first/pre_enable_upstream_first
> flags also requires to revisit all the dsi panels and bridges.
>
>
> It looks that I've focused too much on finding a single place of the dsi
> initialization, what resulted in that host_init callback. I can live
> without it, doing the initialization twice.
>
>> If you've added an init hook, don't you also need a deinint hook to
>> ensure that the host is restored to the "power on but not inited"
>> state before device power off? Currently it feels unbalanced, but
>> largely as I don't know exactly what you're defining that power on
>> state to be.
> So far I had no use case for that deinit hook.
>
>
> Best regards

