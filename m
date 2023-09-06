Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A490D794298
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D354A10E6C8;
	Wed,  6 Sep 2023 17:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426010E6C8;
 Wed,  6 Sep 2023 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694023195; x=1725559195;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=03o9BFKcdGgBsPRXwyJElmFJfqn8AG6wxzL7vdi2bsI=;
 b=Gc1u4l/8grLyOm3ToiD8Lotc8LSuoA1gY1El61dVaG2fkWMhURFLlw/D
 0HCBQXS0slFmzMp1WY9b8XsHWS0w6xy+W511xggyfSefSkEdS4vaIQa6e
 QStmluJpsaAZNa1gfA+YMbKuGyoVwdidkEVtkwecY58wTaaENxmOxXQo6
 2HJkUbcB6xsQ0v2qqr+XY4v962zIiSRLKxBjIoMcMu+Tz8V6L28JPEzDE
 2tGgNDfyWxvx2SaASctuYieTSXQf6rSiTLVPi3UHmCuqUz0+r5bcIUCh8
 /qILJ7N2khiw/FqjD+3ReJQzElfIwEipGAx6XHGbK/0xDKU12K8oKW32O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408147961"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="408147961"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 10:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="776709815"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="776709815"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 10:57:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 10:57:26 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 10:57:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 10:57:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 10:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GES1I7qhfoYONYE4DbUZk8edBl2t9LPrVODo6EMortUcpTC6z5v9ZG/g9/kxEsxfZTuFtbnyTzB+b7y8h3ErRq/se3jwe+44udvJ0xL54P5nZ0f/URoXjpQqDsslylMSWpP4meo94PONmk5Y945i8Ko07MIE8KISVeAV5F3h1PGw8QN5uqxff+OlmYEnKzXMVv2t95ZdFTMJmANMPCcKbTJesToasLH0PRUyX4mv/ocI31Q8ssvRMg2Fp+hIwNDfYaPH5znGV4FTGxX6sO9brxQ9j5G2qUOh5iWtdBtFn4MzGHwGWcuE0IkU6p6SV1iPbYoPmj+XGoKkHoSEgP5QRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X4s2Bx8Mdguov+5QuGEqoA6cH6SOIQ2ZVzltYDVSHE=;
 b=ogW7+M2ZFl6LfhGuTss3BiVRsfAZOm67MH0e7VFCAwP5SCgZiVZmcfRr8UCY8C6sN/kmycWxcqfn2KcAlynKjlckJQ5HIV7if/75uphb5FSZLe+NvZzsIdaaDI8Q8N5BwBuVG24h0WHDOMLiuK7yzTAuL7Lj7XkQ9noK6+XXbW1t5NvgRH53u1d7n3XqS8tSM2YDfofmGywUjS+kjtHPlg9BCHARmP7CR4i9C8G3eGjkohSGhputzk7Y+tG6GHMi8f11lQ6xUQEsBVNmsfgmAmu3yzxBVM+HWpgcIja/0MXMX+DS5KEXPY3BVcMFaC68+DZaznlT3P57lOSED7Mvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 17:57:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 17:57:19 +0000
