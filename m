Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4786723B9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AD510E7A8;
	Wed, 18 Jan 2023 16:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BA410E79F;
 Wed, 18 Jan 2023 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674060180; x=1705596180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uKk/7ZNd23vqoshOjPPB0pO4oNDHMKpCGE6w2UfDmR8=;
 b=XomF3Vp0vyx7VdhMLuqCQlUcySH9At0pEJWAAiwfrpU85n/rCuvf8K4p
 m68/HGwmyygP7WEFsvSt1Z9OkBovceHaLuxt2tCS48CKesCr+SaKbqaEM
 gSK6jF3GZO4IibaGbPLReznzmuFY+rpWibqSQrCQJhT87q0As6ar12ZoM
 Y0oIlqQcR0mXS1l9K9A1Ykb6F1Vy75F70FElQn7rneYOrA/kYGUuVVZfR
 RbvdSEboxUpnyLjU2DEFd1Gm6tOJvHZ2m6M0HaJ4KIwA/rJSZyKaavUyI
 +420+nTRHFrGaBlCIMq5eRLigtaI5DAMwivYLfLx16gRvWdTVSukG6nYN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322721542"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="322721542"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609714269"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="609714269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 08:42:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 08:42:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 08:42:52 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 08:42:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFLsU2JCabXR6TYJKpckLPNsxpNkjFbt79XdK5epJQNtmAQ5tHl1+XM8MEEfBX5jwKwogn5vVsMcv6LJ/D8Qgw0MiKWQZUWVlulhnKmCx/ovPqryDjcDTosX8bQgi2ESeh3hlF1bLR4/r0LAdsK2eklehmrhdC/GOe51y900GzGgkrY+aqx9Q9QZa+9sk2CvZ1V9xRfiC3KWW7kkAE3VzPjm7IsMAusqXWtR8Xd5icWu2/TDHHG7gCZ+3wFrwfSs1VU7x62F1uP2sj49IOPKOaRroe1cS98Eey4SvgWsP2R5dDYw17soWySaBw0FUEO+8DTywGeEgSj984rTDnSkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDXBAoxrJR60Bt7br5H0gsWOXW7OtOTtG4/v+ZvBDXQ=;
 b=LN4ou9ccrb2QaO5V2hkXZZSuxXGJVi4XW/UYGu6rMdU5rvCe4umDFH2Rx+CuM3D3fKbtr3M5ZSZcc3ug7/YaEGJbkpUm1Hu+LWkcwoB4nTdKxDQjqWzXYvVRcxoRNUPOeDlhx72Q4X33fevAI7qs2644pC9fKKwqTnccDN6oDogsGG24hpNvf5Vb+wx6ORpCaVYwkte+wXeb0YgU8B3RX4VcwRre30Sv1LQE9wd4jnRIn0HB3yG1Vyja8uqgXBqku/C0KI3v/m7QGYA7jKHThBoE8ungxLIYs4O3md4uvI5fiDtuH4DLONBGmTSmItoHPlu2KtrQj/ytx10aynw/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 16:42:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 16:42:51 +0000
Date: Wed, 18 Jan 2023 11:42:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/i915/display: Convert i9xx_pipe_crc_auto_source to
 void
Message-ID: <Y8ghhIzMPc8silvo@intel.com>
References: <Y8K2SS/zNiPAmLsS@ubun2204.myguest.virtualbox.org>
 <Y8b1V7TwesqmB4Hv@intel.com>
 <Y8d42OYWpW03zdAi@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y8d42OYWpW03zdAi@ubun2204.myguest.virtualbox.org>
