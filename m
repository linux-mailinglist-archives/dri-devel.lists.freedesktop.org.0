Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95A760CE13
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 15:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F273C10E3A2;
	Tue, 25 Oct 2022 13:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD4210E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 13:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666706351; x=1698242351;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+i0kFP+HUGEmHqb9gYP8s9n1zGdzHpPU0vWNmfnGYO0=;
 b=Qq6S1h9VzGl2QNwvopPtjKGtvp7fJE6kQlhXpxOC1hmLa2saEtMxlntP
 VCeufi+6ij6QHWgiT09jGMnyJSL3D1m3ED0KqN3EVMP6n6pPsg0D1Yett
 09A2/m7F9RuiRj9Eq06aGthWbvgXUFIFCcVdD+VsPGXZRZHWudRD2ksZp
 A6PrCFAlPZ+lRMIvmwXd5GDkFHygAu5R0ySpCQCpCq1IMAJocXd7ODUYg
 A6gGLpAaO09t3VACdg3r/o3gjSHe3VyEsS3kc7dtiu0LgSNNzSQl58eDT
 0z07N/tgOGmU//D35Lv6RhW0xGGLkHVW45uYo6G+sUJ8wrXKY7OALKaO0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="369743731"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="369743731"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 06:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609577906"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="609577906"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 25 Oct 2022 06:59:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 06:59:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 25 Oct 2022 06:59:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 25 Oct 2022 06:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUa/aQk+VUM/NbWRW8RIYd2amAEOnTKMRVLgqJbxA9085vX05/vHDhYRPtOy13tIMSXEWBJestatfN8S6acOouCQoLVGTAp4nAQpWcCo6trbwkXCMWY8OFpJbWHVwI1my5SVoO5+bYect7MOV7yMZJJbVJqqKKZjQLhA8GqciII3Q2Ad1/DrcQvD3MnCcGgBWbtbxfNH27kN6RSMEtwKdy6hY+C3ZsKS7whTKQvfyg2tLfNvMnmBh/c/nssym896WSQ//ahnbrcCjlO5BS8vbdnaeAJcgaTji/FEZyRSaOHBEfGgsdOMHQWE6wTBYL9LPcP9IWSl7wQEj2QR69oWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv8bRUPfIfGJ4P2Wyl62WvGoz9PF1MNcf+jjPN3lN94=;
 b=gm6Lrwuh66kBubxz2fQ78cXcvhmKGTnaaEfpUnhE6dWCWoRpHz5Yw4+TiS8jRxD/fZl3TxopIJNYp4BiwH63r7Mn658+FoHTVDDjRlWk+H0I6nlTrpkamTbAbK8V5JDg8Q5jTtOOT4GZnA3FF2gitZdzgAuMqmLwtWNeLIstDbC9cMqXp5mlsmhoAfeiSKi36QpWc3q6ODnWXCGBsG7K25MMqPLavRaychLJ84TsIeTwIj1KvXKxTpvpXjZDOc0e33K+tFeGFOfSd2QudwsLP00PIXIr1faoCCb7u8Cfv3GN6XgUKQ1LhdtBYsPX4on4VcmDWqRMXttFRUrYBzsaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.23; Tue, 25 Oct 2022 13:59:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505%6]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 13:59:06 +0000
