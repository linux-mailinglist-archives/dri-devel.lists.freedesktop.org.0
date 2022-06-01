Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F6B53A1A5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 12:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDE010EF1E;
	Wed,  1 Jun 2022 10:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE25A10EF11
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654077772; x=1685613772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=9Lk1whWhOUkLo3UF/eir//CEMWDV/DjVqxlaVgM4xP4=;
 b=WmfmGdEMvgTw4EhecXJjeNKOdQK5wFon7siTNirsq3y17oHHXkaser1j
 67k3NiW/jJEU1CPKWFI3OPsqUOIydBqFdJLS0HUnAk9SgPi+1MK6AqPCh
 29iMVsNT398cnErp012pef7T/ab4376+bN8GA1brB3nf8L5p01rXNBI8+
 BwIRpSMuMe1Iu0qi6dsDJoOHgrQHsx5IJVCDf/TVS7RTQ9SokR2RyGhB+
 dxTqJ63YXg+bq/7L6FcIWylgmfUJGRC9gjNdMXTq6CUmmPefGDulImqwC
 RkWX97b66oIgo33SYkkKJYNbyjFXQEKijR+ilJPmPc7QiYWqHTjxVTd1M Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274338918"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="274338918"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 03:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="606182768"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2022 03:02:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 03:02:51 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 03:02:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 03:02:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 03:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbD7YcCIHJIQ4P2XRqG1fX9BWozNXcHINUrG61/GRJg9hhlTxTq2kJuInZ4LvYSz6BXxK+UtDY6aQgOekT0wxgN5bewFjjDXPik7C59fmd82mER2ewuFTOX7EDNTKIkI/k/aIOQnzZ95VkERjJa2A0GNf/qV3ijJd3eOOtG+gAVI9buwSNHXK4Wc2WEvaiL0z0YNczvfcwEyc3QjlZZ9bk3rCB4RUGbB/6pvzcLSKNPAQ2s/PD4KWgAqLzbK2OMMW5wCuueeMhzemNLW/Mqb5CGnXtGCIuTWKT4oL9rDVn3RI/EUuMhC/qwjAWoTIuURskI1T+RBTN6zqgyq1XqHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHkKoWaobIJHskAsmacBEwPE+YAGbYWe2exvhNiYucc=;
 b=ifBuGTizk2g6veALzagraMxSVJtDU4q1c/ET8CFV9eTVtceSt6T24rZ+PJYI6/WGHQtrF0mQ2AtdruhKHcdajjS0coB7O9LvT7FaaE4922RZNfhEPlKZKnStwHL5KTK2ibMzetytpfFBPik3lJATI7OyBGo35JRJmt00jKxM2XSxe7vc8oEYxyClpCom8DYJ/wvth3nVDxJO4WhbaA1axiyQ352rDkKs5aQNt54oWq3DIasX5I6MRVul4hIayNKmJ47jSPRZdP2yRtQ08+cna8rlybUEyqQ0/SXbG2ZEM5nLV4bp1XTfpFCOAgWVuHwbgsEmA2jwKcuwjCka7aeMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 10:02:49 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 10:02:49 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Index: AQHYdNoDFbj7+FwOkEGNuWjZxEpXuK040FOAgAAC7gCAAXOfoIAACz8AgAAApXA=
Date: Wed, 1 Jun 2022 10:02:49 +0000
Message-ID: <SJ0PR11MB5894481CA92698368544C7C5F1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
 <87y1yiq8ce.fsf@intel.com> <87r14aq7ux.fsf@intel.com>
 <SJ0PR11MB5894EA0FF4363714AE3BC029F1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
 <87ee08r9jx.fsf@intel.com>
