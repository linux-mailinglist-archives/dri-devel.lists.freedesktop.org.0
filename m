Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220707941A0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 18:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3D210E6BA;
	Wed,  6 Sep 2023 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31AE10E1BB;
 Wed,  6 Sep 2023 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694018568; x=1725554568;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bd+eR1D8MJ14EOAkMNWnmTSrj7/rtOLUPkFcbu+nGIk=;
 b=WvEp4jdoDJrahonbrmYkyp1cok4BxFwPErpufe/i2f7oemL+GPhSXbwS
 ZoEamt09ss2SuCX1/vUsfXdDxFHkBWFNw+AiDxDDPW+7xBFDQWvUlHtly
 i7qwUVUa/vGg04t+IDHQCOpqGWC8bUWlDq4n0wCy/0/efH9VKYswCuLH8
 PYhcbYDFGRVljDlBQA/WNYnyG0/ejxqf1/wJEPDdflCr2HBrv+xgs3g4K
 I0xjlc+j2Q3/T4bLc6VxARqr9UzPoyObSJGqWjiOYKw/9PX5Z+qTIis2X
 MkokvsyEEjB9DkNWeuOtBMZTzqcLEThH3WPvBiLrzkhOOWlGLVDYl9XdI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380916556"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="380916556"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 09:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="770835198"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="770835198"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 09:42:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 09:42:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 09:42:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 09:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOztwVmbBtZKvh6N9Jny71CyKqkRTRUCovelDiRQkESfaklZUq9ToALQvSLqvX7tGiZ7HCdZNycMX4WCqzIETQJiSeJs7nhz8ssHZLCJTLMn+QZMvQUU6xh+kzQ3HX43fgkKkiC2OJC12MHrv/4Y6bvi5SFp0c2BY134KOHjJ5Ktn4FQY0k9JFlV7rxLOHMA4NgUeFFim1OMizMapjlUmZnncydMHmS0cACyXm3SLcGYlRLkMSNii2JBhu6umTPJiM+RLubZBoGuJW/vMno7LScwo8Kz7cc/MnF7DFcXYEQ77oj//3ZWIRPyldG7mpM1XO6lrog/eUnxBlmLwiVnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmqXDNQ7XkHp6MZXnHUOvCRHI8TTIVQzSM7sz3xYHbY=;
 b=F0j85sdLIR8Nm7J9Of8rgHLegZvhIPOgnMddBoh7nTfxN65opFzV6SfWHtu0pQBjlAyIWVgxSKcTQQq/0NollsD1ofH/eAapyula4WhbAWa8xhS2LWAZHaWywuoLN3EP4sx6CB2616BTJG4hF5UVKOVqMZG+bXU1ZVGgjjO1ubjFA1wRUehZ31/VvN6tt4WLnGJAO/8oba7gUyEgc7Z8eIz4bDHgtay/3fAaDnqFhbIefHGGilovrCNkyg0CpIFoly+1BXmcoBqWwfTSIpdTx+w49m8nMRx7OfDuooKH1qzWzFmfNpNsrujA+kDmJOzCkhnK56HA8S5S5ScTbb6jDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 16:42:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 16:42:44 +0000