Date: Tue, 25 Oct 2022 15:59:03 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm: remove DRM_MINOR_CONTROL
Message-ID: <20221025135903.elt6ayurfynnsy6p@nostramo>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <20221011110437.15258-2-christian.koenig@amd.com>
 <nrRxPQtWoC6aCzSuZn5fl7wccdhP9fOpc86YTIJUlck9LK2NtPTNb5QeZa_Gsl0PYpkTn5FiCcEAzsm_C-ypBEUP4jz4avyuUwJ2P6jmX3w=@emersion.fr>
 <2701312e-975b-bfca-0cb5-fcef24f32e2c@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2701312e-975b-bfca-0cb5-fcef24f32e2c@gmail.com>
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: beb00f9c-12cd-43f1-9169-08dab69114d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwrtHHFSCIi92B5MbICK1NFu/A768BX54LckBsoMvXgVIKlTv5TSyWGPnlWUYeH+PAQH7sCmvaBxLhlRPjgMw1mIDkliWrM0fz9f4d/XKAjmJtu3wh1NI/0xbxL6cFtLX1LBZ0MKEdnjE37kwNJHmfiV0/4ZLLGZSbCd4Fx4tQOq40f7UxUa+udpyJidfko+HCWkBX3PggPOSGv02hzzbBvfJwJdH85GVTahqRifKGPCOkF4WNZPGGtzEB1yLNWqZv5IjREAhvYASALRlHcVYpym24X05lhBnwsvPCxq5eh3bv7ehVmIOQGJhr+Dyl6GeyuYBjYIyPdNCEBv9gp7F8sXpLLr+zNHyKc+zUmfYrDvv+CMr4+J3K6CdZh/t/bR8tlQPCaGpxtE6NiT+z9aHFEWgvVkH2LkhMNHeOYNhyfMcrS4bRXhj8joqfn9IG51Fe6UfAZnnY3J2nvZF7Xk24RFg295H9FdplEBbNqiCB+J2Tpnypgw6mw++y8Kcwg4Xz9JeyQpxRbVyKgLOeVvNkDvgyZCzqch65ZoXPPugGytuINbJCWxSOvThYRQeUULYvYngSrZzoRnnPmKZPgVcT/wSlEc1VBdScTH5td11jyJUmjbVXiLGBuDSQ/yDOnsJtfO0a/1nDnYcUN0UVp0TIwLk8XpTigvCDqowNVq1y/26tSsPuMD+Vr0+LO0qG4fsg0mC8W5fxARAth6tHWbtLU3E07TjsBKv8miBM+9UkqljNvQhrdYMPJZ7YNJlCBktEmiij7txD4Ykt1gM0V/RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199015)(1076003)(186003)(86362001)(38100700002)(82960400001)(2906002)(41300700001)(8936002)(33716001)(54906003)(5660300002)(478600001)(966005)(26005)(6506007)(6666004)(6486002)(4326008)(8676002)(66556008)(66476007)(9686003)(316002)(6916009)(66946007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEpUSkZTVmxpL2RIWVk4MkhsNEd0ejJkRkRFMlFKSlVvakhQWk0xc0hkTENM?=
 =?utf-8?B?b08vcWxvb3h0ait6ZmY3STdsQTdGQlh1SjZ3cFVOenZoeDk0UVRydGlpOHFG?=
 =?utf-8?B?YUZib2crQk1vbXFYM2J2d0t2VC84NGgrTDBRQ05TUTZoQnNGVGM1TUsrREFC?=
 =?utf-8?B?bEpVYVNsQVhaWEoxVjhTOUxjS0JwQkFxL2dSU1VlK3ZDcERpM0lPMDBlcDdz?=
 =?utf-8?B?VVY2SHc3RWd5dG1kU3BYZzhaY05oL2k5Unl2cGJPZUZuREVjTEtlQlA1V1A0?=
 =?utf-8?B?UGJFZFlybVczYnZWcjVBWitBbXJZdWl3R1dvOExheWx2ckFvM3c4U1pieGRm?=
 =?utf-8?B?YjA1NU9Ub1AwSkxOY1ZiS1JSMlpWNWNxY3FGV0s2MWIrRGVBaWs2OFZkV2xt?=
 =?utf-8?B?dnRCWDhnaVlxM09qRVpwMmVhTkh0WERqUXFUc1ptNVhJaDBLd0wxQjIwSGlO?=
 =?utf-8?B?d3RSWUpENFF1S0dNM2ZBa3d0U0hNUXJrNnA0Y3I5RGt5UmtKSFRJWmx3Z0lj?=
 =?utf-8?B?cTZkdlN5SFFwWWNROUJnbnhlTUFTWVJ0WnY1NlNmYUhFczdVMDlMUVB1VE96?=
 =?utf-8?B?TDdob2l1SHN5cHViazlUVGUvVHlUVzhQTzZJdXVNbHNVL3MxcEwxdVQ4ckow?=
 =?utf-8?B?RFgzclRDWm1IWWRsOWVuaEUwMUJnSzIrTHhQSzhSR0k2MGwvQjBPaEZsZE9r?=
 =?utf-8?B?V0tXMkdQRkFtSGRoQVI4RmNXR2ZGVlVZRm43RTlTelBFV28rMTNzVDR1OTE0?=
 =?utf-8?B?dVZweFhGUzd3cnRXbEhlNHUyZkhyRm0yUStaVXo4WFlJQmxFSGRtdnkwQ2RD?=
 =?utf-8?B?RHhoczF3TXJKQ0JQeGlMa2cyNnNnWjlkNm11T0VHWFpLZWxvQmx4ekt3T08y?=
 =?utf-8?B?RU81MEt1MFo3TEZWUkRqUVp3RDlwOS90OTg2RHpOeHJ5aHFXazVFMWdzZEJI?=
 =?utf-8?B?c2V2VktIQlNRb2EvYm5idU9oU3FNZE5Odms5bG1nYWpybXNGVm1SbXpTV2dL?=
 =?utf-8?B?T2N0ZDVQd1ozdWI2eEtSWGNGZWlNMGFQUWJ0d0c5WnBXcW0xUHJiN0V0MHJT?=
 =?utf-8?B?TzBsLzA0dkhFQ1hYQ1R5MzY4RmVJSCtRMU9aZUNUR05uTXNJaUwrWkpqMUhU?=
 =?utf-8?B?YWxjM29ldXdmSHdESUR1K3phTXdrMXhPajQrL09uNDNMTW1sR2NlNnRMbHRW?=
 =?utf-8?B?SXhnS3ZxU0dqaTBmTnk5SjN4NGl1dU55NTlicXNNbytqSzhtZ1ZyUmZtTVFQ?=
 =?utf-8?B?MnNpOXJ1NU91dEhGZ3VBbU9NQ0o0d2FValRLQ05vd1R4MUh1YzFRV0swVVZL?=
 =?utf-8?B?RVVSeVdMNFFZT2gvZzluR2ZiYW9CT25XQXVYd2JDN28xajZEZG1rTi9DYVhW?=
 =?utf-8?B?Y3c1THp4SHJEdEZlVE0rUHRwQlB0SFdJYUFzbmFEN0lMK2FLSHh6b1lqS1da?=
 =?utf-8?B?VGt3Y2FRS2pONkJ1WWo5YVpVYWU0dXRJUDlYd29RaDdPSWxVbysrMXN5QTlj?=
 =?utf-8?B?Vmc0T1puZWxkNnN1UWlIZG9xdHFiWHlxaTRnL1hoYlNvQW5CTGY2UldqdnVK?=
 =?utf-8?B?ejlyV28zb0FEQURWRzBuUk45dmZ6ZVRUVitzRzFHUXRlL0dvVGlialpWWW0v?=
 =?utf-8?B?RkcxWURSVnhMaHBicFJsSmFtQVlEV2RzNHZ3Q0F3Q1ZMRzRXT3N0U2I2SWZR?=
 =?utf-8?B?SWNDaWxTdVl3QW5EbUEvb3NpNXFYVXhZZTZEeGE2RTJYam1LMHV3SENsaDZs?=
 =?utf-8?B?bmxIZVBMZ1QwUlZTUEw5Zy9ibnZjUE5vY1FJbTNTMzZmUEZIQjZYbHhYS2hL?=
 =?utf-8?B?ZXhqZUkzT2crd1FvY1ZEbVlFTm1lV3hlUHZQTHhscHhIMUhOVmpnalo1am5C?=
 =?utf-8?B?VzFrU2RoYS9QNWNSK0ljc3VwN0tpNi9iOGJFWEVxTzhRaVRUNlFrVkUyZjNH?=
 =?utf-8?B?V1lmTzU3OTA5MEc3aXRLMHFkbW9EYW1QUzFTaU5jdkNUazZEcnJSVjQ1L3RR?=
 =?utf-8?B?bEtKUnhHTHdpd0hyL05hcUZaUWRHdnBRWDc5WDFhNy82ZjlXdlFvSFlpMHU5?=
 =?utf-8?B?TVNwYm1TTmRoY2F0Q1ljRWIrbXAxd0lMOWw1dkFWeUhhbisyY0RhWVRPRitw?=
 =?utf-8?B?eCtINUJsaWVKaUN0bEd5V3V1RkRGbVYzZ25pa0ZSSkxDakpFTHR1ZFVRWStG?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beb00f9c-12cd-43f1-9169-08dab69114d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 13:59:06.5746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hw7yej3J7TmsRCxUFyp0/4ZYWDJbFU2mujMpocawWW9uLwp3EWajp2jTFOAywbnlxAWo6a/mMf1wVlVyrGnxKexrGbsu7lwWKURHhPvOsvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
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
Cc: airlied@linux.ie, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 01:55:01PM +0200, Christian König wrote:
> Am 11.10.22 um 13:39 schrieb Simon Ser:
> > On Tuesday, October 11th, 2022 at 13:04, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
> > 
> > > --- a/include/drm/drm_file.h
> > > +++ b/include/drm/drm_file.h
> > > @@ -54,7 +54,6 @@ struct file;
> > >    */
> > >   enum drm_minor_type {
> > >   	DRM_MINOR_PRIMARY,
> > > -	DRM_MINOR_CONTROL,
> > >   	DRM_MINOR_RENDER,
> > >   };
> > This makes me uncomfortable: this enum no longer matches DRM_NODE_* in
> > libdrm.
> 
> Ah! There it was! I was remembering in the back of my head that we had
> somehow used this in libdrm as well, but couldn't really get where exactly.
> 
> But I don't really see a problem here. The control nodes are identified by
> name and we don't expose them for quite some time now without any negative
> impact.
> 
> Even the minor number distribution stays the same. So what bad can come from
> this?
> 
> Thanks,
> Christian.
> 

I proposed something similar in:
https://lore.kernel.org/dri-devel/20220817230600.272790-1-michal.winiarski@intel.com/
except acompanied by expanding the minor pool to accomodate more than
128 devices:

And after receiving similar feedback, that eventually evolved into
leaving the "legacy minors" alone, and changing the rules only for cases
where we have more than 64 devices  (when we run out of the "legacy
minors").

Perhaps something like this:
https://lore.kernel.org/dri-devel/20220911211443.581481-1-michal.winiarski@intel.com/
Would work for your usecase as well?

-Michał
