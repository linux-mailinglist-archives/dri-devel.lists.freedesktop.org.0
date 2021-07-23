Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725D3D4099
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259A76FCDA;
	Fri, 23 Jul 2021 19:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2085.outbound.protection.outlook.com [40.107.96.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD59C6FCDA;
 Fri, 23 Jul 2021 19:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3sNz07yeEIrQFRS0TymFPe8F+p5deCV9A9d6iSMlgTgbrnbT6iE+rAgCfZUiJWC8AztjZSsI4rCOQEzMjZ2TOZrBFhXilXDxnKUmW/KUmOFyDElCZxlgjzZplIBze+CJ/Zbap7dDAyKHHCUNOxZP8zRSRyawOmf5Y71x7BfOk45wA3sRVmEolnl/m7RXf2XO1BL0u+G+rBn8RMcLP5eZJxbz5/9X2rtER9u09F5Q8/qUPs/ve2MSogz+oDd/DIz+GCilWsgTREpDTv/7evy6niQNEmG3V/ovysIh4YNV0mOJqyZYMp9lFGEr0XE7Kync0+OtiLv5Q/9QpQpBY3Hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEN4Ijli6zWayt4ETUdx5XLvUgVrQT+JpSpIlAOa/TE=;
 b=mo1nLKdl15LeeS1V6WWx8pcxmHD708RgFROFYsJyDek5IT4XEDkQHHVmykSWYOWgpBmg/E4NPF/jjXHYXEqbz3+DO5KvfVovOKiFACCVYWo1D4WVpxwMgJGnlhcAbcqoqrST0W1L9cG1MP/xrv88P/RLK+7ZT9GcTvqkKnZezjRNlvsHEzwYf1rdMBYx6rxiOVut9fldnHveiiKm0zYTK9afT1KRPI2wwSNQZmHC3jGJpJMmtBO9C14hioGGNZJuAq+InwQWPk5KDvGFhLXpvvGE6ZHgJyXb05D4R66Egs8RgJ9eHn0jhuPy5RufVWRgny3u7AnIR9fLcgT+YKOTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEN4Ijli6zWayt4ETUdx5XLvUgVrQT+JpSpIlAOa/TE=;
 b=4hYLC/9fY4rcBX3973ONIi7L+iAL2XA5YqAlZnu9fqIl3LYHEbSv4+tv2hf09+l7BNQYPbJHBAb95dlWn4SCqvnNjU6lmBsbpC5mKiWLw9SMN8OZS9ZXWj0yGo6yI6cvoFxYBRRxKyzf9fhlfe/dUeoIq9t2qX8qBa2iE8trEIY=
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR12MB1258.namprd12.prod.outlook.com (2603:10b6:3:79::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.24; Fri, 23 Jul 2021 19:14:47 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::2d7e:b389:99bc:8e3f]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::2d7e:b389:99bc:8e3f%7]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 19:14:47 +0000
From: "Cornij, Nikola" <Nikola.Cornij@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@kernel.org>
Subject: RE: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
Thread-Topic: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
Thread-Index: AQHXf6NPmI53kfGWWUORkr7a44K4SatQSdAAgAAOhoCAAFW4gIAAQJrQ
Date: Fri, 23 Jul 2021 19:14:47 +0000
Message-ID: <DM5PR12MB467963EB0A4E98B2182C6745EEE59@DM5PR12MB4679.namprd12.prod.outlook.com>
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
 <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
 <YPre51p6TirescUu@phenom.ffwll.local>
