Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082634CB5A8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 05:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E10810F01F;
	Thu,  3 Mar 2022 04:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2126910F01C;
 Thu,  3 Mar 2022 04:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646280016; x=1677816016;
 h=from:to:subject:date:message-id:mime-version;
 bh=AADf6Uge89EeOh3oRuSNbv7ySG8x8F0zboBPlFDulN4=;
 b=mPp5dXPGldJPb6mBE9F/0NUUYOTHV2Ehe7jiHjxBYJaIPiP8fDMtqE1t
 Yr95a9NCiROYGVgZsh4rcy5bI8PgiRoqq+jY20A+N9hH9nxUnsqisYh0l
 st8pKZdhuAM66PZNNQ/rPF8I7j3XcUFreHIxDS0/nYSyLSag/mPs7X2SS
 quVqvD5mZeohpY9gYhmSzqDtNS5qQ1xqZJMul38Utjb414y7FQD0s0ltz
 Q3VV69cWy6vhKp8wpdgvAIaRGqRFy4L9jzwt2ItNvMbT4UvZznX6PtOsT
 ftp3QxnW6PDVijEjSTFIND0Vpsu2UBB6kjXLI7Qe5hw6Iic3F3Avxuepe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="340002470"
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; 
 d="scan'208,217";a="340002470"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 20:00:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; 
 d="scan'208,217";a="641956765"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2022 20:00:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 20:00:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 20:00:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 2 Mar 2022 20:00:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ci2jo/wJRsdMkDgFbea0blBjxEzn1qjyeu1GwdIoEGpM8y2cNifACa6oPLR4DYSP8ykhplwsoj34k2odH1dxQe8p2i8YvNtDHiln3NRjIRzu3SYtA6/qBMdoaA4D8GG64JXEbVdOvpMwVy/yRRI7T1oW/HX2WQxdW0Ew9v2U1Qw0DJdw2E/xuDvpdGWP1Pt00U9txln5OomE/rTA1VdQiz6YibLYgPC3nIwdAgZtVSf5G7pwBzfsNHJEqZ1y3UGhTFa/u/lJneu3JXiyLsejOP6E84UgkYr1HsbnOM3pHhqv4EAoWohY8hRjpf9hiI2wBgW9jSZxwNWXDPnqEXVwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxtduOt50GE4oq4FlZTDmKpl4qwWZwsUx9U8X+3q/VQ=;
 b=Ec5X3/eXXCAtyueLZ8u/7DWz82uTAM8eGxJu4EmMpacLPk/vlnts2LV67z4RjeCuXb/u19wL+mUOhvL7j6zUjkc4mpmOD7pu6dxuqOTd6f/HaRzbTV9q+MuRukyNo8TD13wv2IRUCjXqN2PBijqNbEDKRIbx/p9YcWphVkhmPdtoDkNHUqrqpFn7dFE+7VxvtiLIKCUAbNleieSlwaPWnP9gHjlHEwoZTdJfweL6iBzyJMPBsfb1rV9YzpnEuTjilV1FKetkBjidLTSBDU3TNd0HLu+s3+OIlR2UqEq/m28Nd4Y4h6oB+s4S1E2FcYQJ1YoNmLqo049ig4BuLsV5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 3 Mar
 2022 04:00:08 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::c1d8:7c57:1116:ea21]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::c1d8:7c57:1116:ea21%4]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 04:00:08 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Wilson, 
 Chris P" <chris.p.wilson@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
