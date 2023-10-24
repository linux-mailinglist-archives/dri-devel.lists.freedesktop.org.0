Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665517D5116
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 15:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6639410E3B1;
	Tue, 24 Oct 2023 13:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098AE10E3B6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698153039; x=1729689039;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2OYIKqekGYFQkTe39FRxK6w6NhQQdKSr+9CaKH7PW1Q=;
 b=OVvZXumcO0NPfvdfYlnHS4T7gBNbdpgyCuBuNvszMKU6onKU0Zurzh1b
 lAQT940vHqt+Y4qHhnF/rWdSJO6TgYYpeKyPIDFY7BIVQBG8DM+EfukJM
 QTSM1Yj3ljfCcsaOrPds/9hd3+K2svL8NOTl6sy2eSfJ+Du/dqMJrtajz
 dz3Qsdp8VFgoe85wmto6AUivSpFNlZRNqJv1YzUFrq4cLg4Zx5ebBF55Q
 6imOC2roml8IrSmtz+BJegN/oYg3C0flzQBmppHHVQiBVk8oEntBYlydw
 Ifs4DkgmyQMa3+giNZs/crzI42zjsVBtFBZLNApjm/NF6kdac4AZflPhl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453510331"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="453510331"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 06:10:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="6167770"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2023 06:09:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 06:10:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 06:10:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 06:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McOsfGbPhMpZ0SfSKObQe9KKEApsXgybBfnbf/r4n5vDqwM5sk5XyyJHvgGa7sdHRaaMkZZ0TjxCgU+QiNgs1N4U1nHQNZec2R0xUg9UMLDRUtNzp82nJGa5nR/wx0F9pPbtngOojhM5XA3PhGUzvHmbZ46Z1jMmZQ5MvdvfhGqh92fXO0ulWk3KB0u+0HYYhNe9Osi6Dz2EJXT83cFhAEVF0i+JQJHewxj+UGDQdxRzZKjvtnTRz43qz0WqJhqFnivl4kX+HDGpBj0IBOcU2ArgtEk/wzIvJc0KCRuFohubEMowOCwux9h+yNibWLUlHMzp/edRjuOiwx7mifE/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OYIKqekGYFQkTe39FRxK6w6NhQQdKSr+9CaKH7PW1Q=;
 b=RoSwnSXobwFzsTWhLWADe1PE1OLmxmfoS6opsn5wEUJE6TaRwkd1nr5bnKPdBEt3nrFD0VHyDUX9X1b+cf6luSIszjRuJ8H7zCsXYbDLyyEA4snALbRLsBYt5ouEETab8hOWKpj4s3WD4euWY56IhgMd8Ylb+PJzgm2JVpNc1X5howjVeTP3NLYhy8cHf7kOG3gyMk+j4o1rCnX2JG7jNnD0mdGXWMBLxsuj4fRF6D62/BEMMBg9t7LjaH4jOxEf+qANmJv4Y1ydmsJ9y5IQZ3AW2UMyzXKki34w2HcIvqwjUgoFEX3/t7LOErnuQbzKGxK2IUvh/F4Bx8MFyyBrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 13:10:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6907.030; Tue, 24 Oct 2023
 13:10:35 +0000