In-Reply-To: <YPre51p6TirescUu@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=848c0796-52d1-4b0b-b391-c4111bd644bf;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-23T19:14:32Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de3e5cbf-201a-40f3-1b0c-08d94e0e234b
x-ms-traffictypediagnostic: DM5PR12MB1258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB125827565570776C7D12749BEEE59@DM5PR12MB1258.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QuKs/g7xRLLUg//ZjQQA+Sj4R1C/44a/tVtawHIYWwDBDFYe94dPnk6NVLJXKltr+DXgzlmK3CgS6yloqY6HybFU9r7U1Mfm1SU47t9pFr9XZQqdWVDe2qm+UfYKWXp8sxDXvX6iYEdyrYs4EmLMDwEGVEECTmok5YS7eD1nUsSOPJy0sBciG48JfyRknL60/JFSoKOxcQjCR0SVNwkSs+ugtuarr57z/RrVUiJF5AiQIzosn6L6ZQf/UiN3GIarQop7Zwyo6J9oEAx6xhMI6U34PI95/SNK9gZSSCGvF/nppHabHogodboLgXBAiXfQw5SDeln2UXm5xHKydPJhmD/Ms3IeDiJIn+RqFGJfFMZQbfa8OulTOOXypVjrzxOrKsqy4RMkxeMzCRNrWTknDKI8Zb89rlCfoifNm2br4Z7OyVPZMhbNryJdJzUoaWeUR+GmPZR3OmjmpE0F81fS7/qjieExXFHTtW9LjlzXhp7sRiDSoXl+kn1d2pqpnuSY6KWCKJ/5i4lUrxZ+NekTaMiYpjgvCG7eJAjCCeo9RP9+HOiq1l0G/fZ9Uyfbvpz/tHgPJF2ZKK9SyfmvrdAGnohCt45i3UJBgyeCZHkDo5gQ9vzYoKOnTuJgKkbB0K2HDqg0jDsFiiAu4c6SRYckCKa4upb9yHDyjlA/FezvrVjsiPUlKXmWj8EfXwvO8ykEHlIkBFh2BG+YAVaG18d9acc3lFisdaeI912/Ix0zXcOaJKD7UAw20VCD2PRNQxhVB7qC0UaHSHixlsrG8mVpsVQyHllz1SyQJvGiBRTxYh4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(4326008)(8676002)(66574015)(5660300002)(8936002)(55016002)(33656002)(316002)(76116006)(7416002)(186003)(66446008)(52536014)(64756008)(38100700002)(71200400001)(122000001)(66946007)(66556008)(66476007)(2906002)(83380400001)(478600001)(9686003)(45080400002)(7696005)(53546011)(966005)(26005)(86362001)(110136005)(54906003)(6506007)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vfz00ExWV01K+e/BD7+OfbZ+u+QI7vbqudn+fUE4oUOovkkaxwuD6RjOAy?=
 =?iso-8859-1?Q?mtjGaLvTzQXh+PhnyIHJhyVLlUxf+jLwUIQWpA6uKg5IkZlP8SEis097SR?=
 =?iso-8859-1?Q?XRaf/e0TcdSNA2zYujPuwR+Inzm9XAKmjkWdmSLK1hhECDrww5YTasq9hg?=
 =?iso-8859-1?Q?NLVmkj7P5YZNKbxxHhImzG6RALk54Q6h8W+s6tSP2W11CyE05M+YamkQ8q?=
 =?iso-8859-1?Q?7tUidZ51zlHsoyY0FxLeQ20/9rGyJraJOrkCQVkh48BL9iRxfY2qVefbLv?=
 =?iso-8859-1?Q?+tokcJUVnPnBbJ0lllgSPd/r4mbmapSg3TjX9UgCvjoKuV0uHZq675e46J?=
 =?iso-8859-1?Q?d0MLo0XIBUZcJemr57AMpS+l4J1n5tGm7bnO2kZOR1rjuzdiQVSAuAzirA?=
 =?iso-8859-1?Q?4gZPJ1ZAp3Dj4d5Gw02HaEuMNBgqL9KOKDeqWG1hgxE18bbb0dAkT4SsYk?=
 =?iso-8859-1?Q?WcKa3kdvxVUeatgN1cpCaWqz5eYq/tIc7prbHAyDo2Roug4lqUOgeqioz2?=
 =?iso-8859-1?Q?y8hGxZTRfoNoqOfjyMaS/WuO8gS45zLFyM8KAEsN5BLqg/QBqpXxl29AuN?=
 =?iso-8859-1?Q?Oe+qlhU/6CTyYJiCjAnTAfmzPYV1TrqI5GQyqTX108JZgVxSfghvz0WyHH?=
 =?iso-8859-1?Q?U/W/ZNNB5CJm9hF5I5VnKjk5nEElYwv8dKdkqr+lE37jMeZR4uEPi97rgH?=
 =?iso-8859-1?Q?Am6VdyoQBeS/QKQzfca68KTMfRnqr0r5TYPURRSp3xgveIqdjMz2vTTyqh?=
 =?iso-8859-1?Q?KjLGdRoZ9o2ECbe0tpkSmtX2Cr6w7PPosbOR03yaBf9uyuUQNyejerp2gr?=
 =?iso-8859-1?Q?Dj8myCAbSKEAK5PQG1rjgMMW9twgEVVWSXbI0FmeFqoQ82J7leu3HmsEX9?=
 =?iso-8859-1?Q?9NUZ6oBIe7yKwFGj+xZ/7C50iD3lb3P+GkpnDSQJXu+yb/+NIM304zlJFY?=
 =?iso-8859-1?Q?888NNAYEK688I4C6RH6hk7rFckGwqSyg8gdNuGD7bS9d6GtGbb5bpDXYR4?=
 =?iso-8859-1?Q?LqFuRk75RuFfv11VCpKiJv/PdoMXZGpjh2y+ZXk50I8yYs14ctWptHnbbI?=
 =?iso-8859-1?Q?z/azw+XFVbPNZzyIAQpirq+00bMeqDHhJpGcv+8u2xd0qIjRU04MgVStNB?=
 =?iso-8859-1?Q?RvTTAAzaZk83UZr0HJoRUoU8rN1ttXfvQ6DQMKdIv0pe6+scau5Mg0zEbU?=
 =?iso-8859-1?Q?B+OxuGyhxwABtVBq/qWvddGJkhqMuIu9ySK8tgGYH94Z5DbUypTMgEalGe?=
 =?iso-8859-1?Q?MGlQ0e9uJQf798FtjKZdvkUHQEeMdup9C4Va1a/qNgff9EuPufsP9Yliiu?=
 =?iso-8859-1?Q?0y+gQTuk8dL6qD5RyzzXjU8q0oxoojf2zOp9YsEQCfDWHKpwmivDx5Egxl?=
 =?iso-8859-1?Q?d2Zc38pw6h?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3e5cbf-201a-40f3-1b0c-08d94e0e234b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 19:14:47.6750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYmvCr9SzFo0rYTtMO/lKc/CNU8uoTWVmYTtPHALLzjIHbhemY2Q5TFuGh+f3XEV56b4QI9ofxQFA3CJjo0WNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1258
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

