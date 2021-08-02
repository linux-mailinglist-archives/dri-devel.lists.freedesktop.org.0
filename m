Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E713DCFD8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 06:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210E76E3E3;
	Mon,  2 Aug 2021 04:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFB46E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 04:48:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="213111273"
X-IronPort-AV: E=Sophos;i="5.84,287,1620716400"; d="scan'208";a="213111273"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2021 21:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,287,1620716400"; d="scan'208";a="500298769"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 01 Aug 2021 21:48:58 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 1 Aug 2021 21:48:57 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 1 Aug 2021 21:48:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Sun, 1 Aug 2021 21:48:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Sun, 1 Aug 2021 21:48:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGpCVFx9FnWf7iKk4dGxGwmL7UKnoygbKnGElBPAheALrhYXeLBHVEl3KLshJ/cdPck2/yfP1qfu/o2QFjKnYv1pGJ7sD2v7pMl4NBnUZOT9EeQeKAYTnba4XsHNX5P20sHe59y/Afqsxk/t5eMfGTniamsSxlpbeEGFbMY9vnsOdNi4+VKynDHij9KqQLZIjkLHUXNOMF9I5vjb/CkO7c2rWnB/MfdigaMa+zH0X5DllbDW5VDilsEotuAmRWMyUObL4seGF0ZXXx6whT74aNO3AE5GFiSIdyQNd9mxRjQQ42hxwbFRppa8vxf8v8nio4FAAUIrDl8f+bk23mKEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mEDxfL4JtQWIVr3kWSe0xCpUo4ne5ZF4kh4UEyx4EY=;
 b=Sxq5G2/et/KvLwhEajtwWGUdxI73Dm69pq1Aqfwz/ox8mRhIK0b/SW0iH46w0r1t3M44oKEXfaopAy2aYFVxQBqaEVy3UoXzRLQXOMy91eRMR55oJqHKfcKqskXZEuOZieqdaa8YrcOdiFVc2atVOoxPhNGsnLTPskVPv4C534jWPgwTEMXfMzvfVxhH8CPusc4yldWfJJZs3Q2eaSWX3BFsEpn60LCSAMGP+gSOLOPCATLn3qvC59DBbMVqjVDwtev2wv7+7oTZ+Q+ZV7/24kWMDWD6HDFmR2I6jwyDC/rSPZ9d6eVJP69YFLv2PhvBCgntf69pGu2/PKVFuvuSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mEDxfL4JtQWIVr3kWSe0xCpUo4ne5ZF4kh4UEyx4EY=;
 b=AveWU3C6fgGPlpK4oY4Azpj/65/x8xo0/f9pvKf6/ILBe6k2D20M3ip7QwGvl4mbbjzNPNqy4oyXUVPbF0jtzos5TL5cfhC39jv08FLJ5I078ZKhUwo8L4+5E084YcEIhj1+4Zvz9KB4AYmW3VmqJR3EfvLzwEBm+WIYoh9cTso=
Received: from BN7PR11MB2786.namprd11.prod.outlook.com (2603:10b6:406:b3::27)
 by BN6PR1101MB2228.namprd11.prod.outlook.com (2603:10b6:405:52::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 04:48:48 +0000
Received: from BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::b1f9:58b:8aca:28fa]) by BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::b1f9:58b:8aca:28fa%4]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 04:48:47 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>, "Simon
 Ser" <contact@emersion.fr>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>, "Kim, Dongwon" <dongwon.kim@intel.com>