Date: Tue, 24 Oct 2023 08:10:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH] iosys-map: Rename locals used inside macros
Message-ID: <g7y5ivgobnrccjjtdczrj5gcksc5bftutkz4zeeynn6os3rkac@e44pxi6wng43>
References: <20231024110710.3039807-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231024110710.3039807-1-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: c830b6dc-2902-4df5-5433-08dbd4929c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eph/QUifC46Ofc87uJfkp/oaFdN5sqgmfQ+hy2190k4bOmvWtC9rMmr9WXGrtJbaCugvaljOe2QrmRvbv2Y162/nk8WD/n2WLS9p32FTlYGixEs1eZSSc7q0v09mhzzIuhGkxRuOWJHaab7HQFKap/MAohR/u5xPmWU1MqNVQNhD+G3DkAs2ZE5gi4ZM/ZEOUFUsoTPeSIr9YtVKzbH871aPkVgzrbd+xQ7gkWCgjU4JAJPGIzrKL7MLZDWA2c7ulj7BUhbJjp8k38Dc67jso2EwWR9DyfbHHtFEHauOesEkhB9CPI0ejQlGT/kRurRcihrI7++XFc5qgLRuRtIjgajIR5CCImSc/rIyKmBHt4SQo67TRJ/anIctOCDTHpd7KYqlXIOO0Hp7MzL1/B/ImtPimikSSGK/Bj16QgHiqTo2u+6k53Na/xx0Vje0v9WXPLxXiZhhpFifYbhgKvr7xYb8eMVdH+IWnY+R7t3iK/OPhkqiap0ljXH4calcdx17OU50NFLdF+QLGoTxx1OzUbH7rjiu2zPJZhjA6wLRfaZr2rt+kvzSnt+LZOWQ1Ysz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(83380400001)(33716001)(82960400001)(86362001)(38100700002)(316002)(2906002)(9686003)(6512007)(26005)(6506007)(4744005)(6666004)(6486002)(478600001)(41300700001)(5660300002)(66946007)(6636002)(66556008)(66476007)(4326008)(8676002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtjL1IzR1VvRzBwaUxFdVNtL01sTUhxOHM2MDZWa0R0cWgvdUNWZjQxVHFQ?=
 =?utf-8?B?YUFENUEvb2JsaHE1YnhxaWF3TVhmTWx0ZW41ckVCMWVoU3MvMXhJMkl4KzNF?=
 =?utf-8?B?R3BnNE1vKy8vcWhGY05YcGlDSVJ4MUtzaWxkS1lzendlRGlkdkRSZnhSVk9y?=
 =?utf-8?B?bFlhQm8vYUZTMFI0Uk9hNUFNSUY0WHpucnFJeWxQdHJ3b1AraWdhdVZRdFBq?=
 =?utf-8?B?aFRtb3ZHRlptMVJ4cFYzMmhNenZxdUJFQURNY05CSGVyMjV3WDBCNitCR21m?=
 =?utf-8?B?WmdibWtlOUh2OG52K3hGUmRKTHg4bFM4SHZzVnMwdDVzWGk0SVRGVDBlT1lz?=
 =?utf-8?B?OVZSYmlKM2UzTzgvRmJSMUNrR2owNVoySk9XN3UzNmFHMm51NFdodUFHSGZV?=
 =?utf-8?B?bjdTMWNSNzRXYjRWTVlsQytPSFRseUJwMGt5Z0tCcW9vcS9SSk5IU0ZIejgx?=
 =?utf-8?B?eko5YmlKdW5pUzU5cDdXT25LYUZSL0kwMnBKaTFyWFhqNnUvSnhIWVM5QVJz?=
 =?utf-8?B?b1kzV2VXdHNVbEtVcXZkRjNVb0dmWWp2WkVwbVJnSVJqRkVGbkFQNVV3TFRm?=
 =?utf-8?B?UFpDWStTZVlRR1lhOWtZemhZb3FRZEhZbXh1V0VpY0hRU2FZN3FqZFVaUnRy?=
 =?utf-8?B?aC93RDdhRkc0OUw5R2g0bGwrUGVkd2Y0TDFIcW9pU3pIVXpBV3MrdnlFalBM?=
 =?utf-8?B?T1JTdnF6dVVOY2Zwek1aRzhsL0VUWTlQY1NQWjFub0hTckl6WHppdTNvaFRu?=
 =?utf-8?B?empMMU1qcmxPK3BaYmFoV25rZWpqSEVKdi8zRWpxcEpaZkgvcFNrejQxZ2tO?=
 =?utf-8?B?WGRMK2czaTVNWUprcC96anNIV0RBMkJkR0lkZjlUYzg2VjZDSHdCeXZNTjd2?=
 =?utf-8?B?TWRNbUlqUmNsT0EyT1N4ZzlZcnZlZUt3OERmUDJucVpJR0lwOW5HNERaVitE?=
 =?utf-8?B?aGpYSmVxSGVJOVI1bHQxNmFscTJvY3NPeXI5S3k1Q0FNZDZ5QUJMWjd1MWZL?=
 =?utf-8?B?cEIrTmRRVW1DRThIYzVmbStyVmp0MkFoOHI4SnF0b3dSWVBrMWpkRmxCbitm?=
 =?utf-8?B?WU8vM3Rjc3lqTnROSjFTN0FRYkNXNENBQlFuc0FjckZPNFJkdjNnbTZFRUpm?=
 =?utf-8?B?VEJ1OWZPa1RGSUdBb3FVS1RHQWkxZ3k4R2JqSEphQVlBWEsyMFNZYUl3MExw?=
 =?utf-8?B?TTNuV0J6dTh0Z3FlZ2FDazl5c2laTEVRVHVqb2hoUFl2TFUzVG13c3BRbThG?=
 =?utf-8?B?WGw5SjVmeTFiejF4WVFwWk1XeUNnOERCd1NFbEdWRjd4ZStnYmFvRnpzWVdt?=
 =?utf-8?B?THllV3BSdUc4QXdtUWhwSjNVTXpXa3ZFanRYdUE3UDdJOG52dktQY2lJMGQ4?=
 =?utf-8?B?Qm5mZStURkl2bGdyMGtvd3ZldHE2a0xPVkNSSU1kejlobTlFWllZSDhqT2ZX?=
 =?utf-8?B?dVF5Q2oyY1ZyekxwWFUvakRlMzFDTGRFaEtmVWUxencza1I4TXF4MURrL2ZR?=
 =?utf-8?B?NjdlQU1lSUU1cXdzV014dXJKUmJiS3BQRTg2VmlOckVUYnhMTHVIQ0g0R1lO?=
 =?utf-8?B?VVppSkIxWE1IZ0FFZEdNTTdRR3k3RHdpckx0NnVXMXk4MzhvS2xab3NHYzJL?=
 =?utf-8?B?VXZkSTV1Ym5mOGMycUVRSXVyNmIycTllT3VlSURZTXVod2xmSGNkcERWRURa?=
 =?utf-8?B?RTdFakVQYk1ia3VKQ1F1UXB0S2tpcFludjJEeFplRUx2UHFwaWVkQi9QaW92?=
 =?utf-8?B?TWV4bXUyaDZFaHlVN3RTRVBuaDN1ZmFOVVV1WWJMQUp3blBGRjQzSURXb0RC?=
 =?utf-8?B?eGdrMjMveDY3S3picWJjQkxzRmFqb0xWaTJZamxwL3RKcWxRdXJIanRWb0hh?=
 =?utf-8?B?Sks4SFBuZnBxbDlZMVRyb3huZXpHY2MraTNwNkYrcG1zbDFmTHFERGNGanBx?=
 =?utf-8?B?K1dCQlhOMWRYVjA3LzNwZ2x4cHA3bnFxY2JMbkwvb0s3WTlqRlJzWGZtaWls?=
 =?utf-8?B?blY0Z3NLZzlJdjY3Qm00MkIzaFhLZ3huWW5EUmxpVTdHZmUxU2NlRUdocisr?=
 =?utf-8?B?YS9HMmEyTldpTEpIcVpLRTVnQUVoZis0eGs4cVVRNlVHZm5vV21xeU9nOXR0?=
 =?utf-8?B?TlcrejhmOXVZSDVxMmllNnZLRmhqMkF4QnA3U1VVTlI2YTVCZmFMRm5ORmdL?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c830b6dc-2902-4df5-5433-08dbd4929c29
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 13:10:35.4645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMCUacyrCl8cKQJW+lxsdkdkznNzGm7qFaZJGiI0j5L3m1Cb/GbGWtgy599b4/L8d+wT5mSHnZNpITUTNa0s1xE6O03FBqSb8IOXD/ltsYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 01:07:10PM +0200, Michał Winiarski wrote:
>Widely used variable names can be used by macro users, potentially
>leading to name collisions.
>Suffix locals used inside the macros with an underscore, to reduce the
>collision potential.
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

`git show --color-words` shows this is doing exactly what it should.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Maybe note in the commit message the compilation error we get with
clang? Although that's in the xe driver that is still not merged
upstream... so not really required.

thanks
Lucas De Marchi