Date: Wed, 6 Sep 2023 12:42:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2 3/6] drm_dbg: add trailing newlines to msgs
Message-ID: <ZPir+7VYXcKv117q@intel.com>
References: <20230903184607.272198-1-jim.cromie@gmail.com>
 <20230903184607.272198-4-jim.cromie@gmail.com>
 <ZPV6CMBlDWriMyva@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPV6CMBlDWriMyva@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 342f2e74-1d49-48da-7f93-08dbaef84b31
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wsb34ZNaIpz75bglQoLj1j6vUUmeW+TScoeEKDh1HF097g656MdFYsFkw1IPLtg6nPCTchT8aCBDQob6eiNPsQZLj56J+pOQTXyem/bo2fOOAlFmRYUW4kC+dR0QSnvX4EV40UGoJf4NuRz4yvk6wopcRVFUOHiEOYNLZrOBaiyIl2xNT5CBCdsJaNYmOD0EsNAhhD6X7jR96wFYoJWSN5MroLevaQyi3SKzp8T/isiLK1epvFcntd8YNBUROUZziMUogWAb+VJZR0yQpOHWa9onoOWBsRkKSx+X+0fzoZtNiVbkXRD6Gu4oS3DSxyBv12m2RxlQiEyvaE0nAv6LhlQ2vVs9GeIKB9HXhJjZin5hNyII7sL3suRCRzaZY5Nvy0eyEEzk9zAoqddxhXdS+smJ28WO3Pc/EuHm4NCPAhzB6XNv/9g8SHip/mWXRmOGd25x38s9SRvtN8GTUU1GGgmyq1A5Biv/Y2ZDejsNhXyqXAAVH29mu95r2GmAk5Z/mVY77UfGDzpDL1YP9htg1ljmUZHsS09xay0uZpfj+gLAl6zTYYo8kHRYts0NCBQmkiSGVC3hp5Z25Sp3iYIT4QgijbOpBLUPQHueEynDx48=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199024)(186009)(1800799009)(26005)(2906002)(83380400001)(8936002)(8676002)(6512007)(2616005)(6486002)(6506007)(7416002)(36756003)(86362001)(82960400001)(38100700002)(44832011)(478600001)(5660300002)(6666004)(966005)(4326008)(316002)(6916009)(66946007)(66476007)(66556008)(54906003)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6feADvTnj6kmk3/BwpavmgIGUaDg4VtPiS9Sfj3hTgOFE4Csyqdd8rfD1HQC?=
 =?us-ascii?Q?EQCaEI0ALtDa8Vr4z+HzrFub1p61XC2zJKtK9RyOYJF4SWVrBpndCgril+CH?=
 =?us-ascii?Q?oHJyZdra3acfKQNAsXrZiQnUGJufKw/P+2+1lie3s2J692aj7b4b/XpqCsVG?=
 =?us-ascii?Q?cQXOYHeh9PEQB/XxtK8Z7fkZv0IZd3ywnmp1CsUn+af3RbU1A3X+h0eo19Nz?=
 =?us-ascii?Q?b1QYk9rwJBy6k0TY2LLHuXF0Cmawjvw0epyYmb6JMGT3DgyGdwo2TmM5OhTX?=
 =?us-ascii?Q?Xx/XmX6mcKGs3lWktCqJYwNqVcLhMRjkAJQtziqp8WFmGsf+B/oDmY9Cp8MK?=
 =?us-ascii?Q?Nd6Kspg9j3A3i8NxIs9WrkrqbO7qBZ9S4Gfm/a3MwxLFQfoz8obWi3yq4Bvt?=
 =?us-ascii?Q?QxjkVgTP1DFWBrgD0xhCgS9sI8lhlHHZu38XKuARh6/HMvRStTiXYoQ538BP?=
 =?us-ascii?Q?zTlPG1GzScHu3/+FdhHW0Uxnh8Di4oK8bKQ95wgrAXh5HX+fVRLoZcd1RkML?=
 =?us-ascii?Q?3xJ/v12pJ7jyHFMkpRgts/ag5D5PHeaSSI34SBW/ujLZah+Bo9DAZ6RzT2AA?=
 =?us-ascii?Q?I1ZY+l8SSvNdtqqny0n0ykqULeKWZfHIimjhndrQXqs9RZWSJ8Zt+3FzyEio?=
 =?us-ascii?Q?Kb3ANA6VfN2RYtPR0wFk6Kxv70BXWtakLNCuTDzy8MHqqRni6LcX3TCXZweW?=
 =?us-ascii?Q?KAFMYSpIZ78Ev2tTPgseLgKkAr1SngI/wARfoXw2l8kYLUWmRX0Lkhw6rOCq?=
 =?us-ascii?Q?fNotFMv7DsRm9wvCFfn/lYq9SREw3JXikpVE/YXBDRLHQBGgrq7gSdG2aGoP?=
 =?us-ascii?Q?7AqrFt8NWhgr+zaFxRn8V/O5Zcb4ShvJ+1kxdjJ1gHowSZ4Qa5ra3zLozzab?=
 =?us-ascii?Q?sKjzqQ1TuIUGws+ge9Nz3nHfEfLmUAP2LAt0iCcy22jBJ3Oh2LwiaDfZHim0?=
 =?us-ascii?Q?jDkp+MYMvH6dV2Pkkd/QurQtC4JNSpxMI0PqC6tAi3w+HpAD1Qmsrvvwliwn?=
 =?us-ascii?Q?NlcVLxR8zTx2VdwVV+pSLoi8F1RPYjfbtGxUU6b7NX9ktlRtnkbximI5EyCT?=
 =?us-ascii?Q?HQq9A5YK8HtgVAaZ+HGWw2ke5M/Kk+ELagLL5e92d4ScEXD1hJNCY2iRE0IK?=
 =?us-ascii?Q?JP0P4TKU5bfeXiyo7QVNArAO6pUq8BralwuKY849VWhujzC4VeqcZfrYOX2M?=
 =?us-ascii?Q?PqhsG4efKSY1vbK/8ue+9bBBgr+dxGTmWGZlUW/+GnCn/M8zRvtHCn8kB6EC?=
 =?us-ascii?Q?GGiwrZKWIcdqMone0foGFDY/mYwI6JCMs3Z7YFz1jUd3I2pbrhPftx6+mAv6?=
 =?us-ascii?Q?w7ys9njArcNlA6aZTaKub8yS07sPnynJeef2eZqAPWGLUn4iVydF+TgY0IId?=
 =?us-ascii?Q?4A0Syk6eBrdVJvfVm4vq9dYd8adVYdCEYLKuyDwaE9yaDreCx+GkTVjWV4lK?=
 =?us-ascii?Q?cI6FsZKOAAqKQHOjy/ja+1xW2Jgv+2M2AafWT0OWnZ54FrkksyYC8wpeNpJG?=
 =?us-ascii?Q?he5wBIZADiezIwmjjCVSF7q5bZ3RFuPa/3Sui7xIOEodBKr2Aye7MPgP1lPx?=
 =?us-ascii?Q?txDlO5/uMYrjRnZlrUB1HOCl85eRb36OiesMD7MEf0nucwh3CODwTjUlTg/8?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 342f2e74-1d49-48da-7f93-08dbaef84b31
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 16:42:44.3200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkeZ/gf8WZWL8g89X6My1qvmTLrQojCqbKhP1XtHPB4YhjysNZTRZyzfEn/kUoYQl1XJNrxIeLE87Cf0l1fjkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Fei Yang <fei.yang@intel.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Rob Clark <robdclark@chromium.org>,
 amd-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 08:32:40AM +0200, Andi Shyti wrote:
> Hi Jim,
> 
> On Sun, Sep 03, 2023 at 12:46:00PM -0600, Jim Cromie wrote:
> > By at least strong convention, a print-buffer's trailing newline says
> > "message complete, send it".  The exception (no TNL, followed by a call
> > to pr_cont) proves the general rule.
> > 
> > Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
> > 1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

I pushed this i915 one to our drm-intel-next.
While doing it I have changed the subject to make it clear
this is 'drm/i915:'.

I believe you should do similar change to all the other patches
to make it clear in the subject about which domain that commit
is touching... instead of only 'drm_dbg'.

i.e.: 183670347b06 ("drm/i915: add trailing newlines to msgs")
https://cgit.freedesktop.org/drm-intel/commit/?h=drm-intel-next&id=183670347b060521920a81f84ff7f10e227ebe05

Thanks for the patch,
Rodrigo.

> 
> Andi
