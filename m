Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49B2F37FE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 19:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600AD89D46;
	Tue, 12 Jan 2021 18:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FFC89D46
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 18:11:43 +0000 (UTC)
IronPort-SDR: 1S+uOFKVqUUFW+vtJMpDp71NuXmhLsmmtSVuYQDrWQexTY2pz3rw9Eyrv5GgQJMXuO8DiiS6ue
 QrHe9y9sicVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165171905"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="165171905"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 10:11:43 -0800
IronPort-SDR: yMmiz3SPsTZXxBYnLA1tAc53oYZjvTXwzTbyUvYXIZX1iq4yHMGTThdNlfRZLtITt4aDPR900Z
 DnIR0P/+BOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="498997892"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 12 Jan 2021 10:11:41 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 Jan 2021 10:11:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 Jan 2021 10:11:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 12 Jan 2021 10:11:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 12 Jan 2021 10:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyaN2iW35X0hbvL5pPTS4IShxLZLv4Kj1cUUa6ScbPOoo3i8vzlglFVvkZyu1Q0AlT7VtQ9pUKwH8/PmF4L+nceN1v48XWIh44j7HZVHO1rdABHFuCYqDAbhvLNYTzbydyvQJAOy96tuCCRQFBF7UgxRGAUEV7Tm4tvvgrM9lH0hUV+aOuXTcXFhU7/JXU9fNiAatu04t7A7Gy5i0yyAe4xKY/RTY/gO80qnZ1BUxHGZErJNaHA1Se1hGsfCRBz6v1fM7drjMfdaFCHFKN2rZYdfyoEB+/aQzKnrsRRfjeet+4OoBIKFcE8iXQq89srk7vdzyD1r/RhlxGpIptpcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLC6KpBZq/O0WWEtxxdojYQ/aesXTCWnSXjtt/4Dx3Q=;
 b=encM64U1L94LXClJjzYPRTasoQidLxN91/8KmdoXHMSczCxEvApxekf9jK5yG7Tr8SjxH+avjO/cQZ3XVFkmizurt1CNrJ6mQjCI3TKvNq7Ynp2734CLVriNdjpVNp8q8+fRNpmBE33na0dlFvQLZjYrUKYQrMzv8teFrjAHfUsFObPzR5+XZ1RciwlniGrGtKtjugbvrFTy5eNkRrTJqeZCJv9zzwHQJ2MXtn8mt3qEBKEDPHaenKwBMLNqsvV8JJjEHgMWABHBcSZcoSH+tjIvaILLcxlWrRDR1KZUdg1AQMvRWJFdobheE4k4PJmA1wLlmuj8cbUzC7d9jgR1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLC6KpBZq/O0WWEtxxdojYQ/aesXTCWnSXjtt/4Dx3Q=;
 b=LbUCMhUc8VWhGQY7BOumgLu1AiOjJxhEs7oSjDdJPWfCHuM5DjVRiPG4qJ4KlAu1RyG5xBy0ZuMahn+LyLNQOupYlPK3jZ8IUM2trHbroRSFq2qxaeh5IEfJyk4M523r2cHaPKKGQogdWh6mnG6Cb7fLrCI5XpwkHC81yzm3g38=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB1984.namprd11.prod.outlook.com (2603:10b6:300:110::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 18:11:27 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 18:11:27 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [PATCH v16 0/4] RDMA: Add dma-buf support
Thread-Topic: [PATCH v16 0/4] RDMA: Add dma-buf support
Thread-Index: AQHW0ybv5Bnk7Ef2+EKwhnBRO9bgTqoitKeQgAAF2oCAACAzkIAAApoAgAABi2CAAT2EAIAAVZ8Q
Date: Tue, 12 Jan 2021 18:11:27 +0000
Message-ID: <MW3PR11MB4555CBDC7BB290C39FE61DEAE5AA0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20210111154245.GL504133@ziepe.ca>
 <MW3PR11MB4555953F638E8EDCD9F2CA90E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <CADnq5_NTwynVt=ZPF-hiNFaWfEWiDnoTQCS0k1zx421=UAFSNA@mail.gmail.com>
 <MW3PR11MB455518915ED5AE1F2FF0CAB1E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <8aa96c52-f31f-b8d8-bf16-897775bd9c78@nvidia.com>
In-Reply-To: <8aa96c52-f31f-b8d8-bf16-897775bd9c78@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 358decc7-db0e-499a-4cf4-08d8b7257aa5
x-ms-traffictypediagnostic: MWHPR11MB1984:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19845266657C472C9BC3D5F3E5AA0@MWHPR11MB1984.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y9Bs4wHuHqRXfP/uCLh7GAq9ivZVGEaoDrbbp9Ezn1/iCxskQJiLf1+99rRqSrk+CVuAZuzhXBlZ9gUVTpyqV+H2fH4CeE8aEm86Z04pHBHEMOTR9ygJtAwHx7AFjCuUJiaJjTaG3nH0IUk2DVuCQE/Q7KSiNjc6fKWHlGdTV/ikWh7hl5GLkzb2qE5J7GKoSs3f0De3+NwBaf7brT1qR/cRObD7/hsp9W/akGDVYhemuALQ8qr2m1vfSE60AHaCkEo62OuOLrUSD3ZKZLP4jV/v+smQiKfxvbl9mlohQ/wyWs9OMXJ/L7KrRUfZ2EKQo1aC7T7IdPNDGVFk540qfvltMBP8QkQ0ATOfUclIjX6rftsWf0hf9sgdUx3L9SZaktnB4vnlw9PcnbCA6Gxt5sxwP4V2SueIEzPECzpo07KMI3+VrzQTPRI+32d1HAZxOvhxr42bMdFUNCArms7Ebw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(66946007)(110136005)(76116006)(26005)(4326008)(5660300002)(316002)(66476007)(86362001)(186003)(6506007)(8676002)(64756008)(966005)(66556008)(2906002)(33656002)(66446008)(9686003)(7696005)(55016002)(71200400001)(478600001)(83380400001)(8936002)(53546011)(52536014)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R0xyK1ovTk4vd201QlZaOGc2L1kxMzBaSUMvN09QR0FZNnBLYlBNWmh6L0Jv?=
 =?utf-8?B?MHpoUk5xQlgzOHNOei95aWJwQ29yRU14UkF0OFpIdVgydjlodTBGSng5M2cz?=
 =?utf-8?B?cWVPdEJ6YVcwUzlpbE5hNnBMM0RWZjErS1RsZ3VzZmVuU2VEQzgvZjg3L2F1?=
 =?utf-8?B?NGZNenhKMTF4UWVRZUtXcHEzRkI0NHFuTHhPNE9yZ2tONnlRVjhCSGRMOWxj?=
 =?utf-8?B?QU10b28rVmQ0VXRKU0tCS2RCQUVITjRHRFRoNVl0azh6NUc2YVA0azB3a2pC?=
 =?utf-8?B?RWJpVmEvemxzZkR5a1lLL3RWekFXVzNjaENqdHgreE43WHl0RDJiWnlUekQ0?=
 =?utf-8?B?RjlNQ0lIbDc1dmZhdTFOVFl5Q01YUHd6M0JXWkZrS3djZG5qWXp4MHlQM2xv?=
 =?utf-8?B?T1hlMUUrRVUycDJJYVRScHNIcHV6cFpNdlkwSTZUbEdhWU02cm9RTnM0WkYx?=
 =?utf-8?B?cHZFNGZHSWRXMkFrTmxoRW9QM1hkN3pPSnY4UDNrUlMyNGRmYVJuWVVJNWRH?=
 =?utf-8?B?OWg0d003c2Jab29wcFBxMU45c2NwWnh6TkVzaitYWis4aFArUzYzL0g3V215?=
 =?utf-8?B?NWRZN3JuY3hKVDBPNnUxQzNaYlBaRGFsSEptZkVaT2IxM1YyaEpOWCtuQStm?=
 =?utf-8?B?M0EvMzRzVDB2emZLTm93YW9vNVZkVWVhbGlIakRBS21EbUF2RXNmSm43R05U?=
 =?utf-8?B?djBLZlc1ZDNJWG5lWjVZUnRkcUJwMjgzSlJLZEdmd1JjMEd4c1orQXQ5MFFV?=
 =?utf-8?B?bndnM3FYSE5IcmtZeThaZ3pMWWRoaFEwaXJGQ3BOR2dHV2xFYThLUnBQUHZN?=
 =?utf-8?B?TG5FYjQ2bFZNMTBUWkJiM3JBRVY4djl6R3JEWjNwYUIvclNGelYzeVRFUVJZ?=
 =?utf-8?B?MlB2Ylp3dFlsRERiZ0ZNTWRCZzVOeTQySXZGYzF2Zzk3ejNvcFltQWdNZTdq?=
 =?utf-8?B?ajhRL1czaC9QZTEzMHdXeUpNQlA3UUNhODZaRkZ4eFpPRDV6SkQ2VUd4NFhU?=
 =?utf-8?B?Tm01U0lsZklHRHRQQVN6b3BOM2pWOFhXSXVDWVZOOEtnMERBK3pCRkhwbHB3?=
 =?utf-8?B?WkNvVkxaZnNxMGhwRmI0bThYTDhXVzA2RUZKUTlPd081WUl6bzdlNGYzS3pa?=
 =?utf-8?B?V1NJZndqRmNGYXpDbVRxMDdRSUVQQ29ZSmxsdE5nN1F4ZFQ5Nk5DWGt3d3Ji?=
 =?utf-8?B?S1JGR1BVMGxqNWNiRDRVazI4am1sUUhzWkxqbmpGcEp2WmlxeWNZeHRyUzdC?=
 =?utf-8?B?QkswSnlBR1lVaUg5djM3Rk5KZlJCaGpuOWF2dlgrQ25Jbk81aUthM0t4R0pw?=
 =?utf-8?Q?hDpoDpN2N2GHI=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358decc7-db0e-499a-4cf4-08d8b7257aa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 18:11:27.0967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRduaxV15nOdtn/iImvUW0L+gbH+I754Oyr+qRpTWXuivJlpqbcPcmZO10DhPvuO3Nv8izQ6hHpWOwHKxCaOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1984
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 -----Original Message-----
> From: Yishai Hadas <yishaih@nvidia.com>
> Sent: Tuesday, January 12, 2021 4:49 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>; Alex Deucher <alexdeucher@gmail.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
> Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>; Yishai
> Hadas <yishaih@nvidia.com>
> Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
> 
> On 1/11/2021 7:55 PM, Xiong, Jianxin wrote:
> >> -----Original Message-----
> >> From: Alex Deucher <alexdeucher@gmail.com>
> >> Sent: Monday, January 11, 2021 9:47 AM
> >> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> >> Cc: Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky
> >> <leon@kernel.org>; linux-rdma@vger.kernel.org;
> >> dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>;
> >> Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> >> <christian.koenig@amd.com>
> >> Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
> >>
> >> On Mon, Jan 11, 2021 at 12:44 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
> >>>> -----Original Message-----
> >>>> From: Jason Gunthorpe <jgg@ziepe.ca>
> >>>> Sent: Monday, January 11, 2021 7:43 AM
> >>>> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> >>>> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
> >>>> Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> >>>> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>;
> >>>> Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> >>>> <daniel.vetter@intel.com>
> >>>> Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
> >>>>
> >>>> On Mon, Jan 11, 2021 at 03:24:18PM +0000, Xiong, Jianxin wrote:
> >>>>> Jason, will this series be able to get into 5.12?
> >>>> I was going to ask you where things are after the break?
> >>>>
> >>>> Did everyone agree the userspace stuff is OK now? Is Edward OK with
> >>>> the pyverbs changes, etc
> >>>>
> >>> There is no new comment on the both the kernel and userspace series.
> >>> I assume silence means no objection. I will ask for opinions on the userspace thread.
> >> Do you have a link to the userspace thread?
> >>
> > https://www.spinics.net/lists/linux-rdma/msg98135.html
> >
> Any reason why the 'fork' comment that was given few times wasn't not handled / answered ?
> 
> Specifically,
> 
> ibv_reg_dmabuf_mr() doesn't call ibv_dontfork_range() but ibv_dereg_mr does call its opposite API (i.e. ibv_dofork_range())
> 

Sorry, that part was missed. Strangely enough, a few of your replies didn't reach my inbox and I just found them in the web archives:  https://www.spinics.net/lists/linux-rdma/msg97973.html, and https://www.spinics.net/lists/linux-rdma/msg98133.html

I will add check to ibv_dereg_mr() to avoid calling ibv_ibv_dofork_range() for dmabuf case.

Thanks a lot for bring this up again.

Jianxin
  


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