Date: Wed, 6 Sep 2023 13:57:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 3/4] drm/doc/rfc: Mark DRM_VM_BIND as complete.
Message-ID: <ZPi9e23qxScmLEPC@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-3-rodrigo.vivi@intel.com>
 <ZPDlqqBghH3FE4HE@intel.com>
 <8d38c7a4-03de-a9ed-13a2-3044352392e9@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d38c7a4-03de-a9ed-13a2-3044352392e9@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 789ca882-8e58-4a4b-8c6f-08dbaf02b670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dP5kKFxUc2jpD/Onu2JVSETzBdN0QC8GtJfRXFc2GUe1KwfddTlFAExo9Jt78FHYKRBxDgSpVPGhAA9lFe6wwi8esMtdAhhNAf+LkPQ2x/5HScNogkmGlEf1F/3t0ItWZT0ULgqnWdwhB96GVpdPxeHoAl1T4Vl2U6wtpGNALTT/60nZwt/s4d+eOrp43bJ1jhCSeNgoZcralQazkRxFco/FA0j8h+u9vzMp8TTVxk9Da5Jpb2NxcepoNOaDN3hhJCia7PaFxDHJIl3J3ZEN8xGC4N9cA1MkoPTVUvnZkSqoyxBpS9U/Ydbbo/ZMx0lUQLUN2dal1I3biZ2JHAtvmGm5vyPHZ0bUUWUHaKKSqMbLndym3jAC1vzD8vcg8oKEKZ+4LQZFZVOZMx/jCHu7J8fgmyJ5Jmc+X3ahQxdNXIKMMgSpSMMbyZ41OgPjXuD9Zt28/8e+J5p+nbrzPJayWXVSFDLHm6aqyBrJFZ1bvzOGuVAzfaz3YnfWo6cBxvYm6ClbdOb7AANibz9AMByLtAOjsZsD9gVxF5X0pPwIEko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(1800799009)(186009)(451199024)(41300700001)(53546011)(82960400001)(38100700002)(86362001)(6666004)(83380400001)(2616005)(966005)(478600001)(6512007)(6506007)(6486002)(26005)(66476007)(66556008)(36756003)(6916009)(2906002)(316002)(66946007)(5660300002)(8936002)(44832011)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEIvd08wRXhxUFd4aWpMdlJUcFNMZHp4WkMzTXpEalJ5N1ByQ011UHFyRUFu?=
 =?utf-8?B?cFpFMHV3N2xET01Qcis3bnBkaTc3UERFdUZkYmhva1A1QW8rMXhmZ0ttanBI?=
 =?utf-8?B?a0ZKZVI1Y2lSK2RkU2pMdy9CelRIYVVHNzFIZ04wbDFueTIxYlVzeFBUMVl6?=
 =?utf-8?B?cEowRmUweGc3UDB3cnQ1N3RxcllRZlBTclR4NVZLbEFHazdxbXh3RnFxeEJq?=
 =?utf-8?B?ajdPcms3QWl2K0szSkVVU1FBYzBPdDVoVW4zeElGUnhrL1BrK0NFbmZvRjdZ?=
 =?utf-8?B?UDN0dmhmR2xPZHZnS1NYMENJd2swUXcxa1hwOFpEVyswY29VbWd0eTNGaDE3?=
 =?utf-8?B?MFJXMGtkaEdQTFBvQjdtWUQ4ZUQvL2lhM09pN0JsbEgzNnQyaU1IY3dzdnI2?=
 =?utf-8?B?WTEydHg4cmIvcXZJWjh0SFNiWVh5NlNPa0NFN2g3TFBPeGxBZy9Tc1hJdU84?=
 =?utf-8?B?RFBVZ0VlS0lCMXQyRS9ZOXN5TnBJcnE5enlMb25zM1UyUHE1TFQ0aXVBN0gz?=
 =?utf-8?B?bmw2ZzB2N3g0cXJHckFCK1pVV0QwenB2MUxwd1JCV2dEUm5ZZU93eHBtT0Fj?=
 =?utf-8?B?MEthTm5FbUN3NGZaaVZCRVhBNFlIVlNKYkN3WnZoTHBBUklwS2FOTVdBNjlB?=
 =?utf-8?B?dDNnWEhjUlhYa3ZaNm9lTHpJRlJrLy93UHE5Zk9qQmZ5SnVZSDBueWsvWTVT?=
 =?utf-8?B?dHNUNkJLY3pVSUZaMHNZeUVjdzZhZWpzNzNOVXZ5N09NTzFkajErV29QRGIv?=
 =?utf-8?B?VDd0UXIrMUhVazB3bk1xUUdxSlhLbzB5eVFFUmhCZWtuMUQxczVnS3piWmEw?=
 =?utf-8?B?VFF2WWlPT1JielVha2VFaER1YzRLK0E5SU5pcVBkZ3d3aGZJT0V4TTBLcmlW?=
 =?utf-8?B?cGJEQitXNUs4S25vU0FWMExjRVhZdXNhYVN5RXVQY25WZll3Y0R6Rktubko3?=
 =?utf-8?B?Q28zQmppb3RLZGxkeWZGTUFhSzlCMkQ3dVZzZWlXWTNYLzc0ZnRrditEMUU5?=
 =?utf-8?B?SzN3T0lxQzBlVWwxSjF1cXFnWk4yczlEakRFbjI5cnZxUWNCdXczQlpLQkY4?=
 =?utf-8?B?N3Q4Nk9rRW9POXFzRktVbGVMWjZualRqV1pwdElEM2l4Z1V5a2I4KzBpZUtY?=
 =?utf-8?B?eE1kb1VXK0NwaUZ6a1lINjZzd0NLd0htOGxHdWJ5ajBJVkhDSGx2MVp6akdh?=
 =?utf-8?B?VHdjZllzeXRDV3p1Y09STHpxTzJ0TC9VbXg3MFgvSGVyd1ZEYmhYQVlITXhl?=
 =?utf-8?B?dmJDUDlEOWRMUjR6V1Ura1lzQzFoZGRUWHpQNnN5VE1BQjhoS2Q4U0FjVHBT?=
 =?utf-8?B?RTIwTzBpS2RNalVWZHlPa3c2UmRidEpGdnhxOFJPeTh3SnNBQzBSclc4Qlcv?=
 =?utf-8?B?aG9zVUVTTmN5azc1amhjMGw0MFNQeXAzQVNTZFdFWXFZVkFIRE9ndUZXMTJj?=
 =?utf-8?B?b3VqVTlDR2lKc0ZyQVB2UnY3NUorU3phK0hpYUlUWDcxV0NRMlhiVm90OG5U?=
 =?utf-8?B?OXVRS0YxTnFrNUtXQUF1MExiRHNzM0M2L3Q1ODJuSUorY0g1Zk1mbzROQ051?=
 =?utf-8?B?d1YrcHp4RG9WSmFlVmVxRTNqbTNxYTJqSHFvZFE0Q3ROKzB1K3VBNmduSnNF?=
 =?utf-8?B?L1QwRkxwVkxWNjhhcytjbkVxaFUzQ2dTTDVDaUxxTWJTLzdwaTJEUTd2ZjBZ?=
 =?utf-8?B?T3RFN29NU2V0d0FZTlF3VTBJMThzejJiNkpHRHVaRzhGa2R3d1hUYnR2OU1U?=
 =?utf-8?B?cUZFZ1dZOUlpKzJsUXljd0FoeHo5MWgvcllDSlpvQjd0SW5mUUxOM2QyQnlP?=
 =?utf-8?B?WkkvbFM1bUVQTVcrRllPTnhRQzl1T2xwTDh6REx6OW9uaFNWQ3Z0OWVFSzNU?=
 =?utf-8?B?UVVQbE1IOVpnYmNxOUNYdXpBWHF5WTdIN0VCckZUNFErN3VlNHFBQmdJcTcr?=
 =?utf-8?B?bGJQa0NYUGVNam9xL01iaGdTeEdVMlJZUUR2NWlyRWN0ZFZ3TGRRbzJkTmVs?=
 =?utf-8?B?dEdsYm9nbElEZ3FDU3RXMnVaWHJkVGt0bEk0Rys4UXBXV01MS1FHU0J5eWd2?=
 =?utf-8?B?Smg5eDU5ZElLWHdzd0hXaFgzaUN3RjRZdHAzcFhPVDFaOEg3UHgwS2wvcEJt?=
 =?utf-8?B?Mm5MM3hLL3h0djZwcTJrWVlSalpEeTdhQTdXWnRrVEFNRUx2UGdkRWN5U2Jn?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 789ca882-8e58-4a4b-8c6f-08dbaf02b670
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 17:57:19.1326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K78de6SGnGy0JJSa8sL00bBz2+a86utaHt638VQ+e63BcebvqMi3scZCxBJdVZ6RtNMt5Qdk39Ay6rd6kjqgxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 11:32:30PM +0200, Danilo Krummrich wrote:
> Hi Rodrigo,
> 
> On 8/31/23 21:10, Rodrigo Vivi wrote:
> > On Tue, Aug 29, 2023 at 12:30:03PM -0400, Rodrigo Vivi wrote:
> > > The consensus is for individual drivers VM_BIND uapis with
> > > the GPUVA helpers that are already implemented and merged
> > > upstream.
> > > 
> > > The merged GPUVA documentation also establish some overall
> > > rules for the locking to be followed by the drivers.
> > 
> > Danilo, do you agree with this?
> > if nothing is missing on that front, could you please ack this patch?
> 
> I agree with the above, hence:
> 
> Acked-by: Danilo Krummrich <dakr@redhat.com>
> 
> However, the documentation below seems to be more about a common DRM_VM_BIND IOCTL?
> I guess your commit refers to the end where it talks about common VM_BIND helpers.

