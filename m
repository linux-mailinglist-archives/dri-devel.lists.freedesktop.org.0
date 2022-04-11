Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4980E4FC481
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 21:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EAF10E241;
	Mon, 11 Apr 2022 19:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020023.outbound.protection.outlook.com [52.101.61.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6CE10E241
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 19:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liyHtXHh4UGMjN5E2xfarnzJwY3x/gAoAAMs/hvMsbIcWWZ101LmGq25r+r8I6mDmf0ZhU1S9kAMVCPF7Hl0pyyowPMuH2Yk26koQCeY9w+MX9yY3owsLR9Rlqd4t6kp3LDbkYETFhsHK/r7rmtUaHkEVTn0Vs6hCQrDUjWXvoyRtsco3O4Q387G37vZ9CZV4YTIL3T3QG2zbrALB9cgldB3J7ai6fdhCosmuDWGiapXMhAsxQXLjstPtf8fJjE5EfVGyCJShUeXBFR1sj0vRQTvPaWDWY5vacLlpWrPeCLVd4rGJvWusiXLFXDJcO4aOIAzVKdxlGELpbj2eNfP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrA1J2BPHMn7SDTpWE8P9ZUQTPeL71nU7WZJ/+AWd1w=;
 b=m0rdDHaxC64W54Metb5J4IDZxONhjGuv7w/VC4M4Y1Kp+/ZNYosl3E8W6D72l2NN7s/Ci/py9iMamhn7FPeWPgfUqALfdm4l14T2P+0E9CCHovM4K/zDPSlUjGhLEIGxnHxLrqQMMF98C93oBTsKd8hs3T7hTwD3cNsXqPEk0SbdvAYVMlQGs51ELd/pe/jAzqPo37ebAHcu4ML6oVFgkM5F1heB5awTlAjp7vBUcDGsLM4RWZamHFH+9m4LL3EGFhcERRj8mn4ZYi8tk7anar8GxLiiv0lMEJRNFXLIuFgoTca4BklL0W+yHySi8mqaicog2QskX8EWt8yRFVTgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrA1J2BPHMn7SDTpWE8P9ZUQTPeL71nU7WZJ/+AWd1w=;
 b=PqYIaTdrRuMLooqYa7n88kid509nWlVNEY9PXsCziHDo6xVSEy928rkLR+A6Zwj+v80/YMpQYmxeudBwOuZ1xeRtDMVhRYsnpOXfRx2oOUlu94keLRz+U7oQ4md3DAHZWhhTI6vg/Wo660KyfNipXgp81gFOGzdGmWriDxtIwKw=
Received: from DM6PR21MB1275.namprd21.prod.outlook.com (2603:10b6:5:16c::29)
 by DM4PR21MB3322.namprd21.prod.outlook.com (2603:10b6:8:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.6; Mon, 11 Apr
 2022 19:02:19 +0000
Received: from DM6PR21MB1275.namprd21.prod.outlook.com
 ([fe80::c61:de9c:1d42:2df9]) by DM6PR21MB1275.namprd21.prod.outlook.com
 ([fe80::c61:de9c:1d42:2df9%7]) with mapi id 15.20.5186.006; Mon, 11 Apr 2022
 19:02:19 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: RE: [PATCH v3] drm/hyperv: Added error message for fb size greater
 than allocated
Thread-Topic: [PATCH v3] drm/hyperv: Added error message for fb size greater
 than allocated
Thread-Index: AQHYTVqUmZIZ7yC1LEK4k8i5OfXuVazqPxYQgAAZWYCAAK65wA==
Date: Mon, 11 Apr 2022 19:02:19 +0000
Message-ID: <DM6PR21MB1275F532C58CF5CE7F67D7E8BFEA9@DM6PR21MB1275.namprd21.prod.outlook.com>
References: <1649650437-17977-1-git-send-email-ssengar@linux.microsoft.com>
 <BYAPR21MB1270B3CFBE674EB0A7537180BFEA9@BYAPR21MB1270.namprd21.prod.outlook.com>
 <20220411075555.GA15355@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20220411075555.GA15355@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=286e7364-8838-43da-9146-36e34e24236f;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-04-11T18:21:16Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfadb73a-2f13-463f-9994-08da1bedcd3e
x-ms-traffictypediagnostic: DM4PR21MB3322:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <DM4PR21MB3322FF0DF3D902E902EB33D9BFEA9@DM4PR21MB3322.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MX6YHyqwydpyJSXriLzdjJGoyMlRK43KlkGqkkOdF2uQNP+j3LFjmdUvXP0emQAjCiStPXtf2M7bdngJV/rY/n4WkwABq/Pe44qUwB2Nq2ekla4VCwXprggOPNHb3b/sKgsK6u6EiWwC25DaTzj6rjAejE7Aj+JRDjymd69d39ve8J8msiCwZ0stgk/c+NciFOCeQQfzDJQVtMzzuBKVS6oIap2/bFKfE43CPn38ebg4n5iNmsI7P12ly/iZrHlc/yulMI6IUCPNO1DDsmaeExn6NPswzZj+lFZrXZOifGDm8frsruQn8XnKG8fXmxMXxsPusfi6xVRi6N8eVZvKkqKGp5A35WR0MQuLzipoBaHXawdgg9agFRxhA+8zOjXzMXdNlrtgNCbLEm3S+Ot0853h8/ywzwkE3IQtPYQ/otZ15m2QnlfBjlgo3oER5cZfipMxy1zo89rtfuz5qZe7CeiDff1wHM5EnQL8f9jqy9cPtK8y4rBa4WM+5rlGrsh7Wx6ymIvqAqtxYpKFgxR5EFa9Y+UcHssw3TXNpRuxbJSXg12bECrpeHxEAsOBL991azAUk++Zl4wAtvJPLqfPS1Yknh524dCwZWB/52R7AfZxKyGLM3sgrDxTaCC87Hxa3QHGYndcXum6Kv4akAsMzbB+6DHYt7Br9Dc4GQ8zxLadFsGj/7o7Zmo0Zos7tdMMFKMDPQwuDam3WiTEoUQQrM3EF70550Fa8H8wv+KwUG2pYagIXxs4R4QE7VjgqcNW9odSGRlCxZYtHoEVdwwldt4HuwxVtkQDkPNLEKV/nXqb0YbXwFMXvWnO8OkNF4psVNIF7jete5LfeCvMr8QXng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1275.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(9686003)(71200400001)(8936002)(316002)(52536014)(33656002)(82960400001)(82950400001)(107886003)(15650500001)(8990500004)(10290500003)(966005)(64756008)(66446008)(2906002)(76116006)(6506007)(122000001)(38070700005)(508600001)(86362001)(38100700002)(55016003)(7696005)(66946007)(66556008)(54906003)(186003)(83380400001)(26005)(66476007)(8676002)(5660300002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hK/c2qYadRM7e05g5fEj0jQ8b+iZwBGcNlqNS5ZPNtucpss2tSM15/OJMse3?=
 =?us-ascii?Q?HGxX7lfbAHf6Ty56z21geJZ3aeavPKaV9QUralCi8NjIjBvhZ0s0Q3ACiPhU?=
 =?us-ascii?Q?5actJVE1ZgSuQIEWZfCDvqfRlRirYBXQ0MUkGhmpf2aMTb21Qp1MYhU23zaa?=
 =?us-ascii?Q?k3dHRWh95D5vT092/7Gdk4v2HO55v9KLm+8zv+Ne6pGlwBP3zUg+SQ5CFrab?=
 =?us-ascii?Q?mAkn3simMOfNZTMxQlWJABsyNZSYyvp9wMzeqO4dbb1UecvaQD7/OeV55H8E?=
 =?us-ascii?Q?IDLyDS1W6lDh/s6nMyqEYtp+ki1+aJDt7Lcf3hk7ROg3uCWvkVuzoEOegiWE?=
 =?us-ascii?Q?VTUDQPYY4FJh56NGNRQ6EsKfxDBD8dsF6rHddUqnclUK+vlkmxM8naCk5rX9?=
 =?us-ascii?Q?+kokh8uhsbjCh4FzaSRDquPQgngJWtbJQyIDU9thwNgec8UvsyTH0mft+Wyc?=
 =?us-ascii?Q?FGKNR+maHWxY3h3mhosXMcT281shuLTBNvSQCaVO7SdSTvEBdRtE6KwNm3P/?=
 =?us-ascii?Q?Y0ssZByFAfKFSgVJNqfKaWvKr8S/C4jJve0Dby7Kh6UscTRjIkBJX+5j3j/H?=
 =?us-ascii?Q?LW0r2F2x4LaOQB/to7ZXeQND9QWnH/gk7a1lSTr3G3of03ooUIHULN35v5X+?=
 =?us-ascii?Q?sFykvJZ+l+zkNZb1g2zztrZffovG1dbzOME2vj+y35fXGs3UoaacGNO46G2r?=
 =?us-ascii?Q?/wjvdrqf0VdHij06UzpkMc00Drhvpv8d0cDTdBLYr6cj1ZKycVPGmwdYcxv1?=
 =?us-ascii?Q?MO30VABRO/MPLajO2YghsVTZ1mKAzv3yfGTxcHzROlfzkhEmKNSKKqoKbxlF?=
 =?us-ascii?Q?8H/hAZJhPhFFOJfUP+qygbNAY7GpKU5mRpU0L55Mp8lTbPf5taY8y5XhU9eM?=
 =?us-ascii?Q?dSXB+oyeG6xJ4k2PBxTL/UaZeV32oGjEfXxsnoCYDqlSsxSmmvsjemuNO1yQ?=
 =?us-ascii?Q?OTQZJA/Wjtb16GtSXT+iTiUQQcDbrIzy05jF74B9jMLPiBvQ2vZ2vVIHiAo/?=
 =?us-ascii?Q?hg2juWrgC4cgBfmONNEVn1qfZJFwHGCQ2IHQTFQuLNwMTmTkSYPZrDnDajKE?=
 =?us-ascii?Q?szhjhY/tGAihYUqcCuQRCdn3gPcobHn9UqSQrGIRbj1xFbErThPEzNwWfEOo?=
 =?us-ascii?Q?a6BuFOWq5eu5sNm+etrl+xKC8r23haSnOSNV9KABfbr5e8BlKk+ZYtyYUjT3?=
 =?us-ascii?Q?2wL7KEHL00N7dLdaYcaqbTzITRZ/wIVADr92YinREXcqx+p40YMLK/NF8KNX?=
 =?us-ascii?Q?Vf/d3/lEP2VHSDU7DDmfW6tu7oMGVkyfrohnMpck11gydIrRP7sYNV4nSA6l?=
 =?us-ascii?Q?UYFgHz5Y6xvzzpXs63eTgcHy+W5ub/PXs/t7NziBR+O5OqpdgqxLvtyP0Uzo?=
 =?us-ascii?Q?9Rx1hynGSmLP+1hwaqunrCnIJq+7w6VANPPRs3pu15qMaAT8dlNvRwM9opqj?=
 =?us-ascii?Q?Fjfe4G/EigahJv/v3e1Ut6dXFd8pu3A3zgopjBNp/VMfJVOZFX+hgJw8u+bX?=
 =?us-ascii?Q?KO3H5aSySEbR4XCKU2N89T1O8V1iNTKsQyn3ChQ0iKVBcZ+i5SbjoIDjJaCP?=
 =?us-ascii?Q?wy6R4I10y/pirMlfReUu5M/kWJrcVb643EDlF1GZgO1Ju9XfLeervCSO7g2Y?=
 =?us-ascii?Q?iOwoVK7gChopv5bo6fWLdqpqwwgUAcRED9UxXQydT1YgZxwpP12Vd9vhAFIZ?=
 =?us-ascii?Q?0Bd6hfAPO8NoOWvrtRShend6gg3d7ajIUtuK65+IBk6QTYw+CVVufZ+8HQKw?=
 =?us-ascii?Q?wDFJ7tETmQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1275.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfadb73a-2f13-463f-9994-08da1bedcd3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 19:02:19.0627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jfeHqmkGwTyfhtpqUMCjPd4sO6gPXp7o5UPQBFWgBoKHWMGOZ7jERp6JgevcWOBWkogsJt7xpoGzocLpcCPc+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR21MB3322
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
> Sent: Monday, April 11, 2022 12:56 AM
> > >...
> > > -	if (fb->pitches[0] * fb->height > hv->fb_size)
> > > +	if (fb->pitches[0] * fb->height > hv->fb_size) {
> > > +		drm_err(&hv->dev, "hv->hdev, fb size requested by process %s
> > > for %d X %d (pitch %d) is greater than allocated size %ld\n",
> > Should we use drm_err_ratelimited() instead of drm_err()?
>=20
> The error is not produced in good cases, for every resolution change whic=
h is
> violating this error should print once.

Thanks for the clarification! Then drm_err() looks good to me.

> I suggest having it print every time some application tries to violate th=
e policy
> set at boot time.
> If we use ratelimit many resolutions error change will be suppressed. Ple=
ase let
> me know your thoughts.
=20
> >
> > The line exceeds 80 chars.
>=20
> At first I tried braking the line to respect 80 character boundary, but
> checkpatch.pl reported it as a problem.
> And these new lines are suggested by checkpatch.pl itself.
> Looks the recent rule realted to 80 charachters are changed. Ref :
> ...

Good to know! Thanks for sharing the link!

FYI, the default max_line_length in scripts/checkpatch.pl is 100 now:
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Dbdc48fa11e46f

"80-chars" is still preferred, but isn't a hard limit. I also noticed
"never break user-visible strings such as printk messages ", so yes you're=
=20
correct. It's perfectly fine to have a not-too-long string that exceeds 80 =
chars.

> > > +		current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size)=
;
> > >  		return -EINVAL;
> > > +	}
> >
> > Maybe we can use the below:
> > 	drm_err_ratelimited(&hv->dev, "%s: requested %dX%d (pitch %d) "
> >                      "exceeds fb_size %ld\n",
> >                      current->comm, fb->width, fb->height,
> >                      fb->pitches[0], hv->fb_size);
> >
> > Note: the first chars of last 3 lines should align with the "&" in the
> > same column. Please run "scripts/checkpatch.pl" against the patch.
>=20
> I have tested checkpatch.pl before sending, for the current patch there i=
s no
> problem from checkpatch.pl

The line is 138-char long, which seems a little longer to me :-)
IMO we can make it shorter, e.g. be removing the part "hv->hdev as the
"drm_err(&hv->dev," already tells us which device it's.

BTW, if we run the script with --strict, it reports the below:

# scripts/checkpatch.pl --strict 0001-drm-hyperv-Added-error-message-for-fb=
-size-greater-t.patch
CHECK: Alignment should match open parenthesis
#28: FILE: drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:127:
+               drm_err(&hv->dev, "hv->hdev, fb size requested by process %=
s for %d X %d (pitch %d) is greater than allocated size %ld\n",
+               current->comm, fb->width, fb->height, fb->pitches[0], hv->f=
b_size);
