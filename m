Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5AE5E8656
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 01:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1C910EB59;
	Fri, 23 Sep 2022 23:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D5110E311;
 Fri, 23 Sep 2022 23:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663976121; x=1695512121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q/qFRizYn150bwrL/xn0/i6aM8sZTP5lhK05BHix5Ec=;
 b=al97j2a3q1vldvzJUOPqCXyXsKfmv4b4N+4NDy09uQkCtqqxlQglN6SI
 x2ZEDcuuYmVDlZk0mXPBKl7IVivPKPa+KUHmZd0W2GgU6vWzxskTPhpVP
 5OXiJKCUPBdDnNs1dcuaMktc7YacE66qcL17lUGoR4snVFSPqej76kO8p
 sSHZWJ9FYqneJ6nVxv2B9rW7DpK9JfXjkYNnpkQcrfzi0sVg7R0b8wxG+
 WrqtOOqmJOpnglf1xhcyvu/vDFRh3Y8Bkxchu36PnYUKEjYkgYR4t2E9X
 wxlJPLkMv9RMyWGZlFVWRutwVacsMjXeEMk5KWRJ/nrk+GNZb7jbv5De9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="300701031"
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; d="scan'208";a="300701031"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 16:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; d="scan'208";a="949206162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2022 16:35:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 16:35:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 16:35:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 16:35:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTWAToepl3eewdDa6sRNXw+cs8Mjq/6cLJIl4uLMkR2RcJFmfPwdbj79PqQMkGu+MAa8rAP9dHdeKf2klAAFG/SD3TgYctiwe7fLiHppzfRyXtsGyBJ5EqbjDJfdyJxxGTI3uIqdUXi1dKPN5ZqCeHB5P9eWTL5cGNrCyP8g0RfCRWZ/23mY2OjP/SbJJfbebIzMlKbB15VDwzlk2ZU79jroR/E8J6DJiK/oPC5QOO8trHVIkT4oq1GTPGNHggpeACnqz/fcBpsZ1bFGu6jXSTUFv+GsLnsOivKgR+i3XCJteewnTI35uGLWTjcvCBRys7hHJQi4b6Oh1mb6+uAVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZEvq5iU/edwjciVuR0l2ID83jeXy9FLFJ3XItka0PM=;
 b=b3D2Pitky3tL96Du0IGhpSOQGVd194H+KqECk8xLhvnzkCgmSQPTEjLJOY+4Ak9r/apRv564C10YlaGScNc1Bgs8OgCB6Phcdu/1Xj2fUsghzuuKvwmqxymgvfWtUqE61F2eMRpYZL/PiaRMar82cs9mHBUbq6GVXgaF4io8gFrnYnem/CdwgFzYyeFp/4mp649qtVyFxUhnfH959K7XMahFCL7RXpFdvOnnuuW6yClDZ0skP+ZJyQCEEZYeqNQAj1tRbiMFNllOgOZume3z/AAiiWj4NEgTgyMJ8YNHIcO2RMbFTwPRZtxtM8oRipMeUUS5h8lQFu8HzCVqbKeIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Fri, 23 Sep
 2022 23:35:12 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5654.020; Fri, 23 Sep
 2022 23:35:12 +0000
Date: Fri, 23 Sep 2022 16:35:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/mtl: Define engine context layouts
Message-ID: <Yy5Cre8ms7eXtXKc@mdroper-desk1.amr.corp.intel.com>
References: <20220916014648.1310346-1-radhakrishna.sripada@intel.com>
 <20220916014648.1310346-4-radhakrishna.sripada@intel.com>
 <20220923224851.lqoazbs6r6fb4bjz@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220923224851.lqoazbs6r6fb4bjz@ldmartin-desk2.lan>
