Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4B4227F0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 15:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA516E3EF;
	Tue,  5 Oct 2021 13:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83D86E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 13:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHWamEuwvq9QI3qlNud+nVo3zJDIr/Ix3cS6xZWSs28rl+KENfM1PclrFg9N16agSjn+XfoOhNEwHkpk6oO7TtTeONHUjZDeh3PHa2a00fuNeUBkvrZs7aXDRLMG5VJ8SWTq7L91/ofkQJv6dV5zLNW3Zp3/gw12NzwbfAFDoWrZ35TuNbbg6w284FKVHnb82iMCyPegBL18Jp8i4I/TxaquoJz38aToUtnw0h1Kl31KWpamFRMr/ZScV0qDIIFa5Sx3WjjhX6MXzdPQNz4rQNM8DKNtw3IKyelFjvpudw1dJ7cbIBgbCpZ4W5t7gN6lfLcxJry1IBQkVh/dHj25Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEu6p/5kon9t2pf1pT4bJGeTQxg+g3YOuuKfN8vwqV0=;
 b=TP5CvPzsDUBz0ee//L3aBr8sh350LzwQkoJlkj5Nl99eHqY33tj2ly0qZIjnVGQZzj9U7wodVFEUX+/J46i1CrdqyCCLaaS3KenBTCQGjtqQRejENUm1EtRCasttKYpG81pxvqachI2EM0fnTBKh681VO8p2AyHx4EWSbxJu6A9VJe43f2ti/Gk4L9rxEMPGDQFEiQK8m2WfxxlsTCfSLN33EXGDsjsCEoRX/6x0X3FiGJ1Qf+WzufvA5RA8bCanktf9VAj3nTLe+uSXQ80wXxE7fPPJ8/ajEu/vBDFNWK+nz6VBO1NU4I4nnlPXwEXsMAgGhSdHfkARxYoRAk+j2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEu6p/5kon9t2pf1pT4bJGeTQxg+g3YOuuKfN8vwqV0=;
 b=rldvafjXSJzdh1wTaaTahOnL0MjbsHfDE4w/B5BkIb1ZOEFr6J4pnBJYZEmRVxIynKD4rmHPLt0RH46HdVibKYepoxxROLTT3vTOMMilKF7148AYScN2EsxD9MX3BnOK1vbEvWVsDZ7g8wsOHYWUuansscJyadMJUKtsTyM/dUo=