Yes, it was about a common vm_bind helpers. But if the consensus is to go with
the individual drivers vm_bind uapis with common gpu_va, this common drm_vm_bind
talk makes no sense anymore. So we can end the talks about it.

> 
> Otherwise the patch is moving the "DRM_VM_BIND" paragraph somewhere below the
> "Dev_coredump"paragraph. Is there some kind of "Done-Section" I'm missing?

Yes, it moves to a new
+Xe – Pre-Merge Goals - Completed
+================================

added on patch 2 with devcoredump:

https://lore.kernel.org/all/20230829163005.54067-2-rodrigo.vivi@intel.com/


> 
> - Danilo
> 
> > 
> > > 
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   Documentation/gpu/rfc/xe.rst | 34 +++++++++++++++++-----------------
> > >   1 file changed, 17 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> > > index bf60c5c82d0e..a115526c03e0 100644
> > > --- a/Documentation/gpu/rfc/xe.rst
> > > +++ b/Documentation/gpu/rfc/xe.rst
> > > @@ -106,23 +106,6 @@ our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
> > >   related patch should be independent and present on dri-devel or acked by
> > >   maintainers to go along with the first Xe pull request towards drm-next.
> > > -DRM_VM_BIND
> > > ------------
> > > -Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
> > > -fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
> > > -development of a common new drm_infrastructure. However, the Xe team needs to
> > > -engage with the community to explore the options of a common API.
> > > -
> > > -As a key measurable result, the DRM_VM_BIND needs to be documented in this file
> > > -below, or this entire block deleted if the consensus is for independent drivers
> > > -vm_bind ioctls.
> > > -
> > > -Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > > -Xe merged, it is mandatory to enforce the overall locking scheme for all major
> > > -structs and list (so vm and vma). So, a consensus is needed, and possibly some
> > > -common helpers. If helpers are needed, they should be also documented in this
> > > -document.
> > > -
> > >   ASYNC VM_BIND
> > >   -------------
> > >   Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > > @@ -230,3 +213,20 @@ Later, when we are in-tree, the goal is to collaborate with devcoredump
> > >   infrastructure with overall possible improvements, like multiple file support
> > >   for better organization of the dumps, snapshot support, dmesg extra print,
> > >   and whatever may make sense and help the overall infrastructure.
> > > +
> > > +DRM_VM_BIND
> > > +-----------
> > > +Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
> > > +fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
> > > +development of a common new drm_infrastructure. However, the Xe team needs to
> > > +engage with the community to explore the options of a common API.
> > > +
> > > +As a key measurable result, the DRM_VM_BIND needs to be documented in this file
> > > +below, or this entire block deleted if the consensus is for independent drivers
> > > +vm_bind ioctls.
> > > +
> > > +Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > > +Xe merged, it is mandatory to enforce the overall locking scheme for all major
> > > +structs and list (so vm and vma). So, a consensus is needed, and possibly some
> > > +common helpers. If helpers are needed, they should be also documented in this
> > > +document.
> > > -- 
> > > 2.41.0
> > > 
> > 
> 
