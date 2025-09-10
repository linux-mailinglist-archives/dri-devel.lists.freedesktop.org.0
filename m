Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4EB523A9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 23:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BCB10E910;
	Wed, 10 Sep 2025 21:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="afQSqLgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F004410E910
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 21:45:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AGEo9V017241
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 21:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=w/Demwy4FFKT7wLR0aTkZ0G5aRoHqReEtHzkVf/kk9M=; b=af
 QSqLgi2w1YJVdrThDNuPd9hmdEaSNEqZYJC775XZYXiXqpZ6x+cbC88fQiSzO0pa
 8m3hc2VmCLSWcH2yVTfyCbJXBwVnDvxz9yFGJG0BF+rReKBoZuKTItEPQLH/OkiT
 u5MQLMGkPFPGc0THe4QoNRXFnjf2a/OCgDggVoafUGGhtfpvijOFkBtgPFnicRaR
 p6XaQxKnlptFJaN23Sl8buj06gh2fHCnz2RbBTDH77PqTacdb09wm7Le0knSqhGj
 01VOP7B9Zefv0kxiu9TjHqna4JzMB+ahI51/lB57HxPNW8NHpuEJ4NxM7/9OdX6O
 k6+KtTA7afXD5lvKVq5A==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb0waq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 21:45:06 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-7459d4345e2so50012a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 14:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757540706; x=1758145506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w/Demwy4FFKT7wLR0aTkZ0G5aRoHqReEtHzkVf/kk9M=;
 b=qpmuXDc4TRiYfZAJY92rCgOlTdjEo/+dKv1IKtxQMvY7yqX20xoJfy1rEz641fhmuD
 e6/w7/KMleG3EE867Z29w9WNKlxUe5zpSrRGGA2MYQ47nwkji3c7mrDFTdT7/Jj42ebs
 4hyzelJDa823AvtF0UapCs5RiC0EYQ0PPF9XjjAI/g0oPUkKspSUa0jFV3tGMsHqH6k9
 bfoSUONFmSmWQJ7IaIkOKuP3Z5EMisjCB7AZ5cuJjySO/jTpU2/Ho9otjQk1tEvzpr+J
 7HLBoPjk/SE76TLHr68HYoA0DLWxeoObIPmneJEqLivGM+3NceZ7MEEqaRpIgfgCXytF
 nN3g==
X-Gm-Message-State: AOJu0YzH6xs1HnS3/zokTefJAwwikdgwbPkSnj/83TGQ/IkpwMGfgXfB
 O3sgsRRlQx7q2mqB/9dWJWdqRIdlf/RjSiOoCDakJxB0EXzx/Zyr+sbRpwQKNmgBtvs5rZmiXxr
 xsCLzWULrqJjC9qDZP4Znjs1P7eVKWtA/h+mg9mGwgxVyYcj8jkSSrKCgj2LVyiVEHfAYPqhG0I
 Zp4a2g8+Yw59zudYQeeM3vYpMVPdvjGY13jqM1OJwJ2TEyXA==
X-Gm-Gg: ASbGnctY2HTHuFbm8YZhDyosRRTGGWOyfTwBmCszwOmEq7m0b4MphhtkF/ScTqLRso8
 FR34EUhMzt4lMrZe12ZgZL2sWc2lraJeyywIl2iwbR7s+D4qoLhLFz6aT0m8ZYJjJ0HcZSn2JWn
 V8ijFKFo2P9ZRJbCgZRCt7hrTUOORqKQ6JopYpqU9z0py7O6dvjMTq
X-Received: by 2002:a05:6870:9a1d:b0:321:2521:5a5 with SMTP id
 586e51a60fabf-32262a6d362mr7274772fac.3.1757540705904; 
 Wed, 10 Sep 2025 14:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVJ/g50t9kZW/ZaLe6GVeeuLBnWoaA7n3zqpoh6NbWQOdQF2WIKC87B32dbYHeYbUE2X9ZEP7MoGbxj7Ep8to=
X-Received: by 2002:a05:6870:9a1d:b0:321:2521:5a5 with SMTP id
 586e51a60fabf-32262a6d362mr7274754fac.3.1757540705293; Wed, 10 Sep 2025
 14:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
 <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
 <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
 <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
In-Reply-To: <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:44:54 -0700
X-Gm-Features: Ac12FXwEpZ-r7IA8mOiamsbu_r09tIKNVWf2xHQxyoK9apW3k-0zqtWLdY5g9aw
Message-ID: <CACSVV02=+=PXtW-MrZVBKkFpadbMC_twKyRDPBb+YSJDX7dqTQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated
 headers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfXwANCRtoTupS4
 NT5uckEEFx92nL2SoLTfcYa4IWsa67kLBmvAr1YhlAnAbDHFtoSN2Uk/hu3ncF/EC+Opp2M93CX
 nQLbL/xv8ep0pvDjg9iTVCSkML7ZHxJQ2yh8Rcaw8MiFLO/pqywA50N5ADLEnhT2z9yIlGvuGeD
 SHqkY61VP4CD8XxX6D99588pla7ZAHiVV+kpGDVsQyi9h0OrWZrwnymfPlSsMI94xHD2MjMFsb0
 jMtmaelgWuQG/3uOgZF2/2lFZJYZvQQUsxijApcoehu+6Ns42mwCg3ygTdJDCRDiJ/OdLWDApGK
 oiuomKvVNXLv7So4Sf1zw0FNC5Rnw9zecPyjLGLC3l9JkO7TJt/MnfXPmEQ8NdyQMuDEHkpUzUm
 2BIe3hw6