In-Reply-To: <87ee08r9jx.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98b08f71-1633-4921-e3eb-08da43b5e2ac
x-ms-traffictypediagnostic: DM4PR11MB6262:EE_
x-microsoft-antispam-prvs: <DM4PR11MB626240AF4C7D8BF6566A611FF1DF9@DM4PR11MB6262.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cFfiqCWUpUNavJBeiDKbLb/3QGqJ1zB3kAj7Uw+eIudUSe/e7FrvuDOjV9czvjEeB97S3nojxz1K1aL4Nu4wxwrJp6oAKPsFXWHyew5w8NyNtf7fiGNTdhQRs01yRrK11+UU1ucX68ng01CcDm3zeUYFZRp+Nq56H/BJ8lu4+kyaItMPhyT53It4ufQ4rXHZCC7PuBGA+Jfju4v1VepLDXMF2iY1VKgDhKZlT8D9+8en8Rp8VHuaK3v7k/33t3YUrN2OD6xqdUhUzkS5btK91bPSl/AKppgpx2Xx8bd1Cdb1Zg9IdAjCH7Tq5xga8qf+fGoyNMPGDLR2N+23xFHR8NQq8VxaE7pTzwvN1Yv6ZBj3m/CfXtPxvKS2Y0LcnBRFmHl3qgIbtnJycgr0knSzOSUL5xXzwLfEhuYPrJGVbdyGAyRGrUX7zky2GIGYPaBzFGU9jYb5QPsH9eFyOIroMpt0kTnX2CsDHH3Pm1t3xJuWQwrWlRhYukC5EaPC+FeYPLc6Z6veXj88uomxJ32L8LfCx0KDvh96twjSqtVE1G1n4zsWgG6CxwhsKZesdhPnWHJ5Mo2FoTIvbVbKslEJsGiHI0mHQhKZg1/jOp8FI+Hap7JVSu0hxE4nQGEDYui9ucIHwrUEO/+A1FwSQ0Pm0irqrMLTwYzdn789IMYAoMf4TZV7JJQ5Frdmc+7Hg3CoMl0Lf24nsn08fd6pa+MQeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(33656002)(8936002)(508600001)(966005)(8796002)(5660300002)(38070700005)(122000001)(316002)(110136005)(54906003)(71200400001)(76116006)(66446008)(66476007)(52536014)(66556008)(66946007)(64756008)(8676002)(4326008)(66574015)(53546011)(86362001)(82960400001)(7696005)(83380400001)(6506007)(9686003)(186003)(26005)(2906002)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/8AyQj4C5yKriKJCFHEvEe61FPyuQ90JzZ9yM/9+bk1xmbGwnP6olYSyQ0?=
 =?iso-8859-1?Q?+8gs9DsmyyuaAObbKnEsaTkWetEBlqAPqem//Yo7Cb3AVDj9pGn9BayBai?=
 =?iso-8859-1?Q?8vRKDKgNQW2T7QxS6xjMZpp19vfB3xUoVW2nJAeDqu+XPuPwDhwGPvUltT?=
 =?iso-8859-1?Q?uMK1gJokZmSY6ojCz/mwLpBHHXXbiVvGpQ1DcjZzuV9ZyR1ZkJosYu1iON?=
 =?iso-8859-1?Q?uYqb4t36x41C88TqmQFTEEVeID8HkAhihoAi5UMjEVrNgK6KcB7CehWv+p?=
 =?iso-8859-1?Q?u3q6V1HolRIIx49OBD4aBsqx+lIo8B8NZkEQGyE6uce2y9kiU//0WdWvg8?=
 =?iso-8859-1?Q?NOU3eaGERsmG45Qf3OcKfZ8QKC5TeWO+6n9MwQzjCUtUvX99RVR0+OVbWd?=
 =?iso-8859-1?Q?StDyVk7QZoamcVaPakfQEX8whhu1YuXyd6xGRzTBcBN9Zq4ATRyvn+rZKd?=
 =?iso-8859-1?Q?N/GSWgdkGaZsC7/TV5HqZSCa8YVyHveITPLNUNWxugDZ82u8kWs25o9dBU?=
 =?iso-8859-1?Q?yxp8X4B3P9j7VsZfnDIKVwFwXVz4KVSDPz3zQyiObqIuT/HKZU2sPkxk6V?=
 =?iso-8859-1?Q?U5jBmWbm6Th33m/Q4Pr2aYJFSUx/KTD1+oVZceWR0ASO2Uk+Bq0Gls31Fe?=
 =?iso-8859-1?Q?9FGuO0eIIx5D80UocK4h4U4vYX57pFJR634RC9VzzpS5QuGxK4ac8IFLIs?=
 =?iso-8859-1?Q?6TSI7bKiLraIUuHp8FovLFPOO+G/eCaVuynzjtZ4Z0NbKvDYm/O/1GtzGz?=
 =?iso-8859-1?Q?cHSfw/FHUtVlTX9W+w0wgJNs+ym8gpYbnQNyEycYkbGBuNxVJcY6TM2k5F?=
 =?iso-8859-1?Q?asdUHbZENhZmXLCe+ZqTaw0mOPqhFjvyuW101R/yrZrGbFf1ZbbeF7+Lef?=
 =?iso-8859-1?Q?FclCwfgtPIDv3d6tub714ZXPo62ZJ59Al7c9L9sCOXpu+9S7ZyVhbd82sD?=
 =?iso-8859-1?Q?s3foDDCQgLuczddPK2GvJ0NeWVJe35pCkmUG6xGfpteunXh/EeHClnG4vn?=
 =?iso-8859-1?Q?/YJJnt4wmaQY+Fymqjl/NIYzmQSyrCJmSdLQCY9igl75gh1GfnBoP7wX2r?=
 =?iso-8859-1?Q?U059cL0/Odx9EWmJrUYH3Mj0eAFRZng1AV0CLJH8dijCCmKzAkiwpKf0L8?=
 =?iso-8859-1?Q?zD/wakqSg2Rp9LGgTtJC3xX/iQeSwInalAKB1xAq29EH7MiCEjhjHGkbCP?=
 =?iso-8859-1?Q?SpNKAwCXDe2sIKjqsIFDE4z4OKo5HHxmMBbudTj9XzQF/+b/5IxwpJnIgY?=
 =?iso-8859-1?Q?xL1vpsdlbV3C4/QXkMRQcgu2yqnvKhxvpTdO6w2yEr+oC4XGy5HubgqB+V?=
 =?iso-8859-1?Q?eFlVtRc//A+iggU3IvFJn/5+h8P9QKOV3IdyH9GHjU/9Zd9OnSgo/x9Irc?=
 =?iso-8859-1?Q?B+fY9iJweBzoPv1XEX+BR+zA7W8KZYXJzKAmL/i9o9JcvSGi6hpzzxIFEF?=
 =?iso-8859-1?Q?eEdfsToxWLayvLWzgaTyxH/y7YEWg6yj2ww73Vb+oGoSHMerHfcZtWDxMx?=
 =?iso-8859-1?Q?31m/LBaWyY8rcozP2cmtXL/cHXmflz0znRI5quOj5RuqgvpdsG09UHjbcn?=
 =?iso-8859-1?Q?tN8JSJiVGvqpPtNTCt7f8Tm71ORlAkJHi+7MQAKbUHFxVZ+Mzt7ondnlZ/?=
 =?iso-8859-1?Q?FQ08mFAxArfdzCc8kP4D6olHBTfevKscm8Noh7NlSQgJoeTlsYzG+fVpri?=
 =?iso-8859-1?Q?XJp470c81gbSjVbHnO7wP+6cXpN/umhdiTkn5rmtEdhTdqi4ZrjyFm4lqx?=
 =?iso-8859-1?Q?QYkDCZLbrjOiOWatRoWGgQRc1OB+fJJpmyAtCGodFRiJLKMufi7NHCkcap?=
 =?iso-8859-1?Q?riuMnhp8gg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b08f71-1633-4921-e3eb-08da43b5e2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 10:02:49.7000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KOm1YymHegofDl/HQIiUMSzLzOy/VDPs8aHm6OSXwMxSW96Z0dNMe67zS2Q5oEq/9pkCJK6An4zZ9jRvJEnCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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
