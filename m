Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9A665723
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 10:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36F510E515;
	Wed, 11 Jan 2023 09:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D5710E515;
 Wed, 11 Jan 2023 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673428593; x=1704964593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zw8EkiRvWwwwSRzchdwosq1mkWn2sRJgoQAbCX8Vav4=;
 b=lilW60+T16Cyn98EWkc2lDP6aZjVFJCJhoy6pjY/PR+BLldCHCZ4+0UI
 3GeJlDoUjV4fGNrupRzkOYvip1t0jSzKmzGKuSVkdO6IoN2abo92n6WYr
 RG99qHhCRyPEbz3W1/XSoSdZxYXc23DnFSEImGOgo8hOTEc7OFVcYW863
 u0PSE39eY/roufV4o8SOj4ar1PbK93LJKhRLHkdXspQcZJHkttpsfEweG
 NxN/pzTTCAYpYwo9flCTMDoDpoq+8jjW1Gu4Sl3AX9t7d2uCado2GSlJI
 MH4DvyU1MxTZvDjHsNXmpb/x4Unmdq7Nb8cIugQd6XtS0z2KJSAep3obA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409608325"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="409608325"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 01:16:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986089597"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="986089597"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 01:16:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 01:16:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 01:16:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 01:16:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 01:16:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCiEMcdV5+Mxwm2GTxdtNFcTvdIH2W+fM6yCzQjoZXw60H7C4ca0lpxwi8bbJobflVlsVcNIcbSAanxFQm4QgibZf5D2cd6x9mEEuZOe1AOTfWPa6SOvJ9TpjEFirht/TMxR4MvCKmoSbEomB5z6OmV7dvelmzVFtp31/FE6VenMryWm/d7D8Xa3xPbWMDvYa8SHkQ0wL9GEwu4LrEbNPQNcsxEK+mcLMKftJaPy0ZZvSrKNrRp8quDTbVg6k21vsUbSS2nA227914Biqp801rqKW56RKN+F/RTcaUaRKIUgpNdLzWzSDEujA/G5sQpvjZco5REaEVI0bPP70ChtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+30t3D3crbD7rWV4QG1r0COhow3rCUiLEsvAfY2STY=;
 b=MQvakxLCRWnMCxg0IFaWlpL/xSS4sQGcdDkuk/cbye52wbdvXPijNTp8hg+zO7MuPbOTLSBObsslzRkAWkNAMfC5hmT1qM6EdrwktltYUkcxM/ZSkuS4m447xAihM4fCx/+HpKfnAcvhenYpH+/tWceB5Uc/4JfW8qmb2m3Ab+Ang4Gl/1ZQ3OH+26XHtCmLzZmYO41bk0Y86ZK/5G9tovSKqPK0RV/cfb+35b+lOkZlYIcYwjVw+mQyrnA+F5VbmPy7MOZS/w1Jc2sM2oAPNjR+zdFXdGZuunksWcl+SnRZ1QkJzWfZVKA+RNVSNK4gicACHtxmnzQcIcRlxOA8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 09:16:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 09:16:29 +0000
Date: Wed, 11 Jan 2023 04:16:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [Intel-gfx] [PATCH][next] drm/i915/guc: Replace zero-length
 arrays with flexible-array members