Subject: RE: [intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
 (rev3)
Thread-Topic: RE: [intel-gfx] [PATCH] drm/i915: avoid concurrent writes to
 aux_inv (rev3)
Thread-Index: Adgusc7lyfMRKENvQFmXL1VE7D938A==
Date: Thu, 3 Mar 2022 04:00:08 +0000
Message-ID: <BYAPR11MB25675EEBB0DAFAF1916B2C539A049@BYAPR11MB2567.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a05ee8d-e582-44c6-b5a7-08d9fcca4eb9
x-ms-traffictypediagnostic: SA2PR11MB5020:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SA2PR11MB50206F4F7C58EA0C7B37EAD59A049@SA2PR11MB5020.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRNO8kn8zmGkb46GuFNBItwCDsAtcem9VVf16GFqv0Dauf9WB3WC/P73oxO8vYS1fL24TChvZgUFH4l0QyCmsDWGd2WJvqcxnqMswpxmW2hYRuSREVE5or0YX7A08GgDyIYBsIP+doCG8xqLO/drzH7MWPS35v9EdFoQROgOmZrIdtN3BYnULZkWBIK9iYWyXaq3rHJXxNLNXBg1nOZCMag2M9ScxPrBTnmHLJijWxOYqnqjPdAGuEuZrnLKyaZ3OBzBcHnP2XvQPQ8P/Nqpf655LhRBRlBx67LrVeP4ybD1JYPylglUaMKgDexCwzSIIEdtPgIuSxgTJBZXYgHjDeSJJLFTO7Tu3EPf7UdXCHRyoHoxyUBN3N8Q2rfX2EzUnEgGOypldfzXAtXHQ4AsT/RaYGALAZuUlC1ZucE2pjOCtxDq9nq0jhD8Cid4G+qlYS68JP9N8fLmKOmVbmhr6okkzRwKEB1tqj9aT3pDS0OOLJGyfWHcNw6RvraSw6UlSpzWoErxmp290141fODdVJ31bqn04gt+GFevYN4Tup2fHWOFFPoEQVh79JPw9CCYrqsmleL0IM6ggopgt02Q9zXWPEVK1H4gnndRb957OAYzKb6jCAu3G7ChH0iaFJFvB81PSFosoW+URp1lb/sfOojJG/5FiAL6ujjvig9r93xiUkoofP5uxARBBHn133attTS1x5lIWDqhxnS/WW6TUg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(7696005)(508600001)(38070700005)(6506007)(71200400001)(450100002)(66946007)(8676002)(66556008)(66476007)(66446008)(64756008)(86362001)(110136005)(6636002)(316002)(82960400001)(9686003)(83380400001)(122000001)(186003)(26005)(38100700002)(52536014)(5660300002)(2906002)(8936002)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YcCSE6BXEpS8+NI2aiN9BD8EQv+qnUpCNyk8jrAe3q9Dq18BWjGG05cPTYVg?=
 =?us-ascii?Q?1I89pUwORfafhYsgP0XamoLFLkpbgi0RzfYt1LVo+VejUg1R7ouGE3RFi1iI?=
 =?us-ascii?Q?/PLjAtHwjtkxO738xXI46RCnIJgodfFsfxNvHHHOtOzaCaNpqFFgp30eQnMe?=
 =?us-ascii?Q?+w56gGMb3z3UhdLXVfYQy1/sBzJj4fB86wNMDlHVpai8WR1wjwf4oku9eO2s?=
 =?us-ascii?Q?ck1Wi4i+wKZzN61Jx93C0zd0cAXfm8KBjSCtyK3OD/a1+YUkG9ZBqtvEGtoZ?=
 =?us-ascii?Q?91iWIiWKBMhJBuJvH0dG048eYE3un9bKp9phGeYGA0g6caTrxhVDD3zqFIqV?=
 =?us-ascii?Q?C+htV3hD3kJNebshmHAVzlBMdVEQdFZHsc9WH6cEHQJY5gvdY9nFBUhZKAs3?=
 =?us-ascii?Q?F+ECd5rCzuL91kHSHFNOyHaNWah3ztqlOwkWVgx660fMrzNdr32dA7/btwVj?=
 =?us-ascii?Q?AIbcQ7s/D3Zis/QNUGECGtvnuvygXZSSdus669CZlwXcz/XqPFmGK0r8vAhB?=
 =?us-ascii?Q?RCQWeM9X4UXDYfWouFxcGCzzw5KRe+Oj4T/L24MDdFLEa+5LRdhd3ghiRi9i?=
 =?us-ascii?Q?6yc4OkQU/BdlAU5lCo0BZrEucmfKzFflaH/9TdRxItbytMjbegXeNx8TvWZ5?=
 =?us-ascii?Q?xvR0+79zxtV0ogEQle7mQNX+en/f1o6JHnjaW/CAYPkupPENy2NqSGX3wD6h?=
 =?us-ascii?Q?cVtwfcoU23NSoQyfxJtFd+IJgWz132NxuTYgJQ1x90DUGXjDkV6/f5FPktVL?=
 =?us-ascii?Q?mxqjQtlf2Hu9Np4X2aMF6S4mlFJc7VLuC45SAWYHGzhTzzj056+7g33PzMqc?=
 =?us-ascii?Q?o0ui3FakNFayM6HM3VFMq21Ydm4dACowpjcfgAPpc9v+eZKBvhZxOZ0Qpveo?=
 =?us-ascii?Q?/Eqovdt7efXFXMuZ2N/at9lMXE2WO7hlJuYPihrkf0Ju/A5cBkE7c1DQHXW3?=
 =?us-ascii?Q?u5a+HXePYCWVk047KxvDdstmloGh3PdW7hUvcboIV6v+w+5NMkFAsoH2CYK8?=
 =?us-ascii?Q?uBQ31LfGAodR3c6qKsgpDaxQP/V6Hhjni44kUTyBYvjLZJClK/l6hV7ulkDc?=
 =?us-ascii?Q?pIq0+kn/nv1++lW1IEudYErffaPNKTTMv6XjW6e27TqgM1JWib8C1dzD9MMZ?=
 =?us-ascii?Q?dZcCZtR/molE93yuWnwYLgRVe+mFu6+zw56FxPN5Hp+BpXunjbltWeXMGXtx?=
 =?us-ascii?Q?CCuKnPkXvgkxExbTdGl/mTDS9O7BZBaRmgSEgXTesNAPch4tst1hPwOIs5tZ?=
 =?us-ascii?Q?gv03TB3Y05meV9o5ow8pX8Py5OmfmpjQTgm5rHOxgcEeGa04h9+9xT6ishrx?=
 =?us-ascii?Q?tVaHVABduCFa7RY3uSawXrqRtO6vO7r1UZYiusuDhQBdCGfVDwZ57VttXwwK?=
 =?us-ascii?Q?eoDgJdJu/HTUI6IKbnQZggJDuqaWWQ6An2HfC6AQ8hW1o/adESuX6Ikl22xM?=
 =?us-ascii?Q?On53spxzPFd4oGGxuQ/mE/t72r3OVCN9GPvTkh4/S0eJ/K21IHoi5xSEWEKS?=
 =?us-ascii?Q?eBDfHTDudp5NUiVSnrZELfalBpDSxU5KCKfnn4VsCStOD0lHdnV2e7VqxxbK?=
 =?us-ascii?Q?FF6OV/vsYte3rP68T+nl4FIz749/hAyW+lRUMGcRKsT0y71/83ZQSEjLf4le?=
 =?us-ascii?Q?Hw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB25675EEBB0DAFAF1916B2C539A049BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a05ee8d-e582-44c6-b5a7-08d9fcca4eb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 04:00:08.2772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CiFHqkqMO1bJaVGmOsVa4cNPZI7aGFr9w/RCQgL+S3S1NZNvYpF0hyAuLke9p/nEaTF97027IAYaeXSZfAQ9jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB25675EEBB0DAFAF1916B2C539A049BYAPR11MB2567namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Chris, for some reason I didn't receive the review email, so I copied yo=
ur comments from patchwork and faked this email.

>>  static void execlists_dequeue(struct intel_engine_cs *engine)
>>  {
>>         struct intel_engine_execlists * const execlists =3D &engine->exe=
clists;
>> @@ -1538,6 +1566,16 @@ static void execlists_dequeue(struct intel_engine=
_cs *engine)
>>                         }
>>
>>                         if (__i915_request_submit(rq)) {
>> +                               /* hsdes: 1809175790 */
>> +                               if ((GRAPHICS_VER(engine->i915) =3D=3D 1=
2) &&
>> +                                   rq->vd_ve_aux_inv &&
>> +                                   (engine->class =3D=3D VIDEO_DECODE_C=
LASS ||
>> +                                    engine->class =3D=3D VIDEO_ENHANCEM=
ENT_CLASS)) {

> We do not need the extra checks here; we just do as we are told. We only
> tell ourselves to apply the fixup when required.

Without checking GRAPHICS_VER, I'm seeing a lot of regressions on older pla=
tforms in the CI result.
This workaround was only implemented for gen12 (gen12_emit_flush_xcs).
Without checking engine->class, I'm seeing boot issues due to GEM_BUG_ON() =
in aux_inv_reg().
Any rq will go through this code regardless of engine class and gen version=
, so the checking seems to be
necessary.

>> +                                       *rq->vd_ve_aux_inv =3D i915_mmio=
_reg_offset

> Likewise, vd_ve is overspecific, aux_inv_fixup or aux_inv_wa (or
> wa_aux_iv, fixup_aux_inv).

I wanted to be specific because the workaround was only implemented for vd/=
ve engines.
But I'm ok with your proposal.

>> +                                               (aux_inv_reg(engine));
>> +                                       rq->vd_ve_aux_inv =3D NULL;

> Move this to i915_request initialisation so that we only set aux_inv
> when required, which probably explains the extra defence.

The pointer is currently initialized with 0x5a5a. I set it to NULL in gen12=
_emit_flush_xcs, otherwise the rq will
enter that if-statement with an invalid pointer.
I'm not familiar with the code, there seems to be multiple functions alloca=
ting the structure. I agree it's better
to set it to NULL at initialization, but need some guidance on where is the=
 best place to do so.

>> +                                       rq->execution_mask =3D engine->m=
ask;
>> +                               }
>>                                 if (!merge) {
>>                                         *port++ =3D i915_request_get(las=
t);
>>                                         last =3D NULL;
>> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/=
i915_request.h
>> index 28b1f9db5487..69de32e5e15d 100644
>> --- a/drivers/gpu/drm/i915/i915_request.h
>> +++ b/drivers/gpu/drm/i915/i915_request.h
>> @@ -350,6 +350,8 @@ struct i915_request {
>>                 struct list_head link;
>>                 unsigned long delay;
>>         } mock;)
>> +
>> +       u32 *vd_ve_aux_inv;

> Not at the end of the struct; that's where we put things in the dungeon.
> The selftest struct should be last; I do hope no one has been putting
> things at random places in the struct without considering the layout and
> semantics. From the flow, this is akin to batch, capture_list; before
> emitted_jiffies would be a good spot.

Got it, will change. I thought adding at the end would be safer, thanks for=
 the explanation.

> -Chris


--_000_BYAPR11MB25675EEBB0DAFAF1916B2C539A049BYAPR11MB2567namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Chris, for some reason I didn&#8217;t receive the=
 review email, so I copied your comments from patchwork and faked this emai=
l.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; static void execlists_dequeue(struct =
intel_engine_cs *engine)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; struct intel_engine_execlists * const execlists =3D &amp;engine-&gt;ex=
eclists;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -1538,6 +1566,16 @@ static void execlist=
s_dequeue(struct intel_engine_cs *engine)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (__i915_request_submit(rq)) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* hsdes: 1=
809175790 */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ((GRAPHI=
CS_VER(engine-&gt;i915) =3D=3D 12) &amp;&amp;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; rq-&gt;vd_ve_aux_inv &amp;&amp;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; (engine-&gt;class =3D=3D VIDEO_DECODE_CLASS ||<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; engine-&gt;class =3D=3D VIDEO_ENHANCEMENT_CLASS)) {<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; We do not need the extra checks here; we just d=
o as we are told. We only<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; tell ourselves to apply the fixup when required=
.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Without checking GRAPHICS_VER, I&#8217;m seeing a lo=
t of regressions on older platforms in the CI result.<o:p></o:p></p>
<p class=3D"MsoNormal">This workaround was only implemented for gen12 (gen1=
2_emit_flush_xcs).<o:p></o:p></p>
<p class=3D"MsoNormal">Without checking engine-&gt;class, I&#8217;m seeing =
boot issues due to GEM_BUG_ON() in aux_inv_reg().<o:p></o:p></p>
<p class=3D"MsoNormal">Any rq will go through this code regardless of engin=
e class and gen version, so the checking seems to be<o:p></o:p></p>
<p class=3D"MsoNormal">necessary. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *rq-&gt;vd_ve_aux_inv =3D i915_mmio_re=
g_offset<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Likewise, vd_ve is overspecific, aux_inv_fixup =
or aux_inv_wa (or<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; wa_aux_iv, fixup_aux_inv).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I wanted to be specific because the workaround was o=
nly implemented for vd/ve engines.<o:p></o:p></p>
<p class=3D"MsoNormal">But I&#8217;m ok with your proposal.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (aux_inv_reg(engine));<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rq-&gt;vd_ve_aux_inv =3D NULL;<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Move this to i915_request initialisation so tha=
t we only set aux_inv<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; when required, which probably explains the extr=
a defence.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The pointer is currently initialized with 0x5a5a. I =
set it to NULL in gen12_emit_flush_xcs, otherwise the rq will<o:p></o:p></p=
>
<p class=3D"MsoNormal">enter that if-statement with an invalid pointer.<o:p=
></o:p></p>
<p class=3D"MsoNormal">I&#8217;m not familiar with the code, there seems to=
 be multiple functions allocating the structure. I agree it&#8217;s better<=
o:p></o:p></p>
<p class=3D"MsoNormal">to set it to NULL at initialization, but need some g=
uidance on where is the best place to do so.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rq-&gt;execution_mask =3D engine-&gt;m=
ask;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p=
></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (!merge) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*port++ =3D i915_request_get=
(last);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last =3D NULL;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i915_requ=
est.h b/drivers/gpu/drm/i915/i915_request.h<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index 28b1f9db5487..69de32e5e15d 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_request.h<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_request.h<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -350,6 +350,8 @@ struct i915_request {<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head link;=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long delay;<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; } mock;)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 *=
vd_ve_aux_inv;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Not at the end of the struct; that's where we p=
ut things in the dungeon.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; The selftest struct should be last; I do hope n=
o one has been putting<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; things at random places in the struct without c=
onsidering the layout and<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; semantics. From the flow, this is akin to batch=
, capture_list; before<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; emitted_jiffies would be a good spot.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Got it, will change. I thought adding at the end wou=
ld be safer, thanks for the explanation.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; -Chris<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR11MB25675EEBB0DAFAF1916B2C539A049BYAPR11MB2567namp_--