Received: from DM6PR12MB4912.namprd12.prod.outlook.com (2603:10b6:5:20b::24)
 by DM6PR12MB3644.namprd12.prod.outlook.com (2603:10b6:5:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 13:33:23 +0000
Received: from DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a]) by DM6PR12MB4912.namprd12.prod.outlook.com
 ([fe80::81f5:b123:f485:e51a%7]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 13:33:23 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>, "oliver.sang@intel.com"
 <oliver.sang@intel.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Sam
 Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>
Subject: RE: [PATCH] drm/edid: Fix crash with zero/invalid EDID
Thread-Topic: [PATCH] drm/edid: Fix crash with zero/invalid EDID
Thread-Index: AQHXuVhR2MkzGJ154UiIxDl4KkcjuavEZ8Zg
Date: Tue, 5 Oct 2021 13:33:23 +0000
Message-ID: <DM6PR12MB49127B8B63079E6533197EA6E5AF9@DM6PR12MB4912.namprd12.prod.outlook.com>
References: <20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid>
 <YVtZstInQxXfPmsZ@intel.com>
In-Reply-To: <YVtZstInQxXfPmsZ@intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=42eef3ab-1206-491f-ae02-620214db2f3b;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-05T13:30:58Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ed22681-67dc-4ce8-4897-08d98804b438
x-ms-traffictypediagnostic: DM6PR12MB3644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB364499320C0CF841AEDE2D72E5AF9@DM6PR12MB3644.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:216;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 62sCCOqQLQf73thSfqmBGM4eRV8o/ivJvuImcpqxjQt+baAzIlGuKBZKZQKi/mTCOBSC1QkTbIl40XLDVOuag6A/gpUjEvtB76l1tAC9uDT81RzKsSi/PvS3yWnUWNm7dT65XhCCSr2vbK9RheQ2btWb7g7WbvU9c3TypROM8GnwJWEHz9dhLH/CXB9SVntIe5lZRwjPhM06m/jsUPedmXdHpHQ0GEM3U8w6eQsNy3z8kVrjSNVRKLuEt9Iwyb2j6eqLATm4V/7XDvt0hd0lzeimtO8N0z/ujbi+DnsDELsQ6ml85PfFf5ikUOlTIr+qAYrNeEQcaEJagobcJTKceYXP2U+QH0dP76PsD3TitICQ3gb813NFZ+d/sXlsDbxnRbv2eHteQ6TiUhhcoTt0yCtmcs86dEo/11gT16BaBRwRiF9kownJetGgIUBVcbn0B3a/XaS6LBfOKnGIZL1FNSGyU/nY+QEzdK0TWqf1q3LjPAV2eWMzEhM9s7RUupLtR3Xo+5rez/OijDsR6D+pxPHLiyfYwPOkDRknhKS2CVXUDgOurdxKAPv/8kbs+tIOL3apABTisr0w38n9MPjMJ90HP/HgWjQy5zkh5NKJtNkAb58EUPRRF9ee+JHE7AFyVcjDnLtCFsJJVV8eCcoSS4ClWxmTZ0yldKbjCT1JUooCXvN53+4fCtLWHxC+Dn920uHMrp+3CvBUJGC3re+UJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4912.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66946007)(64756008)(53546011)(54906003)(71200400001)(7416002)(5660300002)(76116006)(7696005)(8936002)(8676002)(2906002)(33656002)(4326008)(66476007)(186003)(52536014)(55016002)(6506007)(9686003)(66556008)(66446008)(26005)(122000001)(38070700005)(508600001)(83380400001)(110136005)(38100700002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fFo1mxx1OhFmVewGlpVFRB59gv+ttjF4CmRWamk0TKQSFeLYP8L2a+WcI/?=
 =?iso-8859-1?Q?ta4JQANliq8DqHtH5BnJt/4ve5lTp4/9vIZxnc+nabZBZQZNFayFGxefgk?=
 =?iso-8859-1?Q?qjwiY/XdbvjK2+/eppR3BLfNKVJFFT/WBS3q4bZlfo19WIKceaYXg+STHD?=
 =?iso-8859-1?Q?CHU0a/zmT+7Vk5bM5batywcVXK/1WdQxucFtqQm6v3h1GEuIVKGsWZQvqQ?=
 =?iso-8859-1?Q?UYTCm3e/pJFY5bhhGBVCxCEsG4UfLkery0h6hOwLdJnil3tPtinwnetTTq?=
 =?iso-8859-1?Q?HcxXPQOfi2Nk4LS+6hnhbLKkBBBd9x+j21jB8UiFxw9qPtQV/MRSCAcOiB?=
 =?iso-8859-1?Q?0eeuhVd6cS5x9Xiy8eCKCDtczoKED8Ro7qslpf+qceAk1Pn+suX4yUS32b?=
 =?iso-8859-1?Q?4lUULknUO1lBRAFdHCrgbpXk0rvO2/0PezeFP0T06gkq9CrOXJ9bNuBonb?=
 =?iso-8859-1?Q?u+O1AmgvhR/VhhctofvbiFP3ThIjCVd/1idAkrijlfb7e1FXceLxKAS1dL?=
 =?iso-8859-1?Q?nTOtn3KS9dIsT6aqL5SZYWChxMD60Yk46L14T+uOEp7YFTu95FdwVYduzg?=
 =?iso-8859-1?Q?8Q7uN+Aejcsz8x1StZlbpxb8znKw1VTyo8P/68dTTvFMgJupbunlBvT9l9?=
 =?iso-8859-1?Q?s+vQNxEsEDJ1Ith0gFoHXjFUSOukh7apUrO8MCfEWW86TuHdWQVBAlFTLJ?=
 =?iso-8859-1?Q?oBsD4kcNMpjaG60x+MOyrpBVmOqGHyMlir2SIc8P6wOcnB1P5Y40566ZoQ?=
 =?iso-8859-1?Q?x9lHtHOf+pPzJBTuCCc6glGxTrvTp2VR3hx4aJAGBoHixRkCYO1sLIJwnx?=
 =?iso-8859-1?Q?sEdRk9xB1rdQhJquawWfrwWekgD7BeehyRmPfKEtLcIP96Ietr8MQ6+fvO?=
 =?iso-8859-1?Q?y9XQJc/NsaKb6EfIYGqS1Ph8OSbv7n/9RKg7LRYBI4WDX4PFG94GpxOjPh?=
 =?iso-8859-1?Q?9lxcE2yrCZRBNuoagP3ISnx3AHirbJ6REDLoXAQt5m8Ujii0GI0s58zS5e?=
 =?iso-8859-1?Q?N3u9Iuo03q0uo9O4p94pIm7Pa11nukg88W7U5OpVshd3vgABUvU4hOLhLI?=
 =?iso-8859-1?Q?x1oPkONknmREUNg0KB1brceSUrbgDud2ZQGpKYkqyNWpgxHye2PK5h+NPC?=
 =?iso-8859-1?Q?HLa8k7y5sC06nFyu/o9mZIV3YHUVjSWKSA9Vd2wm4pDOqIFXrH2b0abOGg?=
 =?iso-8859-1?Q?1TlZEA52cvDjsLy2770m+kxOS+jhWNoacLT3Kr+1nnC2p/68CcfM0bU283?=
 =?iso-8859-1?Q?8ABie4f/qfzrz/5VFtwxAl5IB31iLOESmwZOPiypNSzWfypGG47QGrCqB9?=
 =?iso-8859-1?Q?VqED5/Y0FQNwBYqbvx4M0v6vWkNWnYKR7BfIhXLvM4AeN3PzUNnkofZfgZ?=
 =?iso-8859-1?Q?IYGHAOUeoM?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4912.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed22681-67dc-4ce8-4897-08d98804b438
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 13:33:23.2419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ASRv3rKtO2c3IW0Ln7XyUf/i12WTpjj4WzEHIYuvo2j3jhXiEss6ajJ6esqI98QZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3644
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

[AMD Official Use Only]

Hi Ville:

     Yhea, it is pretty old change from two years ago, and it is no long va=
lid anymore. Please simply drop it.

Regards,
Jerry

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: October 4, 2021 3:45 PM
> To: Douglas Anderson <dianders@chromium.org>
> Cc: dri-devel@lists.freedesktop.org; geert@linux-m68k.org;
> oliver.sang@intel.com; Daniel Vetter <daniel@ffwll.ch>; David Airlie
> <airlied@linux.ie>; Jani Nikula <jani.nikula@intel.com>; Linus Walleij
> <linus.walleij@linaro.org>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Sam Ravnborg <sam@ravnborg.org>; Thomas
> Zimmermann <tzimmermann@suse.de>; linux-kernel@vger.kernel.org; Zuo,
> Jerry <Jerry.Zuo@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>;
> Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> Subject: Re: [PATCH] drm/edid: Fix crash with zero/invalid EDID
>
> On Mon, Oct 04, 2021 at 09:21:27AM -0700, Douglas Anderson wrote:
> > In the commit bac9c2948224 ("drm/edid: Break out reading block 0 of
> > the EDID") I broke out reading the base block of the EDID to its own
> > function. Unfortunately, when I did that I messed up the handling when
> > drm_edid_is_zero() indicated that we had an EDID that was all 0x00 or
> > when we went through 4 loops and didn't get a valid EDID. Specifically
> > I needed to pass the broken EDID to connector_bad_edid() but now I was
> > passing an error-pointer.
> >
> > Let's re-jigger things so we can pass the bad EDID in properly.
> >
> > Fixes: bac9c2948224 ("drm/edid: Break out reading block 0 of the
> > EDID")
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/drm_edid.c | 27 +++++++++++----------------
> >  1 file changed, 11 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 9b19eee0e1b4..9c9463ec5465 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -1911,13 +1911,15 @@ int drm_add_override_edid_modes(struct
> > drm_connector *connector)  }
> > EXPORT_SYMBOL(drm_add_override_edid_modes);
> >
> > -static struct edid *drm_do_get_edid_base_block(
> > +static struct edid *drm_do_get_edid_base_block(struct drm_connector
> > +*connector,
> >     int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> >                           size_t len),
> > -   void *data, bool *edid_corrupt, int *null_edid_counter)
> > +   void *data)
> >  {
> > -   int i;
> > +   int *null_edid_counter =3D connector ? &connector-
> >null_edid_counter : NULL;
> > +   bool *edid_corrupt =3D connector ? &connector->edid_corrupt : NULL;
> >     void *edid;
> > +   int i;
> >
> >     edid =3D kmalloc(EDID_LENGTH, GFP_KERNEL);
> >     if (edid =3D=3D NULL)
> > @@ -1941,9 +1943,8 @@ static struct edid
> *drm_do_get_edid_base_block(
> >     return edid;
> >
> >  carp:
> > -   kfree(edid);
> > -   return ERR_PTR(-EINVAL);
> > -
> > +   if (connector)
> > +           connector_bad_edid(connector, edid, 1);
>
> BTW I believe connector_bad_edid() itself is broken since commit
> e11f5bd8228f ("drm: Add support for DP 1.4 Compliance edid corruption
> test"). Before we've even allocated the memory for the extension blocks
> that code now assumes edid[0x7e] is to be 100% trusted and goes and
> calculates the checksum on a block based on that. So that's likely going =
to be
> pointing somewhere beyond the base block into memory we've not even
> allocated. So anyone who wanted could craft a bogus EDID and maybe get
> something interesting to happen.
>
> Would be good if someone could fix that while at it. Or just revert the
> offending commit if there is no simple solution immediately in sight.
>
> The fact that we're parsing entirely untrustworthy crap in the kernel alw=
ays
> worries me. Either we need super careful review of all relevant code, and=
/or
> we need to think about moving the parser out of the kernel.
> I was considering playing around with the usermode helper stuff. IIRC the=
re
> is a way to embed the userspace binary into the kernel and just fire it u=
p
> when needed. But so far it's been the usual -ENOTIME for me...
>
> --
> Ville Syrj=E4l=E4
> Intel