Message-ID: <Y75+aCeiRYe0SXMo@intel.com>
References: <Y72WBTUmh9r1lvKN@work> <Y728SwYZeThQzohb@intel.com>
 <Y72/wTm7eIIylTqf@work>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y72/wTm7eIIylTqf@work>
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: a080bea4-fdee-4214-2ff1-08daf3b485a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dI/QJfIzqhkTNbyqgNr8e5G6A8ujs+ZLp3fNBlvxMpmZHhM6XnG79Xm0x+rhEtU2+8L8Rw6R/Pat9rnlfu+zz1ul9bRuO2SGwEhq08cE72TWPZhYB0+BEaSiuwEtS2OhLtnMNrgUAt9J+mEm/i4R4OAGCIUZEpPIGqIaHncTq2e4/0wkqdp1VBTMRuPhNd73Y7Ap5kc1ZHHLPhVbQ2ubVlwcuk4vfGquEngAgfRFLN9WDL/5sVK8fzL3qYNjS3p1lKyl0iT1/pOdRTq1ayitozL6iTycLwKTzrV9WRUDGL44vpvE6mh7Ci+ByQM14Ld8svqV3auPUQEYtla8Kxn3+5HUT/q9Gsqek6oP7VDu9fi/sgJtAqsFNtj7LlCCrQ9PKa6WfvBrJqnac6GrcJxX/gj9266tiDMtSejkiLBiQnKGxraPjia4ciAv45LeTd1TNpXfUhcKa5hXl1EQ+WLwiSqmxEHW+HvJJxySWcBT2fRqDXeYvtdHom03Acxaca45KBDytxaH+B+2rF6VR9eiY4SZK7a98Zw5r09MFVYHhfYSni1TMTQinNN4pX49nXuk33GeSr4DzrTI3JdEMy8nATczb6WQIdljP9mbOYnOzQud7As0r41H7TaFj0u2XAQI+tDdV4Rf+n+agmXcCt3AyXOXHTBWWDX+b4vpZi8Ywd27jFvIHpmiJgP8uuzB5JM4XQrFQrwrk69b6j/YoQqx3cmD240KnD4N7yykwk02uVLvJgP1bzUUTX424//7a5Vf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199015)(6506007)(2906002)(26005)(6486002)(186003)(966005)(6512007)(6666004)(478600001)(54906003)(8676002)(4326008)(36756003)(6916009)(66946007)(66556008)(2616005)(41300700001)(66476007)(86362001)(44832011)(38100700002)(8936002)(82960400001)(5660300002)(316002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SevTsHVLC9k6/pZTWhrz9zax9V1rWIX5IgiHFS0bTxDXQq1u+iJzI2SSmnOR?=
 =?us-ascii?Q?y3B9ZOCmr0Ox0eTD4OAIiRaKybyjo0l1PS4pJHFRNBZY9BMLArL/Ov/FSUhT?=
 =?us-ascii?Q?vQqNwNa48mrjEUSVlX7lDUoW2pYScdWZf4gd03ZUHcdgn4lBSnHC3JZbOTdS?=
 =?us-ascii?Q?2/YNTQL9Y3Be6Vr8QyTWUGe0+5mBN7/dn1q9c+qa7sH9cknRwE4qscDEYyMt?=
 =?us-ascii?Q?kY3gMUJR2RMC4QCmdaQPJznf2ZX3nJExP8Y9sEyTFA9qGotlbklsQaziyRpZ?=
 =?us-ascii?Q?o/64vgOqAuXkkx3yR0F5NRnSyPbzB1O+SR8nO86Jw4DPZAjSMu+Z1pOFhLaC?=
 =?us-ascii?Q?ahKLVmP5xN0SONGtJfXsT0NRqTY0PAE9j/UIRGlV/wLEF9979KB4u2bpaHFd?=
 =?us-ascii?Q?TPKp4UL8NEdQKBRslxQfQn1cEoxmAq2I11M1mCbASZxzbcTv4CFgWozcKNTF?=
 =?us-ascii?Q?cU+BOfops8xYZZ/L0pvuR3ruqbvM92mQ+8ziNZPaY99w0swqlXtzUp6gK77K?=
 =?us-ascii?Q?HYR5QDiVrynvH8uNdA5fr05Z0EY8xXseGu7y0+xaf8tzotOecDnK4+71+nCB?=
 =?us-ascii?Q?7r3Y1aFa60cqo4KT7bgr5oZR+4Pu3BeCN3QyUM0KLbJ20yBrIZsEhUqSqPJ5?=
 =?us-ascii?Q?+Y5etSs7bm6ik8g5BVnjjrf+ijv2eLpF+K2sBzl1r+o54Iyg2DqxBsRohT+V?=
 =?us-ascii?Q?5lGOYV63y+AL5NfwKycgKsWntyXViajlw1XDxANerPf2wKO/nypgpL568DU3?=
 =?us-ascii?Q?p1vAUgCzF8kJMIlXkocp3InDB7ArV+2qFaL+7LtN9ShLVoBmKzOsnk/pHVwf?=
 =?us-ascii?Q?AKr8IqZvQzFg0TmInWzpombcLf/OnWz5ibF6NO/tGWgDIFxsrQc+rvC6UNrA?=
 =?us-ascii?Q?SGvjNTSBY3N/l6dU99XU9CWBLgQ/a4nTCS+6q+o+rO85Z3U8R6wVs/5oLbCH?=
 =?us-ascii?Q?K0h7zVFxuc6/yL/r8OdHXiVYgVCw/qYtFnfPIg2eHGpjos8n/CIvfEfkq6FG?=
 =?us-ascii?Q?3hWgtDWlljj3PckJv8v7OLcSwp3mhvuDUbXDH8Xzhw9s2UfhKB1/fJmXsuXs?=
 =?us-ascii?Q?1shU94YrmSEHnsJFXtlj7ksstO6z+KhiklcCJ59JfUGJaWl7QvMtMJBoFCjA?=
 =?us-ascii?Q?LhrGlwHlfQCAL/1b1K2T7ck4nwis1uNi05z5iObzz5sH4ZBsHjhYN+nHB39m?=
 =?us-ascii?Q?RUhKIeH4iiGnC6yIxMnrlRLKEy/Z0yoZwdra3iIu/OgwO6wEbuNVLK5UL3GC?=
 =?us-ascii?Q?3hOL41egvjunI/TPbp8aY2WQSVe/R8TDKxvdoehFz7q0meluKdwALn5AICFl?=
 =?us-ascii?Q?4B2fEIWZz9GsC2x9Dj1mBTPUPkaaWlMeqT7mSNkbQ+AJulK9I72YW6EuIR3u?=
 =?us-ascii?Q?jpSD8vW12p8qNy4djRqq4WNQrR6vHjiWr3Ohqex/70Fya2xXuXselL4ynDFV?=
 =?us-ascii?Q?my0x5ohzdUJAI7hkzC4ymWtbXPJWzOIhHw2D1a/mfBQQ7ow+TpkdEnV4pBUi?=
 =?us-ascii?Q?qFkBLWUQmpYBzkT9WIT6Rmk3c8TOvEYq6ry0Oyq7MicONubT1bTXjOSLGV0H?=
 =?us-ascii?Q?6iPmvWAeqGjcgBRWnNJr9orRjWz5uh/PRoC5m3TL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a080bea4-fdee-4214-2ff1-08daf3b485a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:16:29.0482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTWqDwYC+PMsVSVFAMEvRewrJ/Ct7vAhxG1iDXnZUzDPq0/3YBr8P33gNRhe6yg7JH/dJIOSciSuFUOga2xwyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 01:42:57PM -0600, Gustavo A. R. Silva wrote:
> On Tue, Jan 10, 2023 at 02:28:11PM -0500, Rodrigo Vivi wrote:
> > 
> > On Tue, Jan 10, 2023 at 10:44:53AM -0600, Gustavo A. R. Silva wrote:
> > > Zero-length arrays are deprecated[1] and we are moving towards
> > > adopting C99 flexible-array members, instead. So, replace zero-length
> > > arrays in a couple of structures (three, actually) with flex-array
> > > members.
> > > 
> > > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > > routines on memcpy() and help us make progress towards globally
> > > enabling -fstrict-flex-arrays=3 [2].
> > > 
> > > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> > > Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> > > Link: https://github.com/KSPP/linux/issues/78
> > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > 
> > > ---
> > >  drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> > > index 3624abfd22d1..9d589c28f40f 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> > > @@ -73,7 +73,7 @@ struct guc_debug_capture_list_header {
> > >  
> > >  struct guc_debug_capture_list {
> > >  	struct guc_debug_capture_list_header header;
> > > -	struct guc_mmio_reg regs[0];
> > > +	struct guc_mmio_reg regs[];
> > >  } __packed;
> > >  
> > >  /**
> > > @@ -125,7 +125,7 @@ struct guc_state_capture_header_t {
> > >  
> > >  struct guc_state_capture_t {
> > >  	struct guc_state_capture_header_t header;
> > > -	struct guc_mmio_reg mmio_entries[0];
> > > +	struct guc_mmio_reg mmio_entries[];
> > >  } __packed;
> > >  
> > >  enum guc_capture_group_types {
> > > @@ -145,7 +145,7 @@ struct guc_state_capture_group_header_t {
> > >  /* this is the top level structure where an error-capture dump starts */
> > >  struct guc_state_capture_group_t {
> > >  	struct guc_state_capture_group_header_t grp_header;
> > > -	struct guc_state_capture_t capture_entries[0];
> > > +	struct guc_state_capture_t capture_entries[];
> > 
> > Please notice we are currently using sizeof(struct ...).
> 
> Yep; I noticed that. :)
> 
> > Along with your proposed changes, shouldn't we also start using
> > the struct_size() which already take the flexible array into account?
> 
> Not necessarily. In recent times, we don't include the struct_size
> changes in the same patch as the flex-array transformation. That's
> usually a follow-up patch.

okay, if that's not a problem, let's go with this for now and wait
for the follow ups.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(and pushing it right now. Thanks for the patch)

> 
> --
> Gustavo
