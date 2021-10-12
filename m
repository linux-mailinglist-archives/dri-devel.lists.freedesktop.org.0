Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B542AD09
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 21:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D48489BAC;
	Tue, 12 Oct 2021 19:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEC089BAC;
 Tue, 12 Oct 2021 19:11:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227143976"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="227143976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 12:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="441990038"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2021 12:11:32 -0700
Received: from bgsmsx605.gar.corp.intel.com (10.67.234.7) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 12:11:32 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX605.gar.corp.intel.com (10.67.234.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 00:41:29 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Wed, 13 Oct 2021 00:41:29 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>
Subject: RE: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Thread-Topic: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Thread-Index: AQHXo2JKczsaELBrPkmGEyuwyN6iXqvPBXOAgAABXoCAABehgIAAz5Gg
Date: Tue, 12 Oct 2021 19:11:29 +0000
Message-ID: <917a5ffa4e00446a8469cf571458db7b@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <vBmviRgvVBT-q8HSsJLnRc5CfOMr5rFRj6oeIqwh8QJSicQzQxu8_ORxE3OffANSSyF3wUF9_QFRk1uzrggdx_dcI-1WGzmruI4kIFdZQcU=@emersion.fr>
 <20211012150011.6ca63157@eldfell>
In-Reply-To: <20211012150011.6ca63157@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: daniel.vetter@ffwll.ch
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> From: Pekka Paalanen <ppaalanen@gmail.com>
> Sent: Tuesday, October 12, 2021 5:30 PM
> To: Simon Ser <contact@emersion.fr>
> Cc: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org=
; dri-
> devel@lists.freedesktop.org; harry.wentland@amd.com;
> ville.syrjala@linux.intel.com; brian.starkey@arm.com;
> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
>=20
> On Tue, 12 Oct 2021 10:35:37 +0000
> Simon Ser <contact@emersion.fr> wrote:
>=20
> > On Tuesday, October 12th, 2021 at 12:30, Pekka Paalanen
> <ppaalanen@gmail.com> wrote:
> >
> > > is there a practise of landing proposal documents in the kernel? How
> > > does that work, will a kernel tree carry the patch files?
> > > Or should this document be worded like documentation for an accepted
> > > feature, and then the patches either land or don't?
> >
> > Once everyone agrees, the RFC can land. I don't think a kernel tree is
> > necessary. See:
> >
> > https://dri.freedesktop.org/docs/drm/gpu/rfc/index.html
>=20
> Does this mean the RFC doc patch will land, but the code patches will rem=
ain in the
> review cycles waiting for userspace proving vehicles?
> Rather than e.g. committed as files that people would need to apply thems=
elves? Or
> how does one find the code patches corresponding to RFC docs?

As I understand, this section was added to finalize the design and debate o=
n the UAPI,
structures, headers and design etc. Once a general agreement is in place wi=
th all the
stakeholders, we can have ack on design and approach and get it merged. Thi=
s hence
serves as an approved reference for the UAPI, accepted and agreed by commun=
ity at large.

Once the code lands, all the documentation will be added to the right drive=
r sections and
helpers, like it's been done currently.

@daniel.vetter@ffwll.ch Hope this is the right understanding.=20

Thanks & Regards,
Uma Shankar

>=20
> Thanks,
> pq