Reply-To: "20220531103421.11363-1-william.tseng@intel.com"
 <20220531103421.11363-1-william.tseng@intel.com>
Cc: Wayne Lin <waynelin@amd.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Jani.  This is the bug.=20

https://gitlab.freedesktop.org/drm/intel/-/issues/6153

Sorry about my mistake.


Regards
William


-----Original Message-----
From: Jani Nikula <jani.nikula@linux.intel.com>=20
Sent: Wednesday, June 1, 2022 5:57 PM
To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop.o=
rg
Cc: Lee, Shawn C <shawn.c.lee@intel.com>; Wayne Lin <waynelin@amd.com>
Subject: RE: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-=
D

On Wed, 01 Jun 2022, "Tseng, William" <william.tseng@intel.com> wrote:
> Thanks, Jani.
> This is the issue ticket.=20
> https://gitlab.freedesktop.org/drm/intel/-/issues/6087#note_1400843

Copy-paste fail? Does not seem right.

BR,
Jani.


PS. Also, for some reason you added this in your mail:

Reply-To: "20220531103421.11363-1-william.tseng@intel.com"
	<20220531103421.11363-1-william.tseng@intel.com>




>
>
> Regards
> William
>
> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, May 31, 2022 7:07 PM
> To: Tseng, William <william.tseng@intel.com>;=20
> dri-devel@lists.freedesktop.org
> Cc: Lee, Shawn C <shawn.c.lee@intel.com>; Wayne Lin=20
> <waynelin@amd.com>; Tseng, William <william.tseng@intel.com>
> Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in=20
> CEA-861-D
>
> On Tue, 31 May 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Tue, 31 May 2022, William Tseng <william.tseng@intel.com> wrote:
>>> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
>>> higher vic than what is defined in CEA-861-D.
>>>
>>> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
>>> displayed and the video format is indicated by both SVD (with vic 90=20
>>> and pictuure aspect ratio 64:27) and DTD.  When connecting to such=20
>>> sink, source can't output the video format in SVD because an error=20
>>> is returned by drm_hdmi_avi_infoframe_from_display_mode(), which=20
>>> can't fill the infoframe with pictuure aspect ratio 64:27 and the=20
>>> vic, which is originally 90 and is changed to 0 by drm_mode_cea_vic().
>>>
>>> To work around it, this patch ignores such CEA modes in
>>> do_cea_modes() so the modes won't be processed in drm_hdmi_avi_infofram=
e_from_display_mode().
>>> And only the video format in DTD can be dispalyed.
>
> I think we should also have a bug filed on this, with the offending EDID =
attached for posterity.
>
> BR,
> Jani.
>
>
>>>
>>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>>> Cc: Wayne Lin <waynelin@amd.com>
>>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>>> Signed-off-by: William Tseng <william.tseng@intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_edid.c | 39
>>> +++++++++++++++++++++++++-------------
>>>  1 file changed, 26 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>>> index bc43e1b32092..a93f68878bfd 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -3982,6 +3982,19 @@ drm_display_mode_from_cea_vic(struct
>>> drm_device *dev,  }  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>>> =20
>>> +static bool is_hdmi2_sink(const struct drm_connector *connector) {
>>> +	/*
>>> +	 * FIXME: sil-sii8620 doesn't have a connector around when
>>> +	 * we need one, so we have to be prepared for a NULL connector.
>>> +	 */
>>> +	if (!connector)
>>> +		return true;
>>> +
>>> +	return connector->display_info.hdmi.scdc.supported ||
>>> +		connector->display_info.color_formats &=20
>>> +DRM_COLOR_FORMAT_YCBCR420; }
>>> +
>>>  static int
>>>  do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)=20
>>> { @@ -3993,6 +4006,19 @@ do_cea_modes(struct drm_connector=20
>>> *connector, const u8 *db, u8 len)
>>> =20
>>>  		mode =3D drm_display_mode_from_vic_index(connector, db, len, i);
>>>  		if (mode) {
>>> +			u8 vic =3D svd_to_vic(db[i]);
>>> +
>>> +			if (!drm_valid_cea_vic(vic))
>>> +				continue;
>>
>> drm_display_mode_from_vic_index() returns NULL in this case.
>>
>>> +
>>> +			/*
>>> +			 * HDMI 1.4 VIC range: 1 <=3D VIC <=3D 64 (CEA-861-D) but
>>> +			 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>>> +			 * have to make sure we dont break HDMI 1.4 sinks.
>>> +			 */
>>> +			if (!is_hdmi2_sink(connector) && vic > 64)
>>> +				continue;
>>
>> I'll need to double check if this is the right thing to do... but I=20
>> guess the question becomes if this shouldn't be within=20
>> drm_display_mode_from_vic_index().
>>
>> Duplicating the condition from drm_mode_cea_vic() is probably not a=20
>> good idea.
>>
>> The continues in both above branches leak the mode.
>>
>>
>> BR,
>> Jani.
>>
>>
>>> +
>>>  			/*
>>>  			 * YCBCR420 capability block contains a bitmap which
>>>  			 * gives the index of CEA modes from CEA VDB, which @@ -5846,19
>>> +5872,6 @@ void drm_set_preferred_mode(struct drm_connector
>>> *connector,  }  EXPORT_SYMBOL(drm_set_preferred_mode);
>>> =20
>>> -static bool is_hdmi2_sink(const struct drm_connector *connector) -{
>>> -	/*
>>> -	 * FIXME: sil-sii8620 doesn't have a connector around when
>>> -	 * we need one, so we have to be prepared for a NULL connector.
>>> -	 */
>>> -	if (!connector)
>>> -		return true;
>>> -
>>> -	return connector->display_info.hdmi.scdc.supported ||
>>> -		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
>>> -}
>>> -
>>>  static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
>>>  			    const struct drm_display_mode *mode)  {
>
> --
> Jani Nikula, Intel Open Source Graphics Center

--
Jani Nikula, Intel Open Source Graphics Center
