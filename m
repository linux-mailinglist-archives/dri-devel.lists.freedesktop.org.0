Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D233A5F0743
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 11:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FF510EBBF;
	Fri, 30 Sep 2022 09:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021C110EBBF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664529124; x=1696065124;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5hZP9qXbcABUjTqHIX+oevqHdfGQtOmLcskGCyBQtoM=;
 b=lXGPgJb+CtNVdWSVJzV+b3b0ppoguQpFs+9bpdgu66JIUbp2FCkimYxq
 wBof9kzGUJ4cY5c/krk+dnjg5+ozl6TA9HS0sR13bR1iiOsW4yR0ML36t
 uN+B0u0ehaDwGZ4P1tLJO9bo/uiy1vy5vjxEzdgo7rXYUjgeR6vMlAKP2
 gu7BXsc7RtFZ/GXaB/Ovv9A3MCf1Yb4pDp78J65waWVzuRYJrgbK1AwT+
 TEanOTux5ShCg/R/k/bg77I3DLuGLZpU6FvhR2FZquzivvpPNpbYazoCu
 Pam2hyYi+e8lsSZ3U2qAiektZs0Fzgs5/dvyXTsfs/2MuxkjN03oI91Mf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="289309893"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="289309893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 02:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="653471037"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="653471037"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 30 Sep 2022 02:12:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 02:12:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 02:12:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 02:12:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 02:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n446TuqPPeylk5NEOfLjyfXuV9ZemPjCgjekUqraIPy7Z5Z9b4dLtENBBjt1Ry+F7mxK9+3EHWC0XCroqWp+WGIA6utyu5xHgcFY/Vx4qt+TexdBQDhfEr7BuFImiGwp62d+SajUas4Zc01WeWqXlHWVv/98Mq8YNLvKlNSn3ZtYs9nT0g5Z1uQUQ8lwUnn5DNLyeWBVkFJYgaTec0Pw13W58RTcgiCRThjwpJE0PP3uIicIZBs+k226apK9f31tTpiJEY6WeyyMWFoRhvw3It2GwvcqXBxnaztIt7PV4yD/J02SpF7JIZyY1xggDlMjRXK7c1cs4WNJHOvnud1QTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lwbqmrEnDRk3tlBKoMYhMiLG1yEHR3+Z5uUoaqtPa8=;
 b=oXJF7jPJzWKTRDtdsDsAfLJe2I+/oSzXorC8PaN0mkB+gFKfp+Jg1qZi/rQ4Z2G0jluvx9k6RDRmEhlVPBvoZduAVLCRe8lJtIB1X6+on7rOxr7UnmMscN3ns8jvHXIauntNduFN17+sefRzktdVayVKQ5CRBS7U4PmhRM9NYWjJKVPU+sufBIBqofYcT2Bs5H8nZ1Z5aaXisv3JRNZMEams9zOVKE+D08WaUEnTfbRYTPvAaoASy6VaHufDuvBqLEGG3VQg+TpE/fFvfOVmYnLUVOQbBpWnzO+I4i4vg6z/nyvAVQollTBlEFkJ0XgNaiOGWfZaeEVpi6en0f46yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Fri, 30 Sep 2022 09:12:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 09:12:00 +0000
Date: Fri, 30 Sep 2022 11:11:56 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 2/2] drm/tests: Split
 drm_test_dp_mst_sideband_msg_req_decode into parameterized tests