X-Proofpoint-ORIG-GUID: 6eGrrjh8C5hM2pq047JEgGvDElyk6-cK
X-Proofpoint-GUID: 6eGrrjh8C5hM2pq047JEgGvDElyk6-cK
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c1f162 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=mG2Gs39SVwW7J4BDEKgA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 10, 2025 at 12:38=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 09, 2025 at 10:25:52AM -0700, Rob Clark wrote:
> > On Tue, Sep 9, 2025 at 8:01=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > > > Since these generated files are no longer checked in, either in mes=
a or
> > > > in the linux kernel, simplify things by dropping the verbose genera=
ted
> > > > comment.
> > > >
> > > > These were semi-nerf'd on the kernel side, in the name of build
> > > > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > > > registers: improve reproducibility"), but in a way that was semi-
> > > > kernel specific.  We can just reduce the divergence between kernel
> > > > and mesa by just dropping all of this.
> > > >
> > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +----------------=
----
> > > >  1 file changed, 1 insertion(+), 36 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/=
gpu/drm/msm/registers/gen_header.py
> > > > index a409404627c7..56273a810c1d 100644
> > > > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > > > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > > > @@ -444,9 +444,6 @@ class Parser(object):
> > > >               self.variants =3D set()
> > > >               self.file =3D []
> > > >               self.xml_files =3D []
> > > > -             self.copyright_year =3D None
> > > > -             self.authors =3D []
> > > > -             self.license =3D None
> > > >
> > > >       def error(self, message):
> > > >               parser, filename =3D self.stack[-1]
> > > > @@ -686,10 +683,6 @@ class Parser(object):
> > > >                       self.parse_field(attrs["name"], attrs)
> > > >               elif name =3D=3D "database":
> > > >                       self.do_validate(attrs["xsi:schemaLocation"])
> > > > -             elif name =3D=3D "copyright":
> > > > -                     self.copyright_year =3D attrs["year"]
> > > > -             elif name =3D=3D "author":
> > > > -                     self.authors.append(attrs["name"] + " <" + at=
trs["email"] + "> " + attrs["name"])
> > > >
> > > >       def end_element(self, name):
> > > >               if name =3D=3D "domain":
> > > > @@ -706,8 +699,6 @@ class Parser(object):
> > > >                       self.current_array =3D self.current_array.par=
ent
> > > >               elif name =3D=3D "enum":
> > > >                       self.current_enum =3D None
> > > > -             elif name =3D=3D "license":
> > > > -                     self.license =3D self.cdata
> > > >
> > > >       def character_data(self, data):
> > > >               self.cdata +=3D data
> > > > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> > > >
> > > >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> > > >
> > > > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > > > -
> > > > -This file was generated by the rules-ng-ng gen_header.py tool in t=
his git repository:
> > > > -http://gitlab.freedesktop.org/mesa/mesa/
> > > > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > > > -
> > > > -The rules-ng-ng source files this header was generated from are:
> > > > -""")
> > > > -     maxlen =3D 0
> > > > -     for filepath in p.xml_files:
> > > > -             new_filepath =3D re.sub("^.+drivers","drivers",filepa=
th)
> > > > -             maxlen =3D max(maxlen, len(new_filepath))
> > > > -     for filepath in p.xml_files:
> > > > -             pad =3D " " * (maxlen - len(new_filepath))
> > > > -             filesize =3D str(os.path.getsize(filepath))
> > > > -             filesize =3D " " * (7 - len(filesize)) + filesize
> > > > -             filetime =3D time.ctime(os.path.getmtime(filepath))
> > > > -             print("- " + new_filepath + pad + " (" + filesize + "=
 bytes, from <stripped>)")
> > > > -     if p.copyright_year:
> > > > -             current_year =3D str(datetime.date.today().year)
> > > > -             print()
> > > > -             print("Copyright (C) %s-%s by the following authors:"=
 % (p.copyright_year, current_year))
> > > > -             for author in p.authors:
> > > > -                     print("- " + author)
> > > > -     if p.license:
> > > > -             print(p.license)
> > >
> > > IANAL, but I as the generated files contain C/C++ functions, I think =
we
> > > need to have a corresponding licence in the file.
> >
> > I can't find anything that indicates a difference depending on the
> > contents of the generated file (ie. whether it be
> > functions/tables/prototypes/etc).  And AFAICT it is implicit that the
> > license of the generated file is inherited from the input to the
> > generator.
> >
> > Some other points:
> > - the various *.mod.c files generated for each kernel module do not
> > contain a license
> > - various files generated by asn1_compiler do not contain a license
> > - other generated .c/.h files are a mixed bag, some contain a license
> > header and some do not
> >
> > (In all of the cases the generated files should not be distributed,
> > IMHO.  Yocto should fix this.)
>
> It's a bit funny. Normally you use something like linux-headers-foo,
> which contains just include/*, arch/foo/include/ and some other files.
> Yocto has adopted a way of building the modules against a full-kernel
> source & binaries dirs. As such, those two directories are parts of the
> cache aka 'shared state', which gets shared, etc.

So _all_ generated files get shared?  Is this about building
out-of-tree modules?  (Which even in that case, they shouldn't need
these generated files.)

BR,
-R

> >
> > BR,
> > -R
> >
> > >
> > > > -     print("*/")
> > > > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> > > >
> > > >       print()
> > > >       print("#ifdef __KERNEL__")
> > > > --
> > > > 2.51.0
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