X-ClientProxiedBy: BYAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: eaefc2c4-3d39-4682-831a-08daf973096f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFePq/hNMWdgtUM3bC9fZYcD0kV6wv7+8FkUcdxlZnd3TahdmQqLzoxaViLldenlkEiQEYI2wdKBiKENeaUJbTnjFamRq6zouaAE1m/+t9owAeQBsmY4izX4Hgr5z3IREiENJY+4Z7TakEg/ZNzR7pGO/rwLZ+P5xzgdbrxipI1MZWP6k/xlMvey8Z46OAhu43DlCwh4XhLr6SVTMuUS9Rr3/h2DfEp/PEkJaxqXsdnheAXnJJIlQE3B+bB5HjLF2/sbcgqldwp57OB+/xjtPhZaDNOofPq8UqEriBhN8DeBVSB4k92PTQ57WrdM6t2JgaRUX1Jgec8neeYb6uOIY4E+rAkMIOoTiptYD+kIIjgNbchdj71/cfoMw99ankHgTDtg7p7I1RBuvTt0IVWrQEjL7hxaYoCP/pBiXiyjWFRwyec9OfaIOLYjp/AQh5mmq7BZNbtFPf0SxyBHRbuJln/v0dlUbZyaC/LH970npr86yCbY2Vib5yw53JBlapIBSsvAue1cViVTi5s/7zkh1SdYH3lbN//+EstzgKo+mMiDjyAV1LTlfiaH9wvFIIYhMIUPKvqdc9qGZZShrVGAbCW6Oj1xeVBQdFOfWtmQ+BjBXsvwKig7ooabauvwlfb/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199015)(38100700002)(82960400001)(66556008)(86362001)(41300700001)(66476007)(83380400001)(66946007)(6916009)(8676002)(316002)(4326008)(44832011)(2906002)(8936002)(6486002)(478600001)(5660300002)(6512007)(186003)(7416002)(26005)(2616005)(6506007)(54906003)(6666004)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5IprgyCHDczrzcMDgGk/FQbfTtJQdgJQFjufMK6Tzd9zklDAWHs+7XA46j4?=
 =?us-ascii?Q?gWxGadkwLn76/qcOpWxUsAg/KQnlbsV2aUKyKlwEwyrLUBITWgvTGgpQq5Zk?=
 =?us-ascii?Q?zHZIY3IObpz2+6H8MHO/vm3gqbDd2qoiejxgvUaQnpd2uf1B1prGh3EZpNSk?=
 =?us-ascii?Q?bfQgRaqQmjpsLYP2OaK9MlpNLoXDruN6lbH46TMsfu8ROvHA1hpcwvG5Vq2+?=
 =?us-ascii?Q?exmtBbJRg7UYzhqmm7N5GA4n+RDeiph5Fzgd7xnfWHwdw0lnSdLPG1PLymd1?=
 =?us-ascii?Q?jE8Pk70zP2TGiV5BShMOEXL9wy/ouAVfcb0OfLXppGALJSRt5t+YPYsCqffM?=
 =?us-ascii?Q?iLBhZxhhH5XlNM1phDmxtfVTLuPujv/EDtP1KjPNVZ1iMVL4UkuC4cmvjZ05?=
 =?us-ascii?Q?L+M3U+JiGbln3FbfJKnDYsRWmbzKy2qghJlsyxHVROQRUSCYWNfggJcCtIj4?=
 =?us-ascii?Q?EGt2ddndjD3hUbefUV09JP5cRUyOA0iWfct6Ru2ZuadeqWa10RteH9WtUO4e?=
 =?us-ascii?Q?5GTZZp+MeUN1tzoAzxxdsQP1g074AyHAc8P5ErB7qFmjkOSGOQMt0j8Htlm1?=
 =?us-ascii?Q?67YAq9CRW+/U0GAgfdJjybcVaXUvPybiKg9R7O23TYHvgLtVPRtMsxnCezxW?=
 =?us-ascii?Q?yxaYHcd/EN0COU+xVivQH4gRG/i4J3NAxpztZmAs4F1I8Kte5NPYxMPYwhqA?=
 =?us-ascii?Q?VGA3ci/g1qunmcchC3le2d7fifhu1oKVJ+ST6W3U+3HalJogjWacTXoyduu6?=
 =?us-ascii?Q?4iiKujaSvLdCG0TFy8GybML/W7Uva9jG7Fw+6Sa7cvxHiWBUQvxJaokSw4If?=
 =?us-ascii?Q?ySyFTNYTa4DHTYmHQpiGUNkr2Zy1puL7r6sB5AHVLHAgOvXzlrHoxL0gxmMv?=
 =?us-ascii?Q?jWTsw/0C5SChDGaXhVS22YJu5NTJJTmiRIKlWb+Bkd6DoHbkdeXoisMBh+nJ?=
 =?us-ascii?Q?+kHxR853OkU/uXgiR59JO1xw0kXOe8bfAoGF/pUYJKuu/5S1+BgPeVllxGcq?=
 =?us-ascii?Q?XzVYM7TrIDdNJG4aIbTX/hfp9PYjwQBSRfxQ4Hy4wxl0P80o+TpoPGmjTs9U?=
 =?us-ascii?Q?Nqu+5Em/5jG2Dwn8LfYxpRwkPDxeonNbXpmEUtDxCT5XOe1jYKVBXmes0rgE?=
 =?us-ascii?Q?Yp2k0zBCfhXVnIr7jqL/3YpfRGXTPMouA+sywtpBafYA8deC/vhx7LzrF4Py?=
 =?us-ascii?Q?C3jNBgFLlXy4NJG4GdQJYuQi95hxAlsnWwi9HWwthsZIE+/b2XXlYsd919HK?=
 =?us-ascii?Q?e9lt7ih7j/Z/1H7y5Mx4AHTHMRxEMC+OjyIgInmeNmAGO0XcPFws0oYDCX94?=
 =?us-ascii?Q?G0MjMls9Dt9Q9KSY1O9B2u3AHtJBH6gKUABKhlAFhZzgbA8p94oMQn6mYa0G?=
 =?us-ascii?Q?3sdfW4xkrROXQKgWdYW2afuLq0x8hLO5rBktH4eaKh5mnsVg94qQStlwztcL?=
 =?us-ascii?Q?SuQFXlyhsNNcioRBPrn1Q4+danyl6l0YTMuu/3mNcFK5N3SqItGb37cIzB8r?=
 =?us-ascii?Q?OD4afL8iyXqkAQs86rr8OkvzuhLCz/IpBP5ZqBGgrXz9kUE1zb11QqhktAJu?=
 =?us-ascii?Q?sESwdKjbxts3dWO4swKyNIi48L0/qar5bZmGT7Pg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaefc2c4-3d39-4682-831a-08daf973096f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 16:42:50.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXtoIn+pLEAQMAjiWRA1ATCGk5ElIUv2DLK3YdyAAlWfo7lgEzZW1cHPCSEv9P+KWmLnurJR0zk1ONUIKYAjSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, Praveen
 Kumar <kumarpraveen@linux.microsoft.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 10:13:04AM +0530, Deepak R Varma wrote:
> On Tue, Jan 17, 2023 at 02:21:59PM -0500, Rodrigo Vivi wrote:
> > On Sat, Jan 14, 2023 at 07:33:53PM +0530, Deepak R Varma wrote:
> > > Convert function i9xx_pipe_crc_auto_source() to return void instead
> > > of int since the current implementation always returns 0 to the caller.
> > > Issue identified using returnvar Coccinelle semantic patch.
> > 
> > could you please share the coccinelle commands and files you used here?
> 
> Hello Rodrigo,
> I used following command to identify this change opportunity:
> 
> make coccicheck COCCI=scripts/coccinelle/misc/returnvar.cocci M=drivers/gpu/drm/
> 
> Let me know if you would like me to include the same in the commit message.

Thanks for the line.
Added to the commit message while pushing it.

Thanks,
Rodrigo.

> 
> > 
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > > Please note: The change is compile tested only.
> > 
> > np, our CI liked it.
> > 
> > I liked the clean up as well:
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thank you for your review and the feedback.
> 
> Regards,
> ./drv
> 
> > 
> > > 
> > > 
> > >  drivers/gpu/drm/i915/display/intel_pipe_crc.c | 23 ++++++-------------
> > >  1 file changed, 7 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> > > index e9774670e3f6..8d3ea8d7b737 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> > > @@ -72,14 +72,13 @@ static int i8xx_pipe_crc_ctl_reg(enum intel_pipe_crc_source *source,
> > >  	return 0;
> > >  }
> > >  
> > > -static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> > > -				     enum pipe pipe,
> > > -				     enum intel_pipe_crc_source *source)
> > > +static void i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> > > +				      enum pipe pipe,
> > > +				      enum intel_pipe_crc_source *source)
> > >  {
> > >  	struct intel_encoder *encoder;
> > >  	struct intel_crtc *crtc;
> > >  	struct intel_digital_port *dig_port;
> > > -	int ret = 0;
> > >  
> > >  	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
> > >  
> > > @@ -121,8 +120,6 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> > >  		}
> > >  	}
> > >  	drm_modeset_unlock_all(&dev_priv->drm);
> > > -
> > > -	return ret;
> > >  }
> > >  
> > >  static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
> > > @@ -132,11 +129,8 @@ static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
> > >  {
> > >  	bool need_stable_symbols = false;
> > >  
> > > -	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
> > > -		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> > > -		if (ret)
> > > -			return ret;
> > > -	}
> > > +	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
> > > +		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> > >  
> > >  	switch (*source) {
> > >  	case INTEL_PIPE_CRC_SOURCE_PIPE:
> > > @@ -200,11 +194,8 @@ static int i9xx_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
> > >  				 enum intel_pipe_crc_source *source,
> > >  				 u32 *val)
> > >  {
> > > -	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
> > > -		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> > > -		if (ret)
> > > -			return ret;
> > > -	}
> > > +	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
> > > +		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> > >  
> > >  	switch (*source) {
> > >  	case INTEL_PIPE_CRC_SOURCE_PIPE:
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > 
> 
> 