Message-ID: <20220930091156.zt7w74g5axfozlts@nostramo>
References: <20220927221206.55930-1-mcanal@igalia.com>
 <20220927221206.55930-2-mcanal@igalia.com>
 <20220929223333.vh6wy45mfx6kccds@nostramo>
 <CABVgOSkx7KYNRKCN5h=37zQGR0qu+BDCb6cQeqbCwX8UxC3knw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABVgOSkx7KYNRKCN5h=37zQGR0qu+BDCb6cQeqbCwX8UxC3knw@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 79810f82-fc74-4386-82d4-08daa2c3d504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3HX41MoeGwI9QkcsQIobBZvilZ3TC3dGniDFIY69RiWt+sj9Ttt+v5xR3J10oVaj7ugqeyMO+fya2LyemI5cqofESUcIGrg3hex8WiML2kMSM3mq1KEw0v6ttZfUcbPoyuf/gXF7iLJRZxQ8XvVhg1pymUO0ShVtAqqJWirmGhoxk1mjJ53xxh4FGmMxbGJ/gS4aG7jZEuDJxW7rJLbnpXHyUu6Z5wmKefwZUurfbOuKZjCuww8dAFhq9eicDbp5gt/h8N7c30W9GxhVP1F2XDQr5RdYNseg/+xyzKUscYQxcv7fJEddMLFW2p9WQhzj9l/dlDohItjZsQsTiL/8W7kX4HgAjC+3KUMvLZLdMYDei04Xgaic8Fz2FYVOBKjM0D6rFDmJi1QujbbxNST830LMKYmpxKrUXeFgbsy/XXRRMUlP8+gxHDGwaTuC4+8BMyokCPI/3Flf/HT+QdbIh74fi4e8zSw5K2hJfcyl4jOw76qgWe0YibTFKSfA6xywQQC2j+2T2rOnmEg17NIxe98ehWoRQ5r5rgXjT5XqhtNZbihsSbT9tQcql6hVV+jc1kIG3zYvZLfHGasUs2/HA8x3ppDe81wnXa9QmT+hoe13ukd2TCYfTHA2+bOe0IWLGrnr2Mqoza1miY6bYPSPIQSKRo3C9nXEyHLZ4TOfRNlxyX3vYAzENiEwKhy92iEWZ1yRP4V9mkcYQgGwyo09igtIIlXZTN/0CU4ad1xmtDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199015)(6512007)(9686003)(26005)(6486002)(966005)(33716001)(38100700002)(478600001)(316002)(86362001)(41300700001)(8936002)(6916009)(6666004)(7416002)(54906003)(2906002)(6506007)(53546011)(8676002)(83380400001)(5660300002)(66574015)(1076003)(186003)(4326008)(66946007)(82960400001)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE90NWN0enpadDdPaFhZUnBpT2s1UHZtcEg5aWEwbHVTK3NQeEpadGg1c0li?=
 =?utf-8?B?WkhQVDM1TVo0QnFSWjVsNmVBYlk3YSt4dy9STnMyQVBwVmk5SHo0OE43aFlQ?=
 =?utf-8?B?eUJGZFZ5cm5IdVF1bjVHMkVQZkJaZnpJbFdxOWZDNG9xNXpYckRKWG5SZ0kx?=
 =?utf-8?B?YjRXZWQzQlFGcXhObUllYXp4dzMwU091Tk1TdVczUTRPTlBnckUxUzNad3dB?=
 =?utf-8?B?TWdkU2ZFWUZGTHgxUVk4c0Q4RGFRVllRcmFOYjBTaTRWMzZ3ejNNcHd2dkNH?=
 =?utf-8?B?MlY1dHI4OVF4N0VFMWQ1UkNUUU16RDJxeWN4L2tiSERiOFZuYUR3b3J5b2VT?=
 =?utf-8?B?ZzhZRVFwQ3NhZnpnRjl5cEovUXVvYlpPR241Mk9rdzZRSFFxdGpndFN4Z1lJ?=
 =?utf-8?B?R0hkaEppYXg5blBtRjN0VXBYUVV1dlA4bXpvTVpvTWswMFF4Wkp6NFZxZHVs?=
 =?utf-8?B?dnliSW9KM2lCcHJLS2k3TUpsdTRYc296Um40UHZBMWRoZi9lQWpQdEgrRU5j?=
 =?utf-8?B?QndsR2JhYVVXaUNwWnVocDV0aWtRa0VKMGVCNEhJd0luOVllZm5TR2pJck1h?=
 =?utf-8?B?a3lGKzVlZld3WTdjeFRUcmxOT1ZwU3dVa2FVVUZwU0ZZZEpzYU5xeVVaelEr?=
 =?utf-8?B?bTV2QXFtUm5Rdmd3MEwvVm1zMFBjNzd0WC93S0ZkSHU0dHNCMjJMTk5hM3NC?=
 =?utf-8?B?eDZlL1JucU5xU2FsSk1CRnM5am5xa1VpTHBFUWlwRXhJK3dJbkhKQzl5R2dl?=
 =?utf-8?B?Q3RrT1g1OXBETy9xT2VLeDcvRkxianZDMTAzWGU2bFVDQm5WR0wyTUtLK052?=
 =?utf-8?B?SkFBTElKM0NJc2JneS8xN2h6M2NObXV1YUVVWkdENFdaN0ttT1VTVllXUVFJ?=
 =?utf-8?B?Vm8vYVFaeVR4ZDM2YWxVWmkzdy9UanZ4bnZSRmxMMVVEWS9GblF1aVBweVZw?=
 =?utf-8?B?Qk0zQkUzMCtIQUhLc2drdDQ0MFdaY2xDTTVwMHQreE1zcHZ0Ky8rajRwU2tB?=
 =?utf-8?B?U3pFWnhOU3hjVWpxKzNCWkFjWWd2VmhUcEdtNmdLR1p2REgyOGE5WWloV0dn?=
 =?utf-8?B?UFp2NlU4MVRTRXpFbFFyajdmem4yOU9sYXNUaWdtMG5WMjVENzJPMGZqOEVh?=
 =?utf-8?B?RWxLcC9qdjY4aGpXQmozU3kyNjV2UXdDWW1HVG13SWJwekpvT01CYjczRlN3?=
 =?utf-8?B?bE1ETFd4ZzMyWGpGamdEYVYxdkdkMC9yODNhU0xuamN0YXduNjUzdGx0TUgr?=
 =?utf-8?B?dVpnbkdETFZ3ZS9EK0dtZ0NHYXNKdCtQYUxHdk5vVGw2bEtLUDVlV0QxWncv?=
 =?utf-8?B?blpMTHZDeDhma2pSRWp2eXNNanoyOGRsSDJqcitnWlRKNUx0QlpPOEkwdkhI?=
 =?utf-8?B?cGNXb1JaYlRydHNDMThNZWp6MnlSaklYM0xobFBPWDQ2ZnplcFZZeUEwM25y?=
 =?utf-8?B?eXEyNkorRTU2RzJrQytLaVVSRWplNUwzd3Q4cmM2NFBXaWFzME0rbUJvTkVw?=
 =?utf-8?B?VjUyVDNDR21jRGdRVzJTUHlTM2QvYmVwNGdWOFFWRDRzcXFXUUR5VVZHTytn?=
 =?utf-8?B?ejF6NkJqcndjVzdVQThINGNmMGczVkhwcVB1NDVsZC9POGgxUUhGUEsxSjZk?=
 =?utf-8?B?Z1lreVRtam9LYXdlUzVXOE9KTmdxR3N1MjlhQzNGLzB3dEdtQzhsa0g4WVdF?=
 =?utf-8?B?VVFKckVoZ1pkcHVPL3JWbzR3T1oxTTlDMVBqd01xSWVJaTFMaWRJYWVCaW4x?=
 =?utf-8?B?akg2YUdWeUJjYXJrNXZHTy9PR2RJb1NrVEI5cUpkdEE5RGY1NkdseU9oalpi?=
 =?utf-8?B?TGcxVndFaDdORUtwT3B3S0pwVlBDNy9Da2c5dncwS0txb1QyNG1FV25xTlRi?=
 =?utf-8?B?RVh2UVhPc2VoVk9nR2ZJZkRhVkl0N2xYYUVoZG53ZEdJV0lhMUhLVnZTd2pi?=
 =?utf-8?B?M2V6TnBOcUhwc0FXaWxTTzA5SVhOM0pNMXJTajl4MlBwRXlqOXRpR08zTVVn?=
 =?utf-8?B?MTV6bWJRaUVTUHkxWmJydWw3Mm9uVmlUakxSK0l5SFNwRnZ4T214RUFaU2xQ?=
 =?utf-8?B?S2NUZEtObi8zYll4ZkRFbTkwUEdsa21tVjNWR1FTM1hKUmRzMFJ3dVR3dlhW?=
 =?utf-8?B?ZVpqR0xvMTBWL1ovTVpENCtRamFvR2hoWW45RTRpd2ZXamduVU84QlppRDVm?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79810f82-fc74-4386-82d4-08daa2c3d504
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 09:12:00.5636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0+Gx4P/cBHHvXz42uY6FcpRw6Af0kN+UOsySvBOhZXzM7B8LDUGNgOE/3lhtjY61Gm5HMCAKDWezD3wDs9LauufH5YYNqxpbs9H/flZZy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Arthur Grillo <arthur.grillo@usp.br>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, Tales Aparecida <tales.aparecida@gmail.com>,
 Daniel Latypov <dlatypov@google.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Isabella Basso <isabbasso@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 02:50:43PM +0800, David Gow wrote:
> On Fri, Sep 30, 2022 at 6:33 AM Michał Winiarski
> <michal.winiarski@intel.com> wrote:
> >
> > On Tue, Sep 27, 2022 at 07:12:06PM -0300, Maíra Canal wrote:
> > > The drm_test_dp_mst_sideband_msg_req_decode repeats the same test
> > > structure with different parameters. This could be better represented
> > > by parameterized tests, provided by KUnit.
> > >
> > > In order to convert the tests to parameterized tests, the test case for
> > > the client ID was changed: instead of using get_random_bytes to generate
> > > the client ID, the client ID is now hardcoded in the test case.
> >
> > Generally "random" usage is not incompatible with parameterized tests, we can
> > create parameterized tests that use random data.
> > The idea is to pass a function that generates the actual param (where we have a
> > pointer to function as one of the members in "params" struct).
> >
> > For example, see "random_dp_query_enc_client_id" usage here:
> > https://lore.kernel.org/dri-devel/20220117232259.180459-7-michal.winiarski@intel.com/
> >
> > In this case, we just compare data going in with data going out (and the data
> > itself is not transformed in any way), so it doesn't really matter for coverage
> > and we can hardcode.
> >
> > -Michał
> 
> FWIW, while the uses of randomness in DRM tests so far haven't
> concerned me much, I think we'll eventually want to have some way of
> ensuring the inputs to tests are deterministic.
> 
> My thoughts are that (at some point) we'll add a kunit_random()
> function or similar, which will use a pseudorandom number generator
> which can be set to a deterministic seed before each test case. That
> way, there'd be a way to reproduce an error easily if it occurred. (Of
> course, there'd be a way of setting different or random seeds to
> preserve the extra coverage you'd otherwise get.)

That's exactly what DRM tests do (well... most DRM tests, this one being the
exception, and those other tests also seem to have lost a printk with seed value
after being refactored into kunit).
See the usage of DRM_RND_STATE in drm_mm_test and drm_buddy_test.
Having kunit_random() would definitely be useful and let us remove bunch of
boilerplate from the tests, but it doesn't prevent using reproducible random
data in existing tests.

> I don't think this is something worth holding up or changing existing
> tests at the moment, but having tests behave deterministically is
> definitely desirable, so +1 to avoiding get_random_bytes() if it's not
> giving you any real benefit.

Yeah - all I was refering to in my previous message was the wording of the
commit message. We're just removing it because it is desirable in this
particular case, not because of the fact that the test is now parameterized and
that's somehow preventing get_random_bytes() usage.

-Michał

> We've also had a few requests in the past for being able to pass in a
> custom set of parameters from userspace, which opens up some other
> interesting possibilities, though it's not a priority at the moment.
> 
> Cheers,
> -- David