Subject: RE: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Topic: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Index: AQHXhFPrvN6WGFDWkk+cq09XeHzRa6tbUdSAgARR7JA=
Date: Mon, 2 Aug 2021 04:48:47 +0000
Message-ID: <BN7PR11MB27860DF98A02862A2364A9B889EF9@BN7PR11MB2786.namprd11.prod.outlook.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
In-Reply-To: <YQPTo0D5SZfX44dn@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 522120d5-e24d-445c-45df-08d95570d0e0
x-ms-traffictypediagnostic: BN6PR1101MB2228:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB2228563DED1537387AC825A289EF9@BN6PR1101MB2228.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ryzLZutcw4tfz1sQK8Poab8rYHDaUFqZ7qzTqzNIjWWFqI4/ZNnT1aU4WNGaPz2/MfmzPIRA2JGEZRgkONwm1g+KmgFCicJAa8XmK9EHkKiXQBcFwO2dt78XMJ9MY2OcJOkkdCOvcE8HuTIFU8af7OihmExRbqbdqwpSXcOV2sSwo7ngaBKtEPojnmruVeIEKcirqs7OStx2WbYVAyXmevzyPmwz+rrOa+sGv5YYIOc9+Nwc3QuoxUX7FMde84YtK5E0q+gxU9zIMfSs7Yo7HDXP3D134QihUCUAugGkaQqZCIQS0bsDcl6BItcC3fGFjcNgi0rDrRZfk5cOUHU8TEo5yCaM2rybJj/E5P++EiOqIEN4OSjlnj0R3vn7o8un2hd+TQT9su1LG47/9mYdjAOM4eoYeUPACao1gQ5IyAVEjQiBNGkfRRIegUHJTIdH0MREOXcLGb4StPgIj7dpE/dZkn8E9bRlU3uqOeUEwPH7Xqas78zLxnOBqBK0jnFmoNf9Tv0+djnVMweK7FY3v/E281bWMxssqsJkJPiTchXf0b9MND8BY3MGZte65siXCQc8FLEA6MYAbpyV3N2dnmyxAF7PGQuxBAgRZPEvfDdkHYrR3zMJZWxpnBTAkTWJ57OuP+Q60feSXUhQ1ZzqcqqqOJ0YztLGk8indMwg9kIc5w1s+4Qu3WFJq/ufHEsEi6DEdjd1+Y2i9H5t7EOE1NAXA/BTGHMBAedSv7bmuoTk3H15dFjHgkJlIm2M5+Q9W199uXuTs4QAQQpQmmF6y/vKJix2lNb/rKZ1RYMX7c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2786.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(107886003)(186003)(2906002)(38100700002)(8936002)(4326008)(8676002)(122000001)(53546011)(6506007)(6636002)(26005)(508600001)(7696005)(5660300002)(66946007)(55016002)(9686003)(66574015)(83380400001)(66556008)(66446008)(76116006)(64756008)(38070700005)(66476007)(52536014)(33656002)(316002)(966005)(110136005)(71200400001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KuH5BVTVFBihz+xfFcWbu0jBpZDY38jFRhzxUeFo6Uy/RMYLOBixQ322wt?=
 =?iso-8859-1?Q?kyqLhV5yj1w09y63fAHCzpvFTNGJChfJPMHDpt1EvsYvNBbI00i7hMfKOG?=
 =?iso-8859-1?Q?n9zAYVfPDLe+5zjR0OZhgh1eRt/7Iu0S5F2HVyBA4CYWtzQc1epRgJb5b3?=
 =?iso-8859-1?Q?Y6oyRzM8XaZneMaHdz1tOui9YGfFZopTKEMbxpOdiH68Q3BieuA0U6/KwJ?=
 =?iso-8859-1?Q?xt7qisiE+Lt5/Emh/R6rlfgDKeoWiZOLNvQTCmwD4u59iEbRATfn0iQVmb?=
 =?iso-8859-1?Q?koywPc7ofbJGV81qFfkANOarRawYnBK0d9NGxNW+mbjq13oVjn/k4kvKmx?=
 =?iso-8859-1?Q?k/HIqLltJnb6Xd3hgJdx/N10KdGzlC6puSIlXYT95rVRX7+qAComUOXw3q?=
 =?iso-8859-1?Q?Cvpacy2NW7ssL7cwKdfIJjtOWMFxJOQ2cX5ZTJugXzfUmoPKYzZ1ERS+M9?=
 =?iso-8859-1?Q?ztTSFxjVmwQqgsDH7liLl0e8XGzThax8sDpeWUHkPIRJOsuVCfw97JT3wN?=
 =?iso-8859-1?Q?ESBbb3Czguz//wUWAoOWxbCDbZj0vUphWvJ8BT9WB+FFr2mDwRKQ6wE52U?=
 =?iso-8859-1?Q?nlgPPzzwW5W/Z2wZOxHOu/13YfHOlVq+I66Rdqfripb9njiJpCUXkjeOUY?=
 =?iso-8859-1?Q?yB39VSZ1bTO94puXYIER0oyk+xmY7RBmJDXnzo2o3rY44FeWO8e8x0yyiW?=
 =?iso-8859-1?Q?/c/MsI3ULshkeTNVIJw/b0D2dE47oDBRK+Egb4xEofDO4KBFsI1EzstBhx?=
 =?iso-8859-1?Q?F1KRb+dSeitrh4LSoVGjplrPmyeXpBSPRQulwO8fk0z71P1dlv03QXv93M?=
 =?iso-8859-1?Q?e8/iL4MVElhBTtdIRwLl1M3cJMR1hlRnq8wnUYLTusIAQRx3u/Q3ANpChM?=
 =?iso-8859-1?Q?HFf7rmAc5WLA9/1wz1g8HklEkKU7Mz+xJIdfDH41F2KbYXxcXUWCJ72rFL?=
 =?iso-8859-1?Q?EY/YanobeUH6P7Zz9mLmyFsctYTDBRqeWevK8k8dGjw4vqWjuxuCj23WJ5?=
 =?iso-8859-1?Q?HLHMEiUoak+sf0pAJCfggfXcvTcxoJDoz9G0N9BStJmhxjNjdYFhwmgjvz?=
 =?iso-8859-1?Q?4Nz54fZImohT6GLBGe5R8aqJ7bSmsP7t0lC9i20LQasbH46dlPuwi4MsBs?=
 =?iso-8859-1?Q?GFKUxQj6yIytsydiQhNoS5BgJ8cu52eeoGdPZ4NkJCjbJjFCM1aqpwWn5s?=
 =?iso-8859-1?Q?QW4zUFhZ4iQv016vG8DFIJGjC7fzyf+sEAoBivNzZM33M93P7Jd8JvVrnU?=
 =?iso-8859-1?Q?6mu56Wv1UVeHuBxfbR9AnY9L9EZSYbcY+UAJ43IXVDk1KfUi8yt49kyNck?=
 =?iso-8859-1?Q?cs4NogXx1YD+rU9/2eCVLQDWjXqrdCRTb0gXafjFyA0n7qKMnzBxidWFxj?=
 =?iso-8859-1?Q?5QK4edOIp1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2786.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522120d5-e24d-445c-45df-08d95570d0e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 04:48:47.6823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S+0rWEOtC4Sx+H/lQoBRwIRrS1sLFR8rJB7b4C39SbLj9ZHqPZnfFr6wq+49f1V82dL8GW31VUkPbC8VNeFWIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2228
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



> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Friday, July 30, 2021 6:26 PM
> To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> Cc: dri-devel@lists.freedesktop.org; Daniel Vetter <daniel@ffwll.ch>; Ger=
d
> Hoffmann <kraxel@redhat.com>; Pekka Paalanen <ppaalanen@gmail.com>;
> Simon Ser <contact@emersion.fr>; Michel D=E4nzer <michel@daenzer.net>;
> Zhang, Tina <tina.zhang@intel.com>; Kim, Dongwon
> <dongwon.kim@intel.com>
> Subject: Re: [RFC v1 0/4] drm: Add support for
> DRM_CAP_DEFERRED_OUT_FENCE capability
>=20
> On Thu, Jul 29, 2021 at 01:16:55AM -0700, Vivek Kasireddy wrote:
> > By separating the OUT_FENCE signalling from pageflip completion allows
> > a Guest compositor to start a new repaint cycle with a new buffer
> > instead of waiting for the old buffer to be free.
> >
> > This work is based on the idea/suggestion from Simon and Pekka.
> >
> > This capability can be a solution for this issue:
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> >
> > Corresponding Weston MR:
> > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
>=20
> Uh I kinda wanted to discuss this a bit more before we jump into typing c=
ode,
> but well I guess not that much work yet.
>=20
> So maybe I'm not understanding the problem, but I think the fundamental
> underlying issue is that with KMS you can have at most 2 buffers in-fligh=
t,
> due to our queue depth limit of 1 pending flip.
>=20
> Unfortunately that means for virtual hw where it takes a few more
> steps/vblanks until the framebuffer actually shows up on screen and is
> scanned out, we suffer deeply. The usual fix for that is to drop the late=
ncy
> and increase throughput, and have more buffers in-flight. Which this patc=
h
> tries to do.
>=20
> Now I think where we go wrong here is that we're trying to hack this up b=
y
> defining different semantics for the out-fence and for the drm-event. Imo
> that's wrong, they're both meant to show eactly the same thing:
> - when is the new frame actually visible to the user (as in, eyeballs in =
a
>   human head, preferrably, not the time when we've handed the buffer off
>   to the virtual hw)
> - when is the previous buffer no longer being used by the scanout hw
>=20
> We do cheat a bit right now in so far that we assume they're both the sam=
e,
> as in, panel-side latency is currently the compositor's problem to figure=
 out.
>=20
> So for virtual hw I think the timestamp and even completion really need t=
o
> happen only when the buffer has been pushed through the entire
> virtualization chain, i.e. ideally we get the timestamp from the kms driv=
er
> from the host side. Currently that's not done, so this is most likely qui=
te
> broken already (virtio relies on the no-vblank auto event sending, which
> definitely doesn't wait for anything, or I'm completely missing something=
).

Agree. One lesson we got from previous direct-display related work is that =
using host hardware event is kind of "must". Otherwise, problems like flick=
ering or tearing or frame drop will come out. Besides, as the wayland-ui is=
 working as a weston client, it needs to have more than 2 buffers to suppor=
t the full-frame redraw. I tried the Weston-simple-dmabuf-egl with 2 buffer=
s and it was bad.

BR,
Tina

>=20
> I think instead of hacking up some ill-defined 1.5 queue depth support, w=
hat
> we should do is support queue depth > 1 properly. So:
>=20
> - Change atomic to support queue depth > 1, this needs to be a per-driver
>   thing due to a bunch of issues in driver code. Essentially drivers must
>   never look at obj->state pointers, and only ever look up state through
>   the passed-in drm_atomic_state * update container.
>=20
> - Aside: virtio should loose all it's empty hooks, there's no point in
>   that.
>=20
> - We fix virtio to send out the completion event at the end of this entir=
e
>   pipeline, i.e. virtio code needs to take care of sending out the
>   crtc_state->event correctly.
>=20
> - We probably also want some kind of (maybe per-crtc) recommended queue
>   depth property so compositors know how many buffers to keep in flight.
>   Not sure about that.
>=20
> It's a bit more work, but also a lot less hacking around infrastructure i=
n
> dubious ways.
>=20
> Thoughts?
>=20
> Cheers, Daniel
>=20
> >
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Michel D=E4nzer <michel@daenzer.net>
> > Cc: Tina Zhang <tina.zhang@intel.com>
> > Cc: Dongwon Kim <dongwon.kim@intel.com>
> >
> > Vivek Kasireddy (4):
> >   drm: Add a capability flag to support deferred out_fence signalling
> >   virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
> >   drm/virtio: Add VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE cmd
> >   drm/virtio: Probe and implement VIRTIO_GPU_F_OUT_FENCE feature
> >
> >  drivers/gpu/drm/drm_file.c               | 11 +++---
> >  drivers/gpu/drm/drm_ioctl.c              |  3 ++
> >  drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++++
> >  drivers/gpu/drm/virtio/virtgpu_fence.c   |  9 +++++
> >  drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 ++++--
> >  drivers/gpu/drm/virtio/virtgpu_plane.c   | 44 +++++++++++++++++++++++-
> >  drivers/gpu/drm/virtio/virtgpu_vq.c      | 17 +++++++++
> >  include/drm/drm_mode_config.h            |  9 +++++
> >  include/uapi/drm/drm.h                   |  1 +
> >  include/uapi/linux/virtio_gpu.h          | 12 +++++++
> >  12 files changed, 117 insertions(+), 7 deletions(-)
> >
> > --
> > 2.30.2
> >
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