+Harry

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Friday, July 23, 2021 11:23 AM
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>; Ben Skeggs <bskeggs@redhat.com>; David=
 Airlie <airlied@linux.ie>; Lyude Paul <lyude@redhat.com>; Arnd Bergmann <a=
rnd@arndb.de>; Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Cornij, N=
ikola <Nikola.Cornij@amd.com>; dri-devel <dri-devel@lists.freedesktop.org>;=
 Nouveau Dev <nouveau@lists.freedesktop.org>; Linux Kernel Mailing List <li=
nux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with CONFIG_B=
ACKLIGHT=3Dn

On Fri, Jul 23, 2021 at 12:16:31PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 23, 2021 at 11:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jul 23, 2021 at 11:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > When the backlight support is disabled, the driver fails to build:
> > >
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic=
_disable':
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouve=
au_connector' has no member named 'backlight'
> > >  1665 |         struct nouveau_backlight *backlight =3D nv_connector-=
>backlight;
> > >       |                                                           ^~
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use o=
f undefined type 'struct nouveau_backlight'
> > >  1670 |         if (backlight && backlight->uses_dpcd) {
> > >       |                                   ^~
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use o=
f undefined type 'struct nouveau_backlight'
> > >  1671 |                 ret =3D drm_edp_backlight_disable(aux, &backl=
ight->edp_info);
> > >       |                                                              =
  ^~
> > >
> > > The patch that introduced the problem already contains some #ifdef
> > > checks, so just add another one that makes it build again.
> > >
> > > Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD
> > > backlight support for nouveau")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Can we just toss the idea that BACKTLIGHT=3Dn is a reasonable config
> > for drm drivers using backlights, and add depends BACKLIGHT to all
> > of them?
> >
> > I mean this is a perfect source of continued patch streams to keep
> > us all busy, but beyond that I really don't see the point ... I
> > frankly have better things to do, and especially with the big
> > drivers we have making backlight optional saves comparitively nothing.
> > -Daniel
>
> Yes! I'd definitely be in favor of that, I've wasted way too much time
> trying to sort through dependency loops and other problems with backlight=
 support.
>
> Maybe we should leave the drivers/video/fbdev/ drivers untouched in
> this regard, at least for the moment, but for the drivers/gpu/drm
> users of backlight that would be a nice simplification, and even the
> smallest ones are unlikely to be used on systems that are too memory
> constrained to deal with 4KB extra .text.

Yeah I think we can do this entirely ad-hoc, i.e. any time the backlight wh=
eel wobbles off again we nail it down for good for that driver with a depen=
ds on BACKGLIGHT and remove any lingering #ifdef all over.

If you want maybe start out with the biggest drm drivers in a series, I thi=
nk if nouveau/amdgpu/i915 folks ack this you're good to go to just convert =
as things get in the way.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7Cnikola.cornij%40amd.com%7C48104ef3c5724531e8f=
708d94dedcf83%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376265060756274=
95%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DKWVzpQyZsBh4jo522b36pru1zPBxxW2wvXUAj=
J6u3G8%3D&amp;reserved=3D0