X-ClientProxiedBy: BY5PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::24) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: f8340fc8-0ea1-450e-aff4-08da9dbc4287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aN6VZPhtAIIJsgSxp91o0IKh/0XaSARnLFLTrBeXUl1CRGGATHXl4qrlsXE7o0O0HEM7hwqIuY6ABC6s/h5IFKHe+C83+FNoDoEQUqzPcFjzWyrrzGN4jYrDhfhOBfTXBzGRZhUGGJxWHeSX3UMWo+T5h4ho/8ylpDOkspMoczMKtQ12Qb32p0fmJMbPTEwdDUqy5WqKkYPAkID3O/4BLgwfh+WDtRwEZDE1GMBL+So3KBOvCgsKtZ7vRo83ueipfi+VzWif3cOtZPTCM09IP5VN1rKrzzuAZYOsV2K95nDVVULHHPiKKmw+T60hoPi7pbdfnd9IxCakENiuF5qltKPxUnFItYXkCOUiEbHGEbnzjffVpmz58eMvNRD/ULxsmaQtMQB6DpPbQG4jmk+XFG1NGF62X8TMif5qJdD2f4feBMwJNUwYOk6U2ZMeQjL6as6BE+jr1mfcXdJTc4VRpiR49DHRgOSZ/lpN5tYo8xhJG5KIhqNCN0sjyCehq7PMYw8dJzGxNAkaElK2Ajxj+6SR+46vp2QtbF+Rvzfms4UAVlZKPl6Va0NfE4Fetf1BSxfS4egosGup3G76FCYC4v4SV6mIZzUQC6jexwvn5zj3U5SGACKDIoTwJANEd82qt4Ad211+ywaAlLwX65DazwS/g8ycl3t/3sPoSr5UalNxjSXNiQkqB5YL4Fzq1A/7TNoQf/vUI64A1sHAvnOo+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(66556008)(66476007)(4326008)(8676002)(6486002)(6666004)(41300700001)(478600001)(2906002)(54906003)(6862004)(6636002)(5660300002)(316002)(8936002)(6512007)(26005)(86362001)(6506007)(66946007)(83380400001)(38100700002)(186003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hleFVKU+Bx/oIJDVjJ+5aCd9a419n/FdKO7qrQpotgmbQddLJrzHVj5LL+l?=
 =?us-ascii?Q?la53sr5gqkIe00y1agx6KFxZ8WyNYKc+4NLuZ75p7g6CIvPxiL/ElmAcahYw?=
 =?us-ascii?Q?vB+oNXQZOXw42Y3KXnrz9PkvKQWSbwrNppmH7CXdlOpH3SkJRCI0LhAo0N6c?=
 =?us-ascii?Q?lVM8813ZZ8RHAdcRgvPEhOpFtnBD2RcSiKUP5T0z0dJfcdwQowBKUWCMdveG?=
 =?us-ascii?Q?DQ1dP9MjA/A1OAXSL8Bn90IEZgNaYQ2fLIjDpnSGdpdY+YZtB8HxEWHd5Tc9?=
 =?us-ascii?Q?zNM1b+PJxdI3vNYGej1bX3iq1yuS98y/xYcgw7PrqxF+3PeaxmNkY5ifxZJt?=
 =?us-ascii?Q?q19KPdFwEKTYFc9AD6riaKe8Xj/MSFOB8QsJ2R/Bfp/jqWAlHma+x4JB8+zh?=
 =?us-ascii?Q?CjTU66ZEPlk9GOt06koLvsJoMOOugROgarxo+QDcbVLvlr+Ulm0be7gaAJaw?=
 =?us-ascii?Q?DcoNJH3XDMVQEeupZi16Gne4dmgc5A4Iy1xsTpMFYcNhpsSLc7YGtXG3NLzo?=
 =?us-ascii?Q?Pjrrd5UbNHyYLjnI4ajuNKvIfgnKAVmYk0FJruYbe0125+11KbaGjmStoTJ/?=
 =?us-ascii?Q?T1u21pIEPNzR0CY/Nb0vYNxc8FlSisqjP37dvNe1MBvAgWn0sLZo1bA+6CqS?=
 =?us-ascii?Q?4/GUzgzu5VGf2yFv47ubZ/PjgJEg+MS88z7+4BOseluGuzDYt1cI5s2qVYEN?=
 =?us-ascii?Q?XsUObxDtKr1oAnuCV+oj06nVFkd1V0ksEkqbvp9nEGCXlDPMO9X6aed0nR1C?=
 =?us-ascii?Q?y0NWmyiRyBejp4OGqaLH7OWd+5zut0W74+EF5qhk0xBWD5vudYNAEiuldZtD?=
 =?us-ascii?Q?lNtuDDXIHAb1nPGxVFoZVFcSfurWcltgPNUHgDtYllVTpzwVUYkuO/KT1Tm0?=
 =?us-ascii?Q?Dba5zTXL+FFOT3rk28zsxmSIabH9ny8wMm2rJSj4ETtTEK0b4H13X5mQHssI?=
 =?us-ascii?Q?DwZpiOWTt/MgdklQIcO5NcNvFBwaM4FZtXxzEf+lWThOSSasl9RVyrQ3iSJ9?=
 =?us-ascii?Q?hZUx/3cyfRy6sljDbvbR/mlqCRZTB6bOYwLa0GXFG5ATR9vGZ4kWIircVxuC?=
 =?us-ascii?Q?+8ykowAY/Vtsj4KYhA3NwAUhHzQ1Zt3U4IlHFnaNjZJxjFyLqkE+/BLSOOdd?=
 =?us-ascii?Q?HnAA3wymluXd8bFEfFmmGzihOPQmZ5gGekBPNuaFWZTCOfZHUy9i9Yf3adnz?=
 =?us-ascii?Q?kW8rsiigHnxVTRZ0aRNrurJJMbSdf/KM3DpPaOX1eypswqdKCR88/sEpnDaF?=
 =?us-ascii?Q?SeQfj+lFpt3Kf8tQl2ZVTDlrMqXL82TbCdBpyMPQNIg3msoKs3XLVhAOKTmP?=
 =?us-ascii?Q?+1kpHRQTarnTcJgFIfvmQZIC6nG8hwkHQjX+n5EYP79iDHjyeyhk8atqH7uA?=
 =?us-ascii?Q?POHyxoGpf1BAlXuyGLh4TyTKqGVCVoHRAkA6KSKDgTwdRfSde5yXOQt1QVMn?=
 =?us-ascii?Q?DkzbRSqSlBMyIBfO5HVyOrfyw2P67D6IhPRKf7cEAFe1zO0BqPbV2jYfLnTY?=
 =?us-ascii?Q?JNDzZrJEXKYN6bT1rn/gc6Tdc1RfvQSC0GV8hjb0m78666ekDCVFkIGc0IiF?=
 =?us-ascii?Q?V6WQblNWwgL3f8lqxQpbZzJ80O11srsUbM3YZIoEcw21P+EzaTwg4JiGKlLU?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8340fc8-0ea1-450e-aff4-08da9dbc4287
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 23:35:12.3666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebLJ51haFQHNrl+1ZDbNOkNANerP43K211xoRJNsdP4kHQI3Hr16fwsqiwAQdr5gtH7HfqDUKuBbKtXvX6cv52fMF1r83VPsjxA3vW7LWFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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
Cc: mika.kuoppala@linux.intel.com, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 03:48:51PM -0700, Lucas De Marchi wrote:
> On Thu, Sep 15, 2022 at 06:46:48PM -0700, Radhakrishna Sripada wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > The part of the media and blitter engine contexts that we care about for
> > setting up an initial state are the same on MTL as they were on DG2
> > (and PVC), so we need to update the driver conditions to re-use the DG2
> > context table.
> 
> this paragraph doesn't match what you are doing in the patch. Which one
> is correct?  From "v2" below it looks like the original intention was to
> just reuse and now they are changed.
> 
> > 
> > For render/compute engines, the part of the context images are nearly
> > the same, although the layout had a very slight change --- one POSH
> > register was removed and the placement of some LRI/noops adjusted
> > slightly to compensate.
> > 
> > v2:
> > - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala)
> > - Add missing nop in xcs offsets(Bala)
> > v3:
> > - Fix the spacing for nop in xcs offset(MattR)
> > v4:
> > - Fix rcs register offset(MattR)
> > 
> > Bspec: 46261, 46260, 45585
> > Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > ---
> > drivers/gpu/drm/i915/gt/intel_lrc.c | 84 ++++++++++++++++++++++++++++-
> > 1 file changed, 82 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > index 3955292483a6..c7937d8d120a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > @@ -264,6 +264,39 @@ static const u8 dg2_xcs_offsets[] = {
> > 	END
> > };
> > 
> > +static const u8 mtl_xcs_offsets[] = {
> > +	NOP(1),
> > +	LRI(13, POSTED),
> > +	REG16(0x244),
> > +	REG(0x034),
> > +	REG(0x030),
> > +	REG(0x038),
> > +	REG(0x03c),
> > +	REG(0x168),
> > +	REG(0x140),
> > +	REG(0x110),
> > +	REG(0x1c0),
> > +	REG(0x1c4),
> > +	REG(0x1c8),
> > +	REG(0x180),
> > +	REG16(0x2b4),
> 
> are we missing 0x120 here?
> 
> > +	NOP(4),
> 
> NOP(2), but it seems this is here to
> overcome the missing 0x120?

If 0x120 were included, it's a 64-bit register so it would fill both of
the NOP slots (i.e., it would be listed as 0x120 and 0x124 in the code
here).

The bspec tagging/filtering doesn't seem to be working quite right here.
The project column of bspec 45585 indicates it should only be included
here on PVC (and all other platforms should have a 4-dword NOP instead).
But the filter option doesn't actually drop out the row of the table as
you'd expect.  Also inspecting the tags directly leaves some ambiguity
about whether the final platform list is correct or not.

I suspect it doesn't actually really matter whether we include that
register here or not; the overall "shape" of the context image is
correct either way.  The hardware should be able to do its initial
context switch with load suppressed regardless.  After that the next
time a context switch happens the full context will get written out to
memory in the correct form.  And 0x120 isn't a register we're actively
doing anything with in the driver that would require special care.

If need be, we could always look at a post-context switch context in
memory on actual hardware and see whether it includes 0x120 in this spot
or not.

> 
> > +
> > +	NOP(1),
> > +	LRI(9, POSTED),
> > +	REG16(0x3a8),
> > +	REG16(0x28c),
> > +	REG16(0x288),
> > +	REG16(0x284),
> > +	REG16(0x280),
> > +	REG16(0x27c),
> > +	REG16(0x278),
> > +	REG16(0x274),
> > +	REG16(0x270),
> > +
> > +	END
> > +};
> > +
> > static const u8 gen8_rcs_offsets[] = {
> > 	NOP(1),
> > 	LRI(14, POSTED),
> > @@ -606,6 +639,49 @@ static const u8 dg2_rcs_offsets[] = {
> > 	END
> > };
> > 
> > +static const u8 mtl_rcs_offsets[] = {
> > +	NOP(1),
> > +	LRI(15, POSTED),
> > +	REG16(0x244),
> > +	REG(0x034),
> > +	REG(0x030),
> > +	REG(0x038),
> > +	REG(0x03c),
> > +	REG(0x168),
> > +	REG(0x140),
> > +	REG(0x110),
> > +	REG(0x1c0),
> > +	REG(0x1c4),
> > +	REG(0x1c8),
> > +	REG(0x180),
> > +	REG16(0x2b4),
> > +	REG(0x120),
> > +	REG(0x124),
> > +
> > +	NOP(1),
> > +	LRI(9, POSTED),
> 
> humn... set_offsets() is forcing MI_LRI_LRM_CS_MMIO
> for ver >= 11, although here bspec shows this MI_LOAD_REGISTER_IMM
> doesn't have it set.

Since all of the offsets here are engine-relative offsets, that sounds
like a spec bug.  Otherwise you'd be loading into absolute register
offsets 0x3a8, 0x28c, etc. rather than the proper registers.  It's
probably a copy/paste from the render engine's page where they document
everything with the absolute 0x2XXX offsets.


Matt

> 
> +Mika, +Chris
> 
> 
> Lucas De Marchi
> 
> > +	REG16(0x3a8),
> > +	REG16(0x28c),
> > +	REG16(0x288),
> > +	REG16(0x284),
> > +	REG16(0x280),
> > +	REG16(0x27c),
> > +	REG16(0x278),
> > +	REG16(0x274),
> > +	REG16(0x270),
> > +
> > +	NOP(2),
> > +	LRI(2, POSTED),
> > +	REG16(0x5a8),
> > +	REG16(0x5ac),
> > +
> > +	NOP(6),
> > +	LRI(1, 0),
> > +	REG(0x0c8),
> > +
> > +	END
> > +};
> > +
> > #undef END
> > #undef REG16
> > #undef REG
> > @@ -624,7 +700,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
> > 		   !intel_engine_has_relative_mmio(engine));
> > 
> > 	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
> > -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> > +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> > +			return mtl_rcs_offsets;
> > +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> > 			return dg2_rcs_offsets;
> > 		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> > 			return xehp_rcs_offsets;
> > @@ -637,7 +715,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
> > 		else
> > 			return gen8_rcs_offsets;
> > 	} else {
> > -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> > +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> > +			return mtl_xcs_offsets;
> > +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> > 			return dg2_xcs_offsets;
> > 		else if (GRAPHICS_VER(engine->i915) >= 12)
> > 			return gen12_xcs_offsets;
> > -- 
> > 2.34.1
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
